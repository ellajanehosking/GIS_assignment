

library(leaflet)
pal <- colorFactor(
  palette = c("darkblue", "green", "purple", "darkgreen", "orange"),
  domain = sp2$PA_level)



class(sp2)
names(sp2)
table(sp2$PA_level)
sum(is.na(sp2$PA_level))

leaflet(sp2) %>%
  addTiles() %>%
  addCircleMarkers(
    radius = 3,
    fillColor = ~pal(PA_level),
    fillOpacity = 0.8,
    stroke = FALSE
  ) %>%
  addLegend(
    "bottomright",
    pal = pal,
    values = ~PA_level,
    title = "Protection Level"
  )

install.packages("mapview")
install.packages("leafpop")

library(leafpop)
library(mapview)
mapview(sp2, popup = popupTable(lsp2, zcol = c("user_login", "click_url")))

lsp2 <- sp2 %>%
  mutate(click_url = paste("<b><a href='", url, "'>Link to iNat observation</a></b>"))
