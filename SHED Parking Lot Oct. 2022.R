library(dplyr)
library(knitr)
library(scales)
library(stringr)
library(ggplot2)
library(data.table)
library(reshape2)

shed21 <- fread("SHED-2021.csv", header=TRUE, select=c("CaseID", "weight_pop", "ppstaten", "ppethm", "ppgender", "B2", "B6", "GH1", "A6", "A1_a", "C3", "C4A", "ED0", "ED5", "ED6_a", "ED6_b", "ED6_c", "ED6_d", "SL1", "SL2_a", "SL2_b", "SL2_c", "SL2_d", "SL3", "SL4", "SL6", "SL7", "SL8_a", "SL8_b", "SL8_c", "SL8_d", "SL8_e", "SL10", "SL11", "SL12_a", "SL12_b", "SL12_c", "SL12_d", "D1I", "K0", "I0_c", "I0_d", "I40", "I41_a", "I41_b", "I41_c", "I41_d", "I41_e", "EF1", "EF2", "EF3_a", "EF3_b", "EF3_c", "EF3_d", "EF3_e", "EF3_f", "EF3_g", "EF3_h", "EF5A", "EF5B", "EF6A_a", "EF6A_b", "EF6A_f", "EF6B_f", "ppcm0160", "ppfs0596", "ppfs1482", "iclevel", "control", "L0_b"))

shed20 <- fread("SHED-2020.csv", header=TRUE, select=c("CaseID", "weight_pop", "ppstaten", "ppethm", "ppgender", "B2", "B6", "GH1", "A6", "A1_a", "C3", "C4A", "ED0", "ED5", "ED6_a", "ED6_b", "ED6_c", "ED6_d", "SL1", "SL2_a", "SL2_b", "SL2_c", "SL2_d", "SL3", "SL4", "SL6", "SL7", "SL8_a", "SL8_b", "SL8_c", "SL8_d", "SL8_e", "SL10", "SL11", "SL12_a", "SL12_b", "SL12_c", "SL12_d", "D1I", "K0", "I0_c", "I0_d", "I40", "I41_a", "I41_b", "I41_c", "I41_d", "I41_e", "EF1", "EF2", "EF3_a", "EF3_b", "EF3_c", "EF3_d", "EF3_e", "EF3_f", "EF3_g", "EF3_h", "EF5A", "EF5B", "EF6A_a", "EF6A_b", "EF6A_f", "EF6B_f", "ppcm0160", "ppfs0596", "ppfs1482", "iclevel", "control", "L0_b"))

shed19 <- fread("SHED-2019.csv", header=TRUE, select=c("CaseID", "weight_pop", "ppstaten", "ppethm", "ppgender", "B2", "B6", "GH1", "A6", "A1_a", "C3", "C4A", "ED0", "ED5", "ED6_a", "ED6_b", "ED6_c", "ED6_d", "SL1", "SL2_a", "SL2_b", "SL2_c", "SL2_d", "SL3", "SL4", "SL6", "SL7", "SL8_a", "SL8_b", "SL8_c", "SL8_d", "SL8_e", "SL10", "SL11", "SL12_a", "SL12_b", "SL12_c", "SL12_d", "D1I", "K0", "I0_c", "I0_d", "I40", "I41_a", "I41_b", "I41_c", "I41_d", "I41_e", "FS20_b", "EF1", "EF2", "EF3_a", "EF3_b", "EF3_c", "EF3_d", "EF3_e", "EF3_f", "EF3_g", "EF3_h", "EF5A", "EF5B", "EF6A_a", "EF6A_b", "EF6A_f", "EF6B_f", "ppcm0160", "ppfs0596", "ppfs1482", "iclevel", "control", "L0_b"))

shed18 <- fread("SHED-2018.csv", header=TRUE, select=c("CaseID", "weight2b", "ppstaten", "ppethm", "ppgender", "B2", "B6", "GH1", "A6", "A1_a", "C3", "C4A", "ED0", "ED5",  "ED6_a", "ED6_b", "ED6_c", "ED6_d", "SL1", "SL2_a", "SL2_b", "SL2_c", "SL2_d",  "SL3", "SL4", "SL6", "SL7", "SL8_a", "SL8_b", "SL8_c", "SL8_d", "SL8_e", "SL10", "SL11", "SL12_a", "SL12_b", "SL12_c", "SL12_d", "D1I", "K0", "I0_c", "I0_d", "I40", "I41_a", "I41_b", "I41_c", "I41_d", "I41_e", "FS20_b", "EF1", "EF2", "EF3_a", "EF3_b", "EF3_c", "EF3_d", "EF3_e", "EF3_f", "EF3_g", "EF3_h", "EF5A", "EF5B", "EF6A_a", "EF6A_b", "EF6A_f", "EF6B_f", "ppcm0160", "ppfs0596", "iclevel", "control", "L0_b"))

shed17 <- fread("SHED-2017.csv", header=TRUE, select=c("CaseID", "weight3b", "ppstaten", "ppethm", "ppgender", "B2", "B6", "GH1", "A6", "A1_a", "C3", "C4A", "ED0", "ED5", "ED6_a", "ED6_b", "ED6_c", "ED6_d", "SL1", "SL2_a", "SL2_b", "SL2_c", "SL2_d", "SL3", "SL4", "SL6", "SL7", "SL8_a", "SL8_b", "SL8_c", "SL8_d", "SL8_e", "SL10", "SL11", "SL12_a", "SL12_b", "SL12_c", "SL12_d", "D1I", "K0", "I0_c", "I0_d", "I40", "I41_a", "I41_b", "I41_c", "I41_d", "I41_e", "FS20_b", "EF1", "EF2", "EF3_a", "EF3_b", "EF3_c", "EF3_d", "EF3_e", "EF3_f", "EF3_g", "EF3_h", "EF5A", "EF5B", "EF6A_a", "EF6A_b", "EF6A_f", "EF6B_f", "ppcm0160", "ppfs0596", "control", "L0_b"))

shed16 <- fread("SHED-2016.csv", header=TRUE, select=c("CaseID", "weight3b", "ppstaten", "ppethm", "ppgender", "B2", "B6", "GH1", "A6", "A1_a", "C3", "C4A", "ED0", "ED5", "ED6_a", "ED6_b", "ED6_c", "ED6_d", "SL1", "SL2_a", "SL2_b", "SL2_c", "SL2_d", "SL3_TOTAL",  "SL4", "SL6", "SL7", "SL8_a", "SL8_b", "SL8_c", "SL8_d", "SL8_e", "SL10", "SL11", "SL12_a", "SL12_b", "SL12_c", "SL12_d", "D1_i", "I0_e", "I4A", "EF1", "EF2", "EF3_a", "EF3_b", "EF3_c", "EF3_d", "EF3_e", "EF3_f", "EF3_g", "EF3_h", "EF5A", "EF5B", "ppcm0160", "ppfs0596", "C1", "L0_b"))

shed15 <- fread("SHED-2015.csv", header=TRUE, select=c("CaseID", "weight3b", "ppstaten", "ppethm", "ppgender", "B2", "B6", "GH1", "A6", "A1_a", "C4A", "ED0", "ED5", "ED6A_a", "ED6A_b", "ED6A_c", "ED6A_d", "SL1", "SL2_a", "SL2_b", "SL2_c", "SL2_d", "SL3_TOTAL", "SL4", "SL6", "SL7", "SL8_a", "SL8_b", "SL8_c", "SL8_d", "SL8_e", "SL10", "SL11", "D2", "I0_e", "I4A", "EF1", "EF2", "EF3_a", "EF3_b", "EF3_c", "EF3_d", "EF3_e", "EF3_f", "EF3_g", "EF3_h", "ppcm0160", "ppfs0596", "C1", "sector", "control", "D0_b"))

shed21$Weight <- shed21$weight_pop
shed20$Weight <- shed20$weight_pop
shed19$Weight <- shed19$weight_pop
shed18$Weight <- shed18$weight2b
shed17$Weight <- shed17$weight3b
shed16$Weight <- shed16$weight3b
shed15$Weight <- shed15$weight3b

shed21$State <- shed21$ppstaten
shed20$State <- shed20$ppstaten
shed19$State <- shed19$ppstaten
shed18$State <- shed18$ppstaten
shed17$State <- shed17$ppstaten
shed16$State <- shed16$ppstaten
shed15$State <- shed15$ppstaten

shed21$Race <- shed21$ppethm
shed20$Race <- shed20$ppethm
shed19$Race <- shed19$ppethm
shed18$Race <- shed18$ppethm
shed17$Race <- shed17$ppethm
shed16$Race <- shed16$ppethm
shed15$Race <- shed15$ppethm

shed21$Gender <- shed21$ppgender
shed20$Gender <- shed20$ppgender
shed19$Gender <- shed19$ppgender
shed18$Gender <- shed18$ppgender
shed17$Gender <- shed17$ppgender
shed16$Gender <- shed16$ppgender
shed15$Gender <- shed15$ppgender

shed21$FinManage <- shed21$B2
shed20$FinManage <- shed20$B2
shed19$FinManage <- shed19$B2
shed18$FinManage <- shed18$B2
shed17$FinManage <- shed17$B2
shed16$FinManage <- shed16$B2
shed15$FinManage <- shed15$B2

shed21$ParComp <- shed21$B6
shed20$ParComp <- shed20$B6
shed19$ParComp <- shed19$B6
shed18$ParComp <- shed18$B6
shed17$ParComp <- shed17$B6
shed16$ParComp <- shed16$B6
shed15$ParComp <- shed15$B6

shed21$HomeOwn <- shed21$GH1
shed20$HomeOwn <- shed20$GH1
shed19$HomeOwn <- shed19$GH1
shed18$HomeOwn <- shed18$GH1
shed17$HomeOwn <- shed17$GH1
shed16$HomeOwn <- shed16$GH1
shed15$HomeOwn <- shed15$GH1

shed21$CCApprov <- shed21$A6
shed20$CCApprov <- shed20$A6
shed19$CCApprov <- shed19$A6
shed18$CCApprov <- shed18$A6
shed17$CCApprov <- shed17$A6
shed16$CCApprov <- shed16$A6
shed15$CCApprov <- shed15$A6

shed21$CreditDeny <- shed21$A1_a
shed20$CreditDeny <- shed20$A1_a
shed19$CreditDeny <- shed19$A1_a
shed18$CreditDeny <- shed18$A1_a
shed17$CreditDeny <- shed17$A1_a
shed16$CreditDeny <- shed16$A1_a
shed15$CreditDeny <- shed15$A1_a

shed21$UnpaidCC <- shed21$C3
shed20$UnpaidCC <- shed20$C3
shed19$UnpaidCC <- shed19$C3
shed18$UnpaidCC <- shed18$C3
shed17$UnpaidCC <- shed17$C3
shed16$UnpaidCC <- shed16$C3
shed15$UnpaidCC <- rep(NA, nrow(shed15))

shed21$CCBalance <- shed21$C4A
shed20$CCBalance <- shed20$C4A
shed19$CCBalance <- shed19$C4A
shed18$CCBalance <- shed18$C4A
shed17$CCBalance <- shed17$C4A
shed16$CCBalance <- shed16$C4A
shed15$CCBalance <- shed15$C4A

shed21$EdAttain <- shed21$ED0
shed20$EdAttain <- shed20$ED0
shed19$EdAttain <- shed19$ED0
shed18$EdAttain <- shed18$ED0
shed17$EdAttain <- shed17$ED0
shed16$EdAttain <- shed16$ED0
shed15$EdAttain <- shed15$ED0

shed21$EdPayoff1 <- shed21$ED5
shed20$EdPayoff1 <- shed20$ED5
shed19$EdPayoff1 <- shed19$ED5
shed18$EdPayoff1 <- shed18$ED5
shed17$EdPayoff1 <- shed17$ED5
shed16$EdPayoff1 <- shed16$ED5
shed15$EdPayoff1 <- shed15$ED5

shed21$DiffField1 <- shed21$ED6_a
shed20$DiffField1 <- shed20$ED6_a
shed19$DiffField1 <- shed19$ED6_a
shed18$DiffField1 <- shed18$ED6_a
shed17$DiffField1 <- shed17$ED6_a
shed16$DiffField1 <- shed16$ED6_a
shed15$DiffField1 <- shed15$ED6A_a

shed21$DiffSchool1 <- shed21$ED6_b
shed20$DiffSchool1 <- shed20$ED6_b
shed19$DiffSchool1 <- shed19$ED6_b
shed18$DiffSchool1 <- shed18$ED6_b
shed17$DiffSchool1 <- shed17$ED6_b
shed16$DiffSchool1 <- shed16$ED6_b
shed15$DiffSchool1 <- shed15$ED6A_b

shed21$LessEd1 <- shed21$ED6_c
shed20$LessEd1 <- shed20$ED6_c
shed19$LessEd1 <- shed19$ED6_c
shed18$LessEd1 <- shed18$ED6_c
shed17$LessEd1 <- shed17$ED6_c
shed16$LessEd1 <- shed16$ED6_c
shed15$LessEd1 <- shed15$ED6A_c

shed21$MoreEd1 <- shed21$ED6_d
shed20$MoreEd1 <- shed20$ED6_d
shed19$MoreEd1 <- shed19$ED6_d
shed18$MoreEd1 <- shed18$ED6_d
shed17$MoreEd1 <- shed17$ED6_d
shed16$MoreEd1 <- shed16$ED6_d
shed15$MoreEd1 <- shed15$ED6A_d

shed21$OwnDebt <- shed21$SL1
shed20$OwnDebt <- shed20$SL1
shed19$OwnDebt <- shed19$SL1
shed18$OwnDebt <- shed18$SL1
shed17$OwnDebt <- shed17$SL1
shed16$OwnDebt <- shed16$SL1
shed15$OwnDebt <- shed15$SL1

shed21$OwnDebtSL <- shed21$SL2_a
shed20$OwnDebtSL <- shed20$SL2_a
shed19$OwnDebtSL <- shed19$SL2_a
shed18$OwnDebtSL <- shed18$SL2_a
shed17$OwnDebtSL <- shed17$SL2_a
shed16$OwnDebtSL <- shed16$SL2_a
shed15$OwnDebtSL <- shed15$SL2_a

shed21$OwnDebtHE <- shed21$SL2_b
shed20$OwnDebtHE <- shed20$SL2_b
shed19$OwnDebtHE <- shed19$SL2_b
shed18$OwnDebtHE <- shed18$SL2_b
shed17$OwnDebtHE <- shed17$SL2_b
shed16$OwnDebtHE <- shed16$SL2_b
shed15$OwnDebtHE <- shed15$SL2_b

shed21$OwnDebtCC <- shed21$SL2_c
shed20$OwnDebtCC <- shed20$SL2_c
shed19$OwnDebtCC <- shed19$SL2_c
shed18$OwnDebtCC <- shed18$SL2_c
shed17$OwnDebtCC <- shed17$SL2_c
shed16$OwnDebtCC <- shed16$SL2_c
shed15$OwnDebtCC <- shed15$SL2_c

shed21$OwnDebtOther <- shed21$SL2_d
shed20$OwnDebtOther <- shed20$SL2_d
shed19$OwnDebtOther <- shed19$SL2_d
shed18$OwnDebtOther <- shed18$SL2_d
shed17$OwnDebtOther <- shed17$SL2_d
shed16$OwnDebtOther <- shed16$SL2_d
shed15$OwnDebtOther <- shed15$SL2_d

shed21$OwnDebtTot <- shed21$SL3
shed20$OwnDebtTot <- shed20$SL3
shed19$OwnDebtTot <- shed19$SL3
shed18$OwnDebtTot <- shed18$SL3
shed17$OwnDebtTot <- shed17$SL3
shed16$OwnDebtTot <- shed16$SL3_TOTAL
shed15$OwnDebtTot <- shed15$SL3_TOTAL

shed21$OwnDebtMon <- shed21$SL4
shed20$OwnDebtMon <- shed20$SL4
shed19$OwnDebtMon <- shed19$SL4
shed18$OwnDebtMon <- shed18$SL4
shed17$OwnDebtMon <- shed17$SL4
shed16$OwnDebtMon <- shed16$SL4
shed15$OwnDebtMon <- shed15$SL4

shed21$OwnDebtBehind <- shed21$SL6
shed20$OwnDebtBehind <- shed20$SL6
shed19$OwnDebtBehind <- shed19$SL6
shed18$OwnDebtBehind <- shed18$SL6
shed17$OwnDebtBehind <- shed17$SL6
shed16$OwnDebtBehind <- shed16$SL6
shed15$OwnDebtBehind <- shed15$SL6

shed21$OwnRepaid <- shed21$SL7
shed20$OwnRepaid <- shed20$SL7
shed19$OwnRepaid <- shed19$SL7
shed18$OwnRepaid <- shed18$SL7
shed17$OwnRepaid <- shed17$SL7
shed16$OwnRepaid <- shed16$SL7
shed15$OwnRepaid <- shed15$SL7

shed21$OwnCert <- shed21$SL8_a
shed20$OwnCert <- shed20$SL8_a
shed19$OwnCert <- shed19$SL8_a
shed18$OwnCert <- shed18$SL8_a
shed17$OwnCert <- shed17$SL8_a
shed16$OwnCert <- shed16$SL8_a
shed15$OwnCert <- shed15$SL8_a

