library(dplyr)
library(scales)
library(ggplot2)
library(reshape2)
library(data.table)

# I am adding this data frame here for use later. 

conversionsDF <- data.frame("Character.Entry" = c("PrivacySuppressed", "NULL"), "Numeric.Entry"=c(NA, NA))
conversionsDF <- conversionsDF %>% add_row(Character.Entry = "<=0.01", Numeric.Entry = 0)
conversionsDF <- conversionsDF %>% add_row(Character.Entry = "<=0.02", Numeric.Entry = 0.01)
conversionsDF <- conversionsDF %>% add_row(Character.Entry = "<=0.05", Numeric.Entry = 0.025)
conversionsDF <- conversionsDF %>% add_row(Character.Entry = "<=0.10", Numeric.Entry = 0.05) 
conversionsDF <- conversionsDF %>% add_row(Character.Entry = "<=0.20", Numeric.Entry = 0.1)
conversionsDF <- conversionsDF %>% add_row(Character.Entry = "0.01", Numeric.Entry = 0.01)
conversionsDF <- conversionsDF %>% add_row(Character.Entry = "0.02", Numeric.Entry = 0.02)
conversionsDF <- conversionsDF %>% add_row(Character.Entry = "0.03", Numeric.Entry = 0.03)
conversionsDF <- conversionsDF %>% add_row(Character.Entry = "0.04", Numeric.Entry = 0.04)
conversionsDF <- conversionsDF %>% add_row(Character.Entry = "0.05", Numeric.Entry = 0.05)
conversionsDF <- conversionsDF %>% add_row(Character.Entry = "0.06", Numeric.Entry = 0.06)
conversionsDF <- conversionsDF %>% add_row(Character.Entry = "0.07", Numeric.Entry = 0.07)
conversionsDF <- conversionsDF %>% add_row(Character.Entry = "0.08", Numeric.Entry = 0.08)
conversionsDF <- conversionsDF %>% add_row(Character.Entry = "0.09", Numeric.Entry = 0.09)
conversionsDF <- conversionsDF %>% add_row(Character.Entry = "0.10", Numeric.Entry = 0.10)
conversionsDF <- conversionsDF %>% add_row(Character.Entry = "0.11", Numeric.Entry = 0.11)
conversionsDF <- conversionsDF %>% add_row(Character.Entry = "0.12", Numeric.Entry = 0.12)
conversionsDF <- conversionsDF %>% add_row(Character.Entry = "0.13", Numeric.Entry = 0.13)
conversionsDF <- conversionsDF %>% add_row(Character.Entry = "0.14", Numeric.Entry = 0.14)
conversionsDF <- conversionsDF %>% add_row(Character.Entry = "0.15", Numeric.Entry = 0.15)
conversionsDF <- conversionsDF %>% add_row(Character.Entry = "0.16", Numeric.Entry = 0.16)
conversionsDF <- conversionsDF %>% add_row(Character.Entry = "0.17", Numeric.Entry = 0.17)
conversionsDF <- conversionsDF %>% add_row(Character.Entry = "0.18", Numeric.Entry = 0.18)
conversionsDF <- conversionsDF %>% add_row(Character.Entry = "0.19", Numeric.Entry = 0.19)
conversionsDF <- conversionsDF %>% add_row(Character.Entry = "0.20", Numeric.Entry = 0.20)
conversionsDF <- conversionsDF %>% add_row(Character.Entry = "0.21", Numeric.Entry = 0.21)
conversionsDF <- conversionsDF %>% add_row(Character.Entry = "0.22", Numeric.Entry = 0.22)
conversionsDF <- conversionsDF %>% add_row(Character.Entry = "0.23", Numeric.Entry = 0.23)
conversionsDF <- conversionsDF %>% add_row(Character.Entry = "0.24", Numeric.Entry = 0.24)
conversionsDF <- conversionsDF %>% add_row(Character.Entry = "0.25", Numeric.Entry = 0.25)
conversionsDF <- conversionsDF %>% add_row(Character.Entry = "0.26", Numeric.Entry = 0.26)
conversionsDF <- conversionsDF %>% add_row(Character.Entry = "0.27", Numeric.Entry = 0.27)
conversionsDF <- conversionsDF %>% add_row(Character.Entry = "0.28", Numeric.Entry = 0.28)
conversionsDF <- conversionsDF %>% add_row(Character.Entry = "0.29", Numeric.Entry = 0.29)
conversionsDF <- conversionsDF %>% add_row(Character.Entry = "0.30", Numeric.Entry = 0.30)
conversionsDF <- conversionsDF %>% add_row(Character.Entry = "0.31", Numeric.Entry = 0.31)
conversionsDF <- conversionsDF %>% add_row(Character.Entry = "0.32", Numeric.Entry = 0.32)
conversionsDF <- conversionsDF %>% add_row(Character.Entry = "0.33", Numeric.Entry = 0.33)
conversionsDF <- conversionsDF %>% add_row(Character.Entry = "0.34", Numeric.Entry = 0.34)
conversionsDF <- conversionsDF %>% add_row(Character.Entry = "0.35", Numeric.Entry = 0.35)
conversionsDF <- conversionsDF %>% add_row(Character.Entry = "0.36", Numeric.Entry = 0.36)
conversionsDF <- conversionsDF %>% add_row(Character.Entry = "0.37", Numeric.Entry = 0.37)
conversionsDF <- conversionsDF %>% add_row(Character.Entry = "0.38", Numeric.Entry = 0.38)
conversionsDF <- conversionsDF %>% add_row(Character.Entry = "0.39", Numeric.Entry = 0.39)
conversionsDF <- conversionsDF %>% add_row(Character.Entry = "0.03-0.04", Numeric.Entry = 0.035)
conversionsDF <- conversionsDF %>% add_row(Character.Entry = "0.05-0.06", Numeric.Entry = 0.055) 
conversionsDF <- conversionsDF %>% add_row(Character.Entry = "0.05-0.09", Numeric.Entry = 0.07)
conversionsDF <- conversionsDF %>% add_row(Character.Entry = "0.07-0.08", Numeric.Entry = 0.075)
conversionsDF <- conversionsDF %>% add_row(Character.Entry = "0.09-0.10", Numeric.Entry = 0.095)
conversionsDF <- conversionsDF %>% add_row(Character.Entry = "0.10-0.14", Numeric.Entry = 0.12)
conversionsDF <- conversionsDF %>% add_row(Character.Entry = "0.10-0.19", Numeric.Entry = 0.145)
conversionsDF <- conversionsDF %>% add_row(Character.Entry = "0.11-0.12", Numeric.Entry = 0.115)
conversionsDF <- conversionsDF %>% add_row(Character.Entry = "0.13-0.14", Numeric.Entry = 0.135)
conversionsDF <- conversionsDF %>% add_row(Character.Entry = "0.15-0.16", Numeric.Entry = 0.155)
conversionsDF <- conversionsDF %>% add_row(Character.Entry = "0.17-0.18", Numeric.Entry = 0.175)
conversionsDF <- conversionsDF %>% add_row(Character.Entry = "0.15-0.19", Numeric.Entry = 0.17)
conversionsDF <- conversionsDF %>% add_row(Character.Entry = "0.19-0.20", Numeric.Entry = 0.195)
conversionsDF <- conversionsDF %>% add_row(Character.Entry = "0.20-0.24", Numeric.Entry = 0.22)
conversionsDF <- conversionsDF %>% add_row(Character.Entry = "0.20-0.29", Numeric.Entry = 0.245)
conversionsDF <- conversionsDF %>% add_row(Character.Entry = "0.20-0.39", Numeric.Entry = 0.295)
conversionsDF <- conversionsDF %>% add_row(Character.Entry = "0.21-0.22", Numeric.Entry = 0.215)
conversionsDF <- conversionsDF %>% add_row(Character.Entry = "0.23-0.24", Numeric.Entry = 0.235)
conversionsDF <- conversionsDF %>% add_row(Character.Entry = "0.25-0.26", Numeric.Entry = 0.255)
conversionsDF <- conversionsDF %>% add_row(Character.Entry = "0.25-0.29", Numeric.Entry = 0.27)
conversionsDF <- conversionsDF %>% add_row(Character.Entry = "0.27-0.28", Numeric.Entry = 0.275)
conversionsDF <- conversionsDF %>% add_row(Character.Entry = "0.29-0.30", Numeric.Entry = 0.295)
conversionsDF <- conversionsDF %>% add_row(Character.Entry = "0.30-0.34", Numeric.Entry = 0.32)
conversionsDF <- conversionsDF %>% add_row(Character.Entry = "0.30-0.39", Numeric.Entry = 0.345)
conversionsDF <- conversionsDF %>% add_row(Character.Entry = "0.31-0.32", Numeric.Entry = 0.315)
conversionsDF <- conversionsDF %>% add_row(Character.Entry = "0.33-0.34", Numeric.Entry = 0.335)
conversionsDF <- conversionsDF %>% add_row(Character.Entry = "0.40-0.44", Numeric.Entry = 0.42)
conversionsDF <- conversionsDF %>% add_row(Character.Entry = "0.40-0.49", Numeric.Entry = 0.445)
conversionsDF <- conversionsDF %>% add_row(Character.Entry = "0.40-0.59", Numeric.Entry = 0.495)
conversionsDF <- conversionsDF %>% add_row(Character.Entry = "0.60-0.79", Numeric.Entry = 0.695)

# What are the demographics of enrollment by institution?
# We pool enrollment data from the latest 3 years available: 2018-19, 2019-20, and 2020-21.

effy2021 <- fread("effy2021.csv", header=TRUE, select=c(
  "UNITID",   # Unique identification number of the institution
  "EFFYALEV", # Level and degree/certificate-seeking status of student
  "EFYTOTLT", # Grand total
  "EFYAIANT", # American Indian or Alaska Native total
  "EFYASIAT", # Asian total
  "EFYBKAAT", # Black or African American total
  "EFYHISPT", # Hispanic or Latino total
  "EFYNHPIT", # Native Hawaiian or Other Pacific Islander total
  "EFYWHITT", # White total
  "EFY2MORT", # Two or more races total
  "EFYUNKNT", # Race/ethnicity unknown total
  "EFYNRALT"  # Nonresident alien total
)) %>% filter(EFFYALEV==1)

effy2020 <- fread("effy2020.csv", header=TRUE, select=c(
  "UNITID",   # Unique identification number of the institution
  "EFFYALEV", # Level and degree/certificate-seeking status of student
  "EFYTOTLT", # Grand total
  "EFYAIANT", # American Indian or Alaska Native total
  "EFYASIAT", # Asian total
  "EFYBKAAT", # Black or African American total
  "EFYHISPT", # Hispanic or Latino total
  "EFYNHPIT", # Native Hawaiian or Other Pacific Islander total
  "EFYWHITT", # White total
  "EFY2MORT", # Two or more races total
  "EFYUNKNT", # Race/ethnicity unknown total
  "EFYNRALT"  # Nonresident alien total
)) %>% filter(EFFYALEV==1)

effy2019 <- fread("effy2019_rv.csv", header=TRUE, select=c(
  "UNITID",   # Unique identification number of the institution
  "EFFYLEV", # Level and degree/certificate-seeking status of student
  "EFYTOTLT", # Grand total
  "EFYAIANT", # American Indian or Alaska Native total
  "EFYASIAT", # Asian total
  "EFYBKAAT", # Black or African American total
  "EFYHISPT", # Hispanic or Latino total
  "EFYNHPIT", # Native Hawaiian or Other Pacific Islander total
  "EFYWHITT", # White total
  "EFY2MORT", # Two or more races total
  "EFYUNKNT", # Race/ethnicity unknown total
  "EFYNRALT"  # Nonresident alien total
)) %>% filter(EFFYLEV==1)
names(effy2019)[2] <- "EFFYALEV"

effy3yr <- rbind(effy2021, effy2020, effy2019)
effy3yr <- aggregate(data=effy3yr, cbind(
  EFYTOTLT, # Grand total
  EFYAIANT, # American Indian or Alaska Native total
  EFYASIAT, # Asian total
  EFYBKAAT, # Black or African American total
  EFYHISPT, # Hispanic or Latino total
  EFYNHPIT, # Native Hawaiian or Other Pacific Islander total
  EFYWHITT, # White total
  EFY2MORT, # Two or more races total
  EFYUNKNT, # Race/ethnicity unknown total
  EFYNRALT  # Nonresident alien total
) ~ UNITID, FUN=sum)
hd2021.temp <- fread("hd2021.csv", header=TRUE, select=c("UNITID", "INSTNM", "STABBR", "OPEID"))
effy3yr <- left_join(x=effy3yr, y=hd2021.temp, by="UNITID")

effy3yr$EFYTOTLT[is.na(effy3yr$EFYTOTLT)] <- 0
effy3yr$EFYAIANT[is.na(effy3yr$EFYAIANT)] <- 0
effy3yr$EFYASIAT[is.na(effy3yr$EFYASIAT)] <- 0
effy3yr$EFYBKAAT[is.na(effy3yr$EFYBKAAT)] <- 0
effy3yr$EFYHISPT[is.na(effy3yr$EFYHISPT)] <- 0
effy3yr$EFYNHPIT[is.na(effy3yr$EFYNHPIT)] <- 0
effy3yr$EFYWHITT[is.na(effy3yr$EFYWHITT)] <- 0
effy3yr$EFY2MORT[is.na(effy3yr$EFY2MORT)] <- 0
effy3yr$EFYUNKNT[is.na(effy3yr$EFYUNKNT)] <- 0
effy3yr$EFYNRALT[is.na(effy3yr$EFYNRALT)] <- 0

effy3yr$`Share who are AIAN` <- effy3yr$EFYAIANT / effy3yr$EFYTOTLT
effy3yr$`Share who are ASIA` <- effy3yr$EFYASIAT / effy3yr$EFYTOTLT
effy3yr$`Share who are BKAA` <- effy3yr$EFYBKAAT / effy3yr$EFYTOTLT
effy3yr$`Share who are HISP` <- effy3yr$EFYHISPT / effy3yr$EFYTOTLT
effy3yr$`Share who are NHPI` <- effy3yr$EFYNHPIT / effy3yr$EFYTOTLT
effy3yr$`Share who are WHIT` <- effy3yr$EFYWHITT / effy3yr$EFYTOTLT
effy3yr$`Share who are 2MOR` <- effy3yr$EFY2MORT / effy3yr$EFYTOTLT
effy3yr$`Share who are UNKN` <- effy3yr$EFYUNKNT / effy3yr$EFYTOTLT
effy3yr$`Share who are NRAL` <- effy3yr$EFYNRALT / effy3yr$EFYTOTLT
effy3yr$`Share who are BKAA or HISP` <- (effy3yr$EFYBKAAT + effy3yr$EFYHISPT) / effy3yr$EFYTOTLT


# What are the demographics of enrollment by programs?
# We pool completion data from the latest 3 years available: 2018-19, 2019-20, and 2020-21.

c2021 <- fread("c2021_a.csv", header=TRUE, select=c(
  "UNITID",   # Unique identification number of the institution
  "CIPCODE",  # CIP Code -  2020 Classification
  "MAJORNUM", # First or Second Major
  "AWLEVEL",  # Award Level code
  "CTOTALT",  # Grand total
  "CAIANT",   # American Indian or Alaska Native total
  "CASIAT",   # Asian total
  "CBKAAT",   # Black or African American total
  "CHISPT",   # Hispanic or Latino total
  "CNHPIT",   # Native Hawaiian or Other Pacific Islander total
  "CWHITT",   # White total
  "C2MORT",   # Two or more races total
  "CUNKNT",   # Race/ethnicity unknown total
  "CNRALT"    # Nonresident alien total
)) %>% filter(MAJORNUM==1)

c2020 <- fread("c2020_a.csv", header=TRUE, select=c(
  "UNITID",   # Unique identification number of the institution
  "CIPCODE",  # CIP Code -  2020 Classification
  "MAJORNUM", # First or Second Major
  "AWLEVEL",  # Award Level code
  "CTOTALT",  # Grand total
  "CAIANT",   # American Indian or Alaska Native total
  "CASIAT",   # Asian total
  "CBKAAT",   # Black or African American total
  "CHISPT",   # Hispanic or Latino total
  "CNHPIT",   # Native Hawaiian or Other Pacific Islander total
  "CWHITT",   # White total
  "C2MORT",   # Two or more races total
  "CUNKNT",   # Race/ethnicity unknown total
  "CNRALT"    # Nonresident alien total
)) %>% filter(MAJORNUM==1)

c2yr <- rbind(c2021, c2020) %>% filter(CTOTALT != 0)
c2yr <- aggregate(data=c2yr, cbind(
  CTOTALT,  # Grand total
  CAIANT,   # American Indian or Alaska Native total
  CASIAT,   # Asian total
  CBKAAT,   # Black or African American total
  CHISPT,   # Hispanic or Latino total
  CNHPIT,   # Native Hawaiian or Other Pacific Islander total
  CWHITT,   # White total
  C2MORT,   # Two or more races total
  CUNKNT,   # Race/ethnicity unknown total
  CNRALT    # Nonresident alien total
) ~ UNITID + CIPCODE + AWLEVEL, FUN=sum)
hd2021.temp <- fread("hd2021.csv", header=TRUE, select=c("UNITID", "INSTNM", "STABBR", "OPEID"))
c2yr <- left_join(x=c2yr, y=hd2021.temp, by="UNITID")

c2yr$CTOTALT[is.na(c2yr$CTOTALT)] <- 0
c2yr$CAIANT[is.na(c2yr$CAIANT)] <- 0
c2yr$CASIAT[is.na(c2yr$CASIAT)] <- 0
c2yr$CBKAAT[is.na(c2yr$CBKAAT)] <- 0
c2yr$CHISPT[is.na(c2yr$CHISPT)] <- 0
c2yr$CNHPIT[is.na(c2yr$CNHPIT)] <- 0
c2yr$CWHITT[is.na(c2yr$CWHITT)] <- 0
c2yr$C2MORT[is.na(c2yr$C2MORT)] <- 0
c2yr$CUNKNT[is.na(c2yr$CUNKNT)] <- 0
c2yr$CNRALT[is.na(c2yr$CNRALT)] <- 0

c2yr$`Share who are AIAN` <- c2yr$CAIANT / c2yr$CTOTALT
c2yr$`Share who are ASIA` <- c2yr$CASIAT / c2yr$CTOTALT
c2yr$`Share who are BKAA` <- c2yr$CBKAAT / c2yr$CTOTALT
c2yr$`Share who are HISP` <- c2yr$CHISPT / c2yr$CTOTALT
c2yr$`Share who are NHPI` <- c2yr$CNHPIT / c2yr$CTOTALT
c2yr$`Share who are WHIT` <- c2yr$CWHITT / c2yr$CTOTALT
c2yr$`Share who are 2MOR` <- c2yr$C2MORT / c2yr$CTOTALT
c2yr$`Share who are UNKN` <- c2yr$CUNKNT / c2yr$CTOTALT
c2yr$`Share who are NRAL` <- c2yr$CNRALT / c2yr$CTOTALT
c2yr$`Share who are BKAA or HISP` <- (c2yr$CBKAAT + c2yr$CHISPT) / c2yr$CTOTALT

# Now we load in College scorecard data. First we start with institutions. 

