function [output] = DiracDelta(delay,size)
output = zeros(1,size);
output(delay) = 1;
end

