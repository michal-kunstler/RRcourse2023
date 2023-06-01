
library(dplyr)
library(readxl)
library(meta)

meta <- read_excel("metaanalysis_data.xlsx")

meta_boys <- metacont(n.e=N_boys,
                      mean.e=Mean_boys_play_male,
                      sd.e=SD_boys_play_male,
                      n.c=N_boys,
                      mean.c=Mean_boys_play_female,
                      sd.c=SD_boys_play_female,
                      data=meta,
                      studlab=paste(Study),
                      comb.fixed = TRUE,
                      comb.random = TRUE,
)

meta_boys

meta_girls <- metacont(n.e=N_girls,
                       mean.e=Mean_girls_play_male,
                       sd.e=SD_girls_play_male,
                       n.c=N_girls,
                       mean.c=Mean_girls_play_female,
                       sd.c=SD_girls_play_female,
                       data=meta,
                       studlab=paste(Study),
                       comb.fixed = TRUE,
                       comb.random = TRUE,
)

meta_girls


contour_levels <- c(0.90, 0.95, 0.99)
contour_colors <- c("darkblue", "blue", "lightblue")

meta_boys %>% funnel(contour = contour_levels, col.contour = contour_colors)
legend("topright", c("p < 0.10", "p < 0.05", "p < 0.01"), bty = "n", fill = contour_colors)

meta_girls %>% funnel(contour = contour_levels, col.contour = contour_colors)
legend("topright", c("p < 0.10", "p < 0.05", "p < 0.01"), bty = "n", fill = contour_colors)


meta_boys %>% metareg(~ `Female authors` + `Male authors` + `Case definition adequate` + `Representativeness of cases` + `Selection of controls`)

