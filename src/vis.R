#!/usr/bin/env Rscript
# -*- coding: utf-8 -*-

library(tools)
library(rjson)
library(ggplot2)
library(tikzDevice)
library(reshape2)
library(optparse)

plot_build <- function(name="build.json"){
  # get main data
  hold <- fromJSON(file=paste0("./benchmarks/",name))
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

plot_vs <- function(name="vs.json"){
  # get main data
  hold <- fromJSON(file=paste0("./benchmarks/",name))
  hold <- lapply(hold, function(x) {
    game <- x$args$game_name
    if(game == "nim"){
      game <- "Nim"
    } else if(game == "ttt") {
      game <- "TTT"
    }
    pA_style = x$args$pA_style
    pB_style = gsub("\\-.\\.(lp|json)$","",x$args$pB_style)
    size <- gsub(".*\\-(.)\\.(lp|json)$","\\1",x$args$pB_style)
    # NOTE assumption that all the non-random information
    # occurs in pB_style
    if(pA_style != "random"){
      return(NULL)
    } else {
      pA_style <- "Random"
      if(pB_style == "minmax"){
        approach <- "Minimax"
      } else if(pB_style == "pruned_minmax"){
        approach <- "Pruned Minimax"
      } else if(pB_style == "pruned_minmax-rule"){
        approach <- "Pruned Minimax + Learning Rules"
      } else {
        approach <- "ILASP"
      }
      pA_wins <- x$results$a$wins
      pA_response_mean <- x$results$a$average_response
      pA_response_sd <- x$results$a$std
      pB_wins <- x$results$b$wins
      pB_response_mean <- x$results$b$average_response
      pB_response_sd <- x$results$b$std
      return(c(game,pA_style,approach,size,pA_wins,
               pA_response_mean,pA_response_sd,
               pB_wins,pB_response_mean,pB_response_sd))
    }
  })
  hold <- data.frame(do.call(rbind,hold))
  names(hold) <- c("game","pA","pB","size","pA_wins",
                   "pA_mean","pA_sd","pB_wins","pB_mean","pB_sd")
  for(i in 5:ncol(hold)){
    hold[,i] <- as.numeric(levels(hold[,i])[hold[,i]])
  }
  test <- melt(hold,measure.vars=c("pA_mean","pB_mean"))
  names(test)[ncol(test)-1] <- "response_var"
  names(test)[ncol(test)] <- "response"
  hold <- melt(hold,measure.vars=c("pA_wins","pB_wins"))
  names(hold)[ncol(hold)-1] <- "wins_var"
  names(hold)[ncol(hold)] <- "wins"
  hold <- hold[,-c(5,7)]
  hold <- cbind(hold,test[c("response_var","response")])
  hold$size <- factor(hold$size, levels=c("S","M","L"))
  # add dummy data if any data is missing
  if(length(which(hold[,3] == "Pruned Minimax")) == 0){
    hold <- rbind(hold,hold[1,])
    levels(hold[,3]) <- c(levels(hold[,3]),"Pruned Minimax")
    hold[nrow(hold),3] <- "Pruned Minimax"
    hold[nrow(hold),"wins"] <- NA
  }
  # change naming for latex
  levels(hold$pB) <- gsub("\\_","\\\\_",levels(hold$pB))
  hold[,3] <- factor(hold[,3], levels = c("Minimax", "Pruned Minimax", "Pruned Minimax + Learning Rules"))
  # make first variant
  tikz("bar_vs_1.tex", width=20, height=12, standAlone = TRUE)
  g <- ggplot(hold,aes(x=size,y=wins,fill=response,color=wins_var)) +
    geom_bar(stat="identity",width=0.1,alpha=0.6) +
    xlab("\nTraining size") +
    ylab("Wins\n") +
    theme_bw() +
    theme(text = element_text(size=25),
          plot.title = element_text(hjust=0.5)) +
    scale_fill_viridis_c("Mean Response\nTime [ms]") +
    scale_color_manual("Bar-plot\norder",values=c("black","black"),labels=c("Random player",
                                                          "Non-random player")) +
    guides(fill = guide_colourbar(barwidth = 2.0, barheight = 20)) +
    facet_grid(game + pA ~ pB,scales="free_y")
  print(g)
  dev.off()
  texi2pdf("bar_vs_1.tex",clean=TRUE)
  file.remove("bar_vs_1.tex")
  file.rename("bar_vs_1.pdf","./img/bar_vs_1.pdf")
  # make second variant
  tikz("bar_vs_2.tex", width=20, height=12, standAlone = TRUE)
  g <- ggplot(hold,aes(x=game,y=wins,fill=response,color=wins_var)) +
    geom_bar(stat="identity",width=0.1,alpha=0.6) +
    xlab("\nGame") +
    ylab("Wins\n") +
    theme_bw() +
    theme(text = element_text(size=25),
          plot.title = element_text(hjust=0.5)) +
    scale_fill_viridis_c("Mean Response\nTime [ms]") +
    scale_color_manual("Bar-plot\norder",values=c("black","black"),labels=c("Random player",
                                                                            "Non-random player")) +
    guides(fill = guide_colourbar(barwidth = 2.0, barheight = 20)) +
    facet_grid(size + pA ~ pB,scales="free_y")
  print(g)
  dev.off()
  texi2pdf("bar_vs_2.tex",clean=TRUE)
  file.remove("bar_vs_2.tex")
  file.rename("bar_vs_2.pdf","./img/bar_vs_2.pdf")
  # make third variant
  tikz("bar_vs_3.tex", width=24, height=12, standAlone = TRUE)
  g <- ggplot(hold,aes(x=pB,y=wins,fill=response,color=wins_var)) +
    geom_bar(stat="identity",width=0.1,alpha=0.6) +
    xlab("\nLearning Approach") +
    ylab("Wins\n") +
    theme_bw() +
    theme(text = element_text(size=25),
          plot.title = element_text(hjust=0.5)) +
    scale_fill_viridis_c("Mean Response\nTime [ms]") +
    scale_color_manual("Bar-plot\norder",values=c("black","black"),labels=c("Random player",
                                                                            "Non-random player")) +
    scale_x_discrete(labels=c("Minimax","Pruned\nMinimax","Pruned Minimax\n+\nLearning Rules")) +
    guides(fill = guide_colourbar(barwidth = 2.0, barheight = 20)) +
    facet_grid(game + pA ~ size,scales="free_y")
  print(g)
  dev.off()
  texi2pdf("bar_vs_3.tex",clean=TRUE)
  file.remove("bar_vs_3.tex")
  file.rename("bar_vs_3.pdf","./img/bar_vs_3.pdf")
  # clear pngs
  lapply(list.files(pattern="ras\\d+\\.png$"),file.remove)
}

# main command
if(file.exists("./benchmarks/build.json")){
  plot_build()
}
if(file.exists("./benchmarks/vs.json")){
  plot_vs()
}
