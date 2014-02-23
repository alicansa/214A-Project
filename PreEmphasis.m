function [output] = PreEmphasis(data,coeff)
output = filter([1,coeff],1,data);
end

