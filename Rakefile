require_relative 'lib/jruby_art/version'

def create_manifest
  title =  'Implementation-Title: rpextras (java extension for JRubyArt)    '        
  version =  format('Implementation-Version: %s', JRubyArt::VERSION)
  file = File.open('MANIFEST.MF', 'w') do |f|
    f.puts(title)
    f.puts(version)
  end
end

task default: [:init, :compile, :gem, :test]

desc 'Create Manifest'
task :init do
  create_manifest
end

desc 'Build gem'
task :gem do
  sh "gem build jruby_art.gemspec" 
end

desc 'Compile'
task :compile do
  sh "mvn package"
  sh "mv target/rpextras.jar lib"
end

desc 'Test'
task :test do
  sh "jruby test/deglut_spec_test.rb"
  sh "jruby test/vecmath_spec_test.rb"
  sh "jruby test/math_tool_test.rb"
  sh "jruby test/helper_methods_test.rb"
  sh "jruby test/aabb_spec_test.rb"
  # ruby "test/k9_run_test.rb" un-comment to run sketch tests
end

desc 'clean'
task :clean do
  Dir['./**/*.%w{jar gem}'].each do |path|
    puts "Deleting #{path} ..."
    File.delete(path)
  end
  FileUtils.rm_rf('./target')
end
