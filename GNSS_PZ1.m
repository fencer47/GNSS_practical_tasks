%% ПЗ1 Преобразование из геодезической СК в инерциальную СК
% 1) Входные параметры 
fi = 89 + (179*25)/28;           % широта,  [градус]
liambda = 0 + (359*25)/28;       % долгота, [градус]
H = 0 + (2000*25)/28;            % высота,  [метры] 
t = 0 + (24*25)/28;              % время поворота земли, [сек]
liambda0 = 0 + (359*25)/28;      % угол     [градус]
U = 15;                          % скорость поворота земли  [градус/час]
R_world = 6371*10^3;             % радиус земли,  [метры]

% 2) Преобразование из Геодезических координат в Геоцентрические
fi = deg2rad(fi);
liambda = deg2rad(liambda);
U = deg2rad(U);

X_gsk = (H+R_world) * cos(fi)*cos(liambda);
Y_gsk = (H+R_world) * cos(fi)*sin(liambda);
Z_gsk = (H+R_world) * sin(fi);
R_transp = [X_gsk; Y_gsk;  Z_gsk];
% 3) Преобразование из геоцентрической системы координат в инерциальную

Liambda_big = liambda0 + t*U;
R_gsk2gcska = [cos(Liambda_big) sin(Liambda_big) 0;
               -sin(Liambda_big) cos(Liambda_big) 0;                            
                   0 0 1 ];
% 4) Выходная матрица 
R_gcsk = R_gsk2gcska*R_transp;

