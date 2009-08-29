module Enumerable  
   EXTRA_VERSION = '0.1.0'

   alias old_map map
   alias old_collect collect
=begin unused as it clashes with rails' own #sum
  apparently
  C:\dev\ruby\bridal>ruby test\functional\store_controller_test.rb
test/functional/../test_helper
C:/dev/ruby/bridal/config/../lib/sane-0.1.4/lib/enumerable-extra.rb:12:in `+': can't convert String into Array (TypeError)
        from C:/dev/ruby/bridal/config/../lib/sane-0.1.4/lib/enumerable-extra.rb:12:in `sum'
        from C:/dev/ruby/bridal/config/../lib/sane-0.1.4/lib/enumerable-extra.rb:12:in `each'
        from C:/dev/ruby/bridal/config/../lib/sane-0.1.4/lib/enumerable-extra.rb:12:in `sum'
        from C:/dev/ruby/bridal/vendor/rails/actionpack/lib/action_controller/layout.rb:189:in `layout_list'

2.1

   # Returns the numeric total of the elements of +enum+, using +total+ as
   # an accumulator (0 by default). Raises an error if any of the elements
   # are non-numeric.
   #
   def sum(total = 0)
      each{ |val| total += val }
      total
   end
=end

   # Returns a new array containing the results of running +method+ once for
   # every element in the enumerable object. If both arguments and a block
   # are provided the arguments are processed first, then passed to
   # the block.
   #
   # If no method is provided, then it behaves as the standard MRI method.
   #
   # Examples:
   #
   #  array = ['foo', 'bar']
   #
   #  # No arguments
   #  array.map(:capitalize) => ['Foo', 'Bar']
   #
   #  # With arguments
   #  array.map(:+, 'x') => ['foox', 'barx']
   #
   #  # With arguments and a block
   #  array.map(:capitalize){ |e| e + 'x' } => ['Foox', 'Barx']
   #
   def map(method=nil, *args, &block)
      if method
         array  = []
         method = method.to_sym unless method.is_a?(Symbol)

         each{ |obj|
            temp = obj.send(method, *args)
            if block
               array << block.call(temp)
            else
               array << temp
            end
         }

         array
      else
         old_map(&block)
      end
   end

   # Reset the aliases
   alias collect map
end

class Array
   alias old_map map
   alias old_map! map!
   alias old_collect collect
   alias old_collect! collect!
   #alias old_select select

   # Returns a new array containing the results of running +block+ once for
   # every element in the +array+.
   #
   # Examples:
   #
   #  array = ['foo', 'bar']
   #
   #  # No arguments
   #  array.map(:capitalize) => ['Foo', 'Bar']
   #
   #  # With arguments
   #  array.map(:+, 'x') => ['foox', 'barx']
   #
   #  # With arguments and a block
   #  array.map(:capitalize){ |e| e + 'x' } => ['Foox', 'Barx']
   #--
   # The Array class actually has its own implementation of the +map+ method,
   # hence the duplication.
   # 
   def map(method=nil, *args, &block)
      if method
         array  = []
         method = method.to_sym unless method.is_a?(Symbol)

         each{ |obj|
            temp = obj.send(method, *args)
            if block
               array << block.call(temp)
            else
               array << temp
            end
         }
         array
      else
         old_map(&block)
      end
   end

   # Same as Array#map, but modifies the receiver in place. Also note that
   # a block is _not_ required. If no block is given, an array of values
   # is returned instead
   #
   def map!(method=nil, *args, &block)
      self.replace(map(method, *args, &block))
   end

=begin
   def select(method=nil, condition = nil, *args, &block)
      array = [] unless block
      if method
         if block
            warn 'block ignored when arguments provided'
         end

         if condition.nil?
            raise 'condition must be provided if method is provided'
         end

         method = method.to_sym unless method.is_a?(Symbol)

         each{ |obj|
            if args.length > 0
               if obj.send(method, condition, *args)
                  array << obj
               end
            else
               if obj.send(method, condition)
                  array << obj                  
               end
            end
         }

         return array
      else
         old_select(&block)   
      end
   end
=end

   # Reset the aliases
   alias collect map
   alias collect! map!
end
