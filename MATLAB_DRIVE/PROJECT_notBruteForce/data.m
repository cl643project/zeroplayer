global wallsData ballData boundaryWidth boundaryHeight o_x o_y lambda walls ball gamma beta;

wallsData = [
    28/3, 23, 28/3, 68;
    28/3, 71, 24, 86;
    22, 53, 44, 35;
    44/3, 8, 256/3, 8;
    100/3, 88, 148/3, 76;
    148/3, 64, 196/3, 80;
    72, 26, 72, 60;
    84, 74, 87.5, 99;
    99, 74, 95.5, 99;
    268/3, 64, 296/3, 64;
    296/3, 32, 296/3, 64;
    87.5, 99, 95.5, 99;
];

walls = Wall.empty(length(wallsData),0);

ballData = [8, 17];

ball = Protagonist( ...
    boundaryWidth * ballData(1)/100, ...
    boundaryHeight * ballData(2)/100, ...
    0, ...
    0 ...
    );

boundaryWidth = 760;
boundaryHeight = 1520/3;
o_x = 0;
o_y = 0;
lambda = 10;
gamma = 4;
beta = 1;