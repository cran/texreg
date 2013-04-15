### R code from vignette source 'texreg.Rnw'
### Encoding: UTF-8

###################################################
### code chunk number 1: texreg.Rnw:105-106 (eval = FALSE)
###################################################
## install.packages("texreg")


###################################################
### code chunk number 2: texreg.Rnw:109-110 (eval = FALSE)
###################################################
## install.packages("texreg", repos="http://R-Forge.R-project.org")


###################################################
### code chunk number 3: texreg.Rnw:114-115
###################################################
library(texreg)


###################################################
### code chunk number 4: texreg.Rnw:118-119 (eval = FALSE)
###################################################
## update.packages("texreg", repos="http://R-Forge.R-project.org")


###################################################
### code chunk number 5: texreg.Rnw:126-127
###################################################
vignette("texreg")


###################################################
### code chunk number 6: texreg.Rnw:130-131
###################################################
help(package="texreg")


###################################################
### code chunk number 7: texreg.Rnw:134-135
###################################################
help(texreg)


###################################################
### code chunk number 8: texreg.Rnw:143-149
###################################################
ctl <- c(4.17,5.58,5.18,6.11,4.50,4.61,5.17,4.53,5.33,5.14)
trt <- c(4.81,4.17,4.41,3.59,5.87,3.83,6.03,4.89,4.32,4.69)
group <- gl(2,10,20, labels = c("Ctl","Trt"))
weight <- c(ctl, trt)
m1 <- lm(weight ~ group)
m2 <- lm(weight ~ group - 1) # omitting intercept


###################################################
### code chunk number 9: texreg.Rnw:152-153
###################################################
summary(m2)


###################################################
### code chunk number 10: texreg.Rnw:157-159
###################################################
library(texreg)
texreg(m2, booktabs = TRUE, dcolumn = TRUE)


###################################################
### code chunk number 11: texreg.Rnw:161-163
###################################################
texreg(m2, use.packages = FALSE, label = "tab:1", booktabs = TRUE, 
    dcolumn = TRUE, float.pos = "p")


###################################################
### code chunk number 12: texreg.Rnw:169-171
###################################################
tab <- texreg(m2, return.string = TRUE)
cat(tab)


###################################################
### code chunk number 13: texreg.Rnw:176-178 (eval = FALSE)
###################################################
## texreg(list(m1, m2), booktabs = TRUE, dcolumn = TRUE, 
##     caption = "Multiple models")


###################################################
### code chunk number 14: texreg.Rnw:180-183
###################################################
texreg(list(m1, m2), booktabs = TRUE, dcolumn = TRUE, 
    use.packages = FALSE, label = "tab:2", float.pos = "p", 
    caption = "Multiple models")


###################################################
### code chunk number 15: texreg.Rnw:198-204
###################################################
texreg(list(m1, m2), booktabs = TRUE, dcolumn = TRUE, 
    use.packages = FALSE, label = "tab:3", 
    caption = "Custom coefficient and model names", 
    custom.coef.names = c("(Intercept)",  "Treatment", "Control"), 
    custom.model.names = c("First model", "Second model"), 
    float.pos = "p")


###################################################
### code chunk number 16: texreg.Rnw:217-219
###################################################
mat <- rbinom(400, 1, 0.16)  #create a matrix
mat <- matrix(mat, nrow = 20)


###################################################
### code chunk number 17: texreg.Rnw:223-229
###################################################
library(network)
library(ergm)
nw <- network(mat)
m4 <- ergm(nw ~ edges)
m5 <- ergm(nw ~ edges + mutual)
m6 <- ergm(nw ~ edges + mutual + twopath)


###################################################
### code chunk number 18: texreg.Rnw:234-238
###################################################
texreg(list(m4, m5, m6), use.packages = FALSE, label = "tab:4", 
    booktabs = TRUE, dcolumn = TRUE, float.pos = "p", 
    caption = "Centered dots for weak significance", 
    stars = c(0.001, 0.01, 0.05, 0.1))


###################################################
### code chunk number 19: texreg.Rnw:246-249
###################################################
texreg(list(m4, m5, m6), use.packages = FALSE, label = "tab:5", 
    booktabs = TRUE, dcolumn = TRUE, single.row = TRUE, 
    float.pos = "p", caption = "In a single row")


###################################################
### code chunk number 20: texreg.Rnw:256-258
###################################################
library(nlme)
m3 <- lme(distance ~ age + Sex, data = Orthodont, random = ~ 1)


###################################################
### code chunk number 21: texreg.Rnw:260-263
###################################################
texreg(list(m3, m2, m6), label = "tab:6", use.packages = FALSE, 
    booktabs = TRUE, dcolumn = TRUE, 
    caption = "Mixing different kinds of models")


###################################################
### code chunk number 22: texreg.Rnw:277-278
###################################################
htmlreg(list(m3, m2, m6))


###################################################
### code chunk number 23: texreg.Rnw:285-288
###################################################
htmlreg(list(m3, m2, m6), file = "mytable.doc", inline.css = FALSE, 
    doctype = TRUE, html.tag = TRUE, head.tag = TRUE, 
    body.tag = TRUE)


###################################################
### code chunk number 24: texreg.Rnw:297-298
###################################################
htmlreg(list(m3, m2, m6), star.symbol = "\\*", center = TRUE)


###################################################
### code chunk number 25: texreg.Rnw:304-305
###################################################
screenreg(list(m3, m2, m6))


