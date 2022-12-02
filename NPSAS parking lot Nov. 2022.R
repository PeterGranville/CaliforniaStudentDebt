library(dplyr)
library(ggplot2)
library(reshape2)
library(data.table)


R1.1 <- read.csv("PowerStats gdzwit.csv", header=FALSE, skip=10, nrow=1)
R1.2 <- read.csv("PowerStats gdzwit.csv", header=FALSE, skip=12, nrow=7)
R1.1[1, 1] <- "Statewide"
R1 <- rbind(R1.1, R1.2) %>% filter(V2 != "‡")
R1$V2 <- as.numeric(R1$V2)
names(R1) <- c("Group", "Average cumulative federal loans")
ggplot(data=R1, mapping=aes(x=`Average cumulative federal loans`, y=Group, fill=Group)) + geom_bar(stat="identity") + scale_x_continuous(label=scales::dollar) + scale_fill_brewer(palette="Dark2") + theme(legend.position="none")



####################

npsas3.US.allGrad <- read.csv("Powerstats_vcbaev.csv", skip=12, nrow=7, header=FALSE)
npsas3.CA.allGrad <- read.csv("Powerstats_yyevut.csv", skip=12, nrow=7, header=FALSE)
npsas3.US.masters <- read.csv("Powerstats_vcbaev.csv", skip=73, nrow=7, header=FALSE)
npsas3.CA.masters <- read.csv("Powerstats_yyevut.csv", skip=73, nrow=7, header=FALSE)

names(npsas3.US.allGrad) <- c("Group", "Total federal loans")
names(npsas3.CA.allGrad) <- c("Group", "Total federal loans")
names(npsas3.US.masters) <- c("Group", "Total federal loans")
names(npsas3.CA.masters) <- c("Group", "Total federal loans")

npsas3.US.allGrad$State <- rep("U.S.", nrow(npsas3.US.allGrad))
npsas3.CA.allGrad$State <- rep("CA", nrow(npsas3.CA.allGrad))
npsas3.US.masters$State <- rep("U.S.", nrow(npsas3.US.masters))
npsas3.CA.masters$State <- rep("CA", nrow(npsas3.CA.masters))

npsas3.US.allGrad$Level <- rep("All graduate programs", nrow(npsas3.US.allGrad))
npsas3.CA.allGrad$Level <- rep("All graduate programs", nrow(npsas3.CA.allGrad))
npsas3.US.masters$Level <- rep("Master's programs", nrow(npsas3.US.masters))
npsas3.CA.masters$Level <- rep("Master's programs", nrow(npsas3.CA.masters))

npsas3 <- rbind(npsas3.US.allGrad, 
                npsas3.CA.allGrad, 
                npsas3.US.masters, 
                npsas3.CA.masters)

npsas3$Group[npsas3$Group=="Black or African American"] <- "Black"
npsas3$Group[npsas3$Group=="Hispanic or Latino"] <- "Latino/a"
npsas3$Group[npsas3$Group=="More than one race"] <- "2+ races"
npsas3 <- npsas3 %>% filter((Group %in% c("American Indian or Alaska Native", "Native Hawaiian/other Pacific Islander", "2+ races"))==FALSE)

npsas3$`Total federal loans` <- gsub(pattern="!", x=npsas3$`Total federal loans`, replacement="")
npsas3$`Total federal loans` <- gsub(pattern=",", x=npsas3$`Total federal loans`, replacement="")
npsas3$`Total federal loans` <- gsub(pattern=" ", x=npsas3$`Total federal loans`, replacement="")
npsas3$`Total federal loans` <- as.numeric(npsas3$`Total federal loans`)

ggplot(data=npsas3, mapping=aes(x=State, y=`Total federal loans`, fill=State)) + geom_bar(stat="identity", position="dodge", width=0.6) + labs(title="Average fed. loans for graduate students by group and level: CA vs U.S.", caption="Groups not shown lacked sufficient samples.") + facet_grid(Level ~ Group) + scale_y_continuous(labels=scales::dollar_format()) + scale_fill_brewer(palette="Dark2") + theme(legend.position="none")

# For the purposes of the report: 
npsas4 <- npsas3 %>% filter(Level=="All graduate programs")
ggplot(data=npsas3, mapping=aes(x=State, y=`Total federal loans`, fill=State)) + geom_bar(stat="identity", position="dodge", width=0.6) + facet_grid(. ~ Group) + scale_y_continuous(labels=scales::dollar_format()) + scale_fill_brewer(palette="Dark2") + theme(legend.position="none")

