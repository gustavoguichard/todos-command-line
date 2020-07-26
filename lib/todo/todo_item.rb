# frozen_string_literal: true

class TodoItem < Struct.new(:name, :created_at, :index, :completed_at)
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

  def print
    printf("%3d - %s\n", index, name)
    printf("        Created: %s\n", created_at)
    printf("        Completed: %s\n", completed_at) unless completed_at.nil?
  end

  def print_csv
    puts [index, name, complete_flag, created_at, completed_at].join(',')
  end
end
