# DSCI1000
Course Material for DSCI1000: How Data Shape our World

This contains the lecture notes and slides that were created for DSCI1000: How Data Shape our World - a course I co-taught in Fall and Spring 2021 at Vanderbilt University with Will Doyle (_w.doyle@vanderbilt.edu_).  

The target audience is someone who is interested in Data Science, but who has no prior experience.  The class was designed to be application-forward -- demonstrating what you can do with the tools of data science in the hopes of motivating and encouraging students to go deeper and further. As an introductory class with no prerequisites, the statistical and programming fundamentals behind what we did is only briefly mentioned; the goal is to provide a sense of what can be done with data science rather than to provide a comprehensive foundation on a smaller set of topics.  The contents of this repository represent a work-in-progress and revisions and edits are likely frequent.

The course is motivated around several topics.

0) Introduction to R and Data Wrangling
1) Univariate Description and Visualization
2) Conditional Variation using Conditional Means
3) Conditional Variation using linear regression
4) Clustering
5) Classification using binary outcomes and logistic regressions  

Reactions and comments are welcome and apologies in advance for typos, errors, and inefficiencies, but you get what you pay for ;)

I have not yet added appropriate citations to existing work in the relevant areas, nor have I motivated each section sufficiently with a motivating puzzle.  

### Syllabus

### Lecture Notes, Data and Code for Each Topic 

*To access lecture notes and/or data sets use ctrl+click on a mac or right click on a pc, then click "save link as" and save to the class directory on your computer.*

#### 1\. The Wonderful World of Data Science

