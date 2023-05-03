class CreatePosts < ActiveRecord::Migration[7.0]
  def change 
  	create_table :posts do |item|
  		item.text :content
  		item.text :name
  		item.text :datestamp

  		item.timestamps
  	end
  end
end
