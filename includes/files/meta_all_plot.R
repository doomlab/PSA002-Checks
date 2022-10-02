### a little helper function to add Q-test, I^2, and tau^2 estimate info

mlabfun <- function(text, res) {
  list(bquote(paste(.(text),
                    " (Q = ", .(formatC(res$QE, digits=2, format="f")),
                    ", df = ", .(res$k - res$p),
                    ", p ", .(metafor:::.pval(res$QEp, digits=2, showeq=TRUE, sep=" ")), "; ",
                    I^2, " = ", .(formatC(res$I2, digits=1, format="f")), "%, ",
                    tau^2, " = ", .(formatC(res$tau2, digits=2, format="f")), ")")))}


es_data <- SP_V_meta_data %>%
  filter((ni > 25)) ## Exclude small sample size
SP_V_es <- escalc(measure = "MC", 
                  m1i = m_mismatch, m2i = m_match, 
                  sd1i = sd_mismatch, sd2i = sd_match, 
                  ni = ni, ri = ri, 
                  slab = PSA_ID, data=es_data[c(3:19,20:22,27:28,31:32,33:34,35:36,37:38,40:41,42:44,1,2,23,24,25,26,29,30,39),]) ## sort by languages, Arabic 01 was excluded
SP_V_meta_all <-  rma.uni(yi, vi, data = SP_V_es, method = "FE", digits = 2)

#SP_V_meta_all$data[c("PSA_ID","ni","yi","vi")]

forest(SP_V_meta_all, ilab= cbind(ni,paste0(round(m_mismatch,2),"(",round(sd_mismatch,2),")"),paste0(round(m_match,2),"(",round(sd_match,2),")")), ilab.xpos = c(-250,-200,-150), ylim=c(-1,126-8), 
       rows=c((121-16-8):(121-8),  # English
              97:99-8,     # Germany
              90:91-8,     # Norway
              83:84-8,       # Serbian
              76:77-8,       # Simplified Chinese
              69:70-8,       # Slovak
              62:63-8,       # Spanish
              55:56-8,       # Traditional Chinese
              47:49-8,       # Turkish
              41-8,          # Arabic
              37-8,          # Brazilian Portuguese
              33-8,          # Greek
              29-8,          # Hebrew
              25-8,          # Hindi
              21-8,          # Hungarian
              17-8,           # Polish
              13-8,           # Portuguese
              9-8            # Thai
       ),        
       mlab = mlabfun("FE model for All Teams", SP_V_meta_all),
       xlab = "",psize=0.8)

### set font expansion factor (as in forest() above) and use a bold font
op <- par(cex=0.75, font=1)

### add additional column headings to the plot
text(c(-295,-250,-200,-150,300),126-8,c("Team","N","Mismatching","Matching" ,"Match Advantage [95% CI]"))
### switch to bold italic font
par(font=2)
### add text for the subgroups
text(-305, c(123,101,93,86,79,72,65,58,51,43,39,35,31,27,23,19,15,11)-8, pos=4, 
                              c("English",
                               "Germany",
                               "Norway",
                               "Serbian",
                               "Simplified Chinese",
                               "Slovak",
                               "Spanish",
                               "Traditional Chinese",
                               "Turkish",
                               "Arabic",
                               "Brazilian Portuguese",
                               "Greek",
                               "Hebrew",
                               "Hindi",
                               "Hungarian",
                               "Polish",
                               "Portuguese",
                               "Thai"))

### set par back to the original settings
par(op)

### fit random-effects model in the language groups
res.English <- rma.uni(yi, vi, subset = (Language=="English"), data = SP_V_es, method = "FE", digits = 2)
res.Germany <- rma.uni(yi, vi, subset = (Language=="German"), data = SP_V_es, method = "FE", digits = 2)
res.Norway <- rma.uni(yi, vi, subset = (Language=="Norwegian"), data = SP_V_es, method = "FE", digits = 2)
res.Serbian <- rma.uni(yi, vi, subset = (Language=="Serbian"), data = SP_V_es, method = "FE", digits = 2)
res.SC <- rma.uni(yi, vi, subset = (Language=="Simplified Chinese"), data = SP_V_es, method = "FE", digits = 2)
res.Slovak <- rma.uni(yi, vi, subset = (Language=="Slovak"), data = SP_V_es, method = "FE", digits = 2)
res.Spanish <- rma.uni(yi, vi, subset = (Language=="Spanish"), data = SP_V_es, method = "FE", digits = 2)
res.TC <- rma.uni(yi, vi, subset = (Language=="Traditional Chinese"), data = SP_V_es, method = "FE", digits = 2)
res.Turkish <- rma.uni(yi, vi, subset = (Language=="Turkish"), data = SP_V_es, method = "FE", digits = 2)

### add summary polygons for the three subgroups
addpoly(res.English, row=103-8, mlab=mlabfun("FE Model for English", res.English))
addpoly(res.Germany, row=95-8, mlab=mlabfun("FE Model for Germany", res.Germany))
addpoly(res.Norway, row=88-8, mlab=mlabfun("FE Model for Norway", res.Norway))
addpoly(res.Serbian, row=81-8, mlab=mlabfun("FE Model for Serbian", res.Serbian))
addpoly(res.SC, row=74-8, mlab=mlabfun("FE Model for Simplified Chinese", res.SC))
addpoly(res.Slovak, row=67-8, mlab=mlabfun("FE Model for Slovak", res.Slovak))
addpoly(res.Spanish, row=60-8, mlab=mlabfun("FE Model for Spanish", res.Spanish))
addpoly(res.TC, row=53-8, mlab=mlabfun("FE Model for Traditional Chinese", res.TC))
addpoly(res.Turkish, row=45-8, mlab=mlabfun("FE Model for Turkish", res.Turkish))
