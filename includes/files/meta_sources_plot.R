### a little helper function to add Q-test, I^2, and tau^2 estimate info

mlabfun <- function(text, res) {
  list(bquote(paste(.(text),
                    " (Q = ", .(formatC(res$QE, digits=2, format="f")),
                    ", df = ", .(res$k - res$p),
                    ", p ", .(metafor:::.pval(res$QEp, digits=2, showeq=TRUE, sep=" ")), "; ",
                    I^2, " = ", .(formatC(res$I2, digits=1, format="f")), "%, ",
                    tau^2, " = ", .(formatC(res$tau2, digits=2, format="f")), ")")))}

SP_V_sources_es <- escalc(measure = "MC", 
                  m1i = m_mismatch, m2i = m_match, 
                  sd1i = sd_mismatch, sd2i = sd_match,
                  xi = Language,
                  ni = ni, ri = ri, 
                  slab = Language, data=SP_V_split_data)[c(1:3,5,11,14,16,21,23,4,6:10,12:13,15,17:20,22,24),]



SP_V_meta_sources <-  rma.uni(yi, vi, data = SP_V_sources_es, method = "FE", digits = 2)



forest(SP_V_meta_sources, header =c("Language         N","Match Advantage [95% CI]"), ilab= ni, ilab.xpos = -110, xlim=c(-150,100), ylim=c(-1,36), rows=c(12:4, 32:18), 
       mlab = mlabfun("FE model for two sources", SP_V_meta_sources),
       xlab = "")

op <- par(cex=0.75, font=2)
par(font=2)
text(-150, c(33,14), pos=4, c("On Lab site", "On Websites"))
par(op)

### fit random-effects model in the two sources
SP_V_meta_site <-  rma.uni(yi, vi, subset = (Source=="site"), data = SP_V_sources_es, slab = Language, method = "REML", digits = 2)

#SP_V_osweb_es <- escalc(measure = "MC", 
SP_V_meta_osweb <-  rma.uni(yi, vi, subset = (Source=="osweb"), data = SP_V_sources_es, slab = Language, method = "REML", digits = 2)

### add summary polygons for the two subgroups
addpoly(SP_V_meta_site, row=16.5, mlab=mlabfun("RE Model for On site data", SP_V_meta_site))
addpoly(SP_V_meta_osweb, row= 2, mlab=mlabfun("RE Model for on Internet data", SP_V_meta_osweb))

################################################

