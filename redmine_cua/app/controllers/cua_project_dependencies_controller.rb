class CuaProjectDependenciesController < ApplicationController
  unloadable

  before_filter :find_project_by_project_id, :authorize, :only => [:index]

  def index

    @field = params[:field]

    @order = params[:order]

    if @field.nil?
      @field = "project_id"
    end

    if @order.nil?
      @order = "ASC"
    end

  	@dependencies = CuaDependencies.by_project(@project).order(@field+" "+@order)

  	@states = CuaDependencies.by_project(@project).group(:state).count
  end

  def indexall

    @field = params[:field]

    @order = params[:order]

    if @field.nil?
      @field = "project_id"
    end

    if @order.nil?
      @order = "ASC"
    end
    
  	@dependencies = CuaDependencies.all.order(@field+" "+@order)

  	@states = CuaDependencies.group(:state).count
  end
end
