class CuaSecurityIssues < ActiveRecord::Base
  unloadable
  
  belongs_to :project

  scope :by_project, lambda {|project| where("project_id = ?", project.id)}


  def do_secure
  	return self.state == 'open'
  end

end
