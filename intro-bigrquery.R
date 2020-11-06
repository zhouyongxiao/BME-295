library(bigrquery)
billing <- "bme295-fall2020" # replace this with your project ID 

sql <- "SELECT
  mother_age
FROM
  `bigquery-public-data.samples.natality`
WHERE
  weight_gain_pounds IS NOT NULL
  AND weight_gain_pounds < 99
  AND weight_pounds IS NOT NULL
  AND weight_pounds > 0.2
  AND weight_pounds < 25
  AND year = 2000
  AND month = 1"

tb <- bq_project_query(billing, sql)
weightgain<- bq_table_download(tb, max_results = Inf)