# frozen_string_literal: true

require 'rainbow'

module Todo
  module Format
    class Pretty
      def format(task)
        color = task.complete? ? :green : :default
        puts Rainbow(sprintf('%3d - %s', task.index, task.name)).color(color).bright
        puts Rainbow(sprintf('        Created: %s', task.created_at)).color(color)
        puts Rainbow(sprintf('        Completed: %s', task.completed_at)).color(color) unless task.completed_at.nil?
      end

      def after; end
    end
  end
end
