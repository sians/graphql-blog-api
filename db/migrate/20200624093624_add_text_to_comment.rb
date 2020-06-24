class AddTextToComment < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :text, :text
  end
end
