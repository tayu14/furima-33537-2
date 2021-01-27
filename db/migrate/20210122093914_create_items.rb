class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :goods_name,             null: false
      t.text :goods_explanation,        null: false
      t.integer :category_id,           null: false
      t.integer :status_id,             null: false
      t.integer :prefecure_money_id,    null: false
      t.integer :prefecure_id,          null: false
      t.integer :scheduled_delivery_id, null: false
      t.integer :price,                 null: false
      t.references :user,               foreign_key: true

      t.timestamps
    end
  end
end
