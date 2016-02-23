class CreateFigures < ActiveRecord::Migration
  def change
    create_table :figures do |t|
      t.string :name

      t.timestamp null: false
    end
  end
  
end
