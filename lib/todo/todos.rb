# frozen_string_literal: true

require 'todo/todo_item.rb'
require 'todo/file_utils'

class Todos
  include Todo::FileUtils

  def initialize(filename)
    @filename = filename
  end

  def new_task(*tasks)
    if tasks.empty?
      puts 'Add one todo by line...'
      tasks = STDIN.readlines.map { |line| line.chomp }
    end
    raise 'You must provide some tasks' if tasks.length.zero?

    new_todos = tasks.map { |task| TodoItem.new(task) }
    append_todos @filename, new_todos
    puts 'Tasks added.'
  end

  def list(options)
    todos.sort! { |a, b| a.name <=> b.name } if options[:s] == 'name'
    todos.each do |todo|
      if options[:format] == 'pretty'
        todo.pretty_print
      else
        todo.print_csv
      end
    end
  end

  def done(*args)
    todos.each_with_index do |todo, index|
      todo.complete! if args.include? (index + 1).to_s
    end
    write_todos(@filename, todos)
  end

  def remove(*args)
    raise 'You must provide some numbers to be removed' if args.length.zero?
    todos.reject! do |todo|
      should_reject = args.include? todo.index.to_s
      puts "Removing #{todo.name}" if should_reject
      should_reject
    end
    write_todos(@filename, todos)
  end

  def todos
    @todos ||= read_todos(@filename)
  end

  def each(*args, &block)
    todos.each(*args, &block)
  end
end
