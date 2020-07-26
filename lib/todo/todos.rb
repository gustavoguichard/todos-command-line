# frozen_string_literal: true

require 'todo/todo_item.rb'
require 'todo/file_utils'

class Todos
  include Todo::FileUtils

  def initialize(filename)
    @filename = filename || TODO_FILE
  end

  def new_task(*tasks)
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

  def todos
    @todos ||= read_todos(@filename)
  end

  def each(*args, &block)
    todos.each(*args, &block)
  end
end
