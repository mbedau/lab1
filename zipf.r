<<<<<<< HEAD
# Zipf law plot, Noah Pepper
# Reed, Phil 412
=======
>>>>>>> 1a2f2e473cd51669d809dc0ee695e243feaa97a6
args <- commandArgs(TRUE)
pdf(paste(args[1],'.pdf',sep=''))
for (f in args){
data = read.table(file=f,sep='\t',header=FALSE)
rank = 1:length(data$V2)
plot(log(rank),log(data$V2),main=paste("Zipf Plot of ",args[1]),xlab="Log(Rank)",ylab="Log(Frequency)")
}
dev.off()

