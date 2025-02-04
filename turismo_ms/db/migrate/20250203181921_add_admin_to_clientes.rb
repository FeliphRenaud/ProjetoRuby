class AddAdminToClientes < ActiveRecord::Migration[7.2]
  def change
    add_column :clientes, :admin, :boolean,default: false, null: false
  end
end
