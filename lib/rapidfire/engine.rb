require 'active_model_serializers'

module Rapidfire
  class Engine < ::Rails::Engine
    # engine_name 'rapidfire'
    isolate_namespace Rapidfire
    config.before_initialize do
      config.i18n.load_path += Dir["#{config.root}/config/locales/**/*.yml"]
    end
    config.to_prepare do
      Dir.glob(Rails.root + "app/decorators/**/*_decorator*.rb").each do |c|
        require_dependency(c)
      end
      end
  end
end