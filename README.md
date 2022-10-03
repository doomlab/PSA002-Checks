# PSA002-Checks
 
- The original files uploaded into `includes` were from Feb-2022. They were then overwritten with the information downloaded from the OSF folder from end of Sep-2022. [View differences](https://github.com/doomlab/PSA002-Checks/commit/9e5dea6bb518d76b8778ea3199e7454eb1e623f3)
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
  
- The method and results contain the code that runs the main analyses and summarization (mostly results). These files were each knitted with the main focus to examine the changes in the results across time. The Feb versions of these files were created when EMB updated the analyses with the new outlier code and some tweaks to ensure the proper implementation of the participant exclusions/lme code. From this point forward, the results have changed multiple times with different N values, and this set of changes has not been explained clearly. 
- The introduction and discussion were "turned off" in the knitting of the document, as they are not the focus of this check. The other change was to change which files were being compared. 
- Please note, the `rawdata` is assumed to be original - as it would be difficult to track. These files were uploaded in January and do not appear to have been changed. 
- Each update to the methods/results was checked in the `check_changes` folder to show the differences in GitHub. 

- Feb to May changes:
  - I had fixed participants who accidentally got the same participant ID assigned twice. This code was turned off, and those participants were excluded without discussion. 
  - The original outlier exclusion code was re-added - this is after discussion to use the new outlier exclusions and not implement this exclusion. It's implemented in strange places, but not necessarily across all the code. 
  - Participants who did not perform at least 70% correct were added back in, which does not match the pre-registered rule. 
  - The LME sections are difficult to judge, as they do not appear to match the suggested code, but I think this is just the way the markdowns appear. 
  - You can see these changes by examining Table 1 and notice that new participants were included in the May edition because of the inclusion of inappropriate participants. 
  - Other results show big changes - but this section included a big change to not run the LMEs separately. 
  
- May to August changes:


