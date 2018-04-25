
require 'redmine'

require 'redmine_cua'

Redmine::Plugin.register :redmine_cua do
  name 'Redmine Cua plugin'
  author 'Jean-Baptiste Nahan'
  description 'Redmine plugin for Composer PHP dependencies'
  version '0.1.0'
  url 'http://example.com/path/to/plugin'
  author_url 'http://example.com/about'

  menu :top_menu, :cua_all_menu, { :controller => 'cua_project_dependencies', :action => 'indexall'}, :caption => :all_dependencies
  menu :top_menu, :cua_all_security_menu, { :controller => 'cua_project_security_issues', :action => 'indexall'}, :caption => :all_security_issues

  menu :project_menu, :cua_menu, { :controller => 'cua_project_dependencies', :action => 'index'}, :caption => :dependencies, :after => :activity, :param => :project_id
  menu :project_menu, :cua_security_menu, { :controller => 'cua_project_security_issues', :action => 'index'}, :caption => :security, :after => :dependencies, :param => :project_id
  
  project_module :redmine_cua do
  	permission :project_dependencies, {
  		:cua_project_dependencies => [:index]
  	}
    permission :project_security, {
      :cua_project_security_issues => [:index]
    }

    permission :edit_cua_settings, {:cua_settings => [:save_settings]}
  end
end
