# frozen_string_literal: true

require 'test/unit'
require 'mocha/test_unit'
require 'todo/todos'

TMP_FILE = '/tmp/foo.txt'

class TodosTest < Test::Unit::TestCase
  def setup
  end

  def teardown
    STDIN.unstub(:readlines)
    File.delete(TMP_FILE) if File.exist?(TMP_FILE)
  end

  def tests_raises_error_when_no_tasks
    STDIN.stubs(:readlines).returns([])
    ex = assert_raises RuntimeError do
      Todos.new(TMP_FILE).new_task()
    end

    expected = 'You must provide some tasks'
    assert_equal expected, ex.message
  end

  def test_working_with_stdin
    STDIN.stubs(:readlines).returns(['Foo'])
    todos = Todos.new(TMP_FILE)
    todos.new_task()

    assert_match 'Foo', todos.todos.first.name
  end

  def test_working_with_args
    todos = Todos.new(TMP_FILE)
    todos.new_task('Foo', 'Bar')

    assert_match 'Bar', todos.todos[1].name
  end
end
