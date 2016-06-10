class CuaProjectDependenciesController < ApplicationController
  unloadable

  before_filter :find_project_by_project_id, :authorize, :only => [:index]

  def index
  	@dependencies = CuaDependencies.by_project(@project)

  	@states = CuaDependencies.by_project(@project).group(:state).count
  end

  def indexall
  	@dependencies = CuaDependencies.all

  	@states = CuaDependencies.group(:state).count
  end
end
