# Vizualize-3D-Images
Simple tool to visualize 3D image volumes (like tomography images and post-processed images) in MATLAB for viewing and probing.

User will need to download both the '.m' and '.fig' files, and place them both in Documents>MATLAB to use this tool from any path when running MATLAB. Alternatively, the user can place the files in their current directory for use.

This program requires the input to be two 3D matrices (eg. stacked tomograms and stacked post-processed tomograms) and outputs a figure with slider bars and viewing options to view slices in the 3D image volumes. The two input matrices can be identical.

To run this tool, simply use:

  VizLayer(Matrix1, Matrix2)

and a figure will automatically be displayed.

Confirmed - runs on MATLAB 2017 and 2018, all buttons and tools of VizLayer may not run successfully on earlier versions of Matlab.
