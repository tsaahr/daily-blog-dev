class CreateLearningPosts < ActiveRecord::Migration[8.0]
  def change
    create_table :learning_posts do |t|
      t.string :title
      t.text :content
      t.boolean :public
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
