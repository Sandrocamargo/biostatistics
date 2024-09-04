###################################################
# Author: Sandro da Silva Camargo
# Course: Biostatistics
# Federal University of Pampa - Bage - PPGCAP
#
# This script presents the basic concepts about variables and
# examples about descriptive statistics
###################################################

#cleaning the environment
rm(list=ls())

# Instalação de pacotes
install.packages("psych")

# carregar pacotes
library(psych)

# data Information
# https://archive.ics.uci.edu/ml/datasets/Horse+Colic

# Importando dados
data <- read.csv(url("https://archive.ics.uci.edu/ml/machine-learning-databases/horse-colic/horse-colic.data"))
dim(data)
head(data)

# Definindo Parâmetros da importação de dados
data <- read.csv(url("https://archive.ics.uci.edu/ml/machine-learning-databases/horse-colic/horse-colic.data"), sep="", na="?", header=FALSE)
dim(data)
head(data)

# Definindo nomes de colunas
colnames(data) <- c("Surgery", "Age", "HospNumb", "RectalTemperature","Pulse","RespiratoryRate")
head(data)

#Acessando colunas
data$Pulse  # Mostra coluna pulso
data$Age    # Mostra coluna idade
data[1,1]   # Mostra valor na linha 1, coluna 1
data[1,]    # Mostra valores na linha 1
data[,1]    # Mostra valores na coluna 1
data[5:10, c(1,3)]  # Mostra valores das linhas 5 a 10, das colunas 1 e 3

# Estatisticas Descritivas
# Medidas de posição ou tendência Central
summary(data)		# Mostra o resumo de 5 valores de toda a base de dados
summary(data$Pulse)		# Mostra o resumo de 5 valores 
boxplot(data$Pulse)		# Cria o boxplot 
mean(data$Pulse)		# Média
mean(data$Pulse, na.rm = TRUE)	# Média ignorando dados NA (dados faltantes)
median(data$Pulse, na.rm = TRUE)	# Mediana ignorando dados NA
min(data$Pulse, na.rm = TRUE)	# Valor mínimo ignorando dados NA
max(data$Pulse, na.rm = TRUE)	# Valor máximo ignorando dados NA

# Medidas de separação
quantile(data$Pulse, na.rm = TRUE, probs = 0.25) # Primeiro quartil (25%)
quantile(data$Pulse, na.rm = TRUE, probs = 0.75) # Terceiro quartil (75%)
quantile(data$Pulse, na.rm = TRUE, probs = 0.1)  # Primeiro decil (10%)

# Criando uma função para calcular a moda
getmode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}
getmode(data$Pulse)		# Mostra a moda

# Medidas de dispersão
range(data$Pulse, na.rm = TRUE) 	# Amplitude
var(data$Pulse, na.rm = TRUE) 	# Variância
sd(data$Pulse, na.rm = TRUE) 	# Desvio Padrão

#Distribuição normal
amostras <- rnorm(100, mean=200, sd=sqrt(400))
hist(amostras)
hist(amostras,breaks=3)
hist(amostras, main="Histograma de Exemplo Dist Normal", xlab="Nível de Colesterol", ylab="Frequência")
hist(rnorm(100, mean=200, sd=sqrt(400)), freq=FALSE)

