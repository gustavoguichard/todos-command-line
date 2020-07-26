# frozen_string_literal: true

require 'todo/todos.rb'

module Todo
  module FileUtils
    TODO_FILE = 'todos.txt'
    private

    def write_todos(filename, todos, mode = 'w')
      File.open(filename || TODO_FILE, mode) do |file|
        todos.each do |task|
          file.puts task
        end
      end
    end

    def append_todos(filename, todos)
      write_todos(filename, todos, 'a')
    end

    def read_todos(filename)
      todos = []
      File.open(filename || TODO_FILE, 'r') do |file|
        file.readlines.each_with_index do |line, index|
          todos << read_todo(line, index + 1)
        end
      end
      todos
    end

    def read_todo(line, index)
      name, created, completed = line.chomp.split(/,/)
      TodoItem.new(name, created, index, completed)
    end
  end

end
