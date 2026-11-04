%[text] # checkExercise5
%[text] The function `checkExercise5(soln)` compares the value of `soln` to the correct solution of $\\cos(x) = xe^{-\\sin(x)}${"altText":"cos(x) = x exp(-sin(x))"}. If the solution is partially correct, appropriate feedback and hints are provided.
function out = checkExercise5(soln)

correct = fzero(@(t) cos(t)-t*exp(-sin(t)),1);

if soln == correct
    out = 1;
    disp("Good work, that is the correct solution.")
elseif round(soln,4) == round(correct,4)
    out = 0.5;
    disp("This appears to be a correct value, but your solution is supposed to use fzero.")
    disp("Please submit a more exact solution.")
elseif soln == 0
    out = 0;
    disp("This is the default value. Please complete this exercise and rerun this code.")
else
    out = 0;
    disp("No, this is incorrect. Please check your starting guess and use of fzero and try again.")
end


%[appendix]{"version":"1.0"}
%---
