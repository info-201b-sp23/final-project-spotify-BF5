# Spotify Track Popularity

![Spotify logo on a phone which earbuds are connected to](https://helios-i.mashable.com/imagery/articles/050bXhdmNaL9bDGAINptcrL/hero-image.fill.size_1248x702.v1617973265.jpg)

### Authors

Kayla Doan

Michael Schwamborn

Julian Bermudez-Ortega

Nathanael Hartanto

### Date
Spring 2023

## Abstract

Our main question is, what makes a popular song popular on Spotify? Out of the thousands, if not millions, of songs that we listen to on Spotify, only a handful of them are popular. With Spotify’s deep tracking of song data and recent trends accelerated by Tiktok and social media, we want to see if there is a reason for a song being popular or not.

## Keywords

Spotify, music streaming, music genre, popularity, music artists

## Introduction  
 
Spotify has a massive catalog of music with every genre imaginable and a massive amount of users. Underground and famous artists alike have their music on the platform. But what songs are being listened to the most? Why are they the most popular? Is it more than the artist being a celebrity? Our analysis of this dataset can answer the technical questions of why a song is popular. Not every song a celebrity produces is on the top of the billboards. Even underground artists have a chance of receiving popularity with a hit track. We can draw connections between the popularity of a song and the various components in a song. The dataset we will be using has several columns of data containing the tempo, time signature, mode, etc. Danceability and genre are also included in this. Understanding why certain songs are more popular could lead to the promotion of  lesser known songs which fit the criteria of being a popular song. Or to show users songs that do not fit the criteria if they want to listen to a greater variety of music. Music is a heavily subjective topic, not everyone has the same music taste. By analyzing the data, we can find similarities in the most popular songs. 
 We will be finding:
- What genre tends to be the most popular among popular songs?
- What technical aspects are similar between popular songs?
- Does danceability lend a hand in making a song popular?
- As well as other interesting findings in our data.


## Related Work  

 Our topic looks at Spotify's extensive music catalog and user base present an opportunity to analyze and understand the factors behind song popularity beyond an artist's fame. By examining technical aspects like tempo and genre, as well as considering user preferences, our analysis aims to uncover why certain songs gain popularity and how it relates to broader trends in music consumption on Spotify. Our research will explore various aspects of music popularity prediction and user behavior analysis. The other papers examine the effectiveness of using musical complexity and early-stage popularity to predict music popularity patterns. It highlights the importance of combining different features for accurate predictions. While also identifying content acquisition, revenue generation, and competition as key challenges for Spotify, proposing solutions such as establishing a record company, enhancing algorithms, and diversifying the business model. Diving into user behavior on Spotify, investigating system dynamics, individual device usage patterns, and correlations between session lengths and downtime. It uncovers valuable insights regarding preferred listening times and device-switching behavior among Spotify users. All the related research papers address topics such as predicting music popularity, addressing challenges in the music streaming industry, and analyzing user behavior within Spotify, which can help us improve Spotify, the music industry, and the consumers of the industry. 

 * Li, Jingting. (2022). Analysis of The Trend of Spotify. BCP Business & Management. 34. 919-926. 10.54691/bcpbm.v34i.3112. 
 * B. Zhang et al., "Understanding user behavior in Spotify," 2013 Proceedings IEEE INFOCOM, Turin, Italy, 2013, pp. 220-224, doi: 10.1109/INFCOM.2013.6566767.
 * Junghyuk Lee and Jong-Seok Lee. 2015. Predicting Music Popularity Patterns based on Musical Complexity and Early Stage Popularity. In Proceedings of the Third Edition Workshop on Speech, Language &amp; Audio in Multimedia (SLAM '15). Association for Computing Machinery, New York, NY, USA, 3–6. https://doi.org/10.1145/2802558.2814645


## The Dataset

**Where did you find the data?**

 * The data was found on [Kaggle](https://www.kaggle.com/datasets/maharshipandya/-spotify-tracks-dataset)

**Who collected the data?**

  * The data was collected by Maharshi Pandya

**How was the data collected or generated?**

   * The data was collected and cleaned using Spotify's Web API and Python.

**Why was the data collected?**  

  * The data was collected to be used in any situation. The author of the dataset gave examples such as building a recommendation system, classification purposes, and more!

**How many observations (rows) are in your data?** 

  * There are over 114 thousand observations.

**How many features (columns) are in the data?**  

  * There are 21 columns.

**What, if any, ethical questions or questions of power do you need to consider when working with this data?**

  * We don’t see any ethical questions or questions of power when working with this data 

**What are possible limitations or problems with this data?**
  * The possible limitations of the dataset include the songs in the dataset, the timeframe that these songs were collected, and the genre classifications. The dataset was not clear with where the songs came from. It is assumed that the songs are  various collections of songs from Spotify, but there may be many songs missing from the dataset and many genres that are not included in the dataset. The same goes for when the songs were collected. Although Kaggle states that the dataset was uploaded 6 months ago, we don’t know when the collection period was. Furthermore, there have been a number of new songs uploaded to Spotify since 6 months ago. This may seem minuscule in comparison to the tens of thousands of songs already on the dataset, but still important to note.  Finally, we noticed how although there are 125 different genres included in the dataset, we know that Spotify tends to overcomplicate the genre characterization for songs which can lead to ambiguity and misunderstanding of the genre labels. In addition, a genre for a specific song may be subjective to the listener and hard to characterize. Although we as a team believe that it is still possible to comb through the data and come to reasonable conclusions to answer the questions, these problems and limitations with the data are still important to note and keep in mind while we create our analysis and reports.


## Implications

Policymakers may engage in discussions around the algorithms and data privacy aspects of music streaming platforms, ensuring transparency and ethical use of user data. Policymakers may also work towards creating regulations that protect user rights and ensure a level playing field for all artists in the digital music landscape. After all, the dominance of popular songs and artists may happen due to capitalistic views, ensuring fair opportunities for emerging or independent artists to gain visibility on platforms like Spotify is important and promotes diversity. Technologists can use their catalog and user data on Spotify to develop algorithms and tools for analyzing songs, then create recommendation systems from identifying trends like, tempo, energy, danceability and other patterns in user preferences to determine what makes a song popular and what certain user’s like best. Designers can utilize the insights gained from analyzing song popularity to create more engaging and personalized user interfaces. Designing intuitive interfaces that showcase popular songs, trending artists, or curated playlists based on user preferences.


## Limitations & Challenges

During our research on music popularity on Spotify, we may face several challenges and limitations. One significant limitation is the reliability and completeness of the dataset. The data may not contain every song and genre present on Spotify, and the collection period may not reflect the current trends accurately. Additionally, the labeling of genres on Spotify can be subjective and complicated, which can lead to ambiguity in the dataset. Another challenge we may face is understanding user behavior and preferences. Users may have different listening patterns, which may affect the popularity of a song. Furthermore, users may have a bias towards certain artists or genres, which may skew the results of our analysis. We also need to consider the technical aspect of our research, such as the selection of appropriate algorithms and models for predicting popularity. We must ensure that our methods are accurate and effective in predicting music popularity. Overall, we must be aware of these challenges and limitations and take steps to address them to ensure the validity and reliability of our research.
