module Todo
  module Format
    class CSV
      def format(task)
        puts [task.index, task.name, task.complete_flag, task.created_at, task.completed_at].join(',')
      end

      def after; end
    end
  end
end
