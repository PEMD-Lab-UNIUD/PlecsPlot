import argparse
import os.path
import math 
VERSION = 1.0

## USE 
# to decimate of a factor 10 
# python decimator.py -i nome_file.csv -d 10 

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='decimator program',epilog='Version: ' + str(VERSION))
    parser.add_argument('-d','--decimate',help='the decimation factor',action='store', default='0', type=int, choices=range(0, 100))
    parser.add_argument('-i','--input',help='inputname', type=str)
    args = parser.parse_args()

    #apri il file in lettura
    try:
        filein = open(args.input, 'r')
    except:
        raise TypeError("Input file not valid")

    

    #leggi tutto il file
    # Using readlines()
    Lines = filein.readlines()


#apri file uscita
    outputfile = args.input[0:len(args.input)-4]+'_dec'+str(args.decimate)+'.csv'
    print(outputfile)
    try:
        fileout = open(outputfile, 'w')
    except:
        raise TypeError("Error access file: " + outputfile)
    
    T = 2.2800000000000002e-05  # EDIT this value to end the file at this timestamp 

    i = 0
    for line in Lines:
        
        if i==args.decimate:
            fileout.write(line)
            i = 0
            values = line.split(',')
            
            if float(values[0]) >T:
                break
        else:
            i = i+1

