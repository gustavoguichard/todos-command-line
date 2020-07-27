Given /^the file "([^"]*)" doesn't exist$/ do |file|
  FileUtils.rm(file) if File.exist?(file)
end

When /^I get help for "([^"]*)"$/ do |app_name|
  @app_name = app_name
  step %(I run `#{app_name} help`)
end

# Add more step definitions here
