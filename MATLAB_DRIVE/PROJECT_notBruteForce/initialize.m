function initialize()
    global walls winZone boundaryWidth boundaryHeight wallsData o_x o_y;

    for i = 1:12
        walls(i) = Wall( ...
            boundaryWidth * wallsData(i,1)/100, ...
            boundaryHeight * wallsData(i,2)/100, ...
            boundaryWidth * wallsData(i,3)/100, ...
            boundaryHeight * wallsData(i,4)/100 ...
            );
    end
    
    winZone = Wall( ...
        boundaryWidth * wallsData(8,1)/100, ...
        boundaryHeight * wallsData(8,2)/100, ...
        boundaryWidth * wallsData(9,1)/100, ...
        boundaryHeight * wallsData(9,2)/100 ...
        );

    o_x = (winZone.p1_x + winZone.p2_x)/2;
    o_y = (winZone.p1_y + winZone.p2_y)/2;
    
end    
     