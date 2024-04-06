working_direc <- "C:/Users/zhouu/Downloads/Final Year UNSW/ACTL4001/SOA Project"
setwd(working_direc)
require("openxlsx")
require("dplyr")
require("survival")

data <- read.xlsx("Inforce Dataset.xlsx")
raw_data <- data[-c(1:2),]
colnames(raw_data) <- raw_data[1,]
inforce_data <- data.frame(raw_data[-1,])
columns_to_convert <- c("Year.of.Death", "Year.of.Lapse", "Issue.year")
inforce_data[columns_to_convert] <- lapply(inforce_data[columns_to_convert], as.numeric)

inforce_data2 <- inforce_data %>%
  mutate(active = is.na(Year.of.Death) & is.na(Year.of.Lapse), 
         time_to_death = ifelse(!is.na(Year.of.Death), as.numeric(Year.of.Death - Issue.year), NA), 
         time_to_lapse = ifelse(!is.na(Year.of.Lapse), as.numeric(Year.of.Lapse - Issue.year), NA),
         age_at_death = Year.of.Death - Issue.year + as.numeric(Issue.age))


# 978582 unique policy numbers
anyDuplicated(inforce_data2$Policy.number) #None
length(unique(inforce_data2$Policy.number)) #978582

# subset data
SPWL <- subset(inforce_data2, inforce_data2$Policy.type == "SPWL")
T20 <- subset(inforce_data2, inforce_data2$Policy.type == "T20")
C00_D48_deaths <- subset(inforce_data2, Cause.of.Death == "C00-D48")
term_time_to_death <- subset(inforce_data2, Policy.type == "T20")$time_to_death
WL_time_to_death <- subset(inforce_data2, Policy.type == "SPWL")$time_to_death

par(mfrow = c(2, 2))
par(mar = c(6, 5, 4, 2), mgp = c(3, 0.5, 0))  

# Appendix 8.1.3.1
hist(inforce_data2$Issue.year, xlim = c(2000, 2025), col = "light blue", xlab = "Year", main = "Issue Year")

# Appendix 8.1.3.2
hist(term_time_to_death, xlim = c(0, 20), col = "light blue", main = "T20 Time to Death", xlab = "Years to Death")

# Appendix 8.1.3.3
hist(WL_time_to_death, xlim = c(0,25), ylim = c(0, 3000), col = "medium purple", main = "SPWL Time to Death", xlab = "Years to Death")

# Appendix 8.1.3.4
hist(inforce_data2$age_at_death, main = "Age at Death", xlab= "Age", ylab = "Frequency", col = "medium purple")

# Appendix 8.1.3.5
females_data <- subset(inforce_data2, Sex == "F")
num_female_deaths <- sum(!is.na(females_data$Death.indicator)) # 12175 females have died
f_cause_death <- sort(table(females_data$Cause.of.Death), decreasing = TRUE)
barplot(f_cause_death, las = 2, xlab = "Female Death Reasons", ylab = "Frequency", ylim = c(0,5000),
        main = "Female Death Causes", col = "medium purple") 

# Appendix 8.1.3.6
males_data <- subset(inforce_data2, Sex == "M")
num_male_deaths <- sum(!is.na(males_data$Death.indicator)) # 28201 males have died
m_cause_death <- sort(table(males_data$Cause.of.Death), decreasing = TRUE)
barplot(m_cause_death, las = 2, xlab = "Male Death Reasons", ylab = "Frequency", ylim = c(0,10000),
        main = "Male Death Causes", col = "light blue") 

# Appendix 8.1.3.7
barplot(sort(table(inforce_data$Cause.of.Death), decreasing = TRUE), xlab = "Cause of Death", ylab = "Frequency", main = "Histogram of Causes of Death", ylim = c(0, 14000), las = 2, col = "light blue")

# Appendix 8.1.3.8
barplot(table(inforce_data$Smoker.Status, inforce_data$Region), beside = TRUE, col = c("medium purple", "light blue"), xlab = "Region", ylab ="Number of Policyholders", main = "Smoking Status Aross Regions", legend = TRUE, ylim = c(0,300000))

