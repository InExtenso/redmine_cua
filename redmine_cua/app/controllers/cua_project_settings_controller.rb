class CuaProjectSettingsController < ApplicationController
  unloadable

  # Redmine ApplicationController method
  before_filter :find_project_by_project_id
  before_filter :load_cua_settings


  def save
    unless params[:cua_setting].nil?
      if @cua_setting.update_attributes(params[:cua_setting])
        flash[:notice] = l(:notice_settings_updated)
      else
        flash[:error] = @cua_setting.errors.full_messages.to_sentence
      end
    end
    redirect_to settings_project_path(@project, 'cua')
  end



  private


    def load_cua_settings
      @cua_setting = @project.cua_setting
    end

end
