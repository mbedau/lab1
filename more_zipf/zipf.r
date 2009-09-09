args <- commandArgs(TRUE)

pdf(paste(args[1],'.pdf',sep=''))
for (f in args){
data = read.table(file=f,sep='\t',header=FALSE)
rank = 1:length(data$V2)
plot(log(rank),log(data$V2),main=paste("Zipf Plot of ",args[1]),xlab="Rank",ylab="Frequency")
}
dev.off()

