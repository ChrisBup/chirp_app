database_url = ENV['DATABASE_URL'] || 'postgres://localhost/chirp_app'
ActiveRecord::Base.establish_connection(database_url)
