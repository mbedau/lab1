#"""This program takes in a text file and produces a random language based upon the distribution of characters in the sample file"""
import sys,random

def main(f,n):
	outf = open(f+'.language.txt','w')
	samplestring = open(f,'r').read()
	for x in xrange(n):
		outf.write(random.sample(samplestring,1)[0])
	outf.close()
	
if __name__=="__main__":
	main(sys.argv[1],int(sys.argv[2]))