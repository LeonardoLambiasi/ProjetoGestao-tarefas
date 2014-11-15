require 'sinatra'
require 'sqlite3'

set :port, 9090
set :bind, '0.0.0.0'

db = SQLite3::Database.new "dashboard.db"

# Create a database
rows = db.execute <<-SQL
  create table if not exists postit (
    id integer primary key autoincrement,
    name varchar(255)
  );
SQL

get '/' do
    redirect '/index.html'
end

get '/postits' do
    postits = []
    stm = db.prepare "SELECT name FROM postit"
    rs = stm.execute
    while (row = rs.next) do
        postits.push(row.join "")
    end
    postits.join ";"
end

post '/postits' do
    @name = params[:name]
    db.execute("INSERT INTO postit (name) 
                VALUES (?)", [@name])
    200
end


