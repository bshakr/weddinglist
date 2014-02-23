class AddFieldsToGuests < ActiveRecord::Migration
  def change
    add_column :guests, :number_of_guests, :integer
    add_column :guests, :reception, :boolean
    add_column :guests, :international, :boolean
  end
end
