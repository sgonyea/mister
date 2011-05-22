require 'active_support'
require 'pathname'
require 'mister/railtie' if defined?(Rails)

module Mister
  # @return [Pathname] The base path of the Mister library, mister.
  def self.library_root
    @library_root ||= Pathname(__FILE__)
  end

  # @return [Pathname] The root path to the mapreduce scripts
  def root
    @root ||= Rails.root.join("app", "mapreduces")
  end

  # @return [Pathname] The root path to the mapreduce scripts
  def root=(value)
    Framework.default_framework = nil
    @root = Pathname(value.to_s)
  end
end