Lecture Slides:  [PDF](https://github.com/joshclinton/DSCI1000/blob/main/Lectures/Topic1_IntroMotivation/Topic1_Motivation.pdf) [.Rmd](https://github.com/joshclinton/DSCI1000/blob/main/Lectures/Topic1_IntroMotivation/Topic1_Motivation.Rmd)

Fall 2021 Class Survey Results: [HTML](https://github.com/joshclinton/DSCI1000/blob/main/Lectures/Topic1_IntroMotivation/survey_results2021.html)

Spring 2022 Class Survey Results: [HTML](https://github.com/joshclinton/DSCI1000/blob/main/Lectures/Topic1_IntroMotivation/survey_results2022.html)

#### 2\. Hello, World!

Lecture Notes Part 1: [PDF](https://github.com/joshclinton/DSCI1000/blob/main/Lectures/Topic2_HelloWorld/Topic2_HelloWorld_part1.pdf) [.Rmd](https://github.com/joshclinton/DSCI1000/blob/main/Lectures/Topic2_HelloWorld/Topic2_HelloWorld.Rmd)

Dataset: [College Debt Data](https://github.com/joshclinton/DSCI1000/blob/main/Lectures/Topic2_HelloWorld/sc_debt.Rds)

Lecture Notes Part 2: [PDF](https://github.com/joshclinton/DSCI1000/blob/main/Lectures/Topic2_HelloWorld/Topic2_HelloWorld_part2.pdf) [.Rmd](https://github.com/joshclinton/DSCI1000/blob/main/Lectures/Topic2_HelloWorld/Topic2_HelloWorld_part2.Rmd)

#### 3\.  Data Wrangling

Lecture Notes Part 1: [PDF](https://github.com/joshclinton/DSCI1000/blob/main/Lectures/Topic3_DataWrangling/Topic3_DataWrangling_part1.pdf) [.Rmd](https://github.com/joshclinton/DSCI1000/blob/main/Lectures/Topic3_DataWrangling/Topic3_DataWrangling_part1.Rmd)

Lecture Notes Part 2: [PDF](https://github.com/joshclinton/DSCI1000/blob/main/Lectures/Topic3_DataWrangling/Topic3_DataWrangling_part2.pdf) [.Rmd](https://github.com/joshclinton/DSCI1000/blob/main/Lectures/Topic3_DataWrangling/Topic3_DataWrangling_part2.Rmd)

Dataset: [MI2020_ExitPoll.Rdata](https://github.com/joshclinton/DSCI1000/blob/main/Lectures/Topic3_DataWrangling/MI2020_ExitPoll.Rdata)

Dataset: [MI2020_ExitPoll_small.rds](https://github.com/joshclinton/DSCI1000/blob/main/Lectures/Topic3_DataWrangling/MI2020_ExitPoll_small.rds)

*Readings/Resources*

["The Gender gap was expected to be historic."](https://www.washingtonpost.com/dc-md-va/2020/11/06/election-2020-gender-gap-women/)

["Exit polls, election surveys and more"](https://www.pewresearch.org/fact-tank/2018/11/01/exit-polls-election-surveys-and-more-a-guide-for-the-2018-midterms/)

[Wickham \& Grolemund, Chapter 3](https://learning-oreilly-com.proxy.library.vanderbilt.edu/home/)

#### 4\. Univariate Data Analysis

Lecture Notes Part 1:  [PDF](https://github.com/joshclinton/DSCI1000/blob/main/Lectures/Topic4_UnivariateDescription/Topic4_Univariate_part1.pdf) [.Rmd](https://github.com/joshclinton/DSCI1000/blob/main/Lectures/Topic4_UnivariateDescription/Topic4_Univariate_part1.Rmd) 

Dataset: [nba_players.Rds](https://github.com/joshclinton/DSCI1000/blob/main/Lectures/Lecture4Univariate/nba_players_2018.Rds)

Lecture Notes Part 2: [PDF](https://github.com/joshclinton/DSCI1000/blob/main/Lectures/Topic4_UnivariateDescription/Topic4_UnivariateUncertainty_part2.pdf) [.Rmd](https://github.com/joshclinton/DSCI1000/blob/main/Lectures/Topic4_UnivariateDescription/Topic4_UnivariateUncertainty_part2.Rmd)

Dataset: [game_summary.Rds](https://github.com/joshclinton/DSCI1000/blob/main/Lectures/Lecture4Univariate/game_summary.Rds) 

#### 5\. Univariate Data Visualization

Lecture Slides Part 1: [PDF](https://github.com/joshclinton/DSCI1000/blob/main/Lectures/Topic5_UnivariateVisualization/Topic5_DataVizIntro_part1.pdf) [.Rmd](https://github.com/joshclinton/DSCI1000/blob/main/Lectures/Topic5_UnivariateVisualization/Topic5_DataVizIntro_part1.Rmd) 

Lecture Notes Part 2: [PDF](https://github.com/joshclinton/DSCI1000/blob/main/Lectures/Topic5_UnivariateVisualization/Topic5_VisualizationUnivariateGraphics_part2.pdf) [.Rmd](https://github.com/joshclinton/DSCI1000/blob/main/Lectures/Topic5_UnivariateVisualization/Topic5_VisualizationUnivariateGraphics_part2.Rmd)

Dataset: [Pres2020.PV.Rdata](https://github.com/joshclinton/DSCI1000/blob/main/Lectures/Topic5_UnivariateVisualization/data/Pres2020.PV.Rdata) 

If interested: [Challenger: The Final Flight](https://www.netflix.com/title/81012137)

#### 6\. Conditional Relationships \& Visualization

Lecture Notes Part 1: [PDF](https://github.com/joshclinton/DSCI1000/blob/main/Lectures/Topic6_ConditionalVariation/Topic6_ConditionalVariation_Graphing.pdf) [.Rmd](https://github.com/joshclinton/DSCI1000/blob/main/Lectures/Topic6_ConditionalVariation/Topic6_ConditionalVariation_Graphing.Rmd)

Dataset: [MI2020_ExitPoll_small.Rds](https://github.com/joshclinton/DSCI1000/blob/main/Lectures/Topic6_ConditionalVariation/MI2020_ExitPoll_small.Rds) 

Dataset: [Pres2020.PV.Rds](https://github.com/joshclinton/DSCI1000/blob/main/Lectures/Topic6_ConditionalVariation/Pres2020.PV.Rds) 

Lecture Notes Part 2: [HTML](https://github.com/joshclinton/DSCI1000/blob/main/Lectures/Topic6_ConditionalVariation/Topic6_ConditionalVariation_Prediction.html) [.Rmd](https://github.com/joshclinton/DSCI1000/blob/main/Lectures/Topic6_ConditionalVariation/Topic6_ConditionalVariation_Prediction.Rmd)

Dataset: [Pres2020.StatePolls.Rds](https://github.com/joshclinton/DSCI1000/blob/main/Lectures/Topic6_ConditionalVariation/Pres2020.StatePolls.Rds) 

#### 7\. Mapping Data In R (One way)

Lecture Notes: [PDF](https://github.com/joshclinton/DSCI1000/blob/main/Lectures/Topic7_Mapping/Topic7_MappingDataInR.pdf) [.Rmd](https://github.com/joshclinton/DSCI1000/blob/main/Lectures/Topic7_Mapping/Topic7_MappingDataInR.Rmd)

Dataset: [PresStatePolls04to20.Rds](https://github.com/joshclinton/DSCI1000/blob/main/Lectures/Topic7_Mapping/PresStatePolls04to20.Rds) 

Dataset: [countycovid.Rds](https://github.com/joshclinton/DSCI1000/blob/main/Lectures/Topic7_Mapping/countycovid.Rds) 

Dataset: [COVID.Death.Voting.Rds](https://github.com/joshclinton/DSCI1000/blob/main/Lectures/Topic7_Mapping/COVID.Death.Voting.Rds) 

#### 8\. Interactive Shiny

Lecture Notes: [Zipped HTML](https://github.com/joshclinton/DSCI1000/blob/main/Lectures/Topic8_Interactive/Topic8_interactive.html.zip) [.Rmd](https://github.com/joshclinton/DSCI1000/blob/main/Lectures/Topic8_Interactive/Topic8_interactive.Rmd)

Application: [app.R](https://github.com/joshclinton/DSCI1000/blob/main/Lectures/Topic8_Interactive/app.R)

Dataset: [sp500.rds](https://github.com/joshclinton/DSCI1000/blob/main/Lectures/Topic8_Interactive/sp500.rds) 

#### 9\. Regression

Regression notes, part 1: [.Rmd](https://github.com/joshclinton/DSCI1000/blob/main/Lectures/Topic9_Regression/LectureRegressionPart1.Rmd) [PDF](https://github.com/joshclinton/DSCI1000/blob/main/Lectures/Topic9_Regression/LectureRegressionPart1.pdf)

Regression notes, part 2: [.Rmd](https://github.com/joshclinton/DSCI1000/blob/main/Lectures/Topic9_Regression/LectureRegressionPart2.Rmd) [PDF](https://github.com/joshclinton/DSCI1000/blob/main/Lectures/Topic9_Regression/LectureRegressionPart2.pdf)

Regression notes, part 3: [.Rmd](https://github.com/joshclinton/DSCI1000/blob/main/Lectures/Topic9_Regression/LectureRegressionPart3.Rmd) [PDF](https://github.com/joshclinton/DSCI1000/blob/main/Lectures/Topic9_Regression/LectureRegressionPart3.pdf)

["Simpler" version of workflows](https://github.com/joshclinton/DSCI1000/blob/main/Lectures/Topic9_Regression/workflows_examples.Rmd)

Movie Data: [mv.Rds](https://github.com/joshclinton/DSCI1000/blob/main/Lectures/Topic9_Regression/mv.Rds)

[In case you're interested, code for accessing movie data, including the IMDB data](https://github.com/joshclinton/DSCI1000/blob/main/Lectures/Topic9_Regression/access_movie_data.R)

#### 10\.  Clustering, Text, Twitter, and Sentiment...

Clustering notes, part 1: [.Rmd](https://github.com/joshclinton/DSCI1000/blob/main/Lectures/Topic10_Clustering/Topic10_ClusteringKmeans.Rmd) [PDF](https://github.com/joshclinton/DSCI1000/blob/main/Lectures/Topic10_Clustering/Topic10_ClusteringKmeans.pdf)

Clustering notes, part 2: [.Rmd](https://github.com/joshclinton/DSCI1000/blob/main/Lectures/Topic10_Clustering/Topic10_ClusteringKmeansText.Rmd) [PDF](https://github.com/joshclinton/DSCI1000/blob/main/Lectures/Topic10_Clustering/Topic10_ClusteringKmeansText.pdf)

Predicting with Text, part 3: [.Rmd](https://github.com/joshclinton/DSCI1000/blob/main/Lectures/Topic10_Clustering/Topic10_ClusteringTextPredict.Rmd) [PDF](https://github.com/joshclinton/DSCI1000/blob/main/Lectures/Topic10_Clustering/Topic10_ClusteringTextPredict.pdf)

Sentiment Analysis with Twttter Text, part 4:  [.Rmd](https://github.com/joshclinton/DSCI1000/blob/main/Lectures/Topic10_Clustering/Topic10_TrumpTweetSentiment.Rmd) [PDF](https://github.com/joshclinton/DSCI1000/blob/main/Lectures/Topic10_Clustering/Topic10_TrumpTweetSentiment.pdf)

Florida County Data - for part 1: [FloridaCountyData.Rds](https://github.com/joshclinton/DSCI1000/blob/main/Lectures/Topic10_Clustering/FloridaCountyData.Rds)

US County Vote Data - for part 1: [CountyVote2004_2020.Rds](https://github.com/joshclinton/DSCI1000/blob/main/Lectures/Topic10_Clustering/CountyVote2004_2020.Rds)

Federalist Papers Data - for part 2: [FederalistPaperCorpusTidy.Rds](https://github.com/joshclinton/DSCI1000/blob/main/Lectures/Topic10_Clustering/FederalistPaperCorpusTidy.Rds)

Federalist Papers Data - for part 3: [FederalistPaperDocumentTermMatrix.Rds](https://github.com/joshclinton/DSCI1000/blob/main/Lectures/Topic10_Clustering/FederalistPaperDocumentTermMatrix.Rds)

Tweet-Level Data on Trump Tweets - for part 4: [Trumptweets.Rds](https://github.com/joshclinton/DSCI1000/blob/main/Lectures/Topic10_Clustering/Trumptweets.Rds)

Word-Level Data on Trump Tweets - for part 4: [Trump_tweet_words.Rds](https://github.com/joshclinton/DSCI1000/blob/main/Lectures/Topic10_Clustering/Trump_tweet_words.Rds)


#### 11\. Classification: Or, Become an Admissions Dean for Fun and Profit!

Lecture 1: The Admissions "Funnel" and the Problem of Classification: [Rmd](https://github.com/joshclinton/DSCI1000/blob/main/Lectures/Topic11_Classification/college_admissions_1.Rmd) [PDF](https://github.com/joshclinton/DSCI1000/blob/main/Lectures/Topic11_Classification/college_admissions_1.pdf)

Lecture 2: Logistic Regression and the AUC: [Rmd](https://github.com/joshclinton/DSCI1000/blob/main/Lectures/Topic11_Classification/college_admissions_2.Rmd) [PDF](https://github.com/joshclinton/DSCI1000/blob/main/Lectures/Topic11_Classification/college_admissions_2.pdf)

Lecture 3: Cross Validation and Feature Selection for Classifiers: [Rmd](https://github.com/joshclinton/DSCI1000/blob/main/Lectures/Topic11_Classification/college_admissions_3.Rmd) [PDF](https://github.com/joshclinton/DSCI1000/blob/main/Lectures/Topic11_Classification/college_admissions_3.pdf)

Lecture 4: Changing Policy: [Rmd](https://github.com/joshclinton/DSCI1000/blob/main/Lectures/Topic11_Classification/college_admissions_4.Rmd) [PDF](https://github.com/joshclinton/DSCI1000/blob/main/Lectures/Topic11_Classification/college_admissions_4.pdf)

[admit_data.rds](https://github.com/joshclinton/DSCI1000/blob/main/Lectures/Topic11Classification/admit_data.rds)

### Helpful Resources

[Rstudio Cheat Sheet: Data Wrangling](https://www.rstudio.com/wp-content/uploads/2015/02/data-wrangling-cheatsheet.pdf)

[Rstudio Cheat Sheet: ggplot2 ](https://github.com/rstudio/cheatsheets/raw/master/data-visualization.pdf)

[R-graphics Cookbook](http://www.cookbook-r.com/Graphs/)

[... And the full list of Rstudio cheat sheets](https://www.rstudio.com/resources/cheatsheets/)

[Tidymodels Resources](https://www.tidymodels.org/learn/)

