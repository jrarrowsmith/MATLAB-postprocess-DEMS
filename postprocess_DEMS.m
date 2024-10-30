%script to process DEMs
%JRA July 10, 2013
close all
clear all

max_slope = 60;

CurrentAzimuth=0; %map orientation for sun direction
CurrentZenith=45; %illumination vertical angle
CurrentZ_fact=1; %vertical exaggeration

[X, Y, Easting, Northing, Elevation, dElev_dx, dElev_dy, nulls_count] = LoadFile('output_USGS1m.asc'); %change this file name as necessary. DEM needs to be exported from ArcGIS as a Arc ASCII file

x=X(:,1);
y=Y(:,1);
delta_y=y(2)-y(1);
delta_x=delta_y;

Hillshds=hillshademe(CurrentAzimuth, CurrentZenith, CurrentZ_fact, dElev_dy, dElev_dx);

figure(1)
clf
plothillshade(Easting, Northing, Hillshds) 

figure(2)
clf
surfl(Easting, Northing, Elevation) 
shading interp
colormap bone

figure(3)
clf
[h_x,h_y] = gradient(Elevation,delta_x,delta_y); 
grad_h = sqrt( h_x.^2 + h_y.^2 );
slope = atan(grad_h).*180/pi;
slope = reshape(slope,1,[]);
slope_bars = 0:1:max_slope;
h=histogram(slope,slope_bars);
axis([0 max_slope 0 inf])
xlabel('slope (degrees)')
ylabel('frequency')

dembincounts=h.BinCounts;

figure(4)
clf
plot(slope_bars, [0 dembincounts], 'k-')
xlabel('slope (degrees)')
ylabel('frequency')

figure(5)
clf
plot(slope_bars, [0 log10(dembincounts)], 'k-')
xlabel('slope (degrees)')
ylabel('log10 frequency')




