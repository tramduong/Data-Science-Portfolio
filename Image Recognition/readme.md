# Project: Can you recognize the emotion from an image of a face? 
<img src="figs/CE.jpg" alt="Compound Emotions" width="500"/>
(Image source: https://www.pnas.org/content/111/15/E1454)

### [Full Project Description](doc/project3_desc.md)


+ **Project summary**: 
In this project, we created a classification engine for facial emotion recognition.
We developed advanced classification models to compare their accuracy and efficiency to the client's original baseline model -- Boosted Decision Stumps(gbm), which has a model accuracy of 44.4\%. The advanced model we tried are KNN, Support Vector Machine(SVM), CNN, and Random Forest. Among the 4 advanced models, SVM has the highest accuracy, which is around 52.8\%, so we chose SVM as our final advanced model.  We also conducted PCA for our feature selection.  

* All of the code for models that we tried but did not work out are included at the end of the Rmarkdown file as an appendix, and are not included in the final pdf.
	
+**Project modelling**:  

	+ Feature selection for advanced model using PCA.
	+ Gradient Boosting Machine - Baseline model
	+ CNN, KNN, Random Forest with cross validation
	+ SVM - Advanced model
```
proj/
├── lib/
├── data/
├── doc/
├── figs/
└── output/
```

Please see each subfolder for a README file.

