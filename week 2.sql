use w3schools;
select OrderID, OrderDate from orders
WHERE OrderDate BETWEEN "1996-11-01" AND "1996-11-30";

select ShipperName 
from shippers join orders using (ShipperID)
where OrderDate BETWEEN "1996-11-01" AND "1996-11-30";

select FirstName, sum(Quantity*Price) as OrderTotal 
from employees 
join orders using (EmployeeID)
join order_details using (OrderID)
join products using (ProductID)
group by EmployeeID
order by OrderTotal DESC
limit 10;

select * from orders
where OrderID in
(select OrderID from order_details
where ProductID in
(select ProductID from products
where SupplierID in
(select SupplierID from suppliers
where SupplierName = "Tokyo Traders")));