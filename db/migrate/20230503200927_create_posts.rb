class CreatePosts < ActiveRecord::Migration[7.0]
  def change
  	create_table :posts do |p|
  		p.text :name
  		p.text :content

  		p.timestamps
  	end
  end
end
