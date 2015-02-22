module Optionally
  module Required
    private
    def check_required_options(candidate, *required_keys)
      required_keys.each do |key|
        unless candidate.keys.include?(key)
          raise ArgumentError.new("#{key} is required")
        end
      end
    end
  end
end
