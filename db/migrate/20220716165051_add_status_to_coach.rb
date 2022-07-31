class AddStatusToCoach < ActiveRecord::Migration[6.1]
  def change
    add_column :coaches, :status, :string
  end
end
