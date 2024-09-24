function [labeledImage, numLabels] = my_bwlabel(binaryImage)
    [rows, cols] = size(binaryImage);
    labeledImage = zeros(rows, cols);
    currentLabel = 0;
    equivalences = [];
    
    % First pass: label and record equivalences
    for r = 1:rows
        for c = 1:cols
            if binaryImage(r, c) == 1
                neighbors = [];
                if r > 1 && labeledImage(r-1, c) > 0
                    neighbors = [neighbors labeledImage(r-1, c)];
                end
                if c > 1 && labeledImage(r, c-1) > 0
                    neighbors = [neighbors labeledImage(r, c-1)];
                end
                if isempty(neighbors)
                    currentLabel = currentLabel + 1;
                    labeledImage(r, c) = currentLabel;
                else
                    minLabel = min(neighbors);
                    labeledImage(r, c) = minLabel;
                    for n = neighbors
                        if n ~= minLabel
                            equivalences = [equivalences; n minLabel];
                        end
                    end
                end
            end
        end
    end
    
    % Resolve equivalences
    for e = 1:size(equivalences, 1)
        labeledImage(labeledImage == equivalences(e, 1)) = equivalences(e, 2);
    end
    
    % Relabel with consecutive integers
    uniqueLabels = unique(labeledImage(labeledImage > 0));
    numLabels = length(uniqueLabels);
    for i = 1:numLabels
        labeledImage(labeledImage == uniqueLabels(i)) = i;
    end
    
    % Calculate area of each label
    labelAreas = histcounts(labeledImage, 0.5:(numLabels+0.5));
    
    % Remove small regions (fewer than 10 pixels)
    for i = 1:numLabels
        if labelAreas(i) < 10
            % Find nearest larger region
            [r, c] = find(labeledImage == i);
            nearestLabel = find_nearest_label(labeledImage, r, c, labelAreas, 10);
            labeledImage(labeledImage == i) = nearestLabel;
        end
    end
    
    % Relabel again with consecutive integers
    uniqueLabels = unique(labeledImage(labeledImage > 0));
    numLabels = length(uniqueLabels);
    for i = 1:numLabels
        labeledImage(labeledImage == uniqueLabels(i)) = i;
    end
end

