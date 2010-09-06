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
    gem.add_dependency "ruby-net-ldap"
    gem.add_development_dependency "rspec", ">= 1.2.9"
    gem.files = FileList["lib/**/*.rb", "bin/*", '[A-Z]*', 'spec/**/*']
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

require 'spec/rake/spectask'
Spec::Rake::SpecTask.new(:spec) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.spec_files = FileList['spec/**/*_spec.rb']
end

Spec::Rake::SpecTask.new(:rcov) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :spec => :check_dependencies

task :default => :spec

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "anu-ldap #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
