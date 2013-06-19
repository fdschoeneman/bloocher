require 'rbconfig'
HOST_OS = RbConfig::CONFIG['host_os']
  
guard 'sass', :input => 'sass', :output => 'css'

guard 'bundler' do
  watch('Gemfile')
end

guard 'spork', bundler: true, rspec_env: { 'RAILS_ENV' => 'test' }, wait: 200 do
  watch('Gemfile.lock')
  watch('config/application.rb')
  watch('config/environment.rb')
  watch('config/environments/test.rb')
  watch(%r{^config/initializers/.+\.rb$})
  watch('spec/spec_helper.rb') { :rspec }
  watch('spec/turnip_helper.rb')
  watch(%r{^spec/acceptance/steps/.+\.rb$})
  watch(%r{^lib/turnip/.+\.rb$})
end

group 'livereload' do

  guard 'livereload' do
    watch(%r{app/.+\.(erb|haml)})
    watch(%r{app/views/.+\.(erb|haml|slim)$})
    watch(%r{app/helpers/.+\.rb})
    watch(%r{(public/|app/assets).+\.(css|js|html)})
    watch(%r{(app|vendor)/assets/\w+/(.+\.(css|js|html)).*})  { |m| "/assets/#{m[2]}" }
    watch(%r{config/locales/.+\.yml})
  end
end

group 'tests' do 

  guard 'rspec', turnip: true, parallel: true, zeus: true, bundler: false, all_on_start: false, all_after_pass: false  do

    # factories
    watch(%r{^spec/factories/*}) { "spec/factories_spec.rb" }

    # acceptance tests
    watch(%r{^spec/acceptance/(.+)\.feature$})
    watch(%r{^spec/acceptance/steps/(.+)_steps\.rb$})   { |m| Dir[File.join("**/#{m[1]}.feature")][0] || 'spec/acceptance' }
    watch(%r{^spec/acceptance/steps/*/(.+)_steps\.rb$}) { |m| Dir[File.join("**/#{m[1]}.feature")][0] || 'features' }

    # model & controller tests
    watch(%r{^spec/.+_spec\.rb$})
    watch(%r{^lib/(.+)\.rb$})     { |m| "spec/lib/#{m[1]}_spec.rb" }
    watch('spec/spec_helper.rb')  { "spec" }
    watch('spec/turnip_helper.rb')  { "spec/acceptance" }
    watch(%r{^app/(.+)\.rb$})                           { |m| "spec/#{m[1]}_spec.rb" }
    watch(%r{^app/(.*)(\.erb|\.haml)$})                 { |m| "spec/#{m[1]}#{m[2]}_spec.rb" }
    watch(%r{^app/controllers/(.+)_(controller)\.rb$})  { |m| ["spec/routing/#{m[1]}_routing_spec.rb", "spec/#{m[2]}s/#{m[1]}_#{m[2]}_spec.rb", "spec/acceptance/#{m[1]}_spec.rb"] }
    watch(%r{^spec/support/(.+)\.rb$})                  { "spec" }
    watch('config/routes.rb')                           { "spec/routing" }
    watch('app/controllers/application_controller.rb')  { "spec/controllers" }

    # Capybara request specs
    watch(%r{^app/views/(.+)/.*\.(erb|haml)$})          { |m| "spec/requests/#{m[1]}_spec.rb" }
  end
end