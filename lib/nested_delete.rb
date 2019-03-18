require "nested_delete/version"

module NestedDelete
  refine Hash do
    def nested_delete!(*keys)
      # keys = Array(keys)
      keys.each {|k| self.delete(k)}
      self.values.each {|v| (v.is_a?(Hash) || v.is_a?(Array)) && v.nested_delete!(*keys) }
      self
    end
  end
end
