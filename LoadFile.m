function [X, Y, Easting, Northing, Elevation, dElev_dx, dElev_dy, nulls_count] = LoadFile(file_name)

fid=fopen(file_name);
            firstline    = fgetl(fid);
            ncols        = str2double(firstline(7:length(firstline)));
            secondline   = fgetl(fid);
            nrows        = str2double(secondline(7:length(secondline)));
            thirddline   = fgetl(fid);
            xllcorner    = str2double(thirddline(11:length(thirddline)));
            fourthline   = fgetl(fid);
            yllcorner    = str2double(fourthline(11:length(fourthline)));
            fifthline    = fgetl(fid);
            cellsize     = str2double(fifthline(10:length(fifthline)));
            sixthline    = fgetl(fid);
            NODATA_value = str2double(sixthline(14:length(sixthline)));
            Elevation    = fscanf(fid, '%g', [ncols nrows]);
            size(Elevation);
fclose(fid);
            nulls_count = length(find(Elevation==NODATA_value)); %count nulls
            Elevation(find(Elevation==NODATA_value)) = NaN;
            Easting    = xllcorner:cellsize:(xllcorner+(ncols-1)*cellsize);
            Northing   = yllcorner:cellsize:(yllcorner+(nrows-1)*cellsize);
            Elevation  = flipud(Elevation');
            
[X, Y]=meshgrid(Easting,Northing);   

        dx = abs(Easting(2) -Easting(1));  % get cell spacing in x and y direction
        dy = abs(Northing(2)-Northing(1));  % from coordinate vectors
            
        [dElev_dx, dElev_dy]   = gradient(Elevation,dx,dy);

