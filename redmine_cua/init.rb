Redmine::Plugin.register :redmine_cua do
  name 'Redmine Cua plugin'
  author 'Author name'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  url 'http://example.com/path/to/plugin'
  author_url 'http://example.com/about'

  menu :top_menu, :cua_all_menu, { :controller => 'cua_project_dependencies', :action => 'indexall'}, :caption => :all_dependencies
  menu :project_menu, :cua_menu, { :controller => 'cua_project_dependencies', :action => 'index'}, :caption => :dependencies, :after => :activity, :param => :project_id
  
  project_module :redmine_cua do
  	permission :project_dependencies, {
  		:cua_project_dependencies => [:index]
  	}
  end
end
