#"""This program takes in a text file and produces a random language based upon the distribution of characters in the sample file"""
import sys,random,re

def txt_clean(txt):
	"""Naive text cleanup"""
	#get rid of non-alphanumerics naively
	txt = re.sub(r'\W+',' ',txt)
	# clean up whitespace so we only have single spaces between words
	txt = re.sub(r'\s+',' ',txt)
	# convert all to lower case
	txt = txt.lower()
	return txt
	
def main(f,n):
	outf = open(f+'.cleanlanguage.txt','w')
	samplestring = txt_clean(open(f,'r').read())
	for x in xrange(n):
		outf.write(random.sample(samplestring,1)[0])
	outf.close()
	
if __name__=="__main__":
	main(sys.argv[1],int(sys.argv[2]))