require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'


set :database, {adapter: "sqlite3", database: "leprosorium.db"}

class Posts  < ActiveRecord::Base
end

class Comments < ActiveRecord::Base
end

#before do
	# индициализация БД
#	init_db
#end


get '/' do
	# выбираем список постов из БД

	# @comments=Posts.all

	erb :index			
end


get '/new' do
	erb :new
end

post '/new' do
		p = Posts.new params[:post]
  		p.save


	 erb "<h2>Спасибо,вы записаны</h2>"
	# redirect to '/'
end

# вывод информации о посте

get '/details/:post_id' do

	# получаем переменную из url'a
	# post_id = params[:post_id]

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