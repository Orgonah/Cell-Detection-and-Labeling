close all; clc; clear;

image = imread('Cells.tif');

address = "";
filename = "report.xlsx";

writeCellToExcel(address,filename,image)

