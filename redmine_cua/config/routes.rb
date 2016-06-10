# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html

get '/projects/:project_id/cua', :to => 'cua_project_dependencies#index'
get '/cua', :to => 'cua_project_dependencies#indexall'
