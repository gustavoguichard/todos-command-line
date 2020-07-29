# frozen_string_literal: true

require 'terminal-table'
require 'time'
require 'rainbow'

module Todo
  module Format
    class Table
      def initialize
        @table = Terminal::Table.new headings: %w[id name created completed]
        @table.align_column 0, :right
      end

      def format(task)
        color = task.complete? ? :green : :default
        row = []
        row << task.index
        row << task.name
        row << as_date(task.created_at)
        row << Rainbow(task.complete?).color(color)
        @table << row
      end

      def after
        puts @table.to_s
      end

      private

      def as_date(date)
        Time.parse(date).strftime('%Y-%m-%d')
      end
    end
  end
end
