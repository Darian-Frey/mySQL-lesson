select count(*) from Track;
select count(*) from Artist;


select Title, Name from Album join Artist on Album.ArtistId = Artist.ArtistId limit 15;