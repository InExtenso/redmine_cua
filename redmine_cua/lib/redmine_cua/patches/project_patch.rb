require_dependency 'project'

module RedmineCua
  module Patches
    module ProjectPatch

      def self.included(base)
        base.send(:include, InstanceMethods)
        base.class_eval do
          unloadable

          has_one  :cua_setting, dependent: :destroy
          #has_many :jenkins_jobs,    dependent: :destroy
        end
      end


      module InstanceMethods

        def cua_lock_path
          cua_setting.lock_path
        end
        def cua_check_update
          cua_setting.check_update
        end
        def cua_check_security
          cua_setting.check_security
        end
        def cua_php_bin
          cua_setting.php_bin
        end
      end

    end
  end
end

unless Project.included_modules.include?(RedmineCua::Patches::ProjectPatch)
  Project.send(:include, RedmineCua::Patches::ProjectPatch)
end
