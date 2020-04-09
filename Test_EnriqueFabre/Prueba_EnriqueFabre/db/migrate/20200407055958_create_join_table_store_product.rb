class CreateJoinTableStoreProduct < ActiveRecord::Migration[6.0]
  def change
    create_join_table :stores, :products do |t|
      # t.index [:store_id, :product_id]
      # t.index [:product_id, :store_id]
    end
  end
end