CSI <- fread("Most-Recent-Cohorts-Institution.csv", header=TRUE, select=c(
  
  # Basic information about institutions: 
  "UNITID",       # Unit ID for institution
  "OPEID",        # 8-digit OPEID
  "OPEID6",       # 6-digit OPEID
  "INSTNM",       # Institution name
  "CITY",         # City
  "STABBR",       # State postcode
  "ACCREDAGENCY", # Accreditor for institution
  "ZIP",          # ZIP code
  "HCM2",         # Schools that are on Heightened Cash Monitoring 2 by the Department of Education
  "MAIN",         # "Flag for main campus (0 Not main campus, 1 Main campus)
  "PREDDEG",      # Predominant undergraduate degree awarded
  "CONTROL",      # Control of institution
  "CCBASIC",      # Carnegie Classification -- basic
  "DISTANCEONLY", # Flag for distance-education-only education
  "HIGHDEG",      # Highest degree awarded
  
  # Information about who enrolls at the institutions: 
  "UGDS_MEN",   # Total share of enrollment of undergraduate degree-seeking students who are men
  "UGDS_WOMEN", # Total share of enrollment of undergraduate degree-seeking students who are women
  "AGEGE24",    # Percent of students over 23 at entry
  "FEMALE",     # Share of female students
  "FIRST_GEN",  # Share of first-generation students
  "VETERAN",    # Share of veteran students
  "PCTPELL",    # Percentage of undergraduates who receive a Pell Grant
  "PCTFLOAN",   # Percent of all undergraduate students receiving a federal student loan
  
  # Necessary for above: 
  "D_PCTPELL_PCTFLOAN",  # Number of undergraduate students (denominator percent receiving a pell grant or federal student loan)
  
  # Information from Census about the communities students enroll from: 
  "PCT_WHITE",     # 	Percent of the population from students' zip codes that is White, via Census data
  "PCT_BLACK",     # 	Percent of the population from students' zip codes that is Black, via Census data
  "PCT_ASIAN",     # 	Percent of the population from students' zip codes that is Asian, via Census data
  "PCT_HISPANIC",  # 	Percent of the population from students' zip codes that is Hispanic, via Census data
  "PCT_BA",        # 	Percent of the population from students' zip codes with a bachelor's degree over the age 25, via Census data
  "PCT_GRAD_PROF", # 	Percent of the population from students' zip codes over 25 with a professional degree, via Census data
  "PCT_BORN_US",   # 	Percent of the population from students' zip codes that was born in the US, via Census data
  
  # Overall completion rates: 
  "C150_L4_POOLED_SUPP", # Completion rate for first-time, full-time students at less-than-four-year institutions (150% of expected time to completion) , pooled in two-year rolling averages and suppressed for small n size
  "C150_4_POOLED_SUPP",  # Completion rate for first-time, full-time students at four-year institutions (150% of expected time to completion) , pooled in two-year rolling averages and suppressed for small n size.
  "C150_4_PELL",         # 	Completion rate for first-time, full-time students receiving a Pell Grant during their first year of college at four-year institutions (150% of expected time to completion)
  
  # Completion rates by race at less-than-four-years: 
  "C150_L4_WHITE", # Completion rate for first-time, full-time students at less-than-four-year institutions (150% of expected time to completion) for white students
  "C150_L4_BLACK", # Completion rate for first-time, full-time students at less-than-four-year institutions (150% of expected time to completion) for black students
  "C150_L4_HISP",  # Completion rate for first-time, full-time students at less-than-four-year institutions (150% of expected time to completion) for Hispanic students
  "C150_L4_ASIAN", # Completion rate for first-time, full-time students at less-than-four-year institutions (150% of expected time to completion) for Asian students
  "C150_L4_AIAN",  # Completion rate for first-time, full-time students at less-than-four-year institutions (150% of expected time to completion) for American Indian/Alaska Native students
  "C150_L4_NHPI",  # Completion rate for first-time, full-time students at less-than-four-year institutions (150% of expected time to completion) for Native Hawaiian/Pacific Islander students
  "C150_L4_2MOR",  # Completion rate for first-time, full-time students at less-than-four-year institutions (150% of expected time to completion) for students of two-or-more-races
  "C150_L4_NRA",   # Completion rate for first-time, full-time students at less-than-four-year institutions (150% of expected time to completion) for non-resident alien students
  "C150_L4_UNKN",  # Completion rate for first-time, full-time students at less-than-four-year institutions (150% of expected time to completion) for students whose race is unknown
  
  # Completion rates by race at four-years: 
  "C150_4_WHITE", # Completion rate for first-time, full-time students at four-year institutions (150% of expected time to completion) for white students
  "C150_4_BLACK", # Completion rate for first-time, full-time students at four-year institutions (150% of expected time to completion) for black students
  "C150_4_HISP",  # Completion rate for first-time, full-time students at four-year institutions (150% of expected time to completion) for Hispanic students
  "C150_4_ASIAN", # Completion rate for first-time, full-time students at four-year institutions (150% of expected time to completion) for Asian students
  "C150_4_AIAN",  # Completion rate for first-time, full-time students at four-year institutions (150% of expected time to completion) for American Indian/Alaska Native students
  "C150_4_NHPI",  # Completion rate for first-time, full-time students at four-year institutions (150% of expected time to completion) for Native Hawaiian/Pacific Islander students
  "C150_4_2MOR",  # Completion rate for first-time, full-time students at four-year institutions (150% of expected time to completion) for students of two-or-more-races
  "C150_4_NRA",   # Completion rate for first-time, full-time students at four-year institutions (150% of expected time to completion) for non-resident alien students
  "C150_4_UNKN",  # Completion rate for first-time, full-time students at four-year institutions (150% of expected time to completion) for students whose race is unknown
  
  # Total existing student loan borrowers and total outstanding debt: 
  "LPSTAFFORD_CNT", # Number of borrowers with outstanding federal Direct Loan balances
  "LPSTAFFORD_AMT", # Total outstanding federal Direct Loan balance
  "LPPPLUS_CNT",    # Number of students associated with outstanding Parent PLUS Loan balances
  "LPPPLUS_AMT",    # Total outstanding Parent PLUS Loan balance
  "LPGPLUS_CNT",    # Number of students associated with outstanding Grad PLUS Loan balances
  "LPGPLUS_AMT",    # Total outstanding Grad PLUS Loan balance
  
  # Estimated range of students who receive Parent PLUS debt: 
  "PPLUS_PCT_LOW",  # Lower bound of estimated percentage range of students whose parents took out a PLUS loan
  "PPLUS_PCT_HIGH", # Upper bound of estimated percentage range of students whose parents took out a PLUS loan
  
  # Median Parent PLUS loan debt
  "PLUS_DEBT_INST_MD",        # Median PLUS loan debt disbursed at this institution
  "PLUS_DEBT_INST_COMP_MD",   # Median PLUS loan debt disbursed to completers at this institution
  "PLUS_DEBT_INST_PELL_MD",   # Median PLUS loan debt disbursed to Pell recipients at this institution
  "PLUS_DEBT_INST_NOPELL_MD", # Median PLUS loan debt disbursed to non-Pell-recipients at this institution
  
  # Median debt (excl. Parent PLUS)
  "DEBT_MDN",             # The median original amount of the loan principal upon entering repayment
  "GRAD_DEBT_MDN",        # The median debt for students who have completed
  "WDRAW_DEBT_MDN",       # The median debt for students who have not completed
  "LO_INC_DEBT_MDN",      # The median debt for students with family income between $0-$30,000
  "MD_INC_DEBT_MDN",      # The median debt for students with family income between $30,001-$75,000
  "HI_INC_DEBT_MDN",      # The median debt for students with family income $75,001+
  "DEP_DEBT_MDN",         # The median debt for dependent students
  "IND_DEBT_MDN",         # The median debt for independent students
  "PELL_DEBT_MDN",        # The median debt for Pell students
  "NOPELL_DEBT_MDN",      # The median debt for no-Pell students
  "FEMALE_DEBT_MDN",      # The median debt for female students
  "MALE_DEBT_MDN",        # The median debt for male students
  "FIRSTGEN_DEBT_MDN",    # The median debt for first-generation students
  "NOTFIRSTGEN_DEBT_MDN", # The median debt for not-first-generation students
  
  # Median debt: student counts
  "DEBT_N",       # The number of students in the median debt cohort
  "GRAD_DEBT_N",  # The number of students in the median debt completers cohort
  
  # Official cohort default rates
  "CDR2",       # Two-year cohort default rate
  "CDR3",       # Three-year cohort default rate
  "CDR2_DENOM", # Number of students in the cohort for the two-year cohort default rate
  "CDR3_DENOM", # Number of students in the cohort for the three-year cohort default rate
  
  # DBRR repayment rates: Undergraduate loans
  "DBRR1_FED_UG_N",   # Undergraduate federal student loan dollar-based 1-year repayment rate borrower count
  "DBRR1_FED_UG_NUM", # Undergraduate federal student loan dollar-based 1-year repayment rate numerator
  "DBRR1_FED_UG_DEN", # Undergraduate federal student loan dollar-based 1-year repayment rate denominator
  "DBRR1_FED_UG_RT",  # Undergraduate federal student loan dollar-based 1-year repayment rate
  "DBRR4_FED_UG_N",   # Undergraduate federal student loan dollar-based 4-year repayment rate borrower count
  "DBRR4_FED_UG_NUM", # Undergraduate federal student loan dollar-based 4-year repayment rate numerator
  "DBRR4_FED_UG_DEN", # Undergraduate federal student loan dollar-based 4-year repayment rate denominator
  "DBRR4_FED_UG_RT",  # Undergraduate federal student loan dollar-based 4-year repayment rate
  "DBRR5_FED_UG_N",   # Undergraduate federal student loan dollar-based 5-year repayment rate borrower count
  "DBRR5_FED_UG_NUM", # Undergraduate federal student loan dollar-based 5-year repayment rate numerator
  "DBRR5_FED_UG_DEN", # Undergraduate federal student loan dollar-based 5-year repayment rate denominator
  "DBRR5_FED_UG_RT",  # Undergraduate federal student loan dollar-based 5-year repayment rate
  "DBRR10_FED_UG_N",   # Undergraduate federal student loan dollar-based 10-year repayment rate borrower count
  "DBRR10_FED_UG_NUM", # Undergraduate federal student loan dollar-based 10-year repayment rate numerator
  "DBRR10_FED_UG_DEN", # Undergraduate federal student loan dollar-based 10-year repayment rate denominator
  "DBRR10_FED_UG_RT",  # Undergraduate federal student loan dollar-based 10-year repayment rate
  "DBRR20_FED_UG_N",   # Undergraduate federal student loan dollar-based 20-year repayment rate borrower count
  "DBRR20_FED_UG_NUM", # Undergraduate federal student loan dollar-based 20-year repayment rate numerator
  "DBRR20_FED_UG_DEN", # Undergraduate federal student loan dollar-based 20-year repayment rate denominator
  "DBRR20_FED_UG_RT",  # Undergraduate federal student loan dollar-based 20-year repayment rate
  
  # DBRR repayment rates: Graduate loans
  "DBRR1_FED_GR_N",   # Graduate federal student loan dollar-based 1-year repayment rate borrower count
  "DBRR1_FED_GR_NUM", # Graduate federal student loan dollar-based 1-year repayment rate numerator
  "DBRR1_FED_GR_DEN", # Graduate federal student loan dollar-based 1-year repayment rate denominator
  "DBRR1_FED_GR_RT",  # Graduate federal student loan dollar-based 1-year repayment rate
  "DBRR4_FED_GR_N",   # Graduate federal student loan dollar-based 4-year repayment rate borrower count
  "DBRR4_FED_GR_NUM", # Graduate federal student loan dollar-based 4-year repayment rate numerator
  "DBRR4_FED_GR_DEN", # Graduate federal student loan dollar-based 4-year repayment rate denominator
  "DBRR4_FED_GR_RT",  # Graduate federal student loan dollar-based 4-year repayment rate
  "DBRR5_FED_GR_N",   # Graduate federal student loan dollar-based 5-year repayment rate borrower count
  "DBRR5_FED_GR_NUM", # Graduate federal student loan dollar-based 5-year repayment rate numerator
  "DBRR5_FED_GR_DEN", # Graduate federal student loan dollar-based 5-year repayment rate denominator
  "DBRR5_FED_GR_RT",  # Graduate federal student loan dollar-based 5-year repayment rate
  "DBRR10_FED_GR_N",   # Graduate federal student loan dollar-based 10-year repayment rate borrower count
  "DBRR10_FED_GR_NUM", # Graduate federal student loan dollar-based 10-year repayment rate numerator
  "DBRR10_FED_GR_DEN", # Graduate federal student loan dollar-based 10-year repayment rate denominator
  "DBRR10_FED_GR_RT",  # Graduate federal student loan dollar-based 10-year repayment rate
  "DBRR20_FED_GR_N",   # Graduate federal student loan dollar-based 20-year repayment rate borrower count
  "DBRR20_FED_GR_NUM", # Graduate federal student loan dollar-based 20-year repayment rate numerator
  "DBRR20_FED_GR_DEN", # Graduate federal student loan dollar-based 20-year repayment rate denominator
  "DBRR20_FED_GR_RT",  # Graduate federal student loan dollar-based 20-year repayment rate
  
  # DBRR repayment rates: Parent PLUS loans
  "DBRR1_PP_UG_N",    # Undergraduate Parent PLUS Loan dollar-based 1-year repayment rate borrower count
  "DBRR1_PP_UG_NUM",  # Undergraduate Parent PLUS Loan dollar-based 1-year repayment rate numerator
  "DBRR1_PP_UG_DEN",  # Undergraduate Parent PLUS Loan dollar-based 1-year repayment rate denominator
  "DBRR1_PP_UG_RT",   # Undergraduate Parent PLUS Loan dollar-based 1-year repayment rate
  "DBRR4_PP_UG_N",    # Undergraduate Parent PLUS Loan dollar-based 4-year repayment rate borrower count
  "DBRR4_PP_UG_NUM",  # Undergraduate Parent PLUS Loan dollar-based 4-year repayment rate numerator
  "DBRR4_PP_UG_DEN",  # Undergraduate Parent PLUS Loan dollar-based 4-year repayment rate denominator
  "DBRR4_PP_UG_RT",   # Undergraduate Parent PLUS Loan dollar-based 4-year repayment rate
  "DBRR5_PP_UG_N",    # Undergraduate Parent PLUS Loan dollar-based 5-year repayment rate borrower count
  "DBRR5_PP_UG_NUM",  # Undergraduate Parent PLUS Loan dollar-based 5-year repayment rate numerator
  "DBRR5_PP_UG_DEN",  # Undergraduate Parent PLUS Loan dollar-based 5-year repayment rate denominator
  "DBRR5_PP_UG_RT",   # Undergraduate Parent PLUS Loan dollar-based 5-year repayment rate
  "DBRR10_PP_UG_N",    # Undergraduate Parent PLUS Loan dollar-based 10-year repayment rate borrower count
  "DBRR10_PP_UG_NUM",  # Undergraduate Parent PLUS Loan dollar-based 10-year repayment rate numerator
  "DBRR10_PP_UG_DEN",  # Undergraduate Parent PLUS Loan dollar-based 10-year repayment rate denominator
  "DBRR10_PP_UG_RT",   # Undergraduate Parent PLUS Loan dollar-based 10-year repayment rate
  "DBRR20_PP_UG_N",    # Undergraduate Parent PLUS Loan dollar-based 20-year repayment rate borrower count
  "DBRR20_PP_UG_NUM",  # Undergraduate Parent PLUS Loan dollar-based 20-year repayment rate numerator
  "DBRR20_PP_UG_DEN",  # Undergraduate Parent PLUS Loan dollar-based 20-year repayment rate denominator
  "DBRR20_PP_UG_RT",   # Undergraduate Parent PLUS Loan dollar-based 20-year repayment rate
  
  # DBRR repayment rates: Undergraduate completers 
  "DBRR1_FED_UGCOMP_N",     # Undergraduate borrower completers undergraduate federal student loan dollar-based 1-year repayment rate borrower count
  "DBRR1_FED_UGCOMP_NUM",   # Undergraduate borrower completers undergraduate federal student loan dollar-based 1-year repayment rate numerator
  "DBRR1_FED_UGCOMP_DEN",   # Undergraduate borrower completers undergraduate federal student loan dollar-based 1-year repayment rate denominator
  "DBRR1_FED_UGCOMP_RT",    # Undergraduate borrower completers undergraduate federal student loan dollar-based 1-year repayment rate
  "DBRR4_FED_UGCOMP_N",     # Undergraduate borrower completers undergraduate federal student loan dollar-based 4-year repayment rate borrower count
  "DBRR4_FED_UGCOMP_NUM",   # Undergraduate borrower completers undergraduate federal student loan dollar-based 4-year repayment rate numerator
  "DBRR4_FED_UGCOMP_DEN",   # Undergraduate borrower completers undergraduate federal student loan dollar-based 4-year repayment rate denominator
  "DBRR4_FED_UGCOMP_RT",    # Undergraduate borrower completers undergraduate federal student loan dollar-based 4-year repayment rate
  
  # DBRR repayment rates: Undergraduate non-completers 
  "DBRR1_FED_UGNOCOMP_N",   # Undergraduate borrower non-completers undergraduate federal student loan dollar-based 1-year repayment rate borrower count
  "DBRR1_FED_UGNOCOMP_NUM", # Undergraduate borrower non-completers undergraduate federal student loan dollar-based 1-year repayment rate numerator
  "DBRR1_FED_UGNOCOMP_DEN", # Undergraduate borrower non-completers undergraduate federal student loan dollar-based 1-year repayment rate denominator
  "DBRR1_FED_UGNOCOMP_RT",  # Undergraduate borrower non-completers undergraduate federal student loan dollar-based 1-year repayment rate repayment rate
  "DBRR4_FED_UGNOCOMP_N",   # Undergraduate borrower non-completers undergraduate federal student loan dollar-based 4-year repayment rate borrower count
  "DBRR4_FED_UGNOCOMP_NUM", # Undergraduate borrower non-completers undergraduate federal student loan dollar-based 4-year repayment rate numerator
  "DBRR4_FED_UGNOCOMP_DEN", # Undergraduate borrower non-completers undergraduate federal student loan dollar-based 4-year repayment rate denominator
  "DBRR4_FED_UGNOCOMP_RT",  # Undergraduate borrower non-completers undergraduate federal student loan dollar-based 4-year repayment rate repayment rate
  
  # BBRR repayment rates: 3-year Ns 
  "BBRR3_FED_UG_N",  # Undergraduate federal student loan borrower-based 3-year borrower count 
  "BBRR3_FED_GR_N",  # Graduate federal student loan borrower-based 3-year borrower count
  "BBRR3_PP_UG_N",   # Undergraduate student Parent PLUS Loan borrower-based 3-year borrower count
  
  # BBRR repayment rates: Undergraduate borrowers
  "BBRR1_FED_UG_DFLT",           # Percentage of undergraduate federal student loan borrowers in default after 1 year
  "BBRR1_FED_UG_DLNQ",           # Percentage of undergraduate federal student loan borrowers in delinquency after 1 year
  "BBRR1_FED_UG_NOPROG",         # Percentage of undergraduate federal student loan borrowers not making progress after 1 year
  "BBRR1_FED_UG_MAKEPROG",       # Percentage of undergraduate federal student loan borrowers making progress after 1 year
  "BBRR2_FED_UG_DFLT",           # Percentage of undergraduate federal student loan borrowers in default after 2 years
  "BBRR2_FED_UG_DLNQ",           # Percentage of undergraduate federal student loan borrowers in delinquency after 2 years
  "BBRR2_FED_UG_NOPROG",         # Percentage of undergraduate federal student loan borrowers not making progress after 2 years
  "BBRR2_FED_UG_MAKEPROG",       # Percentage of undergraduate federal student loan borrowers making progress after 2 years
  "BBRR3_FED_UG_DFLT",           # Percentage of undergraduate federal student loan borrowers in default after 3 years
  "BBRR3_FED_UG_DLNQ",           # Percentage of undergraduate federal student loan borrowers in delinquency after 3 years
  "BBRR3_FED_UG_NOPROG",         # Percentage of undergraduate federal student loan borrowers not making progress after 3 years
  "BBRR3_FED_UG_MAKEPROG",       # Percentage of undergraduate federal student loan borrowers making progress after 3 years
  
  # BBRR repayment rates: Undergraduate completers
  "BBRR1_FED_UGCOMP_DFLT",       # Percentage of undergraduate completer undergraduate federal student loan borrowers in default after 1 year
  "BBRR1_FED_UGCOMP_DLNQ",       # Percentage of undergraduate completer undergraduate federal student loan borrowers in delinquency after 1 year
  "BBRR1_FED_UGCOMP_NOPROG",     # Percentage of undergraduate completer undergraduate federal student loan borrowers not making progress after 1 year
  "BBRR1_FED_UGCOMP_MAKEPROG",   # Percentage of undergraduate completer undergraduate federal student loan borrowers making progress after 1 year
  "BBRR2_FED_UGCOMP_DFLT",       # Percentage of undergraduate completer undergraduate federal student loan borrowers in default after 2 years
  "BBRR2_FED_UGCOMP_DLNQ",       # Percentage of undergraduate completer undergraduate federal student loan borrowers in delinquency after 2 years
  "BBRR2_FED_UGCOMP_NOPROG",     # Percentage of undergraduate completer undergraduate federal student loan borrowers not making progress after 2 years
  "BBRR2_FED_UGCOMP_MAKEPROG",   # Percentage of undergraduate completer undergraduate federal student loan borrowers making progress after 2 years
  "BBRR3_FED_UGCOMP_DFLT",       # Percentage of undergraduate completer undergraduate federal student loan borrowers in default after 3 years
  "BBRR3_FED_UGCOMP_DLNQ",       # Percentage of undergraduate completer undergraduate federal student loan borrowers in delinquency after 3 years
  "BBRR3_FED_UGCOMP_NOPROG",     # Percentage of undergraduate completer undergraduate federal student loan borrowers not making progress after 3 years
  "BBRR3_FED_UGCOMP_MAKEPROG",   # Percentage of undergraduate completer undergraduate federal student loan borrowers making progress after 3 years
  
  # BBRR repayment rates: Undergraduate non-completers
  "BBRR1_FED_UGNOCOMP_DFLT",     # Percentage of undergraduate non-completer undergraduate federal student loan borrowers in default after 1 year
  "BBRR1_FED_UGNOCOMP_DLNQ",     # Percentage of undergraduate non-completer undergraduate federal student loan borrowers in delinquency after 1 year
  "BBRR1_FED_UGNOCOMP_NOPROG",   # Percentage of undergraduate non-completer undergraduate federal student loan borrowers not making progress after 1 year
  "BBRR1_FED_UGNOCOMP_MAKEPROG", # Percentage of undergraduate non-completer undergraduate federal student loan borrowers making progress after 1 year
  "BBRR2_FED_UGNOCOMP_DFLT",     # Percentage of undergraduate non-completer undergraduate federal student loan borrowers in default after 2 years
  "BBRR2_FED_UGNOCOMP_DLNQ",     # Percentage of undergraduate non-completer undergraduate federal student loan borrowers in delinquency after 2 years
  "BBRR2_FED_UGNOCOMP_NOPROG",   # Percentage of undergraduate non-completer undergraduate federal student loan borrowers not making progress after 2 years
  "BBRR2_FED_UGNOCOMP_MAKEPROG", # Percentage of undergraduate non-completer undergraduate federal student loan borrowers making progress after 2 years
  "BBRR3_FED_UGNOCOMP_DFLT",     # Percentage of undergraduate non-completer undergraduate federal student loan borrowers in default after 3 years
  "BBRR3_FED_UGNOCOMP_DLNQ",     # Percentage of undergraduate non-completer undergraduate federal student loan borrowers in delinquency after 3 years
  "BBRR3_FED_UGNOCOMP_NOPROG",   # Percentage of undergraduate non-completer undergraduate federal student loan borrowers not making progress after 3 years
  "BBRR3_FED_UGNOCOMP_MAKEPROG", # Percentage of undergraduate non-completer undergraduate federal student loan borrowers making progress after 3 years
  
  # BBRR repayment rates: Graduate borrowers
  "BBRR1_FED_GR_DFLT",           # Percentage of graduate federal student loan borrowers in default after 1 year
  "BBRR1_FED_GR_DLNQ",           # Percentage of graduate federal student loan borrowers in delinquency after 1 year
  "BBRR1_FED_GR_NOPROG",         # Percentage of graduate federal student loan borrowers not making progress after 1 year
  "BBRR1_FED_GR_MAKEPROG",       # Percentage of graduate federal student loan borrowers making progress after 1 year
  "BBRR2_FED_GR_DFLT",           # Percentage of graduate federal student loan borrowers in default after 2 years
  "BBRR2_FED_GR_DLNQ",           # Percentage of graduate federal student loan borrowers in delinquency after 2 years
  "BBRR2_FED_GR_NOPROG",         # Percentage of graduate federal student loan borrowers not making progress after 2 years
  "BBRR2_FED_GR_MAKEPROG",       # Percentage of graduate federal student loan borrowers making progress after 2 years
  "BBRR3_FED_GR_DFLT",           # Percentage of graduate federal student loan borrowers in default after 3 years
  "BBRR3_FED_GR_DLNQ",           # Percentage of graduate federal student loan borrowers in delinquency after 3 years
  "BBRR3_FED_GR_NOPROG",         # Percentage of graduate federal student loan borrowers not making progress after 3 years
  "BBRR3_FED_GR_MAKEPROG",       # Percentage of graduate federal student loan borrowers making progress after 3 years
  
  # BBRR repayment rates: Graduate completers
  "BBRR1_FED_GRCOMP_DFLT",       # Percentage of graduate completer graduate federal student loan borrowers in default after 1 year
  "BBRR1_FED_GRCOMP_DLNQ",       # Percentage of graduate completer graduate federal student loan borrowers in delinquency after 1 year
  "BBRR1_FED_GRCOMP_NOPROG",     # Percentage of graduate completer graduate federal student loan borrowers not making progress after 1 year
  "BBRR1_FED_GRCOMP_MAKEPROG",   # Percentage of graduate completer graduate federal student loan borrowers making progress after 1 year
  "BBRR2_FED_GRCOMP_DFLT",       # Percentage of graduate completer graduate federal student loan borrowers in default after 2 years
  "BBRR2_FED_GRCOMP_DLNQ",       # Percentage of graduate completer graduate federal student loan borrowers in delinquency after 2 years
  "BBRR2_FED_GRCOMP_NOPROG",     # Percentage of graduate completer graduate federal student loan borrowers not making progress after 2 years
  "BBRR2_FED_GRCOMP_MAKEPROG",   # Percentage of graduate completer graduate federal student loan borrowers making progress after 2 years
  "BBRR3_FED_GRCOMP_DFLT",       # Percentage of graduate completer graduate federal student loan borrowers in default after 3 years
  "BBRR3_FED_GRCOMP_DLNQ",       # Percentage of graduate completer graduate federal student loan borrowers in delinquency after 3 years
  "BBRR3_FED_GRCOMP_NOPROG",     # Percentage of graduate completer graduate federal student loan borrowers not making progress after 3 years
  "BBRR3_FED_GRCOMP_MAKEPROG",   # Percentage of graduate completer graduate federal student loan borrowers making progress after 3 years
  
  # BBRR repayment rates: Graduate non-completers
  "BBRR1_FED_GRNOCOMP_DFLT",     # Percentage of graduate non-completer graduate federal student loan borrowers in default after 1 year
  "BBRR1_FED_GRNOCOMP_DLNQ",     # Percentage of graduate non-completer graduate federal student loan borrowers in delinquency after 1 year
  "BBRR1_FED_GRNOCOMP_NOPROG",   # Percentage of graduate non-completer graduate federal student loan borrowers not making progress after 1 year
  "BBRR1_FED_GRNOCOMP_MAKEPROG", # Percentage of graduate non-completer graduate federal student loan borrowers making progress after 1 year
  "BBRR2_FED_GRNOCOMP_DFLT",     # Percentage of graduate non-completer graduate federal student loan borrowers in default after 2 years
  "BBRR2_FED_GRNOCOMP_DLNQ",     # Percentage of graduate non-completer graduate federal student loan borrowers in delinquency after 2 years
  "BBRR2_FED_GRNOCOMP_NOPROG",   # Percentage of graduate non-completer graduate federal student loan borrowers not making progress after 2 years
  "BBRR2_FED_GRNOCOMP_MAKEPROG", # Percentage of graduate non-completer graduate federal student loan borrowers making progress after 2 years
  "BBRR3_FED_GRNOCOMP_DFLT",     # Percentage of graduate non-completer graduate federal student loan borrowers in default after 3 years
  "BBRR3_FED_GRNOCOMP_DLNQ",     # Percentage of graduate non-completer graduate federal student loan borrowers in delinquency after 3 years
  "BBRR3_FED_GRNOCOMP_NOPROG",   # Percentage of graduate non-completer graduate federal student loan borrowers not making progress after 3 years
  "BBRR3_FED_GRNOCOMP_MAKEPROG", # Percentage of graduate non-completer graduate federal student loan borrowers making progress after 3 years
  
  # BBRR repayment rates: Parent PLUS borrowers
  "BBRR1_PP_UG_DFLT",           # Percentage of undergraduate student Parent PLUS Loan borrowers in default after 1 year
  "BBRR1_PP_UG_DLNQ",           # Percentage of undergraduate student Parent PLUS Loan borrowers in delinquency after 1 year
  "BBRR1_PP_UG_NOPROG",         # Percentage of undergraduate student Parent PLUS Loan borrowers not making progress after 1 year
  "BBRR1_PP_UG_MAKEPROG",       # Percentage of undergraduate student Parent PLUS Loan borrowers making progress after 1 year
  "BBRR2_PP_UG_DFLT",           # Percentage of undergraduate student Parent PLUS Loan borrowers in default after 2 years
  "BBRR2_PP_UG_DLNQ",           # Percentage of undergraduate student Parent PLUS Loan borrowers in delinquency after 2 years
  "BBRR2_PP_UG_NOPROG",         # Percentage of undergraduate student Parent PLUS Loan borrowers not making progress after 2 years
  "BBRR2_PP_UG_MAKEPROG",       # Percentage of undergraduate student Parent PLUS Loan borrowers making progress after 2 years
  "BBRR3_PP_UG_DFLT",           # Percentage of undergraduate student Parent PLUS Loan borrowers in default after 3 years
  "BBRR3_PP_UG_DLNQ",           # Percentage of undergraduate student Parent PLUS Loan borrowers in delinquency after 3 years
  "BBRR3_PP_UG_NOPROG",         # Percentage of undergraduate student Parent PLUS Loan borrowers not making progress after 3 years
  "BBRR3_PP_UG_MAKEPROG",       # Percentage of undergraduate student Parent PLUS Loan borrowers making progress after 3 years
  
  # BBRR repayment rates: Pell Grant recipients
  "BBRR1_FED_PELL_DFLT",       # Percentage of Pell Grant recipient federal student loan borrowers in default after 1 year
  "BBRR1_FED_PELL_DLNQ",       # Percentage of Pell Grant recipient federal student loan borrowers in delinquency after 1 year
  "BBRR1_FED_PELL_NOPROG",     # Percentage of Pell Grant recipient federal student loan borrowers not making progress after 1 year
  "BBRR1_FED_PELL_MAKEPROG",   # Percentage of Pell Grant recipient federal student loan borrowers making progress after 1 year
  "BBRR2_FED_PELL_DFLT",       # Percentage of Pell Grant recipient federal student loan borrowers in default after 2 years
  "BBRR2_FED_PELL_DLNQ",       # Percentage of Pell Grant recipient federal student loan borrowers in delinquency after 2 years
  "BBRR2_FED_PELL_NOPROG",     # Percentage of Pell Grant recipient federal student loan borrowers not making progress after 2 years
  "BBRR2_FED_PELL_MAKEPROG",   # Percentage of Pell Grant recipient federal student loan borrowers making progress after 2 years
  "BBRR3_FED_PELL_DFLT",       # Percentage of Pell Grant recipient federal student loan borrowers in default after 3 years
  "BBRR3_FED_PELL_DLNQ",       # Percentage of Pell Grant recipient federal student loan borrowers in delinquency after 3 years
  "BBRR3_FED_PELL_NOPROG",     # Percentage of Pell Grant recipient federal student loan borrowers not making progress after 3 years
  "BBRR3_FED_PELL_MAKEPROG",   # Percentage of Pell Grant recipient federal student loan borrowers making progress after 3 years
  
  # BBRR repayment rates: Pell non-recipients
  "BBRR1_FED_NOPELL_DFLT",     # Percentage of non-Pell Grant recipient federal student loan borrowers in default after 1 year
  "BBRR1_FED_NOPELL_DLNQ",     # Percentage of non-Pell Grant recipient federal student loan borrowers in delinquency after 1 year
  "BBRR1_FED_NOPELL_NOPROG",   # Percentage of non-Pell Grant recipient federal student loan borrowers not making progress after 1 year
  "BBRR1_FED_NOPELL_MAKEPROG", # Percentage of non-Pell Grant recipient federal student loan borrowers making progress after 1 year
  "BBRR2_FED_NOPELL_DFLT",     # Percentage of non-Pell Grant recipient federal student loan borrowers in default after 2 years
  "BBRR2_FED_NOPELL_DLNQ",     # Percentage of non-Pell Grant recipient federal student loan borrowers in delinquency after 2 years
  "BBRR2_FED_NOPELL_NOPROG",   # Percentage of non-Pell Grant recipient federal student loan borrowers not making progress after 2 years
  "BBRR2_FED_NOPELL_MAKEPROG", # Percentage of non-Pell Grant recipient federal student loan borrowers making progress after 2 years
  "BBRR3_FED_NOPELL_DFLT",     # Percentage of non-Pell Grant recipient federal student loan borrowers in default after 3 years
  "BBRR3_FED_NOPELL_DLNQ",     # Percentage of non-Pell Grant recipient federal student loan borrowers in delinquency after 3 years
  "BBRR3_FED_NOPELL_NOPROG",   # Percentage of non-Pell Grant recipient federal student loan borrowers not making progress after 3 years
  "BBRR3_FED_NOPELL_MAKEPROG", # Percentage of non-Pell Grant recipient federal student loan borrowers making progress after 3 years
  
  # BBRR repayment rates: Men
  "BBRR1_FED_MALE_DFLT",       # Percentage of male federal student loan borrowers in default after 1 year
  "BBRR1_FED_MALE_DLNQ",       # Percentage of male federal student loan borrowers in delinquency after 1 year
  "BBRR1_FED_MALE_NOPROG",     # Percentage of male federal student loan borrowers not making progress after 1 year
  "BBRR1_FED_MALE_MAKEPROG",   # Percentage of male federal student loan borrowers making progress after 1 year
  "BBRR2_FED_MALE_DFLT",       # Percentage of male federal student loan borrowers in default after 2 years
  "BBRR2_FED_MALE_DLNQ",       # Percentage of male federal student loan borrowers in delinquency after 2 years
  "BBRR2_FED_MALE_NOPROG",     # Percentage of male federal student loan borrowers not making progress after 2 years
  "BBRR2_FED_MALE_MAKEPROG",   # Percentage of male federal student loan borrowers making progress after 2 years
  "BBRR3_FED_MALE_DFLT",       # Percentage of male federal student loan borrowers in default after 3 years
  "BBRR3_FED_MALE_DLNQ",       # Percentage of male federal student loan borrowers in delinquency after 3 years
  "BBRR3_FED_MALE_NOPROG",     # Percentage of male federal student loan borrowers not making progress after 3 years
  "BBRR3_FED_MALE_MAKEPROG",   # Percentage of male federal student loan borrowers making progress after 3 years
  
  # BBRR repayment rates: Women / non-males
  "BBRR1_FED_NOMALE_DFLT",     # Percentage of non-male federal student loan borrowers in default after 1 year
  "BBRR1_FED_NOMALE_DLNQ",     # Percentage of non-male federal student loan borrowers in delinquency after 1 year
  "BBRR1_FED_NOMALE_NOPROG",   # Percentage of non-male federal student loan borrowers not making progress after 1 year
  "BBRR1_FED_NOMALE_MAKEPROG", # Percentage of non-male federal student loan borrowers making progress after 1 year
  "BBRR2_FED_NOMALE_DFLT",     # Percentage of non-male federal student loan borrowers in default after 2 years
  "BBRR2_FED_NOMALE_DLNQ",     # Percentage of non-male federal student loan borrowers in delinquency after 2 years
  "BBRR2_FED_NOMALE_NOPROG",   # Percentage of non-male federal student loan borrowers not making progress after 2 years
  "BBRR2_FED_NOMALE_MAKEPROG", # Percentage of non-male federal student loan borrowers making progress after 2 years
  "BBRR3_FED_NOMALE_DFLT",     # Percentage of non-male federal student loan borrowers in default after 3 years
  "BBRR3_FED_NOMALE_DLNQ",     # Percentage of non-male federal student loan borrowers in delinquency after 3 years
  "BBRR3_FED_NOMALE_NOPROG",   # Percentage of non-male federal student loan borrowers not making progress after 3 years
  "BBRR3_FED_NOMALE_MAKEPROG", # Percentage of non-male federal student loan borrowers making progress after 3 years
  
  # Repayment rates
  "RPY_1YR_RT",             # Fraction of repayment cohort who are not in default, and with loan balances that have declined one year since entering repayment, excluding enrolled and military deferment from calculation. (Rolling averages)
  "COMPL_RPY_1YR_RT",       # One-year repayment rate for completers
  "NONCOM_RPY_1YR_RT",      # One-year repayment rate for non-completers
  "PELL_RPY_1YR_RT",        # One-year repayment rate for students who received a Pell grant while at the school
  "NOPELL_RPY_1YR_RT",      # One-year repayment rate for students who never received a Pell grant while at school
  "FIRSTGEN_RPY_1YR_RT",    # One-year repayment rate for first-generation students
  "NOTFIRSTGEN_RPY_1YR_RT", # One-year repayment rate for students who are not first-generation
  "RPY_3YR_RT",             # Fraction of repayment cohort who are not in default, and with loan balances that have declined one year since entering repayment, excluding enrolled and military deferment from calculation. (Rolling averages)
  "COMPL_RPY_3YR_RT",       # Three-year repayment rate for completers
  "NONCOM_RPY_3YR_RT",      # Three-year repayment rate for non-completers
  "PELL_RPY_3YR_RT",        # Three-year repayment rate for students who received a Pell grant while at the school
  "NOPELL_RPY_3YR_RT",      # Three-year repayment rate for students who never received a Pell grant while at school
  "FIRSTGEN_RPY_3YR_RT",    # Three-year repayment rate for first-generation students
  "NOTFIRSTGEN_RPY_3YR_RT", # Three-year repayment rate for students who are not first-generation
  "RPY_5YR_RT",             # Fraction of repayment cohort who are not in default, and with loan balances that have declined one year since entering repayment, excluding enrolled and military deferment from calculation. (Rolling averages)
  "COMPL_RPY_5YR_RT",       # Five-year repayment rate for completers
  "NONCOM_RPY_5YR_RT",      # Five-year repayment rate for non-completers
  "PELL_RPY_5YR_RT",        # Five-year repayment rate for students who received a Pell grant while at the school
  "NOPELL_RPY_5YR_RT",      # Five-year repayment rate for students who never received a Pell grant while at school
  "FIRSTGEN_RPY_5YR_RT",    # Five-year repayment rate for first-generation students
  "NOTFIRSTGEN_RPY_5YR_RT", # Five-year repayment rate for students who are not first-generation
  "RPY_7YR_RT",             # Fraction of repayment cohort who are not in default, and with loan balances that have declined one year since entering repayment, excluding enrolled and military deferment from calculation. (Rolling averages)
  "COMPL_RPY_7YR_RT",       # Seven-year repayment rate for completers
  "NONCOM_RPY_7YR_RT",      # Seven-year repayment rate for non-completers
  "PELL_RPY_7YR_RT",        # Seven-year repayment rate for students who received a Pell grant while at the school
  "NOPELL_RPY_7YR_RT",      # Seven-year repayment rate for students who never received a Pell grant while at school
  "FIRSTGEN_RPY_7YR_RT",    # Seven-year repayment rate for first-generation students
  "NOTFIRSTGEN_RPY_7YR_RT", # Seven-year repayment rate for students who are not first-generation

  # Median earnings
  "COUNT_NWNE_P6",  # Number of students not working and not enrolled 6 years after entry
  "COUNT_WNE_P6",   # Number of students working and not enrolled 6 years after entry
  "MN_EARN_WNE_P6", # Mean earnings of students working and not enrolled 6 years after entry
  "MD_EARN_WNE_P6", # Median earnings of students working and not enrolled 6 years after entry
  "COUNT_NWNE_P8",  # Number of students not working and not enrolled 8 years after entry
  "COUNT_WNE_P8",   # Number of students working and not enrolled 8 years after entry
  "MN_EARN_WNE_P8", # Mean earnings of students working and not enrolled 8 years after entry
  "MD_EARN_WNE_P8", # Median earnings of students working and not enrolled 8 years after entry
  "COUNT_NWNE_P10",  # Number of students not working and not enrolled 10 years after entry
  "COUNT_WNE_P10",   # Number of students working and not enrolled 10 years after entry
  "MN_EARN_WNE_P10", # Mean earnings of students working and not enrolled 10 years after entry
  "MD_EARN_WNE_P10", # Median earnings of students working and not enrolled 10 years after entry
  
  # Median earnings by subgroup
  "MD_EARN_WNE_INC1_P6",   # Median earnings of students working and not enrolled 6 years after entry in the lowest income tercile $0-$30,000
  "MD_EARN_WNE_INC2_P6",   # Median earnings of students working and not enrolled 6 years after entry in the middle income tercile $30,001-$75,000
  "MD_EARN_WNE_INC3_P6",   # Median earnings of students working and not enrolled 6 years after entry in the highest income tercile $75,001+
  "MD_EARN_WNE_INDEP1_P6", # Median earnings of independent students working and not enrolled 6 years after entry
  "MD_EARN_WNE_INDEP0_P6", # Median earnings of dependent students working and not enrolled 6 years after entry
  "MD_EARN_WNE_MALE0_P6",  # Median earnings of non-male students working and not enrolled 6 years after entry
  "MD_EARN_WNE_MALE1_P6",  # Median earnings of male students working and not enrolled 6 years after entry
  "MD_EARN_WNE_INC1_P8",   # Median earnings of students working and not enrolled 8 years after entry in the lowest income tercile $0-$30,000
  "MD_EARN_WNE_INC2_P8",   # Median earnings of students working and not enrolled 8 years after entry in the middle income tercile $30,001-$75,000
  "MD_EARN_WNE_INC3_P8",   # Median earnings of students working and not enrolled 8 years after entry in the highest income tercile $75,001+
  "MD_EARN_WNE_INDEP1_P8", # Median earnings of independent students working and not enrolled 8 years after entry
  "MD_EARN_WNE_INDEP0_P8", # Median earnings of dependent students working and not enrolled 8 years after entry
  "MD_EARN_WNE_MALE0_P8",  # Median earnings of non-male students working and not enrolled 8 years after entry
  "MD_EARN_WNE_MALE1_P8",  # Median earnings of male students working and not enrolled 8 years after entry
  "MD_EARN_WNE_INC1_P10",   # Median earnings of students working and not enrolled 10 years after entry in the lowest income tercile $0-$30,000
  "MD_EARN_WNE_INC2_P10",   # Median earnings of students working and not enrolled 10 years after entry in the middle income tercile $30,001-$75,000
  "MD_EARN_WNE_INC3_P10",   # Median earnings of students working and not enrolled 10 years after entry in the highest income tercile $75,001+
  "MD_EARN_WNE_INDEP1_P10", # Median earnings of independent students working and not enrolled 10 years after entry
  "MD_EARN_WNE_INDEP0_P10", # Median earnings of dependent students working and not enrolled 10 years after entry
  "MD_EARN_WNE_MALE0_P10",  # Median earnings of non-male students working and not enrolled 10 years after entry
  "MD_EARN_WNE_MALE1_P10"  # Median earnings of male students working and not enrolled 10 years after entry
))

