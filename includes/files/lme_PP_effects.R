## Estimate language's orientation effect by lme
library(tidyverse)
library(lme4)
library(parameters)

# Import data for estimation
##PP_lme_data <- read_csv(file="./includes/files/PP_lme_data.csv")

## German
german.fixed.two.model <- lmer(response_time ~ Identical + (1|Subject) + (1|Picture1) , 
                               control = lmerControl(optimizer = "bobyqa",
                                                     optCtrl = list(maxfun = 1e6)), 
                               data = subset(PP_lme_data,Language == "German"))

german.fixed.three.model <- lmer(response_time ~ Identical + (1|Subject) + (1|Picture1) + (1|PSA_ID) , 
                               control = lmerControl(optimizer = "bobyqa",
                                                     optCtrl = list(maxfun = 1e6)), 
                               data = subset(PP_lme_data,Language == "German"))

AIC(german.fixed.three.model) < AIC(german.fixed.two.model) ## FALSE

## Effect CI
german.ci <- paste(round(fixef(german.fixed.two.model)["Identical0DIFF"], 2),"[", 
                   round(fixef(german.fixed.two.model)["Identical0DIFF"] + 
                           qnorm(.025)*standard_error(german.fixed.two.model)[2,"SE"], 2),   ## Compute CI for illustration 
                   ",",
                   round(fixef(german.fixed.two.model)["Identical0DIFF"] + 
                           qnorm(.925)*standard_error(german.fixed.two.model)[2,"SE"], 2),"]")


## English
english.fixed.two.model <- lmer(response_time ~ Identical + (1|Subject) + (1|Picture1) , 
                               control = lmerControl(optimizer = "bobyqa",
                                                     optCtrl = list(maxfun = 1e6)), 
                               data = subset(PP_lme_data,Language == "English"))

english.fixed.three.model <- lmer(response_time ~ Identical + (1|Subject) + (1|Picture1) + (1|PSA_ID), 
                                control = lmerControl(optimizer = "bobyqa",
                                                      optCtrl = list(maxfun = 1e6)), 
                                data = subset(PP_lme_data,Language == "English"))

AIC(english.fixed.three.model) < AIC(english.fixed.two.model) ## TRUE
#anova(english.fixed.two.model,english.fixed.three.model)

## Effect CI
english.ci <- paste(round(fixef(english.fixed.three.model)["Identical0DIFF"], 2),"[", 
                   round(fixef(english.fixed.three.model)["Identical0DIFF"] + 
                           qnorm(.025)*standard_error(english.fixed.three.model)[2,"SE"], 2),   ## Compute CI for illustration 
                   ",",
                   round(fixef(english.fixed.three.model)["Identical0DIFF"] + 
                           qnorm(.925)*standard_error(english.fixed.three.model)[2,"SE"], 2),"]")


## Arabic
arabic.fixed.two.model <- lmer(response_time ~ Identical + (1|Subject) + (1|Picture1) , 
                                control = lmerControl(optimizer = "bobyqa",
                                                      optCtrl = list(maxfun = 1e6)), 
                                data = subset(PP_lme_data,Language == "Arabic"))
## Effect CI
arabic.ci <- paste(round(fixef(arabic.fixed.two.model)["Identical0DIFF"], 2),"[", 
                    round(fixef(arabic.fixed.two.model)["Identical0DIFF"] + 
                            qnorm(.025)*standard_error(arabic.fixed.two.model)[2,"SE"], 2),   ## Compute CI for illustration 
                    ",",
                    round(fixef(arabic.fixed.two.model)["Identical0DIFF"] + 
                            qnorm(.925)*standard_error(arabic.fixed.two.model)[2,"SE"], 2),"]")


## Brazilian Portuguese
brazilian_portuguese.fixed.two.model <- lmer(response_time ~ Identical + (1|Subject) + (1|Picture1) , 
                               control = lmerControl(optimizer = "bobyqa",
                                                     optCtrl = list(maxfun = 1e6)), 
                               data = subset(PP_lme_data,Language == "Brazilian Portuguese"))

## Effect CI
brazilian_portuguese.ci <- paste(round(fixef(brazilian_portuguese.fixed.two.model)["Identical0DIFF"], 2),"[", 
                   round(fixef(brazilian_portuguese.fixed.two.model)["Identical0DIFF"] + 
                           qnorm(.025)*standard_error(brazilian_portuguese.fixed.two.model)[2,"SE"], 2),   ## Compute CI for illustration 
                   ",",
                   round(fixef(brazilian_portuguese.fixed.two.model)["Identical0DIFF"] + 
                           qnorm(.925)*standard_error(brazilian_portuguese.fixed.two.model)[2,"SE"], 2),"]")

