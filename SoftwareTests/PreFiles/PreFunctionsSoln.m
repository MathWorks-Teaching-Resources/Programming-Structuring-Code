%  Pre-run script for FunctionsSoln.m
% ---- Known Issues     -----
if isMATLABReleaseOlderThan("R2025a")
    KnownIssuesID = "MATLAB:UndefinedFunction";
else
    KnownIssuesID = "MATLAB:math:mustBeFloat";
end
% ---- Pre-run commands -----
 
addpath(genpath(fullfile(currentProject().RootFolder,...
    "InstructorResources","Solutions","FunctionLibrarySoln")))
% <matlab:ShareFeedback Share your feedback>
