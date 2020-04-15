require ('pg')
require_relative('../db/sql_runner')

class Artist

    attr_reader :id, :artist_name

    def initialize( options )
        @id = options['id'].to_i if options['id']
        @artist_name = options['artist_name']
    end


end