# Here, I crunch some numbers about which OPEID6s are entirely based in California. 

allCA <- CSI
allCA$Count <- rep(1, nrow(allCA))
allCA <- aggregate(data=allCA, Count ~ OPEID6 + STABBR, FUN=sum)
notInCA <- allCA %>% filter(STABBR != "CA")
Institutions.Based.At.Least.Partially.Outside.CA <- notInCA$OPEID6

# Now we pull from the program-level dataset. 

CSP <- fread("Most-Recent-Cohorts-Field-of-Study.csv", header=TRUE, select=c(
  
  # Basic information about institutions: 
  "UNITID",       # Unit ID for institution
  "OPEID6",       # 6-digit OPE ID for institution
  "INSTNM",       # Institution name
  "MAIN",         # Flag for main campus
  "CONTROL",      # Control of institution
  "CIPCODE",      # Classification of Instructional Programs (CIP) code for the field of study
  "CIPDESC",      # Text description of the field of study CIP Code
  "CREDLEV",      # Level of credential
  "CREDDESC",     # Text description of the level of credential
  
  # Pooled debt cohort counts 
  "IPEDSCOUNT1",                   # Number of awards to all students in year 1 of the pooled debt cohort
  "IPEDSCOUNT2",                   # Number of awards to all students in year 2 of the pooled debt cohort
  
  # Median Parent PLUS debt
  "DEBT_ALL_PP_EVAL_N",            # Student recipient count for average/median Parent PLUS loan debt disbursed at this institution
  "DEBT_ALL_PP_EVAL_MEAN",         # Average Parent PLUS loan debt disbursed at this institution
  "DEBT_ALL_PP_EVAL_MDN",          # Median Parent PLUS loan debt disbursed at this institution
  
  # Median Parent PLUS debt among families that received Pell 
  "DEBT_PELL_PP_EVAL_N",           # Student recipient count for average/median Parent PLUS loan debt disbursed to Pell recipients at this institution
  "DEBT_PELL_PP_EVAL_MEAN",        # Average Parent PLUS loan debt disbursed to Pell recipients at this institution
  "DEBT_PELL_PP_EVAL_MDN",         # Median Parent PLUS loan debt disbursed to Pell recipients at this institution
  
  # Median Stafford / Grad PLUS debt 
  "DEBT_ALL_STGP_EVAL_N",          # Borrower count for average/median Stafford and Grad PLUS loan debt disbursed at this institution
  "DEBT_ALL_STGP_EVAL_MEAN",       # Average Stafford and Grad PLUS loan debt disbursed at this institution
  "DEBT_ALL_STGP_EVAL_MDN",        # Median Stafford and Grad PLUS loan debt disbursed at this institution
  
  # Median Stafford / Grad PLUS debt among students that received Pell 
  "DEBT_PELL_STGP_EVAL_N",         # Borrower count for average/median Stafford and Grad PLUS loan debt disbursed to Pell recipients at this institution
  "DEBT_PELL_STGP_EVAL_MEAN",      # Average Stafford and Grad PLUS loan debt disbursed to Pell recipients at this institution
  "DEBT_PELL_STGP_EVAL_MDN",       # Median Stafford and Grad PLUS loan debt disbursed to Pell recipients at this institution
  
  # Median estimated monthly payments
  "DEBT_ALL_PP_EVAL_MDN10YRPAY",   # Median estimated monthly payment for Parent PLUS loan debt disbursed at this institution
  "DEBT_ALL_STGP_EVAL_MDN10YRPAY", # Median estimated monthly payment for Stafford and Grad PLUS loan debt disbursed at this institution
  
  # BBRR repayment rates: Undergraduate completers 
  "BBRR2_FED_COMP_N",        # Federal student loan borrower-based 2-year borrower count of completers
  "BBRR2_FED_COMP_DFLT",     # Percentage of undergraduate completer undergraduate federal student loan borrowers in default after 2 years
  "BBRR2_FED_COMP_DLNQ",     # Percentage of undergraduate completer undergraduate federal student loan borrowers in delinquency after 2 years
  "BBRR2_FED_COMP_NOPROG",   # Percentage of undergraduate completer undergraduate federal student loan borrowers not making progress after 2 years
  "BBRR2_FED_COMP_MAKEPROG", # Percentage of undergraduate completer undergraduate federal student loan borrowers making progress after 2 years
  "BBRR3_FED_COMP_N",        # Federal student loan borrower-based 3-year borrower count of completers
  "BBRR3_FED_COMP_DFLT",     # Percentage of undergraduate completer undergraduate federal student loan borrowers in default after 3 years
  "BBRR3_FED_COMP_DLNQ",     # Percentage of undergraduate completer undergraduate federal student loan borrowers in delinquency after 3 years
  "BBRR3_FED_COMP_NOPROG",   # Percentage of undergraduate completer undergraduate federal student loan borrowers not making progress after 3 years
  "BBRR3_FED_COMP_MAKEPROG", # Percentage of undergraduate completer undergraduate federal student loan borrowers making progress after 3 years
  
  # Median earnings of graduates working and not enrolled
  "EARN_MDN_HI_1YR",         # Median earnings of graduates working and not enrolled 1 year after completing highest credential
  "EARN_COUNT_WNE_HI_1YR",   # Number of graduates working and not enrolled 1 year after completing highest credential	
  "EARN_CNTOVER150_HI_1YR",  # Number of graduates working and not enrolled who earned more than 150% of the single-person household poverty threshold 1 year after completing highest credential
  "EARN_MDN_HI_2YR",         # Median earnings of graduates working and not enrolled 2 years after completing highest credential
  "EARN_COUNT_WNE_HI_2YR",   # Number of graduates working and not enrolled 2 years after completing highest credential	
  "EARN_CNTOVER150_HI_2YR",  # Number of graduates working and not enrolled who earned more than 150% of the single-person household poverty threshold 2 years after completing highest credential
  
  # Median earnings of graduates working and not enrolled, by Pell status and gender
  "EARN_PELL_WNE_MDN_1YR",   # Median earnings of graduates who received a Pell Grant and were working and not enrolled 1 year after completing highest credential
  "EARN_COUNT_PELL_WNE_1YR", # Number of graduates who received a Pell Grant and were working and not enrolled 1 year after completing highest credential
  "EARN_MALE_WNE_MDN_1YR",   # Median earnings of male graduates working and not enrolled 1 year after completing highest credential
  "EARN_NOMALE_WNE_MDN_1YR"  # Median earnings of non-male graduates working and not enrolled 1 year after completing highest credential
))
states <- CSI %>% select(UNITID, STABBR)
states$UNITID <- as.character(states$UNITID)
CSP <- left_join(x=CSP, y=states, by="UNITID")