shed21$OwnAssoc <- shed21$SL8_b
shed20$OwnAssoc <- shed20$SL8_b
shed19$OwnAssoc <- shed19$SL8_b
shed18$OwnAssoc <- shed18$SL8_b
shed17$OwnAssoc <- shed17$SL8_b
shed16$OwnAssoc <- shed16$SL8_b
shed15$OwnAssoc <- shed15$SL8_b

shed21$OwnBach <- shed21$SL8_c
shed20$OwnBach <- shed20$SL8_c
shed19$OwnBach <- shed19$SL8_c
shed18$OwnBach <- shed18$SL8_c
shed17$OwnBach <- shed17$SL8_c
shed16$OwnBach <- shed16$SL8_c
shed15$OwnBach <- shed15$SL8_c

shed21$OwnGrad <- ifelse((shed21$SL8_d=="Yes") | (shed21$SL8_e=="Yes"), "Yes", "No")
shed20$OwnGrad <- ifelse((shed20$SL8_d=="Yes") | (shed20$SL8_e=="Yes"), "Yes", "No")
shed19$OwnGrad <- ifelse((shed19$SL8_d=="Yes") | (shed19$SL8_e=="Yes"), "Yes", "No")
shed18$OwnGrad <- ifelse((shed18$SL8_d=="Yes") | (shed18$SL8_e=="Yes"), "Yes", "No")
shed17$OwnGrad <- ifelse((shed17$SL8_d=="Yes") | (shed17$SL8_e=="Yes"), "Yes", "No")
shed16$OwnGrad <- ifelse((shed16$SL8_d=="Yes") | (shed16$SL8_e=="Yes"), "Yes", "No")
shed15$OwnGrad <- ifelse((shed15$SL8_d=="Yes") | (shed15$SL8_e=="Yes"), "Yes", "No")

shed21$SpouseDebt <- shed21$SL10
shed20$SpouseDebt <- shed20$SL10
shed19$SpouseDebt <- shed19$SL10
shed18$SpouseDebt <- shed18$SL10
shed17$SpouseDebt <- shed17$SL10
shed16$SpouseDebt <- shed16$SL10
shed15$SpouseDebt <- shed15$SL10

shed21$ChildDebt <- shed21$SL11
shed20$ChildDebt <- shed20$SL11
shed19$ChildDebt <- shed19$SL11
shed18$ChildDebt <- shed18$SL11
shed17$ChildDebt <- shed17$SL11
shed16$ChildDebt <- shed16$SL11
shed15$ChildDebt <- shed15$SL11

shed21$ChildDebtSL <- shed21$SL12_a
shed20$ChildDebtSL <- shed20$SL12_a
shed19$ChildDebtSL <- shed19$SL12_a
shed18$ChildDebtSL <- shed18$SL12_a
shed17$ChildDebtSL <- shed17$SL12_a
shed16$ChildDebtSL <- shed16$SL12_a
shed15$ChildDebtSL <- rep(NA, nrow(shed15))

shed21$ChildDebtHE <- shed21$SL12_b
shed20$ChildDebtHE <- shed20$SL12_b
shed19$ChildDebtHE <- shed19$SL12_b
shed18$ChildDebtHE <- shed18$SL12_b
shed17$ChildDebtHE <- shed17$SL12_b
shed16$ChildDebtHE <- shed16$SL12_b
shed15$ChildDebtHE <- rep(NA, nrow(shed15))

shed21$ChildDebtCC <- shed21$SL12_c
shed20$ChildDebtCC <- shed20$SL12_c
shed19$ChildDebtCC <- shed19$SL12_c
shed18$ChildDebtCC <- shed18$SL12_c
shed17$ChildDebtCC <- shed17$SL12_c
shed16$ChildDebtCC <- shed16$SL12_c
shed15$ChildDebtCC <- rep(NA, nrow(shed15))

shed21$ChildDebtOther <- shed21$SL12_d
shed20$ChildDebtOther <- shed20$SL12_d
shed19$ChildDebtOther <- shed19$SL12_d
shed18$ChildDebtOther <- shed18$SL12_d
shed17$ChildDebtOther <- shed17$SL12_d
shed16$ChildDebtOther <- shed16$SL12_d
shed15$ChildDebtOther <- rep(NA, nrow(shed15))

shed21$Retired <- shed21$D1I
shed20$Retired <- shed20$D1I
shed19$Retired <- shed19$D1I
shed18$Retired <- shed18$D1I
shed17$Retired <- shed17$D1I
shed16$Retired <- shed16$D1_i
shed15$Retired <- shed15$D2

shed21$RetireOnTrack <- shed21$K0
shed20$RetireOnTrack <- shed20$K0
shed19$RetireOnTrack <- shed19$K0
shed18$RetireOnTrack <- shed18$K0
shed17$RetireOnTrack <- shed17$K0
shed16$RetireOnTrack <- rep(NA, nrow(shed16))
shed15$RetireOnTrack <- rep(NA, nrow(shed15))

shed21$SocSec <- shed21$I0_c
shed20$SocSec <- shed20$I0_c
shed19$SocSec <- shed19$I0_c
shed18$SocSec <- shed18$I0_c
shed17$SocSec <- shed17$I0_c
shed16$SocSec <- shed16$I0_e
shed15$SocSec <- shed15$I0_e

shed21$Welfare <- shed21$I0_d
shed20$Welfare <- shed20$I0_d
shed19$Welfare <- shed19$I0_d
shed18$Welfare <- shed18$I0_d
shed17$Welfare <- shed17$I0_d
shed16$Welfare <- rep(NA, nrow(shed16))
shed15$Welfare <- rep(NA, nrow(shed15))

shed21$TotalInc <- shed21$I40
shed20$TotalInc <- shed20$I40
shed19$TotalInc <- shed19$I40
shed18$TotalInc <- shed18$I40
shed17$TotalInc <- shed17$I40
shed16$TotalInc <- shed16$I4A
shed15$TotalInc <- shed15$I4A

shed21$EITC <- shed21$I41_a
shed20$EITC <- shed20$I41_a
shed19$EITC <- shed19$I41_a
shed18$EITC <- shed18$I41_a
shed17$EITC <- shed17$I41_a
shed16$EITC <- rep(NA, nrow(shed16))
shed15$EITC <- rep(NA, nrow(shed15))

shed21$SNAP <- shed21$I41_b
shed20$SNAP <- shed20$I41_b
shed19$SNAP <- shed19$I41_b
shed18$SNAP <- shed18$I41_b
shed17$SNAP <- shed17$I41_b
shed16$SNAP <- rep(NA, nrow(shed16))
shed15$SNAP <- rep(NA, nrow(shed15))

shed21$WIC <- shed21$I41_c
shed20$WIC <- shed20$I41_c
shed19$WIC <- shed19$I41_c
shed18$WIC <- shed18$I41_c
shed17$WIC <- shed17$I41_c
shed16$WIC <- rep(NA, nrow(shed16))
shed15$WIC <- rep(NA, nrow(shed15))

shed21$HouseAssist <- shed21$I41_d
shed20$HouseAssist <- shed20$I41_d
shed19$HouseAssist <- shed19$I41_d
shed18$HouseAssist <- shed18$I41_d
shed17$HouseAssist <- shed17$I41_d
shed16$HouseAssist <- rep(NA, nrow(shed16))
shed15$HouseAssist <- rep(NA, nrow(shed15))

shed21$FRPL <- shed21$I41_e
shed20$FRPL <- shed20$I41_e
shed19$FRPL <- shed19$I41_e
shed18$FRPL <- shed18$I41_e
shed17$FRPL <- shed17$I41_e
shed16$FRPL <- rep(NA, nrow(shed16))
shed15$FRPL <- rep(NA, nrow(shed15))

shed21$ThreeMonSave <- shed21$EF1
shed20$ThreeMonSave <- shed20$EF1
shed19$ThreeMonSave <- shed19$EF1
shed18$ThreeMonSave <- shed18$EF1
shed17$ThreeMonSave <- shed17$EF1
shed16$ThreeMonSave <- shed16$EF1
shed15$ThreeMonSave <- shed15$EF1

shed21$ThreeMonCover <- shed21$EF2
shed20$ThreeMonCover <- shed20$EF2
shed19$ThreeMonCover <- shed19$EF2
shed18$ThreeMonCover <- shed18$EF2
shed17$ThreeMonCover <- shed17$EF2
shed16$ThreeMonCover <- shed16$EF2
shed15$ThreeMonCover <- shed15$EF2

shed21$CCA400 <- shed21$EF3_a
shed20$CCA400 <- shed20$EF3_a
shed19$CCA400 <- shed19$EF3_a
shed18$CCA400 <- shed18$EF3_a
shed17$CCA400 <- shed17$EF3_a
shed16$CCA400 <- shed16$EF3_a
shed15$CCA400 <- shed15$EF3_a

shed21$CCB400 <- shed21$EF3_b
shed20$CCB400 <- shed20$EF3_b
shed19$CCB400 <- shed19$EF3_b
shed18$CCB400 <- shed18$EF3_b
shed17$CCB400 <- shed17$EF3_b
shed16$CCB400 <- shed16$EF3_b
shed15$CCB400 <- shed15$EF3_b

shed21$Cash400 <- shed21$EF3_c
shed20$Cash400 <- shed20$EF3_c
shed19$Cash400 <- shed19$EF3_c
shed18$Cash400 <- shed18$EF3_c
shed17$Cash400 <- shed17$EF3_c
shed16$Cash400 <- shed16$EF3_c
shed15$Cash400 <- shed15$EF3_c

shed21$Loan400 <- shed21$EF3_d
shed20$Loan400 <- shed20$EF3_d
shed19$Loan400 <- shed19$EF3_d
shed18$Loan400 <- shed18$EF3_d
shed17$Loan400 <- shed17$EF3_d
shed16$Loan400 <- shed16$EF3_d
shed15$Loan400 <- shed15$EF3_d

shed21$Friend400 <- shed21$EF3_e
shed20$Friend400 <- shed20$EF3_e
shed19$Friend400 <- shed19$EF3_e
shed18$Friend400 <- shed18$EF3_e
shed17$Friend400 <- shed17$EF3_e
shed16$Friend400 <- shed16$EF3_e
shed15$Friend400 <- shed15$EF3_e

shed21$Payday400 <- shed21$EF3_f
shed20$Payday400 <- shed20$EF3_f
shed19$Payday400 <- shed19$EF3_f
shed18$Payday400 <- shed18$EF3_f
shed17$Payday400 <- shed17$EF3_f
shed16$Payday400 <- shed16$EF3_f
shed15$Payday400 <- shed15$EF3_f

shed21$Sell400 <- shed21$EF3_g
shed20$Sell400 <- shed20$EF3_g
shed19$Sell400 <- shed19$EF3_g
shed18$Sell400 <- shed18$EF3_g
shed17$Sell400 <- shed17$EF3_g
shed16$Sell400 <- shed16$EF3_g
shed15$Sell400 <- shed15$EF3_g

shed21$None400 <- shed21$EF3_h
shed20$None400 <- shed20$EF3_h
shed19$None400 <- shed19$EF3_h
shed18$None400 <- shed18$EF3_h
shed17$None400 <- shed17$EF3_h
shed16$None400 <- shed16$EF3_h
shed15$None400 <- shed15$EF3_h

shed21$PayBills <- shed21$EF5A
shed20$PayBills <- shed20$EF5A
shed19$PayBills <- shed19$EF5A
shed18$PayBills <- shed18$EF5A
shed17$PayBills <- shed17$EF5A
shed16$PayBills <- shed16$EF5A
shed15$PayBills <- rep(NA, nrow(shed15))

shed21$PayBills400 <- shed21$EF5B
shed20$PayBills400 <- shed20$EF5B
shed19$PayBills400 <- shed19$EF5B
shed18$PayBills400 <- shed18$EF5B
shed17$PayBills400 <- shed17$EF5B
shed16$PayBills400 <- shed16$EF5B
shed15$PayBills400 <- rep(NA, nrow(shed15))

shed21$PayBills400 <- shed21$EF5B
shed20$PayBills400 <- shed20$EF5B
shed19$PayBills400 <- shed19$EF5B
shed18$PayBills400 <- shed18$EF5B
shed17$PayBills400 <- shed17$EF5B
shed16$PayBills400 <- rep(NA, nrow(shed16))
shed15$PayBills400 <- rep(NA, nrow(shed15))

shed21$PartialRent <- shed21$EF6A_a
shed20$PartialRent <- shed20$EF6A_a
shed19$PartialRent <- shed19$EF6A_a
shed18$PartialRent <- shed18$EF6A_a
shed17$PartialRent <- shed17$EF6A_a
shed16$PartialRent <- rep(NA, nrow(shed16))
shed15$PartialRent <- rep(NA, nrow(shed15))

shed21$PartialCC <- shed21$EF6A_b
shed20$PartialCC <- shed20$EF6A_b
shed19$PartialCC <- shed19$EF6A_b
shed18$PartialCC <- shed18$EF6A_b
shed17$PartialCC <- shed17$EF6A_b
shed16$PartialCC <- rep(NA, nrow(shed16))
shed15$PartialCC <- rep(NA, nrow(shed15))

shed21$PartialSL <- shed21$EF6A_f
shed20$PartialSL <- shed20$EF6A_f
shed19$PartialSL <- shed19$EF6A_f
shed18$PartialSL <- shed18$EF6A_f
shed17$PartialSL <- shed17$EF6A_f
shed16$PartialSL <- rep(NA, nrow(shed16))
shed15$PartialSL <- rep(NA, nrow(shed15))

shed21$PartialSL400 <- shed21$EF6B_f
shed20$PartialSL400 <- shed20$EF6B_f
shed19$PartialSL400 <- shed19$EF6B_f
shed18$PartialSL400 <- shed18$EF6B_f
shed17$PartialSL400 <- shed17$EF6B_f
shed16$PartialSL400 <- rep(NA, nrow(shed16))
shed15$PartialSL400 <- rep(NA, nrow(shed15))

shed21$Occupation <- shed21$ppcm0160
shed20$Occupation <- shed20$ppcm0160
shed19$Occupation <- shed19$ppcm0160
shed18$Occupation <- shed18$ppcm0160
shed17$Occupation <- shed17$ppcm0160
shed16$Occupation <- shed16$ppcm0160
shed15$Occupation <- shed15$ppcm0160

shed21$Savings <- shed21$ppfs0596
shed20$Savings <- shed20$ppfs0596
shed19$Savings <- shed19$ppfs0596
shed18$Savings <- shed18$ppfs0596
shed17$Savings <- shed17$ppfs0596
shed16$Savings <- shed16$ppfs0596
shed15$Savings <- shed15$ppfs0596

shed21$CreditScore <- shed21$ppfs1482
shed20$CreditScore <- shed20$ppfs1482
shed19$CreditScore <- shed19$ppfs1482
shed18$CreditScore <- rep(NA, nrow(shed18))
shed17$CreditScore <- rep(NA, nrow(shed17))
shed16$CreditScore <- shed16$C1
shed15$CreditScore <- shed15$C1

shed21$InstLevel <- shed21$iclevel
shed20$InstLevel <- shed20$iclevel
shed19$InstLevel <- shed19$iclevel
shed18$InstLevel <- shed18$iclevel
shed17$InstLevel <- rep(NA, nrow(shed17))
shed16$InstLevel <- rep(NA, nrow(shed16))
shed15$InstLevel <- shed15$sector

shed21$InstControl <- shed21$control
shed20$InstControl <- shed20$control
shed19$InstControl <- shed19$control
shed18$InstControl <- shed18$control
shed17$InstControl <- shed17$control
shed16$InstControl <- rep(NA, nrow(shed16))
shed15$InstControl <- shed15$control

shed21$ChildrenUnder18 <- shed21$L0_b
shed20$ChildrenUnder18 <- shed20$L0_b
shed19$ChildrenUnder18 <- shed19$L0_b
shed18$ChildrenUnder18 <- shed18$L0_b
shed17$ChildrenUnder18 <- shed17$L0_b
shed16$ChildrenUnder18 <- shed16$L0_b
shed15$ChildrenUnder18 <- shed15$D0_b

shed21 <- shed21 %>% select(CaseID, Weight, State, Race, Gender, FinManage, ParComp, HomeOwn, CCApprov, CreditDeny, UnpaidCC, CCBalance, EdAttain, EdPayoff1, DiffField1, DiffSchool1, LessEd1, MoreEd1, OwnDebt, OwnDebtSL, OwnDebtHE, OwnDebtCC, OwnDebtOther, OwnDebtTot, OwnDebtMon, OwnDebtBehind, OwnRepaid, OwnCert, OwnAssoc, OwnBach, OwnGrad, SpouseDebt, ChildDebt, ChildDebtSL, ChildDebtHE, ChildDebtCC, ChildDebtOther, Retired, RetireOnTrack, SocSec, Welfare, TotalInc, EITC, SNAP, WIC, HouseAssist, FRPL, ThreeMonSave, ThreeMonCover, CCA400, CCB400, Cash400, Loan400, Friend400, Payday400, Sell400, None400, PayBills, PayBills400, PartialRent, PartialCC, PartialSL, PartialSL400, Occupation, Savings, CreditScore, InstLevel, InstControl, ChildrenUnder18)

