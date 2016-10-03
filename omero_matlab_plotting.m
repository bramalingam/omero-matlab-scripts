%init
clear all;close all;

%create omero session
omero_client = loadOmero;
session = omero_client.createSession();
omero_client.enableKeepAlive(60);

%params
imageId = 513;
fileannId = 23;

%Download File Annotation
getFileAnnotationContent(session, fileannId, 'downloadedResultFile.csv');

%Read downloaded file and plot using matlab
M = csvread('downloadedResultFile.csv');
plot(M(:,3),M(:,4),'o');
xlabel('Mean')
ylabel('Std-Deviation')
title('Example Plot')

%Save plot as an Image
saveas(gca, 'example-plot.jpg')

%Attach plot to OMERO Image
fileAnnotation = writeFileAnnotation(session, 'example-plot.jpg');
link2 = linkAnnotation(session, fileAnnotation, 'image', imageId);

%Close Session
omero_client.closeSession();
