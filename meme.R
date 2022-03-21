library(magick)

# images
fresh_potato <- image_read("https://cdn.pixabay.com/photo/2016/08/11/08/49/potatoes-1585075_1280.jpg") %>%
  image_scale(500)

sitting_potato <- image_read("https://cdn.pixabay.com/photo/2012/12/24/08/39/agriculture-72254_1280.jpg") %>%
  image_scale(500)

rotten_potato <- image_read("https://cdn.pixabay.com/photo/2016/03/05/19/11/age-1238308_1280.jpg") %>%
  image_scale(500)

# box texts
first_text <- image_blank(width = 500,
                          height = 330,
                          color = "#F3CE9E") %>%
  image_annotate(text = "Sitting on the couch in 2020",
                 color = "#FFFFFF",
                 size = 40,
                 font = "Impact",
                 gravity = "center")

second_text <- image_blank(width = 500,
                           height = 330,
                           color = "#DDBD92") %>%
  image_annotate(text = "Sitting on the couch in 2021",
                 color = "#FFFFFF",
                 size = 30,
                 font = "Impact",
                 gravity = "center")

third_text <- image_blank(width = 500,
                          height = 410,
                          color = "#B09776") %>%
  image_annotate(text = "Still sitting on the couch in 2022",
                 color = "#FFFFFF",
                 size = 20,
                 font = "Impact",
                 gravity = "center")


first_row <- c(fresh_potato, first_text) %>%
  image_append()
second_row <- c(sitting_potato, second_text) %>%
  image_append()
third_row <- c(rotten_potato, third_text) %>%
  image_append() %>%

meme <- c(first_row, second_row, third_row) %>%
  image_append(stack = TRUE)

image_write(meme, "my_meme.png")


