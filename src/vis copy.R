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
      approach <- "Pruned\nMinimax\nTree"
    } else if(approach == "pruned_minmax_learning"){
      approach <- "Pruned\nMinimax\nRules"
    } else if(approach == "ilasp"){
      approach <- "ILASP"
    }
    mean <- x$results$average_build
    sd <- x$results$std
    return(c(size,game,approach,mean,sd))
  })
  hold <- data.frame(do.call(rbind,hold))
  names(hold) <- c("size","game","approach","mean","sd")
  hold[,4] <- as.numeric(levels(hold[,4])[hold[,4]])/1000
  hold[,5] <- as.numeric(levels(hold[,5])[hold[,5]])/1000
  hold$size <- factor(hold$size, levels=rev(levels(hold$size)))
  # make third variant
  tikz("bar_build_3.tex", width=18, height=12, standAlone = TRUE)
  print(aes(x=approach,y=mean,group=1))
  g <- ggplot(hold,aes(x=approach,y=mean,group=1)) +
    geom_bar(stat="identity",fill="red",color="black",width=0.4,alpha=0.3) +
    geom_errorbar(aes(ymin=mean-sd,ymax=mean+sd),color="black",width=0.1) +
    stat_summary(fun.y=sum, geom="line",alpha=0.6,linetype="dashed") +
    xlab("\nLearning Approach") +
    ylab("Build Time [s]\n") +  theme_bw() +
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

plot_vs <- function(name="vs_full_time.json"){
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
      } else if(pB_style == "pruned_minmax-tree"){
        approach <- "Pruned\nMinimax\nTree"
      } else if(pB_style == "pruned_minmax-rule"){
        approach <- "Pruned\nMinimax\nRules"
      } else if(pB_style == "ilasp"){
        approach <- "ILASP"
      } else{
        print(pB_style)
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
  test <- melt(hold,measure.vars=c("pB_mean"))
  names(test)[ncol(test)-1] <- "response_var"
  names(test)[ncol(test)] <- "response"
  hold <- melt(hold,measure.vars=c("pB_wins"))
  names(hold)[ncol(hold)-1] <- "wins_var"
  names(hold)[ncol(hold)] <- "wins"
  hold <- hold[,-c(5,7)]
  hold <- cbind(hold,test[c("response_var","response")])
  hold$size <- factor(hold$size, levels=c("S","M","L"))
  # change naming for latex
  levels(hold$pB) <- gsub("\\_","\\\\_",levels(hold$pB))
#  hold[,3] <- factor(hold[,3], levels = c("Minimax", "Pruned Minimax", "Pruned Minimax + Learning Rules"))
  
  # make third variant
  tikz("bar_vs_3.tex", width=26, height=12, standAlone = TRUE)
  g <- ggplot(hold,aes(x=pB,y=wins,fill=response,color=wins_var)) +
    geom_bar(stat="identity",width=0.1,alpha=0.6) +
    xlab("\nLearning Approach") +
    ylab("Wins vs Random\n") +
    theme_bw() +
    theme(text = element_text(size=25),
          plot.title = element_text(hjust=0.5)) +
    scale_fill_viridis_c("Mean Response\nTime [ms]",guide = "colourbar",alpha=0.6) +
    scale_fill_gradient(low= "#FBDFDF", high= "#F90303")+
    scale_color_manual("Bar-plot\norder",values=c("black"),labels=c("Approach")) +
    guides(fill = guide_colourbar(barwidth = 2.0, barheight = 20)) +
    facet_grid(game ~ size,scales="free_y")
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
