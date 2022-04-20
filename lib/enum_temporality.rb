# frozen_string_literal: true

require_relative "enum_temporality/active_record/enum/enum_decorator"
require "active_record"

# Add new methods on Rails' enums
module EnumTemporality
  ActiveRecord::Enum.prepend(EnumDecorator)
end
