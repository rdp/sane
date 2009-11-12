if RUBY_VERSION < '1.9.2'
  class Float
    def inspect
      "%.20f" % self # big!
    end
  end
end