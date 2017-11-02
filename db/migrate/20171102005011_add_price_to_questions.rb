class AddPriceToQuestions < ActiveRecord::Migration[5.1]
  def change
    add_column :questions, :price, :float
  end
end
