classdef Settings < blah.internal.BlahBaseHandle
% Global settings for the blah package
%
% Don't use this class directly. If you want to get or set the settings,
% work with the instance of this in the blah.globals.settings field

  properties
  end

  methods (Static=true)

    function out = discover()
      % Discovery of initial values for package settings.
      %
      % This could look at config files, environment variables, Matlab appdata, and
      % so on.
      %
      % This needs to avoid referencing blah.globals, to avoid a circular dependency.
      out = blah.Settings;
    end

  end

end