library(tidyverse)
chinstrap_data <- read_csv("data/chinstrap_data.csv")

adelie_data <- read_csv("data/adelie_data.csv")
penguin_data <- bind_rows(adelie_data, chinstrap_data)
gentoo_data <- read_csv("data/gentoo_data.csv")
penguin_data <- bind_rows (gentoo_data, penguin_data)

table(penguin_data$Species)

write_csv(penguin_data, "data/penguin_data.csv")
library(palmerpenguins)

ggplot(penguins_raw) +
  aes(x = `Body Mass (g)` , y = `Flipper Length (mm)` , color = Island, shape = Sex) +
  geom_point() + scale_color_viridis_d(end = 0.7) 

ggplot(penguins_raw) +
  aes(x = `Body Mass (g)`, y = `Flipper Length (mm)`,
      color = Island, shape = Sex) +
  geom_point() +
  scale_color_brewer(palette = "Set1") +
  scale_x_continuous(name = "Body Mass (grams)") +
  scale_y_continuous(name = "Flipper Length (millimeters)")


ggplot(penguins_raw) +
  aes(x = `Body Mass (g)`, y = `Flipper Length (mm)`,
      color = Island, shape = Sex) +
  geom_point() +
  scale_color_brewer(palette = "Set1") +
  scale_x_continuous(name = "Body Mass (grams)") +
  scale_y_continuous(name = "Flipper Length (millimeters)") +
  theme_classic() + theme(axis.text = element_text(color ="black"))

ggplot(penguins_raw) +
  aes(x = `Body Mass (g)`, fill = Species) +
  geom_histogram() +
  theme_classic() + scale_fill_brewer(palette = "Set1") + 
  scale_y_continuous(limits = c(0, 30),
                     expand = expansion())+
  theme(legend.position = "top",
        legend.direction = "vertical")


ggplot(penguins_raw) +
  aes(x = Island, y = `Culmen Length (mm)`) +
  geom_violin(draw_quantiles = c(0.25, 0.5, 0.75)) +
  theme_classic()

ggplot(penguins_raw) +
  aes(x = `Delta 15 N (o/oo)`, y = `Delta 13 C (o/oo)`) +
  geom_point() +
  geom_density_2d_filled(alpha = 0.5) +
  geom_density_2d(linewidth = 0.25, colour = "black") +
  scale_x_continuous(limits = c(7, 10.5)) +
  scale_y_continuous(limits = c(-27.5, -23.5)) +
  coord_cartesian(expand = FALSE) +
  theme_classic() +
  theme(axis.text = element_text(color = "black"))
  
g1 <- ggplot(penguins_raw) +
  aes(x = `Body Mass (g)`, y = `Flipper Length (mm)`,
      color = Island, shape = Sex) +
  geom_point() +
  scale_color_brewer(palette = "Set1") +
  scale_x_continuous(name = "Body Mass (grams)") +
  scale_y_continuous(name = "Flipper Length (millimeters)") +
  theme_classic() + theme(axis.text = element_text(color ="black")) +
  facet_grid(rows = vars(Species), cols = vars
             (studyName))
  facet_wrap(~Species, ncol = 1)
  #facet_wrap(vars(Species), ncol = 1)

  
g2 <- ggplot(penguins_raw) +
    aes(x = `Delta 15 N (o/oo)`, y = `Delta 13 C (o/oo)`) +
    geom_point() +
    geom_density_2d_filled(alpha = 0.5, show.legend = FALSE) + 
    theme_classic() +
    scale_x_continuous(limits = c(7, 10.5),
                       expand = expansion())
    scale_y_continuous(limits = c(-27.5, -23.5),
                       expand = expansion()) 
library(patchwork)
g1+g2    


g3 <- ggplot(penguins_raw) +
  aes(x = Island, y = `Culmen Length (mm)`) +
  geom_boxplot() +
  theme_classic()


gg <- (g1 | g2) / g3
ggsave("figures/penguins_1.pdf", gg, height = 10, width = 10)
ggsave("figures/penguins_1.jpg", gg, height = 10, width = 10)
