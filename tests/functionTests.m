% Run these tests with 
% results = runtests(tLibrary)
% table(results)
classdef functionTests < matlab.unittest.TestCase

    methods(Test)

        function runCheckExercise5(testCase)
            roundedOut = checkExercise5(1.1022);
            correctOut = checkExercise5(fzero(@(t) cos(t)-t*exp(-sin(t)),1));
            incorrectOut = checkExercise5(0);
            verifyEqual(testCase,[roundedOut correctOut incorrectOut], [0.5 1 0])
        end

        function runShowTaylor(testCase)
            fig = figure;
            testCase.addTeardown(@close,fig)
            showTaylor(@cos,12,[-2*pi 2*pi], 0)
            actualTaylor = print("-RGBImage");
            load showTaylorExpected.mat
            verifyEqual(testCase,actualTaylor,expectedTaylor)
        end


    end % methods

end % classdef