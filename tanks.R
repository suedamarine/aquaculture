# load libraries

library(tidyverse)

# Calculate tank volumes
radii <- c(0.5, 0.6)
depth <- c(0.4, 0.53)
t_vol <- pi * radii^2 * depth
tank_df <- data.frame(radii, depth, t_vol)

# tank volumes
tanks <- rep(314, times = 16)
tanks <- data.frame(volume = rep(0.314, times = 16))

# flow per second smaller tanks
flow_300 <- tanks %>% 
  mutate(cumulative_volume = cumsum(volume),
         two_volumes = cumulative_volume * 2,
         volume_persecond = two_volumes / 3600,
         area = volume_persecond/0.3,
         radius = sqrt(area/pi),
         diameter = radius * 2 * 1000)
flow_300

# flow per second larger tanks
flow_500 <- data.frame(volume = rep(0.599, times = 16)) %>% 
  mutate(cumulative_volume = cumsum(volume),
         two_volumes = cumulative_volume * 2,
         volume_persecond = two_volumes / 3600,
         area = volume_persecond/0.75,
         radius = sqrt(area/pi),
         diameter = radius * 2 * 1000)
flow_500

# diameter of holes in spray bars 300l tanks
# depths at 50, 100, 150 mm
# use 32mm pipe for area

pi* 16^2

# a + 2a + 3a = 804mm2

depth <- seq(50, 300, 50)
relative_pressure <- depth/ 100
total_area <- 804/sum(relative_pressure)
total_area
hole_area <- relative_pressure*total_area
hole_diameter <- 2*sqrt(hole_area / pi)
spray_bar_df <- data.frame(depth, relative_pressure, hole_area, hole_diameter)
spray_bar_df
write.csv(spray_bar_df, "spray_bar_df.csv")

# diameter of holes in spray bars 500l tanks
# depths at 100, 150, 200, 250, 300, 350, 400, 450, 500 mm
# use 40mm pipe for area

pi* 20^2

# a + 2a + 3a = 804mm2

depth_500 <- seq(100,500, by =50)
relative_pressure_500 <- depth_500/ 100
total_area_500 <- (pi*20^2)/sum(relative_pressure)
total_area_500
hole_area_500 <- relative_pressure_500*total_area_500
hole_diameter_500 <- 2*sqrt(hole_area_500 / pi)
spray_bar_df_500 <- data.frame(depth_500, relative_pressure_500, hole_area_500, hole_diameter_500)
spray_bar_df_500
write.csv(spray_bar_df_500, "spray_bar_df_500.csv")
