class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text "body", null: false
      t.bigint 'post_id'
      t.bigint "user_id"
      t.index ["user_id"], name: "index_comments_on_user_id"
      t.index ["post_id"], name: "index_comments_on_post_id"

      t.timestamps
    end
  end
end
