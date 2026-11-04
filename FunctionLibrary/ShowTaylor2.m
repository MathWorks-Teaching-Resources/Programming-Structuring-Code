function ShowTaylor2(fh,deg,bds,x0)
% SHOWTAYLOR calculates and displays Taylor polynomial approximations
% The arguments to SHOWTAYLOR are:
%     fh, a function handle identifying the function, fh(x), to be approximated
%     deg, the order, or vector of orders, of the Taylor polynomial(s) to be used
%     bds, a length two vector of doubles identifying the domain to use for
%         plotting the results
%     x0 is a double identifying the center, x=x0, of the Taylor
%         polynomial approximation
% SHOWTAYLOR creates and displays a plot of the original function
%         and its approximates of order deg
if length(deg) > 1
    for k = 1:length(deg)
        CalcTaylor(fh,deg(k),bds,x0)
        pause(0.2)
    end
else
    CalcTaylor(fh,deg,bds,0)
end

end

%%
function CalcTaylor(fh,deg,bds,x0)
% CalcTaylor computes and plots a Taylor polynomial approximation
%   fh is a function handle
%   deg is the degree of the Taylor polynomial
%   bds are the x limits of the range to be plotted
%   x0 is the center value for the approximation, x=x0
syms x
T = taylor(fh(x),x,x0,"Order",deg);
xVals = linspace(bds(1),bds(2),100);
fVals = fh(xVals);
plot(xVals,fVals);
hold on
TVals = double(subs(T,x,xVals));
plot(xVals,TVals);
hold off
title("A Taylor approximation")
subtitle("Centered around $x =$" + x0,"Interpreter","latex")
xlabel("$x$","Interpreter","latex")
ylabel("$f(x)$","Interpreter","latex")
scale = (max(fVals)-min(fVals))*0.1;
ylim([min(fVals)-scale max(fVals)+scale])
xlim(bds)
legend(["Original" "Taylor"],"Location","best")
end



%[appendix]{"version":"1.0"}
%---
