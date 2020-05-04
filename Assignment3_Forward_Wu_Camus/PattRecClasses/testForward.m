% testForward.m
% Date : 2020-05-04

clear all; close all;clc;
%% Initialization

q = [1 0]; %Initial State Probas
A = [[0.9 0.1 0];[0 0.9 0.1]]; % Transition state probas
mc = MarkovChain(q,A);
x_obs = [-0.2, 2.6, 1.3];  %observed features

%% Calculate the probabilities of the sequence

