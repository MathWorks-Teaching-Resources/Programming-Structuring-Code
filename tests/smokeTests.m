% Run these tests with runMyTests
classdef smokeTests < matlab.unittest.TestCase

    methods(Test)

        function runFunctions(testCase)
            import matlab.unittest.diagnostics.FigureDiagnostic;
            testCase.log("Running Functions.mlx")
            fig = figure;
            testCase.addTeardown(@close,fig)
            Functions
            testCase.log(3,FigureDiagnostic(fig))
        end

        function runDebugging(testCase)
            import matlab.unittest.diagnostics.FigureDiagnostic;
            fig = figure;
            testCase.addTeardown(@close,fig)
            testCase.log("Running Debugging.mlx")
            Debugging
        end

        function runCommentingCode(testCase)
            import matlab.unittest.diagnostics.FigureDiagnostic;
            testCase.log("Running CommentingCode.mlx")
            fig = figure;
            testCase.addTeardown(@close,fig)
            CommentingCode
            testCase.log(3,FigureDiagnostic(fig))
        end

        function runSharingCode(testCase)
            testCase.log("Running SharingCode.mlx")
            SharingCode
        end

    end

end