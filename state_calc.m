function [ X ] = state_calc( x0 , alpha , t , t0)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

global A1;
global A2;

global B1;
global B2;

global A;
global B;

    if(alpha == 1)
        A = A1;
        B = B1;
    elseif (alpha == 2)
        A = A2;
        B = B2;
    end
    if (t0 == t)
         Xintegral = expm(A*(t-t0))*( B*[1] +  x0);
    else
        [t, Xintegral] = ode45(@integral_calc, [t0 t], x0);
        Xintegral = [Xintegral(1, end) Xintegral(2, end)]';
    end
    
    X = Xintegral;

end