## Greek
greek.fixed.two.model <- lmer(response_time ~ Identical + (1|Subject) + (1|Picture1) , 
                               control = lmerControl(optimizer = "bobyqa",
                                                     optCtrl = list(maxfun = 1e6)), 
                               data = subset(PP_lme_data,Language == "Greek"))

## Effect CI
greek.ci <- paste(round(fixef(greek.fixed.two.model)["Identical0DIFF"], 2),"[", 
                   round(fixef(greek.fixed.two.model)["Identical0DIFF"] + 
                           qnorm(.025)*standard_error(greek.fixed.two.model)[2,"SE"], 2),   ## Compute CI for illustration 
                   ",",
                   round(fixef(greek.fixed.two.model)["Identical0DIFF"] + 
                           qnorm(.925)*standard_error(greek.fixed.two.model)[2,"SE"], 2),"]")

## Hebrew
hebrew.fixed.two.model <- lmer(response_time ~ Identical + (1|Subject) + (1|Picture1) , 
                              control = lmerControl(optimizer = "bobyqa",
                                                    optCtrl = list(maxfun = 1e6)), 
                              data = subset(PP_lme_data,Language == "Hebrew"))

## Effect CI
hebrew.ci <- paste(round(fixef(hebrew.fixed.two.model)["Identical0DIFF"], 2),"[", 
                  round(fixef(hebrew.fixed.two.model)["Identical0DIFF"] + 
                          qnorm(.025)*standard_error(hebrew.fixed.two.model)[2,"SE"], 2),   ## Compute CI for illustration 
                  ",",
                  round(fixef(hebrew.fixed.two.model)["Identical0DIFF"] + 
                          qnorm(.925)*standard_error(hebrew.fixed.two.model)[2,"SE"], 2),"]")

## Hindi
hindi.fixed.two.model <- lmer(response_time ~ Identical + (1|Subject) + (1|Picture1) , 
                               control = lmerControl(optimizer = "bobyqa",
                                                     optCtrl = list(maxfun = 1e6)), 
                               data = subset(PP_lme_data,Language == "Hindi"))

## Effect CI
hindi.ci <- paste(round(fixef(hindi.fixed.two.model)["Identical0DIFF"], 2),"[", 
                   round(fixef(hindi.fixed.two.model)["Identical0DIFF"] + 
                           qnorm(.025)*standard_error(hindi.fixed.two.model)[2,"SE"], 2),   ## Compute CI for illustration 
                   ",",
                   round(fixef(hindi.fixed.two.model)["Identical0DIFF"] + 
                           qnorm(.925)*standard_error(hindi.fixed.two.model)[2,"SE"], 2),"]")


## Hungarian
hungarian.fixed.two.model <- lmer(response_time ~ Identical + (1|Subject) + (1|Picture1) , 
                              control = lmerControl(optimizer = "bobyqa",
                                                    optCtrl = list(maxfun = 1e6)), 
                              data = subset(PP_lme_data,Language == "Hungarian"))

## Effect CI
hungarian.ci <- paste(round(fixef(hungarian.fixed.two.model)["Identical0DIFF"], 2),"[", 
                  round(fixef(hungarian.fixed.two.model)["Identical0DIFF"] + 
                          qnorm(.025)*standard_error(hungarian.fixed.two.model)[2,"SE"], 2),   ## Compute CI for illustration 
                  ",",
                  round(fixef(hungarian.fixed.two.model)["Identical0DIFF"] + 
                          qnorm(.925)*standard_error(hungarian.fixed.two.model)[2,"SE"], 2),"]")


## Norwegian
norwegian.fixed.two.model <- lmer(response_time ~ Identical + (1|Subject) + (1|Picture1) , 
                                  control = lmerControl(optimizer = "bobyqa",
                                                        optCtrl = list(maxfun = 1e6)), 
                                  data = subset(PP_lme_data,Language == "Norwegian"))

norwegian.fixed.three.model <- lmer(response_time ~ Identical + (1|Subject) + (1|Picture1) + (1|PSA_ID), 
                                  control = lmerControl(optimizer = "bobyqa",
                                                        optCtrl = list(maxfun = 1e6)), 
                                  data = subset(PP_lme_data,Language == "Norwegian"))

AIC(norwegian.fixed.three.model) < AIC(norwegian.fixed.two.model) ## FALSE

## Effect CI
norwegian.ci <- paste(round(fixef(norwegian.fixed.two.model)["Identical0DIFF"], 2),"[", 
                      round(fixef(norwegian.fixed.two.model)["Identical0DIFF"] + 
                              qnorm(.025)*standard_error(norwegian.fixed.two.model)[2,"SE"], 2),   ## Compute CI for illustration 
                      ",",
                      round(fixef(norwegian.fixed.two.model)["Identical0DIFF"] + 
                              qnorm(.925)*standard_error(norwegian.fixed.two.model)[2,"SE"], 2),"]")


