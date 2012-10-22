=Panucci's Pizza=

==Instructions==
Try to complete as many of the features as are described in the explanation below.

Fill in incomplete methods found in `lib/pizzaria.rb`.  You may add an classes, methods, modules, or other code as you see fit, but you may not modify the other files in the project.

The program can be run by typing *ruby pizzaria.rb*.  A menu system has been implemented to get you started.  Class `Pizzaria` has an instance of `Terminal` in the member variable `@terminal`. 
You may find its methods useful for displaying messages or collecting input apart from the menu interface.  You are not limited to it, however, and are free to use STDIN and STDOUT directly if you prefer.

==Explanation==
Panucci’s Pizza has always done pizza the old fashioned way.  But after his last pizza delivery boy disappeared after a New Year’s Eve delivery run, Pannucci decided he couldn’t count on unreliable employees to do things right.  He decided to replace all the fuss behind the counter with an automated system to handle everything, from point-of-sale to inventory tracking.  

Panucci sells pizzas in the three classic sizes: small, medium, and large.  A small cheese pizza costs $4.15, a medium $6.15, and a large costs $8.15.  Toppings are $2 each, except for pineapple which changes seasonally: in the spring and summer it costs $1.75, in fall and winter $2.50.  For medium and large pizzas, the first topping is only 1 dollar, except pineapple in off season months.  

Panucci also sells Pizza by the slice.  He keeps 4 kinds of pizza for sale by the slice: cheese, for $2 a slice, and sausage, mushroom, or pepperoni, each for $3 a slice.  

Finally, Panucci sells soft drinks in a one-size-fits-all cup for $1.75.  

===Point of Sale===
Up until now, Panucci has relied on his employees to do the math by hand.  Though he can’t be sure, Panucci suspects that his employees, being the dim sort, often got it wrong.  
Panucci needs point of sale to do the following things:

    It should compute the total charge for the order, including New York City’s sales tax of 8.875%.
    It should round off fractions of a cent.
    It should accept cash and plastic.  No checks at Panucci’s.
    It should update bill and coin counts for the cash drawer.
    If cash was tendered, it should compute the change
    It should print a receipt with the line items, the total, tendered, and change.  It should also print the date and a six-digit order number so that customers can’t try to re-use a receipt to get free pizza.



===Inventory Monitoring===
Panucci’s vision for his retooled pizzeria is to be able to monitor everything from the front counter.  He wants to know his stock of ingredients, how his by-the-slice pizzas are doing, and the status of pizzas waiting to go into the oven.

Panucci keeps track of the following ingredients that he needs to restock when they run low: flour, cheese, pizza sauce, seasoning, as well as a separate tally for each topping.  

He also keeps track of how many slices of each kind of pizza sold by the slice is left.  Each pizza holds 8 slices.  During busy hours, from noon to 2pm and 5pm to 7pm, Panucci needs to start a new pizza when there are 4 slices of that type left in order not to run out.  During regular hours, he can wait until only 2 slices are left.  

Finally, Panucci needs to manage the queue for his ovens.  Panucci has 2 ovens which can holds 2 pizzas each.  However, both pizzas must go in and come out at the same time.  Small pizzas take 15 minutes to bake, mediums take 18, and larges take 21.  Panucci needs to maximize utilization of his often at all times.  Whenever possible, pizzas should go into the oven in the order that they were ordered.  Pizzas sold by the slice come after regular orders in priority.  Pizzas sold by the slice are large pizzas.

Panucci’s inventory monitoring system should do the following:

    It should let him query for total slices of each kind of pizza by the slice
    It should let him query for inventory totals
    It should update inventory totals when a pizza is assembled
    When an oven is free, it should tell him which pizzas to put in next, based on the rules above
    It should tell him which pizzas are ready, which are in the oven, and which are waiting to go in the oven.  
    It should tell him what order each pizza belongs to, or whether it is to be sold by the slice.


Panucci has said that he is fine with querying constantly for times.  However, if you wanted to impress the old pizza maker, you could add alerts on the screen when oven timers ring. 

