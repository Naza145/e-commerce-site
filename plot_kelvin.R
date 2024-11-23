raw <- read.table("clipboard",header = T,sep = "\t")
# Create a data frame with the provided data
raw_materials <- c("Maize", "Groundnut cake (GNC)", "Soya Beans", "Lime", "Bone", "Wheat Offal", "Maize Offal", "Fish Offal", "Lysine", "Methionine", "Salt", "Layer Premix", "Broiler Premix", "Chick Premix")

quantity_available <- c(14600, 10250, 16500, 10000, 11000, 17000, 15500, 800, 1000, 1000, 8000, 2000, 80, 80)

df <- data.frame(RawMaterials = raw_materials, QuantityAvailable = quantity_available)

# Create a bar plot
ggplot(df, aes(x = reorder(RawMaterials, -QuantityAvailable), y = QuantityAvailable)) +
  geom_bar(stat = "identity", fill = "blue") +
  coord_flip() +  # Horizontal bars
  labs(title = "Quantity of Raw Materials Available per Month (kg)",
       x = "Raw Materials",
       y = "Quantity (Kg)") +
  theme_minimal()



# Create a data frame with the provided data
raw_materials <- c("Maize", "Groundnut cake (GNC)", "Soya Beans", "Lime", "Bone", "Wheat Offal", "Maize Offal", "Fish Offal", "Lysine", "Methionine", "Salt", "Layer Premix", "Broiler Premix", "Chick Premix")
chick_mash <- c(11, 3, 4.5, 0, 1, 5, 0, 0.5, 0.05, 0.05, 0.07, 0, 0, 0.07)
layer_mash <- c(11, 3, 3, 2, 0.5, 6.5, 0, 0.5, 0.05, 0.05, 0.075, 0.075, 0, 0)
grower_mash <- c(8, 2, 8, 0.5, 0.5, 4, 2.5, 0, 0.05, 0.05, 0.075, 0, 0, 0.075)
broiler_starter_mash <- c(11, 5, 5, 0, 1.5, 1.6, 0, 1, 0.03, 0.03, 0.07, 0.07, 0.07, 0)
broiler_finisher_mash <- c(10, 3.5, 4.5, 0, 0.5, 5, 0, 1, 0.03, 0.03, 0.07, 0.07, 0, 0)

df <- data.frame(
  RawMaterials = raw_materials,
  ChickMash = chick_mash,
  LayerMash = layer_mash,
  GrowerMash = grower_mash,
  BroilerStarterMash = broiler_starter_mash,
  BroilerFinisherMash = broiler_finisher_mash
)

# Load the ggplot2 package (if not already loaded)
library(ggplot2)

# Create a grouped bar plot
ggplot(df, aes(x = RawMaterials)) +
  geom_bar(aes(y = ChickMash, fill = "Chick Mash"), position = "dodge", stat = "identity") +
  geom_bar(aes(y = LayerMash, fill = "Layer Mash"), position = "dodge", stat = "identity") +
  geom_bar(aes(y = GrowerMash, fill = "Grower Mash"), position = "dodge", stat = "identity") +
  geom_bar(aes(y = BroilerStarterMash, fill = "Broiler Starter Mash"), position = "dodge", stat = "identity") +
  geom_bar(aes(y = BroilerFinisherMash, fill = "Broiler Finisher Mash"), position = "dodge", stat = "identity") +
  labs(title = "Quantity of Raw Materials in Different Feeds",
       x = "Raw Materials",
       y = "Quantity") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  scale_fill_manual(values = c("Chick Mash" = "red", "Layer Mash" = "green", "Grower Mash" = "blue", "Broiler Starter Mash" = "purple", "Broiler Finisher Mash" = "orange")) +
  guides(fill = guide_legend(title = "Feeds"))

# Create a data frame with the provided data
products <- c("Chick Mash", "Layer Mash", "Grower Mash", "Broiler Starter Mash", "Broiler Finisher Mash")
average_cost_price <- c(9850.55, 8378.25, 7506.75, 9813.75, 8539.5)
average_selling_price <- c(10200, 9000, 7800, 10200, 9000)
profit <- c(349.45, 621.75, 293.25, 386.25, 460.5)

df <- data.frame(
  Product = products,
  AverageCostPrice = average_cost_price,
  AverageSellingPrice = average_selling_price,
  Profit = profit
)

# Load the ggplot2 package (if not already loaded)
library(ggplot2)

# Create a bar plot
ggplot(df, aes(x = Product)) +
  geom_bar(aes(y = AverageCostPrice, fill = "Average Cost Price"), stat = "identity") +
  geom_bar(aes(y = AverageSellingPrice, fill = "Average Selling Price"), stat = "identity") +
  geom_bar(aes(y = Profit, fill = "Profit"), stat = "identity") +
  labs(title = "Average Cost Price, Average Selling Price, and Profit by Product",
       x = "Product",
       y = "Amount") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  scale_fill_manual(values = c("Average Cost Price" = "blue", "Average Selling Price" = "green", "Profit" = "red")) +
  guides(fill = guide_legend(title = "Metrics"))
