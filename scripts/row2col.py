# Convert rows to columns in csv file

import csv
import sys


input_file = '../data/el.csv'
output_file = '../data/el_rowcol.csv'
data = []; nrows = 0; ncols = 0

# Read the file
with open(input_file, 'rt') as f:
    csv_reader = csv.reader(f)
    # Store all data in this variable
    for line in csv_reader:
        data.append(line)
    # Number of rows of the input data
    nrows = len(data)
    # Check if all rows have the same number of columns
    prev_ncols = len(data[0])
    for i in range(1,nrows):
        if (len(data[i]) != prev_ncols):
            sys.exit('Column size does not match')
        prev_ncols = len(data[i])
    ncols = prev_ncols

# Write the output file
with open(output_file, 'w') as fout:
    csv_writer = csv.writer(fout)
    for c in range(ncols):
        line = []
        for r in range(nrows):
            line.append(data[r][c])
        csv_writer.writerow(line)
