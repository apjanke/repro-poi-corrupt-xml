function out = system2(cmd)
% A version of system that raises an error on failure

if nargout == 0
  blah.internal.util.system2(cmd);
else
  out = blah.internal.util.system2(cmd);
end

end