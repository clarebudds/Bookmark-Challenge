require 'pg'

class Bookmark
  def self.create(url:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end
  
    connection.exec("INSERT INTO bookmarks (url) VALUES('#{url}')")
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end

    result = connection.exec('SELECT * FROM bookmarks')
    result.map { |bookmark| bookmark['url'] }
  end
end

#line 1: require 'pg' to connect to the database
#line 5: determines which database we should connect to
#so if we run rspec where ENV is set to test(in spec_helper.rb), our bookmark class connects to bookmark_manager_test
#line 12: maps over the result variable to return the urls of the bookmarks