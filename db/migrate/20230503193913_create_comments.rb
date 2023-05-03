class CreateComments < ActiveRecord::Migration[7.0]
  def change
  	create_table :comments do |c|
  		c.text :content

  		c.timestamps
  	end
  end
end
