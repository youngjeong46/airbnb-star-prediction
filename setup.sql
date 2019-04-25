CREATE DATABASE airbnb;

\connect airbnb;

CREATE TABLE seattle(
  id INT,
  listing_url TEXT,
  scrape_id INT,
  last_scraped TEXT,
  title TEXT,
  summary TEXT,
);

\copy seattle FROM 'listings.csv' DELIMITER ',' CSV HEADER;


