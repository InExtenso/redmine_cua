class CuaProjectSecurityIssuesController < ApplicationController
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

  	@security_issues = CuaSecurityIssues.by_project(@project).order(@field+" "+@order)

  	@states = CuaSecurityIssues.by_project(@project).group(:state).count
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
    
  	@security_issues = CuaSecurityIssues.all.order(@field+" "+@order)

  	@states = CuaSecurityIssues.group(:state).count
  end
end
