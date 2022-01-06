-- 1:
CREATE TABLE songs (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(400) NOT NULL,
  length FLOAT NOT NULL,
  album_id INT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (album_id) REFERENCES albums(id)
);

-- 2:
SELECT bands.name AS 'Band Name'
FROM bands;

-- 3:
SELECT * FROM albums
WHERE release_year IS NOT NULL
ORDER BY release_year
LIMIT 1;

-- 4:
SELECT bands.name AS 'Band Name'
FROM bands
JOIN albums ON albums.band_id = bands.id
GROUP BY bands.id; -- can also group by bands.name or albums.band_id

-- or (assuming all bands have a unique name)
SELECT DISTINCT bands.name AS 'Band Name'
FROM bands
JOIN albums ON bands.id = albums.band_id;

-- 5:
SELECT bands.name AS 'Band Name'
FROM bands
LEFT JOIN albums ON bands.id = albums.band_id
GROUP BY bands.id
HAVING COUNT(albums.id) = 0;

-- 6:
SELECT
  albums.name AS 'Name',
  albums.release_year AS 'Release Year',
  SUM(songs.length) AS 'Duration'
FROM albums
JOIN songs ON albums.id = songs.album_id
GROUP BY albums.id
ORDER BY Duration DESC
LIMIT 1;

-- 7:
UPDATE albums
SET release_year = 1986
WHERE release_year IS NULL AND id = 4; -- don't technically need the first WHERE clause

-- 8:
INSERT INTO bands (name)
VALUES ('Parquet Courts');

INSERT INTO albums (name, release_year, band_id)
VALUES ('Human Performance', 2016, 8);

-- 9:
DELETE FROM albums WHERE id = 19;
DELETE FROM bands WHERE id = 8;

-- 10:
SELECT AVG(length) AS 'Average Song Duration'
FROM songs;

-- 11:
SELECT
  albums.name AS 'Album',
  albums.release_year AS 'Release Year',
  MAX(songs.length) AS 'Duration'
FROM albums
JOIN songs ON songs.album_id = albums.id
GROUP BY albums.id;

-- 12:
SELECT
  bands.name AS 'Band',
  COUNT(songs.id) AS 'Number of Songs'
FROM bands
JOIN albums ON albums.band_id = bands.id
JOIN songs on songs.album_id = albums.id
GROUP BY bands.id;
