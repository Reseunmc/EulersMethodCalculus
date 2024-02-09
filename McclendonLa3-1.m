
[final,h]=userin();
f = @(t,y) (2 - exp(-4*t) - 2*y);
g = @(t,v) (v-(0.5*(exp(t/2)))*(sin(5*t))+(5*exp(t/2))*(cos(5*t)));
%h = 0.1;  % Define Step Size
%final = 5;
t = 0:h:final;
ay = 1+(0.5.*exp(-4.*t))-(0.5.*exp(-2.*t));
av = exp(t./2).*sin(5.*t);
y = zeros(1,numel(t));
v = zeros(1,numel(t));

y(1) = 1;% y0
v(1)=0;
%tarray=zeros(1,(final/h))
%yarray=zeros(1,
%varray=[];
% You know the value a t = 0, thats why you'll state with t = h i.e. i = 2
for i = 2:numel(t)
    y(i) = y(i-1) + h*f(t(i-1),y(i-1));
    v(i) = v(i-1) + h*g(t(i-1),v(i-1));
    %disp([t(i) y(i) v(i)]);
   
   
%implement ode 45
    
    
end
[ot,oy]=ode45(f, t, y(1));
[ot,ov]=ode45(g, t, v(1));


figure('Name', 'Graphs of (2 - e^-4x - 2y) and y-0.5e^(x/2)sin(5x)+5e^(x/2)cos(5x)', 'NumberTitle', 'off');
figure('units','normalized','outerposition',[0 0 1 1]);

subplot(2,2,1),plot(t,y,'-.ro',t,ay,'-.go');
legend('(a)Euler Approx','(b)Analytical method')
xlabel('x values (stepped by h)');
ylabel('y value approximation');
title('Euler Approx and Analytical method for 2 - e^-4x - 2y');

subplot(2,2,2),plot(t,oy,'-.bo');
legend('ODE45')
xlabel('x values (stepped by h)');
ylabel('y output');
title('ODE 45 for 2 - e^-4*x - 2y');

subplot(2,2,3),plot(t,v,'-.ro',t,av,'-.go');
legend('(a)Euler Approx','(b)Analytical method')
xlabel('x values');
ylabel('y value approximations');
title('Euler Approx and Analytical method for y-0.5e\^(x/2)sin(5x)+5e\^(x/2)cos(5x)');

subplot(2,2,4),plot(t,ov,'-.bo');
legend('ODE45')
xlabel('x values (stepped by h)');
ylabel('y output');
title('ODE 45 for y-0.5e\^(x/2)sin(5x)+5e\^(x/2)cos(5x)');

%{
Euler's method works in these two examples since the t gives us a vector range on which to plot 
our x vlues and to plug into the example equations to plot out y points at
each x in order to produce a curve. The h (step) lets us determine how
precise we want our curves to be. the more steps, the more approximations
to make a more accurate curve. 
The method works relatively well in that the curves for the eulers method
vs the analytical and ODE 45 result is not very far off. For both
equations, the cruve follows the same shape and is not far off from the two
more accurate solutions.

%}

