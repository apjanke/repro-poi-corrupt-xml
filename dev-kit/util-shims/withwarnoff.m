function out = withwarnoff(warningId)
% Temporarily disable warnings
arguments
  warningId string
end
out = blah.internal.util.withwarnoff(warningId);
end
