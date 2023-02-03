class AddPosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts, id: :uuid, temporal: true do |t|
      t.string :title

      t.timestamps
    end

    create_table :comments, id: :uuid, temporal: true do |t|
      t.references :post, type: :uuid, foreign_key: true
      t.string :title

      t.timestamps
    end
  end
end
