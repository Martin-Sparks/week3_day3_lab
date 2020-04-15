require ('pg')
require_relative('../db/sql_runner')
require_relative('albums')

class Artist

    attr_reader :id, :artist_name

    def initialize( options )
        @id = options['id'].to_i if options['id']
        @artist_name = options['artist_name']
    end

    def save()
        sql = "INSERT INTO artist
        (
            artist_name)
            VALUES
            ($1)
            RETURNING id"
            values = [@artist_name]
            result = SqlRunner.run(sql, values)
            @id = result[0]["id"].to_i 
    end

    def albums_by_artist()
        sql = "SELECT * FROM albums WHERE id = $1"
        values = [@id]
        results = SqlRunner.run(sql, values)
        return results.map {|album| Albums.new(album)}
    end

    def self.all()
        sql = "SELECT * FROM artist"
        artists = SqlRunner.run(sql)
        return artists.map {|artist| Artist.new(artist)}
    end

    def self.delete_all()
        sql = "DELETE FROM artist"
        SqlRunner.run(sql)
    end

end