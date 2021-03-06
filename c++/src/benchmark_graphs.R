library(stringr)
library(readr)
library(ggplot2)
library(plotrix)
library(dplyr)
library(reshape2)
library("mxmaps")
library(scales)
library(MLmetrics)
library(caret)
# library(rstanarm)
library(ciTools)
library(gridExtra)
library(earth)
library(MASS)
library(rfinterval)
library(ranger)

binaryst <- read.table("./benchmark_results/unbalanced_bst.txt",sep="\t",header=F)
balancedt <- read.table("./benchmark_results/balanced_bst.txt",sep="\t",header=F)
map <- read.table("./benchmark_results/map.txt",sep="\t",header=F)

colnames(binaryst) <- c("nodes", "time")
colnames(balancedt) <- c("nodes", "time")
colnames(map) <- c("nodes", "time")

# ggplot(binaryst, aes(nodes,time)) + 
#   geom_point(size=1) +
#   geom_line(size=1)+ labs(title="MPI strong scalability on thin node") +
#   theme_minimal() + xlab("# of procs (P)") +
#   ylab("Scalability") + theme(plot.title = element_text(size=30), axis.text=element_text(size=16), axis.title =element_text(size=20), legend.title = element_text(size=0), legend.text = element_text(size=18), legend.key.size = unit(2, "lines")) + guides(colour = guide_legend(override.aes = list(size=3)))
# 
 # ggplot(balancedt, aes(nodes,time)) + 
 #   geom_point(size=1) +
 #   geom_line(size=1)+ labs(title="MPI strong scalability on thin node") +
 #   theme_minimal() + xlab("# of procs (P)") +
 #   ylab("Scalability") + theme(plot.title = element_text(size=30), axis.text=element_text(size=16), axis.title =element_text(size=20), legend.title = element_text(size=0), legend.text = element_text(size=18), legend.key.size = unit(2, "lines")) + guides(colour = guide_legend(override.aes = list(size=3)))
# 
# ggplot(map, aes(nodes,time)) + 
#   geom_point(size=1) +
#   geom_line(size=1)+ labs(title="MPI strong scalability on thin node") +
#   theme_minimal() + xlab("# of procs (P)") +
#   ylab("Scalability") + theme(plot.title = element_text(size=30), axis.text=element_text(size=16), axis.title =element_text(size=20), legend.title = element_text(size=0), legend.text = element_text(size=18), legend.key.size = unit(2, "lines")) + guides(colour = guide_legend(override.aes = list(size=3)))

ggplot() + 
  geom_line(data=binaryst, aes( x = nodes, y = time, color="Unbalanced Tree")) + 
  geom_line(data=balancedt, aes(x = nodes, y = time, color="Balanced Tree")) +
  geom_line(data=map, aes(x = nodes, y = time, color="std::map")) +
  scale_colour_manual("", 
                      breaks = c("Unbalanced Tree", "Balanced Tree", "std::map"),
                      values = c("red", "blue", "green")) +
  labs(title="Benchmark for find() (no optimization)") +
  theme_minimal() + xlab("# of nodes") +
  ylab("time [nanoseconds]") + theme(plot.title = element_text(size=30), axis.text=element_text(size=16), axis.title =element_text(size=20), legend.title = element_text(size=0), legend.text = element_text(size=18), legend.key.size = unit(2, "lines")) + guides(colour = guide_legend(override.aes = list(size=3)))
