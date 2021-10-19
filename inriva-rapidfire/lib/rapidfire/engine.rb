require 'active_model_serializers'

module Rapidfire
  class Engine < ::Rails::Engine
    isolate_namespace Rapidfire
    config.before_initialize do
      config.i18n.load_path += Dir["#{config.root}/config/locales/**/*.yml"]
    end
  end
end