# Now we make some adjustments. 

CSI$STABBR2 <- CSI$STABBR
effy3yr$STABBR[effy3yr$STABBR != "CA"] <- "Rest of U.S."
c2yr$STABBR[c2yr$STABBR != "CA"] <- "Rest of U.S."
CSI$STABBR[CSI$STABBR != "CA"] <- "Rest of U.S."
CSP$STABBR[CSP$STABBR != "CA"] <- "Rest of U.S."

effy3yr$STABBR[is.na(effy3yr$STABBR)] <- "Rest of U.S."
c2yr$STABBR[is.na(c2yr$STABBR)] <- "Rest of U.S."
CSI$STABBR[is.na(CSI$STABBR)] <- "Rest of U.S."
CSP$STABBR[is.na(CSP$STABBR)] <- "Rest of U.S."

CSI$CONTROL <- as.character(CSI$CONTROL)
CSI$CONTROL[CSI$CONTROL==1] <- "Public"
CSI$CONTROL[CSI$CONTROL==2] <- "Non-profit"
CSI$CONTROL[CSI$CONTROL==3] <- "For-profit"

CSP$CONTROL <- as.character(CSP$CONTROL)
CSP$CONTROL[CSP$CONTROL==1] <- "Public"
CSP$CONTROL[CSP$CONTROL==2] <- "Non-profit"
CSP$CONTROL[CSP$CONTROL==3] <- "For-profit"

# What are the basics of loan debt by Black share of enrollment? 
# What are the basics of loan debt by Hispanic share of enrollment? 

Q1 <- full_join(x=effy3yr, y=CSI, by="UNITID") %>% select(
  `UNITID`,                   # Unique identification of institution
  `INSTNM.x`,                 # Institution name
  `STABBR.x`,                 # State
  `CONTROL`,                  # Institution control
  `Share who are BKAA`,       # Share of students who are Black or African American
  `Share who are HISP`,       # Share of students who are Hispanic
  `PCT_BLACK`,                # Percent of the population from students' zip codes that is Black, via Census data
  `PCT_HISPANIC`,             # Percent of the population from students' zip codes that is Hispanic, via Census data
  `DEBT_MDN`,                 # The median original amount of the loan principal upon entering repayment
  `GRAD_DEBT_MDN`,            # The median debt for students who have completed
  `PLUS_DEBT_INST_MD`,        # Median PLUS loan debt disbursed at this institution
  `PLUS_DEBT_INST_COMP_MD`    # Median PLUS loan debt disbursed to completers at this institution
) %>% filter(CONTROL != "NA") %>% filter(STABBR.x != "NA")
Q1$PCT_BLACK <- as.numeric(Q1$PCT_BLACK)
Q1$PCT_HISPANIC <- as.numeric(Q1$PCT_HISPANIC)
Q1$DEBT_MDN <- as.numeric(Q1$DEBT_MDN)
Q1$GRAD_DEBT_MDN <- as.numeric(Q1$GRAD_DEBT_MDN)
Q1$PLUS_DEBT_INST_MD <- as.numeric(Q1$PLUS_DEBT_INST_MD)
Q1$PLUS_DEBT_INST_COMP_MD <- as.numeric(Q1$PLUS_DEBT_INST_COMP_MD)
ggplot(data=Q1, mapping=aes(x=`Share who are BKAA`, y=`GRAD_DEBT_MDN`)) + geom_point(stat="identity") + facet_grid(STABBR.x ~ CONTROL) + labs(x="Black students' share of enrollment")
ggplot(data=Q1, mapping=aes(x=`PCT_BLACK`, y=`GRAD_DEBT_MDN`)) + geom_point(stat="identity") + facet_grid(STABBR.x ~ CONTROL) + labs(x="Share of residents from students' ZIP codes who are Black")
ggplot(data=Q1, mapping=aes(x=`Share who are HISP`, y=`GRAD_DEBT_MDN`)) + geom_point(stat="identity") + facet_grid(STABBR.x ~ CONTROL) + labs(x="Hispanic students' share of enrollment")
ggplot(data=Q1, mapping=aes(x=`PCT_HISPANIC`, y=`GRAD_DEBT_MDN`)) + geom_point(stat="identity") + facet_grid(STABBR.x ~ CONTROL) + labs(x="Share of residents from students' ZIP codes who are Hispanic")

# What are the top 100 schools for Black enrollment in California?
# What are the top 100 schools for Hispanic enrollment in California?
# What are the top 100 schools for combined Black and Hispanic enrollment in California? 

Q2 <- effy3yr %>% select(
  `UNITID`, 
  `INSTNM`, 
  `STABBR`, 
  `Share who are BKAA`,
  `Share who are HISP`, 
  `Share who are BKAA or HISP`,
  `EFYTOTLT`
) %>% filter(EFYTOTLT >= 100) %>% filter(STABBR=="CA")
Q2$`Rank of BKAA share` <- rank(-(Q2$`Share who are BKAA`), ties.method="average")
Q2$`Rank of HISP share` <- rank(-(Q2$`Share who are HISP`), ties.method="average")
Q2$`Rank of BKAA/HISP share` <- rank(-(Q2$`Share who are BKAA or HISP`), ties.method="average")

### Which CIP codes in California have the most Black and Hispanic completions? 

Q3 <- c2yr %>% select(
  `UNITID`, 
  `OPEID`,
  `STABBR`,
  `CIPCODE`,
  `AWLEVEL`,
  `CTOTALT`,
  `CBKAAT`, 
  `CHISPT`
) %>% filter(STABBR=="CA")
Q3$CIPCODE <- as.character(Q3$CIPCODE)
Q3$CIPCODE <- ifelse(Q3$CIPCODE %in% c(
  "1", "2", "3", "4", "5", "6", "7", "8", "9", "10",
  "11", "12", "13", "14", "15", "16", "17", "18", "19", "20",
  "21", "22", "23", "24", "25", "26", "27", "28", "29", "30",
  "31", "32", "33", "34", "35", "36", "37", "38", "39", "40",
  "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", 
  "51", "52", "53", "54", "99"
), paste(Q3$CIPCODE, ".0000", sep=""), Q3$CIPCODE)
Q3$CIPCODE <-ifelse(substr(Q3$CIPCODE, 1, 2) %in% c("1.", "2.", "3.", "4.", "5.", "6.", "7.", "8.", "9."), paste("0", Q3$CIPCODE, sep=""), Q3$CIPCODE)
Q3$CIPCODE <-ifelse(nchar(Q3$CIPCODE)==4, paste(Q3$CIPCODE, "0", sep=""), Q3$CIPCODE)
Q3$CIPCODE <-ifelse(nchar(Q3$CIPCODE)==5, paste(Q3$CIPCODE, "0", sep=""), Q3$CIPCODE)
Q3$CIPCODE <-ifelse(nchar(Q3$CIPCODE)==6, paste(Q3$CIPCODE, "0", sep=""), Q3$CIPCODE)

Q3.2 <- Q3 
Q3.2$CIPCODE <- paste(substr(Q3.2$CIPCODE, 1, 2), ".0000", sep="")

Q3.4 <- Q3 
Q3.4$CIPCODE <- paste(substr(Q3.4$CIPCODE, 1, 5), "00", sep="")
forQ16 <- Q3.4

Q3.6 <- Q3 

Q3.2 <- aggregate(data=Q3.2, cbind(CTOTALT, CBKAAT, CHISPT) ~ CIPCODE, FUN=sum) %>% filter(CTOTALT >= 500)
Q3.2$`Share who are BKAA` <- Q3.2$CBKAAT / Q3.2$CTOTALT
Q3.2$`Share who are HISP` <- Q3.2$CHISPT / Q3.2$CTOTALT
Q3.2$`Share who are BKAA or HISP` <- (Q3.2$CBKAAT + Q3.2$CHISPT) / Q3.2$CTOTALT
Q3.2$`Rank of BKAA share` <- rank(-(Q3.2$`Share who are BKAA`), ties.method="average")
Q3.2$`Rank of HISP share` <- rank(-(Q3.2$`Share who are HISP`), ties.method="average")
Q3.2$`Rank of BKAA/HISP share` <- rank(-(Q3.2$`Share who are BKAA or HISP`), ties.method="average")

Q3.4 <- aggregate(data=Q3.4, cbind(CTOTALT, CBKAAT, CHISPT) ~ CIPCODE, FUN=sum) %>% filter(CTOTALT >= 500)
Q3.4$`Share who are BKAA` <- Q3.4$CBKAAT / Q3.4$CTOTALT
Q3.4$`Share who are HISP` <- Q3.4$CHISPT / Q3.4$CTOTALT
Q3.4$`Share who are BKAA or HISP` <- (Q3.4$CBKAAT + Q3.4$CHISPT) / Q3.4$CTOTALT
Q3.4$`Rank of BKAA share` <- rank(-(Q3.4$`Share who are BKAA`), ties.method="average")
Q3.4$`Rank of HISP share` <- rank(-(Q3.4$`Share who are HISP`), ties.method="average")
Q3.4$`Rank of BKAA/HISP share` <- rank(-(Q3.4$`Share who are BKAA or HISP`), ties.method="average")

Q3.6 <- aggregate(data=Q3.6, cbind(CTOTALT, CBKAAT, CHISPT) ~ CIPCODE, FUN=sum) %>% filter(CTOTALT >= 500)
Q3.6$`Share who are BKAA` <- Q3.6$CBKAAT / Q3.6$CTOTALT
Q3.6$`Share who are HISP` <- Q3.6$CHISPT / Q3.6$CTOTALT
Q3.6$`Share who are BKAA or HISP` <- (Q3.6$CBKAAT + Q3.6$CHISPT) / Q3.6$CTOTALT
Q3.6$`Rank of BKAA share` <- rank(-(Q3.6$`Share who are BKAA`), ties.method="average")
Q3.6$`Rank of HISP share` <- rank(-(Q3.6$`Share who are HISP`), ties.method="average")
Q3.6$`Rank of BKAA/HISP share` <- rank(-(Q3.6$`Share who are BKAA or HISP`), ties.method="average")

CIPs <- fread("CIPCode2020.csv", header=TRUE, select=c(
  "CIPCode", 
  "CIPTitle"
))
names(CIPs)[1] <- "CIPCODE"
CIPs$CIPCODE <- as.character(CIPs$CIPCODE)
CIPs$CIPCODE <-ifelse(CIPs$CIPCODE %in% c(
  "1", "2", "3", "4", "5", "6", "7", "8", "9", "10",
  "11", "12", "13", "14", "15", "16", "17", "18", "19", "20",
  "21", "22", "23", "24", "25", "26", "27", "28", "29", "30",
  "31", "32", "33", "34", "35", "36", "37", "38", "39", "40",
  "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", 
  "51", "52", "53", "54", "99"
), paste(CIPs$CIPCODE, ".0000", sep=""), CIPs$CIPCODE)
CIPs$CIPCODE <-ifelse(substr(CIPs$CIPCODE, 1, 2) %in% c("1.", "2.", "3.", "4.", "5.", "6.", "7.", "8.", "9."), paste("0", CIPs$CIPCODE, sep=""), CIPs$CIPCODE)
CIPs$CIPCODE <-ifelse(nchar(CIPs$CIPCODE)==4, paste(CIPs$CIPCODE, "0", sep=""), CIPs$CIPCODE)
CIPs$CIPCODE <-ifelse(nchar(CIPs$CIPCODE)==5, paste(CIPs$CIPCODE, "0", sep=""), CIPs$CIPCODE)
CIPs$CIPCODE <-ifelse(nchar(CIPs$CIPCODE)==6, paste(CIPs$CIPCODE, "0", sep=""), CIPs$CIPCODE)
CIP2 <- CIPs %>% filter(substr(CIPCODE, 4, 7) == "0000") %>% filter(duplicated(CIPCODE)==FALSE)
CIP4 <- CIPs %>% filter(substr(CIPCODE, 6, 7) == "00") %>% filter(substr(CIPCODE, 4, 5) != "00") %>% filter(duplicated(CIPCODE)==FALSE)
CIP6 <- CIPs %>% filter(substr(CIPCODE, 6, 7) != "00") %>% filter(duplicated(CIPCODE)==FALSE)

Q3.2 <- left_join(x=Q3.2, y=CIP2, by="CIPCODE")
Q3.4 <- left_join(x=Q3.4, y=CIP4, by="CIPCODE")
Q3.6 <- left_join(x=Q3.6, y=CIP6, by="CIPCODE")

### How does the Black share of enrollment relate to cohort default rate?
# CDR is organized by OPEID6

CSI.Q4 <- CSI %>% select(UNITID, OPEID, OPEID6, INSTNM, CONTROL, STABBR, CDR3, CDR3_DENOM, PCT_BLACK, PCT_HISPANIC, FIRST_GEN, VETERAN)
CSI.Q4$OPEID6 <- as.character(CSI.Q4$OPEID6)
CSI.Q4$OPEID6 <- ifelse(nchar(CSI.Q4$OPEID6)==4, paste("0", CSI.Q4$OPEID6, sep=""), CSI.Q4$OPEID6)
CSI.Q4$OPEID6 <- ifelse(nchar(CSI.Q4$OPEID6)==5, paste("0", CSI.Q4$OPEID6, sep=""), CSI.Q4$OPEID6)
CSI.Q4 <- CSI.Q4 %>% filter(duplicated(OPEID6)==FALSE)
  
effy3yr.Q4 <- effy3yr %>% select(UNITID, OPEID, STABBR, INSTNM, EFYTOTLT, EFYBKAAT, EFYHISPT) %>% filter(OPEID != -2) %>% filter(STABBR=="CA")
effy3yr.Q4$OPEID <- as.character(effy3yr.Q4$OPEID)
effy3yr.Q4$OPEID <- ifelse(nchar(effy3yr.Q4$OPEID)==6, paste("0", effy3yr.Q4$OPEID, sep=""), effy3yr.Q4$OPEID)
effy3yr.Q4$OPEID <- ifelse(nchar(effy3yr.Q4$OPEID)==7, paste("0", effy3yr.Q4$OPEID, sep=""), effy3yr.Q4$OPEID)
effy3yr.Q4$OPEID6 <- substr(effy3yr.Q4$OPEID, 1, 6)
effy3yr.Q4 <- aggregate(data=effy3yr.Q4, cbind(EFYTOTLT, EFYBKAAT, EFYHISPT) ~ OPEID6, FUN=sum)

Q4 <- inner_join(x=CSI.Q4, y=effy3yr.Q4, by="OPEID6")
Q4$CDR3 <- as.numeric(Q4$CDR3)
Q4$CDR3_DENOM <- as.numeric(Q4$CDR3_DENOM)
Q4 <- Q4 %>% filter(CDR3_DENOM >= 200)
Q4$`Share that is BKAA` <- Q4$EFYBKAAT / Q4$EFYTOTLT
Q4$`Share that is HISP` <- Q4$EFYHISPT / Q4$EFYTOTLT
Q4$`Share that is BKAA or HISP` <- (Q4$EFYBKAAT + Q4$EFYHISPT) / Q4$EFYTOTLT

ggplot(data=Q4, mapping=aes(x=`Share that is BKAA`, y=CDR3)) + geom_point(stat="identity") + facet_grid(. ~ CONTROL)
ggplot(data=Q4, mapping=aes(x=`Share that is HISP`, y=CDR3)) + geom_point(stat="identity") + facet_grid(. ~ CONTROL)
ggplot(data=Q4, mapping=aes(x=`Share that is BKAA or HISP`, y=CDR3)) + geom_point(stat="identity") + facet_grid(. ~ CONTROL)

# Let's examine some other variables in the Scorecard data and how they relate to CDR. 

Q5 <- CSI.Q4
Q5 <- Q5 %>% filter(STABBR=="CA")

Q5$CDR3 <- as.numeric(Q5$CDR3)
Q5$CDR3_DENOM <- as.numeric(Q5$CDR3_DENOM)
Q5$PCT_BLACK <- as.numeric(Q5$PCT_BLACK)
Q5$PCT_HISPANIC <- as.numeric(Q5$PCT_HISPANIC)
Q5$FIRST_GEN <- as.numeric(Q5$FIRST_GEN)
Q5$VETERAN <- as.numeric(Q5$VETERAN)
Q5 <- Q5 %>% filter(CDR3_DENOM >= 200)

ggplot(data=Q5, mapping=aes(x=PCT_BLACK, y=CDR3)) + geom_point(stat="identity") + facet_grid(. ~ CONTROL)
ggplot(data=Q5, mapping=aes(x=PCT_HISPANIC, y=CDR3)) + geom_point(stat="identity") + facet_grid(. ~ CONTROL)
ggplot(data=Q5, mapping=aes(x=FIRST_GEN, y=CDR3)) + geom_point(stat="identity") + facet_grid(. ~ CONTROL)
ggplot(data=Q5, mapping=aes(x=VETERAN, y=CDR3)) + geom_point(stat="identity") + facet_grid(. ~ CONTROL)

# Let's find the top institutions by total outstanding balance amounts.

Q6 <- CSI %>% select(UNITID, OPEID, OPEID6, INSTNM, CONTROL, STABBR, MAIN, LPSTAFFORD_CNT, LPSTAFFORD_AMT, LPPPLUS_CNT, LPPPLUS_AMT, LPGPLUS_CNT, LPGPLUS_AMT) %>% filter(STABBR=="CA") %>% filter(MAIN==1) %>% filter(duplicated(OPEID6)==FALSE)

Q6$LPSTAFFORD_CNT <- as.numeric(Q6$LPSTAFFORD_CNT)
Q6$LPSTAFFORD_AMT <- as.numeric(Q6$LPSTAFFORD_AMT)
Q6$LPPPLUS_CNT <- as.numeric(Q6$LPPPLUS_CNT)
Q6$LPPPLUS_AMT <- as.numeric(Q6$LPPPLUS_AMT)
Q6$LPGPLUS_CNT <- as.numeric(Q6$LPGPLUS_CNT)
Q6$LPGPLUS_AMT <- as.numeric(Q6$LPGPLUS_AMT)

Q6$`Total outstanding debt` <- Q6$LPSTAFFORD_AMT + Q6$LPPPLUS_AMT + Q6$LPGPLUS_AMT
Q6$`Average outstanding Stafford debt` <- Q6$LPSTAFFORD_AMT / Q6$LPSTAFFORD_CNT
Q6$`Average outstanding Parent PLUS debt` <- Q6$LPPPLUS_AMT / Q6$LPPPLUS_CNT
Q6$`Average outstanding Grad PLUS debt` <- Q6$LPGPLUS_AMT / Q6$LPGPLUS_CNT

Q6.TotalStaffordDebt <- Q6 %>% arrange(desc(`Average outstanding Stafford debt`)) %>% filter(LPSTAFFORD_CNT >= 500) %>% select(INSTNM, CONTROL, LPSTAFFORD_AMT, LPSTAFFORD_CNT, `Average outstanding Stafford debt`)
Q6.TotalParentDebt <- Q6 %>% arrange(desc(`Average outstanding Parent PLUS debt`)) %>% filter(LPPPLUS_CNT >= 500) %>% select(INSTNM, CONTROL, LPPPLUS_AMT, LPPPLUS_CNT, `Average outstanding Parent PLUS debt`)
Q6.TotalGradDebt <- Q6 %>% arrange(desc(`Average outstanding Grad PLUS debt`)) %>% filter(LPGPLUS_CNT >= 500) %>% select(INSTNM, CONTROL, LPGPLUS_AMT, LPGPLUS_CNT, `Average outstanding Grad PLUS debt`)
Q6.TotalDebt <- Q6 %>% filter((OPEID6 %in% Institutions.Based.At.Least.Partially.Outside.CA)==FALSE) %>% arrange(desc(`Total outstanding debt`)) %>% select(INSTNM, CONTROL, `Total outstanding debt`)

Q6.TotalStaffordDebt$`Average outstanding Stafford debt` <- comma(round((Q6.TotalStaffordDebt$`Average outstanding Stafford debt`), -2))
Q6.TotalParentDebt$`Average outstanding Parent PLUS debt` <- comma(round((Q6.TotalParentDebt$`Average outstanding Parent PLUS debt`), -2))
Q6.TotalGradDebt$`Average outstanding Grad PLUS debt` <- comma(round((Q6.TotalGradDebt$`Average outstanding Grad PLUS debt`), -2))

Q6.TotalStaffordDebt$LPSTAFFORD_AMT <- comma(round((Q6.TotalStaffordDebt$LPSTAFFORD_AMT), -3))
Q6.TotalParentDebt$LPPPLUS_AMT <- comma(round((Q6.TotalParentDebt$LPPPLUS_AMT), -3))
Q6.TotalGradDebt$LPGPLUS_AMT <- comma(round((Q6.TotalGradDebt$LPGPLUS_AMT), -3))
Q6.TotalDebt$`Total outstanding debt` <- comma(round((Q6.TotalDebt$`Total outstanding debt`), -3))

Q6.TotalStaffordDebt$LPSTAFFORD_CNT <- comma((Q6.TotalStaffordDebt$LPSTAFFORD_CNT))
Q6.TotalParentDebt$LPPPLUS_CNT <- comma((Q6.TotalParentDebt$LPPPLUS_CNT))
Q6.TotalGradDebt$LPGPLUS_CNT <- comma((Q6.TotalGradDebt$LPGPLUS_CNT))

# Top institutions by share of students borrowing Parent PLUS and undergraduate federal loans 

