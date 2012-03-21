require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "anu-ldap"
    gem.summary = "A Ruby library for querying the ANU LDAP server."
    gem.email = "david.porter@anu.edu.au"
    gem.homepage = "https://doiweb-repo2.anu.edu.au/repositories/es-projects/anu-auth"
    gem.authors = ["David Porter"]
    gem.add_dependency "net-ldap"
    gem.files = FileList["lib/**/*.rb", "bin/*", '[A-Z]*', 'spec/**/*']
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end
