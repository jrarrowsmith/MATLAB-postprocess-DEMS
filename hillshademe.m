function Hillshds=hillshademe(CurrentAzimuth, CurrentZenith, CurrentZ_fact, dElev_dy, dElev_dx)
      %Azimuth is 0 towards south and increases counterclockwise so 135 is
      %NE and 225 is NW

            CurrentAzimuth = 360.0-CurrentAzimuth+90; %convert to mathematic unit 
            CurrentAzimuth(CurrentAzimuth>=360)=CurrentAzimuth-360;
            CurrentAzimuth = CurrentAzimuth * (pi/180); %  convert to radians

            %lighting altitude
            CurrentZenith = (90-CurrentZenith) * (pi/180); % convert to zenith angle in radians
            
            
            [asp,grad] = cart2pol(dElev_dy,dElev_dx); % convert to carthesian coordinates
            grad       = atan(CurrentZ_fact*grad); %steepest slope
            % convert asp
            asp(asp<pi)=asp(asp<pi)+(pi/2);
            asp(asp<0)=asp(asp<0)+(2*pi);


            Hillshds =  255.0*( (cos(CurrentZenith).*cos(grad) ) + ( sin(CurrentZenith).*sin(grad).*cos(CurrentAzimuth-asp)) ); % ESRIs algorithm
            Hillshds(Hillshds<0)=0; % set hillshade values to min of 0.
