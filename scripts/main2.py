# -*- coding: utf-8 -*-

import csv
import os
import sys

input_file = '../data/test2.csv'
out_folder = '../tex-generated/'
tex_file_name = 'out_main2'

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

for i in range(1,len(data)):
    tex = '\documentclass[spanish]{utecsyllabus}\n'
    tex += '\\term{' + data[i][0] + '}\n'
    tex += '\\begin{document}\n\maketitle\n\\begin{mainEnumerate}\n'
    tex += '\item \courseCodeName{' + data[i][1] + '}\n'
    tex += '\item \credits{' + data[i][2] + '}\n'
    tex += '\item \hours{' + data[i][3] + '}\n'
    coordinator = data[i][4].split(',')
    tex += '\item \courseCoordinator{' + coordinator[0] + '}{' + coordinator[1] + '}{' + coordinator[2] + '}\n'
    tex += '\end{mainEnumerate}\n\end{document}'

    #print(tex)
    tex_file = tex_file_name + str(i) + '.tex' 
    with open(out_folder+tex_file,'w') as f:
        f.write(tex)

    cmd = 'pdflatex --output-directory ' + out_folder + ' ' + tex_file 
    os.system(cmd)

