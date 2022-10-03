### a little helper function to add Q-test, I^2, and tau^2 estimate info

mlabfun <- function(text, res) {
  list(bquote(paste(.(text),
                    " (Q = ", .(formatC(res$QE, digits=2, format="f")),
                    ", df = ", .(res$k - res$p),
                    ", p ", .(metafor:::.pval(res$QEp, digits=2, showeq=TRUE, sep=" ")), "; ",
                    I^2, " = ", .(formatC(res$I2, digits=1, format="f")), "%, ",
                    tau^2, " = ", .(formatC(res$tau2, digits=2, format="f")), ")")))}


##es_data <- SP_V_meta_data ##%>%
##  filter((ni > 25)) ## Do not exclude small sample size because the preregistered plan had no clear notes.
SP_V_es <- escalc(measure = "MC", 
                  m1i = m_mismatch, m2i = m_match, 
                  sd1i = sd_mismatch, sd2i = sd_match, 
                  ni = ni, ri = ri, 
                  slab = PSA_ID, data=SP_V_meta_data)[c(4:22,23:25,30:32,45:47,1:2,36:37,38:39,40:41,43:44,3,26,27,28,29,33,34,35,42),]
SP_V_meta_all <-  rma.uni(yi, vi, data = SP_V_es, method = "FE", digits = 2)

## save the plot
png(file = "includes/files/meta_all.png",width=1200,height=1400)

forest(SP_V_meta_all, 
       ilab= cbind(ni,paste0(round(m_mismatch,2),"(",round(sd_mismatch,2),")"),paste0(round(m_match,2),"(",round(sd_match,2),")")), 
       ilab.xpos = c(-250,-200,-150), 
       ylim=c(-1,39+4*17+6), 
       rows=c(21:39+4*17,  # English
              18:20+4*16,     # Germany
              15:17+4*15,     # Norway
              12:14+4*14,     # Turkish
              10:11+4*13,     # Arabic
              8:9+4*12,     # Simplified Chinese
              6:7+4*11,     # Slovak
              4:5+4*10,     # Spanish
              2:3+4*9,     # Traditional Chinese
              1+4*8,          # Brazilian Portuguese
              1+4*7,          # Greek
              1+4*6,          # Hebrew
              1+4*5,          # Hindi
              1+4*4,          # Hungarian
              1+4*3,           # Polish
              1+4*2,           # Portuguese
              1+4,          # Serbian
              1            # Thai
       ),        
       mlab = mlabfun("FE model for All Teams", SP_V_meta_all),
       xlab = "",psize=0.7)

### set font expansion factor (as in forest() above) and use a bold font
op <- par(cex=0.8, font=1)

### add additional column headings to the plot
text(c(-345,-250,-200,-150,300),39+4*17+7,c("Team","N","Mismatching","Matching" ,"Match Advantage [95% CI]"))
### switch to bold italic font
par(font=2)
### add text for the subgroups
text(-275, c(39+4*17,  # English
             20+4*16,     # Germany
             17+4*15,     # Norway
             14+4*14,     # Turkish
             11+4*13,     # Arabic
             9+4*12,     # Simplified Chinese
             7+4*11,     # Slovak
             5+4*10,     # Spanish
             3+4*9,     # Traditional Chinese
             1+4*8,          # Brazilian Portuguese
             1+4*7,          # Greek
             1+4*6,          # Hebrew
             1+4*5,          # Hindi
             1+4*4,          # Hungarian
             1+4*3,           # Polish
             1+4*2,           # Portuguese
             1+4,          # Serbian
             1            # Thai
             )+2, pos=2, 
                              c("English",
                               "Germany",
                               "Norway",
                               "Turkish",
                               "Arabic",
                               "Simplified Chinese",
                               "Slovak",
                               "Spanish",
                               "Traditional Chinese",
                               "Brazilian Portuguese",
                               "Greek",
                               "Hebrew",
                               "Hindi",
                               "Hungarian",
                               "Polish",
                               "Portuguese",
                               "Serbian",
                               "Thai"))

### set par back to the original settings
par(op)

### fit fixed-effects model in the language groups
res.English <- rma.uni(yi, vi, subset = (Language=="English"), data = SP_V_es, method = "FE", digits = 2)
res.Germany <- rma.uni(yi, vi, subset = (Language=="German"), data = SP_V_es, method = "FE", digits = 2)
res.Norway <- rma.uni(yi, vi, subset = (Language=="Norwegian"), data = SP_V_es, method = "FE", digits = 2)
res.Turkish <- rma.uni(yi, vi, subset = (Language=="Turkish"), data = SP_V_es, method = "FE", digits = 2)
res.Arabic <- rma.uni(yi, vi, subset = (Language=="Arabic"), data = SP_V_es, method = "FE", digits = 2)
#res.Serbian <- rma.uni(yi, vi, subset = (Language=="Serbian"), data = SP_V_es, method = "FE", digits = 2)
res.SC <- rma.uni(yi, vi, subset = (Language=="Simplified Chinese"), data = SP_V_es, method = "FE", digits = 2)
res.Slovak <- rma.uni(yi, vi, subset = (Language=="Slovak"), data = SP_V_es, method = "FE", digits = 2)
res.Spanish <- rma.uni(yi, vi, subset = (Language=="Spanish"), data = SP_V_es, method = "FE", digits = 2)
res.TC <- rma.uni(yi, vi, subset = (Language=="Traditional Chinese"), data = SP_V_es, method = "FE", digits = 2)

### add summary polygons for the three subgroups
addpoly(res.English, row=21+4*17-1.5, mlab=mlabfun("FE Model for English", res.English))
addpoly(res.Germany, row=18+4*16-1.5, mlab=mlabfun("FE Model for Germany", res.Germany))
addpoly(res.Norway, row=15+4*15-1.5, mlab=mlabfun("FE Model for Norway", res.Norway))
addpoly(res.Turkish, row=12+4*14-1.5, mlab=mlabfun("FE Model for Turkish", res.Turkish))
addpoly(res.Arabic, row=10+4*13-1.5, mlab=mlabfun("FE Model for Arabic", res.Arabic))
addpoly(res.SC, row=8+4*12-1.5, mlab=mlabfun("FE Model for Simplified Chinese", res.SC))
addpoly(res.Slovak, row=6+4*11-1.5, mlab=mlabfun("FE Model for Slovak", res.Slovak))
addpoly(res.Spanish, row=4+4*10-1.5, mlab=mlabfun("FE Model for Spanish", res.Spanish))
addpoly(res.TC, row=2+4*9-1.5, mlab=mlabfun("FE Model for Traditional Chinese", res.TC))

dev.off()