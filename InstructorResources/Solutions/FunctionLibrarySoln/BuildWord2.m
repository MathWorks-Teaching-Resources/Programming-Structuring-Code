function word = BuildWord2(len)
% BuildWord2 creates a random string of letters of length len. It
% requires a mix of consonants and vowels, counting y as both.
%
% len is a positive integer defining the number of 
%     random letters to string together
% word is the output, consisting of a string of len letters
    alphabet = ["a" "b" "c" "d" "e" "f" "g" "h" "i" "j" "k" "l" "m" "n" ...
        "o" "p" "q" "r" "s" "t" "u" "v" "w" "x" "y" "z"];
    vowels = [1 5 9 15 21 25];
    word = "";
    % Create a flag to track the index of the last forced vowel
    lastReqVowel = 0;
    for i = 1:len
        opt = randi(2,1);
        % Half the time, or if the last forced vowel was more than
        % three characters away, require that the next letter be a vowel
        % Otherwise, choose randomly from all possible letters
        if opt == 1 || (i-lastReqVowel) > 3
            lastReqVowel = i;
            idx = vowels(randi(6,1));    
        else
            idx = randi(26,1);
        end
        word = word + alphabet(idx);
    end
end


%[appendix]{"version":"1.0"}
%---
