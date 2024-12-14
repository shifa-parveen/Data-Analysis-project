create database OLA;
use OLA;
select * from bookings;

# 1. Retrieve all successful bookings:
select * from bookings where Booking_Status ='Success';

# 2. Find the average ride distance for each vehicle type:
select Vehicle_Type , avg(Ride_Distance) as average_ride_distance from bookings
group by Vehicle_Type order by average_ride_distance desc;

# 3. Get the total number of cancelled rides by customers:
select count(*) as total_no_cancelled_rides from bookings 
where Booking_Status ='Canceled by Customer';

# 4. List the top 5 customers who booked the highest number of rides:
select Customer_ID, count(Booking_ID) as total_number_of_rides from bookings 
group by Customer_ID order by total_number_of_rides Desc limit 5;

# 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
select count(Canceled_Rides_by_Driver) as total_rides_cancelled_by_drivers
from bookings 
where Canceled_Rides_by_Driver = 'Personal & Car related issue';

# 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
select max(Driver_Ratings) as maximum_driver_ratings ,min(Driver_Ratings) as minimum_driver_ratings
 from bookings where Vehicle_Type =' Prime Sedan ';

# 7. Retrieve all rides where payment was made using UPI:
select * from bookings where Payment_Method = 'UPI';

# 8. Find the average customer rating per vehicle type:
select Vehicle_Type, avg(Customer_Rating) as average_customer_ratings
 from bookings group by Vehicle_Type;

# 9. Calculate the total booking value of rides completed successfully:
select  sum(Booking_value) as total_successfull_booking_value from bookings 
where Booking_Status =' Success';

# 10. List all incomplete rides along with the reason:
select Booking_ID , Incomplete_Rides_Reason from bookings where Incomplete_Rides = 'Yes';






















