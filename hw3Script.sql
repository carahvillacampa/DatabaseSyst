

--1 
SELECT 
    * FROM customer
    ORDER BY name;
    
--2 
SELECT
    * FROM item
    WHERE type= 'DVD'
    ORDER BY price;
    
--3 
SELECT
    title, type, price FROM item
    WHERE price < 15.00
    ORDER BY price DESC;
    
--4
SELECT
    title FROM item
    WHERE title LIKE '%West%'
    ORDER BY title;
    
--5
SELECT
    --extract(year from pdate) FROM purchase;
    cid FROM purchase
    WHERE quantity>=1 and extract(year from pdate)= 2019 -- need to specify the year
    ORDER BY cid;
    
--6 

SELECT
    pdate,pid FROM purchase
    WHERE quantity=1
    ORDER BY pid, pdate;
    
--7 

SELECT
    min(price),type FROM item
    group by type;
    
--8 
SELECT
    pdate, quantity FROM purchase
    WHERE quantity >=1
    ORDER BY quantity DESC;
    
--9 
SELECT 
    pid, pdate FROM purchase
    inner join customer ON customer.id=purchase.cid
    WHERE name='Reed'
    ORDER BY purchase.pid;
    
--10

SELECT
    pid,item.price*purchase.quantity as total_cost
    FROM purchase inner join item ON item.id= purchase.iid
    ORDER BY total_cost DESC;
    
    
    
    
