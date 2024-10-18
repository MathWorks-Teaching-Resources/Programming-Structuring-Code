%[text] %[text:anchor:DEF03274] # Modular Courseware \- Utilities
%[text] %[text:anchor:AB19903A] ## Set Modular Courseware Development Environment
  SetPath; %[control:button:1377]{"position":[1,2]}
%%
  UnsetPath; %[control:button:98c3]{"position":[1,2]}
%%
%[text] ## Status Update
%[text] - 8/10/23: Move images to [https://insidelabs\-git.mathworks.com/modular\-curriculum\-content/shared\-team\-resources](https://insidelabs-git.mathworks.com/modular-curriculum-content/shared-team-resources)
%[text] - 7/25/23: Move template to [https://insidelabs\-git.mathworks.com/modular\-curriculum\-content/module\-template](https://insidelabs-git.mathworks.com/modular-curriculum-content/module-template)
%[text] - 7/25/23: Re\-organize the repository format \
%[text] 
%[text] ## Tools Overwiew
%[text] Need to add decription to every tool
%[text] - **CheckDisplayStyle.mlx** \- use this to check for hidden code/code inline
%[text] - **ClearOutput.mlx** \- use this to clear the output of a live script
%[text] - **isDesktop.m** \- include this in modules if there is a need to determine where the repository is being run
%[text] - **normalizeFigmaSVG.m** \- use this to get an image by id from the MathWorks Icon repository
%[text] - **ResetProjectSettings.mlx** \- deprecated, shouldn't be necessary. Use this to set project views to `0` and reviewed to `false`
%[text] - **SwitchDisplayStyle.mlx** \- use this to switch between hidden code and code inline \
%[text] 
%[text] ## Testing Resources
%[text] ### HelperFunctions
%[text] These functions are called by `testLinksImages.m`
%[text] - **checkHyperlinks.m**  \- do all the hyperlinks in a live script resolve without errors?
%[text] - **checkImages.m**  \- do all the images in a live script have developer\-designed alt\-text?
%[text] - **idFile.m**  \- identify the final Folder/Scriptname of the file currently being run \
%[text] ### TestFiles
%[text] These are object oriented MATLAB testing files
%[text] - **testLinksImages.m** \- contains two tests: one for hyperlinks and one for alt\-text \
%[text] ### **TestRunners**
%[text] These are scripts that act as runners for TestFiles tests.
%[text] - **runCMTests.m** \
%[text] `runCMTests` is intented to organize the running of immediately\-prior\-to\-release tests of hyperlinks and the existence of alt\-text in the .mlx files in a curriculum module. 
%[text] 
%[text] ## **Sandbox** 
%[text] - **HyperlinkUpdater** \
%[text] A set of sample scripts designed to allow updating textual elements (e.g. hyperlinks) in .mlx files
%[text] - **urlEncoder.mlx** \
%[text] A sample attempt at generating mailto: links. Live tests did not work well in the wild. Be careful with this one.
%%
function SetPath
    Path = fileparts(matlab.desktop.editor.getActiveFilename);
    addpath(fullfile(Path,"Tools"));
    addpath(genpath(fullfile(Path,"TestingResources")));
    savepath;
    setpref("MCCTEAM","Developer",true)
end

function UnsetPath
    Path = fileparts(matlab.desktop.editor.getActiveFilename);
    rmpath(fullfile(Path,"Tools"));
    rmpath(genpath(fullfile(Path,"TestingResources")));
    savepath;
    rmpref("MCCTEAM")
end

%[appendix]
%---
%[metadata:view]
%   data: {"layout":"inline","rightPanelPercent":40}
%---
%[control:button:1377]
%   data: {"label":"Add Tools to path","run":"Section"}
%---
%[control:button:98c3]
%   data: {"label":"Remove Tools from path","run":"Section"}
%---
