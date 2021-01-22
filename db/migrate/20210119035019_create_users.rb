class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      add_column :email, :string
      add_index :email, unique: true

      t.timestamps
    end
  end
end
