function nearestLabel = find_nearest_label(labeledImage, rows, cols, labelAreas, minSize)
    [totalRows, totalCols] = size(labeledImage);
    minDistance = inf;
    nearestLabel = 0;
    
    for i = 1:length(rows)
        r = rows(i);
        c = cols(i);
        
        for rr = max(1, r-1):min(totalRows, r+1)
            for cc = max(1, c-1):min(totalCols, c+1)
                label = labeledImage(rr, cc);
                if label > 0 && labelAreas(label) >= minSize
                    distance = (rr - r)^2 + (cc - c)^2;
                    if distance < minDistance
                        minDistance = distance;
                        nearestLabel = label;
                    end
                end
            end
        end
    end
end