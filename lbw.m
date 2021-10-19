function [scr_opt,indx] = lbw(scrs,x)
%Finds the elbow in some input scores. You can specify the scores along the
%x axis, otherwise they are determined by their linear indices.
%(c) Michael Sorochan Armstrong, 2021

switch nargin
    
    case 2
        
    case 1
        disp('No input x vector, using linear indicies')
        x = 1:1:max(size(scrs));
end

%Normalise each vector, otherwise the result is biased to the dimension
%with the highest step size
x = x./max(x);
mxscr = max(scrs);
scrs = scrs./mxscr;

%matrix of regularly spaced points along the line
slp = (scrs(end)-scrs(1))/(x(end) - x(1));
b = scrs(1) - slp*x(1);

%create the line
yline = b + slp.*x;

%create the coordinate matrices
lnemat = [yline;x]';
scrmat = [scrs;x]';

%create the distance matrix
distmat = pdist2(scrmat,lnemat);

%find the minimum distance from the scores to the diagonal line
mindist = min(distmat,[],2);

%find the maximum of the previously calculated minima
[~,indx] = max(mindist);

%re-scale from the previously calculated maximum
scr_opt = scrs(indx)*mxscr;

end