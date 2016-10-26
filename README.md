# omero-matlab-scripts

1) Download omero-matlab toolbox from the following link,
http://downloads.openmicroscopy.org/omero/5.2.6/

2) Download the example scripts from this repository, and move them into the omero-matlab toolbox folder.

3) open MATLAB

Type the following commands in the Matlab "Command Window":
4) >>cd("PATH/TO/OMERO-MATLAB-TOOLBOX/") %change directory to the matlab toolbox folder (Hit Return)
5) >>addpath(genpath(pwd)) %adds the toolbox and the subfolders to the matlab path

6) Edit Credentials:
Edit the "ice.config" file within the omero-matlab toolbox to update the following parameters,
omero.host= HOST
omero.port= PORT
omero.username= USERNAME
omero.password= PASSWORD

Edit the individual scripts:
7)  >>edit omero_matlab_segmentation.m %(Hit Return)
    - Edit line 10 : imageId = 514; TO imageId = IMAGEID OF CHOICE;%edit imageId and Save script
    - run script : >>omero_matlab_segmentation %(Hit Return) 
  
8)  >>edit omero_matlab_dataExtraction.m %(Hit Return)
    - Edit line 10 : imageId = 515; TO imageId = IMAGEID OF CHOICE; %edit imageId and Save script
    - run script : >>omero_matlab_dataExtraction %(Hit Return) 
  
9)  >>edit omero_matlab_plotting.m %(Hit Return)
    - Edit line 10 : imageId = 513; TO imageId = IMAGEID OF CHOICE; %edit imageId and Save script
    - Edit line 11 : fileannId = 23; TO fileannId = FILEANNOTATIONID OF CHOICE;%edit fileannId and Save script
    - run script : >>omero_matlab_plotting %(Hit Return)
  
