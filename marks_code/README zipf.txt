			Zipf's law lab
			Phil 412, Fall 2009

This is instructions for using R to analyze 1000 patent abstracts in January 2005, 
from the USPTO web site.

Use terminal to put the files you need in some directory where you will keep all your work.
>>>> You get the files on the web at http://github.com/phil412 ...
>>>> You get the files from the Phil 412 moodle ...

Most of the work in this lab is done in the terminal window, using simple Unix commands. 

In a terminal window, go to your working directory for this Phil 412 computation lab: 
	chdir [drag folder into terminal window] <CR>

You should get the files:
doc2freq.py 		- the Python script
patentsample.txt 	- a text file with 1000 patent abstracts (Jan 2005)

You need to make sure that the Python script is executable:
In the terminal window:
	chmod 755 doc2freq

*** Examine the file patentsample.txt, using TextEdit... 
*** Describe what you see to be the contents of that file. 
*** Speculate on what word frequencies will appear in this text.

*** How big is the file? How many words are in your data set? 
IN the terminal window:
	wc patentsample.txt
This command produces three numbers.		[993  107088  729088 patentsample.txt]
The number of words (tokens) in the file is the middle number.
(The first number is the number of lines, and the third is the number of characters.)

The Python script doc2freq.py creates a word frequency table for any document you specify. 
*** EXamine this file in TextEdit, and describe what you see. 
*** What things do you think you understand? 
*** What things are a total mystery?

To run the Python script on the patent data, enter this command in the terminal window:
	python doc2freq.py patentsample.txt

This should create a new file, patentsample.tsv in your working directory. 
*** Look at this file (using TextEdit) and confirm what you see. 

*** How many words are in the "dictionary" used by this corups? In the terminal window:
	wc patentsample.tsv
This produces  					[7856   15711   85039 patentsample.tsv]
Here, we use the first number (because there is one word type per line in this file).

*** List the "dirt" you see in the data.
*** Describe how you could clean this dirt out of the data
***
*** extra credit
*** Clean the patent data, replot it. Does this clean up the story in the Zipf's plot at all?

Use the zipf.r to plot the resulting frequncy data, in the terminal window:
	Rscript zipf.r patentsample.tsv

This should create another new file, patentsample.tsv.pdf, in your working directory. This figure shows the Zipf's analysis of the text: the frequency of a word as a function of its rank among all words in frequency. Specifically, we take the logs of both variables, and graph log word frequency as a function of log word rank. 

In a Finder window, open patentsample.tsv.pdf 
*** describe the Zipf's plot that you see. What are its notable features?

********* extra credit
*** Do the same thing for 9 more files with 9000 more abstracts. 
*** Compare the Zipf plots for the 10 data sets. What do you see? 
*** Can you explain any of it? 
*** Do you now have a better idea of the general form of Zipf's law? 
*** How precisely can you state the law that you observe in your data?

Zipf's law is an empirical observation that log word frequency is a power law of log word rank, with exponent -1. You can recognize this statistical observation in a Zipf's plot as a straight line with slope -1. 

To Do:

*** Make a copy of the data, called pat.txt, for safety.
*** Split the data into smaller chunks, in the terminal window:
	split -l 100 pat.txt
*** This produces the files xaa, xab, xac, ..., which are successive pieces of the original file.
*** Describe xaa, compared with all the data, using wc in the terminal window:
*** How many words (tokens) in the file? 		[100   12063   81204 xaa.txt]
***							100   11844   80091 xab.txt
*** Now, for the next step, make xaa into a .txt file...
*** Next, do the same kind of Zipf's analysis for xaa. What do you see, similarities and differences?
*** How much can you explain?
*** How many words are in the dictionary? 		[2030    4059   20764 xaa.tsv]
***							  1732    3463   17775 xab.tsv
*** Explain
***
*** extra credit: Do the same thing for all of the files: xab, xac, ...

*** Go find some real world text corpus (worst case, a long paper you wrote, in *.txt format). 
*** Then do a Zipf's law analysis of it. Make the Zipf's plot. 
*** Describe what you see in them. Can you explain any of it? 
*** What interesting testable predictions can you make from these observations and reflections?

*** overplot Zipf's plots for many data sets, to compare slopes ...

-- Tweak the Zipf's law plot in various ways ...
--	fit a line to the data, overplot it
-- 		calculate the slope of the line (exponent)
--		calculate the error bars for the fit
--
-- 	plot many different data sets on the same graph, compare them, comment ...


-- Clean up the data by getting rid of the numerals, then make Zipf's law again. Can you see any material difference between the new plot and your original plot?