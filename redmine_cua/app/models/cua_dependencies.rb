class CuaDependencies < ActiveRecord::Base
  unloadable
  
  belongs_to :project

  scope :by_project, lambda {|project| where("project_id = ?", project.id)}


  def do_update
  	return self.state == 'update'
  end

  def do_remove
  	return self.state == 'remove'
  end

end
