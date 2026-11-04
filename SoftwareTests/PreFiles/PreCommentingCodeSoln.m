%  Pre-run script for CommentingCodeSoln.m
% ---- Known Issues     -----
KnownIssuesID = "";
% ---- Pre-run commands -----
 
addpath(genpath(fullfile(currentProject().RootFolder,...
    "InstructorResources","Solutions","FunctionLibrarySoln")))

edit = @(str)MyEdit(str);
% <matlab:ShareFeedback Share your feedback>

function MyEdit(str)
assert(exist(str,"file"))
disp("Edit the file " + str)
end