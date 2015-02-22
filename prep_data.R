library(stringr)
## Data prep
zip_name <- "names.zip"
temp_dir <- tempdir()

unzip(zip_name, exdir=temp_dir)
l <- list.files(temp_dir)
yob_files <- l[grepl("yob.*", l)]

names_per_year <- 10

males <- data.frame()
females <- data.frame()

for(i in yob_files){
    cat(paste("Reading file:", i, "\n"))
    year <- as.numeric(str_match(i, "yob([0-9]{4}).txt")[,2])
    year_df <- read.csv(file.path(temp_dir, i), header=F)
    names(year_df) <- c("name", "gender", "count")
    year_df["year"] = year

    tmp_males <- subset(year_df, gender=="M")
    tmp_females <- subset(year_df, gender=="F")

    males <- rbind(males, tmp_males[1:names_per_year+1, ])
    females <- rbind(females, tmp_females[1:names_per_year+1, ])
}

full_df <- rbind(females, males)
write.csv(full_df, "all_names.csv")

