library(stringr)

## Data prep
zip_name <- "names.zip"  # Downloaded from http://catalog.data.gov/dataset/baby-names-from-social-security-card-applications-national-level-data
temp_dir <- tempdir()

unzip(zip_name, exdir=temp_dir)
l <- list.files(temp_dir)
yob_files <- l[grepl("yob.*", l)]

names_per_year <- 20

males <- data.frame()
females <- data.frame()

for(i in yob_files){
    cat(paste("Reading file:", i, "\n"))
    year <- as.numeric(str_match(i, "yob([0-9]{4}).txt")[,2])

    if(year >= 1960){
        year_df <- read.csv(file.path(temp_dir, i), header=F)
        names(year_df) <- c("name", "gender", "count")
        year_df["year"] = year

        tmp_males <- subset(year_df, gender=="M")
        tmp_males$rank <- seq(1:nrow(tmp_males)+1)

        tmp_females <- subset(year_df, gender=="F")
        tmp_females$rank <- seq(1:nrow(tmp_females)+1)

        #males <- rbind(males, tmp_males)
        #females <- rbind(females, tmp_females)
        males <- rbind(males, tmp_males[0:names_per_year, ])
        females <- rbind(females, tmp_females[0:names_per_year, ])
    }
}

full_df <- rbind(females, males)
write.csv(full_df, "all_names.csv")

