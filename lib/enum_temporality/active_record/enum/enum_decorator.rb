# frozen_string_literal: true

require_relative "enum_decorator/version7"
require_relative "enum_decorator/version6"
require "active_record"

# Loads correct EnumDecorator according to Rails' version
module EnumDecorator
  case ActiveRecord::VERSION::MAJOR
  when 7
    include EnumDecorator::Version7
  when 6
    include EnumDecorator::Version6
  else
    raise NotImplementedError, "Your ActiveRecord version (#{ActiveRecord::VERSION::STRING}) is not supported"
  end
end
