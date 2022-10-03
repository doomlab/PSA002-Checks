# PSA002-Checks
 
- The original files uploaded into `includes` were from Feb-2022. They were then overwritten with the information downloaded from the OSF folder from end of Sep-2022. 
  - During this time, it appears most of the summarized data changed - albeit, it's not clear why or how given the large number of changes or why these files are necessary.
  - Two new scripts for the LME were added - across multiple meetings we have requested that all files be embedded in the markdown, not added on the side many layers deep, because it obscures what is going on in the analysis. It's unclear why these are used or what they are for (at the moment). 
  - The meta_plot_all file was finally fixed after repeated requests. It appears that the difference between the two is that the second version includes THREE labs that were originally excluded for (made up or unknown) reasons:

```
  > one <- c(3:19,20:22,27:28,31:32,33:34,35:36,37:38,40:41,42:44,1,2,23,24,25,26,29,30,39)
> two <- c(4:22,23:25,30:32,45:47,1:2,36:37,38:39,40:41,43:44,3,26,27,28,29,33,34,35,42)
> setdiff(one, two)
numeric(0)
> setdiff(two, one)
[1] 45 46 47
```

  - The meta_sources R script was added. We specifically said to run the meta-analysis as one big analysis as we do not see differences between the web/in person data with the LME. Therefore, it is unclear why this was added later. The note to *not* do this is still in the google comments. 
  