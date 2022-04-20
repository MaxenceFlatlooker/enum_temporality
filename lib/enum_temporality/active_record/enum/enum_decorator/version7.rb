# frozen_string_literal: true

# WIP: Defines enum temporality methods for Rails 6
module EnumDecorator
  # WIP: defines no methods for now
  module Version7
    def enum(name = nil, values = nil, **options)
      super

      define_temporality_methods(name, values, **options) if options.include?(:_temporality)
    end

    private

    def define_temporality_methods(name = nil, values = nil, **options)
      # TODO: define temporality methods here
    end
  end
end
