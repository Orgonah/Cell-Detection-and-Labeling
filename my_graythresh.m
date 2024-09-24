function output = my_graythresh(image)
    % Compute histogram
    [counts, binLocations] = imhist(image);
    
    % Compute the probability of each intensity level
    p = counts / sum(counts);
    
    maxVar = 0;
    threshold = 0;
    
    % Compute cumulative sums
    cumSum = cumsum(p);
    cumMean = cumsum((0:255)' .* p);
    
    % Total mean
    totalMean = cumMean(end);
    
    % Iterate over all possible thresholds
    for t = 1:255
        if cumSum(t) == 0 || cumSum(t) == 1
            continue
        end
        
        % Class probabilities
        w0 = cumSum(t);
        w1 = 1 - w0;
        
        % Class means
        mu0 = cumMean(t) / w0;
        mu1 = (totalMean - cumMean(t)) / w1;
        
        % Between class variance
        varBetween = w0 * w1 * (mu0 - mu1)^2;
        
        % Check if new maximum found
        if varBetween > maxVar
            maxVar = varBetween;
            threshold = t;
        end
    end
    output = threshold;
end