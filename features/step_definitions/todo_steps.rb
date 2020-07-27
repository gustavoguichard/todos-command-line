# frozen_string_literal: true

Given(/^the file "([^"]*)" doesn't exist$/) do |file|
  FileUtils.rm(file) if File.exist?(file)
end

Given(/^there is no task list in my home directory$/) do
  step %(the file ".todos.txt" doesn't exist)
end

Then(/^the task list should exist in my home directory$/) do
  step %(a file named ".todos.txt" should exist)
end
