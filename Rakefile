require 'fileutils'

task default: [:setup, :compile, :install, :test]

desc 'Setup'
task :setup do
  sh 'mkdir -p lib'
end

desc 'Compile'
task :compile do
  sh 'mvn package'
end

desc 'Install'
task :install do
  sh 'mv target/protected.jar lib'
end

task :test do
  sh "jruby -Xbacktrace.style=full ruby_protected.rb"
end

desc 'clean'
task :clean do
  Dir['./**/*.%w{jar gem}'].each do |path|
    puts 'Deleting #{path} ...'
    File.delete(path)
  end
  FileUtils.rm_rf('./target')
end
