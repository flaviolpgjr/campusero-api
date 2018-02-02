module Campusero
  class Engine < ::Rails::Engine
    isolate_namespace Campusero
    config.generators.api_only = true
  end
end
