class AddDetailsToRecettes < ActiveRecord::Migration[5.2]
  def change
    add_column :recettes, :cuisson, :integer
    add_column :recettes, :preparation, :integer
    add_column :recettes, :difficulté, :string
  end
end