## Polish
polish.fixed.two.model <- lmer(response_time ~ Identical + (1|Subject) + (1|Picture1) , 
                                  control = lmerControl(optimizer = "bobyqa",
                                                        optCtrl = list(maxfun = 1e6)), 
                                  data = subset(PP_lme_data,Language == "Polish"))

## Effect CI
polish.ci <- paste(round(fixef(polish.fixed.two.model)["Identical0DIFF"], 2),"[", 
                      round(fixef(polish.fixed.two.model)["Identical0DIFF"] + 
                              qnorm(.025)*standard_error(polish.fixed.two.model)[2,"SE"], 2),   ## Compute CI for illustration 
                      ",",
                      round(fixef(polish.fixed.two.model)["Identical0DIFF"] + 
                              qnorm(.925)*standard_error(polish.fixed.two.model)[2,"SE"], 2),"]")


## Portuguese
portuguese.fixed.two.model <- lmer(response_time ~ Identical + (1|Subject) + (1|Picture1) , 
                               control = lmerControl(optimizer = "bobyqa",
                                                     optCtrl = list(maxfun = 1e6)), 
                               data = subset(PP_lme_data,Language == "Portuguese"))

## Effect CI
portuguese.ci <- paste(round(fixef(portuguese.fixed.two.model)["Identical0DIFF"], 2),"[", 
                   round(fixef(portuguese.fixed.two.model)["Identical0DIFF"] + 
                           qnorm(.025)*standard_error(portuguese.fixed.two.model)[2,"SE"], 2),   ## Compute CI for illustration 
                   ",",
                   round(fixef(portuguese.fixed.two.model)["Identical0DIFF"] + 
                           qnorm(.925)*standard_error(portuguese.fixed.two.model)[2,"SE"], 2),"]")



## Serbian
serbian.fixed.two.model <- lmer(response_time ~ Identical + (1|Subject) + (1|Picture1) , 
                                   control = lmerControl(optimizer = "bobyqa",
                                                         optCtrl = list(maxfun = 1e6)), 
                                   data = subset(PP_lme_data,Language == "Serbian"))

## Effect CI
serbian.ci <- paste(round(fixef(serbian.fixed.two.model)["Identical0DIFF"], 2),"[", 
                       round(fixef(serbian.fixed.two.model)["Identical0DIFF"] + 
                               qnorm(.025)*standard_error(serbian.fixed.two.model)[2,"SE"], 2),   ## Compute CI for illustration 
                       ",",
                       round(fixef(serbian.fixed.two.model)["Identical0DIFF"] + 
                               qnorm(.925)*standard_error(serbian.fixed.two.model)[2,"SE"], 2),"]")


## Simplified Chinese
sc.fixed.two.model <- lmer(response_time ~ Identical + (1|Subject) + (1|Picture1) , 
                                control = lmerControl(optimizer = "bobyqa",
                                                      optCtrl = list(maxfun = 1e6)), 
                                data = subset(PP_lme_data,Language == "Simplified Chinese"))
sc.fixed.three.model <- lmer(response_time ~ Identical + (1|Subject) + (1|Picture1) + (1|PSA_ID), 
                           control = lmerControl(optimizer = "bobyqa",
                                                 optCtrl = list(maxfun = 1e6)), 
                           data = subset(PP_lme_data,Language == "Simplified Chinese"))

AIC(sc.fixed.three.model) < AIC(sc.fixed.two.model) ## FALSE

## Effect CI
sc.ci <- paste(round(fixef(sc.fixed.two.model)["Identical0DIFF"], 2),"[", 
                    round(fixef(sc.fixed.two.model)["Identical0DIFF"] + 
                            qnorm(.025)*standard_error(sc.fixed.two.model)[2,"SE"], 2),   ## Compute CI for illustration 
                    ",",
                    round(fixef(sc.fixed.two.model)["Identical0DIFF"] + 
                            qnorm(.925)*standard_error(sc.fixed.two.model)[2,"SE"], 2),"]")


## Slovak
slovak.fixed.two.model <- lmer(response_time ~ Identical + (1|Subject) + (1|Picture1) , 
                           control = lmerControl(optimizer = "bobyqa",
                                                 optCtrl = list(maxfun = 1e6)), 
                           data = subset(PP_lme_data,Language == "Slovak"))

## Effect CI
slovak.ci <- paste(round(fixef(slovak.fixed.two.model)["Identical0DIFF"], 2),"[", 
               round(fixef(slovak.fixed.two.model)["Identical0DIFF"] + 
                       qnorm(.025)*standard_error(slovak.fixed.two.model)[2,"SE"], 2),   ## Compute CI for illustration 
               ",",
               round(fixef(slovak.fixed.two.model)["Identical0DIFF"] + 
                       qnorm(.925)*standard_error(slovak.fixed.two.model)[2,"SE"], 2),"]")


