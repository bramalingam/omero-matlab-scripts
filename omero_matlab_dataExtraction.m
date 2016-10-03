%init
clear all;close all;

%create omero session
omero_client = loadOmero;
session = omero_client.createSession();
omero_client.enableKeepAlive(60);

%params
imageId = 513;

%getImage/plane from OMERO server
images = getImages(session, imageId);
plane = double(getPlane(session, images, 0,0,0));

%Fetch OMERO ROI's associated with the Image
service = session.getRoiService();
roiResult = service.findByImage(imageId, []);
rois = roiResult.rois;
n = rois.size;

resultvec=[];
maskImage = zeros(size(plane));
%Loop through every ROI and shape
for thisROI  = 1:n
    roi = rois.get(thisROI-1);
    numShapes = roi.sizeOfShapes;
    for ns = 1:numShapes
        shape = roi.getShape(ns-1);
        coords = sscanf(char(shape.getPoints.getValue()),'%d,%d');
        coordsvec = reshape(coords,2,length(coords)/2)';
        convertedvec = (coordsvec(:,1)-1)*size(plane,1) + coordsvec(:,2);%2d to 1d conversion for indices
        
        %Calculations on a perROI basis
        resultvec = [resultvec ; thisROI ns mean(plane(convertedvec)) std(plane(convertedvec)) cov(plane(convertedvec)) var(plane(convertedvec)) median(plane(convertedvec)) max(plane(convertedvec)) min(plane(convertedvec)) length(convertedvec)]; %#ok<*AGROW>
        maskImage(convertedvec) = 1;
        disp([thisROI ns])
    end
end
%write the table of results to a csv file
xlswrite('test.csv',resultvec)

%attach file as an attachment to OMERO Image
fileAnnotation = writeFileAnnotation(session, 'test.csv');
link2 = linkAnnotation(session, fileAnnotation, 'image', imageId);

%Close Session
omero_client.closeSession();