Q7 <- CSI %>% select(UNITID, OPEID, OPEID6, INSTNM, CONTROL, STABBR, PPLUS_PCT_LOW, PPLUS_PCT_HIGH) %>% filter(STABBR=="CA") %>% filter(duplicated(OPEID6==FALSE))
Q7$PPLUS_PCT_LOW <- as.numeric(Q7$PPLUS_PCT_LOW)
Q7$PPLUS_PCT_HIGH <- as.numeric(Q7$PPLUS_PCT_HIGH)
Q7$PPLUS_PCT_MID <- (Q7$PPLUS_PCT_LOW + Q7$PPLUS_PCT_HIGH) / 2
Q7 <- Q7 %>% arrange(desc(PPLUS_PCT_MID))

# Top institutions by share of students borrowing undergraduate federal loans 

Q8 <- CSI %>% select(UNITID, OPEID, OPEID6, INSTNM, CONTROL, STABBR, PCTFLOAN) %>% filter(STABBR=="CA") 
Q8$PCTFLOAN <- as.numeric(Q8$PCTFLOAN)
Q8 <- Q8 %>% arrange(desc(PCTFLOAN))

# Let's now link this to enrollment by race. 
Q8 <- left_join(x=Q8, y=effy3yr, by="UNITID")
ggplot(data=Q8, mapping=aes(x=`Share who are BKAA`, y=PCTFLOAN)) + geom_point(stat="identity") + facet_grid(. ~ CONTROL)

# DBRR by share of students who are Black 
# Maybe do this for the controls, separately?

Q9 <- CSI %>% select(UNITID, OPEID, OPEID6, INSTNM, STABBR, CONTROL, DBRR1_FED_UG_N, DBRR1_FED_UG_NUM, DBRR1_FED_UG_DEN, DBRR1_FED_UG_RT,  DBRR4_FED_UG_N, DBRR4_FED_UG_NUM, DBRR4_FED_UG_DEN, DBRR4_FED_UG_RT, DBRR5_FED_UG_N, DBRR5_FED_UG_NUM, DBRR5_FED_UG_DEN, DBRR5_FED_UG_RT,  DBRR10_FED_UG_N, DBRR10_FED_UG_NUM, DBRR10_FED_UG_DEN, DBRR10_FED_UG_RT, DBRR20_FED_UG_N, DBRR20_FED_UG_NUM, DBRR20_FED_UG_DEN, DBRR20_FED_UG_RT) %>% filter(STABBR=="CA")

# To filter for a certain control, do it here: 
# Q9 <- Q9 %>% filter(CONTROL=="Public")
# Q9 <- Q9 %>% filter(CONTROL=="Non-profit")
# Q9 <- Q9 %>% filter(CONTROL=="For-profit")

Q9 <- left_join(x=Q9, y=Q2, by="UNITID") %>% filter(is.na(`Rank of BKAA share`)==FALSE)
Q9$Group <- rep(NA, nrow(Q9))
Q9$Group[Q9$`Rank of BKAA share` <= 50] <- "Top 50 for Black enrollment share"
Q9$Group[Q9$`Rank of BKAA share` >= (nrow(Q9) - 50)] <- "Bottom 50 for Black enrollment share"

Q9$DBRR1_FED_UG_NUM <- as.numeric(Q9$DBRR1_FED_UG_NUM)
Q9$DBRR1_FED_UG_DEN <- as.numeric(Q9$DBRR1_FED_UG_DEN)
Q9$DBRR4_FED_UG_NUM <- as.numeric(Q9$DBRR4_FED_UG_NUM)
Q9$DBRR4_FED_UG_DEN <- as.numeric(Q9$DBRR4_FED_UG_DEN)
Q9$DBRR5_FED_UG_NUM <- as.numeric(Q9$DBRR5_FED_UG_NUM)
Q9$DBRR5_FED_UG_DEN <- as.numeric(Q9$DBRR5_FED_UG_DEN)
Q9$DBRR10_FED_UG_NUM <- as.numeric(Q9$DBRR10_FED_UG_NUM)
Q9$DBRR10_FED_UG_DEN <- as.numeric(Q9$DBRR10_FED_UG_DEN)
Q9$DBRR20_FED_UG_NUM <- as.numeric(Q9$DBRR20_FED_UG_NUM)
Q9$DBRR20_FED_UG_DEN <- as.numeric(Q9$DBRR20_FED_UG_DEN)

Q9 <- Q9 %>% filter(is.na(DBRR1_FED_UG_NUM)==FALSE)
Q9 <- Q9 %>% filter(is.na(DBRR1_FED_UG_DEN)==FALSE)
Q9 <- Q9 %>% filter(is.na(DBRR4_FED_UG_NUM)==FALSE)
Q9 <- Q9 %>% filter(is.na(DBRR4_FED_UG_DEN)==FALSE)
Q9 <- Q9 %>% filter(is.na(DBRR5_FED_UG_NUM)==FALSE)
Q9 <- Q9 %>% filter(is.na(DBRR5_FED_UG_DEN)==FALSE)
Q9 <- Q9 %>% filter(is.na(DBRR10_FED_UG_NUM)==FALSE)
Q9 <- Q9 %>% filter(is.na(DBRR10_FED_UG_DEN)==FALSE)
Q9 <- Q9 %>% filter(is.na(DBRR20_FED_UG_NUM)==FALSE)
Q9 <- Q9 %>% filter(is.na(DBRR20_FED_UG_DEN)==FALSE)

Q9.1 <- aggregate(data=Q9, cbind(
  DBRR1_FED_UG_NUM, DBRR1_FED_UG_DEN, 
  DBRR4_FED_UG_NUM, DBRR4_FED_UG_DEN, 
  DBRR5_FED_UG_NUM, DBRR5_FED_UG_DEN, 
  DBRR10_FED_UG_NUM, DBRR10_FED_UG_DEN, 
  DBRR20_FED_UG_NUM, DBRR20_FED_UG_DEN 
) ~ Group, FUN=sum)

Q9.1$DBRR1_FED_UG_RATE <- Q9.1$DBRR1_FED_UG_NUM / Q9.1$DBRR1_FED_UG_DEN
Q9.1$DBRR4_FED_UG_RATE <- Q9.1$DBRR4_FED_UG_NUM / Q9.1$DBRR4_FED_UG_DEN
Q9.1$DBRR5_FED_UG_RATE <- Q9.1$DBRR5_FED_UG_NUM / Q9.1$DBRR5_FED_UG_DEN
Q9.1$DBRR10_FED_UG_RATE <- Q9.1$DBRR10_FED_UG_NUM / Q9.1$DBRR10_FED_UG_DEN
Q9.1$DBRR20_FED_UG_RATE <- Q9.1$DBRR20_FED_UG_NUM / Q9.1$DBRR20_FED_UG_DEN

Q9.1 <- Q9.1 %>% select(Group, DBRR1_FED_UG_RATE, DBRR4_FED_UG_RATE, DBRR5_FED_UG_RATE, DBRR10_FED_UG_RATE, DBRR20_FED_UG_RATE)
Q9.1 <- reshape2::melt(data=Q9.1, id.vars = c("Group"), value.name="RepaymentRate")

Q9.1$`Years into repayment` <- rep(NA, nrow(Q9.1))
Q9.1$`Years into repayment`[Q9.1$variable=="DBRR1_FED_UG_RATE"] <- 1
Q9.1$`Years into repayment`[Q9.1$variable=="DBRR4_FED_UG_RATE"] <- 4
Q9.1$`Years into repayment`[Q9.1$variable=="DBRR5_FED_UG_RATE"] <- 5
Q9.1$`Years into repayment`[Q9.1$variable=="DBRR10_FED_UG_RATE"] <- 10
Q9.1$`Years into repayment`[Q9.1$variable=="DBRR20_FED_UG_RATE"] <- 20

ggplot(data=Q9.1, mapping=aes(x=`Years into repayment`, y=`RepaymentRate`, color=Group)) + geom_line(stat="identity") + geom_point(stat="identity") + scale_y_continuous(limits=c(0, 1.25))

# Now the same for graduate debt. 

Q10 <- CSI %>% select(UNITID, OPEID, OPEID6, INSTNM, STABBR, CONTROL, DBRR1_FED_GR_N, DBRR1_FED_GR_NUM, DBRR1_FED_GR_DEN, DBRR1_FED_GR_RT,  DBRR4_FED_GR_N, DBRR4_FED_GR_NUM, DBRR4_FED_GR_DEN, DBRR4_FED_GR_RT, DBRR5_FED_GR_N, DBRR5_FED_GR_NUM, DBRR5_FED_GR_DEN, DBRR5_FED_GR_RT,  DBRR10_FED_GR_N, DBRR10_FED_GR_NUM, DBRR10_FED_GR_DEN, DBRR10_FED_GR_RT, DBRR20_FED_GR_N, DBRR20_FED_GR_NUM, DBRR20_FED_GR_DEN, DBRR20_FED_GR_RT) %>% filter(STABBR=="CA")

# To filter for a certain control, do it here: 
# Q10 <- Q10 %>% filter(CONTROL=="Public")
# Q10 <- Q10 %>% filter(CONTROL=="Non-profit")
# Q10 <- Q10 %>% filter(CONTROL=="For-profit")

Q10 <- left_join(x=Q10, y=Q2, by="UNITID") %>% filter(is.na(`Rank of BKAA share`)==FALSE)
Q10$Group <- rep(NA, nrow(Q10))
Q10$Group[Q10$`Rank of BKAA share` <= 50] <- "Top 50 for Black enrollment share"
Q10$Group[Q10$`Rank of BKAA share` >= (nrow(Q10) - 50)] <- "Bottom 50 for Black enrollment share"

Q10$DBRR1_FED_GR_NUM <- as.numeric(Q10$DBRR1_FED_GR_NUM)
Q10$DBRR1_FED_GR_DEN <- as.numeric(Q10$DBRR1_FED_GR_DEN)
Q10$DBRR4_FED_GR_NUM <- as.numeric(Q10$DBRR4_FED_GR_NUM)
Q10$DBRR4_FED_GR_DEN <- as.numeric(Q10$DBRR4_FED_GR_DEN)
Q10$DBRR5_FED_GR_NUM <- as.numeric(Q10$DBRR5_FED_GR_NUM)
Q10$DBRR5_FED_GR_DEN <- as.numeric(Q10$DBRR5_FED_GR_DEN)
Q10$DBRR10_FED_GR_NUM <- as.numeric(Q10$DBRR10_FED_GR_NUM)
Q10$DBRR10_FED_GR_DEN <- as.numeric(Q10$DBRR10_FED_GR_DEN)
Q10$DBRR20_FED_GR_NUM <- as.numeric(Q10$DBRR20_FED_GR_NUM)
Q10$DBRR20_FED_GR_DEN <- as.numeric(Q10$DBRR20_FED_GR_DEN)

Q10 <- Q10 %>% filter(is.na(DBRR1_FED_GR_NUM)==FALSE)
Q10 <- Q10 %>% filter(is.na(DBRR1_FED_GR_DEN)==FALSE)
Q10 <- Q10 %>% filter(is.na(DBRR4_FED_GR_NUM)==FALSE)
Q10 <- Q10 %>% filter(is.na(DBRR4_FED_GR_DEN)==FALSE)
Q10 <- Q10 %>% filter(is.na(DBRR5_FED_GR_NUM)==FALSE)
Q10 <- Q10 %>% filter(is.na(DBRR5_FED_GR_DEN)==FALSE)
Q10 <- Q10 %>% filter(is.na(DBRR10_FED_GR_NUM)==FALSE)
Q10 <- Q10 %>% filter(is.na(DBRR10_FED_GR_DEN)==FALSE)
Q10 <- Q10 %>% filter(is.na(DBRR20_FED_GR_NUM)==FALSE)
Q10 <- Q10 %>% filter(is.na(DBRR20_FED_GR_DEN)==FALSE)

Q10.1 <- aggregate(data=Q10, cbind(
  DBRR1_FED_GR_NUM, DBRR1_FED_GR_DEN, 
  DBRR4_FED_GR_NUM, DBRR4_FED_GR_DEN, 
  DBRR5_FED_GR_NUM, DBRR5_FED_GR_DEN, 
  DBRR10_FED_GR_NUM, DBRR10_FED_GR_DEN, 
  DBRR20_FED_GR_NUM, DBRR20_FED_GR_DEN 
) ~ Group, FUN=sum)

Q10.1$DBRR1_FED_GR_RATE <- Q10.1$DBRR1_FED_GR_NUM / Q10.1$DBRR1_FED_GR_DEN
Q10.1$DBRR4_FED_GR_RATE <- Q10.1$DBRR4_FED_GR_NUM / Q10.1$DBRR4_FED_GR_DEN
Q10.1$DBRR5_FED_GR_RATE <- Q10.1$DBRR5_FED_GR_NUM / Q10.1$DBRR5_FED_GR_DEN
Q10.1$DBRR10_FED_GR_RATE <- Q10.1$DBRR10_FED_GR_NUM / Q10.1$DBRR10_FED_GR_DEN
Q10.1$DBRR20_FED_GR_RATE <- Q10.1$DBRR20_FED_GR_NUM / Q10.1$DBRR20_FED_GR_DEN

Q10.1 <- Q10.1 %>% select(Group, DBRR1_FED_GR_RATE, DBRR4_FED_GR_RATE, DBRR5_FED_GR_RATE, DBRR10_FED_GR_RATE, DBRR20_FED_GR_RATE)
Q10.1 <- reshape2::melt(data=Q10.1, id.vars = c("Group"), value.name="RepaymentRate")

Q10.1$`Years into repayment` <- rep(NA, nrow(Q10.1))
Q10.1$`Years into repayment`[Q10.1$variable=="DBRR1_FED_GR_RATE"] <- 1
Q10.1$`Years into repayment`[Q10.1$variable=="DBRR4_FED_GR_RATE"] <- 4
Q10.1$`Years into repayment`[Q10.1$variable=="DBRR5_FED_GR_RATE"] <- 5
Q10.1$`Years into repayment`[Q10.1$variable=="DBRR10_FED_GR_RATE"] <- 10
Q10.1$`Years into repayment`[Q10.1$variable=="DBRR20_FED_GR_RATE"] <- 20

ggplot(data=Q10.1, mapping=aes(x=`Years into repayment`, y=`RepaymentRate`, color=Group)) + geom_line(stat="identity") + geom_point(stat="identity") + scale_y_continuous(limits=c(0, 1.25))

# Now the same for Parent PLUS. 

Q11 <- CSI %>% select(UNITID, OPEID, OPEID6, INSTNM, STABBR, CONTROL, DBRR1_PP_UG_N, DBRR1_PP_UG_NUM, DBRR1_PP_UG_DEN, DBRR1_PP_UG_RT,  DBRR4_PP_UG_N, DBRR4_PP_UG_NUM, DBRR4_PP_UG_DEN, DBRR4_PP_UG_RT, DBRR5_PP_UG_N, DBRR5_PP_UG_NUM, DBRR5_PP_UG_DEN, DBRR5_PP_UG_RT,  DBRR10_PP_UG_N, DBRR10_PP_UG_NUM, DBRR10_PP_UG_DEN, DBRR10_PP_UG_RT, DBRR20_PP_UG_N, DBRR20_PP_UG_NUM, DBRR20_PP_UG_DEN, DBRR20_PP_UG_RT) %>% filter(STABBR=="CA")

# To filter for a certain control, do it here: 
# Q10 <- Q10 %>% filter(CONTROL=="Public")
# Q10 <- Q10 %>% filter(CONTROL=="Non-profit")
# Q10 <- Q10 %>% filter(CONTROL=="For-profit")

Q11 <- left_join(x=Q11, y=Q2, by="UNITID") %>% filter(is.na(`Rank of BKAA share`)==FALSE)
Q11$Group <- rep(NA, nrow(Q11))
Q11$Group[Q11$`Rank of BKAA share` <= 50] <- "Top 50 for Black enrollment share"
Q11$Group[Q11$`Rank of BKAA share` >= (nrow(Q11) - 50)] <- "Bottom 50 for Black enrollment share"

Q11$DBRR1_PP_UG_NUM <- as.numeric(Q11$DBRR1_PP_UG_NUM)
Q11$DBRR1_PP_UG_DEN <- as.numeric(Q11$DBRR1_PP_UG_DEN)
Q11$DBRR4_PP_UG_NUM <- as.numeric(Q11$DBRR4_PP_UG_NUM)
Q11$DBRR4_PP_UG_DEN <- as.numeric(Q11$DBRR4_PP_UG_DEN)
Q11$DBRR5_PP_UG_NUM <- as.numeric(Q11$DBRR5_PP_UG_NUM)
Q11$DBRR5_PP_UG_DEN <- as.numeric(Q11$DBRR5_PP_UG_DEN)
Q11$DBRR10_PP_UG_NUM <- as.numeric(Q11$DBRR10_PP_UG_NUM)
Q11$DBRR10_PP_UG_DEN <- as.numeric(Q11$DBRR10_PP_UG_DEN)
Q11$DBRR20_PP_UG_NUM <- as.numeric(Q11$DBRR20_PP_UG_NUM)
Q11$DBRR20_PP_UG_DEN <- as.numeric(Q11$DBRR20_PP_UG_DEN)

Q11 <- Q11 %>% filter(is.na(DBRR1_PP_UG_NUM)==FALSE)
Q11 <- Q11 %>% filter(is.na(DBRR1_PP_UG_DEN)==FALSE)
Q11 <- Q11 %>% filter(is.na(DBRR4_PP_UG_NUM)==FALSE)
Q11 <- Q11 %>% filter(is.na(DBRR4_PP_UG_DEN)==FALSE)
Q11 <- Q11 %>% filter(is.na(DBRR5_PP_UG_NUM)==FALSE)
Q11 <- Q11 %>% filter(is.na(DBRR5_PP_UG_DEN)==FALSE)
Q11 <- Q11 %>% filter(is.na(DBRR10_PP_UG_NUM)==FALSE)
Q11 <- Q11 %>% filter(is.na(DBRR10_PP_UG_DEN)==FALSE)
Q11 <- Q11 %>% filter(is.na(DBRR20_PP_UG_NUM)==FALSE)
Q11 <- Q11 %>% filter(is.na(DBRR20_PP_UG_DEN)==FALSE)

Q11.1 <- aggregate(data=Q11, cbind(
  DBRR1_PP_UG_NUM, DBRR1_PP_UG_DEN, 
  DBRR4_PP_UG_NUM, DBRR4_PP_UG_DEN, 
  DBRR5_PP_UG_NUM, DBRR5_PP_UG_DEN, 
  DBRR10_PP_UG_NUM, DBRR10_PP_UG_DEN, 
  DBRR20_PP_UG_NUM, DBRR20_PP_UG_DEN 
) ~ Group, FUN=sum)

Q11.1$DBRR1_PP_UG_RATE <- Q11.1$DBRR1_PP_UG_NUM / Q11.1$DBRR1_PP_UG_DEN
Q11.1$DBRR4_PP_UG_RATE <- Q11.1$DBRR4_PP_UG_NUM / Q11.1$DBRR4_PP_UG_DEN
Q11.1$DBRR5_PP_UG_RATE <- Q11.1$DBRR5_PP_UG_NUM / Q11.1$DBRR5_PP_UG_DEN
Q11.1$DBRR10_PP_UG_RATE <- Q11.1$DBRR10_PP_UG_NUM / Q11.1$DBRR10_PP_UG_DEN
Q11.1$DBRR20_PP_UG_RATE <- Q11.1$DBRR20_PP_UG_NUM / Q11.1$DBRR20_PP_UG_DEN

Q11.1 <- Q11.1 %>% select(Group, DBRR1_PP_UG_RATE, DBRR4_PP_UG_RATE, DBRR5_PP_UG_RATE, DBRR10_PP_UG_RATE, DBRR20_PP_UG_RATE)
Q11.1 <- reshape2::melt(data=Q11.1, id.vars = c("Group"), value.name="RepaymentRate")

Q11.1$`Years into repayment` <- rep(NA, nrow(Q11.1))
Q11.1$`Years into repayment`[Q11.1$variable=="DBRR1_PP_UG_RATE"] <- 1
Q11.1$`Years into repayment`[Q11.1$variable=="DBRR4_PP_UG_RATE"] <- 4
Q11.1$`Years into repayment`[Q11.1$variable=="DBRR5_PP_UG_RATE"] <- 5
Q11.1$`Years into repayment`[Q11.1$variable=="DBRR10_PP_UG_RATE"] <- 10
Q11.1$`Years into repayment`[Q11.1$variable=="DBRR20_PP_UG_RATE"] <- 20

ggplot(data=Q11.1, mapping=aes(x=`Years into repayment`, y=`RepaymentRate`, color=Group)) + geom_line(stat="identity") + geom_point(stat="identity") + scale_y_continuous(limits=c(0, 1.25))

# Let's examine BBRR default, delinquency, and no-progress rates. 

Q12 <- CSI %>% select(UNITID, OPEID, OPEID6, INSTNM, STABBR, CONTROL, BBRR3_FED_UG_DFLT, BBRR3_FED_UG_DLNQ, BBRR3_FED_UG_NOPROG) %>% filter(STABBR=="CA") %>% filter(duplicated(OPEID6)==FALSE)

conversionsDF.BBRR3_FED_UG_DFLT <- conversionsDF
conversionsDF.BBRR3_FED_UG_DLNQ <- conversionsDF
conversionsDF.BBRR3_FED_UG_NOPROG <- conversionsDF

names(conversionsDF.BBRR3_FED_UG_DFLT) <- c("BBRR3_FED_UG_DFLT", "BBRR3_FED_UG_DFLT.modified")
names(conversionsDF.BBRR3_FED_UG_DLNQ) <- c("BBRR3_FED_UG_DLNQ", "BBRR3_FED_UG_DLNQ.modified")
names(conversionsDF.BBRR3_FED_UG_NOPROG) <- c("BBRR3_FED_UG_NOPROG", "BBRR3_FED_UG_NOPROG.modified")

Q12 <- left_join(x=Q12, y=conversionsDF.BBRR3_FED_UG_DFLT, by="BBRR3_FED_UG_DFLT")
Q12 <- left_join(x=Q12, y=conversionsDF.BBRR3_FED_UG_DLNQ, by="BBRR3_FED_UG_DLNQ")
Q12 <- left_join(x=Q12, y=conversionsDF.BBRR3_FED_UG_NOPROG, by="BBRR3_FED_UG_NOPROG")

Q12$`Default delinquent or not making progress` <- Q12$BBRR3_FED_UG_DFLT.modified + Q12$BBRR3_FED_UG_DLNQ.modified + Q12$BBRR3_FED_UG_NOPROG.modified
Q12 <- Q12 %>% arrange(desc(`Default delinquent or not making progress`))

# Now the same for graduate borrowers. 

