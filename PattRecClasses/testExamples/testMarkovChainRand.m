%DEBUG TEST OK -Markov chain with 2 states(infinite), 3 (finite) 
%P[S=1] = [1;0]
%Test 1 Trans = [0.5,0.5 ; 0.5,0.5] (infinite), T=5
%Test 2 Trans = [0.5,0.5,0 ; 0,0.5,0.5] (finite), T=5
%Date : 04/11 Antoine Camus

clear all; close all; clc;
%% Test 1

mc1 = MarkovChain([1 0],[0.5 0.5 ;0.5 0.5]);
S1 = rand(mc1,5);

%% Test 2

mc2 = MarkovChain([1 0],[0.5 0.5 0 ; 0 0.5 0.5]);
S2 = rand(mc2,5);