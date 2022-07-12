# Get county level data

dat <- read_csv(file="pres-votes-wide2.csv")
saveRDS(dat,file="CountyVote2004_2020.Rds")




# Get Trump Tweet Data

Lots of press attention (and academic/commercial research)

https://www.nytimes.com/interactive/2019/11/02/us/politics/trump-twitter-presidency.html?smid=tw-nytimes&smtyp=cur

https://www.nytimes.com/2019/11/02/insider/trump-twitter-data.html

https://fivethirtyeight.com/features/the-worlds-favorite-donald-trump-tweets/


Link to the data we are using is [here](https://www.kaggle.com/austinreese/trump-tweets).      


library(readr)
trumptweets <- read_csv("~/GitHub/vandy_ds_1000_materials/Lectures/Topic10_Clustering/data/trumptweets.csv")
View(trumptweets)


library(tidyverse)
tweets <- trumptweets %>%
  select(id, content, date, retweets, favorites) %>%
  mutate(Tweeting.hour = format(date, format = "%H"),
         Tweeting.date = format(date, format = "%Y-%m-%d"),
         Tweeting.date = as.Date(Tweeting.date)) 

rm(trumptweets)

library(lubridate)
library(scales)

# Tweets per Day

tweets %>% 
  group_by(Tweeting.date) %>%
  count() %>%
  ggplot() +
  geom_point(aes(x=Tweeting.date,y=n),alpha=.4) +
  labs(x="Date",y="Number of Tweets",title="Tweeting by Trump")

# Avg Retweets per day
tweets %>% 
  group_by(Tweeting.date) %>%
  summarize(AvgRetweet = mean(retweets)) %>%
  ggplot() +
  geom_point(aes(x=Tweeting.date,y=AvgRetweet),alpha=.4) +
  labs(x="Date",y="Average Retweets",title="Tweeting by Trump")

library(plotly)

# Big object

gg <- tweets %>% 
  group_by(Tweeting.date) %>%
  summarize(AvgRetweet = mean(retweets),
            content=content) %>%  # Because we are passing a summary object we need to push content thru
  ggplot(aes(x=Tweeting.date,y=AvgRetweet,text=paste(content))) +
  geom_point(,alpha=.4) +
  labs(x="Date",y="Average Retweets",title="Tweeting by Trump")

#ggplotly(gg,tooltip = "text")

# Tweets per hour

tweets %>% 
  group_by(Tweeting.hour) %>%
  count() %>%
  ggplot() +
  geom_point(aes(x=Tweeting.hour,y=n),alpha=.4) +
  labs(x="Hour",y="Number of Tweets",title="Tweeting by Trump: Hour of Day (UTC)")

# Tweets per hour, Pre-post
tweets %>% 
  mutate(PostPresident = date > "2016-11-03") %>%
  group_by(PostPresident,Tweeting.hour) %>%
  count() %>%
  ggplot() +
  geom_point(aes(x=Tweeting.hour,y=n,color=PostPresident),alpha=.4) +
  labs(x="Hour",y="Number of Tweets",title="Tweeting by Trump: Hour of Day (UTC)",color="Is President?")


https://stackoverflow.com/questions/31348453/how-do-i-clean-twitter-data-in-r

# What is he tweeting about

library(qdapRegex)
library(tm)

# remove hashtages first, then url and then punctuation

tweets$content <- rm_twitter_url(tweets$content)
tweets$content <- rm_url(tweets$content)
tweet_words$document <- tweet_words$id


library(tidyverse)    

clean_tweets <- function(x) {
  x %>%
    # Remove URLs
#    str_remove_all(" ?(f|ht)(tp)(s?)(://)(.*)[.|/](.*)") %>%
    # Remove mentions e.g. "@my_account"
    str_remove_all("@[[:alnum:]_]{4,}") %>%
    # Remove mentions e.g. "@ my_account"
    str_remove_all("@ [[:alnum:]_]{4,}") %>%
    # Remove hashtags
    str_remove_all("#[[:alnum:]_]+") %>%
    # Remove hashtags
    str_remove_all("# [[:alnum:]_]+") %>%
    # Remove twitter references
    str_remove_all("twitter[[:alnum:]_]+") %>%
    # Remove twitter pics references
    str_remove_all("pictwitter[[:alnum:]_]+") %>%
    # Replace "&" character reference with "and"
    str_replace_all("&amp;", "and") %>%
    # Remove puntucation, using a standard character class
    str_remove_all("[[:punct:]]") %>%
    # Remove "RT: " from beginning of retweets
    str_remove_all("^RT:? ") %>%
    # Replace any newline characters with a space
    str_replace_all("\\\n", " ") %>%
    # Make everything lowercase
    str_to_lower() %>%
    # Remove any trailing whitespace around the text
    str_trim("both")
}

# may need to revisit above if passing thru links
tweets$content <- clean_tweets(tweets$content)

library(tidytext)
reg <- "([^A-Za-z\\d#@']|'(?![A-Za-z\\d#@]))"

library(SnowballC)

tweet_words <- tweets %>%
  filter(!str_detect(content, '^"')) %>%
  unnest_tokens(word, content, token = "regex", pattern = reg)  %>%
  filter(!word %in% stop_words$word,str_detect(word, "[a-z]")) %>%
  mutate(word = str_replace_all(word, "\\d+", "")) %>%  # drop numbers
  mutate(word = str_replace_all(word, "twitter[A-Za-z\\d]+|&amp;", "")) %>%
  mutate(word = str_replace_all(word, "pictwitter[A-Za-z\\d]+|&amp;", "")) %>%
  mutate(word = str_replace_all(word, "pic[A-Za-z\\d]+|&amp;", "")) %>%
  mutate(word = str_replace_all(word, "pic", "")) %>%
  mutate(word = str_replace_all(word, "againpic[A-Za-z\\d]+|&amp;", "")) %>%
  mutate(word = wordStem(word)) %>%
  mutate(document = id) %>%
  select(-id) %>%
  filter(word != "")   # drop any empty strings

#rm(tweets)

#tweet_words <- tweet_words %>% 
#  unnest_tokens(word, text, token = "word_stems")

data("stop_words", package = "tidytext")
tweet_words <- anti_join(tweet_words, stop_words, by = "word")

tweet_words %>% 
  arrange(word)

tweet_words %>% 
  count(word) %>%
  arrange(-n)

election.date <- as.Date("2016-11-03", format = "%Y-%m-%d")

tweet_words <- tweet_words %>%
  mutate(PostPresident = Tweeting.date < "2016-11-03")

tweet_words %>%
    filter(PostPresident == FALSE) %>%
    select(word) %>%
    count(word) %>%
    top_n(10, wt= n) %>%
    arrange(-n) 

tweet_words %>%
  filter(PostPresident == TRUE) %>%
  select(word) %>%
  count(word) %>%
  top_n(10, wt= n) %>%
  arrange(-n) 


tweet_words %>%
  group_by(PostPresident) %>%
  select(word) %>%
  count(word) %>%
  top_n(10, wt= n) %>%
  arrange(-n)   %>%
  summarise(top_words = str_c(word, collapse = ", ")) %>%
  knitr::kable()

# Word Cloud
library(wordcloud)
set.seed(42)

tweet_words %>%
  filter(PostPresident == FALSE) %>%
  select(word) %>%
  count(word) %>% 
  { wordcloud(.$word, .$n, max.words = 100) }

tweet_words %>%
  filter(PostPresident == TRUE) %>%
  select(word) %>%
  count(word) %>% 
  { wordcloud(.$word, .$n, max.words = 100) }

prepost_ratios <- tweet_words %>%
  count(word, PostPresident) %>%
  filter(sum(n) >= 5) %>%
  spread(PostPresident, n, fill = 0) %>%
  ungroup() %>%
  mutate_each(funs((. + 1) / sum(. + 1)), -word) %>%
  mutate(ratio = `TRUE` / `FALSE`) %>%
  mutate(logratio = log(ratio)) %>%
  arrange(desc(ratio))

# Now plot

prepost_ratios %>%
  group_by(logratio > 0) %>%
  top_n(15, abs(logratio)) %>%
  ungroup() %>%
  mutate(word = reorder(word, logratio)) %>%
  ggplot(aes(word, logratio, fill = logratio < 0)) +
  geom_bar(stat = "identity") +
  coord_flip() +
  ylab("Post-President/Pre-President log ratio") +
  scale_fill_manual(name = "", labels = c("President", "Pre-President"),
                    values = c("red", "lightblue"))



# Sentiment Analysis

To analyze sentiment we do "supervised" learning which is simply count the number of times a word is used.

[NRC Word-Emotion Association](http://saifmohammad.com/WebPages/NRC-Emotion-Lexicon.htm) lexicon created by, and published in This dataset was published in Saif M. Mohammad and Peter Turney. (2013), ``Crowdsourcing a Word-Emotion Association Lexicon.'' Computational Intelligence, 29(3): 436-465. This is available from the tidytext package, which associates words with 10 sentiments: **positive**, **negative**, **anger**, **anticipation**, **disgust**, **fear**, **joy**, **sadness**, **surprise**, and **trust**.

library(tidytext)
library(textdata)
nrc <- get_sentiments("nrc")

nrc


PrePost <- tweet_words %>%
  group_by(PostPresident) %>%
  mutate(total_words = n(), NumTweet = length(unique(document))) %>%
  ungroup() %>%
  distinct(PostPresident, NumTweet, total_words)


tweet_sentiment <- tweet_words %>%
  inner_join(nrc, by = "word") 

tweet_sentiment %>%
  group_by(PostPresident, sentiment) %>%
  count(sentiment, document) %>%
  summarize(TotalWords = sum(n),
            TotalTweets = n()) %>%
  filter(PostPresident==TRUE) %>%
  mutate(PctTotalWords = TotalWords/PrePost$total_words[2],
         PctTotalTweets = TotalTweets/PrePost$NumTweet[2])

tweet_sentiment %>%
  group_by(PostPresident, sentiment) %>%
  count(sentiment, document) %>%
  summarize(TotalWords = sum(n),
            TotalTweets = n()) %>%
  filter(PostPresident==FALSE) %>%
  mutate(PctTotalWords = TotalWords/PrePost$total_words[1],
         PctTotalTweets = TotalTweets/PrePost$NumTweet[1])




tweetstuff <- tweet_words %>%
  group_by(PostPresident) %>%
  mutate(total_words = n()) %>%
  ungroup() %>%
  distinct(document, PostPresident, total_words)


tweet_words %>%
  inner_join(nrc, by = "word") %>%
  count(sentiment, document) %>%
  ungroup() %>%
  complete(sentiment, document, fill = list(n = 0)) %>%
  inner_join(sources) %>%
  group_by(source, sentiment, total_words) %>%
  summarize(words = sum(n)) %>%
  ungroup()
head(by_source_sentiment)










%>%
  ungroup() %>%
  complete(sentiment, id, fill = list(n = 0)) %>%
  inner_join(sources) %>%
  group_by(source, sentiment, total_words) %>%
  summarize(words = sum(n)) %>%
  ungroup()
head(by_source_sentiment)



# Pre-President
tokens <- tweet_words %>%
  mutate(PostPresident = Tweeting.date < "2016-11-03")  %>%
  filter(PostPresident == TRUE)

# 2016 
tokens <- tweet_words %>%
  filter(Tweeting.date >= "2016-1-1" & Tweeting.date <= "2016-12-31") %>%
  select(document, word)

dtm <- tokens %>%
  count(document, word)

rm(tokens)

dtm.tfidf <- bind_tf_idf(dtm, word, document, n)
rm(dtm)

castdtm <- cast_dtm(dtm.tfidf, document, word, tf)
rm(dtm.tfidf)

set.seed(42)
km_out.2016 <- kmeans(castdtm, 
                 centers = 5, 
                 nstart = 25)

tidy(km_out.2016)

table(km_out.2016$cluster)
words_kmean <- tibble(word = colnames(castdtm))
words_kmean <- bind_cols(words_kmean, as_tibble(t(km_out.2016$centers)))  # Binding the transpose of the matrix of centers

top_words_cluster <-
  gather(words_kmean, cluster, value, -word) %>%
  group_by(cluster) %>%
  top_n(10, 
        wt=value) %>%
  arrange(cluster,-value)

gather(words_kmean, cluster, value, -word) %>%
  group_by(cluster) %>%
  top_n(10, value) %>%
  summarise(top_words = str_c(word, collapse = ", ")) %>%
  knitr::kable()

# 2019
tokens <- tweet_words %>%
  filter(Tweeting.date >= "2019-1-1" & Tweeting.date <= "2019-12-31") %>%
  select(document, word)

tokens2 <-  tokens %>%
  mutate(word = str_replace_all(word, "pic", "")) %>%
  filter(word != "") 

dtm <- tokens %>%
  count(document, word)
rm(tokens)

dtm.tfidf <- bind_tf_idf(dtm, word, document, n)
rm(dtm)

castdtm <- cast_dtm(dtm.tfidf, document, word, tf)

set.seed(42)
km_out.2019 <- kmeans(castdtm, 
                 centers = 4, 
                 nstart = 25)

tidy(km_out.2019)

table(km_out.2019$cluster)
words_kmean <- tibble(word = colnames(castdtm))
words_kmean <- bind_cols(words_kmean, as_tibble(t(km_out.2019$centers)))  # Binding the transpose of the matrix of centers

top_words_cluster <-
  gather(words_kmean, cluster, value, -word) %>%
  group_by(cluster) %>%
  top_n(5,wt=value) %>%
  arrange(-value)

top_words_cluster

gather(words_kmean, cluster, value, -word) %>%
  group_by(cluster) %>%
  top_n(5, value) %>%
  summarise(top_words = str_c(word, collapse = ", ")) %>%
  knitr::kable()





  