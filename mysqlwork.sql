mysql -v < Chinook_MySql_AutoIncrementPKs.sql  
--Import database

use Chinook; 
--Use database

show databases; 
--Show all databases

select Name from MediaType;
select Name from Artist;

desc Genre; 
--See properties of Genre

tee LogFile.txt 
--Log all commands to LogFile.txt
notee 
--Stop all logging

source test.sql 
--Use test.sql script to execute commands

JOIN Artist ON Album.ArtistId; = Artist.ArtistId 
--Joins Album and Artist my ArtistId

INSERT INTO Genre (Name) VALUES (’Trad’); 
--Inserts a new field (Trad) into Genre

SELECT LAST_INSERT_ID(); 
--Shows the Id of the last field created

SELECT Name FROM Genre WHERE GenreId = 27; 
--Shows field with Id(27) from Genre

DELETE FROM Genre WHERE Name = ‘Traditional’; 
--Deletes the field with the Id ‘Traditional’ from Genre

select * from Track; 
--Will show all 3503 rows in Track

select * from Track where Composer = "U2"; 
--Will show all 44 rows that have U2 as te Composer

select * from Album where AlbumId = "232"; 
--Will show the album with the albumId 232

select FirstName, LastName, Title from Employee where Title = "IT Staff";
--Shows the first and last name of everyone from employee with the title IT Staff

select * from Track INNER JOIN Album on Track.AlbumId = Album.AlbumId;
--The join pulls in the rows from the track table.
--Then for each row, it adds the data from the album table.



--Select all of the data for every `Track` record across 
--both the `Track` and `Album` tables
select * from Track
INNER JOIN Album on Track.AlbumId = Album.AlbumId;

--Select the Track's Name, the Album's Title and the Artist's ArtistId for every
--`Track` record across both the `Track` and `Album` tables
select Name, Title, ArtistId from Track
INNER JOIN Album on Track.AlbumId = Album.AlbumId;

--Use MySQL's aliases to display friendlier column names
select Name as Track, Title as Album, ArtistId from Track
INNER JOIN Album on Track.AlbumId = Album.AlbumId;

--Instead of just getting the Artist's ID, we'll do an additional join
--to get the Artist's name from the `Artist` table
SELECT Track.Name as Track, Title as Album, Album.ArtistId, Artist.Name as Artist from Track
INNER JOIN Album on Track.AlbumId = Album.AlbumId
INNER JOIN Artist on Album.ArtistId = Artist.ArtistId;

--Show all of the Track names, album titles and artist name where the artist's name
--is "U2"
SELECT Track.Name as Track, Title as Album, Artist.Name as Artist FROM Track
INNER JOIN Album on Track.AlbumId = Album.AlbumId
INNER JOIN Artist on Album.ArtistId = Artist.ArtistId
WHERE Artist.Name = "U2";

--Show all of the Track names, album titles and artist name where the artist's name
--is "U2" and the name of the track is "Pride (In The Name Of Love)"
SELECT Track.Name as Track, Title as Album, Artist.Name as Artist FROM Track
INNER JOIN Album on Track.AlbumId = Album.AlbumId
INNER JOIN Artist on Album.ArtistId = Artist.ArtistId
WHERE Artist.Name = "U2" AND Track.Name = "Pride (In The Name Of Love)";

--Show all of the track names, album titles, and artist names where the track name
--is "Believe"
SELECT Track.Name as Track, Title as Album, Artist.Name as Artist FROM Track
INNER JOIN Album on Track.AlbumId = Album.AlbumId
INNER JOIN Artist on Album.ArtistId = Artist.ArtistId
WHERE Track.Name = "Believe";

--Select every track name and the track's associated media type
SELECT Track.Name, MediaType.Name FROM Track 
INNER JOIN MediaType on Track.MediaTypeId = MediaType.MediaTypeId;

--Select every track name and the track's associated genre, where the
--name of the genre is "Jazz"
select Track.Name, Genre.Name from Track
INNER JOIN Genre on Track.GenreId = Genre.GenreId
WHERE Genre.Name = "Jazz";

--Select every track name and the track's associated media type and genre, where the name of the mdeia type is 
--"Protected AAC audio file" and the genre is "Soundtrack"
select Track.Name, MediaType.Name, Genre.Name from Track
INNER JOIN Genre on Track.GenreId = Genre.GenreId
INNER JOIN MediaType on Track.MediaTypeId = MediaType.MediaTypeId
WHERE MediaType.Name = "Protected AAC audio file" and Genre.Name = "Soundtrack";

--Filter to only show results for the 'Grunge' playlist
SELECT Playlist.Name AS Playlist, Track.Name AS Track, Album.Title AS Album, Artist.Name AS Artist FROM Playlist
INNER JOIN PlaylistTrack ON Playlist.PlaylistId = PlaylistTrack.PlaylistId
JOIN Track ON PlaylistTrack.TrackId = Track.TrackId
JOIN Album ON Track.AlbumId = Album.AlbumId
JOIN Artist on Album.ArtistId = Artist.ArtistId
WHERE Playlist.Name = 'Grunge';

--Shows PLaylist with only one track
SELECT Playlist.Name as Playlist, COUNT(*) From Playlist INNER JOIN PlaylistTrack on Playlist.PlaylistId = PlaylistTrack.PlaylistId  GROUP BY Playlist HAVING count(*) = 1;

--Order albums by Title
select * from Album
order by Title;

--Order by Title decending
select * from Album
order by Title desc;

--Order by ArtistId and Title
select * from Album
order by ArtistId, Title;

--Order by Ablum title and track name
select Track.Name, Album.Title from Track
inner join Album on Track.AlbumId = Album.AlbumId
order by Album.Title, Track.Name;

select InvoiceDate, BillingCity, Total from Invoice
order by Total desc
limit 5;

select InvoiceDate, BillingAddress, Total from Invoice
order by InvoiceDate desc;

select EmployeeId, LastName, FirstName, HireDate from Employee
order by HireDate desc, EmployeeId desc
limit 3;

SELECT 
    concat(Customer.FirstName, " ", Customer.LastName) as Name,
    Invoice.InvoiceDate as Date,
    Invoice.Total
FROM Invoice
INNER JOIN Customer ON Invoice.CustomerId = Customer.CustomerId
ORDER BY Total DESC, InvoiceDate DESC
LIMIT 10;