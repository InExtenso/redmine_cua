# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html

get '/cua', 		 :to => 'cua_project_dependencies#indexall'
get '/cua_security', :to => 'cua_project_security_issues#indexall'

scope 'projects/:project_id' do
  get 'cua',         		to: 'cua_project_dependencies#index'
  get 'cua_security',       to: 'cua_project_security_issues#index'

  put 'cua_settings/save'

end