# -*- coding: utf-8 -*-

import csv
import os
import sys

input_file = '../data/test1.csv'
out_folder = '../tex-generated/'
tex_file = 'out_main1.tex'

data = [];

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

#print(data[1])

tex = '\documentclass[spanish]{utecsyllabus}\n'
tex += '\\term{' + data[1][0] + '}\n'
tex += '\\begin{document}\n\maketitle\n\\begin{mainEnumerate}\n'
tex += '\item \courseCodeName{' + data[1][1] + '}\n'
tex += '\item \credits{' + data[1][2] + '}\n'
tex += '\item \hours{' + data[1][3] + '}\n'
coordinator = data[1][4].split(',')
tex += '\item \courseCoordinator{' + coordinator[0] + '}{' + coordinator[1] + '}{' + coordinator[2] + '}\n'
tex += '\end{mainEnumerate}\n\end{document}'

print(tex)
with open(out_folder+tex_file,'w') as f:
    f.write(tex)

cmd = 'pdflatex --output-directory ' + out_folder + ' ' + tex_file 
os.system(cmd)

