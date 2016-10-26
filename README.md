# omero-matlab-scripts

 - Download `omero-matlab toolbox <http://downloads.openmicroscopy.org/omero/5.2.6/>`

 - Download the example scripts from this repository, and move them into the omero-matlab toolbox folder.

 - open MATLAB
    Type the following commands in the Matlab "Command Window":

    ```
    >> cd("PATH/TO/OMERO-MATLAB-TOOLBOX/") %change directory to the matlab toolbox folder (Hit Return)
    >> addpath(genpath(pwd)) %adds the toolbox and the subfolders to the matlab path
    ```

 - Edit Credentials:
    Edit the "ice.config" file within the omero-matlab toolbox to update the following parameters,
    
    ```
    omero.host= HOSTNAME
    omero.port= PORT ID
    omero.username= USERNAME
    omero.password= PASSWORD
    ```

Edit the individual scripts:
============================

 -  ```>>edit omero_matlab_segmentation.m %(Hit Return)```
    - Edit line 10 : imageId = 514; TO imageId = IMAGEID OF CHOICE;%edit imageId and Save script
    - run script : ```>>omero_matlab_segmentation %(Hit Return)```
  
 -  ```>>edit omero_matlab_dataExtraction.m %(Hit Return)```
    - Edit line 10 : imageId = 515; TO imageId = IMAGEID OF CHOICE; %edit imageId and Save script
    - run script : ```>>omero_matlab_dataExtraction %(Hit Return)```
  
 -  ```>>edit omero_matlab_plotting.m %(Hit Return)```
    - Edit line 10 : imageId = 513; TO imageId = IMAGEID OF CHOICE; %edit imageId and Save script
    - Edit line 11 : fileannId = 23; TO fileannId = FILEANNOTATIONID OF CHOICE;%edit fileannId and Save script
    - run script : ```>>omero_matlab_plotting %(Hit Return)```
  
