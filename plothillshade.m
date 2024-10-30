function plothillshade(Easting, Northing, Hillshds)     

plot(Easting(1,1),Northing(1,1), 'b.');
hold on
imagesc(Easting,Northing,Hillshds);
colormap('bone'); 
%colormap('summer'); 
axis equal;