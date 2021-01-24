function out = reporoot
% The root dir of the repro-poi-corrupt-xml repo
out = string(fileparts(fileparts(fileparts(mfilename('fullpath')))));
end