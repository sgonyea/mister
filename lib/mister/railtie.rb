module Mister
  class Railtie < ::Rails::Railtie

    rake_tasks {
      load Mister.library_root.join('mister/tasks/mister.rake').to_s
    }

    initializer 'mister.defaults' {
      # @todo: Do.
    }

  end
end
