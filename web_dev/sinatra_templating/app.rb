# require gems
require 'sinatra'
require 'sqlite3'

set :public_folder, File.dirname(__FILE__) + '/static'

db = SQLite3::Database.new("students.db")
db.results_as_hash = true

# show students on the home page
get '/' do
  @students = db.execute("SELECT * FROM students")
  erb :home
end

get '/students/new' do
  erb :new_student
end

# create new students via
# a form
post '/students' do
  db.execute("INSERT INTO students (name, campus, age) VALUES (?,?,?)", [params['name'], params['campus'], params['age'].to_i])
  redirect '/'
end

# add static resources

get '/students/comment' do
  @comments = db.execute('SELECT * FROM comments')
  erb :comment
end

post '/students/comment/new' do
  student = db.execute("SELECT * FROM students WHERE name = ?", [params['name']])[0]
  db.execute('INSERT INTO comments (comments, student_id) VALUES (?,?)', [params['comments'],student['id']])
  redirect '/'
end

get '/students/:campus' do
  @campus = params['campus']
  @students = db.execute("SELECT * FROM students WHERE campus = ?", [params['campus']])
  erb :students_by_campus
end