pacman::p_load(conflicted, tidyverse, wrappedtools, patchwork)
# x11()
n_boot <- 10^3
n <- 20
mysample <- rnorm(n,100,15)
meansd(mysample)
boot_desc <- tibble(i=1:n_boot, mean=NA_real_,sd=NA_real_)
for(loop_i in seq_len(n_boot)){
  boot_sample <- sample(mysample, n, replace = TRUE)
  boot_desc$mean[loop_i] <- mean(boot_sample)
  boot_desc$sd[loop_i] <- sd(boot_sample)
  meanplot <- boot_desc |> 
    ggplot(aes(mean))+
    geom_histogram(binwidth = 1)+
    scale_x_continuous(limits = c(80,120))
  sdplot <- boot_desc |> 
    ggplot(aes(sd))+
    geom_histogram(binwidth = .5)+
    scale_x_continuous(limits = c(0,20))
  print(meanplot/sdplot)
  # Sys.sleep(.1)
}
