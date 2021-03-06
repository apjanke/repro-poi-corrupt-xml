classdef BlahBase
  % This class is a trick to support automatic library initialization
  %
  % To use it, have all your classes that depend on the library being
  % initialized inherit from this or BlahBaseHandle.
  
  properties (Constant, Hidden)
    initializer = blah.internal.LibraryInitializer;
  end
  
end

