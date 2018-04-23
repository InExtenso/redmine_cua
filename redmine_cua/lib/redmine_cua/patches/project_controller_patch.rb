require_dependency 'projects_controller'

module RedmineCua
  module Patches
    module ProjectsControllerPatch

      def self.included(base)
        base.send(:include, InstanceMethods)
        base.class_eval do
          unloadable

          #helper :cua

          alias_method_chain :settings, :redmine_cua
        end
      end


      module InstanceMethods

        def settings_with_redmine_cua(&block)
          settings_without_redmine_cua(&block)
          if @project.cua_setting.nil?
            @cua_setting = CuaSetting.new
          else
            @cua_setting = @project.cua_setting
          end
        end

      end

    end
  end
end

unless ProjectsController.included_modules.include?(RedmineCua::Patches::ProjectsControllerPatch)
  ProjectsController.send(:include, RedmineCua::Patches::ProjectsControllerPatch)
end
