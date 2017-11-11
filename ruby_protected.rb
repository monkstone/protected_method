require 'java'
require_relative 'lib/protected.jar'

module Fred

  include_package 'monkstone'

  class RubyProtected < Fred::ProtectedSuper

    def initialize
      super
      test_method
    end
  end
end

Fred::RubyProtected.new
