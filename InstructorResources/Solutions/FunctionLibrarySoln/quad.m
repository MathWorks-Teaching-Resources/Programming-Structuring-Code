function [xPlus,xMinus] = quad(a,b,c)
% QUAD solves quadratic equations ax^2+bx+c=0
% QUAD takes the coefficients of a quadratic equation ax^2+bx+c=0
% as arguments and returns the roots as calculated by the quadratic formula

% Original solution
% xPlus = (-b + sqrt(b^2-4*a*c))/(2*a);
% xMinus = (-b - sqrt(b^2-4*a*c))/(2*a);
xPlus = (-b + discriminant(a,b,c))/(2*a);
xMinus = (-b - discriminant(a,b,c))/(2*a);

end

%%
function D = discriminant(a,b,c)
% DISCRIMINANT takes the coefficients of a quadratic equation 
% ax^2+bx+c=0 and returns the value of the discriminant

D = sqrt(b^2-4*a*c);
end


%[appendix]{"version":"1.0"}
%---