## Spanish
spanish.fixed.two.model <- lmer(response_time ~ Identical + (1|Subject) + (1|Picture1) , 
                               control = lmerControl(optimizer = "bobyqa",
                                                     optCtrl = list(maxfun = 1e6)), 
                               data = subset(PP_lme_data,Language == "Spanish"))

## Effect CI
spanish.ci <- paste(round(fixef(spanish.fixed.two.model)["Identical0DIFF"], 2),"[", 
                   round(fixef(spanish.fixed.two.model)["Identical0DIFF"] + 
                           qnorm(.025)*standard_error(spanish.fixed.two.model)[2,"SE"], 2),   ## Compute CI for illustration 
                   ",",
                   round(fixef(spanish.fixed.two.model)["Identical0DIFF"] + 
                           qnorm(.925)*standard_error(spanish.fixed.two.model)[2,"SE"], 2),"]")


## Thai
thai.fixed.two.model <- lmer(response_time ~ Identical + (1|Subject) + (1|Picture1) , 
                                control = lmerControl(optimizer = "bobyqa",
                                                      optCtrl = list(maxfun = 1e6)), 
                                data = subset(PP_lme_data,Language == "Thai"))

## Effect CI
thai.ci <- paste(round(fixef(thai.fixed.two.model)["Identical0DIFF"], 2),"[", 
                    round(fixef(thai.fixed.two.model)["Identical0DIFF"] + 
                            qnorm(.025)*standard_error(thai.fixed.two.model)[2,"SE"], 2),   ## Compute CI for illustration 
                    ",",
                    round(fixef(thai.fixed.two.model)["Identical0DIFF"] + 
                            qnorm(.925)*standard_error(thai.fixed.two.model)[2,"SE"], 2),"]")


## Traditional Chinese
tc.fixed.two.model <- lmer(response_time ~ Identical + (1|Subject) + (1|Picture1) , 
                             control = lmerControl(optimizer = "bobyqa",
                                                   optCtrl = list(maxfun = 1e6)), 
                             data = subset(PP_lme_data,Language == "Traditional Chinese"))

## Effect CI
tc.ci <- paste(round(fixef(tc.fixed.two.model)["Identical0DIFF"], 2),"[", 
                 round(fixef(tc.fixed.two.model)["Identical0DIFF"] + 
                         qnorm(.025)*standard_error(tc.fixed.two.model)[2,"SE"], 2),   ## Compute CI for illustration 
                 ",",
                 round(fixef(tc.fixed.two.model)["Identical0DIFF"] + 
                         qnorm(.925)*standard_error(tc.fixed.two.model)[2,"SE"], 2),"]")

## Turkish
turkish.fixed.two.model <- lmer(response_time ~ Identical + (1|Subject) + (1|Picture1) , 
                           control = lmerControl(optimizer = "bobyqa",
                                                 optCtrl = list(maxfun = 1e6)), 
                           data = subset(PP_lme_data,Language == "Turkish"))

turkish.fixed.three.model <- lmer(response_time ~ Identical + (1|Subject) + (1|Picture1) + (1|PSA_ID), 
                                control = lmerControl(optimizer = "bobyqa",
                                                      optCtrl = list(maxfun = 1e6)), 
                                data = subset(PP_lme_data,Language == "Turkish"))

AIC(turkish.fixed.three.model) < AIC(turkish.fixed.two.model) ## TRUE


## Effect CI
turkish.ci <- paste(round(fixef(turkish.fixed.two.model)["Identical0DIFF"], 2),"[", 
               round(fixef(turkish.fixed.two.model)["Identical0DIFF"] + 
                       qnorm(.025)*standard_error(turkish.fixed.two.model)[2,"SE"], 2),   ## Compute CI for illustration 
               ",",
               round(fixef(turkish.fixed.two.model)["Identical0DIFF"] + 
                       qnorm(.925)*standard_error(turkish.fixed.two.model)[2,"SE"], 2),"]")

PP_effect_table <- data.frame(
  Language = sort(unique(PP_lme_data$Language)),
  PP_CI = c(arabic.ci,
             brazilian_portuguese.ci,
             english.ci,
             german.ci,
             greek.ci,
             hebrew.ci,
             hindi.ci,
             hungarian.ci,
             norwegian.ci,
             polish.ci,
             portuguese.ci,
             serbian.ci,
             sc.ci,
             slovak.ci,
             spanish.ci,
             thai.ci,
             tc.ci,
             turkish.ci)
)

#write(PP_effect_table, file="/includes/files/PP_effect_table.csv")
