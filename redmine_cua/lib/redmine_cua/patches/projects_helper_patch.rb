require_dependency 'projects_helper'

module RedmineCua
  module Patches
    module ProjectsHelperPatch

      def self.included(base)
        base.send(:include, InstanceMethods)
        base.class_eval do
          unloadable

          alias_method_chain :project_settings_tabs, :redmine_cua
        end
      end


      module InstanceMethods

        def project_settings_tabs_with_redmine_cua(&block)
          tabs = project_settings_tabs_without_redmine_cua(&block)
          tabs.push({
            :name    => 'cua',
            :action  => :edit_cua_settings,
            :partial => 'projects/settings/redmine_cua',
            :label   => :label_cua
          })
          tabs.select {|tab| User.current.allowed_to?(tab[:action], @project)}
          tabs
        end

      end

    end
  end
end

unless ProjectsHelper.included_modules.include?(RedmineCua::Patches::ProjectsHelperPatch)
  ProjectsHelper.send(:include, RedmineCua::Patches::ProjectsHelperPatch)
end
