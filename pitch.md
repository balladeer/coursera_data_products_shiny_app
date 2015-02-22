
Baby Names: Popularity Explorer
========================================================
transition: linear
author: Zachary Cross
date: Feb 2015



Background
========================================================

<small>Since 1998, the SSA has compiled a data set that summarizes the names given to children in the U.S.  I haved created a tool to let people explore this dataset as a way to explore naming trends from the past.  Due to the large number of names used every year, the data was first filtered to only include the 20 most popular names, by gender, from 1960-2013.</small>


```
   name gender count year rank
1  Mary      F 51479 1960    1
2 Susan      F 39198 1960    2
3 Linda      F 37315 1960    3
4 Karen      F 36385 1960    4
5 Donna      F 34132 1960    5
6  Lisa      F 33705 1960    6
```

Names by Count
========================================================
The first interactive element of the app allows users to select multiple names and then view how many children were given those names over time.  Example output:

<iframe src=' pitch-figure/unnamed-chunk-3-1.html ' scrolling='no' frameBorder='0' seamless class='rChart highcharts ' id=iframe- chart242040beb79 ></iframe> <style>iframe.rChart{ width: 100%; height: 400px;}</style>


Names by Rank
========================================================

<small>The second interactive element of the app allows users to select a range of years from 1960-2013.  The app will then plot the rankings of each top-20 name as time changes.  This allows users to explore which names retain popularity (e.g. 'Michael') while others spike and then disappear.</small>

<iframe src=' pitch-figure/unnamed-chunk-4-1.html ' scrolling='no' frameBorder='0' seamless class='rChart highcharts ' id=iframe- chart24206cc116aa ></iframe> <style>iframe.rChart{ width: 100%; height: 400px;}</style>

Summary
========================================================

* Slides made with RStudio's Presenter
* App made with [ShinyApps](http://www.shinyapps.io/) + [rCharts](http://rcharts.io/)
* Interactive version, visit [Baby Names](http://balladeer.shinyapps.io/baby_names/)
* [GitHub repo](https://github.com/balladeer/coursera_data_products_shiny_app)
* Data from the [SSA](http://www.ssa.gov/oact/babynames/background.html) and [data.gov](http://catalog.data.gov/dataset/baby-names-from-social-security-card-applications-national-level-data).

