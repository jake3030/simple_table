module SimpleTable
  class Rows < Tag
    self.level = 1

    attr_reader :rows

    def initialize(parent, options = {})
      @rows = []
      super
    end

    def empty?
      rows.empty?
    end

    def row(*args, &block)
      options = args.extract_options!
      rows << Row.new(self, args.shift, options, &block)
    end
  end
end
