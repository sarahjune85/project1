class AddPositionToBoards < ActiveRecord::Migration[6.1]
  def change
    add_column :boards, :position, :integer
  end
end
