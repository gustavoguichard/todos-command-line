Feature: We can add new tasks
  As a busy developer with a lot of things to do
  I want to keep a list of tasks I need to work on

  Scenario: Add a new task
    Given the file "/tmp/todo.txt" doesn't exist
    When I successfully run `todo -f /tmp/todo.txt new 'A new task'`
    Then I successfully run `todo -f /tmp/todo.txt list`
    And the stdout should contain "A new task"
