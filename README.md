# RestockReorderEOQ-Modeling
This is more of a conceptual idea since I can't find a dataset currently that would allow me to test this. However in theory this should allow for a store to predict future demand and then using that prediction of future demand determine optimal times to reorder product. 


Here's the math behind this 
EOQ = sqrt((2DS)/H) 
Reorder point = Lead time demand + Safety stock
(D being demand S being cost of ordering and H being holding cost) lead time demand is the amount of time it takes to recieve an order and safety stock is in the event of variability) 

The Data i would need is the quantities of the item in storage over time this would allow me to build a regression model that I could then use to predict future demand the problem with the traditional EOQ (As in from an academic perspective) is that it doesn't typically add this step. Once we have EOQ and Reorder point we can then determine when the store should reorder items. 
