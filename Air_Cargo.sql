select * from customer order by customer_id ;
select * from passengers_on_flights order by route_id;
select * from routes;
select * from ticket_details  ;

select * from passengers_on_flights where route_id between 1 and 25;

select sum(price_per_ticket) as TotalPrice,count(no_of_tickets) as TicketCount,class_id from ticket_details group by class_id;

select concat(first_name," ",last_name) as full_name from customer;

select c.first_name,c.last_name,c.customer_id,t.p_date,t.aircraft_id,t.class_id,t.brand from customer c 
 inner join ticket_details t on c.customer_id=t.customer_id order by customer_id;
 
select c.first_name,c.last_name,c.customer_id,t.brand,t.p_date from customer c inner join ticket_details t 
on  c.customer_id=t.customer_id  where t.brand='Emirates' order by c.customer_id;

select c.customer_id,c.first_name,c.last_name,p.class_id,p.seat_num,p.travel_date from passengers_on_flights p 
left join customer c on p.customer_id=c.customer_id group by 
c.customer_id,c.first_name,c.last_name,p.class_id,p.seat_num,p.travel_date having p.class_id='Economy Plus' order by c.customer_id ;

select customer_id, sum(price_per_ticket*no_of_tickets) as revenue from ticket_details group by customer_id;

select sum(price_per_ticket*no_of_tickets) as revenue,
if(sum(price_per_ticket*no_of_tickets) >10000,'Revenue Crossesd','Revenue Not Crossed') as Profit from ticket_details;

select max(price_per_ticket) as maxprice,class_id from ticket_details group by class_id order by maxprice;
select distinct(class_id),max(price_per_ticket) over(partition by class_id) as maxprice from ticket_details;

CREATE INDEX idx_Route_id ON air_cargo.passengers_on_flights (route_id);
select * from air_cargo.passengers_on_flights where route_id=4;

SELECT customer_id,sum(price_per_ticket*no_of_tickets) as totalprice
FROM ticket_details
GROUP BY customer_id
WITH ROLLUP;


create or replace view VW_ticket_details as
select t.customer_id,c.first_name,c.last_name,c.gender,t.aircraft_id,t.brand,t.p_date from ticket_details t left join customer c
on t.customer_id=c.customer_id
where class_id='Bussiness' order by customer_id;

DELIMITER $$
CREATE PROCEDURE  AirCargo_CustomerDetails(in route1 int,in route2 int)
begin
DECLARE passengers_table_exists int;
DECLARE customer_table_exists int;
-- check whether passengers table exists
SELECT COUNT(*) INTO passengers_table_exists
FROM information_schema.tables
WHERE table_schema = DATABASE() AND table_name = 'passengers_on_flights';
-- check whether customer table exists
SELECT COUNT(*) INTO customer_table_exists
FROM information_schema.tables
WHERE table_schema = DATABASE() AND table_name = 'customer';
IF passengers_table_exists = 0 OR customer_table_exists = 0 THEN
SELECT 'Error: One or more required tables do not exist. 'AS Message;
else
SELECT 'Table exists'AS Message;
end if;
select c.first_name,c.last_name,c.gender,c.date_of_birth,p.customer_id,p.travel_date,p.flight_num,p.route_id from passengers_on_flights p left join customer c
on p.customer_id=c.customer_id
 where p.route_id between route1 and route2 order by customer_id;
end $$

call AirCargo_CustomerDetails(1,7);

DELIMITER $$
CREATE PROCEDURE  Route_Details()
begin
select * from routes where distance_miles >2000;
end $$

call  Route_Details();


select * from routes where distance_miles >=0 and distance_miles <= 2000 ;
select * from routes where distance_miles >2000 AND distance_miles <=6500  ;
select * from routes where distance_miles >6500 ;


DELIMITER $$
CREATE PROCEDURE DistanceTravelled()
begin
select *,
case when distance_miles >=0 and distance_miles <= 2000 then 'Short Distance Travelled'
 when distance_miles >6500 then 'Long Distance Travelled'
 else  'Intermediate Distance Travelled'
end as DitstanceTravelled from routes;
end $$

call DistanceTravelled();

DELIMITER //
create function checkComplimentaryService(classid varchar(20)) returns text DETERMINISTIC
begin
declare needService text;
set needService=case
when classid='Bussiness' then 'Yes'
when classid='Economy Plus' then 'Yes'
else 'No'
end ;
return needService;
end //

DELIMITER $$
create procedure proComplimentaryService()
begin
select t.p_date,t.customer_id,t.class_id,checkComplimentaryService(t.class_id) as CheckService from ticket_details t;
end $$

call proComplimentaryService();


DELIMITER //
CREATE PROCEDURE CURSOR_GetName()
BEGIN
DECLARE tempFN VARCHAR (100);
DECLARE tempLN VARCHAR (100);
DECLARE CURSOR_1 CURSOR FOR SELECT FIRST_NAME , LAST_NAME FROM CUSTOMER;
OPEN CURSOR_1 ;
REPEAT FETCH CURSOR_1 INTO tempFN,tempLN;
UNTIL tempLN = 'SCOTT'
END REPEAT ;
SELECT tempFN AS FIRST_NAME , tempLN AS LAST_NAME;
CLOSE CURSOR_1;
END;
// DELIMITER ;

CALL CURSOR_GetName();

drop procedure CURSOR_;

DELIMITER //
CREATE PROCEDURE CURSOR_()
BEGIN
DECLARE A VARCHAR (100);
DECLARE B VARCHAR (100);
DECLARE CURSOR_1 CURSOR FOR SELECT FIRST_NAME , LAST_NAME FROM CUSTOMER;
OPEN CURSOR_1 ;
REPEAT FETCH CURSOR_1 INTO A,B;
UNTIL B = 0
END REPEAT ;
SELECT A AS FIRST_NAME , B AS LAST_NAME;
CLOSE CURSOR_1;
END;
// DELIMITER ;




 SELECT FIRST_NAME , LAST_NAME FROM CUSTOMER
WHERE LAST_NAME = 'SCOTT' ;

CREATE USER 'Preetha'@'localhost' IDENTIFIED BY 'preetha123';
GRANT ALL PRIVILEGES ON *.* TO 'Preetha'@'localhost' WITH GRANT OPTION;
use sys;
select * from sys_user;

select user();











