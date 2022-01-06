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
JOIN albums
ON albums.band_id = bands.id
GROUP BY bands.id; -- can also gropu by bands.name