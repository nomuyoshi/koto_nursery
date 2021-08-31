class AddUndisclosedToBorderlines < ActiveRecord::Migration[6.1]
  def change
    add_column :borderlines, :undisclosed, :boolean, null: false, default: false, after: :point
    add_column :borderlines, :less_capacity, :boolean, null: false, default: false, after: :point
  end
end
