# Load the data
library("lubridate")
times <- read.csv(file.path("examples", "marathon", "men.tsv"),
                  sep = "\t",
                  stringsAsFactors = FALSE)
times <- transform(times, Hours = hms(Time)@hour + hms(Time)@minute / 60)

# Show the data
ggplot(times, aes(x = Hours)) +
  geom_histogram() +
  xlab("Hours") +
  ylab("Number of Runners") +
  opts(title = "Top 100 Mens' Times to Complete the NYC Marathon")
ggsave(file.path("examples", "marathon", "men_hours.pdf"), height = 7, width = 7)

# Show a histogram
ggplot(times, aes(x = Hours)) +
  geom_histogram() +
  xlab("Hours") +
  ylab("Number of Runners") +
  opts(title = "Top 100 Mens' Times to Complete the NYC Marathon")
ggsave(file.path("examples", "marathon", "men_hours.pdf"), height = 7, width = 7)

# Show density plots
ggplot(times, aes(x = Hours)) +
  geom_histogram() +
  xlab("Hours") +
  ylab("Number of Runners") +
  opts(title = "Top 100 Mens' Times to Complete the NYC Marathon")
ggsave(file.path("examples", "marathon", "men_hours.pdf"), height = 7, width = 7)
