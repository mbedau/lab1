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
	
def main(n,m):
	outf = open('veryrandomlanguage.txt','w')
	#samplestring = txt_clean(open(f,'r').read())
	for x in xrange(m):
		#outf.write(random.sample(samplestring,1)[0])
		outf.write(str(random.randint(0,n))+' ')
	outf.close()
	
if __name__=="__main__":
	main(int(sys.argv[1]),int(sys.argv[2]))