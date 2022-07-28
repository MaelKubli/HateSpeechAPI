# HateSpeechAPI
This Repository contains functions to classify textual data with our hate speech models available through our API


## Installation
```r
devtools::install_github("MaelKubli/HateSpeechAPI")
library(HateSpeechAPI)
```

## Important Information
The API only accepts texts with a maximum of 1'000 character. 
In case your text variable contains texts with more than 1'000 
characters the classify_data function will only submit the first 
1'000 characters o each text. 

If you want to submit other parts of the text you will need to do 
some pre-processing on your own. 

The function calling the api will return the predicted probability of each text being classified as hate speech. 
The API would actually also return the prediction of the opposite as well but this value can simply be obtained by subtracting the received value from one (1-p).

For more Information about the API see the following page: 
https://gitlab.com/uzh-hatespeech-api/docs

## Demo
Classifying Comments from a Data Frame with our standard model.

```r
# API Authentication Key 
token <- ""

# Load Data
## You can load it any way you want or you can use the load_data function 
## which suports csv, xlsx and rds files.

data <- load_data(input = "Path_To_DATA_FILE.csv")

# Classify Data 
## To classify texts with our hate speech API you need to add your token, 
## the data and the column name of the text to classiy in the data to the 
## classify_data() function.

pred <- classify_data(api_token = token, data = data, text_name = "text")
```

Classifying Comments or Texts from a Data Frame with a special model.

```r
# API Authentication Key 
token <- ""

# Load Data
## You can load it any way you want or you can use the load_data function 
## which suports csv, xlsx and rds files.

data <- load_data(input = "Path_To_DATA_FILE.csv")

# Classify Data 
## To classify texts with a custom hate speech  model of the API you need 
## to add your token, the name of the endpoint of the special model, the data 
## and the column name of the text to classiy in the data to the 
## classify_data() function.

pred <- classify_data(api_token = token, 
                      endpoint = "special_model_xyz",
                      data = data, 
                      text_name = "text")
```

