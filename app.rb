require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'


set :database, {adapter: "sqlite3", database: "barbershop.db"}

class Posts  < ActiveRecord::Base

end
#before do
	# индициализация БД
#	init_db
#end


# 	@db.execute 'create table if not exists Comments
# 	(
# 		id INTEGER PRIMARY KEY AUTOINCREMENT,
# 		created_date DATE,
# 		content TEXT,
# 		post_id integer


get '/' do
	# выбираем список постов из БД

	# @results = @db.execute 'select * from Posts order by id desc'

	erb :index			
end

# обработчик get-запроса /new
# (браузер получает страницу с сервера)

get '/new' do
	erb :new
end

# обработчик post-запроса /new
# (браузер отправляет данные на сервер)

post '/new' do
	# получаем переменную из post-запроса
	content = params[:content]
	username= params[:user]

	hash={:content=>'Enter content',:user=>'Enter you name'}

	hash.each do |key,value|
		if params[key]==''
			@error=hash[key]
			return erb :new
		end
	end

	# сохранение данных в БД

	# @db.execute 'insert into Posts (user,content, created_date) values (?,?, datetime())', [username,content]

	# # перенаправление на главную страницу

	# redirect to '/'
end

# вывод информации о посте

get '/details/:post_id' do

	# получаем переменную из url'a
	post_id = params[:post_id]

	# получаем список постов
	# # (у нас будет только один пост)
	# results = @db.execute 'select * from Posts where id = ?', [post_id]
	
	# # выбираем этот один пост в переменную @row
	# @row = results[0]

	# # выбираем комментарии для нашего поста
	# @comments = @db.execute 'select * from Comments where post_id = ? order by id', [post_id]

	# возвращаем представление details.erb
	erb :details
end

# обработчик post-запроса /details/...
# (браузер отправляет данные на сервер, мы их принимаем) 

# post '/details/:post_id' do
	
# 	# получаем переменную из url'a
# 	post_id = params[:post_id]

# 	# получаем переменную из post-запроса
# 	content = params[:content]	

# 	# сохранение данных в БД

# 	@db.execute 'insert into Comments
# 		(
# 			content,
# 			created_date,
# 			# post_id
# 		)
# 			values
# 		(
# 			?,
# 			datetime(),
# 			?
# 		)', [content, post_id]

# 	# перенаправление на страницу поста

# 	redirect to('/details/' + post_id)
# end