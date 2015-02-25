module SmartAleck
  class CategoryIndexer
    attr_reader :category_hash

    def self.index(categories)
      new(categories).category_hash
    end

    def initialize(categories)
      @category_hash =
        categories.map {|category| 2 ** (category.try(:id) || category).to_i}.
        inject(:|).to_i
    end
  end
end
