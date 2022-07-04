# HateSpeechAPI
This Repository contains functions to classify textual data with our hate speech modles available through our API


## Installation
```r
devtools::install_github("MaelKubli/HateSpeechAPI")
library(HateSpeechAPI)
```

## Demo
Classifying Comments from a Data Frame with our standard model.

```r
token <- "" #Insert your Bearer Token

#Load Data (csv or xlsx or rds)
data <- load(input = "Path_To_DATA_FILE.csv")

# Classify Data 
pred <- classify_data(api_token = token, data = data, text_name = "text")
```

