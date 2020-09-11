**Airlines_2**: 
  + The original data retrieved from Webhose.io: 
      + Thread title: airline
      + Type of sites: news and blogs
          + Country: US
          + Laguage: English
          + Dates: last 30 days since 27 JULY 2020
          + Size: 20,015 feeds
          
**Airlines_dedup**: 
  + Data deduplication with:
          + SimHash (optimized for Hamming distance of 20)
          + Word2Vec with similarity score > 0.7
  + Contains:
          + Thread title: airline
          + Type of sites: news and blogs
          + Country: US
          + Laguage: English
          + Dates: last 30 days since 27 JULY 2020
          + Size: 13,341 feeds
          
**Word2vec File**: 
  + Click here: [Word2vec](https://drive.google.com/file/d/0B7XkCwpI5KDYNlNUTTlSS21pQmM/edit)
