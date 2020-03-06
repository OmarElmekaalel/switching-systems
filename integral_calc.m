function [ X ] = integral_calc(  t, x0 )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
    
global A;
global B;

    X = A*x0 + B*[1];
    disp(A)
    disp(B)

end

