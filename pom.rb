require 'fileutils'
project 'protected_method', 'https://github.com/monkstone/protected_method' do

  model_version '4.0.0'
  id 'monkstone:protected', '1.0'
  packaging 'jar'

  description 'protected for jdk9'

  organization 'monkstone', 'https://monkstone.github.io'

  developer 'monkstone' do
    name 'Martin Prout'
    email 'mamba2928@yahoo.co.uk'
    roles 'developer'
  end

  properties(
    'protected.basedir' => '${project.basedir}',
    'maven.compiler.source' => '1.8',
    'project.build.sourceEncoding' => 'UTF-8',
    'maven.compiler.target' => '1.8',
    'polyglot.dump.pom' => 'pom.xml',
  )

  plugin_management do
    plugin :resources, '2.6'
    plugin :dependency, '2.8'
    plugin(
      :compiler, '3.7.0',
      source: '${maven.compiler.source}',
      target: '${maven.compiler.target}'
    )
  end
  build do
    default_goal 'package'
    source_directory '${protected.basedir}'
    final_name 'protected'
  end
end
