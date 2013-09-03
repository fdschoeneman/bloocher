guard 'bundler' do
  watch('Gemfile')
end

group :tests do 

  guard :minitest, all_on_start: false, spring: true, bundler: false do

    watch(%r{^test/factories/(.+)\.rb})                    { 'test/factories_test.rb' }
    watch(%r{^test/(.*)\/?test_(.*)\.rb})
    watch(%r{^test/support/(.+)\.rb})      { 'test' }
    watch(%r{^test/test_helper\.rb})      { 'test' }
    watch(%r{^test/.+_test\.rb})

    watch(%r{^lib/(.*/)?([^/]+)\.rb})     { |m| "test/#{m[1]}test_#{m[2]}.rb" }
    watch(%r{^app/(.+)\.rb})                               { |m| "test/#{m[1]}_test.rb" }
    watch(%r{^app/controllers/application_controller\.rb}) { 'test' }
    watch(%r{^app/controllers/(.+)_controller\.rb})        { |m| "test/features/#{m[1]}_test.rb" }
    watch(%r{^app/views/(.+)_mailer/.+})                   { |m| "test/mailers/#{m[1]}_mailer_test.rb" }
    watch(%r{^lib/(.+)\.rb})                               { |m| "test/lib/#{m[1]}_test.rb" }
  end
end

guard 'livereload' do

  watch(%r{app/views/.+\.(erb|haml|slim)$})
  watch(%r{app/assets/javascripts/.+\.(js|handlebars|hbs|emblem|)*$}) { |m| "assets/#{m[1]}" }
  watch(%r{app/helpers/.+\.rb})
  watch(%r{public/.+\.(css|js|html)})
  watch(%r{config/locales/.+\.yml})
  watch(%r{(app|vendor)(/assets/\w+/(.+\.(css|js|html))).*}) { |m| "/assets/#{m[3]}" }
end