shed20 <- shed20 %>% select(CaseID, Weight, State, Race, Gender, FinManage, ParComp, HomeOwn, CCApprov, CreditDeny, UnpaidCC, CCBalance, EdAttain, EdPayoff1, DiffField1, DiffSchool1, LessEd1, MoreEd1, OwnDebt, OwnDebtSL, OwnDebtHE, OwnDebtCC, OwnDebtOther, OwnDebtTot, OwnDebtMon, OwnDebtBehind, OwnRepaid, OwnCert, OwnAssoc, OwnBach, OwnGrad, SpouseDebt, ChildDebt, ChildDebtSL, ChildDebtHE, ChildDebtCC, ChildDebtOther, Retired, RetireOnTrack, SocSec, Welfare, TotalInc, EITC, SNAP, WIC, HouseAssist, FRPL, ThreeMonSave, ThreeMonCover, CCA400, CCB400, Cash400, Loan400, Friend400, Payday400, Sell400, None400, PayBills, PayBills400, PartialRent, PartialCC, PartialSL, PartialSL400, Occupation, Savings, CreditScore, InstLevel, InstControl, ChildrenUnder18)

shed19 <- shed19 %>% select(CaseID, Weight, State, Race, Gender, FinManage, ParComp, HomeOwn, CCApprov, CreditDeny, UnpaidCC, CCBalance, EdAttain, EdPayoff1, DiffField1, DiffSchool1, LessEd1, MoreEd1, OwnDebt, OwnDebtSL, OwnDebtHE, OwnDebtCC, OwnDebtOther, OwnDebtTot, OwnDebtMon, OwnDebtBehind, OwnRepaid, OwnCert, OwnAssoc, OwnBach, OwnGrad, SpouseDebt, ChildDebt, ChildDebtSL, ChildDebtHE, ChildDebtCC, ChildDebtOther, Retired, RetireOnTrack, SocSec, Welfare, TotalInc, EITC, SNAP, WIC, HouseAssist, FRPL, ThreeMonSave, ThreeMonCover, CCA400, CCB400, Cash400, Loan400, Friend400, Payday400, Sell400, None400, PayBills, PayBills400, PartialRent, PartialCC, PartialSL, PartialSL400, Occupation, Savings, CreditScore, InstLevel, InstControl, ChildrenUnder18)

shed18 <- shed18 %>% select(CaseID, Weight, State, Race, Gender, FinManage, ParComp, HomeOwn, CCApprov, CreditDeny, UnpaidCC, CCBalance, EdAttain, EdPayoff1, DiffField1, DiffSchool1, LessEd1, MoreEd1, OwnDebt, OwnDebtSL, OwnDebtHE, OwnDebtCC, OwnDebtOther, OwnDebtTot, OwnDebtMon, OwnDebtBehind, OwnRepaid, OwnCert, OwnAssoc, OwnBach, OwnGrad, SpouseDebt, ChildDebt, ChildDebtSL, ChildDebtHE, ChildDebtCC, ChildDebtOther, Retired, RetireOnTrack, SocSec, Welfare, TotalInc, EITC, SNAP, WIC, HouseAssist, FRPL, ThreeMonSave, ThreeMonCover, CCA400, CCB400, Cash400, Loan400, Friend400, Payday400, Sell400, None400, PayBills, PayBills400, PartialRent, PartialCC, PartialSL, PartialSL400, Occupation, Savings, CreditScore, InstLevel, InstControl, ChildrenUnder18)

shed17 <- shed17 %>% select(CaseID, Weight, State, Race, Gender, FinManage, ParComp, HomeOwn, CCApprov, CreditDeny, UnpaidCC, CCBalance, EdAttain, EdPayoff1, DiffField1, DiffSchool1, LessEd1, MoreEd1, OwnDebt, OwnDebtSL, OwnDebtHE, OwnDebtCC, OwnDebtOther, OwnDebtTot, OwnDebtMon, OwnDebtBehind, OwnRepaid, OwnCert, OwnAssoc, OwnBach, OwnGrad, SpouseDebt, ChildDebt, ChildDebtSL, ChildDebtHE, ChildDebtCC, ChildDebtOther, Retired, RetireOnTrack, SocSec, Welfare, TotalInc, EITC, SNAP, WIC, HouseAssist, FRPL, ThreeMonSave, ThreeMonCover, CCA400, CCB400, Cash400, Loan400, Friend400, Payday400, Sell400, None400, PayBills, PayBills400, PartialRent, PartialCC, PartialSL, PartialSL400, Occupation, Savings, CreditScore, InstLevel, InstControl, ChildrenUnder18)

shed16 <- shed16 %>% select(CaseID, Weight, State, Race, Gender, FinManage, ParComp, HomeOwn, CCApprov, CreditDeny, UnpaidCC, CCBalance, EdAttain, EdPayoff1, DiffField1, DiffSchool1, LessEd1, MoreEd1, OwnDebt, OwnDebtSL, OwnDebtHE, OwnDebtCC, OwnDebtOther, OwnDebtTot, OwnDebtMon, OwnDebtBehind, OwnRepaid, OwnCert, OwnAssoc, OwnBach, OwnGrad, SpouseDebt, ChildDebt, ChildDebtSL, ChildDebtHE, ChildDebtCC, ChildDebtOther, Retired, RetireOnTrack, SocSec, Welfare, TotalInc, EITC, SNAP, WIC, HouseAssist, FRPL, ThreeMonSave, ThreeMonCover, CCA400, CCB400, Cash400, Loan400, Friend400, Payday400, Sell400, None400, PayBills, PayBills400, PartialRent, PartialCC, PartialSL, PartialSL400, Occupation, Savings, CreditScore, InstLevel, InstControl, ChildrenUnder18)

shed15 <- shed15 %>% select(CaseID, Weight, State, Race, Gender, FinManage, ParComp, HomeOwn, CCApprov, CreditDeny, UnpaidCC, CCBalance, EdAttain, EdPayoff1, DiffField1, DiffSchool1, LessEd1, MoreEd1, OwnDebt, OwnDebtSL, OwnDebtHE, OwnDebtCC, OwnDebtOther, OwnDebtTot, OwnDebtMon, OwnDebtBehind, OwnRepaid, OwnCert, OwnAssoc, OwnBach, OwnGrad, SpouseDebt, ChildDebt, ChildDebtSL, ChildDebtHE, ChildDebtCC, ChildDebtOther, Retired, RetireOnTrack, SocSec, Welfare, TotalInc, EITC, SNAP, WIC, HouseAssist, FRPL, ThreeMonSave, ThreeMonCover, CCA400, CCB400, Cash400, Loan400, Friend400, Payday400, Sell400, None400, PayBills, PayBills400, PartialRent, PartialCC, PartialSL, PartialSL400, Occupation, Savings, CreditScore, InstLevel, InstControl, ChildrenUnder18)

shed21$SurveyYear <- rep(2021, nrow(shed21))
shed20$SurveyYear <- rep(2020, nrow(shed20))
shed19$SurveyYear <- rep(2019, nrow(shed19))
shed18$SurveyYear <- rep(2018, nrow(shed18))
shed17$SurveyYear <- rep(2017, nrow(shed17))
shed16$SurveyYear <- rep(2016, nrow(shed16))
shed15$SurveyYear <- rep(2015, nrow(shed15))

shed <- rbind(shed21, shed20, shed19, shed18, shed17, shed16, shed15)


 
###################################################################
### Student loan borrowing                                      ###
###################################################################

# OwnDebt: # Do you currently have student loan debt or owe any money used to pay for your own education? 

table(shed$OwnDebt)
shed.OwnDebt <- shed %>% filter((OwnDebt %in% c("Not In Universe (not asked)", "Refused", NA))==FALSE)
tblOwnDebt <- aggregate(data=shed.OwnDebt, Weight ~ OwnDebt + Race + State, FUN=sum)
tblOwnDebt2 <- aggregate(data=shed.OwnDebt, Weight ~ OwnDebt + State, FUN=sum)
tblOwnDebt2$Race <- rep("All", nrow(tblOwnDebt2))
tblOwnDebt <- rbind(tblOwnDebt, tblOwnDebt2)
tblOwnDebt <- reshape2::dcast(data=tblOwnDebt, Race + State ~ OwnDebt, value.var="Weight")
tblOwnDebt$`Share with debt` <- tblOwnDebt$Yes / (tblOwnDebt$Yes + tblOwnDebt$No)
ggplot(data=tblOwnDebt, mapping=aes(y=Race, x=`Share with debt`)) + geom_bar(stat="identity") + facet_grid(State ~ .) + scale_x_continuous(labels=scales::percent)

# OwnDebtSL: # Student loan - Think about the money you currently owe for your own education. Is the money you owe for that education a: 

table(shed$OwnDebtSL)
shed.OwnDebtSL <- shed %>% filter((OwnDebtSL %in% c("Not In Universe (not asked)", "Refused", NA))==FALSE) %>% filter(OwnDebt=="Yes")
tblOwnDebtSL <- aggregate(data=shed.OwnDebtSL, Weight ~ OwnDebtSL + Race + State, FUN=sum)
tblOwnDebtSL2 <- aggregate(data=shed.OwnDebtSL, Weight ~ OwnDebtSL + State, FUN=sum)
tblOwnDebtSL2$Race <- rep("All", nrow(tblOwnDebtSL2))
tblOwnDebtSL <- rbind(tblOwnDebtSL, tblOwnDebtSL2)
tblOwnDebtSL <- reshape2::dcast(data=tblOwnDebtSL, Race + State ~ OwnDebtSL, value.var="Weight")
tblOwnDebtSL$`Share of borrowers whose debt includes a student loan` <- tblOwnDebtSL$Yes / (tblOwnDebtSL$Yes + tblOwnDebtSL$No)
ggplot(data=tblOwnDebtSL, mapping=aes(y=Race, x=`Share of borrowers whose debt includes a student loan`)) + geom_bar(stat="identity") + facet_grid(State ~ .) + scale_x_continuous(labels=scales::percent)

# OwnDebtHE: # Home equity loan - Think about the money you currently owe for your own education. Is the money you owe for that education a: 

table(shed$OwnDebtHE)
shed.OwnDebtHE <- shed %>% filter((OwnDebtHE %in% c("Not In Universe (not asked)", "Refused", NA))==FALSE) %>% filter(OwnDebt=="Yes")
tblOwnDebtHE <- aggregate(data=shed.OwnDebtHE, Weight ~ OwnDebtHE + Race + State, FUN=sum)
tblOwnDebtHE2 <- aggregate(data=shed.OwnDebtHE, Weight ~ OwnDebtHE + State, FUN=sum)
tblOwnDebtHE2$Race <- rep("All", nrow(tblOwnDebtHE2))
tblOwnDebtHE <- rbind(tblOwnDebtHE, tblOwnDebtHE2)
tblOwnDebtHE <- reshape2::dcast(data=tblOwnDebtHE, Race + State ~ OwnDebtHE, value.var="Weight")
tblOwnDebtHE$`Share of borrowers whose debt includes home equity` <- tblOwnDebtHE$Yes / (tblOwnDebtHE$Yes + tblOwnDebtHE$No)
ggplot(data=tblOwnDebtHE, mapping=aes(y=Race, x=`Share of borrowers whose debt includes home equity`)) + geom_bar(stat="identity") + facet_grid(State ~ .) + scale_x_continuous(labels=scales::percent)

# OwnDebtCC: # Credit card - Think about the money you currently owe for your own education. Is the money you owe for that education a:

table(shed$OwnDebtCC)
shed.OwnDebtCC <- shed %>% filter((OwnDebtCC %in% c("Not In Universe (not asked)", "Refused", NA))==FALSE) %>% filter(OwnDebt=="Yes")
tblOwnDebtCC <- aggregate(data=shed.OwnDebtCC, Weight ~ OwnDebtCC + Race + State, FUN=sum)
tblOwnDebtCC2 <- aggregate(data=shed.OwnDebtCC, Weight ~ OwnDebtCC + State, FUN=sum)
tblOwnDebtCC2$Race <- rep("All", nrow(tblOwnDebtCC2))
tblOwnDebtCC <- rbind(tblOwnDebtCC, tblOwnDebtCC2)
tblOwnDebtCC <- reshape2::dcast(data=tblOwnDebtCC, Race + State ~ OwnDebtCC, value.var="Weight")
tblOwnDebtCC$`Share of borrowers whose debt includes credit card debt` <- tblOwnDebtCC$Yes / (tblOwnDebtCC$Yes + tblOwnDebtCC$No)
ggplot(data=tblOwnDebtCC, mapping=aes(y=Race, x=`Share of borrowers whose debt includes credit card debt`)) + geom_bar(stat="identity") + facet_grid(State ~ .) + scale_x_continuous(labels=scales::percent)

# OwnDebtOther: # Other loan - Think about the money you currently owe for your own education. Is the money you owe for that education a: 

table(shed$OwnDebtOther)
shed.OwnDebtOther <- shed %>% filter((OwnDebtOther %in% c("Not In Universe (not asked)", "Refused", NA))==FALSE) %>% filter(OwnDebt=="Yes")
tblOwnDebtOther <- aggregate(data=shed.OwnDebtOther, Weight ~ OwnDebtOther + Race + State, FUN=sum)
tblOwnDebtOther2 <- aggregate(data=shed.OwnDebtOther, Weight ~ OwnDebtOther + State, FUN=sum)
tblOwnDebtOther2$Race <- rep("All", nrow(tblOwnDebtOther2))
tblOwnDebtOther <- rbind(tblOwnDebtOther, tblOwnDebtOther2)
tblOwnDebtOther <- reshape2::dcast(data=tblOwnDebtOther, Race + State ~ OwnDebtOther, value.var="Weight")
tblOwnDebtOther$`Share of borrowers whose debt includes other debt` <- tblOwnDebtOther$Yes / (tblOwnDebtOther$Yes + tblOwnDebtOther$No)
ggplot(data=tblOwnDebtOther, mapping=aes(y=Race, x=`Share of borrowers whose debt includes other debt`)) + geom_bar(stat="identity") + facet_grid(State ~ .) + scale_x_continuous(labels=scales::percent)

# OwnDebtTot3: # Thinking specifically about the money that you owe for your own education, please tell the total amount that you currently owe on these loans. 
table(shed$OwnDebtTot3)
shed.OwnDebtTot3 <- shed %>% filter(is.na(OwnDebtTot3)==FALSE)
tblOwnDebtTot3 <- aggregate(data=shed.OwnDebtTot3, Weight ~ OwnDebtTot3 + Race + State, FUN=sum)
tblOwnDebtTot32 <- aggregate(data=shed.OwnDebtTot3, Weight ~ OwnDebtTot3 + State, FUN=sum)
tblOwnDebtTot32$Race <- rep("All", nrow(tblOwnDebtTot32))
tblOwnDebtTot3 <- rbind(tblOwnDebtTot3, tblOwnDebtTot32)
tblOwnDebtTot3 <- reshape2::dcast(data=tblOwnDebtTot3, Race + State ~ OwnDebtTot3, value.var="Weight")
tblOwnDebtTot3$`Total weight` <- tblOwnDebtTot3$`Less than $5,000` + tblOwnDebtTot3$`$5,000 to $9,999` + tblOwnDebtTot3$`$10,000 to $14,999` + tblOwnDebtTot3$`$15,000 to $19,999` + tblOwnDebtTot3$`$20,000 to $24,999` + tblOwnDebtTot3$`$25,000 to $29,999` + tblOwnDebtTot3$`$30,000 to $39,999` + tblOwnDebtTot3$`$40,000 to $49,999` +  tblOwnDebtTot3$`$50,000 to $74,999` + tblOwnDebtTot3$`$75,000 to $99,999` + tblOwnDebtTot3$`$100,000 or above` 
tblOwnDebtTot3$`Less than $5,000` <- tblOwnDebtTot3$`Less than $5,000` / tblOwnDebtTot3$`Total weight`
tblOwnDebtTot3$`$5,000 to $9,999` <- tblOwnDebtTot3$`$5,000 to $9,999` / tblOwnDebtTot3$`Total weight`
tblOwnDebtTot3$`$10,000 to $14,999` <- tblOwnDebtTot3$`$10,000 to $14,999` / tblOwnDebtTot3$`Total weight`
tblOwnDebtTot3$`$15,000 to $19,999` <- tblOwnDebtTot3$`$15,000 to $19,999` / tblOwnDebtTot3$`Total weight`
tblOwnDebtTot3$`$20,000 to $24,999` <- tblOwnDebtTot3$`$20,000 to $24,999` / tblOwnDebtTot3$`Total weight`
tblOwnDebtTot3$`$25,000 to $29,999` <- tblOwnDebtTot3$`$25,000 to $29,999` / tblOwnDebtTot3$`Total weight`
tblOwnDebtTot3$`$30,000 to $39,999` <- tblOwnDebtTot3$`$30,000 to $39,999` / tblOwnDebtTot3$`Total weight`
tblOwnDebtTot3$`$40,000 to $49,999` <- tblOwnDebtTot3$`$40,000 to $49,999` / tblOwnDebtTot3$`Total weight`
tblOwnDebtTot3$`$50,000 to $74,999` <- tblOwnDebtTot3$`$50,000 to $74,999` / tblOwnDebtTot3$`Total weight`
tblOwnDebtTot3$`$75,000 to $99,999` <- tblOwnDebtTot3$`$75,000 to $99,999` / tblOwnDebtTot3$`Total weight`
tblOwnDebtTot3$`$100,000 or above` <- tblOwnDebtTot3$`$100,000 or above` / tblOwnDebtTot3$`Total weight`
tblOwnDebtTot3 <- reshape2::melt(data=tblOwnDebtTot3, id.vars = c("Race", "State"), value.name="Share of borrowers") %>% filter(variable != "Total weight")
tblOwnDebtTot3$variable <- factor(tblOwnDebtTot3$variable, levels = c("$100,000 or above", "$75,000 to $99,999", "$50,000 to $74,999", "$40,000 to $49,999", "$30,000 to $39,999", "$25,000 to $29,999", "$20,000 to $24,999","$15,000 to $19,999", "$10,000 to $14,999", "$5,000 to $9,999", "Less than $5,000"))
ggplot(data=tblOwnDebtTot3, mapping=aes(y=Race, x=`Share of borrowers`, fill=variable)) + geom_bar(stat="identity") + facet_grid(State ~ .) + scale_x_continuous(labels=scales::percent) + labs(fill="Total student debt") 

