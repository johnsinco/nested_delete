require "nested_delete/version"

module NestedDelete
  refine Hash do
    def nested_delete!(*keys)
      keys.each {|k| self.delete(k)}
      self.values.each {|v| NestedDelete.has_it?(v) && v.nested_delete!(*keys) }
      self
    end
  end

  refine Array do
    def nested_delete!(*keys)
      self.each {|v| NestedDelete.has_it?(v) && v.nested_delete!(*keys)}.delete_if {|v| Array(v).empty?}
      self
    end
  end

  def self.has_it?(obj)
    obj.is_a?(Hash) || obj.is_a?(Array)
  end
end
