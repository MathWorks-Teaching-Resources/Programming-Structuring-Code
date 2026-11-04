%  Pre-run script for CommentingCode.m
% ---- Known Issues     -----
KnownIssuesID = "";
% ---- Pre-run commands -----
edit = @(str)MyEdit(str);
% <matlab:ShareFeedback Share your feedback>

function MyEdit(str)
assert(exist(str,"file"))
disp("Edit the file " + str)
end