# OwnDebtMon3: # Approximately how much is the total monthly payment that you are required to make on the loans from your education?
table(shed$OwnDebtMon3)
shed.OwnDebtMon3 <- shed %>% filter(is.na(OwnDebtMon3)==FALSE) %>% filter(SurveyYear %in% c(2015, 2016, 2017, 2018, 2019))
shed.OwnDebtMon3 <- shed.OwnDebtMon3 %>% add_row(OwnDebtMon3="$400 to $499", Race="Black, Non-Hispanic", State="CA", Weight=0)
tblOwnDebtMon3 <- aggregate(data=shed.OwnDebtMon3, Weight ~ OwnDebtMon3 + Race + State, FUN=sum)
tblOwnDebtMon32 <- aggregate(data=shed.OwnDebtMon3, Weight ~ OwnDebtMon3 + State, FUN=sum)
tblOwnDebtMon32$Race <- rep("All", nrow(tblOwnDebtMon32))
tblOwnDebtMon3 <- rbind(tblOwnDebtMon3, tblOwnDebtMon32)
tblOwnDebtMon3 <- reshape2::dcast(data=tblOwnDebtMon3, Race + State ~ OwnDebtMon3, value.var="Weight")
tblOwnDebtMon3$`Total weight` <- tblOwnDebtMon3$`$0` + tblOwnDebtMon3$`$1 to $99` + tblOwnDebtMon3$`$100 to $199` + tblOwnDebtMon3$`$200 to $299` + tblOwnDebtMon3$`$300 to $399` + tblOwnDebtMon3$`$400 to $499` + tblOwnDebtMon3$`$500 to $999` + tblOwnDebtMon3$`$1,000 or above`
tblOwnDebtMon3$`$0` <- tblOwnDebtMon3$`$0` / tblOwnDebtMon3$`Total weight`
tblOwnDebtMon3$`$1 to $99` <- tblOwnDebtMon3$`$1 to $99` / tblOwnDebtMon3$`Total weight`
tblOwnDebtMon3$`$100 to $199` <- tblOwnDebtMon3$`$100 to $199` / tblOwnDebtMon3$`Total weight`
tblOwnDebtMon3$`$200 to $299` <- tblOwnDebtMon3$`$200 to $299` / tblOwnDebtMon3$`Total weight`
tblOwnDebtMon3$`$300 to $399` <- tblOwnDebtMon3$`$300 to $399` / tblOwnDebtMon3$`Total weight`
tblOwnDebtMon3$`$400 to $499` <- tblOwnDebtMon3$`$400 to $499` / tblOwnDebtMon3$`Total weight`
tblOwnDebtMon3$`$500 to $999` <- tblOwnDebtMon3$`$500 to $999` / tblOwnDebtMon3$`Total weight`
tblOwnDebtMon3$`$1,000 or above` <- tblOwnDebtMon3$`$1,000 or above` / tblOwnDebtMon3$`Total weight`
tblOwnDebtMon3 <- reshape2::melt(data=tblOwnDebtMon3, id.vars = c("Race", "State"), value.name="Share of borrowers") %>% filter(variable != "Total weight")
tblOwnDebtMon3$variable <- factor(tblOwnDebtMon3$variable, levels = c("$1,000 or above", "$500 to $999", "$400 to $499", "$300 to $399", "$200 to $299", "$100 to $199", "$1 to $99", "$0"))
ggplot(data=tblOwnDebtMon3, mapping=aes(y=Race, x=`Share of borrowers`, fill=variable)) + geom_bar(stat="identity") + facet_grid(State ~ .) + scale_x_continuous(labels=scales::percent) + labs(fill="Monthly student debt payment") 

# OwnDebtBehind: # Are you behind on payments or in collections for one or more of the loans from your own education? 
table(shed$OwnDebtBehind)
shed.OwnDebtBehind <- shed %>% filter((OwnDebtBehind %in% c("Not In Universe (not asked)", "Refused", "", NA))==FALSE) 
tblOwnDebtBehind <- aggregate(data=shed.OwnDebtBehind, Weight ~ OwnDebtBehind + Race + State, FUN=sum)
tblOwnDebtBehind2 <- aggregate(data=shed.OwnDebtBehind, Weight ~ OwnDebtBehind + State, FUN=sum)
tblOwnDebtBehind2$Race <- rep("All", nrow(tblOwnDebtBehind2))
tblOwnDebtBehind <- rbind(tblOwnDebtBehind, tblOwnDebtBehind2)
tblOwnDebtBehind <- reshape2::dcast(data=tblOwnDebtBehind, Race + State ~ OwnDebtBehind, value.var="Weight")
tblOwnDebtBehind$`Share of borrowers behind on payments` <- tblOwnDebtBehind$Yes / (tblOwnDebtBehind$Yes + tblOwnDebtBehind$No)
ggplot(data=tblOwnDebtBehind, mapping=aes(y=Race, x=`Share of borrowers behind on payments`)) + geom_bar(stat="identity") + facet_grid(State ~ .) + scale_x_continuous(labels=scales::percent)
# For the report: 
tblOwnDebtBehind2 <- tblOwnDebtBehind %>% filter(State=="CA")
ggplot(data=tblOwnDebtBehind2, mapping=aes(y=Race, x=`Share of borrowers behind on payments`, fill=Race)) + geom_bar(stat="identity") + scale_x_continuous(labels=scales::percent) + scale_fill_brewer(palette="Dark2") + theme(legend.position="none")


# OwnCert: # Certificate or technical training - Still thinking about the money you borrowed to pay for your own education, did you borrow money for each of the following educational programs:

table(shed$OwnCert)
shed.OwnCert <- shed %>% filter((OwnCert %in% c("Not In Universe (not asked)", "Refused", "", NA))==FALSE) 
tblOwnCert <- aggregate(data=shed.OwnCert, Weight ~ OwnCert + Race + State, FUN=sum)
tblOwnCert2 <- aggregate(data=shed.OwnCert, Weight ~ OwnCert + State, FUN=sum)
tblOwnCert2$Race <- rep("All", nrow(tblOwnCert2))
tblOwnCert <- rbind(tblOwnCert, tblOwnCert2)
tblOwnCert <- reshape2::dcast(data=tblOwnCert, Race + State ~ OwnCert, value.var="Weight")
tblOwnCert$`Share of borrowers whose debt is for a certificate program` <- tblOwnCert$Yes / (tblOwnCert$Yes + tblOwnCert$No)
ggplot(data=tblOwnCert, mapping=aes(y=Race, x=`Share of borrowers whose debt is for a certificate program`)) + geom_bar(stat="identity") + facet_grid(State ~ .) + scale_x_continuous(labels=scales::percent)

# OwnAssoc: # Associate degree - Still thinking about the money you borrowed to pay for your own education, did you borrow money for each of the following educational programs:

table(shed$OwnAssoc)
shed.OwnAssoc <- shed %>% filter((OwnAssoc %in% c("Not In Universe (not asked)", "Refused", "", NA))==FALSE) 
tblOwnAssoc <- aggregate(data=shed.OwnAssoc, Weight ~ OwnAssoc + Race + State, FUN=sum)
tblOwnAssoc2 <- aggregate(data=shed.OwnAssoc, Weight ~ OwnAssoc + State, FUN=sum)
tblOwnAssoc2$Race <- rep("All", nrow(tblOwnAssoc2))
tblOwnAssoc <- rbind(tblOwnAssoc, tblOwnAssoc2)
tblOwnAssoc <- reshape2::dcast(data=tblOwnAssoc, Race + State ~ OwnAssoc, value.var="Weight")
tblOwnAssoc$`Share of borrowers whose debt is for an associate program` <- tblOwnAssoc$Yes / (tblOwnAssoc$Yes + tblOwnAssoc$No)
ggplot(data=tblOwnAssoc, mapping=aes(y=Race, x=`Share of borrowers whose debt is for an associate program`)) + geom_bar(stat="identity") + facet_grid(State ~ .) + scale_x_continuous(labels=scales::percent)

# OwnBach: # Bachelor’s degree - Still thinking about the money you borrowed to pay for your own education, did you borrow money for each of the following educational programs: 

table(shed$OwnBach)
shed.OwnBach <- shed %>% filter((OwnBach %in% c("Not In Universe (not asked)", "Refused", "", NA))==FALSE) 
tblOwnBach <- aggregate(data=shed.OwnBach, Weight ~ OwnBach + Race + State, FUN=sum)
tblOwnBach2 <- aggregate(data=shed.OwnBach, Weight ~ OwnBach + State, FUN=sum)
tblOwnBach2$Race <- rep("All", nrow(tblOwnBach2))
tblOwnBach <- rbind(tblOwnBach, tblOwnBach2)
tblOwnBach <- reshape2::dcast(data=tblOwnBach, Race + State ~ OwnBach, value.var="Weight")
tblOwnBach$`Share of borrowers whose debt is for a bachelor's program` <- tblOwnBach$Yes / (tblOwnBach$Yes + tblOwnBach$No)
ggplot(data=tblOwnBach, mapping=aes(y=Race, x=`Share of borrowers whose debt is for a bachelor's program`)) + geom_bar(stat="identity") + facet_grid(State ~ .) + scale_x_continuous(labels=scales::percent)

# OwnGrad: # Professional degree (e.g. MBA, MD, JD), Master’s degree or Doctoral degree - Still thinking about the money you borrowed to pay for your own education, did you borrow money for each of the following educational programs: 

table(shed$OwnGrad)
shed.OwnGrad <- shed %>% filter((OwnGrad %in% c("Not In Universe (not asked)", "Refused", "", NA))==FALSE) 
tblOwnGrad <- aggregate(data=shed.OwnGrad, Weight ~ OwnGrad + Race + State, FUN=sum)
tblOwnGrad2 <- aggregate(data=shed.OwnGrad, Weight ~ OwnGrad + State, FUN=sum)
tblOwnGrad2$Race <- rep("All", nrow(tblOwnGrad2))
tblOwnGrad <- rbind(tblOwnGrad, tblOwnGrad2)
tblOwnGrad <- reshape2::dcast(data=tblOwnGrad, Race + State ~ OwnGrad, value.var="Weight")
tblOwnGrad$`Share of borrowers whose debt is for a graduate program` <- tblOwnGrad$Yes / (tblOwnGrad$Yes + tblOwnGrad$No)
ggplot(data=tblOwnGrad, mapping=aes(y=Race, x=`Share of borrowers whose debt is for a graduate program`)) + geom_bar(stat="identity") + facet_grid(State ~ .) + scale_x_continuous(labels=scales::percent)

# SpouseDebt: # Do you currently owe any money used to pay for your [spouse/ partner]'s education?

table(shed$SpouseDebt)
shed.SpouseDebt <- shed %>% filter((SpouseDebt %in% c("Not In Universe (not asked)", "Refused", "", NA))==FALSE) 
tblSpouseDebt <- aggregate(data=shed.SpouseDebt, Weight ~ SpouseDebt + Race + State, FUN=sum)
tblSpouseDebt2 <- aggregate(data=shed.SpouseDebt, Weight ~ SpouseDebt + State, FUN=sum)
tblSpouseDebt2$Race <- rep("All", nrow(tblSpouseDebt2))
tblSpouseDebt <- rbind(tblSpouseDebt, tblSpouseDebt2)
tblSpouseDebt <- reshape2::dcast(data=tblSpouseDebt, Race + State ~ SpouseDebt, value.var="Weight")
tblSpouseDebt$`Share who have debt for a partner or spouse's education` <- tblSpouseDebt$Yes / (tblSpouseDebt$Yes + tblSpouseDebt$No)
ggplot(data=tblSpouseDebt, mapping=aes(y=Race, x=`Share who have debt for a partner or spouse's education`)) + geom_bar(stat="identity") + facet_grid(State ~ .) + scale_x_continuous(labels=scales::percent)

# ChildDebt: # Do you currently owe any money used to pay for your child or grandchild’s education?

table(shed$ChildDebt)
shed.ChildDebt <- shed %>% filter((ChildDebt %in% c("Not In Universe (not asked)", "Do not have children or grandchildren", "Refused", "", NA))==FALSE) 
tblChildDebt <- aggregate(data=shed.ChildDebt, Weight ~ ChildDebt + Race + State, FUN=sum)
tblChildDebt2 <- aggregate(data=shed.ChildDebt, Weight ~ ChildDebt + State, FUN=sum)
tblChildDebt2$Race <- rep("All", nrow(tblChildDebt2))
tblChildDebt <- rbind(tblChildDebt, tblChildDebt2)
tblChildDebt <- reshape2::dcast(data=tblChildDebt, Race + State ~ ChildDebt, value.var="Weight")
tblChildDebt$`Share who have debt for a child's or grandchild's education` <- tblChildDebt$Yes / (tblChildDebt$Yes + tblChildDebt$No)
ggplot(data=tblChildDebt, mapping=aes(y=Race, x=`Share who have debt for a child's or grandchild's education`)) + geom_bar(stat="identity") + facet_grid(State ~ .) + scale_x_continuous(labels=scales::percent) + labs(caption="Does not include those without children or grandchildren.")

# ChildDebtSL: # Student loan - Is the money you owe for your child or grandchild’s education a: 

table(shed$ChildDebtSL)
shed.ChildDebtSL <- shed %>% filter(ChildDebt=="Yes") 
tblChildDebtSL <- aggregate(data=shed.ChildDebtSL, Weight ~ ChildDebtSL + Race + State, FUN=sum)
tblChildDebtSL2 <- aggregate(data=shed.ChildDebtSL, Weight ~ ChildDebtSL + State, FUN=sum)
tblChildDebtSL2$Race <- rep("All", nrow(tblChildDebtSL2))
tblChildDebtSL <- rbind(tblChildDebtSL, tblChildDebtSL2)
tblChildDebtSL <- reshape2::dcast(data=tblChildDebtSL, Race + State ~ ChildDebtSL, value.var="Weight")
tblChildDebtSL$`Share whose debt for a child's or grandchild's education is a student loan` <- tblChildDebtSL$Yes / (tblChildDebtSL$Yes + tblChildDebtSL$No)
ggplot(data=tblChildDebtSL, mapping=aes(y=Race, x=`Share whose debt for a child's or grandchild's education is a student loan`)) + geom_bar(stat="identity") + facet_grid(State ~ .) + scale_x_continuous(labels=scales::percent)

# ChildDebtHE: # Home equity loan - Is the money you owe for your child or grandchild’s education a:

table(shed$ChildDebtHE)
shed.ChildDebtHE <- shed %>% filter(ChildDebt=="Yes") %>% filter(ChildDebtHE != "Refused") 
tblChildDebtHE <- aggregate(data=shed.ChildDebtHE, Weight ~ ChildDebtHE + Race + State, FUN=sum)
tblChildDebtHE <- tblChildDebtHE %>% add_row(ChildDebtHE="Yes", Race="Black, Non-Hispanic", State="CA", Weight=0)
tblChildDebtHE2 <- aggregate(data=shed.ChildDebtHE, Weight ~ ChildDebtHE + State, FUN=sum)
tblChildDebtHE2$Race <- rep("All", nrow(tblChildDebtHE2))
tblChildDebtHE <- rbind(tblChildDebtHE, tblChildDebtHE2)
tblChildDebtHE <- reshape2::dcast(data=tblChildDebtHE, Race + State ~ ChildDebtHE, value.var="Weight")
tblChildDebtHE$`Share whose debt for a child's or grandchild's education is home equity` <- tblChildDebtHE$Yes / (tblChildDebtHE$Yes + tblChildDebtHE$No)
ggplot(data=tblChildDebtHE, mapping=aes(y=Race, x=`Share whose debt for a child's or grandchild's education is home equity`)) + geom_bar(stat="identity") + facet_grid(State ~ .) + scale_x_continuous(labels=scales::percent)