Q13 <- CSI %>% select(UNITID, OPEID, OPEID6, INSTNM, STABBR, CONTROL, BBRR3_FED_GR_DFLT, BBRR3_FED_GR_DLNQ, BBRR3_FED_GR_NOPROG) %>% filter(STABBR=="CA") %>% filter(duplicated(OPEID6)==FALSE)

conversionsDF.BBRR3_FED_GR_DFLT <- conversionsDF
conversionsDF.BBRR3_FED_GR_DLNQ <- conversionsDF
conversionsDF.BBRR3_FED_GR_NOPROG <- conversionsDF

names(conversionsDF.BBRR3_FED_GR_DFLT) <- c("BBRR3_FED_GR_DFLT", "BBRR3_FED_GR_DFLT.modified")
names(conversionsDF.BBRR3_FED_GR_DLNQ) <- c("BBRR3_FED_GR_DLNQ", "BBRR3_FED_GR_DLNQ.modified")
names(conversionsDF.BBRR3_FED_GR_NOPROG) <- c("BBRR3_FED_GR_NOPROG", "BBRR3_FED_GR_NOPROG.modified")

Q13 <- left_join(x=Q13, y=conversionsDF.BBRR3_FED_GR_DFLT, by="BBRR3_FED_GR_DFLT")
Q13 <- left_join(x=Q13, y=conversionsDF.BBRR3_FED_GR_DLNQ, by="BBRR3_FED_GR_DLNQ")
Q13 <- left_join(x=Q13, y=conversionsDF.BBRR3_FED_GR_NOPROG, by="BBRR3_FED_GR_NOPROG")

Q13$`Default delinquent or not making progress` <- Q13$BBRR3_FED_GR_DFLT.modified + Q13$BBRR3_FED_GR_DLNQ.modified + Q13$BBRR3_FED_GR_NOPROG.modified
Q13 <- Q13 %>% arrange(desc(`Default delinquent or not making progress`))

# Now the same for Parent PLUS borrowers. 

Q14 <- CSI %>% select(UNITID, OPEID, OPEID6, INSTNM, STABBR, CONTROL, BBRR3_PP_UG_DFLT, BBRR3_PP_UG_DLNQ, BBRR3_PP_UG_NOPROG) %>% filter(STABBR=="CA") %>% filter(duplicated(OPEID6)==FALSE)

conversionsDF.BBRR3_PP_UG_DFLT <- conversionsDF
conversionsDF.BBRR3_PP_UG_DLNQ <- conversionsDF
conversionsDF.BBRR3_PP_UG_NOPROG <- conversionsDF

names(conversionsDF.BBRR3_PP_UG_DFLT) <- c("BBRR3_PP_UG_DFLT", "BBRR3_PP_UG_DFLT.modified")
names(conversionsDF.BBRR3_PP_UG_DLNQ) <- c("BBRR3_PP_UG_DLNQ", "BBRR3_PP_UG_DLNQ.modified")
names(conversionsDF.BBRR3_PP_UG_NOPROG) <- c("BBRR3_PP_UG_NOPROG", "BBRR3_PP_UG_NOPROG.modified")

Q14 <- left_join(x=Q14, y=conversionsDF.BBRR3_PP_UG_DFLT, by="BBRR3_PP_UG_DFLT")
Q14 <- left_join(x=Q14, y=conversionsDF.BBRR3_PP_UG_DLNQ, by="BBRR3_PP_UG_DLNQ")
Q14 <- left_join(x=Q14, y=conversionsDF.BBRR3_PP_UG_NOPROG, by="BBRR3_PP_UG_NOPROG")

Q14$`Default delinquent or not making progress` <- Q14$BBRR3_PP_UG_DFLT.modified + Q14$BBRR3_PP_UG_DLNQ.modified + Q14$BBRR3_PP_UG_NOPROG.modified
Q14 <- Q14 %>% arrange(desc(`Default delinquent or not making progress`))

# Let's link in the effy3yr set. 

effy3yr.BBRR <- aggregate(data=effy3yr.Q4, cbind(EFYTOTLT, EFYBKAAT, EFYHISPT) ~ OPEID6, FUN=sum)
effy3yr.BBRR$`Share who are BKAA` <- effy3yr.BBRR$EFYBKAAT / effy3yr.BBRR$EFYTOTLT
effy3yr.BBRR$`Share who are HISP` <- effy3yr.BBRR$EFYHISPT / effy3yr.BBRR$EFYTOTLT
effy3yr.BBRR$`Share who are BKAA or HISP` <- (effy3yr.BBRR$EFYBKAAT + effy3yr.BBRR$EFYHISPT) / effy3yr.BBRR$EFYTOTLT

Q12$OPEID6 <- as.character(Q12$OPEID6)
Q12$OPEID6 <- ifelse(nchar(Q12$OPEID6)==4, paste("0", Q12$OPEID6, sep=""), Q12$OPEID6)
Q12$OPEID6 <- ifelse(nchar(Q12$OPEID6)==5, paste("0", Q12$OPEID6, sep=""), Q12$OPEID6)
Q12 <- left_join(x=Q12, y=effy3yr.BBRR, by="OPEID6")
ggplot(data=Q12, mapping=aes(x=`Share who are BKAA`, y=`Default delinquent or not making progress`)) + geom_point(stat="identity") + facet_wrap(. ~ CONTROL)
ggplot(data=Q12, mapping=aes(x=`Share who are HISP`, y=`Default delinquent or not making progress`)) + geom_point(stat="identity") + facet_wrap(. ~ CONTROL)

Q13$OPEID6 <- as.character(Q13$OPEID6)
Q13$OPEID6 <- ifelse(nchar(Q13$OPEID6)==4, paste("0", Q13$OPEID6, sep=""), Q13$OPEID6)
Q13$OPEID6 <- ifelse(nchar(Q13$OPEID6)==5, paste("0", Q13$OPEID6, sep=""), Q13$OPEID6)
Q13 <- left_join(x=Q13, y=effy3yr.BBRR, by="OPEID6")
ggplot(data=Q13, mapping=aes(x=`Share who are BKAA`, y=`Default delinquent or not making progress`)) + geom_point(stat="identity") + facet_wrap(. ~ CONTROL)
ggplot(data=Q13, mapping=aes(x=`Share who are HISP`, y=`Default delinquent or not making progress`)) + geom_point(stat="identity") + facet_wrap(. ~ CONTROL)

Q14$OPEID6 <- as.character(Q14$OPEID6)
Q14$OPEID6 <- ifelse(nchar(Q14$OPEID6)==4, paste("0", Q14$OPEID6, sep=""), Q14$OPEID6)
Q14$OPEID6 <- ifelse(nchar(Q14$OPEID6)==5, paste("0", Q14$OPEID6, sep=""), Q14$OPEID6)
Q14 <- left_join(x=Q14, y=effy3yr.BBRR, by="OPEID6")
ggplot(data=Q14, mapping=aes(x=`Share who are BKAA`, y=`Default delinquent or not making progress`)) + geom_point(stat="identity") + facet_wrap(. ~ CONTROL)
ggplot(data=Q14, mapping=aes(x=`Share who are HISP`, y=`Default delinquent or not making progress`)) + geom_point(stat="identity") + facet_wrap(. ~ CONTROL)

# Let's identify the high-debt, low-earnings schools in CA. 

Q15 <- CSI %>% select(UNITID, OPEID, OPEID6, INSTNM, STABBR, CONTROL, MD_EARN_WNE_P10, COUNT_WNE_P10, DEBT_MDN, GRAD_DEBT_MDN) %>% filter(duplicated(OPEID6)==FALSE)

Q15$MD_EARN_WNE_P10 <- as.numeric(Q15$MD_EARN_WNE_P10)
Q15$COUNT_WNE_P10 <- as.numeric(Q15$COUNT_WNE_P10)
Q15$DEBT_MDN <- as.numeric(Q15$DEBT_MDN)
Q15$GRAD_DEBT_MDN <- as.numeric(Q15$GRAD_DEBT_MDN)

ggplot(data=Q15, mapping=aes(x=DEBT_MDN, y=MD_EARN_WNE_P10)) + geom_point(stat="identity") + facet_grid(STABBR ~ CONTROL) + geom_abline(slope=1, intercept=0) + scale_x_continuous(labels=scales::dollar) + scale_y_continuous(labels=scales::dollar)

ggplot(data=Q15, mapping=aes(x=GRAD_DEBT_MDN, y=MD_EARN_WNE_P10)) + geom_point(stat="identity") + facet_grid(STABBR ~ CONTROL) + geom_abline(slope=1, intercept=0) + scale_x_continuous(labels=scales::dollar) + scale_y_continuous(labels=scales::dollar)

Q15 <- Q15 %>% filter(STABBR=="CA") %>% filter(is.na(MD_EARN_WNE_P10)==FALSE) %>% filter(is.na(GRAD_DEBT_MDN)==FALSE) %>% filter(GRAD_DEBT_MDN > 0)

Q15$`Ratio of earnings to debt among completers, 10 years after entry` <- Q15$MD_EARN_WNE_P10 / Q15$GRAD_DEBT_MDN

Q15 <- Q15 %>% arrange(`Ratio of earnings to debt among completers, 10 years after entry`)

# Programs causing high debt with low earnings

Q16 <- CSP %>% select(UNITID, OPEID6, INSTNM, CONTROL, CIPCODE, CIPDESC, CREDLEV, CREDDESC, IPEDSCOUNT1, IPEDSCOUNT2, DEBT_ALL_STGP_EVAL_N, DEBT_ALL_STGP_EVAL_MDN, EARN_MDN_HI_2YR, EARN_COUNT_WNE_HI_2YR, EARN_CNTOVER150_HI_2YR)

# Cleaning the CIP codes: 
Q16$CIPCODE <- as.character(Q16$CIPCODE)
Q16$CIPCODE <- ifelse(nchar(Q16$CIPCODE)==3, paste("0", Q16$CIPCODE, sep=""), Q16$CIPCODE)
forQ16$CIPCODE <- paste(substr(forQ16$CIPCODE, 1, 2), substr(forQ16$CIPCODE, 4, 5), sep="")

# Cleaning the credential levels: 
Q16$CREDLEV2 <- rep(NA, nrow(Q16))
forQ16$CREDLEV2 <- rep(NA, nrow(forQ16))

# CREDLEV levels:
# 1	Undergraduate Certificate or Diploma
# 2	Associate's Degree
# 3	Bachelor’s Degree
# 4	Post-baccalaureate Certificate
# 5	Master's Degree
# 6	Doctoral Degree
# 7	First Professional Degree
# 8	Graduate/Professional Certificate

# AWLEVEL levels: 
# 3	Associate's degree
# 5	Bachelor's degree
# 7	Master's degree
# 17	Doctor's degree - research/scholarship
# 18	Doctor's degree - professional practice
# 19	Doctor's degree - other
# 20	Certificates of less than 12 weeks
# 21	Certificates of at least 12 weeks but less than 1 year
# 2	Certificates of at least 1 but less than 2 years
# 4	Certificates of at least 2 but less than 4 years
# 6	Postbaccalaureate certificate
# 8	Post-master's certificate

Q16$CREDLEV2[Q16$CREDLEV==1] <- "Undergraduate certificate"
forQ16$CREDLEV2[forQ16$AWLEVEL %in% c(2, 4, 20, 21)] <- "Undergraduate certificate"

Q16$CREDLEV2[Q16$CREDLEV==2] <- "Associate's degree"
forQ16$CREDLEV2[forQ16$AWLEVEL==3] <- "Associate's degree"

Q16$CREDLEV2[Q16$CREDLEV==3] <- "Bachelor's degree"
forQ16$CREDLEV2[forQ16$AWLEVEL==5] <- "Bachelor's degree"

Q16$CREDLEV2[Q16$CREDLEV %in% c(4, 8)] <- "Post-baccalaureate certificate"
forQ16$CREDLEV2[forQ16$AWLEVEL %in% c(6, 8)] <- "Post-baccalaureate certificate"

Q16$CREDLEV2[Q16$CREDLEV==5] <- "Master's degree"
forQ16$CREDLEV2[forQ16$AWLEVEL==7] <- "Master's degree"

Q16$CREDLEV2[Q16$CREDLEV==6] <- "Research doctorate"
forQ16$CREDLEV2[forQ16$AWLEVEL==17] <- "Research doctorate"

Q16$CREDLEV2[Q16$CREDLEV==7] <- "Professional doctorate"
forQ16$CREDLEV2[forQ16$AWLEVEL %in% c(18, 19)] <- "Professional doctorate"

# OPEIDs: 
Q16$OPEID6 <- as.character(Q16$OPEID6)
Q16$OPEID6 <- ifelse(nchar(Q16$OPEID6)==4, paste("0", Q16$OPEID6, sep=""), Q16$OPEID6)
Q16$OPEID6 <- ifelse(nchar(Q16$OPEID6)==5, paste("0", Q16$OPEID6, sep=""), Q16$OPEID6)

forQ16 <- forQ16 %>% filter(OPEID != -2)
forQ16$OPEID <- as.character(forQ16$OPEID)
forQ16$OPEID <- ifelse(nchar(forQ16$OPEID)==6, paste("0", forQ16$OPEID, sep=""), forQ16$OPEID)
forQ16$OPEID <- ifelse(nchar(forQ16$OPEID)==7, paste("0", forQ16$OPEID, sep=""), forQ16$OPEID)
forQ16$OPEID6 <- substr(forQ16$OPEID, 1, 6)

# Merging: 
forQ16 <- aggregate(data=forQ16, cbind(CTOTALT, CBKAAT, CHISPT) ~ OPEID6 + CIPCODE + CREDLEV2, FUN=sum)
forQ16$`Share who are BKAA` <- forQ16$CBKAAT / forQ16$CTOTALT
forQ16$`Share who are HISP` <- forQ16$CHISPT / forQ16$CTOTALT
forQ16$`Share who are BKAA or HISP` <- (forQ16$CBKAAT + forQ16$CHISPT) / forQ16$CTOTALT
Q16 <- inner_join(x=Q16, y=forQ16, by=c("OPEID6", "CIPCODE", "CREDLEV2"))

# Analyzing for role of race: 

Q16$IPEDSCOUNT1 <- as.numeric(Q16$IPEDSCOUNT1)
Q16$IPEDSCOUNT2 <- as.numeric(Q16$IPEDSCOUNT2)
Q16$DEBT_ALL_STGP_EVAL_N <- as.numeric(Q16$DEBT_ALL_STGP_EVAL_N)
Q16$DEBT_ALL_STGP_EVAL_MDN <- as.numeric(Q16$DEBT_ALL_STGP_EVAL_MDN)
Q16$EARN_MDN_HI_2YR <- as.numeric(Q16$EARN_MDN_HI_2YR)
Q16$EARN_COUNT_WNE_HI_2YR <- as.numeric(Q16$EARN_COUNT_WNE_HI_2YR)
Q16$EARN_CNTOVER150_HI_2YR <- as.numeric(Q16$EARN_CNTOVER150_HI_2YR)

Q16$`Share earning >150% FPL 2 years after completing` <- Q16$EARN_CNTOVER150_HI_2YR / Q16$EARN_COUNT_WNE_HI_2YR

ggplot(data=Q16, mapping=aes(x=`Share who are BKAA`, y=DEBT_ALL_STGP_EVAL_MDN)) + geom_point(stat="identity") + facet_grid(CONTROL ~ CREDLEV2)
ggplot(data=Q16, mapping=aes(x=`Share who are HISP`, y=DEBT_ALL_STGP_EVAL_MDN)) + geom_point(stat="identity") + facet_grid(CONTROL ~ CREDLEV2)
ggplot(data=Q16, mapping=aes(x=`Share who are BKAA or HISP`, y=DEBT_ALL_STGP_EVAL_MDN)) + geom_point(stat="identity") + facet_grid(CONTROL ~ CREDLEV2)

ggplot(data=Q16, mapping=aes(x=`Share who are BKAA`, y=`Share earning >150% FPL 2 years after completing`)) + geom_point(stat="identity") + facet_grid(CONTROL ~ CREDLEV2)
ggplot(data=Q16, mapping=aes(x=`Share who are HISP`, y=`Share earning >150% FPL 2 years after completing`)) + geom_point(stat="identity") + facet_grid(CONTROL ~ CREDLEV2)
ggplot(data=Q16, mapping=aes(x=`Share who are BKAA or HISP`, y=`Share earning >150% FPL 2 years after completing`)) + geom_point(stat="identity") + facet_grid(CONTROL ~ CREDLEV2)

### What is the amount of debt that comes to California borrowers who are enrolled entirely online?

ef2018a <- fread("ef2018a_dist_rv.csv", header=TRUE, select=c(
  "UNITID",  # Unique identification number of the institution
  "EFDELEV", # Level of student
  "EFDETOT", # All students enrolled
  "EFDEEXC"  # Students enrolled exclusively in distance education courses
)) %>% filter(EFDELEV==1) %>% select(UNITID, EFDETOT, EFDEEXC) # Distance education status and level of student: Fall 2018
names(ef2018a) <- c("UNITID", "All students enrolled", "Students enrolled exclusively online")

ef2018c <- fread("ef2018c_rv.csv", header=TRUE, select=c(
  "UNITID",   # Unique identification number of the institution
  "EFCSTATE", # State of residence when student was first admitted
  "EFRES01"   # First-time degree/certificate-seeking undergraduate students
)) # Residence and migration of first-time freshman: Fall 2018
# 58	US total
# 6	California
ef2018c.CA <- ef2018c %>% filter(EFCSTATE == 6) %>% select(UNITID, EFRES01)
names(ef2018c.CA) <- c("UNITID", "Undergraduates from California")
ef2018c.US <- ef2018c %>% filter(EFCSTATE == 58) %>% select(UNITID, EFRES01)
names(ef2018c.US) <- c("UNITID", "All undergraduates")
ef2018c <- full_join(x=ef2018c.US, y=ef2018c.CA, by="UNITID")

hd2019 <- fread("hd2019.csv", header=TRUE, select=c(
  "UNITID", # Unique identification number of the institution
  "STABBR", # State abbreviation
  "OPEID"   # Office of Postsecondary Education (OPE) ID Number
)) # Institutional characteristics: 2018-19

Q17 <- left_join(x=hd2019, y=ef2018c, by="UNITID")
Q17 <- left_join(x=Q17, y=ef2018a, by="UNITID")
Q17$OPEID <- as.character(Q17$OPEID)
Q17 <- Q17 %>% filter(OPEID != "-2")

Q17$`All students enrolled`[is.na(Q17$`All students enrolled`)] <- 0
Q17$`Students enrolled exclusively online`[is.na(Q17$`Students enrolled exclusively online`)] <- 0
Q17$`All undergraduates`[is.na(Q17$`All undergraduates`)] <- 0
Q17$`Undergraduates from California`[is.na(Q17$`Undergraduates from California`)] <- 0

Q17$OPEID6 <- Q17$OPEID
Q17$OPEID6 <- ifelse(nchar(Q17$OPEID6)==6, paste("0", Q17$OPEID6, sep=""), Q17$OPEID6)
Q17$OPEID6 <- ifelse(nchar(Q17$OPEID6)==7, paste("0", Q17$OPEID6, sep=""), Q17$OPEID6)
Q17$OPEID6 <- substr(Q17$OPEID6, 1, 6)

Q17 <- aggregate(data=Q17, cbind(`All undergraduates`, `Undergraduates from California`, `Students enrolled exclusively online`, `All students enrolled`) ~ OPEID6, FUN=sum)
Q17$`California share of all undergraduates` <- Q17$`Undergraduates from California` / Q17$`All undergraduates`
Q17$`California share of all undergraduates`[is.na(Q17$`California share of all undergraduates`)] <- 0
Q17$`Estimated students from California enrolled online` <- Q17$`California share of all undergraduates` * Q17$`Students enrolled exclusively online`
Q17$`Estimated students from California enrolled online as a share of all undergraduates` <- Q17$`Estimated students from California enrolled online` / Q17$`All students enrolled`

# Let's find out which institutions *not* based in California have the most students from California enrolled entirely online. 

Q17.2 <- CSI %>% select(OPEID6, INSTNM, CONTROL, STABBR2, MAIN, DEBT_MDN, GRAD_DEBT_MDN, LPSTAFFORD_AMT, LPPPLUS_AMT, LPGPLUS_AMT) %>% filter(MAIN==1)

Q17.2$DEBT_MDN <- as.numeric(Q17.2$DEBT_MDN)
Q17.2$GRAD_DEBT_MDN <- as.numeric(Q17.2$GRAD_DEBT_MDN)
Q17.2$LPSTAFFORD_AMT <- as.numeric(Q17.2$LPSTAFFORD_AMT)
Q17.2$LPPPLUS_AMT <- as.numeric(Q17.2$LPPPLUS_AMT)
Q17.2$LPGPLUS_AMT <- as.numeric(Q17.2$LPGPLUS_AMT)

Q17.2$LPSTAFFORD_AMT[is.na(Q17.2$LPSTAFFORD_AMT)] <- 0
Q17.2$LPPPLUS_AMT[is.na(Q17.2$LPPPLUS_AMT)] <- 0
Q17.2$LPGPLUS_AMT[is.na(Q17.2$LPGPLUS_AMT)] <- 0

Q17.2$OPEID6 <- as.character(Q17.2$OPEID6)
Q17.2$OPEID6 <- ifelse(nchar(Q17.2$OPEID6)==4, paste("0", Q17.2$OPEID6, sep=""), Q17.2$OPEID6)
Q17.2$OPEID6 <- ifelse(nchar(Q17.2$OPEID6)==5, paste("0", Q17.2$OPEID6, sep=""), Q17.2$OPEID6)
Q17 <- left_join(x=Q17, y=Q17.2, by="OPEID6")

Q17.OutsideCA <- Q17 %>% filter(STABBR2 != "CA")
Q17.OutsideCA <- Q17.OutsideCA %>% select(INSTNM, STABBR2, `Estimated students from California enrolled online`, `California share of all undergraduates`, `Estimated students from California enrolled online as a share of all undergraduates`, DEBT_MDN, GRAD_DEBT_MDN, LPSTAFFORD_AMT, LPPPLUS_AMT, LPGPLUS_AMT)

Q17.OutsideCA$`Total outstanding debt` <- Q17.OutsideCA$LPSTAFFORD_AMT + Q17.OutsideCA$LPPPLUS_AMT + Q17.OutsideCA$LPGPLUS_AMT
Q17.OutsideCA$`Estimated students from California enrolled online` <- round(Q17.OutsideCA$`Estimated students from California enrolled online`, 0)
Q17.OutsideCA$`Estimated debt for students from California enrolled online` <- Q17.OutsideCA$`Estimated students from California enrolled online as a share of all undergraduates` * Q17.OutsideCA$`Total outstanding debt`
Q17.OutsideCA$`Estimated debt for students from California enrolled online` <- round(Q17.OutsideCA$`Estimated debt for students from California enrolled online`, -3)

Q17.OutsideCA <- Q17.OutsideCA %>% arrange(desc(`Estimated debt for students from California enrolled online`)) %>% select(INSTNM, STABBR2, `Estimated students from California enrolled online`, `Estimated debt for students from California enrolled online`)

