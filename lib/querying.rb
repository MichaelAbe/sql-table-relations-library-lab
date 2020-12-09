def select_books_titles_and_years_in_first_series_order_by_year
  "SELECT books.title, books.year
  FROM books
  WHERE series_id = 1
  ORDER BY year"
end

def select_name_and_motto_of_char_with_longest_motto
  "SELECT characters.name, characters.motto
  FROM characters
  ORDER BY LENGTH(motto) DESC limit 1;"
end


def select_value_and_count_of_most_prolific_species
  "SELECT characters.species, COUNT(*)
  FROM characters 
  GROUP BY characters.species
  ORDER BY COUNT(characters.species) DESC limit 1 "
end

def select_name_and_series_subgenres_of_authors
  "SELECT authors.name, subgenres.name
  FROM authors JOIN series
  ON series.author_id = authors.id
  JOIN subgenres
  ON series.subgenre_id = subgenres.id;"
end

def select_series_title_with_most_human_characters
  "SELECT series.title
  FROM series
  JOIN books
  ON books.series_id = books.id
  JOIN character_books
  ON character_books.id = characters.id
  JOIN characters
  ON characters.id = character_books.character_id
  WHERE characters.species = 'human'
  GROUP BY series.title
  ORDER BY COUNT(*) ASC LIMIT 1;
  "
end
#series, books, character_books, characters.species
def select_character_names_and_number_of_books_they_are_in
  "SELECT characters.name, COUNT(books.title)
  FROM series
  JOIN books
  ON series.id = books.series_id
  JOIN character_books
  ON character_books.book_id = books.id
  JOIN characters
  ON characters.id = character_books.character_id
  GROUP BY characters.name
  ORDER BY COUNT(books.title) DESC, characters.name ASC;
  "
end

# --series (id, title, author_id, subgenre_id)
# CREATE TABLE series(
#     id INTEGER PRIMARY KEY,
#     title TEXT,
#     author_id TEXT,
#     subgenre_id TEXT
# );
# --subgenres (id, name)
# CREATE TABLE subgenres (
#     id INTEGER PRIMARY KEY,
#     name TEXT
# );
# --authors (id, name)
# CREATE TABLE authors (
#     id INTEGER PRIMARY KEY,
#     name TEXT
# );
# --books (id, title, year, series_id)
# CREATE TABLE books (
#     id INTEGER PRIMARY KEY,
#     title TEXT,
#     year INTEGER,
#     series_id INTEGER
# );
# --characters (id, name, motto, species, author_id)
# CREATE TABLE characters (
#     id INTEGER PRIMARY KEY,
#     name TEXT,
#     motto TEXT, 
#     species TEXT, 
#     author_id INTEGER  
# );
# --character_books (id, book_id, character_id) 
# CREATE TABLE character_books (
#     id INTEGER PRIMARY KEY,
#     book_id INTEGER,
#     character_id INTEGER
# );