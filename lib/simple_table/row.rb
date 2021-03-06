module SimpleTable
  class Row < Tag
    self.level = 2
    self.tag_name = :tr

    attr_reader :cells, :block

    def initialize(parent, record = nil, options = {}, &block)
      @parent = parent
      @options = options
      @cells = []
      @block = block
    end

    def cell(*contents)
      options = contents.last.is_a?(Hash) ? contents.pop : {}
      if parent.is_a?(Body)
        add_class!(options, current_column_class)
        add_header!(options, current_column_id)
      end
      contents.each do |content|
        cells << Cell.new(self, content, options)
      end
    end

    def render(record = nil, options = {})
      @options.merge!(options)
      build(record) if block
      super(cells.map(&:render))
    end

    protected

      def build(record)
        @cells = []
        block.call(*[self, record].compact)
      end

      def alternate(options)
        options[:class] ||= ''
        options[:class] = options[:class].split(' ').push('alternate').join(' ')
      end

      def current_column_class
        column = table.columns[cells.size]
        column && column.options[:class] || ''
      end

      def current_column_id
        column = table.columns[cells.size]
        column && column.options[:id] || ''
      end
  end
end
