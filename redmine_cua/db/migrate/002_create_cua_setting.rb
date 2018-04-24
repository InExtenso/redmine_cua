class CreateCuaSetting < ActiveRecord::Migration
  def change
    create_table :cua_settings do |t|
      t.integer :project_id
      t.string :lock_path
      t.boolean :check_update
      t.boolean :check_security
      t.string :php_bin
    end
  end
end