sum(Q17.OutsideCA$`Estimated students from California enrolled online`, na.rm=TRUE)
sum(Q17.OutsideCA$`Estimated debt for students from California enrolled online`, na.rm=TRUE)


# Okay, now that we've done that, what is the total outstanding debt for California public universities? 

Q18 <- CSI %>% select(OPEID6, INSTNM, STABBR, CONTROL, LPSTAFFORD_AMT, LPPPLUS_AMT, LPGPLUS_AMT) %>% filter(STABBR=="CA") %>% filter(CONTROL=="Public") %>% filter(duplicated(OPEID6)==FALSE)

Q18$LPSTAFFORD_AMT <- as.numeric(Q18$LPSTAFFORD_AMT)
Q18$LPPPLUS_AMT <- as.numeric(Q18$LPPPLUS_AMT)
Q18$LPGPLUS_AMT <- as.numeric(Q18$LPGPLUS_AMT)

Q18$LPSTAFFORD_AMT[is.na(Q18$LPSTAFFORD_AMT)] <- 0
Q18$LPPPLUS_AMT[is.na(Q18$LPPPLUS_AMT)] <- 0
Q18$LPGPLUS_AMT[is.na(Q18$LPGPLUS_AMT)] <- 0

Q18$OPEID6 <- as.character(Q18$OPEID6)
Q18$OPEID6 <- ifelse(nchar(Q18$OPEID6)==4, paste("0", Q18$OPEID6, sep=""), Q18$OPEID6)
Q18$OPEID6 <- ifelse(nchar(Q18$OPEID6)==5, paste("0", Q18$OPEID6, sep=""), Q18$OPEID6)

Q18$`Segment` <- rep(NA, nrow(Q18))

Q18$`Segment`[Q18$OPEID6 %in% c(
  "001111",
  "001113",
  "001118",
  "001119",
  "001124",
  "001161",
  "001162",
  "001163",
  "001166",
  "001176",
  "001178",
  "001181",
  "001182",
  "001185",
  "001186",
  "001187",
  "001190",
  "001191",
  "001192",
  "001193",
  "001197",
  "001199",
  "001201",
  "001202",
  "001203",
  "001206",
  "001208",
  "001209",
  "001214",
  "001217",
  "001219",
  "001223",
  "001224",
  "001226",
  "001227",
  "001228",
  "001232",
  "001233",
  "001237",
  "001239",
  "001239",
  "001240",
  "001242",
  "001245",
  "001246",
  "001247",
  "001250",
  "001259",
  "001260",
  "001261",
  "001266",
  "001267",
  "001268",
  "001269",
  "001270",
  "001272",
  "001273",
  "001275",
  "001280",
  "001282",
  "001284",
  "001285",
  "001286",
  "001287",
  "001289",
  "001290",
  "001292",
  "001294",
  "001307",
  "001308",
  "001309",
  "001334",
  "001335",
  "001338",
  "001344",
  "004480",
  "004481",
  "004502",
  "006720",
  "006973",
  "007047",
  "007115",
  "007536",
  "007707",
  "007713",
  "008073",
  "008596",
  "008597",
  "008903",
  "008918",
  "009272",
  "010111",
  "010340",
  "011672",
  "011820",
  "012452",
  "012550",
  "012842",
  "012907",
  "020635",
  "021113",
  "021191",
  "022260",
  "022427",
  "030357",
  "035424",
  "036957",
  "038713",
  "041113",
  "041438",
  "041735",
  "041761",
  "042534",
  "042817"
)] <- "California Community Colleges"

Q18$`Segment`[Q18$OPEID6 %in% c(
  "001134", 
  "001137", 
  "001138", 
  "001139", 
  "001140", 
  "001141", 
  "001142", 
  "001143", 
  "001144", 
  "001146", 
  "001147", 
  "001149", 
  "001150", 
  "001151", 
  "001153", 
  "001154", 
  "001155", 
  "001156", 
  "001157", 
  "007993",
  "030113", 
  "032603", 
  "039803"
)] <- "California State University"

Q18$`Segment`[Q18$OPEID6 %in% c(
  "001312", 
  "001313", 
  "001314", 
  "001315", 
  "001316", 
  "001317", 
  "001319", 
  "001320", 
  "001321", 
  "003947",
  "041271"
)] <- "University of California"

Q18 <- Q18 %>% filter(is.na(`Segment`)==FALSE)
Q18.1 <- aggregate(data=Q18, cbind(LPSTAFFORD_AMT, LPPPLUS_AMT, LPGPLUS_AMT) ~ Segment, FUN=sum)
Q18.1 <- Q18.1 %>% add_row(Segment="All segments", 
                           LPSTAFFORD_AMT=sum(Q18.1$LPSTAFFORD_AMT, na.rm=TRUE), 
                           LPPPLUS_AMT=sum(Q18.1$LPPPLUS_AMT, na.rm=TRUE), 
                           LPGPLUS_AMT=sum(Q18.1$LPGPLUS_AMT, na.rm=TRUE))
Q18.1$`Total debt` <- Q18.1$LPSTAFFORD_AMT + Q18.1$LPPPLUS_AMT + Q18.1$LPGPLUS_AMT

Q18.1$LPSTAFFORD_AMT <- comma(round(Q18.1$LPSTAFFORD_AMT, -3))
Q18.1$LPPPLUS_AMT <- comma(round(Q18.1$LPPPLUS_AMT, -3))
Q18.1$LPGPLUS_AMT <- comma(round(Q18.1$LPGPLUS_AMT, -3))
Q18.1$`Total debt` <- comma(round(Q18.1$`Total debt`, -3))

# Let's now aggregate total debt by sector

Q19 <- CSI %>% select(OPEID6, INSTNM, STABBR, MAIN, CONTROL, LPSTAFFORD_AMT, LPPPLUS_AMT, LPGPLUS_AMT) %>% filter(STABBR=="CA") %>% filter(MAIN==1) %>% filter(duplicated(OPEID6)==FALSE)

Q19$LPSTAFFORD_AMT <- as.numeric(Q19$LPSTAFFORD_AMT)
Q19$LPPPLUS_AMT <- as.numeric(Q19$LPPPLUS_AMT)
Q19$LPGPLUS_AMT <- as.numeric(Q19$LPGPLUS_AMT)

Q19$LPSTAFFORD_AMT[is.na(Q19$LPSTAFFORD_AMT)] <- 0
Q19$LPPPLUS_AMT[is.na(Q19$LPPPLUS_AMT)] <- 0
Q19$LPGPLUS_AMT[is.na(Q19$LPGPLUS_AMT)] <- 0

Q19$OPEID6 <- as.character(Q19$OPEID6)
Q19$OPEID6 <- ifelse(nchar(Q19$OPEID6)==4, paste("0", Q19$OPEID6, sep=""), Q19$OPEID6)
Q19$OPEID6 <- ifelse(nchar(Q19$OPEID6)==5, paste("0", Q19$OPEID6, sep=""), Q19$OPEID6)

Q19 <- aggregate(data=Q19, cbind(LPSTAFFORD_AMT, LPPPLUS_AMT, LPGPLUS_AMT) ~ CONTROL, FUN=sum)

Q19.plot <- Q19

Q19$`Total debt` <- Q19$LPSTAFFORD_AMT + Q19$LPPPLUS_AMT + Q19$LPGPLUS_AMT

Q19 <- Q19 %>% add_row(CONTROL="All sectors", 
                       LPSTAFFORD_AMT=sum(Q19$LPSTAFFORD_AMT), 
                       LPPPLUS_AMT=sum(Q19$LPPPLUS_AMT), 
                       LPGPLUS_AMT=sum(Q19$LPGPLUS_AMT), 
                       `Total debt`=sum(Q19$`Total debt`))
Q19$LPSTAFFORD_AMT <- comma(round(Q19$LPSTAFFORD_AMT, -3))
Q19$LPPPLUS_AMT <- comma(round(Q19$LPPPLUS_AMT, -3))
Q19$LPGPLUS_AMT <- comma(round(Q19$LPGPLUS_AMT, -3))
Q19$`Total debt` <- comma(round(Q19$`Total debt`, -3))


Q19.plot <- reshape2::melt(data=Q19.plot, id.vars=c("CONTROL"))
names(Q19.plot) <- c("Control of institution", "Loan type", "Total outstanding debt")
Q19.plot$`Loan type` <- as.character(Q19.plot$`Loan type`)
Q19.plot$`Loan type`[Q19.plot$`Loan type`=="LPSTAFFORD_AMT"] <- "Stafford"
Q19.plot$`Loan type`[Q19.plot$`Loan type`=="LPPPLUS_AMT"] <- "Parent PLUS"
Q19.plot$`Loan type`[Q19.plot$`Loan type`=="LPGPLUS_AMT"] <- "Grad PLUS"

ggplot(data=Q19.plot, mapping=aes(x=`Control of institution`, y=`Total outstanding debt`, fill=`Loan type`)) + geom_bar(stat="identity", position="dodge") + scale_y_continuous(labels=scales::dollar)

# Finding the top schools by their share of students who receive federal student loans, and then comparing their completion rates 

Q20 <- CSI %>% select(INSTNM,              # Institution name
                      OPEID6,              # 6-digit OPEID 
                      STABBR,              # State abbreviation
                      CONTROL,             # Control of institution
                      MAIN,                # Flag for main campus
                      PCTFLOAN,            # Percent of all undergraduate students receiving a federal student loan
                      D_PCTPELL_PCTFLOAN,  # Number of undergraduate students (denominator percent receiving a pell grant or federal student loan)
                      GRAD_DEBT_MDN,       # The median debt for students who have completed
                      GRAD_DEBT_N          # The number of students in the median debt completers cohort
) %>% filter(STABBR=="CA")

Q20$PCTFLOAN <- as.numeric(Q20$PCTFLOAN)
Q20$D_PCTPELL_PCTFLOAN <- as.numeric(Q20$D_PCTPELL_PCTFLOAN)
Q20$N_PCTFLOAN <- Q20$PCTFLOAN * Q20$D_PCTPELL_PCTFLOAN

Q20$GRAD_DEBT_MDN <- as.numeric(Q20$GRAD_DEBT_MDN)
Q20$GRAD_DEBT_N <- as.numeric(Q20$GRAD_DEBT_N)

Q20.1 <- aggregate(data=Q20, cbind(N_PCTFLOAN, D_PCTPELL_PCTFLOAN) ~ OPEID6, FUN=sum)
Q20.1$`Percent of undergraduates who receive federal student loans` <- Q20.1$N_PCTFLOAN / Q20.1$D_PCTPELL_PCTFLOAN
Q20.1 <- Q20.1 %>% select(OPEID6, `Percent of undergraduates who receive federal student loans`)
Q20.2 <- Q20 %>% arrange(desc(MAIN)) %>% filter(duplicated(OPEID6)==FALSE) %>% select(OPEID6, INSTNM, CONTROL, GRAD_DEBT_MDN, GRAD_DEBT_N)
Q20.3 <- left_join(x=Q20.1, y=Q20.2, by="OPEID6")

Q20.3 <- Q20.3 %>% filter(GRAD_DEBT_N > 300) %>% arrange(desc(`Percent of undergraduates who receive federal student loans`)) %>% select(OPEID6, INSTNM, CONTROL, `Percent of undergraduates who receive federal student loans`, GRAD_DEBT_MDN) 
Q20.3$`Percent of undergraduates who receive federal student loans` <- percent(Q20.3$`Percent of undergraduates who receive federal student loans`, accuracy=0.1)
Q20.3$GRAD_DEBT_MDN <- dollar(Q20.3$GRAD_DEBT_MDN)

# Worst California institutions by the ratio of existing balance to original balance ten years into repayment, by loan type

Q21 <- CSI %>% select(UNITID, OPEID, OPEID6, INSTNM, STABBR, CONTROL, MAIN, 
                      DBRR10_FED_UG_N, DBRR10_FED_UG_NUM, DBRR10_FED_UG_DEN, DBRR10_FED_UG_RT, 
                      DBRR10_PP_UG_N, DBRR10_PP_UG_NUM, DBRR10_PP_UG_DEN, DBRR10_PP_UG_RT,
                      DBRR10_FED_GR_N, DBRR10_FED_GR_NUM, DBRR10_FED_GR_DEN, DBRR10_FED_GR_RT) %>% filter(STABBR=="CA")
Q21 <- Q21 %>% arrange(desc(MAIN)) %>% filter(duplicated(OPEID6)==FALSE)

Q21$DBRR10_FED_UG_N <- as.numeric(Q21$DBRR10_FED_UG_N)
Q21$DBRR10_FED_UG_NUM <- as.numeric(Q21$DBRR10_FED_UG_NUM)
Q21$DBRR10_FED_UG_DEN <- as.numeric(Q21$DBRR10_FED_UG_DEN)
Q21$DBRR10_FED_UG_RT <- as.numeric(Q21$DBRR10_FED_UG_RT)

Q21$DBRR10_PP_UG_N <- as.numeric(Q21$DBRR10_PP_UG_N)
Q21$DBRR10_PP_UG_NUM <- as.numeric(Q21$DBRR10_PP_UG_NUM)
Q21$DBRR10_PP_UG_DEN <- as.numeric(Q21$DBRR10_PP_UG_DEN)
Q21$DBRR10_PP_UG_RT <- as.numeric(Q21$DBRR10_PP_UG_RT)

Q21$DBRR10_FED_GR_N <- as.numeric(Q21$DBRR10_FED_GR_N)
Q21$DBRR10_FED_GR_NUM <- as.numeric(Q21$DBRR10_FED_GR_NUM)
Q21$DBRR10_FED_GR_DEN <- as.numeric(Q21$DBRR10_FED_GR_DEN)
Q21$DBRR10_FED_GR_RT <- as.numeric(Q21$DBRR10_FED_GR_RT)

Q21.S <- Q21 %>% filter(is.na(DBRR10_FED_UG_RT)==FALSE) %>% arrange(desc(DBRR10_FED_UG_RT)) %>% filter(DBRR10_FED_UG_N >= 100) %>% select(OPEID6, INSTNM, CONTROL, DBRR10_FED_UG_RT, DBRR10_FED_UG_NUM, DBRR10_FED_UG_DEN, DBRR10_FED_UG_N)
Q21.P <- Q21 %>% filter(is.na(DBRR10_PP_UG_RT)==FALSE) %>% arrange(desc(DBRR10_PP_UG_RT)) %>% filter(DBRR10_PP_UG_N >= 100) %>% select(OPEID6, INSTNM, CONTROL, DBRR10_PP_UG_RT, DBRR10_PP_UG_NUM, DBRR10_PP_UG_DEN, DBRR10_PP_UG_N)
Q21.G <- Q21 %>% filter(is.na(DBRR10_FED_GR_RT)==FALSE) %>% arrange(desc(DBRR10_FED_GR_RT)) %>% filter(DBRR10_FED_GR_N >= 100) %>% select(OPEID6, INSTNM, CONTROL, DBRR10_FED_GR_RT, DBRR10_FED_GR_NUM, DBRR10_FED_GR_DEN, DBRR10_FED_GR_N)

names(Q21.S) <- c("OPEID6", "INSTNM", "CONTROL", "Repayment ratio", "Current balance", "Original balance", "Number of borrowers")
names(Q21.P) <- c("OPEID6", "INSTNM", "CONTROL", "Repayment ratio", "Current balance", "Original balance", "Number of borrowers")
names(Q21.G) <- c("OPEID6", "INSTNM", "CONTROL", "Repayment ratio", "Current balance", "Original balance", "Number of borrowers")

Q21.S$`Average balance after ten years in repayment` <- Q21.S$`Current balance` / Q21.S$`Number of borrowers`
Q21.P$`Average balance after ten years in repayment` <- Q21.P$`Current balance` / Q21.P$`Number of borrowers`
Q21.G$`Average balance after ten years in repayment` <- Q21.G$`Current balance` / Q21.G$`Number of borrowers`

Q21.S$`Repayment ratio` <- round(Q21.S$`Repayment ratio`, 3)
Q21.P$`Repayment ratio` <- round(Q21.P$`Repayment ratio`, 3)
Q21.G$`Repayment ratio` <- round(Q21.G$`Repayment ratio`, 3)

Q21.S$`Current balance` <- dollar(round(Q21.S$`Current balance`, -3))
Q21.P$`Current balance` <- dollar(round(Q21.P$`Current balance`, -3))
Q21.G$`Current balance` <- dollar(round(Q21.G$`Current balance`, -3))

Q21.S$`Original balance` <- dollar(round(Q21.S$`Original balance`, -3))
Q21.P$`Original balance` <- dollar(round(Q21.P$`Original balance`, -3))
Q21.G$`Original balance` <- dollar(round(Q21.G$`Original balance`, -3))

Q21.S$`Number of borrowers` <- comma(Q21.S$`Number of borrowers`)
Q21.P$`Number of borrowers` <- comma(Q21.P$`Number of borrowers`)
Q21.G$`Number of borrowers` <- comma(Q21.G$`Number of borrowers`)

Q21.S$`Average balance after ten years in repayment` <- dollar(Q21.S$`Average balance after ten years in repayment`, accuracy=1)
Q21.P$`Average balance after ten years in repayment` <- dollar(Q21.P$`Average balance after ten years in repayment`, accuracy=1)
Q21.G$`Average balance after ten years in repayment` <- dollar(Q21.G$`Average balance after ten years in repayment`, accuracy=1)


# Let's find the worst California institutions and programs for the share of borrowers who are in default, delinquent, or not making progress 3 years after entering repayment

Q22.S <- CSI %>% select(UNITID, OPEID, OPEID6, INSTNM, STABBR, CONTROL, BBRR3_FED_UG_N, BBRR3_FED_UG_DFLT, BBRR3_FED_UG_DLNQ, BBRR3_FED_UG_NOPROG) %>% filter(STABBR=="CA") %>% filter(duplicated(OPEID6)==FALSE)

Q22.S$BBRR3_FED_UG_N <- as.numeric(Q22.S$BBRR3_FED_UG_N)
Q22.S <- Q22.S %>% filter(BBRR3_FED_UG_N >= 200)

conversionsDF.BBRR3_FED_UG_DFLT <- conversionsDF
conversionsDF.BBRR3_FED_UG_DLNQ <- conversionsDF
conversionsDF.BBRR3_FED_UG_NOPROG <- conversionsDF

names(conversionsDF.BBRR3_FED_UG_DFLT) <- c("BBRR3_FED_UG_DFLT", "BBRR3_FED_UG_DFLT.modified")
names(conversionsDF.BBRR3_FED_UG_DLNQ) <- c("BBRR3_FED_UG_DLNQ", "BBRR3_FED_UG_DLNQ.modified")
names(conversionsDF.BBRR3_FED_UG_NOPROG) <- c("BBRR3_FED_UG_NOPROG", "BBRR3_FED_UG_NOPROG.modified")

Q22.S <- left_join(x=Q22.S, y=conversionsDF.BBRR3_FED_UG_DFLT, by="BBRR3_FED_UG_DFLT")
Q22.S <- left_join(x=Q22.S, y=conversionsDF.BBRR3_FED_UG_DLNQ, by="BBRR3_FED_UG_DLNQ")
Q22.S <- left_join(x=Q22.S, y=conversionsDF.BBRR3_FED_UG_NOPROG, by="BBRR3_FED_UG_NOPROG")

Q22.S$`Default delinquent or not making progress` <- Q22.S$BBRR3_FED_UG_DFLT.modified + Q22.S$BBRR3_FED_UG_DLNQ.modified + Q22.S$BBRR3_FED_UG_NOPROG.modified
Q22.S <- Q22.S %>% arrange(desc(`Default delinquent or not making progress`))
Q22.S$`Default delinquent or not making progress` <- percent(Q22.S$`Default delinquent or not making progress`, accuracy=0.1)

# Now the same for Parent PLUS borrowers. 

Q22.P <- CSI %>% select(UNITID, OPEID, OPEID6, INSTNM, STABBR, CONTROL, BBRR3_PP_UG_N, BBRR3_PP_UG_DFLT, BBRR3_PP_UG_DLNQ, BBRR3_PP_UG_NOPROG) %>% filter(STABBR=="CA") %>% filter(duplicated(OPEID6)==FALSE)

Q22.P$BBRR3_PP_UG_N <- as.numeric(Q22.P$BBRR3_PP_UG_N)
Q22.P <- Q22.P %>% filter(BBRR3_PP_UG_N >= 200)

conversionsDF.BBRR3_PP_UG_DFLT <- conversionsDF
conversionsDF.BBRR3_PP_UG_DLNQ <- conversionsDF
conversionsDF.BBRR3_PP_UG_NOPROG <- conversionsDF

names(conversionsDF.BBRR3_PP_UG_DFLT) <- c("BBRR3_PP_UG_DFLT", "BBRR3_PP_UG_DFLT.modified")
names(conversionsDF.BBRR3_PP_UG_DLNQ) <- c("BBRR3_PP_UG_DLNQ", "BBRR3_PP_UG_DLNQ.modified")
names(conversionsDF.BBRR3_PP_UG_NOPROG) <- c("BBRR3_PP_UG_NOPROG", "BBRR3_PP_UG_NOPROG.modified")

Q22.P <- left_join(x=Q22.P, y=conversionsDF.BBRR3_PP_UG_DFLT, by="BBRR3_PP_UG_DFLT")
Q22.P <- left_join(x=Q22.P, y=conversionsDF.BBRR3_PP_UG_DLNQ, by="BBRR3_PP_UG_DLNQ")
Q22.P <- left_join(x=Q22.P, y=conversionsDF.BBRR3_PP_UG_NOPROG, by="BBRR3_PP_UG_NOPROG")

Q22.P$`Default delinquent or not making progress` <- Q22.P$BBRR3_PP_UG_DFLT.modified + Q22.P$BBRR3_PP_UG_DLNQ.modified + Q22.P$BBRR3_PP_UG_NOPROG.modified
Q22.P <- Q22.P %>% arrange(desc(`Default delinquent or not making progress`))
Q22.P$`Default delinquent or not making progress` <- percent(Q22.P$`Default delinquent or not making progress`, accuracy=0.1)

# Now the same for graduate borrowers. 

Q22.G <- CSI %>% select(UNITID, OPEID, OPEID6, INSTNM, STABBR, CONTROL, BBRR3_FED_GR_N, BBRR3_FED_GR_DFLT, BBRR3_FED_GR_DLNQ, BBRR3_FED_GR_NOPROG) %>% filter(STABBR=="CA") %>% filter(duplicated(OPEID6)==FALSE)

Q22.G$BBRR3_FED_GR_N <- as.numeric(Q22.G$BBRR3_FED_GR_N)
Q22.G <- Q22.G %>% filter(BBRR3_FED_GR_N >= 200)

