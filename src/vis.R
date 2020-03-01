#!/usr/bin/env Rscript
# -*- coding: utf-8 -*-

library(tools)
library(rjson)
library(ggplot2)
library(tikzDevice)
library(reshape2)

plot_build <- function(){
  # get main data
  hold <- fromJSON(file="./benchmarks/build.json")
  hold <- lapply(hold, function(x) {
    size <- gsub(".*\\_(.)\\.lp","\\1",x$args$initial)
    game <- x$args$game_name
    if(game == "nim"){
      game <- "Nim"
    } else if(game == "ttt") {
      game <- "TTT"
    }
    approach <- x$results$player
    if(approach == "minmax"){
      approach <- "Minimax"
    } else if(approach == "pruned_minmax"){
      approach <- "Pruned Minimax"
    } else if(approach == "pruned_minmax_learning"){
      approach <- "Pruned Minimax + Learning Rules"
    } else {
      approach <- "ILASP"
    }
    mean <- x$results$average_build
    sd <- x$results$std
    return(c(size,game,approach,mean,sd))
  })
  hold <- data.frame(do.call(rbind,hold))
  names(hold) <- c("size","game","approach","mean","sd")
  hold[,4] <- as.numeric(levels(hold[,4])[hold[,4]])
  hold[,5] <- as.numeric(levels(hold[,5])[hold[,5]])
  hold$size <- factor(hold$size, levels=rev(levels(hold$size)))
  # change naming for latex
  levels(hold$approach) <- gsub("\\_","\\\\_",levels(hold$approach))
  # make first variant
  tikz("bar_build_1.tex", width=18, height=12, standAlone = TRUE)
  g <- ggplot(hold,aes(x=game,y=mean)) +
    geom_bar(stat="identity",fill="red",color="black",width=0.4,alpha=0.6) +
    geom_errorbar(aes(ymin=mean-sd,ymax=mean+sd),color="black",width=0.1) +
    xlab("\nGame") +
    ylab("Build Time [ms]\n") +
    theme_bw() +
    theme(text = element_text(size=25),
          plot.title = element_text(hjust=0.5),
          legend.position = "none") +
    facet_grid(size ~ approach,scales="free_y")
  print(g)
  dev.off()
  texi2pdf("bar_build_1.tex",clean=TRUE)
  file.remove("bar_build_1.tex")
  file.rename("bar_build_1.pdf","./img/bar_build_1.pdf")
  # make second variant
  tikz("bar_build_2.tex", width=18, height=12, standAlone = TRUE)
  g <- ggplot(hold,aes(x=size,y=mean,group=1)) +
    geom_bar(stat="identity",fill="red",color="black",width=0.4,alpha=0.6) +
    geom_errorbar(aes(ymin=mean-sd,ymax=mean+sd),color="black",width=0.1) +
    stat_summary(fun.y=sum, geom="line",alpha=0.6,linetype="dashed") +
    xlab("\nGame Size") +
    ylab("Build Time [ms]\n") +  theme_bw() +
    theme(text = element_text(size=25),
          plot.title = element_text(hjust=0.5),
          legend.position = "none") +
    facet_grid(game ~ approach, scales="free_y")
  print(g)
  dev.off()
  texi2pdf("bar_build_2.tex",clean=TRUE)
  file.remove("bar_build_2.tex")
  file.rename("bar_build_2.pdf","./img/bar_build_2.pdf")
  # make third variant
  tikz("bar_build_3.tex", width=18, height=12, standAlone = TRUE)
  g <- ggplot(hold,aes(x=approach,y=mean,group=1)) +
    geom_bar(stat="identity",fill="red",color="black",width=0.4,alpha=0.6) +
    geom_errorbar(aes(ymin=mean-sd,ymax=mean+sd),color="black",width=0.1) +
    stat_summary(fun.y=sum, geom="line",alpha=0.6,linetype="dashed") +
    xlab("\nLearning Approach") +
    ylab("Build Time [ms]\n") +  theme_bw() +
    scale_x_discrete(labels=c("Minimax","Pruned\nMinimax","Pruned Minimax\n+\nLearning Rules")) +
    theme(text = element_text(size=25),
          plot.title = element_text(hjust=0.5),
          legend.position = "none") +
    facet_grid(size ~ game, scales="free_y")
  print(g)
  dev.off()
  texi2pdf("bar_build_3.tex",clean=TRUE)
  file.remove("bar_build_3.tex")
  file.rename("bar_build_3.pdf","./img/bar_build_3.pdf")
}

# main command
if(file.exists("./benchmarks/build.json")){
  plot_build()
}
