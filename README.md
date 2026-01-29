# fMRI_telecommunications

This part of the repository represents the source codes of the SREP publication regarding the Telecommunication model of healthy and diseased brains.
The codes have been written by Peppino Fazio. The Jupyter Notebook by Maria Mannone shows how to extract time series from fMRI data.
The organisation of Fazio's contribution is presented as follows.

------

Content is organised in two parts:

1) .m files (scripts)
These files represent the core scripts for the main results of the article.

2) .mat files (workspaces)
These files represent the support data needed or created during the code execution (they are intended neither to be modified nor to be executed). The complete set of .mat files can be reached here:

https://drive.google.com/file/d/10h83dNizC5x615r3nv5d3vNfu5NEgUIe/view?usp=sharing

Please, download the archive and unzip it into the folder where the core scripts are placed.

____________________

Part 1) Core scripts
The folder contains:

- Acsvimport.m: This script reads the content of the converted numerical NiFti-DiCOM files and stores it in the workspace dataALL2.mat. The folder containing the used dataset is ./newdataset/newdata/ and the NiFti files are organised in sub-folders, as described in subsection 4.1

- BallFinal.m: This script loads the workspace saved with the previous script (dataALL2.mat), removes outliers, augments data and, in particular, represents the following trends
 1) The brain activity data for patient i;
 2) The brain activity for Limbic RoIs of patient.
The desired patient class (according to Fig. 17 of the paper) is selected by three boolean variables:
-- over equal to 1 for over 70, equal to 0 for under 70
-- good equal to 1 for good, equal to 0 for bad
-- male equal to 1 for male, equal to 0 for female
In addition, it discrtises data through the accessory function script buildMatrix.m, taking into account the chosen model parameters (4 states and W=20); after this, it plots the MTPM matrix elements and saves the data workspaces in function of the selected patient.

- Cpatients.m: this script can be considered as accessory, because it shows the desired MTPM elements for the considered patients. This script is not mandatory for the overall model pipeline.

- Dnetwork.m: This script evaluates the state sequences for each RoI (from 1 to 48), stores the values of each RoI (and each state) in the ./network_XXXXX folder and, if the variable plo is True, plots the trend of values and quantized ones over the time. All data is saved in the 'AfterPlot.mat' workspace file. The suffix of the ./network_XXXXX folder depends on the selected sub-dataset. Class selection follows the same rule of script BallFinal.m.

- Emutual.m: This script evaluates the Mutual Information related to the previous data, as well as the packets exchanged through Intra and Inter RoIs connections. The starting point is the afterPlot.mat workspace. Through the two boolean variables plot_graph and plot_heat it is possible to observe the dynamics of the edge intensity represented either as a graph structure or as a heating map.

- FbisXXXandYYY.m and FdynamicXX.m: both scripts are added to the repository for illustrating the values for the considered class of patients and the trend of some specific RoIs.

- Globes.m: the script shows the heating maps of the activities related to RoIs 2, 8, 9, 10, 11, 12, 13, 14, 15, 16, 37, 38, 39, 44, 45, 46. The primary aim of the script is to show the difference of the observed activity between healthy and diseased brains, as depicted in Fig. 30.


 