# ChildDebtCC: # Credit card - Is the money you owe for your child or grandchild’s education a: 

table(shed$ChildDebtCC)
shed.ChildDebtCC <- shed %>% filter(ChildDebt=="Yes") %>% filter(ChildDebtCC != "Refused") 
tblChildDebtCC <- aggregate(data=shed.ChildDebtCC, Weight ~ ChildDebtCC + Race + State, FUN=sum)
tblChildDebtCC2 <- aggregate(data=shed.ChildDebtCC, Weight ~ ChildDebtCC + State, FUN=sum)
tblChildDebtCC2$Race <- rep("All", nrow(tblChildDebtCC2))
tblChildDebtCC <- rbind(tblChildDebtCC, tblChildDebtCC2)
tblChildDebtCC <- reshape2::dcast(data=tblChildDebtCC, Race + State ~ ChildDebtCC, value.var="Weight")
tblChildDebtCC$`Share whose debt for a child's or grandchild's education is credit card debt` <- tblChildDebtCC$Yes / (tblChildDebtCC$Yes + tblChildDebtCC$No)
ggplot(data=tblChildDebtCC, mapping=aes(y=Race, x=`Share whose debt for a child's or grandchild's education is credit card debt`)) + geom_bar(stat="identity") + facet_grid(State ~ .) + scale_x_continuous(labels=scales::percent)

# ChildDebtOther: # Other loan - Is the money you owe for your child or grandchild’s education a:

table(shed$ChildDebtOther)
shed.ChildDebtOther <- shed %>% filter(ChildDebt=="Yes") %>% filter(ChildDebtOther != "Refused") 
tblChildDebtOther <- aggregate(data=shed.ChildDebtOther, Weight ~ ChildDebtOther + Race + State, FUN=sum)
tblChildDebtOther2 <- aggregate(data=shed.ChildDebtOther, Weight ~ ChildDebtOther + State, FUN=sum)
tblChildDebtOther2$Race <- rep("All", nrow(tblChildDebtOther2))
tblChildDebtOther <- rbind(tblChildDebtOther, tblChildDebtOther2)
tblChildDebtOther <- reshape2::dcast(data=tblChildDebtOther, Race + State ~ ChildDebtOther, value.var="Weight")
tblChildDebtOther$`Share whose debt for a child's or grandchild's education is something else` <- tblChildDebtOther$Yes / (tblChildDebtOther$Yes + tblChildDebtOther$No)
ggplot(data=tblChildDebtOther, mapping=aes(y=Race, x=`Share whose debt for a child's or grandchild's education is something else`)) + geom_bar(stat="identity") + facet_grid(State ~ .) + scale_x_continuous(labels=scales::percent)

# EdAttain: # What is the highest level of school you have completed or the highest degree you have received? 

table(shed$EdAttain)
shed.EdAttain <- shed %>% filter(is.na(EdAttain)==FALSE) %>% filter(AnyStudentLoans=="Yes")
tblEdAttain <- aggregate(data=shed.EdAttain, Weight ~ EdAttain + Race + State, FUN=sum)
tblEdAttain <- tblEdAttain %>% add_row(EdAttain="Less than high school diploma", Race="2+ Races, Non-Hispanic", State="CA", Weight=0)
tblEdAttain <- tblEdAttain %>% add_row(EdAttain="High school degree or GED", Race="Other, Non-Hispanic", State="CA", Weight=0)
tblEdAttain2 <- aggregate(data=shed.EdAttain, Weight ~ EdAttain + State, FUN=sum)
tblEdAttain2$Race <- rep("All", nrow(tblEdAttain2))
tblEdAttain <- rbind(tblEdAttain, tblEdAttain2)
tblEdAttain <- reshape2::dcast(data=tblEdAttain, Race + State ~ EdAttain, value.var="Weight")
tblEdAttain$`Total weight` <- tblEdAttain$`Associate degree` + tblEdAttain$`Bachelor's degree` + tblEdAttain$`Doctorate` + tblEdAttain$`High school degree or GED` + tblEdAttain$`Less than high school diploma` + tblEdAttain$`Master's degree` + tblEdAttain$`Professional degree` + tblEdAttain$`Some college, no degree`
tblEdAttain$`Associate degree` <- tblEdAttain$`Associate degree` / tblEdAttain$`Total weight`
tblEdAttain$`Bachelor's degree` <- tblEdAttain$`Bachelor's degree` / tblEdAttain$`Total weight`
tblEdAttain$`Doctorate` <- tblEdAttain$`Doctorate` / tblEdAttain$`Total weight`
tblEdAttain$`High school degree or GED` <- tblEdAttain$`High school degree or GED` / tblEdAttain$`Total weight`
tblEdAttain$`Less than high school diploma` <- tblEdAttain$`Less than high school diploma` / tblEdAttain$`Total weight`
tblEdAttain$`Master's degree` <- tblEdAttain$`Master's degree` / tblEdAttain$`Total weight`
tblEdAttain$`Professional degree` <- tblEdAttain$`Professional degree` / tblEdAttain$`Total weight`
tblEdAttain$`Some college, no degree` <- tblEdAttain$`Some college, no degree` / tblEdAttain$`Total weight`
tblEdAttain <- reshape2::melt(data=tblEdAttain, id.vars = c("Race", "State"), value.name="Share of borrowers") %>% filter(variable != "Total weight")
tblEdAttain$variable <- factor(tblEdAttain$variable, levels = c("Doctorate", "Professional degree", "Master's degree", "Bachelor's degree", "Associate degree", "Some college, no degree", "High school degree or GED", "Less than high school diploma"))
ggplot(data=tblEdAttain, mapping=aes(y=Race, x=`Share of borrowers`, fill=variable)) + geom_bar(stat="identity") + facet_grid(State ~ .) + scale_x_continuous(labels=scales::percent) + labs(fill="Highest level of education") 

###################################################################
### Economic basics                                             ###
###################################################################

# HomeOwn: # Do you own your home?

