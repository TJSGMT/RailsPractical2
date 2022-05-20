class AddEmployeeRefToAddresses < ActiveRecord::Migration[7.0]
  def change
    add_reference :addresses, :employee
  end
end
