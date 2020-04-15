require ('pg')
require_relative('../db/sql_runner')

class Albums

    attr_reader :id, :title, :genre, :artist_id

    def initialize( options )
        @id = options['id'].to_i if options['id']
        @title = options['title']
        @genre = options['genre']
        @artist_id = options['artist_id'].to_i
    end

    def save()
        sql = "INSERT INTO albums
        (
            title,
            genre,
            artist_id
            ) 
            VALUES
            ($1, $2, $3)
            RETURNING id"
            values = [@title, @genre, @artist_id]
            result = SqlRunner.run(sql, values)
            @id = result[0]['id'].to_i
    end
    
    def artist_by_album()
        sql = "SELECT * FROM artist WHERE id = $1"
        values = [@artist_id]
        artist = SqlRunner.run(sql, values)[0]
        return Artist.new(artist)
    end

    def self.all()
        sql = "SELECT * FROM albums"
        albums = SqlRunner.run(sql)
        return albums.map {|album| Albums.new(album)}
    end

    def self.delete_all()
        sql = "DELETE FROM albums"
        SqlRunner.run(sql)
    end

end