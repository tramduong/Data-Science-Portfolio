
# Recommender Systems
## Project Title: Hotel Review Sentiment Analysis and recommendation
### Conducted by Tram Duong


### [Project Description](doc/)

+ **Project summary**: 

	- This project use a compiled data from different types of hotels that lists their name of business, property information and reviews received by their guests in the US.  
	- As we know hotel ratings do not tell a complete story of how guests view hotels. The dataset contains the text and review scores of over **35000 reviews** and **999 different hotels** in the US.

+ **Analytical Methods**:

	- **Cleaning**: 
		+ Removed irrevalent features
		+ Replaced missing values with 0 and outlier with 5 for rating features
		+ Replaced missing values in latitude and longitude values with real data
	- **Text Mining**: Text analysis for review feature.
	- **Sentiment Analysis**:
		+ Bing lexicon 
		+ NRC emotion lexicon
 	- **Recommendation Model**: After reviewing multiple recommender systems (UBCF or IBCF) it is determined that it would not be useful to process them as most users only rated one hotel. Due to these findings it was determined that we should use the **non-personalized recommendation** system.
	- **Spatial Analysis**: Visualize the review rating geographically in the USA. 

+ **Conclusion**:

	- There are few approaches to recommendations that I looked at as options such as UBCF and IBCF but came to the conclusion that it would not be possible to run such analysis due to **ratingMatrix** is a sparse matrix with only **0.27% elements rated**. Therefore, I just listed the top 5 hotel categories with highest ratings to make a non-personalized recommendation for all customers.
	- The top 5 hotel categories are “Hotels”, “Hotels,Budget Hotels,Hotels & Motels,Lodging”, “Hotels & Motels,Family-Friendly Hotels,Business Hotels,Budget Hotels,Hotel”, “Hotels,Hotels & Motels”, “Travel and Tourism,Hotels,Lodging,Hotel,Motels,Swimming Pools,Hotels & Motels”.

+ **Limitation**:

	- Since the dataset only has reviews of one user to one hotel, there are some limitations of personalized recommendation to other users, as it does not have many transactions in order to find the similar user.

+ **Improvements**:
	- Based on the dataset, it is possible build a predicting model for other hotels that have similar geography, services, categories, and customer comments by using neural networks or other advanced machine learning algorithms. 