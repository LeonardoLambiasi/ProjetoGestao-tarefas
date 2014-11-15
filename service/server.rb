require 'sinatra'
require 'sqlite3'
require 'json'

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
    db.results_as_hash = true
    rows = db.execute("SELECT id, name FROM postit")
    rows.each do |row|
        puts row
        postits.push({:name => row["name"], :id => row["id"]})
    end
    response = 404
    response = postits.to_json if postits.size > 0
    response
end

post '/postits' do
    request.body.rewind
    postit = JSON.parse request.body.read
    db.execute("INSERT INTO postit (name) VALUES (?)", [postit["name"]])
    rows = db.execute("SELECT id FROM postit WHERE name=? ORDER BY id DESC LIMIT ?", [postit["name"], 1])
    postit["id"] = rows[0][0]
    postit.to_json
end


