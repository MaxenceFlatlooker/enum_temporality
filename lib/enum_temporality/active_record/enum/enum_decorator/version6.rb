# frozen_string_literal: true

# Defines enum temporality methods for Rails 6
module EnumDecorator
  # Defines 4 new methods on enum:
  #   - status_before_value? on instance that returns true if the enum is before given value
  #   - status_after_value? on instance that returns true if the enum is after given value
  #   - status_before_value a scope that returns all record where enum is before given value
  #   - status_after_value a scope that returns all record where enum is after given value
  module Version6
    def enum(definitions)
      enum_temporality = definitions.delete(:_temporality)
      super(definitions)

      define_temporality_methods(definitions) if enum_temporality
    end

    private

    def define_temporality_methods(definitions)
      klass = self
      enum_prefix = definitions.delete(:_prefix)
      enum_suffix = definitions.delete(:_suffix)
      enum_scopes = definitions.delete(:_scopes)
      definitions.each do |name, values|
        attr = attribute_alias?(name) ? attribute_alias(name) : name
        _enum_methods_module.module_eval do
          pairs = values.respond_to?(:each_pair) ? values.each_pair : values.each_with_index
          pairs.each do |label, value|
            if enum_prefix == true
              prefix = "#{name}_"
            elsif enum_prefix
              prefix = "#{enum_prefix}_"
            end
            if enum_suffix == true
              suffix = "_#{name}"
            elsif enum_suffix
              suffix = "_#{enum_suffix}"
            end
            value_method_name = "#{prefix}#{label}#{suffix}"

            # def status_before_value?() status.before_type_case < 0 end
            klass.send(:detect_enum_conflict!, name, "#{name}_before_#{value_method_name}?")
            define_method("#{name}_before_#{value_method_name}?") { send("#{attr}_before_type_cast") < value }

            # def status_after_value?() status.before_type_case > 0 end
            klass.send(:detect_enum_conflict!, name, "#{name}_after_#{value_method_name}?")
            define_method("#{name}_after_#{value_method_name}?") { send("#{attr}_before_type_cast") > value }

            next unless enum_scopes != false

            # scope :status_before_value, -> { where("status < 0") }
            klass.send(:detect_enum_conflict!, name, "#{name}_before_#{value_method_name}", true)
            klass.scope "#{name}_before_#{value_method_name}", -> { where(attr => ...value) }

            # scope :status_after_value, -> { where.not("status < 0") }
            klass.send(:detect_enum_conflict!, name, "#{name}_after_#{value_method_name}", true)
            klass.scope "#{name}_after_#{value_method_name}", -> { where.not(attr => ..value) }
          end
        end
      end
    end
  end
end
