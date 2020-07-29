# frozen_string_literal: true

module Todo
  TodoItem = Struct.new(:name, :created_at, :index, :completed_at) do
    def initialize(name, created_at = Time.now, index = nil, completed_at = nil)
      super
    end

    def complete?
      !completed_at.nil?
    end

    def complete!
      self.completed_at = completed_at.nil? ? Time.now : nil
    end

    def complete_flag
      complete? ? 'DONE' : 'INCOMPLETE'
    end

    def to_s
      "#{name},#{created_at},#{completed_at}"
    end
  end
end
