require 'mister/railtie' if defined?(Rails)

module Mister
  # @return [String] The base path of the Mister library, mister.
  def self.library_root
    @library_root ||= File.dirname(__FILE__)
  end
end
