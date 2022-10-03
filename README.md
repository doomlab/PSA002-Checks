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

- Feb to May changes: [View differences](https://github.com/doomlab/PSA002-Checks/commit/f2527ca1252db881d83d1f73013191c073891bf8)
  - I had fixed participants who accidentally got the same participant ID assigned twice. This code was turned off, and those participants were excluded without discussion. 
  - The original outlier exclusion code was re-added - this is after discussion to use the new outlier exclusions and not implement this exclusion. It's implemented in strange places, but not necessarily across all the code. 
  - Participants who did not perform at least 70% correct were added back in, which does not match the pre-registered rule. 
  - The LME sections are difficult to judge, as they do not appear to match the suggested code, but I think this is just the way the markdowns appear. 
  - You can see these changes by examining Table 1 and notice that new participants were included in the May edition because of the inclusion of inappropriate participants. 
  - Other results show big changes - but this section included a big change to not run the LMEs separately. 
  
- May to August changes: [View differences](https://github.com/doomlab/PSA002-Checks/commit/020d9450aac0412536b4130657d61717e28d93fc)
  - In the method document, the birth year calculation is changed, unclear what is happening.
  - Additionally, the calculation of the number of labs is changed. 
  - A big section was moved from results to method. I did not check it line by line, and it likely has the same problems as described above (including ignoring the pre-registered 70% exclusion). 
  - At this point, the meta analysis code was moved to the separate file (and this document will run the newest version). This original excludes labs without discussion, but this was fixed in recent version.
  - However, the *way* the meta-analysis was conducted is now completely different. Each language is run as a separate meta-analysis and then these are combined - whereas before, all labs were treated as separate entries into the meta analysis without the language clustering. With the original exclusion of labs (described above), the team was very concerned because the effect size of the match advantage went from non-significant to somewhat large. After we figured out this lab was excluded, we insisted this change be reverted, which is what is knitted in this document (i.e., I didn't separate different versions of the meta_all_plot.R file).  
  - The LMEs appear to be updated to the newer ones, but several are also eval = F, so somewhat unclear.
  - A big change to notice is that more participants than before are included (this is hard to see because Table 1 has been split into two tables, but there are more if you add English for example, you can also see that lower accuracy participants are not excluded by examining the accuracy percents next to Arabic). 
  
- August to September changes:
  - New participant inclusions are added - team had no idea this was added, unclear if appropriate. 
  - New code to join and select data is added - no clue what this is doing. 
  - The meta analysis is again modified without consultation of the team - it is now split by data source, after we decided that this should not be done because sources were found to be roughly similar. 
  - The LME models were changed - not sure why. 
  - The number of participants has again changed - some up and some down - it appears the accuracy filter may have been re-added, but since they are changing in both directions, it's unclear. 
  - Please note I had to modify the method/results for this latest version quite and a bit, and I still couldn't get it to compile. 

