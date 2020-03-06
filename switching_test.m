clear all
close all
clc

global A1;
    A1 = [-1 -1; 1 -1];
global A2;
    A2 = [-1 -10; .1 -1];
    
global B1;
   B1 = [-10 ; 10];
global B2;
   B2 = [-10; -10];
    
    C1 = [-1 1];
    C2 = [1 -1];
    
alpha = 1;
Alpha = [alpha];
x0 = [10 ; 20];
X = x0;
x = x0;
t1 = 0;
t2 = 0;
step = .005;

S = [];

for t = 0:step:1

    if (X(1,end)<=0)&&(alpha == 2)
       % commutation vers 1
       if(t1 ~= t + step)
            t1 = t;
       end
       alpha = 1;
       x = state_calc(X(:,end) , alpha , t , t1);
    elseif (x(1)<=0)&&(alpha == 1)
       % Rester en 1
       x = state_calc(X(:,end) , alpha , t , t1);
    end
    
    if (X(1,end)>0)&&(alpha == 1)
       % commutation vers 2
       if(t2 ~= t + step)
            t2 = t;
       end
       alpha = 2;
       x = state_calc(X(:,end) , alpha , t , t2);
    elseif (x(1)>0)&&(alpha == 2)
       % Rester en 2
       x = state_calc(X(:,end) , alpha , t , t2);
    end

    X = [X  x];
    
    if(alpha == 1)
            S = [S C1*x];
    else
            S = [S C2*x];
    end
    
    Alpha = [Alpha alpha];
    
end

figure
     plot(X(1,:), X(2,:))
     title('plan de phase')
     grid on

figure
    subplot(211)
        plot(S)
        axis([0 10 -30 50])
        title('Output');
        grid on
    subplot(212)
        stairs(Alpha)
        axis([0 10 0 3])
        title('\alpha');
        grid on