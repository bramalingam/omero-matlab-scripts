%init
clear all; close all;

%create omero session
omero_client = loadOmero;
session = omero_client.createSession();
omero_client.enableKeepAlive(60);

%params
imageId = 514;

%getImage/plane from OMERO server
images = getImages(session, imageId);
plane = getPlane(session, images, 0,0,0);

%percentile based segmentation
thresh = prctile(plane(:),90); %assumption top 10% of the pixels are foreground pixels
maskImage = bwlabel(plane>thresh);

%create ROIs
for i=1:max(maskImage(:))
    [y,x] = find(maskImage==i);
    if (length(x)>1 && length(y)>1)
        OMEROpolygon = createPolygon(x, y);
        OMEROpolygon = setShapeCoordinates(OMEROpolygon, 0,0,0);
        
        OMEROpolygon.setFillColor(rint(hex2dec('7D0000FF'))); % 'aRGB' - 50% blue
        OMEROpolygon.setStrokeColor(rint(hex2dec('7DFF0000'))); % 'aRGB' - 50% red
        
        if i==1
            roi = omero.model.RoiI;
        end
        roi.addShape(OMEROpolygon);
        disp(i)
    end
end

%and link it to OMERO Image
roi.setImage(omero.model.ImageI(imageId, false)); %One ROI with multiple shapes!
iUpdate = session.getUpdateService();
roi = iUpdate.saveAndReturnObject(roi);

%Close Session
omero_client.closeSession();