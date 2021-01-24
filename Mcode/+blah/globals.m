classdef globals
  % Global library properties and settings for repro-poi-corrupt-xml.
  %
  % Note that if you want to change the settings, you can't do this:
  %
  %    blah.globals.settings.someSetting = 42;
  %
  % That will break due to how Matlab Constant properties work. Instead, you need
  % to first grab the Settings object and store it in a variable, and then work
  % on that:
  %
  %    s = blah.globals.settings;
  %    s.someSetting = 42;
  
  properties (Constant)
    % Path to the root directory of this repro-poi-corrupt-xml distribution
    distroot = string(fileparts(fileparts(fileparts(mfilename('fullpath')))));
    % Global settings for blah.
    settings = blah.Settings.discover
  end
  
  methods (Static)
    
    function out = version
      % The version of the repro-poi-corrupt-xml library
      %
      % Returns a string.
      persistent val
      if isempty(val)
        versionFile = fullfile(blah.globals.distroot, 'VERSION');
        val = strtrim(blah.internal.util.readtext(versionFile));
      end
      out = val;
    end
    
    function initialize
      % Initialize this library/package
      blah.internal.initializePackage;
    end
    
  end
  
end

