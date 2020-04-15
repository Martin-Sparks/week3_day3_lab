DROP TABLE IF EXISTS albums;
DROP TABLE IF EXISTS artist;

CREATE TABLE artist(
  id SERIAL PRIMARY KEY,
  artist_name VARCHAR(255)
);

CREATE TABLE albums (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255),
  genre VARCHAR(255),
  artist_id INT REFERENCES artist(id)
);

