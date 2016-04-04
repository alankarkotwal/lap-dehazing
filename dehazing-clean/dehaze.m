function output = dehaze(input)

	% My variable parameters
	beta = 6;  % constant multiplier to priorpenelty(t(x)) in objective function
	gamma = 0.3; % constant multiplier to priorpenelty(J(x)) in objective function
	delta = 1; % weight for the Dark Channel Prior
	
	%% My parameters
	n_var = 0.012;
	tau = 0.05; % gradient descent step size
	beta_of = 1;% huber function parameter for t(x)
	gamma_of = 0.2; % huber function parameter for J(x)
	conv_par = 280; % Convergence parameter for gradient descent
	max_iter = 50; % Maximum iterations
	k_green = 2.3952;
	k_blue = 2.7056;
	k_red = 2.7079;
	theta_green = 23.8942;
	theta_blue = 20.20;
	theta_red = 22.4654;
	
	input = im2double(input);   
	input = input + n_var * randn(size(input));
	%clean = imread('out_pGT.png');
	%clean = im2double(clean);
	comp_image = im2double(imread('hist_landscape.jpg'));
	
	% Estimate for A
	% We need a handle on finding A for which we will use the method proposed
	% We generate the dark channel prior at every pixel, using window size
	% and zero padding
	dark_ch = makeDarkChannel(input, 3);
	
	% Estimate Atmosphere
	% We first pick the top 0.1% bright- est pixels in the dark channel.
	% These pixels are most haze- opaque (bounded by yellow lines in 
	% Figure 6(b)). Among these pixels, the pixels with highest intensity 
	% in the input image I is selected as the atmospheric light.	 
	dimJ = size(dark_ch);
	numBrightestPixels = ceil(0.001 * dimJ(1) * dimJ(2)); % Use the cieling to overestimate number needed
	  
	A_est = estimateA(input,dark_ch,numBrightestPixels);
	%A_est = imread('A_pGT.png');
	A_est = im2double(A_est);  
	A = [A_est(1,1,1)  A_est(1,1,2)  A_est(1,1,3)];
	
	present_J = zeros(size(input));
	k = size(present_J);
	present_t = double(ones(k(1),k(2)));
	
	modelFidelityTerm = modelFidelity(input, present_J, present_t, A);
	obj_fn = sum(sum(sum(modelFidelityTerm.^2))) + ...
			 beta * edgePrior(present_t, beta_of, 0) + ...   
			 gamma * edgePrior(present_J(:, :, 1), gamma_of, 0) + ...
			 gamma * edgePrior(present_J(:, :, 2), gamma_of, 0) + ...
			 gamma * edgePrior(present_J(:, :, 3), gamma_of, 0) + ...
			 delta * kl_div(present_J(:,:,1),k_red,theta_red) + ...
			 delta * kl_div(present_J(:,:,2),k_green,theta_green) + ...
			 delta * kl_div(present_J(:,:,3),k_blue,theta_blue);
	obj_fns = double(zeros(max_iter, 1));
	J_update = double(zeros(size(present_J)));
	previous_J = present_J;
	previous_t = present_t;
	iter = 1;
	prev_obj_fn = obj_fn;
	
	while iter <= max_iter %&& (prev_obj_fn >= obj_fn || iter < 3)
		
		obj_fns(iter) = obj_fn;
		prev_obj_fn = obj_fn;
		previous_J = present_J;
		previous_t = present_t;
		% Calculate the update
		t_update = 2 * sum(modelFidelityTerm, 3) .* ...
			(A(1) - present_J(:, :, 1) + ...
			A(2) - present_J(:, :, 2) + ...
			A(3) - present_J(:, :, 3)) + ...
			beta * priorUpdate(present_t, beta_of);
		
		for i = 1:3
			J_update(:, :, i) = -2 * modelFidelityTerm(:, :, i) .* present_t + ...
			gamma * priorUpdate(present_J(:, :, i), gamma_of);
		end

		J_temp = imhistmatch(present_J, comp_image, 255);
		J_update = J_update + delta*(J_temp - present_J);
		
		% Perform the update
		present_J = present_J + tau * J_update;
		
		present_J = check(present_J,0);
		present_J = check(present_J,1);
		present_t = present_t + tau * t_update;
		present_t = check(present_t,0);
		
		
		modelFidelityTerm = modelFidelity(input, present_J, present_t, A);
		obj_fn = sum(sum(sum(modelFidelityTerm.^2))) + ...
			 beta * edgePrior(present_t, beta_of, 0) + ...   
			 gamma * edgePrior(present_J(:, :, 1), gamma_of, 0) + ...
			 gamma * edgePrior(present_J(:, :, 2), gamma_of, 0) + ...
			 gamma * edgePrior(present_J(:, :, 3), gamma_of, 0) + ...
			 delta * kl_div(present_J(:,:,1),k_red,theta_red) + ...
			 delta * kl_div(present_J(:,:,2),k_green,theta_green) + ...
			 delta * kl_div(present_J(:,:,3),k_blue,theta_blue);
		
		disp(iter);
		iter = iter+1;
	end
	
	%a = sqrt(sum(sum(sum((present_J - clean).^2)))/(size(present_J, 1)* size(present_J, 2)* size(present_J, 3)));
	output = present_J;
	imwrite(output, strcat(num2str(now), '-out.png'));

end
