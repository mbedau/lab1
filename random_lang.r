# Tools for creating random languages and corresponding Zipf's law plots. 
# 
# Can create low quality jpeg images from the command line via:
#     Rscript random_lang.r <num> <kind>
# Where <kind> designates either lang1 (1) or lang2 (2)
# and <num> indicates how many characters one desires in the created text.
#
# 2009 Cooper Francis <francisc@reed.edu>


##
# Generate a sample text document of n characters where the probability of a given letter
# appearing is equal to its probability of occuring in the English language (cf wikipedia).
# f controls the frequency of a space occuring, but the default should be sufficient, though
# it's source is not as reputable as the other probabilities.
makeLang <- function(n=1000, f=.1874) {
  lang <- c('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M',
            'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', ' ')
  text <- sample(lang, n, prob=c(.08167,.01492,.02782,.04253,.12702,.02228,.02015,.06094,
                            .06966,.00153,.00772,.04025,.02406,.06749,.07507,.01929,.00095,
                            .05987,.06327,.09056,.02758,.00978,.02360,.00150,.01974,.00074,f),
                 replace=TRUE)
  
  paste(text, collapse="")
}

##
# Create a random language with equal probabilities afforded to each non-' ' character
makeLang2 <- function(n=1000,f=.1874) {
  lang <- c('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M',
            'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', ' ')
  text <- sample(lang, n, replace=TRUE)
  
  paste(text, collapse="")
}

##
# Get the frequency of terms occuring in an arbitrary string.  Uses any length
# white space as word token separator.
getFreqs <- function(txt) {
  terms <- strsplit(txt, " ")[[1]]  # Split the input text on spaces.
  counter = new.env(hash=T)  # Create a new hash table for storing term freqs.
  
  # Count how many times each word appears in text, storing in counter.
  lapply(terms,  
         function(x) {tryCatch(assign(x,
                                      tryCatch(get(x,env=counter),
                                               error=function(x) {0}) + 1,
                                      env=counter),
                               error=function(x) {})})
  
  counter  # Return the counter object. 
}

##
# Create Zipf plot from an environment object as returned by getFreqs.
zipfPlot <- function(hash) {
  terms <- ls(hash)
  rank = 1:length(terms)
  
  plot(log(rank),
       log(sort(unlist(lapply(terms,
                              function(x) {get(x, env=hash)})),
                decreasing=T)),
       main="Zipf Plot",
       xlab="Log(Rank)",
       ylab="Log(Frequency)")
}

##
# Plot a random language.
plotLanguage <- function(num=10000, kind=0) {
  if (kind == 0) {
    lang <- makeLang(num)
  } else {
    lang <- makeLang2(num)
  }
  
  zipfPlot(getFreqs(lang))
}

# Command line behavior:
args <- commandArgs(TRUE)
jpeg(paste("random-zipf-",args[2],'.jpeg',sep=''))
plotLanguage(as.numeric(args[1]), as.numeric(args[2]))
dev.off()
