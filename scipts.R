library(palmerpenguins)
library(tidyverse)
library(GGally)
library(plotly)

data <- penguins
cat("Number of penguins: ",nrow(penguins))

cat("Names of variables: ",names(penguins))

print(colSums(is.na(penguins)))

#Species distribution visualization
penguins %>% count(species)
histo_species <- ggplot(penguins) +
  geom_bar(aes(x = species), fill = "darkorchid4", color = "darkgray") +
  labs(title = "Penguins species", subtitle = "Bar chart") +
  ylab("Count") +
  theme_light()
histo_species

#Island distribution
penguins %>% count(island)
histo_isl <- ggplot(penguins) +
  geom_bar(aes(x = island), fill = "darkorchid4", color = "darkgray") +
  labs(title = "Number of penguins per island", subtitle = "Bar chart") +
  ylab("Count") +
  theme_light()
histo_isl

#Univariate analysis
body_mass_plot <- ggplot(penguins, aes(x = species, y = body_mass_g, fill = species)) +
  geom_boxplot() +
  labs(title = "Body mass by species") +
  theme_light()
body_mass_plot

bill_len_plot <- ggplot(penguins, aes(x = species, y = bill_length_mm, fill = species)) +
  geom_boxplot() +
  labs(title = "Bill length by species") +
  theme_light()
bill_len_plot

flipper_len_plot <- ggplot(penguins, aes(x = species, y = flipper_length_mm, fill = species)) +
  geom_boxplot() +
  labs(title = "Flipper length by species") +
  theme_light()
flipper_len_plot

#Bivariate analysis
body_mass_and_flipper_length <- ggplot(penguins, aes(x = body_mass_g, y = flipper_length_mm, color = species)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  theme_light()
body_mass_and_flipper_length

bill_len_and_sex_plot <- ggplot(penguins, aes(x = species, y = bill_length_mm, fill = sex)) + 
  geom_boxplot() +
  theme_light()
bill_len_and_sex_plot

isl_and_species_plot <- ggplot(penguins, aes(x = island, fill = species)) +
  geom_bar(position = "dodge") +
  theme_light() +
  labs(title = "Penguin species distribution across islands")
isl_and_species_plot

#Multivariate analysis
features_by_species_plot<- penguins %>%
  select(species, bill_length_mm, bill_depth_mm, flipper_length_mm, body_mass_g)
ggpairs(features_by_species_plot, aes(color = species, alpha = 0.6))
features_by_species_plot

plot_ly(
  data = penguins,
  x = ~bill_length_mm,
  y = ~flipper_length_mm,
  z = ~body_mass_g,
  color = ~species,
  colors = c("Adelie" = "blue", "Gentoo" = "green", "Chinstrap" = "red"),
  type = "scatter3d",
  mode = "markers"
)

mass_sex_species <- ggplot(penguins, aes(x = species, y = body_mass_g, fill = sex)) + 
  geom_boxplot() +
  theme_light()
mass_sex_species

penguins_num <- penguins %>%
  select(bill_length_mm, bill_depth_mm, flipper_length_mm, body_mass_g) %>%
  drop_na()

set.seed(123)
km <- kmeans(scale(penguins_num), centers = 3)

# new dataframe with clusters
penguins_clustered <- penguins %>%
  drop_na(bill_length_mm, bill_depth_mm, flipper_length_mm, body_mass_g) %>%
  mutate(cluster = factor(km$cluster))

plot_ly(
  data = penguins_clustered,
  x = ~bill_length_mm,
  y = ~flipper_length_mm,
  z = ~body_mass_g,
  color = ~cluster,
  type = "scatter3d",
  mode = "markers"
)

library(caret)

conf_matrix <- table(Cluster = penguins_clustered$cluster, Species = penguins_clustered$species)
conf_matrix
