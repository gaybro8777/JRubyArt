require 'fileutils'
project 'rp5extras', 'https://github.com/ruby-processing/JRubyArt' do

  model_version '4.0.0'
  id 'ruby-processing:rp5extras', '1.0.5'
  packaging 'jar'

  description 'rp5extras for JRubyArt'

  organization 'ruby-processing', 'https://ruby-processing.github.io'

  developer 'monkstone' do
    name 'Martin Prout'
    email 'martin_p@lineone.net'
    roles 'developer' 
  end

  issue_management 'https://github.com/ruby-processing/JRubyArt/issues', 'Github'

  source_control(
    :url => 'https://github.com/ruby-processing/JRubyArt',
    :connection => 'scm:git:git://github.com/ruby-processing/JRubyArt.git',
    :developer_connection => 'scm:git:git@github.com/ruby-processing/JRubyArt.git'
  )
  
  properties( 'processing.sketchbook' => '${user.home}/sketchbook3/libraries/video/',
	      'processing.home' => '/usr/share/processing',
              'maven.compiler.source' => '1.8',
              'project.build.sourceEncoding' => 'UTF-8',
              'maven.compiler.target' => '1.8',
              'polyglot.dump.pom' => 'pom.xml',
              'processing.api' => "http://processing.github.io/processing-javadocs/core/",
              'jruby.api' => "http://jruby.org/apidocs/"
            )

  pom 'org.jruby:jruby:9.0.5.0'
  jar( 'org.processing:core',
             :group_id => 'processing.org',
             :artifact_id => 'processing.core',
             :scope => 'system',
             :version => '3.0.2',
             :system_path => '${processing.sketchbook}/library/video.jar' )
  jar( 'org.processing:video',
         :group_id => 'processing.org',
         :artifact_id => 'processing.video',
         :scope => 'system',
         :version => '3.0.2',
	 :system_path => '${processing.home}/core/library/core.jar')
  plugin_management do
    plugin :resources, '2.6'
    plugin :dependency, '2.8'
    plugin( :compiler, '3.3',
          'source' =>  '1.8',
          'target' =>  '1.8' )
    plugin( :javadoc, '2.10.3',
          'detectOfflineLinks' => 'false',
          'links' => ['${processing.api}', '${jruby.api}']
          )
    plugin( :jar, '2.6',
            'archive' => {
              'manifestFile' => 'MANIFEST.MF'
            }
          )
  end
  build do
    default_goal 'package'
    source_directory 'src'
    final_name 'rpextras'
  end
end
