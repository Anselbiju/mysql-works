create database Sales;

use Sales;

create table orders(
Order_id int primary key,
Customer_name varchar(20) not null,
Product_category varchar(20),
Ordered_item varchar(30) unique,
Contact_no Bigint
);

desc orders;

alter table orders add column Order_quantity int;

rename table orders to sales_orders;

desc sales_orders;

INSERT INTO sales_orders(Order_id, Customer_name, Product_category, Ordered_item, Contact_no, Order_quantity) 
VALUES 
    (101, 'achu', 'utensils', 'soap', 9744535624, 2),
    (102, 'ansel', 'accessories', 'tape', 2344535644, 3),
    (103, 'ravi', 'electronics', 'motor', 6444533324, 2),
    (104, 'sonu', 'accessories', 'box',  7223535624, 10),
    (105, 'achu', 'utensils', 'comb',  3344535678, 2),
    (106, 'shebin', 'electronics', 'monitor', 4844535345, 4),
    (107, 'ammmu', 'ornaments', 'bangles', 5644535464, 12),
    (108, 'sethu', 'electronics', 'mobile', 8842345624, 2),
    (109, 'ansu', 'utensils', 'chair', 9044537894, 9),
    (110, 'fishu', 'electronics', 'tv', 8644535624, 7);

select customer_name, ordered_item
from sales_orders;

update sales_orders set Ordered_item = "machine" where Order_id = 103;

Drop table sales_orders;

    

