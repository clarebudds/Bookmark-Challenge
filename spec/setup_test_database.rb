require 'pg'
  def setup_test_database
    p "Setting up test database..."

    connection = PG.connect(dbname: 'bookmark_manager_test')

    connection.exec("TRUNCATE bookmarks;")
  end

#line 1: require 'pg' to connect to the database 
#Line 7: clears the bookmarks table using the TRUNCATE command which deletes data inside a table
# (as tests need to run against an empty database)