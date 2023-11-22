DROP DATABASE MusicDatabase;
CREATE DATABASE IF NOT EXISTS MusicDatabase;
SHOW databases;
USE MusicDatabase;
CREATE TABLE Artists (
    ArtistID INT AUTO_INCREMENT PRIMARY KEY,
    ArtistName VARCHAR(255) NOT NULL,
    BirthYear INT,
    Country VARCHAR(255)
);

CREATE TABLE Albums (
    AlbumID INT AUTO_INCREMENT PRIMARY KEY,
    ArtistID INT,
    AlbumTitle VARCHAR(255) NOT NULL,
    ReleaseYear INT,
    Genre VARCHAR(255),
    FOREIGN KEY (ArtistID) REFERENCES Artists(ArtistID)
);

CREATE TABLE Songs (
    SongID INT AUTO_INCREMENT PRIMARY KEY,
    AlbumID INT,
    SongTitle VARCHAR(255) NOT NULL,
    Duration VARCHAR(10),
    ReleaseYear INT,
    FOREIGN KEY (AlbumID) REFERENCES Albums(AlbumID)
);

CREATE TABLE Genres (
    GenreID INT AUTO_INCREMENT PRIMARY KEY,
    GenreName VARCHAR(255) NOT NULL
);

-- Insert sample data into the Genres table
INSERT INTO Genres (GenreID, GenreName) VALUES
    (1, 'Pop'),
    (2, 'Rock'),
    (3, 'Hip-Hop'), 
    (4, 'R&B'),
    (5, 'Country'),
    (6, 'Electronic'),
    (7, 'Jazz'),
	(8, 'Classical'),
    (9, 'Reggae'),
    (10, 'Hip-Hop/Rap');

-- Insert sample data into the Artists table
INSERT INTO Artists (ArtistName, BirthYear, Country) VALUES
    ('Taylor Swift', 1989, 'USA'),
    ('Ed Sheeran', 1991, 'UK'),
    ('Celine Dion', 1968, 'Canada'),
    ('Adele', 1988, 'UK'),
    ('Bob Marley', 1945, 'Jamaica'),
    ('Michael Jackson', 1958, 'USA'),
    ('Elton John', 1947, 'UK'),
	('Eminem', 1972, 'USA'),
    ('Queen', 1970, 'UK'),
    ('Justin Bieber', 1994, 'Canada'),
    ('Lady Gaga', 1986, 'USA'),
    ('The Beatles', 1960, 'UK'),
    ('Drake', 1986, 'Canada'),
    ('Alicia Keys', 1981, 'USA'),
    ('Coldplay', 1996, 'UK'),
    ('Shawn Mendes', 1998, 'Canada'),
    ('Ariana Grande', 1993, 'USA'),
    ('Led Zeppelin', 1968, 'UK'),
    ('The Weeknd', 1990, 'Canada'),
    ('Katy Perry', 1984, 'USA'),
    ('The Rolling Stones', 1962, 'UK'),
    ('Justin Timberlake', 1981, 'USA'),
    ('Madonna', 1958, 'USA'),
    ('Pink Floyd', 1965, 'UK'),
	('The Who', 1964, 'UK');

-- Insert sample data into the Albums table
INSERT INTO Albums (ArtistID, AlbumTitle, ReleaseYear, Genre) VALUES
   (3, 'Greatest Hits', 1992, 'Rock'),
   (1, 'Love Songs', 2001, 'Pop'),
   (2, 'Golden Memories', 1998, 'Jazz'),
   (1, 'All-Time Classics', 1995, 'Pop'),
   (2, 'Smooth Jazz Experience', 2004, 'Jazz'),
   (3, 'Rock Anthems', 1987, 'Rock'),
    (1, 'Summer Vibes', 2015, 'Pop'),
    (2, 'Late Night Jazz', 2012, 'Jazz'),
    (3, 'Classic Rock Hits', 1980, 'Rock'),
    (1, 'Feel Good Pop', 2018, 'Pop'),
    (2, 'Smooth Jazz Moods', 2014, 'Jazz'),
    (3, 'Legendary Rock Classics', 1975, 'Rock');
    
-- Insert sample data into the Songs table
INSERT INTO Songs (AlbumID, SongTitle, Duration, ReleaseYear) VALUES
    (3, 'Smooth Groove', '3:58', 2010),
    (1, 'Summer Love', '4:15', 2001),
    (2, 'Midnight Serenade', '6:22', 2010),
    (1, 'Feel the Beat', '4:05', 2002),
    (2, 'Smooth Ride', '5:35', 2012),
    (1, 'Dance Party', '3:30', 2003),
    (2, 'Jazzy Dreams', '4:50', 2014),
    (3, 'Classic Rock Jam', '5:15', 1982),
    (1, 'Sunshine Groove', '3:45', 2006),
    (2, 'Smooth Jazz Bliss', '4:25', 2016),
    (3, 'Rock Legends', '4:55', 1978);
show tables;
select *from albums;
select count(*) from albums;
select *from albums order by ReleaseYear;
select *from albums where Genre = "Rock" or Genre= "Pop" order by ReleaseYear desc;
select *from albums;
select distinct * from albums;
select distinct count(*) from albums;
select * from Songs;
select count(*) from Songs;
select * from Songs order by Duration;
select * from Songs order by SongID;
select SongTitle, Duration from Songs where Duration> '4:15' order by Duration;
SELECT AlbumID, COUNT(*) AS 'SongCount' FROM Songs GROUP BY AlbumID;
select *from Artists;
select * from Artists order by BirthYear;
select ArtistName , Country from Artists;
select ArtistID, Country, ArtistName from Artists where Artistname like '%M%' order by BirthYear;
select count(*) from Artists;
select *from Genres;
select count(*) from Genres;
select * from Genres where GenreName like 'R%';
SELECT Artists.ArtistName, Albums.AlbumTitle
FROM Artists
LEFT JOIN Albums ON Artists.ArtistID = Albums.ArtistID;
SELECT Songs.SongTitle, Albums.AlbumTitle, Genres.GenreName
FROM Songs
INNER JOIN Albums ON Songs.AlbumID = Albums.AlbumID
INNER JOIN Genres ON Albums.Genre = Genres.GenreName;
SELECT Artists.ArtistName, COUNT(Albums.AlbumID) AS TotalAlbums
FROM Artists
LEFT JOIN Albums ON Artists.ArtistID = Albums.ArtistID
GROUP BY Artists.ArtistName;
SELECT Artists.ArtistName, SUM(SEC_TO_TIME(TIME_TO_SEC(Songs.Duration))) AS TotalDuration
FROM Artists
LEFT JOIN Albums ON Artists.ArtistID = Albums.ArtistID
LEFT JOIN Songs ON Albums.AlbumID = Songs.AlbumID
GROUP BY Artists.ArtistName;
SELECT Artists.ArtistName, Albums.AlbumTitle, Songs.SongTitle
FROM Artists
INNER JOIN Albums ON Artists.ArtistID = Albums.ArtistID
INNER JOIN Songs ON Albums.AlbumID = Songs.AlbumID;





