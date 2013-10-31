assets_task = 'assets:precompile'

Rake::Task[assets_task].enhance do
  require "tinymce/rails/asset_installer"

  config   = Rails.application.config
  target   = File.join(Rails.public_path, config.assets.prefix)
  manifest = config.assets.manifest

  assets = Pathname.new(File.expand_path(File.join(File.dirname(__FILE__),
    "../../vendor/assets/javascripts/tinymce/plugins/uploadimage")))

  # tinymce-rails 5c8e83a changes how the AssetInstaller initialize method
  # works. To preserve backward compatibility, we check the amount of
  # arguments it expects.
  TinyMCE::Rails::AssetInstaller.new(assets, target, manifest).install
end
