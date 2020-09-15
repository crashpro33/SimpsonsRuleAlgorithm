% Inputs:
% fname: the function to be integrated
% a: the upper bound of the integral
% b: the lower bound of the integral
% n: the number of subintervals used

% Outputs:
% q: a scalar representing the integral's approximate value

% The following is an example of how this function might be called
% >> q = simpson(@(x)x*sin(x), 0, pi/2, 10)

function q = simpson(fname, a, b, n)

% if n is not an even number
if (mod(n, 2) ~= 0)
    % throw the following error
    error('Error: n must be even. Please try again');
end % end if

% calculate the subinterval width
h = (b - a) / n; % subtract the bounds and divide by # of subintervals

% add the evaluations of the function at the bounds
q = fname(a) + fname(b);

% for loop with step size 2 to add all odd Xn's
for i = 1:2:n - 1
    % the sum is itself plus 4 * the function evaluation
    q = q + 4 * fname(a + i * h); % a + i * h provides the odd Xn's h apart
end % end for loop

% for loop with step size 2 but starts at 2 to add all even Xn's
for i = 2:2:n - 2
    % perform the same action as the other for loop except using 2 instead
    % of 4
    q = q + 2 * fname(a + i * h); % multiply by 2 instead of 4 for even intervals
end % end for loop

% multiply by the h/3 that is factored out of the primary equation
q = q * h / 3; % the sum becomes itself times h/3 for the output
