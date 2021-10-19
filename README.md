# lbw.m

MATLAB code to determine the elbow in a series of ranked scores. The elbow in this algorithm is calculated as being the point in a series of ranked scores that is furthest from a line diagonal to the lowest and maximally ranked scores. This is assuming that the x and y coordinates are ranked equally, which is done automatically in the code.

Ranked scores are the first input into the function. If no x coordinates for the ranked scores are provided, then they are automatically determined as the linear indices of the ranked scores.

