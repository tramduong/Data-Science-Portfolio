# Applied Data Science @ Columbia
## Project Title: Pop vs Metal: What are the differences in their lyrical changes and their sentiment?
### Conducted by Tram Duong

![image](figs/PopvsMetal.png)

### [Project Description](doc/)

+ Project title: Pop vs Metal: What are the differences in their lyrical changes and their sentiment?

+ Project summary: This report is a guidebook with selected Q&A aims at finding out the insights and differences between Pop and Metal

First,I processed the raw textual data 'dt_lyrics' saved in $ data $ file by cleaning data, removing stopwords and creating a tidy version of texts which is saved in $ output $ file as 'processed_data'. Then I load the processed data directly from output folder. 

+ Three questions will be answered in this report are: 
  1. What are the music trends of Pop and Metal in general? Is pop really more positive than metal? 
  2. Who are the hardest working artists in these genres? Did they follow the trends? Or did they write their music with their own style?
  3. How did the sentiments in Pop and Metal change over the decades and how do they compare to each other?

Used packages in this project: tm, tidytext, tidyverse, DT, wordcloud, scales, gridExtra, ngram, igraph, ggraph, rsconnect, syuzhet, ggwordcloud. 

```
proj/
├── lib/
├── data/
├── doc/
├── figs/
└── output/
```

Please see each subfolder for a README file.
