# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html

get '/cua', :to => 'cua_project_dependencies#indexall'


scope 'projects/:project_id' do
  get 'cua',         to: 'cua_project_dependencies#index'

  put 'cua_settings/save'

end