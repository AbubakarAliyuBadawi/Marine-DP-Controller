%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% init()                                                                  %
%                                                                         %              
% Set initial parameters for part1.slx and part2.slx                      %
%                                                                         %
% Created:      2018.07.12	Jon Bj�rn�                                    %
%                                                                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;
load('supply.mat');
load('supplyABC.mat');
load('thrusters_sup.mat')

% Initial position x, y, z, phi, theta, psi
eta0 = [0,0,0,0,0,0]';
% Initial velocity u, v, w, p, q, r
nu0 = [0,0,0,0,0,0]';
%%
n=9;
%% Current velocity
nu_c = 0.2;
psi_c = n*10*pi/180; % east
mu_current = 0.0001; 
mu_current_dir = 0.001;
%% Wind
load('wind_coeff.mat');
mu_dir = 0;
U_10 = 12;  
kappa = 0.003;
mu_speed = 0.001; 
h = 1;  
time_steps = 1000;  
z = 3;  
Umean_angle = n*10; %north
z0 = 10 * exp(-2 /( 5 * sqrt(kappa)));
U_mean = U_10 * (5 / 2 )* sqrt(kappa) * log(z / z0); 
U_w=1;

%% Tunning PID
Kp = -[-44440.8471205421; -174748.115243117; -56099945.0910478];
Ki = -[-540.64009360768; -3153.2361136748; -1036593.12054623];
Kd = -[-885551.128894883; -1413618.40984523; -582749740.806195];
%% Tuning parameters reference model
Af = [0.1,0.1,0.01]; % Filter gain
zeta = 1; % Damping ratio
omega=[2*zeta*2*pi/10,2*zeta*2*pi/10,2*zeta*2*pi/10];
Gamma=[omega(1)^2,omega(2)^2,omega(3)^2];

%% Thruster Allocatin
% Define the thruster positions (x, y)
x1 = 39.3; y1 = 0;
x2 = 35.6; y2 = 0;
x3 = 31.3; y3 = 0;
x4 = -28.5; y4 = 5;
x5 = -28.5; y5 = -5;

% alpha1 = deg2rad(90);  
% alpha2 = deg2rad(30);  
% alpha3 = deg2rad(90); 
% alpha4 = deg2rad(45);  
% alpha5 = deg2rad(-45);  
% 
% % Construct the B matrix
% B = [0, cos(alpha2),0, cos(alpha4), cos(alpha5);
%     1, sin(alpha2), 1, sin(alpha4),sin(alpha5);
%     x1, sin(alpha2)*x2, x3, x4*sin(alpha4)-y4*cos(alpha4), x5*sin(alpha5)-y5*cos(alpha5)]
% we convert then to sin and cos component in matrix 
B=[0,1,0,0,1,0,1,0;
   1,0,1,1,0,1,0,1;
   thrusters(1).xposition,0,thrusters(2).xposition,thrusters(3).xposition,-thrusters(4).yposition,thrusters(4).xposition,-thrusters(5).yposition,thrusters(5).xposition
];

%%
simulation=4;

desired_DP_force = [1 1 0 0 0 1]*10^4;
%% Kinematic matrices
% M matrix
M = [7.0101e6, 0, 0;
     0, 8.5190e6, 4.7187e5;
     0, 4.7187e5, 3.7973e9];
Minv = inv(M);
% D matrix
D = [2.6486e5, 0, 0;
     0, 8.8164e5, 0;
     0, 0, 3.3774e8];
%% NLP Observer
T = diag(10e3*[1 1 1]);
Lambda = diag(0.08*[1 1 1]);
Cw = [zeros(3) eye(3)];
Aw = [zeros(3,3), eye(3); diag(-0.3948*[1 1 1]), diag(-0.0126*[1 1 1])];
K1 = [diag(-3.762*[1 1 1]); diag(1.2441*[1 1 1])];
K2 = diag(1.1938*[1 1 1]);
K3 = diag([3.57e5 3.57e5 3.57e7]);
K4 = 10*K3; 

%% PID Parameters
% Mass = diag([vesselABC.MRB(1,1), vesselABC.MRB(2,2), vesselABC.MRB(6,6)]); % vesselABC.MRB(1:3,1:3)
% Damping = diag([2.6486e5, 8.8164e5, 3.3774e8]);
% T_n = 70; % Period of interest -- can tune
% omega_n_dp = 2 * pi / T_n;
% xi = 0.7; % --- can tune
% rise_time = 10; % --- can tune

%% PID values
% Kp = Mass .* omega_n_dp.^2;
% Ki = omega_n_dp / 10 .* Kp;
% Kd = (2 * xi * omega_n_dp .* Mass) - Damping;


