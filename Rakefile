# -*- encoding: utf-8 -*-
task default: [:compile, :test]

desc 'Compile'
task :compile do
  sh 'mvn package'
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