# Appendix 8.1.3.9
smoking_policy_type <- table(inforce_data2$Smoker.Status, inforce_data2$Policy.type)
smoking_policy_type_prop <- prop.table(smoking_policy_type, margin = 2)
barplot(smoking_policy_type, beside = TRUE, legend = TRUE, col = c("medium purple", "light blue"), ylim = c(0,600000), ylab = "Number of Policyholders", main = "Smoking Status Across Policy Types")

# Appendix 8.1.3.10
sex_policy_type <- table(inforce_data2$Sex, inforce_data2$Policy.type)
prop.table(sex_policy_type, margin = 2)
barplot(sex_policy_type, beside = TRUE, legend = TRUE, col = c("medium purple", "light blue"), ylim = c(0,350000), ylab = "Number of Policyholders", main = "Gender Division Across Policy Types")

# Appendix 8.1.3.11
urban_rural_policy <- table(inforce_data2$Urban.vs.Rural, inforce_data2$Policy.type)
urban_rural_policy_prop <- prop.table(urban_rural_policy, margin = 2)
barplot(urban_rural_policy, beside = TRUE, legend = TRUE, col = c("medium purple", "light blue"), ylim = c(0,500000), ylab = "Number of Policyholders", main = "Urban or Rural Across Policies")

# Appendix 8.1.3.12
distribution_policy <- table(inforce_data2$Distribution.Channel, inforce_data2$Policy.type)
distribution_policy_policy_prop <- prop.table(distribution_policy, margin = 2)
barplot(distribution_policy, beside = TRUE, legend = TRUE, col = c("light blue", "pink", "medium purple"), ylim = c(0,500000), ylab = "Number of Policyholders", main = "Distribution Channels Across Policies")

# Appendix 8.1.3.13
prop.table(table(inforce_data2$Region, inforce_data2$Urban.vs.Rural))*100

# Appendix 8.1.3.14
prop.table(table(inforce_data2$Region, inforce_data2$Distribution.Channel), margin = 1)*100

# Appendix 8.1.3.15
prop.table(table(inforce_data2$Underwriting.Class, inforce_data2$Face.amount), margin = 2)*100

# Appendix 8.1.3.16
SPWL_summary <- SPWL %>%
  summarize(
    n_SPWL = n(),
    n_Death = sum(!is.na(Year.of.Death)),
    n_Lapse = sum(!is.na(Year.of.Lapse)),
    n_Active = n_SPWL - n_Death - n_Lapse
  )

T20_summary <- T20 %>%
  summarize(
    n_T20 = n(),
    n_Death = sum(!is.na(Year.of.Death)),
    n_Lapse = sum(!is.na(Year.of.Lapse)),
    n_Active = n_T20 - n_Death - n_Lapse
  )

############################################
############################################
################ Statistical Tests #########
############################################

# issue age, sex, smoker status, underwriting class, urban vs rural and region
death.subset <- subset(inforce_data2, !is.na(Year.of.Death))
death.cox <- coxph(Surv(time_to_death) ~ Issue.age + as.factor(Sex) + as.factor(Smoker.Status)+as.factor(Underwriting.Class)
                   +as.factor(Urban.vs.Rural)+Region, data = death.subset)
summary(death.cox)

# policy type, issue age, sex, region 
death.cox2 <- coxph(Surv(time_to_death) ~ Issue.age + as.factor(Sex) + as.factor(Smoker.Status), data = death.subset)
summary(death.cox2)

# death.age
deathtime.cox<-coxph(Surv(time_to_death) ~ age_at_death, data = death.subset)
summary(deathtime.cox)

# underwriting.class
underwriting.cox<-coxph(Surv(time_to_death) ~ as.factor(Underwriting.Class), data = death.subset)
summary(underwriting.cox)

#conduct log-rank test to test the significance of rural vs urban
death.surv<-Surv(death.subset$time_to_death)
urban.logrank<-survdiff(death.surv ~ as.factor(death.subset$Urban.vs.Rural))
urban.logrank

#log-rank test on the significance of different region
region.logrank<-survdiff(death.surv ~ death.subset$Region)
region.logrank

#log-rank test on different underwriting class
underwrite.logrank<-survdiff(death.surv ~ as.factor(death.subset$Underwriting.Class))
underwrite.logrank

#log-rank test on different face amount
face.logrank<-survdiff(death.surv ~ death.subset$Face.amount)
face.logrank
face.cox <- coxph(Surv(time_to_death) ~ Face.amount, data = death.subset)
summary(face.cox)





