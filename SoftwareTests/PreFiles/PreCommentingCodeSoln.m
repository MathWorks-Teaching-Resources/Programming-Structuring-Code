%  Pre-run script for CommentingCodeSoln.mlx
% ---- Known Issues     -----
KnownIssuesID = "";
% ---- Pre-run commands -----
 
addpath(genpath(fullfile(currentProject().RootFolder,...
    "InstructorResources","Solutions","FunctionLibrarySoln")))

edit = @(str)MyEdit(str);

function MyEdit(str)
assert(exist(str,"file"))
disp("Edit the file " + str)
end