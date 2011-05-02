# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard 'bundler' do
  watch('Gemfile')
  # Uncomment next line if Gemfile contain `gemspec' command
  # watch(/^.+\.gemspec/)
end

guard 'livereload' do
  watch(%r{app/.+\.(erb|haml)})
  watch(%r{app/helpers/.+\.rb})
  watch(%r{public/.+\.(css|js|html)})
  watch(%r{config/locales/.+\.yml})
end

guard 'spork' do
  watch('config/application.rb')
  watch('config/environment.rb')
  watch(%r{^config/environments/.*\.rb$})
  watch(%r{^config/initializers/.*\.rb$})
  watch('spec/spec_helper.rb')
end

guard 'rspec', :cli => "--drb" do
	# Regexp watch patterns are matched with Regexp#match
	watch(%r{^spec/.+_spec\.rb})
	watch(%r{^spec/factories/(.*)\.rb})
	watch(%r{^lib/(.+)\.rb})         { |m| "spec/lib/#{m[1]}_spec.rb" }
	watch(%r{^spec/models/.+\.rb})   { ["spec/models", "spec/acceptance"] }
	watch(%r{^spec/.+\.rb})          { `say hello` }

	# String watch patterns are matched with simple '=='
	watch('spec/spec_helper.rb') { "spec" }
end

