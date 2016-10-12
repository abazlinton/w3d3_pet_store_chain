class Pet

    attr_reader :id, :name, :type

    def initialize(options)
      @id = options['id']
      @name = options['name']
      @type = options['stock_type']
    end




end