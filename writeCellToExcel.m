function writeCellToExcel(address, filename, image)
    % get the otsu threshold
    threshold = my_graythresh(image);    
    
    % Binarize the image using the computed threshold
    binaryImage = image > threshold;

    % Implement connected component labeling
    [labeledImage, numCells] = my_bwlabel(binaryImage);
    
    % Initialize variables to store cell properties
    cellProps = struct('Label', {}, 'Area', {}, 'AverageBrightness', {});

    % Compute cell properties
    for i = 1:numCells
        % Extract the region corresponding to the cell
        cellRegion = labeledImage == i;
        
        % Calculate area (number of pixels)
        area = sum(cellRegion(:));
        
        % Calculate average brightness level
        avgBrightness = mean(image(cellRegion));
        
        % Store cell properties in the struct
        cellProps(i).Label = i;
        cellProps(i).Area = area;
        cellProps(i).AverageBrightness = avgBrightness;
    end

    % Write cell properties to Excel file
    cellData = struct2table(cellProps);
    writetable(cellData, fullfile(address, filename), 'Sheet', 'CellProperties', 'Range', 'A1');
    

    disp('Cell properties written to Excel file successfully!');


    % Display the results
    figure;
    subplot(1, 3, 1);
    imshow(image);
    title('Original Image');

    subplot(1, 3, 2);
    imshow(binaryImage);
    title('Binarized Image');
    imwrite(binaryImage,"otsu.tif");

    subplot(1, 3, 3);
    imshow(label2rgb(labeledImage));
    imwrite(label2rgb(labeledImage),"label_RGB.tif");
    title(['Labeled Image: ' num2str(numCells) ' cells']);
end