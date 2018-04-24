class CuaSetting < ActiveRecord::Base
  unloadable

  ## Relations
  belongs_to :project

  attr_accessible :lock_path, :check_update, :check_security, :php_bin

  ## Validations
  validates :project_id, presence: true, uniqueness: true
  #validates :url,        presence: true

end