table(shed$HomeOwn)
shed.HomeOwn <- shed %>% filter(is.na(HomeOwn)==FALSE) %>% filter(HomeOwn != "Refused") %>% filter(AnyStudentLoans=="Yes")
tblHomeOwn <- aggregate(data=shed.HomeOwn, Weight ~ HomeOwn + Race + State, FUN=sum)
tblHomeOwn <- tblHomeOwn %>% add_row(HomeOwn="Own home free and clear
", Race="2+ Races, Non-Hispanic", State="CA", Weight=0)
tblHomeOwn2 <- aggregate(data=shed.HomeOwn, Weight ~ HomeOwn + State, FUN=sum)
tblHomeOwn2$Race <- rep("All", nrow(tblHomeOwn2))
tblHomeOwn <- rbind(tblHomeOwn, tblHomeOwn2)
tblHomeOwn <- reshape2::dcast(data=tblHomeOwn, Race + State ~ HomeOwn, value.var="Weight")
tblHomeOwn$`Total weight` <- tblHomeOwn$`Own home with a mortgage or loan` + tblHomeOwn$`Own home free and clear` + tblHomeOwn$`Pay rent` + tblHomeOwn$`Other`
tblHomeOwn$`Own home with a mortgage or loan` <- tblHomeOwn$`Own home with a mortgage or loan` / tblHomeOwn$`Total weight`
tblHomeOwn$`Own home free and clear` <- tblHomeOwn$`Own home free and clear` / tblHomeOwn$`Total weight`
tblHomeOwn$`Pay rent` <- tblHomeOwn$`Pay rent` / tblHomeOwn$`Total weight`
tblHomeOwn$`Other` <- tblHomeOwn$`Other` / tblHomeOwn$`Total weight`
tblHomeOwn <- reshape2::melt(data=tblHomeOwn, id.vars = c("Race", "State"), value.name="Share of borrowers") %>% filter(variable != "Total weight")
tblHomeOwn$variable <- factor(tblHomeOwn$variable, levels = c("Own home free and clear", "Own home with a mortgage or loan", "Pay rent", "Other"))
ggplot(data=tblHomeOwn, mapping=aes(y=Race, x=`Share of borrowers`, fill=variable)) + geom_bar(stat="identity") + facet_grid(State ~ .) + scale_x_continuous(labels=scales::percent) + labs(fill="Home ownership status") 

# UnpaidCC: # Do you currently have any outstanding unpaid credit card debt?

table(shed$UnpaidCC)
shed.UnpaidCC <- shed %>% filter(AnyStudentLoans=="Yes") %>% filter((UnpaidCC %in% c("Refused", "Not In Universe (not asked)")==FALSE)) 
tblUnpaidCC <- aggregate(data=shed.UnpaidCC, Weight ~ UnpaidCC + Race + State, FUN=sum)
tblUnpaidCC2 <- aggregate(data=shed.UnpaidCC, Weight ~ UnpaidCC + State, FUN=sum)
tblUnpaidCC2$Race <- rep("All", nrow(tblUnpaidCC2))
tblUnpaidCC <- rbind(tblUnpaidCC, tblUnpaidCC2)
tblUnpaidCC <- reshape2::dcast(data=tblUnpaidCC, Race + State ~ UnpaidCC, value.var="Weight")
tblUnpaidCC$`Share of borrowers with unpaid credit card debt` <- tblUnpaidCC$Yes / (tblUnpaidCC$Yes + tblUnpaidCC$No)
ggplot(data=tblUnpaidCC, mapping=aes(y=Race, x=`Share of borrowers with unpaid credit card debt`)) + geom_bar(stat="identity") + facet_grid(State ~ .) + scale_x_continuous(labels=scales::percent)

# CCBalance: # In the past 12 months, how frequently have you carried an unpaid balance on one or more of your credit cards? 

table(shed$CCBalance)
shed.CCBalance <- shed %>% filter(is.na(CCBalance)==FALSE) %>% filter((CCBalance %in% c("Refused", "Not In Universe (not asked)", "")==FALSE))  %>% filter(AnyStudentLoans=="Yes")
tblCCBalance <- aggregate(data=shed.CCBalance, Weight ~ CCBalance + Race + State, FUN=sum)
# tblCCBalance <- tblCCBalance %>% add_row(CCBalance="Once", Race="2+ Races, Non-Hispanic", State="CA", Weight=0)
tblCCBalance2 <- aggregate(data=shed.CCBalance, Weight ~ CCBalance + State, FUN=sum)
tblCCBalance2$Race <- rep("All", nrow(tblCCBalance2))
tblCCBalance <- rbind(tblCCBalance, tblCCBalance2)
tblCCBalance <- reshape2::dcast(data=tblCCBalance, Race + State ~ CCBalance, value.var="Weight")
tblCCBalance$`Total weight` <- tblCCBalance$`Always pay in full` + tblCCBalance$`Most or all of the time` + tblCCBalance$`Some of the time` + tblCCBalance$`Once`
tblCCBalance$`Always pay in full` <- tblCCBalance$`Always pay in full` / tblCCBalance$`Total weight`
tblCCBalance$`Most or all of the time` <- tblCCBalance$`Most or all of the time` / tblCCBalance$`Total weight`
tblCCBalance$`Some of the time` <- tblCCBalance$`Some of the time` / tblCCBalance$`Total weight`
tblCCBalance$`Once` <- tblCCBalance$`Once` / tblCCBalance$`Total weight`
tblCCBalance <- reshape2::melt(data=tblCCBalance, id.vars = c("Race", "State"), value.name="Share of borrowers") %>% filter(variable != "Total weight")
tblCCBalance$variable <- factor(tblCCBalance$variable, levels = c("Most or all of the time", "Some of the time", "Once", "Always pay in full"))
ggplot(data=tblCCBalance, mapping=aes(y=Race, x=`Share of borrowers`, fill=variable)) + geom_bar(stat="identity") + facet_grid(State ~ .) + scale_x_continuous(labels=scales::percent) + labs(fill="How often do you carry an unpaid credit card balance?") 

# Savings: # What is the approximate total amount of your household's savings and investments?

table(shed$Savings)
shed.Savings <- shed %>% filter((Savings %in% c("Not sure", "Refused", ""))==FALSE) %>% filter(is.na(Savings)==FALSE) %>% filter(AnyStudentLoans=="Yes")
tblSavings <- aggregate(data=shed.Savings, Weight ~ Savings + Race + State, FUN=sum)
tblSavings <- tblSavings %>% add_row(Savings="$250,000 - $499,999", Race="2+ Races, Non-Hispanic", State="CA", Weight=0)
tblSavings <- tblSavings %>% add_row(Savings="$250,000 - $499,999", Race="Black, Non-Hispanic", State="CA", Weight=0)
tblSavings <- tblSavings %>% add_row(Savings="$500,000 - $999,999", Race="Black, Non-Hispanic", State="CA", Weight=0)
tblSavings2 <- aggregate(data=shed.Savings, Weight ~ Savings + State, FUN=sum)
tblSavings2$Race <- rep("All", nrow(tblSavings2))
tblSavings <- rbind(tblSavings, tblSavings2)
tblSavings <- reshape2::dcast(data=tblSavings, Race + State ~ Savings, value.var="Weight")
tblSavings$`Total weight` <- tblSavings$`Under $50,000` + tblSavings$`$50,000 - $99,999` + tblSavings$`$100,000 - $249,999` +  tblSavings$`$250,000 - $499,999` + tblSavings$`$500,000 - $999,999` + tblSavings$`$1,000,000 or more` 
tblSavings$`Under $50,000` <- tblSavings$`Under $50,000` / tblSavings$`Total weight`
tblSavings$`$50,000 - $99,999` <- tblSavings$`$50,000 - $99,999` / tblSavings$`Total weight`
tblSavings$`$100,000 - $249,999` <- tblSavings$`$100,000 - $249,999` / tblSavings$`Total weight`
tblSavings$`$250,000 - $499,999` <- tblSavings$`$250,000 - $499,999` / tblSavings$`Total weight`
tblSavings$`$500,000 - $999,999` <- tblSavings$`$500,000 - $999,999` / tblSavings$`Total weight`
tblSavings$`$1,000,000 or more` <- tblSavings$`$1,000,000 or more` / tblSavings$`Total weight`
tblSavings <- reshape2::melt(data=tblSavings, id.vars = c("Race", "State"), value.name="Share of borrowers") %>% filter(variable != "Total weight")
tblSavings$variable <- factor(tblSavings$variable, levels = c("$1,000,000 or more", "$500,000 - $999,999", "$250,000 - $499,999", "$100,000 - $249,999", "$50,000 - $99,999", "Under $50,000"))
ggplot(data=tblSavings, mapping=aes(y=Race, x=`Share of borrowers`, fill=variable)) + geom_bar(stat="identity") + facet_grid(State ~ .) + scale_x_continuous(labels=scales::percent) + labs(fill="Savings and investments") 

# TotalInc: # Which of the following categories best describes the total income that you received from all sources, before taxes and deductions, in the past 12 months? 

table(shed$TotalInc)
shed.TotalInc <- shed %>% filter(is.na(TotalInc)==FALSE) %>% filter((TotalInc %in% c("Refused", ""))==FALSE) %>% filter(AnyStudentLoans=="Yes")
tblTotalInc <- aggregate(data=shed.TotalInc, Weight ~ TotalInc + Race + State, FUN=sum)
tblTotalInc2 <- aggregate(data=shed.TotalInc, Weight ~ TotalInc + State, FUN=sum)
tblTotalInc2$Race <- rep("All", nrow(tblTotalInc2))
tblTotalInc <- rbind(tblTotalInc, tblTotalInc2)
tblTotalInc <- reshape2::dcast(data=tblTotalInc, Race + State ~ TotalInc, value.var="Weight")
tblTotalInc$`Total weight` <- tblTotalInc$`$0 to $4,999` + tblTotalInc$`$5,000 to $14,999` + tblTotalInc$`$15,000 to $24,999` + tblTotalInc$`$25,000 to $39,999` + tblTotalInc$`$40,000 to $49,999` + tblTotalInc$`$50,000 to $74,999` + tblTotalInc$`$75,000 to $99,999` + tblTotalInc$`$100,000 to $149,999` + tblTotalInc$`$150,000 to $199,999` + tblTotalInc$`$200,000 or higher`
tblTotalInc$`$0 to $4,999` <- tblTotalInc$`$0 to $4,999` / tblTotalInc$`Total weight`
tblTotalInc$`$5,000 to $14,999` <- tblTotalInc$`$5,000 to $14,999` / tblTotalInc$`Total weight`
tblTotalInc$`$15,000 to $24,999` <- tblTotalInc$`$15,000 to $24,999` / tblTotalInc$`Total weight`
tblTotalInc$`$25,000 to $39,999` <- tblTotalInc$`$25,000 to $39,999` / tblTotalInc$`Total weight`
tblTotalInc$`$40,000 to $49,999` <- tblTotalInc$`$40,000 to $49,999` / tblTotalInc$`Total weight`
tblTotalInc$`$50,000 to $74,999` <- tblTotalInc$`$50,000 to $74,999` / tblTotalInc$`Total weight`
tblTotalInc$`$75,000 to $99,999` <- tblTotalInc$`$75,000 to $99,999` / tblTotalInc$`Total weight`
tblTotalInc$`$100,000 to $149,999` <- tblTotalInc$`$100,000 to $149,999` / tblTotalInc$`Total weight`
tblTotalInc$`$150,000 to $199,999` <- tblTotalInc$`$150,000 to $199,999` / tblTotalInc$`Total weight`
tblTotalInc$`$200,000 or higher` <- tblTotalInc$`$200,000 or higher` / tblTotalInc$`Total weight`
tblTotalInc <- reshape2::melt(data=tblTotalInc, id.vars = c("Race", "State"), value.name="Share of borrowers") %>% filter(variable != "Total weight")
tblTotalInc$variable <- factor(tblTotalInc$variable, levels = c("$200,000 or higher", "$150,000 to $199,999", "$100,000 to $149,999", "$75,000 to $99,999", "$50,000 to $74,999", "$40,000 to $49,999", "$25,000 to $39,999", "$15,000 to $24,999", "$5,000 to $14,999", "$0 to $4,999"))
ggplot(data=tblTotalInc, mapping=aes(y=Race, x=`Share of borrowers`, fill=variable)) + geom_bar(stat="identity") + facet_grid(State ~ .) + scale_x_continuous(labels=scales::percent) + labs(fill="Income") 

###################################################################
### Financial satisfaction                                      ###
###################################################################

# FinManage: # Overall, which one of the following best describes how well you are managing financially these days? 

table(shed$FinManage)
shed.FinManage <- shed %>% filter(is.na(FinManage)==FALSE) %>% filter((FinManage %in% c("Refused")==FALSE)) %>% filter(AnyStudentLoans=="Yes")
tblFinManage <- aggregate(data=shed.FinManage, Weight ~ FinManage + Race + State, FUN=sum)
tblFinManage2 <- aggregate(data=shed.FinManage, Weight ~ FinManage + State, FUN=sum)
tblFinManage2$Race <- rep("All", nrow(tblFinManage2))
tblFinManage <- rbind(tblFinManage, tblFinManage2)
tblFinManage <- reshape2::dcast(data=tblFinManage, Race + State ~ FinManage, value.var="Weight")
tblFinManage$`Total weight` <- tblFinManage$`Living comfortably` + tblFinManage$`Finding it difficult to get by` + tblFinManage$`Just getting by` + tblFinManage$`Doing okay`
tblFinManage$`Living comfortably` <- tblFinManage$`Living comfortably` / tblFinManage$`Total weight`
tblFinManage$`Finding it difficult to get by` <- tblFinManage$`Finding it difficult to get by` / tblFinManage$`Total weight`
tblFinManage$`Just getting by` <- tblFinManage$`Just getting by` / tblFinManage$`Total weight`
tblFinManage$`Doing okay` <- tblFinManage$`Doing okay` / tblFinManage$`Total weight`
tblFinManage <- reshape2::melt(data=tblFinManage, id.vars = c("Race", "State"), value.name="Share of borrowers") %>% filter(variable != "Total weight")
tblFinManage$variable <- factor(tblFinManage$variable, levels = c("Finding it difficult to get by", "Just getting by", "Doing okay", "Living comfortably"))
ggplot(data=tblFinManage, mapping=aes(y=Race, x=`Share of borrowers`, fill=variable)) + geom_bar(stat="identity") + facet_grid(State ~ .) + scale_x_continuous(labels=scales::percent) + labs(fill="How well are you managing these days?") 

# ParComp: # Think of your parents when they were your age. Would you say you (and your family) are better, the same, or worse off financially than they were? 

table(shed$ParComp)
shed.ParComp <- shed %>% filter(is.na(ParComp)==FALSE) %>% filter((ParComp %in% c("Refused")==FALSE)) %>% filter(AnyStudentLoans=="Yes")
tblParComp <- aggregate(data=shed.ParComp, Weight ~ ParComp + Race + State, FUN=sum)
tblParComp2 <- aggregate(data=shed.ParComp, Weight ~ ParComp + State, FUN=sum)
tblParComp2$Race <- rep("All", nrow(tblParComp2))
tblParComp <- rbind(tblParComp, tblParComp2)
tblParComp <- reshape2::dcast(data=tblParComp, Race + State ~ ParComp, value.var="Weight")
tblParComp$`Total weight` <- tblParComp$`Much better off` + tblParComp$`Somewhat worse off` + tblParComp$`About the same` + tblParComp$`Somewhat better off` + tblParComp$`Much worse off`
tblParComp$`Much better off` <- tblParComp$`Much better off` / tblParComp$`Total weight`
tblParComp$`Somewhat better off` <- tblParComp$`Somewhat better off` / tblParComp$`Total weight`
tblParComp$`About the same` <- tblParComp$`About the same` / tblParComp$`Total weight`
tblParComp$`Somewhat worse off` <- tblParComp$`Somewhat worse off` / tblParComp$`Total weight`
tblParComp$`Much worse off` <- tblParComp$`Much worse off` / tblParComp$`Total weight`
tblParComp <- reshape2::melt(data=tblParComp, id.vars = c("Race", "State"), value.name="Share of borrowers") %>% filter(variable != "Total weight")
tblParComp$variable <- factor(tblParComp$variable, levels = c("Much worse off", "Somewhat worse off", "About the same", "Somewhat better off", "Much better off"))
ggplot(data=tblParComp, mapping=aes(y=Race, x=`Share of borrowers`, fill=variable)) + geom_bar(stat="identity") + facet_grid(State ~ .) + scale_x_continuous(labels=scales::percent) + labs(fill="Comparison to parents") 

# RetireOnTrack: # Do you think that your retirement savings plan is currently on track? 

table(shed$RetireOnTrack)
shed.RetireOnTrack <- shed %>% filter(AnyStudentLoans=="Yes") %>% filter((RetireOnTrack %in% c("Refused", "Don't know", "Not In Universe (not asked)", "")==FALSE)) 
tblRetireOnTrack <- aggregate(data=shed.RetireOnTrack, Weight ~ RetireOnTrack + Race + State, FUN=sum)
tblRetireOnTrack2 <- aggregate(data=shed.RetireOnTrack, Weight ~ RetireOnTrack + State, FUN=sum)
tblRetireOnTrack2$Race <- rep("All", nrow(tblRetireOnTrack2))
tblRetireOnTrack <- rbind(tblRetireOnTrack, tblRetireOnTrack2)
tblRetireOnTrack <- reshape2::dcast(data=tblRetireOnTrack, Race + State ~ RetireOnTrack, value.var="Weight")
tblRetireOnTrack$`Share of borrowers whose retirement savings plan is on track` <- tblRetireOnTrack$Yes / (tblRetireOnTrack$Yes + tblRetireOnTrack$No)
ggplot(data=tblRetireOnTrack, mapping=aes(y=Race, x=`Share of borrowers whose retirement savings plan is on track`)) + geom_bar(stat="identity") + facet_grid(State ~ .) + scale_x_continuous(labels=scales::percent)

# CreditScore: # Where do you think your credit score falls? 

table(shed$CreditScore)
shed.CreditScore <- shed %>% filter(is.na(CreditScore)==FALSE) %>% filter((CreditScore %in% c("Refused", "", "Don't know")==FALSE)) %>% filter(AnyStudentLoans=="Yes")
tblCreditScore <- aggregate(data=shed.CreditScore, Weight ~ CreditScore + Race + State, FUN=sum)
tblCreditScore <- tblCreditScore %>% add_row(CreditScore="Very poor", Race="Other, Non-Hispanic", State="CA", Weight=0)
tblCreditScore2 <- aggregate(data=shed.CreditScore, Weight ~ CreditScore + State, FUN=sum)
tblCreditScore2$Race <- rep("All", nrow(tblCreditScore2))
tblCreditScore <- rbind(tblCreditScore, tblCreditScore2)
tblCreditScore <- reshape2::dcast(data=tblCreditScore, Race + State ~ CreditScore, value.var="Weight")
tblCreditScore$`Total weight` <- tblCreditScore$`Excellent` + tblCreditScore$`Poor` + tblCreditScore$`Fair` + tblCreditScore$`Good` + tblCreditScore$`Very poor`
tblCreditScore$`Excellent` <- tblCreditScore$`Excellent` / tblCreditScore$`Total weight`
tblCreditScore$`Good` <- tblCreditScore$`Good` / tblCreditScore$`Total weight`
tblCreditScore$`Fair` <- tblCreditScore$`Fair` / tblCreditScore$`Total weight`
tblCreditScore$`Poor` <- tblCreditScore$`Poor` / tblCreditScore$`Total weight`
tblCreditScore$`Very poor` <- tblCreditScore$`Very poor` / tblCreditScore$`Total weight`
tblCreditScore <- reshape2::melt(data=tblCreditScore, id.vars = c("Race", "State"), value.name="Share of borrowers") %>% filter(variable != "Total weight")
tblCreditScore$variable <- factor(tblCreditScore$variable, levels = c("Very poor", "Poor", "Fair", "Good", "Excellent"))
ggplot(data=tblCreditScore, mapping=aes(y=Race, x=`Share of borrowers`, fill=variable)) + geom_bar(stat="identity") + facet_grid(State ~ .) + scale_x_continuous(labels=scales::percent) + labs(fill="Where do you think your credit score falls?") 

# PayBills: # Which best describes your ability to pay all of your bills in full this month? 

table(shed$PayBills)
shed.PayBills <- shed %>% filter(is.na(PayBills)==FALSE) %>% filter((PayBills %in% c("Refused")==FALSE)) %>% filter(AnyStudentLoans=="Yes")
tblPayBills <- aggregate(data=shed.PayBills, Weight ~ PayBills + Race + State, FUN=sum)
tblPayBills2 <- aggregate(data=shed.PayBills, Weight ~ PayBills + State, FUN=sum)
tblPayBills2$Race <- rep("All", nrow(tblPayBills2))
tblPayBills <- rbind(tblPayBills, tblPayBills2)
tblPayBills <- reshape2::dcast(data=tblPayBills, Race + State ~ PayBills, value.var="Weight")
tblPayBills$`Total weight` <- tblPayBills$`I cannot pay some bills or will only make a partial payment on them` + tblPayBills$`I will be able to pay all of my bills in full`
tblPayBills$`I cannot pay some bills or will only make a partial payment on them` <- tblPayBills$`I cannot pay some bills or will only make a partial payment on them` / tblPayBills$`Total weight`
tblPayBills$`I will be able to pay all of my bills in full` <- tblPayBills$`I will be able to pay all of my bills in full` / tblPayBills$`Total weight`
tblPayBills <- reshape2::melt(data=tblPayBills, id.vars = c("Race", "State"), value.name="Share of borrowers") %>% filter(variable != "Total weight")
tblPayBills$variable <- factor(tblPayBills$variable, levels = c("I will be able to pay all of my bills in full", "I cannot pay some bills or will only make a partial payment on them"))
ggplot(data=tblPayBills, mapping=aes(y=Race, x=`Share of borrowers`, fill=variable)) + geom_bar(stat="identity") + facet_grid(State ~ .) + scale_x_continuous(labels=scales::percent) + labs(fill="Which best describes your ability to pay all of your bills in full this month?") 

# PartialRent: # Rent or mortgage ‐ Are you expecting to be unable to pay or only make a partial payment on each of the following bills this month? 

table(shed$PartialRent)
shed.PartialRent <- shed %>% filter(AnyStudentLoans=="Yes") %>% filter((PartialRent %in% c("Refused", "Not In Universe (not asked)", "")==FALSE)) 
tblPartialRent <- aggregate(data=shed.PartialRent, Weight ~ PartialRent + Race + State, FUN=sum)
tblPartialRent2 <- aggregate(data=shed.PartialRent, Weight ~ PartialRent + State, FUN=sum)
tblPartialRent2$Race <- rep("All", nrow(tblPartialRent2))
tblPartialRent <- rbind(tblPartialRent, tblPartialRent2)
tblPartialRent <- reshape2::dcast(data=tblPartialRent, Race + State ~ PartialRent, value.var="Weight")
tblPartialRent$`Share of borrowers expecting to be unable to fully pay their rent this month` <- tblPartialRent$Yes / (tblPartialRent$Yes + tblPartialRent$No)
ggplot(data=tblPartialRent, mapping=aes(y=Race, x=`Share of borrowers expecting to be unable to fully pay their rent this month`)) + geom_bar(stat="identity") + facet_grid(State ~ .) + scale_x_continuous(labels=scales::percent)

# PartialCC: # Credit card ‐ Are you expecting to be unable to pay or only make a partial payment on each of the following bills this month?

table(shed$PartialCC)
shed.PartialCC <- shed %>% filter(AnyStudentLoans=="Yes") %>% filter((PartialCC %in% c("Refused", "Not In Universe (not asked)", "")==FALSE)) 
tblPartialCC <- aggregate(data=shed.PartialCC, Weight ~ PartialCC + Race + State, FUN=sum)
tblPartialCC2 <- aggregate(data=shed.PartialCC, Weight ~ PartialCC + State, FUN=sum)
tblPartialCC2$Race <- rep("All", nrow(tblPartialCC2))
tblPartialCC <- rbind(tblPartialCC, tblPartialCC2)
tblPartialCC <- reshape2::dcast(data=tblPartialCC, Race + State ~ PartialCC, value.var="Weight")
tblPartialCC$`Share of borrowers expecting to be unable to fully pay their credit card bill this month` <- tblPartialCC$Yes / (tblPartialCC$Yes + tblPartialCC$No)
ggplot(data=tblPartialCC, mapping=aes(y=Race, x=`Share of borrowers expecting to be unable to fully pay their credit card bill this month`)) + geom_bar(stat="identity") + facet_grid(State ~ .) + scale_x_continuous(labels=scales::percent)

# PartialSL: # Student loan ‐ Are you expecting to be unable to pay or only make a partial payment on each of the following bills this month? 

table(shed$PartialSL)
shed.PartialSL <- shed %>% filter(AnyStudentLoans=="Yes") %>% filter((PartialSL %in% c("Refused", "Not In Universe (not asked)", "")==FALSE)) %>% filter(SurveyYear %in% c(2015, 2016, 2017, 2018, 2019)) 
tblPartialSL <- aggregate(data=shed.PartialSL, Weight ~ PartialSL + Race + State, FUN=sum)
tblPartialSL2 <- aggregate(data=shed.PartialSL, Weight ~ PartialSL + State, FUN=sum)
tblPartialSL2$Race <- rep("All", nrow(tblPartialSL2))
tblPartialSL <- rbind(tblPartialSL, tblPartialSL2)
tblPartialSL <- reshape2::dcast(data=tblPartialSL, Race + State ~ PartialSL, value.var="Weight")
tblPartialSL$`Share of borrowers expecting to be unable to fully pay their student loan bill this month` <- tblPartialSL$Yes / (tblPartialSL$Yes + tblPartialSL$No)
ggplot(data=tblPartialSL, mapping=aes(y=Race, x=`Share of borrowers expecting to be unable to fully pay their student loan bill this month`)) + geom_bar(stat="identity") + facet_grid(State ~ .) + scale_x_continuous(labels=scales::percent) + labs(caption="Survey years 2020 and 2021 not included.")

# PartialSL400: # Student loan ‐ Which of the following bills would you likely skip paying, or make only a partial payment on, if you had a $400 emergency expense that you had to pay?

table(shed$PartialSL400)
shed.PartialSL400 <- shed %>% filter(AnyStudentLoans=="Yes") %>% filter((PartialSL400 %in% c("Refused", "Not In Universe (not asked)", "")==FALSE)) %>% filter(SurveyYear %in% c(2015, 2016, 2017, 2018, 2019)) 
tblPartialSL400 <- aggregate(data=shed.PartialSL400, Weight ~ PartialSL400 + Race + State, FUN=sum)
tblPartialSL4002 <- aggregate(data=shed.PartialSL400, Weight ~ PartialSL400 + State, FUN=sum)
tblPartialSL4002$Race <- rep("All", nrow(tblPartialSL4002))
tblPartialSL400 <- rbind(tblPartialSL400, tblPartialSL4002)
tblPartialSL400 <- reshape2::dcast(data=tblPartialSL400, Race + State ~ PartialSL400, value.var="Weight")
tblPartialSL400$`Share of borrowers who would skip paying, or make only a partial payment on, their student loan bill if they had a $400 emergency expense` <- tblPartialSL400$Yes / (tblPartialSL400$Yes + tblPartialSL400$No)
ggplot(data=tblPartialSL400, mapping=aes(y=Race, x=`Share of borrowers who would skip paying, or make only a partial payment on, their student loan bill if they had a $400 emergency expense`)) + geom_bar(stat="identity") + facet_grid(State ~ .) + scale_x_continuous(labels=scales::percent) + labs(caption="Survey years 2020 and 2021 not included.")

# PayBills400: # How would a $400 emergency expense that you had to pay impact your ability to pay your other bills this month? 

table(shed$PayBills400)
shed.PayBills400 <- shed %>% filter(is.na(PayBills400)==FALSE) %>% filter((PayBills400 %in% c("Refused", "Not In Universe (not asked)", "")==FALSE)) %>% filter(AnyStudentLoans=="Yes")
tblPayBills400 <- aggregate(data=shed.PayBills400, Weight ~ PayBills400 + Race + State, FUN=sum)
tblPayBills4002 <- aggregate(data=shed.PayBills400, Weight ~ PayBills400 + State, FUN=sum)
tblPayBills4002$Race <- rep("All", nrow(tblPayBills4002))
tblPayBills400 <- rbind(tblPayBills400, tblPayBills4002)
tblPayBills400 <- reshape2::dcast(data=tblPayBills400, Race + State ~ PayBills400, value.var="Weight")
tblPayBills400$`Total weight` <- tblPayBills400$`I could not pay some other bills or would only make a partial payment on some of them` + tblPayBills400$`I would still be able to pay all of my other bills in full`
tblPayBills400$`I could not pay some other bills or would only make a partial payment on some of them` <- tblPayBills400$`I could not pay some other bills or would only make a partial payment on some of them` / tblPayBills400$`Total weight`
tblPayBills400$`I would still be able to pay all of my other bills in full` <- tblPayBills400$`I would still be able to pay all of my other bills in full` / tblPayBills400$`Total weight`
tblPayBills400 <- reshape2::melt(data=tblPayBills400, id.vars = c("Race", "State"), value.name="Share of borrowers") %>% filter(variable != "Total weight")
tblPayBills400$variable <- factor(tblPayBills400$variable, levels = c("I would still be able to pay all of my other bills in full", "I could not pay some other bills or would only make a partial payment on some of them"))
ggplot(data=tblPayBills400, mapping=aes(y=Race, x=`Share of borrowers`, fill=variable)) + geom_bar(stat="identity") + facet_grid(State ~ .) + scale_x_continuous(labels=scales::percent) + labs(fill="How would a $400 emergency expense that you had to pay impact your ability to pay your other bills this month?") 

###################################################################
### Financial stability                                         ###
###################################################################

# CCApprov: # If you were to apply for a credit card today, how confident are you that you would be approved? 

table(shed$CCApprov)
shed.CCApprov <- shed %>% filter(is.na(CCApprov)==FALSE) %>% filter((CCApprov %in% c("Refused", "Not In Universe (not asked)", "Don't know", "")==FALSE)) %>% filter(AnyStudentLoans=="Yes")
tblCCApprov <- aggregate(data=shed.CCApprov, Weight ~ CCApprov + Race + State, FUN=sum)
tblCCApprov2 <- aggregate(data=shed.CCApprov, Weight ~ CCApprov + State, FUN=sum)
tblCCApprov2$Race <- rep("All", nrow(tblCCApprov2))
tblCCApprov <- rbind(tblCCApprov, tblCCApprov2)
tblCCApprov <- reshape2::dcast(data=tblCCApprov, Race + State ~ CCApprov, value.var="Weight")
tblCCApprov$`Total weight` <- tblCCApprov$`Not confident` + tblCCApprov$`Somewhat confident` +  tblCCApprov$`Very confident`
tblCCApprov$`Not confident` <- tblCCApprov$`Not confident` / tblCCApprov$`Total weight`
tblCCApprov$`Somewhat confident` <- tblCCApprov$`Somewhat confident` / tblCCApprov$`Total weight`
tblCCApprov$`Very confident` <- tblCCApprov$`Very confident` / tblCCApprov$`Total weight`
tblCCApprov <- reshape2::melt(data=tblCCApprov, id.vars = c("Race", "State"), value.name="Share of borrowers") %>% filter(variable != "Total weight")
tblCCApprov$variable <- factor(tblCCApprov$variable, levels = c("Very confident", "Somewhat confident", "Not confident"))
ggplot(data=tblCCApprov, mapping=aes(y=Race, x=`Share of borrowers`, fill=variable)) + geom_bar(stat="identity") + facet_grid(State ~ .) + scale_x_continuous(labels=scales::percent) + labs(fill="If you were to apply for a credit card today, how confident are you that you would be approved?") 

# CreditDeny: # Turned down for credit ‐ In the past 12 months, has each of the following happened to you or your spouse/partner: 

table(shed$CreditDeny)
shed.CreditDeny <- shed %>% filter(AnyStudentLoans=="Yes") %>% filter((CreditDeny %in% c("Refused", "Not In Universe (not asked)", "")==FALSE)) 
tblCreditDeny <- aggregate(data=shed.CreditDeny, Weight ~ CreditDeny + Race + State, FUN=sum)
tblCreditDeny2 <- aggregate(data=shed.CreditDeny, Weight ~ CreditDeny + State, FUN=sum)
tblCreditDeny2$Race <- rep("All", nrow(tblCreditDeny2))
tblCreditDeny <- rbind(tblCreditDeny, tblCreditDeny2)
tblCreditDeny <- reshape2::dcast(data=tblCreditDeny, Race + State ~ CreditDeny, value.var="Weight")
tblCreditDeny$`Share of borrowers who were turned down for credit in the past 12 months` <- tblCreditDeny$Yes / (tblCreditDeny$Yes + tblCreditDeny$No)
ggplot(data=tblCreditDeny, mapping=aes(y=Race, x=`Share of borrowers who were turned down for credit in the past 12 months`)) + geom_bar(stat="identity") + facet_grid(State ~ .) + scale_x_continuous(labels=scales::percent) + labs(caption="Includes respondents whose spouse or partner was turned down for credit.")

# SocSec: # Social Security (including old age and DI) -In the past 12 months, did you [and/or your spouse/parnter] receive any income from the following sources:

table(shed$SocSec)
shed.SocSec <- shed %>% filter(AnyStudentLoans=="Yes") %>% filter((SocSec %in% c("Refused", "Not In Universe (not asked)", "")==FALSE)) 
tblSocSec <- aggregate(data=shed.SocSec, Weight ~ SocSec + Race + State, FUN=sum)
tblSocSec2 <- aggregate(data=shed.SocSec, Weight ~ SocSec + State, FUN=sum)
tblSocSec2$Race <- rep("All", nrow(tblSocSec2))
tblSocSec <- rbind(tblSocSec, tblSocSec2)
tblSocSec <- reshape2::dcast(data=tblSocSec, Race + State ~ SocSec, value.var="Weight")
tblSocSec$`Share of borrowers who receive Social Security` <- tblSocSec$Yes / (tblSocSec$Yes + tblSocSec$No)
ggplot(data=tblSocSec, mapping=aes(y=Race, x=`Share of borrowers who receive Social Security`)) + geom_bar(stat="identity") + facet_grid(State ~ .) + scale_x_continuous(labels=scales::percent) 

# Welfare: # Supplemental Security Income (SSI), TANF, or cash assistance from a welfare program - In the past 12 months, did you [and/or your spouse/parnter] receive any income from the following sources: 

table(shed$Welfare)
shed.Welfare <- shed %>% filter(AnyStudentLoans=="Yes") %>% filter((Welfare %in% c("Refused", "Not In Universe (not asked)", "")==FALSE)) 
tblWelfare <- aggregate(data=shed.Welfare, Weight ~ Welfare + Race + State, FUN=sum)
tblWelfare2 <- aggregate(data=shed.Welfare, Weight ~ Welfare + State, FUN=sum)
tblWelfare2$Race <- rep("All", nrow(tblWelfare2))
tblWelfare <- rbind(tblWelfare, tblWelfare2)
tblWelfare <- reshape2::dcast(data=tblWelfare, Race + State ~ Welfare, value.var="Weight")
tblWelfare$`Share of borrowers who receive SSI, TANF, or cash assistance` <- tblWelfare$Yes / (tblWelfare$Yes + tblWelfare$No)
ggplot(data=tblWelfare, mapping=aes(y=Race, x=`Share of borrowers who receive SSI, TANF, or cash assistance`)) + geom_bar(stat="identity") + facet_grid(State ~ .) + scale_x_continuous(labels=scales::percent) 

# EITC: # Earned Income Tax Credit (EITC) - In the past 12 months, have you [and/or your spouse/parnter] received any of the following?

table(shed$EITC)
shed.EITC <- shed %>% filter(AnyStudentLoans=="Yes") %>% filter((EITC %in% c("Refused", "Not In Universe (not asked)", "")==FALSE)) 
tblEITC <- aggregate(data=shed.EITC, Weight ~ EITC + Race + State, FUN=sum)
tblEITC2 <- aggregate(data=shed.EITC, Weight ~ EITC + State, FUN=sum)
tblEITC2$Race <- rep("All", nrow(tblEITC2))
tblEITC <- rbind(tblEITC, tblEITC2)
tblEITC <- reshape2::dcast(data=tblEITC, Race + State ~ EITC, value.var="Weight")
tblEITC$`Share of borrowers who receive EITC` <- tblEITC$Yes / (tblEITC$Yes + tblEITC$No)
ggplot(data=tblEITC, mapping=aes(y=Race, x=`Share of borrowers who receive EITC`)) + geom_bar(stat="identity") + facet_grid(State ~ .) + scale_x_continuous(labels=scales::percent) 

# SNAP: # Supplemental Nutrition Assistance Program (SNAP or food stamps) - In the past 12 months, have you [and/or your spouse/parnter] received any of the following? 

table(shed$SNAP)
shed.SNAP <- shed %>% filter(AnyStudentLoans=="Yes") %>% filter((SNAP %in% c("Refused", "Not In Universe (not asked)", "")==FALSE)) 
tblSNAP <- aggregate(data=shed.SNAP, Weight ~ SNAP + Race + State, FUN=sum)
tblSNAP2 <- aggregate(data=shed.SNAP, Weight ~ SNAP + State, FUN=sum)
tblSNAP2$Race <- rep("All", nrow(tblSNAP2))
tblSNAP <- rbind(tblSNAP, tblSNAP2)
tblSNAP <- reshape2::dcast(data=tblSNAP, Race + State ~ SNAP, value.var="Weight")
tblSNAP$`Share of borrowers who receive SNAP` <- tblSNAP$Yes / (tblSNAP$Yes + tblSNAP$No)
ggplot(data=tblSNAP, mapping=aes(y=Race, x=`Share of borrowers who receive SNAP`)) + geom_bar(stat="identity") + facet_grid(State ~ .) + scale_x_continuous(labels=scales::percent) 

# HouseAssist: # Housing assistance from government program - In the past 12 months, have you [and/or your spouse/parnter] received any of the following? 

table(shed$HouseAssist)
shed.HouseAssist <- shed %>% filter(AnyStudentLoans=="Yes") %>% filter((HouseAssist %in% c("Refused", "Not In Universe (not asked)", "")==FALSE)) 
tblHouseAssist <- aggregate(data=shed.HouseAssist, Weight ~ HouseAssist + Race + State, FUN=sum)
tblHouseAssist2 <- aggregate(data=shed.HouseAssist, Weight ~ HouseAssist + State, FUN=sum)
tblHouseAssist2$Race <- rep("All", nrow(tblHouseAssist2))
tblHouseAssist <- rbind(tblHouseAssist, tblHouseAssist2)
tblHouseAssist <- reshape2::dcast(data=tblHouseAssist, Race + State ~ HouseAssist, value.var="Weight")
tblHouseAssist$`Share of borrowers who receive housing assistance` <- tblHouseAssist$Yes / (tblHouseAssist$Yes + tblHouseAssist$No)
ggplot(data=tblHouseAssist, mapping=aes(y=Race, x=`Share of borrowers who receive housing assistance`)) + geom_bar(stat="identity") + facet_grid(State ~ .) + scale_x_continuous(labels=scales::percent) 

# FRPL: # Free or reduced price school lunches - In the past 12 months, have you [and/or your spouse/ parnter] received any of the following? 

table(shed$FRPL)
shed.FRPL <- shed %>% filter(AnyStudentLoans=="Yes") %>% filter((FRPL %in% c("Refused", "Not In Universe (not asked)", "")==FALSE)) %>% filter(ChildrenUnder18=="Yes")
tblFRPL <- aggregate(data=shed.FRPL, Weight ~ FRPL + Race + State, FUN=sum)
tblFRPL2 <- aggregate(data=shed.FRPL, Weight ~ FRPL + State, FUN=sum)
tblFRPL2$Race <- rep("All", nrow(tblFRPL2))
tblFRPL <- rbind(tblFRPL, tblFRPL2)
tblFRPL <- reshape2::dcast(data=tblFRPL, Race + State ~ FRPL, value.var="Weight")
tblFRPL$`Share of borrowers who receive FRPL` <- tblFRPL$Yes / (tblFRPL$Yes + tblFRPL$No)
ggplot(data=tblFRPL, mapping=aes(y=Race, x=`Share of borrowers who receive FRPL`)) + geom_bar(stat="identity") + facet_grid(State ~ .) + scale_x_continuous(labels=scales::percent) + labs(caption="Filtered for those with children aged 17 or younger.")

# ThreeMonSave: # Have you set aside emergency or rainy day funds that would cover your expenses for 3 months in case of sickness, job loss, economic downturn, or other emergencies? 

table(shed$ThreeMonSave)
shed.ThreeMonSave <- shed %>% filter(AnyStudentLoans=="Yes") %>% filter((ThreeMonSave %in% c("Refused", "Not In Universe (not asked)", "")==FALSE)) 
tblThreeMonSave <- aggregate(data=shed.ThreeMonSave, Weight ~ ThreeMonSave + Race + State, FUN=sum)
tblThreeMonSave2 <- aggregate(data=shed.ThreeMonSave, Weight ~ ThreeMonSave + State, FUN=sum)
tblThreeMonSave2$Race <- rep("All", nrow(tblThreeMonSave2))
tblThreeMonSave <- rbind(tblThreeMonSave, tblThreeMonSave2)
tblThreeMonSave <- reshape2::dcast(data=tblThreeMonSave, Race + State ~ ThreeMonSave, value.var="Weight")
tblThreeMonSave$`Share of borrowers with 3 months' of rainy day funds` <- tblThreeMonSave$Yes / (tblThreeMonSave$Yes + tblThreeMonSave$No)
ggplot(data=tblThreeMonSave, mapping=aes(y=Race, x=`Share of borrowers with 3 months' of rainy day funds`)) + geom_bar(stat="identity") + facet_grid(State ~ .) + scale_x_continuous(labels=scales::percent) 

# ThreeMonCover: # If you were to lose your main source of income (for example, job or government benefits), could you cover your expenses for 3 months by borrowing money, using savings, or selling assets?

table(shed$ThreeMonCover)
shed.ThreeMonCover <- shed %>% filter(AnyStudentLoans=="Yes") %>% filter((ThreeMonCover %in% c("Refused", "Not In Universe (not asked)", "")==FALSE)) 
tblThreeMonCover <- aggregate(data=shed.ThreeMonCover, Weight ~ ThreeMonCover + Race + State, FUN=sum)
tblThreeMonCover2 <- aggregate(data=shed.ThreeMonCover, Weight ~ ThreeMonCover + State, FUN=sum)
tblThreeMonCover2$Race <- rep("All", nrow(tblThreeMonCover2))
tblThreeMonCover <- rbind(tblThreeMonCover, tblThreeMonCover2)
tblThreeMonCover <- reshape2::dcast(data=tblThreeMonCover, Race + State ~ ThreeMonCover, value.var="Weight")
tblThreeMonCover$`Share of borrowers who could replace 3 months of main income` <- tblThreeMonCover$Yes / (tblThreeMonCover$Yes + tblThreeMonCover$No)
ggplot(data=tblThreeMonCover, mapping=aes(y=Race, x=`Share of borrowers who could replace 3 months of main income`)) + geom_bar(stat="identity") + facet_grid(State ~ .) + scale_x_continuous(labels=scales::percent) 

# CCA400: # Put it on my credit card and pay it off in full at the next statement ‐ Suppose that you have an emergency expense that costs $400. Based on your current financial situation, how would you pay for this expense? 

table(shed$CCA400)
shed.CCA400 <- shed %>% filter(AnyStudentLoans=="Yes") %>% filter((CCA400 %in% c("Refused", "Not In Universe (not asked)", "")==FALSE)) 
tblCCA400 <- aggregate(data=shed.CCA400, Weight ~ CCA400 + Race + State, FUN=sum)
tblCCA4002 <- aggregate(data=shed.CCA400, Weight ~ CCA400 + State, FUN=sum)
tblCCA4002$Race <- rep("All", nrow(tblCCA4002))
tblCCA400 <- rbind(tblCCA400, tblCCA4002)
tblCCA400 <- reshape2::dcast(data=tblCCA400, Race + State ~ CCA400, value.var="Weight")
tblCCA400$`Share of borrowers who would put an emergency $400 expense on their credit card and pay it off immediately` <- tblCCA400$Yes / (tblCCA400$Yes + tblCCA400$No)
ggplot(data=tblCCA400, mapping=aes(y=Race, x=`Share of borrowers who would put an emergency $400 expense on their credit card and pay it off immediately`)) + geom_bar(stat="identity") + facet_grid(State ~ .) + scale_x_continuous(labels=scales::percent) 

# CCB400: # Put it on my credit card and pay it off over time ‐ Suppose that you have an emergency expense that costs $400. Based on your current financial situation, how would you pay for this expense? 

table(shed$CCB400)
shed.CCB400 <- shed %>% filter(AnyStudentLoans=="Yes") %>% filter((CCB400 %in% c("Refused", "Not In Universe (not asked)", "")==FALSE)) 
tblCCB400 <- aggregate(data=shed.CCB400, Weight ~ CCB400 + Race + State, FUN=sum)
tblCCB4002 <- aggregate(data=shed.CCB400, Weight ~ CCB400 + State, FUN=sum)
tblCCB4002$Race <- rep("All", nrow(tblCCB4002))
tblCCB400 <- rbind(tblCCB400, tblCCB4002)
tblCCB400 <- reshape2::dcast(data=tblCCB400, Race + State ~ CCB400, value.var="Weight")
tblCCB400$`Share of borrowers who would put an emergency $400 expense on their credit card and pay it off over time` <- tblCCB400$Yes / (tblCCB400$Yes + tblCCB400$No)
ggplot(data=tblCCB400, mapping=aes(y=Race, x=`Share of borrowers who would put an emergency $400 expense on their credit card and pay it off over time`)) + geom_bar(stat="identity") + facet_grid(State ~ .) + scale_x_continuous(labels=scales::percent) 

# Cash400: # With the money currently in my checking/savings account or with cash ‐ Suppose that you have an emergency expense that costs $400. Based on your current financial situation, how would you pay for this expense? 

table(shed$Cash400)
shed.Cash400 <- shed %>% filter(AnyStudentLoans=="Yes") %>% filter((Cash400 %in% c("Refused", "Not In Universe (not asked)", "")==FALSE)) 
tblCash400 <- aggregate(data=shed.Cash400, Weight ~ Cash400 + Race + State, FUN=sum)
tblCash4002 <- aggregate(data=shed.Cash400, Weight ~ Cash400 + State, FUN=sum)
tblCash4002$Race <- rep("All", nrow(tblCash4002))
tblCash400 <- rbind(tblCash400, tblCash4002)
tblCash400 <- reshape2::dcast(data=tblCash400, Race + State ~ Cash400, value.var="Weight")
tblCash400$`Share of borrowers who would pay an emergency $400 expense with cash` <- tblCash400$Yes / (tblCash400$Yes + tblCash400$No)
ggplot(data=tblCash400, mapping=aes(y=Race, x=`Share of borrowers who would pay an emergency $400 expense with cash`)) + geom_bar(stat="identity") + facet_grid(State ~ .) + scale_x_continuous(labels=scales::percent) 

# Loan400: #  Using money from a bank loan or line of credit ‐ Suppose that you have an emergency expense that costs $400. Based on your current financial situation, how would you pay for this expense? 

table(shed$Loan400)
shed.Loan400 <- shed %>% filter(AnyStudentLoans=="Yes") %>% filter((Loan400 %in% c("Refused", "Not In Universe (not asked)", "")==FALSE)) 
tblLoan400 <- aggregate(data=shed.Loan400, Weight ~ Loan400 + Race + State, FUN=sum)
tblLoan4002 <- aggregate(data=shed.Loan400, Weight ~ Loan400 + State, FUN=sum)
tblLoan4002$Race <- rep("All", nrow(tblLoan4002))
tblLoan400 <- rbind(tblLoan400, tblLoan4002)
tblLoan400 <- reshape2::dcast(data=tblLoan400, Race + State ~ Loan400, value.var="Weight")
tblLoan400$`Share of borrowers who would pay an emergency $400 expense with a loan` <- tblLoan400$Yes / (tblLoan400$Yes + tblLoan400$No)
ggplot(data=tblLoan400, mapping=aes(y=Race, x=`Share of borrowers who would pay an emergency $400 expense with a loan`)) + geom_bar(stat="identity") + facet_grid(State ~ .) + scale_x_continuous(labels=scales::percent) 

# Friend400: # By borrowing from a friend or family member ‐ Suppose that you have an emergency that costs $400. Based on your current financial situation, how would you pay for this expense?

table(shed$Friend400)
shed.Friend400 <- shed %>% filter(AnyStudentLoans=="Yes") %>% filter((Friend400 %in% c("Refused", "Not In Universe (not asked)", "")==FALSE)) 
tblFriend400 <- aggregate(data=shed.Friend400, Weight ~ Friend400 + Race + State, FUN=sum)
tblFriend4002 <- aggregate(data=shed.Friend400, Weight ~ Friend400 + State, FUN=sum)
tblFriend4002$Race <- rep("All", nrow(tblFriend4002))
tblFriend400 <- rbind(tblFriend400, tblFriend4002)
tblFriend400 <- reshape2::dcast(data=tblFriend400, Race + State ~ Friend400, value.var="Weight")
tblFriend400$`Share of borrowers who would pay an emergency $400 expense by borrowing from a friend or family` <- tblFriend400$Yes / (tblFriend400$Yes + tblFriend400$No)
ggplot(data=tblFriend400, mapping=aes(y=Race, x=`Share of borrowers who would pay an emergency $400 expense by borrowing from a friend or family`)) + geom_bar(stat="identity") + facet_grid(State ~ .) + scale_x_continuous(labels=scales::percent) 

# Payday400: # Using a payday loan, deposit advance, or overdraft ‐ Suppose that you have an emergency expense that costs $400. Based on your current financial situation, how would you pay for this expense? 

table(shed$Payday400)
shed.Payday400 <- shed %>% filter(AnyStudentLoans=="Yes") %>% filter((Payday400 %in% c("Refused", "Not In Universe (not asked)", "")==FALSE)) 
tblPayday400 <- aggregate(data=shed.Payday400, Weight ~ Payday400 + Race + State, FUN=sum)
tblPayday4002 <- aggregate(data=shed.Payday400, Weight ~ Payday400 + State, FUN=sum)
tblPayday4002$Race <- rep("All", nrow(tblPayday4002))
tblPayday400 <- rbind(tblPayday400, tblPayday4002)
tblPayday400 <- reshape2::dcast(data=tblPayday400, Race + State ~ Payday400, value.var="Weight")
tblPayday400$`Share of borrowers who would pay an emergency $400 expense with a payday loan` <- tblPayday400$Yes / (tblPayday400$Yes + tblPayday400$No)
ggplot(data=tblPayday400, mapping=aes(y=Race, x=`Share of borrowers who would pay an emergency $400 expense with a payday loan`)) + geom_bar(stat="identity") + facet_grid(State ~ .) + scale_x_continuous(labels=scales::percent) 

# Sell400: # By selling something ‐ Suppose that you have an emergency expense that costs $400. Based on your current financial situation, how would you pay for this expense? 

table(shed$Sell400)
shed.Sell400 <- shed %>% filter(AnyStudentLoans=="Yes") %>% filter((Sell400 %in% c("Refused", "Not In Universe (not asked)", "")==FALSE)) 
tblSell400 <- aggregate(data=shed.Sell400, Weight ~ Sell400 + Race + State, FUN=sum)
tblSell4002 <- aggregate(data=shed.Sell400, Weight ~ Sell400 + State, FUN=sum)
tblSell4002$Race <- rep("All", nrow(tblSell4002))
tblSell400 <- rbind(tblSell400, tblSell4002)
tblSell400 <- reshape2::dcast(data=tblSell400, Race + State ~ Sell400, value.var="Weight")
tblSell400$`Share of borrowers who would pay an emergency $400 expense by selling something` <- tblSell400$Yes / (tblSell400$Yes + tblSell400$No)
ggplot(data=tblSell400, mapping=aes(y=Race, x=`Share of borrowers who would pay an emergency $400 expense by selling something`)) + geom_bar(stat="identity") + facet_grid(State ~ .) + scale_x_continuous(labels=scales::percent) 

# None400: # I wouldn't be able to pay for the expense right now ‐ Suppose that you have an emergency expense that costs $400. Based on your current financial situation, how would you pay for this expense? 

table(shed$None400)
shed.None400 <- shed %>% filter(AnyStudentLoans=="Yes") %>% filter((None400 %in% c("Refused", "Not In Universe (not asked)", "")==FALSE)) 
tblNone400 <- aggregate(data=shed.None400, Weight ~ None400 + Race + State, FUN=sum)
tblNone4002 <- aggregate(data=shed.None400, Weight ~ None400 + State, FUN=sum)
tblNone4002$Race <- rep("All", nrow(tblNone4002))
tblNone400 <- rbind(tblNone400, tblNone4002)
tblNone400 <- reshape2::dcast(data=tblNone400, Race + State ~ None400, value.var="Weight")
tblNone400$`Share of borrowers who could not pay an emergency $400 expense` <- tblNone400$Yes / (tblNone400$Yes + tblNone400$No)
ggplot(data=tblNone400, mapping=aes(y=Race, x=`Share of borrowers who could not pay an emergency $400 expense`)) + geom_bar(stat="identity") + facet_grid(State ~ .) + scale_x_continuous(labels=scales::percent) 

###################################################################
### Education payoff                                            ###
###################################################################

# EdPayoff1: # Overall, how would you say the lifetime financial benefits of your [current/most recent] educational program compare to its financial costs? 

table(shed$EdPayoff1)
shed.EdPayoff1 <- shed %>% filter(is.na(EdPayoff1)==FALSE) %>% filter((EdPayoff1 %in% c("Refused", "", "Don't know", "Not In Universe (not asked)")==FALSE)) %>% filter(AnyStudentLoans=="Yes")
tblEdPayoff1 <- aggregate(data=shed.EdPayoff1, Weight ~ EdPayoff1 + Race + State, FUN=sum)
tblEdPayoff12 <- aggregate(data=shed.EdPayoff1, Weight ~ EdPayoff1 + State, FUN=sum)
tblEdPayoff12$Race <- rep("All", nrow(tblEdPayoff12))
tblEdPayoff1 <- rbind(tblEdPayoff1, tblEdPayoff12)
tblEdPayoff1 <- reshape2::dcast(data=tblEdPayoff1, Race + State ~ EdPayoff1, value.var="Weight")
tblEdPayoff1$`Total weight` <- tblEdPayoff1$`Financial benefits are much larger` + tblEdPayoff1$`Financial costs are somewhat larger` + tblEdPayoff1$`About the same` + tblEdPayoff1$`Financial benefits are somewhat larger` + tblEdPayoff1$`Financial costs are much larger`
tblEdPayoff1$`Financial benefits are much larger` <- tblEdPayoff1$`Financial benefits are much larger` / tblEdPayoff1$`Total weight`
tblEdPayoff1$`Financial benefits are somewhat larger` <- tblEdPayoff1$`Financial benefits are somewhat larger` / tblEdPayoff1$`Total weight`
tblEdPayoff1$`About the same` <- tblEdPayoff1$`About the same` / tblEdPayoff1$`Total weight`
tblEdPayoff1$`Financial costs are somewhat larger` <- tblEdPayoff1$`Financial costs are somewhat larger` / tblEdPayoff1$`Total weight`
tblEdPayoff1$`Financial costs are much larger` <- tblEdPayoff1$`Financial costs are much larger` / tblEdPayoff1$`Total weight`
tblEdPayoff1 <- reshape2::melt(data=tblEdPayoff1, id.vars = c("Race", "State"), value.name="Share of borrowers") %>% filter(variable != "Total weight")
tblEdPayoff1$variable <- factor(tblEdPayoff1$variable, levels = c("Financial costs are much larger", "Financial costs are somewhat larger", "About the same", "Financial benefits are somewhat larger", "Financial benefits are much larger"))
ggplot(data=tblEdPayoff1, mapping=aes(y=Race, x=`Share of borrowers`, fill=variable)) + geom_bar(stat="identity") + facet_grid(State ~ .) + scale_x_continuous(labels=scales::percent) + labs(fill="Lifetime payoff of education") 

# DiffField1: # Chosen a different field of study - If you could go back and make your education decisions again, would you have done any of these things: 

table(shed$DiffField1)
shed.DiffField1 <- shed %>% filter(AnyStudentLoans=="Yes") %>% filter((DiffField1 %in% c("Refused", "Not In Universe (not asked)", "")==FALSE)) 
tblDiffField1 <- aggregate(data=shed.DiffField1, Weight ~ DiffField1 + Race + State, FUN=sum)
tblDiffField12 <- aggregate(data=shed.DiffField1, Weight ~ DiffField1 + State, FUN=sum)
tblDiffField12$Race <- rep("All", nrow(tblDiffField12))
tblDiffField1 <- rbind(tblDiffField1, tblDiffField12)
tblDiffField1 <- reshape2::dcast(data=tblDiffField1, Race + State ~ DiffField1, value.var="Weight")
tblDiffField1$`Share of borrowers who would have chosen a different field of study` <- tblDiffField1$Yes / (tblDiffField1$Yes + tblDiffField1$No)
ggplot(data=tblDiffField1, mapping=aes(y=Race, x=`Share of borrowers who would have chosen a different field of study`)) + geom_bar(stat="identity") + facet_grid(State ~ .) + scale_x_continuous(labels=scales::percent) 

# DiffSchool1: # Attended a different school - If you could go back and make your education decisions again, would you have done any of these things: 

table(shed$DiffSchool1)
shed.DiffSchool1 <- shed %>% filter(AnyStudentLoans=="Yes") %>% filter((DiffSchool1 %in% c("Refused", "Not In Universe (not asked)", "")==FALSE)) 
tblDiffSchool1 <- aggregate(data=shed.DiffSchool1, Weight ~ DiffSchool1 + Race + State, FUN=sum)
tblDiffSchool12 <- aggregate(data=shed.DiffSchool1, Weight ~ DiffSchool1 + State, FUN=sum)
tblDiffSchool12$Race <- rep("All", nrow(tblDiffSchool12))
tblDiffSchool1 <- rbind(tblDiffSchool1, tblDiffSchool12)
tblDiffSchool1 <- reshape2::dcast(data=tblDiffSchool1, Race + State ~ DiffSchool1, value.var="Weight")
tblDiffSchool1$`Share of borrowers who would have chosen a different school` <- tblDiffSchool1$Yes / (tblDiffSchool1$Yes + tblDiffSchool1$No)
ggplot(data=tblDiffSchool1, mapping=aes(y=Race, x=`Share of borrowers who would have chosen a different school`)) + geom_bar(stat="identity") + facet_grid(State ~ .) + scale_x_continuous(labels=scales::percent) 

# LessEd1: # Not attended college or completed less education - If you could go back and make your education decisions again, would have done any of these things: 

table(shed$LessEd1)
shed.LessEd1 <- shed %>% filter(AnyStudentLoans=="Yes") %>% filter((LessEd1 %in% c("Refused", "Not In Universe (not asked)", "")==FALSE)) 
tblLessEd1 <- aggregate(data=shed.LessEd1, Weight ~ LessEd1 + Race + State, FUN=sum)
tblLessEd12 <- aggregate(data=shed.LessEd1, Weight ~ LessEd1 + State, FUN=sum)
tblLessEd12$Race <- rep("All", nrow(tblLessEd12))
tblLessEd1 <- rbind(tblLessEd1, tblLessEd12)
tblLessEd1 <- reshape2::dcast(data=tblLessEd1, Race + State ~ LessEd1, value.var="Weight")
tblLessEd1$`Share of borrowers who would have chosen less education` <- tblLessEd1$Yes / (tblLessEd1$Yes + tblLessEd1$No)
ggplot(data=tblLessEd1, mapping=aes(y=Race, x=`Share of borrowers who would have chosen less education`)) + geom_bar(stat="identity") + facet_grid(State ~ .) + scale_x_continuous(labels=scales::percent) 

# MoreEd1: # Completed more education - If you could go back and make your education decisions again, would you have done any of these things:

table(shed$MoreEd1)
shed.MoreEd1 <- shed %>% filter(AnyStudentLoans=="Yes") %>% filter((MoreEd1 %in% c("Refused", "Not In Universe (not asked)", "")==FALSE)) 
tblMoreEd1 <- aggregate(data=shed.MoreEd1, Weight ~ MoreEd1 + Race + State, FUN=sum)
tblMoreEd12 <- aggregate(data=shed.MoreEd1, Weight ~ MoreEd1 + State, FUN=sum)
tblMoreEd12$Race <- rep("All", nrow(tblMoreEd12))
tblMoreEd1 <- rbind(tblMoreEd1, tblMoreEd12)
tblMoreEd1 <- reshape2::dcast(data=tblMoreEd1, Race + State ~ MoreEd1, value.var="Weight")
tblMoreEd1$`Share of borrowers who would have chosen more education` <- tblMoreEd1$Yes / (tblMoreEd1$Yes + tblMoreEd1$No)
ggplot(data=tblMoreEd1, mapping=aes(y=Race, x=`Share of borrowers who would have chosen more education`)) + geom_bar(stat="identity") + facet_grid(State ~ .) + scale_x_continuous(labels=scales::percent) 

###################################################################
### Some more ways to break down respondents:                   ###
###################################################################

# InstLevel: # Level of institution

# InstControl: # Control of institution (IPEDS)

# Gender: # Gender

###################################################################
### Variables I may do nothing with after all:                  ###
###################################################################

# OwnRepaid: # Did you borrow money or take out any loans to pay for your own education that you have since repaid? 

# Retired: # Do you consider yourself to be retired? 

# Occupation: # Occupation (detailed) in current or main job 

