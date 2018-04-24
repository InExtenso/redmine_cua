
## Set up autoload of patches
Rails.configuration.to_prepare do

  ## Redmine Jenkins Libs and Patches
  rbfiles = Rails.root.join('plugins', 'redmine_cua', 'lib', 'redmine_cua', '**', '*.rb')
  Dir.glob(rbfiles).each do |file|
    # Exclude Redmine Views Hooks from Rails loader to avoid multiple calls to hooks on reload in dev environment.
    require_dependency file
  end

	# HAML gem
  #Haml::Template.options[:attr_wrapper] = '"'
	
end
