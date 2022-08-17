library(dplyr)
library(tidyr)
library(stringr)

if(!file.exists("./data")){dir.create("./data")}

netflixData <- as_tibble(read.csv("./data/netflix_titles.csv"))

# Separar generos

test <- separate(netflixData, listed_in, sep = ",",
                 into = c('Genre1', 'Genre2', 'Genre3'))

# Crear una tabSeries

tabSeries <- test %>% 
    filter(type == "TV Show") %>%
    rename(seasons = duration) %>%
    separate(seasons, sep = " ",
             into = 'seasons') %>%
    select(-type) %>%
    rename(classif = rating)

# Crear una tabPeliculas

tabMovies <- test %>% 
    filter(type == "Movie") %>%
    select(-type) %>%
    separate(duration, sep = " ",
             into = 'duration_mins') %>%
    rename(classif = rating)

# Crear catalogo de generos

genres <- unique(test$Genre1)
genres <- append(genres, test$Genre2)
genres <- append(genres, test$Genre3)
genres <- unique(genres)
genresCat <- data.frame(id = 1:length(genres), genres)


# Crear catalogo de clasificaciones

classif <- unique(netflixData$rating)
classifCat <- data.frame(id = 1:length(classif), classif)

# Crear tabla "MovHasGenres"

genresCat <- rename(genresCat, Genre1 = genres)
movHasGenres <- inner_join(tabMovies, genresCat, by = "Genre1") %>%
    rename(idGenre1 = id)
genresCat <- rename(genresCat, Genre2 = Genre1)
movHasGenres <- inner_join(movHasGenres, genresCat, by = "Genre2") %>%
    rename(idGenre2 = id)
genresCat <- rename(genresCat, Genre3 = Genre2)
movHasGenres <- inner_join(movHasGenres, genresCat, by = "Genre3") %>%
    rename(idGenre3 = id)
movHasGenres <- select(movHasGenres,
                       show_id,
                       idGenre1,
                       idGenre2,
                       idGenre3)
    
# Crear tabla "SerieHasGenres"

genresCat <- data.frame(id = 1:length(genres), genres)
genresCat <- rename(genresCat, Genre1 = genres)
serHasGenres <- inner_join(tabSeries, genresCat, by = "Genre1") %>%
    rename(idGenre1 = id)
genresCat <- rename(genresCat, Genre2 = Genre1)
serHasGenres <- inner_join(serHasGenres, genresCat, by = "Genre2") %>%
    rename(idGenre2 = id)
genresCat <- rename(genresCat, Genre3 = Genre2)
serHasGenres <- inner_join(serHasGenres, genresCat, by = "Genre3") %>%
    rename(idGenre3 = id)
serHasGenres <- select(serHasGenres,
                       show_id,
                       idGenre1,
                       idGenre2,
                       idGenre3)

# Crear tabla "PeliculaHasClassif"

movHasClas <- inner_join(tabMovies, classifCat, by = "classif")
movHasClas <- rename(movHasClas, idClassif = id)
movHasClas <- select(movHasClas, show_id, idClassif)

# Crear tabla "SeriesHasClassif"

serHasClas <- inner_join(tabSeries, classifCat, by = "classif")
serHasClas <- rename(serHasClas, idClassif = id)
serHasClas <- select(serHasClas, show_id, idClassif)

# Remover columnas con informacion redundante

tabMovies <- select(tabMovies, -classif,
                    -Genre1,
                    -Genre2,
                    -Genre3)

tabSeries <- select(tabSeries, -classif,
                    -Genre1,
                    -Genre2,
                    -Genre3)


# Rellenar con NA donde este vacio


tabMovies <- mutate_all(tabMovies, na_if,"")
tabSeries <- mutate_all(tabSeries, na_if,"")
genresCat <- mutate_all(genresCat, na_if,"")
classifCat <- mutate_all(classifCat, na_if,"")
movHasClas <- mutate_all(movHasClas, na_if,"")
serHasClas <- mutate_all(serHasClas, na_if,"")
serHasGenres <- mutate_all(serHasGenres, na_if,"")
movHasGenres <- mutate_all(movHasGenres, na_if,"")


## Correcciones puntuales
filter(tabMovies, grepl('\n', description))
filter(tabMovies, grepl('\n', title))

testfilter <- str_replace_all(tabMovies$title, '\n', '')
tabMovies$title <- testfilter

testfilter <- str_replace_all(tabMovies$description, '\n', '')
tabMovies$description <- testfilter


# Crear csvs desde los dataframes
if(!file.exists("./output")){dir.create("./output")}
write.table(tabMovies, './output/tabMovies.csv', row.names = F, col.names=F, quote = FALSE, sep = '\t', na = "\\N")
write.table(tabSeries, './output/tabSeries.csv', row.names = F, col.names=F, quote = FALSE, sep = '\t', na = "\\N")
write.table(genresCat, './output/genresCat.csv', row.names = F, col.names=F, quote = FALSE, sep = '\t', na = "\\N")
write.table(classifCat, './output/classifCat.csv', row.names = F, col.names=F, quote = FALSE, sep = '\t', na = "\\N")
write.table(movHasClas, './output/movHasClas.csv', row.names = F, col.names=F, quote = FALSE, sep = '\t', na = "\\N")
write.table(serHasClas, './output/serHasClas.csv', row.names = F, col.names=F, quote = FALSE, sep = '\t', na = "\\N")
write.table(serHasGenres, './output/serHasGenres.csv', row.names = F, col.names=F, quote = FALSE, sep = '\t', na = "\\N")
write.table(movHasGenres, './output/movHasGenres.csv', row.names = F, col.names=F, quote = FALSE, sep = '\t', na = "\\N")

