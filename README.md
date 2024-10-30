# MATLAB-postprocess-DEMS
This collection of MATLAB-based tools provides some useful analysis of the slope distributions of digital elevation models.
First, it has its own functions to read and load .asc files and then produce hillshades of them.
Second it computes the slopes at the DEM resolution and then produces a regular and log10 histogram of them. I usethe slope distribution (and its log10 to capture the fewer but important high-slope pixels) as an indicator for process, especially for volcano cinder cone flanks. 

These tools were used for a small contribution to this paper:
Riggs, N.R., Ort, M.H., Anderson, K.C., Licciardi, J., Arrowsmith, J R., Wall, K.T., Broadman, E., Van Gundy, D., Alfano, F., Lapo, K., Clarke, A.B., Seligman, A., Weikart, J., Sotelo, C., Kurz, M., Witter Shelleman, M., Houts, A., de' Michieli Vitturi, M., Del Vecchio, J., Zibart, S., Casares, H., Gleeman, E., Distributed Mafic Volcanism in the San Francisco Volcanic Field, Arizona, USA: Syn- and Post-Eruptive Processes Through a Lens of Diverse Field and Analytical Methods, USGS Professional Paper on Distributed Volcanic Centers, in review, 2024.
