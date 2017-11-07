class AddPaidToQuestions < ActiveRecord::Migration[5.1]
  def change
    add_column :questions, :paid, :boolean
  end
end
