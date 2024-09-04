# Author: Sandro Camargo <sandrocamargo@unipampa.edu.br>
# Goal: Experiment to introduce the Central Limit Theorem
# Run the Shapiro Test normality test
# H0: Data come from a normally distributed population
# H1: Data do NOT come from a normally distributed population
# Confidence interval: 95%
# If the Shapiro-Wilk test p-value is less then to 0.05, we should reject H0.
# It means, data do NOT come from a normal distributed population
# data source: https://freakonometrics.hypotheses.org/18859

# clear workspace
rm(list=ls())

# set parameters
saveplots = 0 #Must the plots be saved?

# IMPORTANT: Define your working directory here
# Plots will be saved in this directory
setwd("~/Documents/unipampa/mestrado/disciplinas/bioestatistica/images")

# load dataset
load(url("http://freakonometrics.free.fr/income_500.RData"))

set.seed(1)

if (saveplots) pdf('salarios1.pdf')
hist(income, main="", xlab="Salarios (n=1)", ylab="Frequência")
if (saveplots) dev.off()
shapiro.test(income)

# Compute an average for 10 randomly selected samples.
# Repeat 200 times (i)
# Compute the Shapiro test for these 200 averages
medias10 <- c()
for (i in 1:200)
  medias10 <- c(medias10, mean(sample(income,10)))
if (saveplots) pdf('salarios10.pdf')
hist(medias10, main="", xlab="Salarios (n=10)", ylab="Frequência")
if (saveplots) dev.off()
shapiro.test(medias10)

# Compute an average for 100 randomly selected samples.
# Repeat 200 times (i)
# Compute the Shapiro test for these 200 averages
medias100 <- c()
for (i in 1:200)
  medias100 <- c(medias100, mean(sample(income,100)))
if (saveplots) pdf('salarios100.pdf')
hist(medias100, main="", xlab="Salarios (n=100)", ylab="Frequência")
if (saveplots) dev.off()
shapiro.test(medias100)

# Compute an average for 250 randomly selected samples.
# Repeat 200 times (i)
# Compute the Shapiro test for these 200 averages
medias250 <- c()
for (i in 1:200)
  medias250 <- c(medias250, mean(sample(income,250)))
if (saveplots) pdf('salarios250.pdf')
hist(medias250, main="", xlab="Salarios (n=250)", ylab="Frequência")
if (saveplots) dev.off()
shapiro.test(medias250)
# Normal distribution detected!

# The central limit theorem (CLT) states that the distribution of sample 
# means approximates a normal distribution as the sample size gets larger, 
# regardless of the population's distribution