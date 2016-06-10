class CreateCuaDependencies < ActiveRecord::Migration
  def change
    create_table :cua_dependencies do |t|
      t.integer :project_id
      t.string :library
      t.string :version
      t.string :state
      t.string :to_library
      t.string :to_version
      t.boolean :deprecated
      t.datetime :updated_at
    end
  end
end
