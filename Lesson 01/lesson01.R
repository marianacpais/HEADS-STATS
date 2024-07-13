# The BMD_weight.sav database contains 190 densitometry records. Using this data:

library("haven")
library("dplyr")
library("lm.beta")

db_fp <- "Lesson 01/BMD_weight.sav"
db <- read_sav(db_fp)
str(db)
db$Medication <- haven::as_factor(db$Medication)

# a) Calculate the body mass index.
calc_bmi <- function(peso, altura) {
  bmi = peso/(altura/100)**2
  round(bmi,2)
}

db <- db %>% mutate(bmi=calc_bmi(peso, altura))

# b) Calculate the mean and standard deviation of total bone mineral density (BMDTOT).

hist(db$bmdtot)
mean(db$bmdtot, na.rm=TRUE)
sd(db$bmdtot, na.rm=TRUE)

# c) Analyze the relationship between bone mineral density and BMI using linear regression.

# Diagrama de dispersão
plot(db$bmi, db$bmdtot)
cor.test(db$bmi, db$bmdtot, method="pearson")
# r=0.3083195; p<0.001 (nota: este é um teste pouco informativo)

model1 <- lm(bmdtot~bmi, data=db)
summary(model1)
confint(model1)
anova(model1)

# Por cada aumento de unidade de IMC o BMDTOT aumenta, em média 0.009 (0.005-0.012) unidades.

# d) Compare the BMDTOT average according to the type of medication, adjusting for BMI and age.

db_Med0 <- db %>% filter(Medication == "No medication")
db_Med1 <- db %>% filter(Medication == "Glucocorticoids")
db_Med2 <- db %>% filter(Medication == "Anticonvulsant")

model2 <- lm(bmdtot~bmi+idade+Medication, data=db)
model2_1 <- lm(bmdtot~bmi+idade, data=db_Med0)
model2_2 <- lm(bmdtot~bmi+idade, data=db_Med1)
model2_3 <- lm(bmdtot~bmi+idade, data=db_Med2)

summary(model2)
summary(model2_1)
summary(model2_2)
summary(model2_3)

# e) Check the assumptions for the model used in d).

lm.beta(model2)

## 1. Linearidade
par(mfrow=c(2,2))
plot(model2, cook.levels=c(0.25, 0.5, 1))
par(mfrow=c(1,1))

plot(model2_1$fitted.values, residuals(model2_1), xlab="Valores Ajustados", ylab="Resíduos", main="Modelo 1")
plot(model2_2$fitted.values, residuals(model2_2), xlab="Valores Ajustados", ylab="Resíduos", main="Modelo 2")
plot(model2_3$fitted.values, residuals(model2_3), xlab="Valores Ajustados", ylab="Resíduos", main="Modelo 3")

## 2. Normalidade dos Resíduos
### Q-Q plots
qqnorm(residuals(model1)); qqline(residuals(model2_1)); title("Modelo 1")
qqnorm(residuals(model2_1)); qqline(residuals(model2_1)); title("Modelo 2.1")
qqnorm(residuals(model2_2)); qqline(residuals(model2_2)); title("Modelo 2.2")
qqnorm(residuals(model2_3)); qqline(residuals(model2_3)); title("Modelo 2.3")
### Teste de Shapiro-Wilk
shapiro.test(residuals(model1))
shapiro.test(residuals(model2_1))
shapiro.test(residuals(model2_2))
shapiro.test(residuals(model2_3))

## 3. Homocedasticidade
plot(model1$residuals ~ model1$fitted.values)
abline(h = 0, col = "red")
