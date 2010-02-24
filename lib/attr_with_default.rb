# http://snippets.dzone.com/posts/show/4382

module AttrWithDefault
  
  module ClassMethods
    
    def attr_accessor(*args)
      attrs, attrs_with_defaults = split_for_last_hash(args)
      attrs_with_defaults.each do |name, default|
        attr_reader_with_default name, default
        attr_writer              name
      end
      
      super(*attrs)
    end
    
    def attr_reader(*args)
      attrs, attrs_with_defaults = split_for_last_hash(args)
      attrs_with_defaults.each do |name, default|
        attr_reader_with_default name, default
      end
      
      super(*attrs)
    end
    
  private
    
    def attr_reader_with_default(name, default)
      define_method(name) do
        unless instance_variable_defined?("@#{name}")
          instance_variable_set "@#{name}", default
        end
        instance_variable_get "@#{name}"
      end
    end
    
    def split_for_last_hash(args)
      if args.last.is_a?(Hash)
        [args[0...-1], args.last]
      else
        [args, {}]
      end
    end
    
  end
  
  def self.included(other_module)
    other_module.extend ClassMethods
  end
  
end