function midpt = MarkMidpoint(end1,end2)
% MARKMIDPOINT identifies and marks the midpoint between END1 and END2

midpt = (end1+end2)/2;

% Add the calculated midpoint to the currently active plot
hold on 
plot(midpt(1),midpt(2),"yo","MarkerFaceColor","yellow","MarkerEdgeColor","auto")
hold off
end


%[appendix]{"version":"1.0"}
%---
