class CreateLink < ActiveRecord::Migration[6.0]
  def change
    create_table :links do |t|
      t.string :long_url, null: false
      t.string :short_url, null: false
      t.timestamps null: false
    end
  end
end
