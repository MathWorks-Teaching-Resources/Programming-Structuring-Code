%[text] # checkMarkMidpoint
%[text] The function `checkMarkMidpoint(markMidpoint)` generates two random points and compares the result of the user-supplied `markMidpoint` function to the correct values. It checks both the computed value of the midpoint as well as whether the result is plotted as requested. If the solution is partially correct, appropriate feedback and hints are provided.
function checkMarkMidpoint(markMidpoint)
    pt1 = rand([1 2]);
    pt2 = rand([1 2]);
    p = plot([pt1(1) pt2(1)],[pt1(2) pt2(2)],".-","LineWidth",3,"MarkerSize",10);
    try
        mid = markMidpoint(pt1,pt2)
        if mid == (pt1+pt2)/2
            disp("You have calculated the correct midpoint.")
        else
            disp("You have not returned the correct midpoint as a vector.")
        end
        fig = p.Parent;
        if length(fig.Children) == 2
            disp("You have added to the plot, ")
            p1 = fig.Children(1);
            tot = 0;
            if p1.XData == mid(1) && p1.YData == mid(2)
                disp("and you have plotted the correct point.")
                tot = tot+1;
            else
                disp("but you have not plotted the correct point.")
            end
            if length(p1.Color) == 3 && all(p1.Color == [1 1 0])
                disp("You have set the color as yellow.")
                tot = tot+1;
            else
                disp("You have not set the color as yellow.")
            end
            if p1.Marker == "o"
                disp("You used the marker 'o'.")
                tot = tot+1;
                p1.MarkerSize = 10;
            else
                disp("You did not use the correct marker, 'o'.")
            end
            if length(p1.MarkerFaceColor) == 3 && all(p1.MarkerFaceColor == [1 1 0])
                disp("You have set the MarkerFaceColor to yellow.")
                tot = tot+1;
            else
                disp("You have not set the MarkerFaceColor to yellow.")
            end
            if tot == 4
                title("You have correctly implemented this function.")
            else
                title("Please correct your errors and recheck your function.")
            end
        else
            title("You have not added the point the the plot.")
        end
    catch
        disp("Have you written markMidpoint yet? Is it on the path?")
    end
end


%[appendix]{"version":"1.0"}
%---
