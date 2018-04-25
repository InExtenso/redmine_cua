class CreateCuaSecurityIssues < ActiveRecord::Migration
  def change
    create_table :cua_security_issues do |t|
      t.integer :project_id
      t.string :library
      t.string :version
      t.string :state
      t.text   :details
      t.datetime :updated_at
    end
  end
end
