%%main function for Grassmann sequences

clc
clear
close all
addpath(genpath('GrassmannCodes'));
load UMD_Actions_data.mat 
%data = data_split;
load avg_shape.mat  
c = C;%%common point onto which all the TSRVFs are transported
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Load trajectories
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

p1 = data(7211:2:7290);
p2 = data(3211:2:3290);
%viz_trajectory(p1,p2);%pause()
N = size(p1,1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Obtain TSRVFs for each sequence and transport it to 'c'
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

h1 = path_to_h_Grassmann(p1,c);
h2 = path_to_h_Grassmann(p2,c);
Epre = calc_dist_tangent(h1,h2)

H1 = cell2mat(cellfun(@(x) x(:),h1,'UniformOutput', false));
H2 = cell2mat(cellfun(@(x) x(:),h2,'UniformOutput', false));
gam = DynamicProgrammingQ(H1,H2,0,0);
Reg_p2 = warp_with_gamma(p2,gam);
Reg_p2 = Reg_p2';

viz_trajectory(p1,Reg_p2);
Reg_h2 = path_to_h_Grassmann(Reg_p2,c);
Epost = calc_dist_tangent(h1,Reg_h2)
%plot(gam)
hold on