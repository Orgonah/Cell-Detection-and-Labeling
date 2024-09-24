# Cell-Detection-and-Labeling

This project detects, labels, and counts cells in a grayscale image using a custom Otsu algorithm and MATLAB's `bwlabel` function. The results are saved in labeled images and a report file.

## Features

- **Cell Detection**: Utilizes a self-made Otsu algorithm to detect cells in a grayscale image.
- **Cell Labeling**: Labels detected cells with RGB colors.
- **Cell Counting**: Counts the number of detected cells.
- **Report Generation**: Generates a report with the area of each detected cell.

## Usage

To run the project, execute `MAIN.m`. This script will:

1. Read the `Cell.tif` image.
2. Detect cells using the custom Otsu algorithm and save the result as `otsu.tif`.
3. Label the detected cells with RGB colors and save the result as `label_RGB.tif`.
4. Count the detected cells.
5. Report the area of each cell in `report.xlsx`.

## Folder Structure

- `Cell.tif`: Input grayscale image containing cells.
- `otsu.tif`: Output image showing detected cells using the Otsu algorithm.
- `label_RGB.tif`: Output image with labeled cells in RGB colors.
- `report.xlsx`: Excel file reporting the area of each detected cell.

## How It Works

1. **Cell Detection**: The script reads the `Cell.tif` image and applies a custom Otsu algorithm to detect cells.
2. **Image Generation**: Saves the detected cells as `otsu.tif`.
3. **Cell Labeling**: Labels the detected cells with unique RGB colors and saves the image as `label_RGB.tif`.
4. **Cell Counting**: Counts the number of labeled cells.
5. **Report Generation**: Exports the area of each detected cell to `report.xlsx`.

## Example

1. Place your input image as `Cell.tif`.
2. Run `MAIN.m`.
3. Check the `otsu.tif` for detected cells.
4. Check the `label_RGB.tif` for labeled cells.
5. Open `report.xlsx` to see the area of each cell.