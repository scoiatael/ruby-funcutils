module Funcutils
  class Piper
    def initialize(value)
      @value = value
    end

    def pipe
      @value = yield @value
      self
    end

    def result
      @value
    end

    def >
      pipe(&Proc.new)
    end
  end

end
