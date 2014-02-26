class AddInviterToGuests < ActiveRecord::Migration
  def change
    add_column :guests, :inviter, :string
  end
end
