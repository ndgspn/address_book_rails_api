class AddFullNameAndEmailToPerson < ActiveRecord::Migration[7.0]
  def change
    add_column :people, :full_name, :string
    add_column :people, :email, :string
  end
end
