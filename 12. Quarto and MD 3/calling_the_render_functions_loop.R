library(quarto)

quarto_render("Assignment.qmd", execute_params = list(
  season = 5
))


for (i in 1:8) {
  quarto_render("Assignment.qmd", execute_params = list(
    season = i
  ), output_file = paste0("Assignment season ", i, ".html"))
}