conversionsDF.BBRR3_FED_GR_DFLT <- conversionsDF
conversionsDF.BBRR3_FED_GR_DLNQ <- conversionsDF
conversionsDF.BBRR3_FED_GR_NOPROG <- conversionsDF

names(conversionsDF.BBRR3_FED_GR_DFLT) <- c("BBRR3_FED_GR_DFLT", "BBRR3_FED_GR_DFLT.modified")
names(conversionsDF.BBRR3_FED_GR_DLNQ) <- c("BBRR3_FED_GR_DLNQ", "BBRR3_FED_GR_DLNQ.modified")
names(conversionsDF.BBRR3_FED_GR_NOPROG) <- c("BBRR3_FED_GR_NOPROG", "BBRR3_FED_GR_NOPROG.modified")

Q22.G <- left_join(x=Q22.G, y=conversionsDF.BBRR3_FED_GR_DFLT, by="BBRR3_FED_GR_DFLT")
Q22.G <- left_join(x=Q22.G, y=conversionsDF.BBRR3_FED_GR_DLNQ, by="BBRR3_FED_GR_DLNQ")
Q22.G <- left_join(x=Q22.G, y=conversionsDF.BBRR3_FED_GR_NOPROG, by="BBRR3_FED_GR_NOPROG")

Q22.G$`Default delinquent or not making progress` <- Q22.G$BBRR3_FED_GR_DFLT.modified + Q22.G$BBRR3_FED_GR_DLNQ.modified + Q22.G$BBRR3_FED_GR_NOPROG.modified
Q22.G <- Q22.G %>% arrange(desc(`Default delinquent or not making progress`))
Q22.G$`Default delinquent or not making progress` <- percent(Q22.G$`Default delinquent or not making progress`, accuracy=0.1)

# Worst 4-digit CIPs and award levels for default rates in California

Q23 <- CSP %>% select(UNITID, OPEID6, INSTNM, STABBR, CONTROL, CIPCODE, CIPDESC, CREDLEV, CREDDESC, BBRR3_FED_COMP_N, BBRR3_FED_COMP_DFLT, BBRR3_FED_COMP_DLNQ, BBRR3_FED_COMP_NOPROG) %>% filter(STABBR=="CA") 

Q23$BBRR3_FED_COMP_N <- as.numeric(Q23$BBRR3_FED_COMP_N)
Q23 <- Q23 %>% filter(BBRR3_FED_COMP_N >= 100)

conversionsDF.BBRR3_FED_COMP_DFLT <- conversionsDF
conversionsDF.BBRR3_FED_COMP_DLNQ <- conversionsDF
conversionsDF.BBRR3_FED_COMP_NOPROG <- conversionsDF

names(conversionsDF.BBRR3_FED_COMP_DFLT) <- c("BBRR3_FED_COMP_DFLT", "BBRR3_FED_COMP_DFLT.modified")
names(conversionsDF.BBRR3_FED_COMP_DLNQ) <- c("BBRR3_FED_COMP_DLNQ", "BBRR3_FED_COMP_DLNQ.modified")
names(conversionsDF.BBRR3_FED_COMP_NOPROG) <- c("BBRR3_FED_COMP_NOPROG", "BBRR3_FED_COMP_NOPROG.modified")

Q23 <- left_join(x=Q23, y=conversionsDF.BBRR3_FED_COMP_DFLT, by="BBRR3_FED_COMP_DFLT")
Q23 <- left_join(x=Q23, y=conversionsDF.BBRR3_FED_COMP_DLNQ, by="BBRR3_FED_COMP_DLNQ")
Q23 <- left_join(x=Q23, y=conversionsDF.BBRR3_FED_COMP_NOPROG, by="BBRR3_FED_COMP_NOPROG")

# Nope. There are too few available programs ... 

# Worst 4-digit CIPs and award levels by debt compared to earnings

Q24 <- CSP %>% select(
  UNITID,       # Unit ID for institution
  OPEID6,       # 6-digit OPE ID for institution
  INSTNM,       # Institution name
  STABBR,       # Institution state
  MAIN,         # Flag for main campus
  CONTROL,      # Control of institution
  CIPCODE,      # Classification of Instructional Programs (CIP) code for the field of study
  CIPDESC,      # Text description of the field of study CIP Code
  CREDLEV,      # Level of credential
  CREDDESC,     # Text description of the level of credential
  DEBT_ALL_STGP_EVAL_N,          # Borrower count for average/median Stafford and Grad PLUS loan debt disbursed at this institution
  DEBT_ALL_STGP_EVAL_MDN,        # Median Stafford and Grad PLUS loan debt disbursed at this institution
  EARN_MDN_HI_1YR,               # Median earnings of graduates working and not enrolled 1 year after completing highest credential
  EARN_COUNT_WNE_HI_1YR          # Number of graduates working and not enrolled 1 year after completing highest credential	
) %>% filter(STABBR=="CA") %>% arrange(desc(MAIN))

Q24 <- Q24 %>% filter(DEBT_ALL_STGP_EVAL_N != "PrivacySuppressed") 
Q24 <- Q24 %>% filter(DEBT_ALL_STGP_EVAL_MDN != "PrivacySuppressed")
Q24 <- Q24 %>% filter(EARN_MDN_HI_1YR != "PrivacySuppressed") 
Q24 <- Q24 %>% filter(EARN_COUNT_WNE_HI_1YR != "PrivacySuppressed")

Q24$`Unique combination of OPEID, CIP, and CREDLEV` <- paste(Q24$OPEID6, Q24$CIPCODE, Q24$CREDLEV, sep="+")
Q24 <- Q24 %>% filter(duplicated(`Unique combination of OPEID, CIP, and CREDLEV`)==FALSE)

Q24$DEBT_ALL_STGP_EVAL_N <- as.numeric(Q24$DEBT_ALL_STGP_EVAL_N)
Q24$DEBT_ALL_STGP_EVAL_MDN <- as.numeric(Q24$DEBT_ALL_STGP_EVAL_MDN)
Q24$EARN_MDN_HI_1YR <- as.numeric(Q24$EARN_MDN_HI_1YR)
Q24$EARN_COUNT_WNE_HI_1YR <- as.numeric(Q24$EARN_COUNT_WNE_HI_1YR)

Q24.1 <- aggregate(data=Q24, cbind(DEBT_ALL_STGP_EVAL_N, EARN_COUNT_WNE_HI_1YR) ~ CIPDESC + CREDDESC, FUN=sum)
names(Q24.1) <- c("CIPDESC", "CREDDESC", "Total borrower count", "Total earner count")
Q24 <- left_join(x=Q24, y=Q24.1, by=c("CIPDESC", "CREDDESC"))

Q24$`Share of all borrowers` <- Q24$DEBT_ALL_STGP_EVAL_N / Q24$`Total borrower count`
Q24$`Weighted debt median` <- Q24$`Share of all borrowers` * Q24$DEBT_ALL_STGP_EVAL_MDN

Q24$`Share of all earners` <- Q24$EARN_COUNT_WNE_HI_1YR / Q24$`Total earner count`
Q24$`Weighted earnings median` <- Q24$`Share of all earners` * Q24$EARN_MDN_HI_1YR

Q24.2 <- aggregate(data=Q24, cbind(`Weighted debt median`, `Weighted earnings median`) ~ CIPDESC + CREDDESC, FUN=sum)
Q24.2$`Ratio of debt to earnings` <- Q24.2$`Weighted debt median` / Q24.2$`Weighted earnings median`

Q24.2 <- Q24.2 %>% arrange(desc(`Ratio of debt to earnings`))
Q24.2$`Weighted debt median` <- dollar(Q24.2$`Weighted debt median`, accuracy=1)
Q24.2$`Weighted earnings median` <- dollar(Q24.2$`Weighted earnings median`, accuracy=1)
Q24.2$`Ratio of debt to earnings` <- round(Q24.2$`Ratio of debt to earnings`, 2)









# Worst 4-digit CIPs and award levels by debt compared to earnings, for Pell recipients 

Q25 <- CSP %>% select(
  UNITID,       # Unit ID for institution
  OPEID6,       # 6-digit OPE ID for institution
  INSTNM,       # Institution name
  STABBR,       # Institution state
  MAIN,         # Flag for main campus
  CONTROL,      # Control of institution
  CIPCODE,      # Classification of Instructional Programs (CIP) code for the field of study
  CIPDESC,      # Text description of the field of study CIP Code
  CREDLEV,      # Level of credential
  CREDDESC,     # Text description of the level of credential
  DEBT_PELL_STGP_EVAL_N,         # Borrower count for average/median Stafford and Grad PLUS loan debt disbursed to Pell recipients at this institution
  DEBT_PELL_STGP_EVAL_MDN,       # Median Stafford and Grad PLUS loan debt disbursed to Pell recipients at this institution
  EARN_PELL_WNE_MDN_1YR,         # Median earnings of graduates who received a Pell Grant and were working and not enrolled 1 year after completing highest credential
  EARN_COUNT_PELL_WNE_1YR        # Number of graduates who received a Pell Grant and were working and not enrolled 1 year after completing highest credential
) %>% filter(STABBR=="CA")

Q25 <- Q25 %>% filter(DEBT_PELL_STGP_EVAL_N != "PrivacySuppressed") 
Q25 <- Q25 %>% filter(DEBT_PELL_STGP_EVAL_MDN != "PrivacySuppressed")
Q25 <- Q25 %>% filter(EARN_PELL_WNE_MDN_1YR != "PrivacySuppressed") 
Q25 <- Q25 %>% filter(EARN_COUNT_PELL_WNE_1YR != "PrivacySuppressed")

Q25$`Unique combination of OPEID, CIP, and CREDLEV` <- paste(Q25$OPEID6, Q25$CIPCODE, Q25$CREDLEV, sep="+")
Q25 <- Q25 %>% filter(duplicated(`Unique combination of OPEID, CIP, and CREDLEV`)==FALSE)

Q25$DEBT_PELL_STGP_EVAL_N <- as.numeric(Q25$DEBT_PELL_STGP_EVAL_N)
Q25$DEBT_PELL_STGP_EVAL_MDN <- as.numeric(Q25$DEBT_PELL_STGP_EVAL_MDN)
Q25$EARN_PELL_WNE_MDN_1YR <- as.numeric(Q25$EARN_PELL_WNE_MDN_1YR)
Q25$EARN_COUNT_PELL_WNE_1YR <- as.numeric(Q25$EARN_COUNT_PELL_WNE_1YR)

Q25.1 <- aggregate(data=Q25, cbind(DEBT_PELL_STGP_EVAL_N, EARN_COUNT_PELL_WNE_1YR) ~ CIPDESC + CREDDESC, FUN=sum)
names(Q25.1) <- c("CIPDESC", "CREDDESC", "Total borrower count", "Total earner count")
Q25 <- left_join(x=Q25, y=Q25.1, by=c("CIPDESC", "CREDDESC"))

Q25$`Share of all borrowers` <- Q25$DEBT_PELL_STGP_EVAL_N / Q25$`Total borrower count`
Q25$`Weighted debt median` <- Q25$`Share of all borrowers` * Q25$DEBT_PELL_STGP_EVAL_MDN

Q25$`Share of all earners` <- Q25$EARN_COUNT_PELL_WNE_1YR / Q25$`Total earner count`
Q25$`Weighted earnings median` <- Q25$`Share of all earners` * Q25$EARN_PELL_WNE_MDN_1YR

Q25.2 <- aggregate(data=Q25, cbind(`Weighted debt median`, `Weighted earnings median`) ~ CIPDESC + CREDDESC, FUN=sum)
Q25.2$`Ratio of debt to earnings` <- Q25.2$`Weighted debt median` / Q25.2$`Weighted earnings median`

Q25.2 <- Q25.2 %>% arrange(desc(`Ratio of debt to earnings`))
Q25.2$`Weighted debt median` <- dollar(Q25.2$`Weighted debt median`, accuracy=1)
Q25.2$`Weighted earnings median` <- dollar(Q25.2$`Weighted earnings median`, accuracy=1)
Q25.2$`Ratio of debt to earnings` <- round(Q25.2$`Ratio of debt to earnings`, 2)

# Relate the demographics of 4-digit CIP codes and award levels in California to median earnings

Q26.1 <- c2yr %>% select(
  `UNITID`, 
  `OPEID`,
  `STABBR`,
  `CIPCODE`,
  `AWLEVEL`,
  `CTOTALT`,
  `CBKAAT`, 
  `CHISPT`
) %>% filter(STABBR=="CA")
Q26.1$CIPCODE <- as.character(Q26.1$CIPCODE)
Q26.1$CIPCODE <- ifelse(Q26.1$CIPCODE %in% c(
  "1", "2", "3", "4", "5", "6", "7", "8", "9", "10",
  "11", "12", "13", "14", "15", "16", "17", "18", "19", "20",
  "21", "22", "23", "24", "25", "26", "27", "28", "29", "30",
  "31", "32", "33", "34", "35", "36", "37", "38", "39", "40",
  "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", 
  "51", "52", "53", "54", "99"
), paste(Q26.1$CIPCODE, ".0000", sep=""), Q26.1$CIPCODE)
Q26.1$CIPCODE <-ifelse(substr(Q26.1$CIPCODE, 1, 2) %in% c("1.", "2.", "3.", "4.", "5.", "6.", "7.", "8.", "9."), paste("0", Q26.1$CIPCODE, sep=""), Q26.1$CIPCODE)
Q26.1$CIPCODE <-ifelse(nchar(Q26.1$CIPCODE)==4, paste(Q26.1$CIPCODE, "0", sep=""), Q26.1$CIPCODE)
Q26.1$CIPCODE <-ifelse(nchar(Q26.1$CIPCODE)==5, paste(Q26.1$CIPCODE, "0", sep=""), Q26.1$CIPCODE)
Q26.1$CIPCODE <-ifelse(nchar(Q26.1$CIPCODE)==6, paste(Q26.1$CIPCODE, "0", sep=""), Q26.1$CIPCODE)
Q26.1$CIPCODE <- paste(substr(Q26.1$CIPCODE, 1, 2), substr(Q26.1$CIPCODE, 4, 5), sep="")
Q26.1 <- aggregate(data=Q26.1, cbind(CTOTALT, CBKAAT, CHISPT) ~ CIPCODE + AWLEVEL, FUN=sum)

Q26.1$CREDDESC <- rep(NA, nrow(Q26.1))
Q26.1$CREDDESC[Q26.1$AWLEVEL %in% c(2, 4, 20, 21)] <- "Undergraduate Certificate or Diploma"
Q26.1$CREDDESC[Q26.1$AWLEVEL==3] <- "Associate's Degree"
Q26.1$CREDDESC[Q26.1$AWLEVEL==5] <- "Bachelors Degree"
Q26.1$CREDDESC[Q26.1$AWLEVEL %in% c(6, 8)] <- "Graduate/Professional Certificate"
Q26.1$CREDDESC[Q26.1$AWLEVEL==7] <- "Master's Degree"
Q26.1$CREDDESC[Q26.1$AWLEVEL==17] <- "Doctoral Degree"
Q26.1$CREDDESC[Q26.1$AWLEVEL %in% c(18, 19)] <- "First Professional Degree"

Q26.1$`Share who are BKAA` <- Q26.1$CBKAAT / Q26.1$CTOTALT
Q26.1$`Share who are HISP` <- Q26.1$CHISPT / Q26.1$CTOTALT
Q26.1$`Share who are BKAA or HISP` <- (Q26.1$CBKAAT + Q26.1$CHISPT) / Q26.1$CTOTALT
Q26.1$`Rank of BKAA share` <- rank(-(Q26.1$`Share who are BKAA`), ties.method="average")
Q26.1$`Rank of HISP share` <- rank(-(Q26.1$`Share who are HISP`), ties.method="average")
Q26.1$`Rank of BKAA/HISP share` <- rank(-(Q26.1$`Share who are BKAA or HISP`), ties.method="average")

Q26.2 <- CSP %>% select(
  UNITID,       # Unit ID for institution
  OPEID6,       # 6-digit OPE ID for institution
  INSTNM,       # Institution name
  STABBR,       # Institution state
  MAIN,         # Flag for main campus
  CONTROL,      # Control of institution
  CIPCODE,      # Classification of Instructional Programs (CIP) code for the field of study
  CIPDESC,      # Text description of the field of study CIP Code
  CREDLEV,      # Level of credential
  CREDDESC,     # Text description of the level of credential
  EARN_MDN_HI_1YR,               # Median earnings of graduates working and not enrolled 1 year after completing highest credential
  EARN_COUNT_WNE_HI_1YR          # Number of graduates working and not enrolled 1 year after completing highest credential	
) %>% filter(STABBR=="CA") %>% arrange(desc(MAIN))

Q26.2$CREDDESC[Q26.2$CREDDESC=="Post-baccalaureate Certificate"] <- "Graduate/Professional Certificate"

Q26.2 <- Q26.2 %>% filter(EARN_MDN_HI_1YR != "PrivacySuppressed") 
Q26.2 <- Q26.2 %>% filter(EARN_COUNT_WNE_HI_1YR != "PrivacySuppressed")

Q26.2$`Unique combination of OPEID, CIP, and CREDLEV` <- paste(Q26.2$OPEID6, Q26.2$CIPCODE, Q26.2$CREDLEV, sep="+")
Q26.2 <- Q26.2 %>% filter(duplicated(`Unique combination of OPEID, CIP, and CREDLEV`)==FALSE)

Q26.2$EARN_MDN_HI_1YR <- as.numeric(Q26.2$EARN_MDN_HI_1YR)
Q26.2$EARN_COUNT_WNE_HI_1YR <- as.numeric(Q26.2$EARN_COUNT_WNE_HI_1YR)

Q26.3 <- aggregate(data=Q26.2, EARN_COUNT_WNE_HI_1YR ~ CIPCODE + CREDDESC, FUN=sum)
names(Q26.3) <- c("CIPCODE", "CREDDESC", "Total earner count")
Q26.2 <- left_join(x=Q26.2, y=Q26.3, by=c("CIPCODE", "CREDDESC"))

Q26.2$`Share of all earners` <- Q26.2$EARN_COUNT_WNE_HI_1YR / Q26.2$`Total earner count`
Q26.2$`Weighted earnings median` <- Q26.2$`Share of all earners` * Q26.2$EARN_MDN_HI_1YR
Q26.2 <- aggregate(data=Q26.2, `Weighted earnings median` ~ CIPCODE + CREDDESC, FUN=sum)
Q26.2$`Rank of weighted earnings` <- rank(-(Q26.2$`Weighted earnings median`), ties.method="average")
Q26.2$CIPCODE <- as.character(Q26.2$CIPCODE)
Q26.2$CIPCODE <- ifelse(nchar(Q26.2$CIPCODE)==3, paste("0", Q26.2$CIPCODE, sep=""), Q26.2$CIPCODE)

Q26 <- inner_join(x=Q26.2, y=Q26.1, by=c("CIPCODE", "CREDDESC"))

Q26.Bplot <- Q26 %>% filter(`Share who are BKAA` != 0)
Q26.Hplot <- Q26 %>% filter(`Share who are HISP` != 0)

ggplot(data=Q26.Bplot, mapping=aes(x=`Rank of BKAA share`, y=`Rank of weighted earnings`)) + geom_point(stat="identity")
ggplot(data=Q26.Hplot, mapping=aes(x=`Rank of HISP share`, y=`Rank of weighted earnings`)) + geom_point(stat="identity")

# Let's now do the same but for debt. 

Q27 <- CSP %>% select(
  UNITID,       # Unit ID for institution
  OPEID6,       # 6-digit OPE ID for institution
  INSTNM,       # Institution name
  STABBR,       # Institution state
  MAIN,         # Flag for main campus
  CONTROL,      # Control of institution
  CIPCODE,      # Classification of Instructional Programs (CIP) code for the field of study
  CIPDESC,      # Text description of the field of study CIP Code
  CREDLEV,      # Level of credential
  CREDDESC,     # Text description of the level of credential
  DEBT_ALL_STGP_EVAL_N,          # Borrower count for average/median Stafford and Grad PLUS loan debt disbursed at this institution
  DEBT_ALL_STGP_EVAL_MDN         # Median Stafford and Grad PLUS loan debt disbursed at this institution
) %>% filter(STABBR=="CA") %>% arrange(desc(MAIN))

Q27$CREDDESC[Q27$CREDDESC=="Post-baccalaureate Certificate"] <- "Graduate/Professional Certificate"

Q27 <- Q27 %>% filter(DEBT_ALL_STGP_EVAL_MDN != "PrivacySuppressed") 
Q27 <- Q27 %>% filter(DEBT_ALL_STGP_EVAL_N != "PrivacySuppressed")

Q27$`Unique combination of OPEID, CIP, and CREDLEV` <- paste(Q27$OPEID6, Q27$CIPCODE, Q27$CREDLEV, sep="+")
Q27 <- Q27 %>% filter(duplicated(`Unique combination of OPEID, CIP, and CREDLEV`)==FALSE)

Q27$DEBT_ALL_STGP_EVAL_MDN <- as.numeric(Q27$DEBT_ALL_STGP_EVAL_MDN)
Q27$DEBT_ALL_STGP_EVAL_N <- as.numeric(Q27$DEBT_ALL_STGP_EVAL_N)

Q27.1 <- aggregate(data=Q27, DEBT_ALL_STGP_EVAL_N ~ CIPCODE + CREDDESC, FUN=sum)
names(Q27.1) <- c("CIPCODE", "CREDDESC", "Total borrower count")
Q27 <- left_join(x=Q27, y=Q27.1, by=c("CIPCODE", "CREDDESC"))

Q27$`Share of all borrowers` <- Q27$DEBT_ALL_STGP_EVAL_N / Q27$`Total borrower count`
Q27$`Weighted debt median` <- Q27$`Share of all borrowers` * Q27$DEBT_ALL_STGP_EVAL_MDN
Q27 <- aggregate(data=Q27, `Weighted debt median` ~ CIPCODE + CREDDESC, FUN=sum)
Q27$`Rank of weighted debt` <- rank(-(Q27$`Weighted debt median`), ties.method="average")
Q27$CIPCODE <- as.character(Q27$CIPCODE)
Q27$CIPCODE <- ifelse(nchar(Q27$CIPCODE)==3, paste("0", Q27$CIPCODE, sep=""), Q27$CIPCODE)

Q27 <- inner_join(x=Q27, y=Q26.1, by=c("CIPCODE", "CREDDESC"))

Q27.Bplot <- Q27 %>% filter(`Share who are BKAA` != 0)
Q27.Hplot <- Q27 %>% filter(`Share who are HISP` != 0)

ggplot(data=Q27.Bplot, mapping=aes(x=`Rank of BKAA share`, y=`Rank of weighted debt`)) + geom_point(stat="identity") + facet_wrap(`CREDDESC` ~ .)
ggplot(data=Q27.Hplot, mapping=aes(x=`Rank of HISP share`, y=`Rank of weighted debt`)) + geom_point(stat="identity") + facet_wrap(`CREDDESC` ~ .)
