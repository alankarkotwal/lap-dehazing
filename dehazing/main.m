
%% For laproscopic image dehazing

%% Estimate for A
% We need a handle on finding A for which we will use the method proposed

    Orig_image = imread('10.png');    
    Orig_image = double(Orig_image) ./ 255;        
    % We generate the dark channel prior at every pixel, using window size
    % and zero padding
    
    dark_ch = makeDarkChannel(Orig_image,21);
    
    %   Estimate Atmosphere
    
    %  We first pick the top 0.1% bright- est pixels in the dark channel.
    %  These pixels are most haze- opaque (bounded by yellow lines in 
    %  Figure 6(b)). Among these pixels, the pixels with highest intensity 
    %  in the input image I is selected as the atmospheric light.     
    %
    % TL;DR  TAKE .1% of the brightest pixels
    dimJ = size(dark_ch);
    numBrightestPixels = ceil(0.001 * dimJ(1) * dimJ(2)); % Use the cieling to overestimate number needed
    
    A_est = estimateA(Orig_image,dark_ch,numBrightestPixels);
    A = [A_est(1,1,1)  A_est(1,1,2)  A_est(1,1,3)];
    
%% Manually to be tuned parameters

tau = 0.5; % gradient descent step size
beta = 1; % huber function parameter for t(x)
gamma = 1; % huber function parameter for J(x)
beta_of = 0.5; % constant multiplier to priorpenelty(t(x)) in objective function
gamma_of = 0.5; % constant multiplier to priorpenelty(J(x)) in objective function
conv_par = 0.02; % Convergence parameter for gradient descent
max_iter = 1000; % Maximum iterations

present_J = Orig_image;
present_t = double(ones(size(present_J)));

modelFidelityTerm = modelFidelity(Orig_image, present_J, present_t, A);
obj_fn = sum(sum(modelFidelityTerm.^2)) + ...
         beta * edgePrior(present_t, beta_of) + ...
         gamma * edgePrior(present_J, gamma_of);
obj_fns = double(zeros(max_iter, 1));
J_update = double(zeros([size(present_J) 3]));
iter = 1;

while obj_fn > conv_par && iter < max_iter
    
    obj_fns(iter) = obj_fn;
    
    % Calculate the update
    t_update = 2 * modelFidelityTerm .* ...
               (A(1) - present_J(:, :, 1) + ...
                A(2) - present_J(:, :, 2) + ...
                A(3) - present_J(:, :, 3)) + ...
                beta * priorUpdate(present_t, beta_of);
    
    for i = 1:3
        J_update(:, :, i) = -2 * modelFidelityTerm .* present_t + ...
                            gamma * priorUpdate(present_J(:, :, i), gamma_of);
    end
    
    % Perform the update
    present_J = present_J - tau * J_update;
    present_t = present_t - tau * t_update;
    
    modelFidelityTerm = modelFidelity(Orig_image, present_J, present_t, A);
    obj_fn = modelFidelityTerm + ...
         beta * edgePrior(present_t, beta_of) + ...
         gamma * edgePrior(present_J, gamma_of);
    
end