class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.string :title
      t.text :text
      t.string :lang_from
      t.string :lang_to
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
