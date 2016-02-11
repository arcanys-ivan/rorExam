class CreateCommentsTable < ActiveRecord::Migration
  def change
    create_table :comments do |t|
    	t.string :post_id
			t.text :message
			t.integer :user_id

			t.timestamps
    end
  end
end
