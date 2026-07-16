require 'rubygems'
require 'bundler/gem_tasks'

begin
  require 'bundler'
rescue LoadError
  warn 'You must install bundler - run `gem install bundler`'
end

begin
  Bundler.setup
rescue Bundler::BundlerError => e
  warn e.message
  warn 'Run `bundle install` to install missing gems'
  exit e.status_code
end
require 'rake'

require 'rake/testtask'
Rake::TestTask.new do |t|
  t.libs << 'test'
  t.test_files = FileList['test/*_test.rb']
  t.verbose = true
end

require 'rdoc/task'
RDoc::Task.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ''

  rdoc.main = 'README.md'
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "yet-another-yet-another-ruby-tcl #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

RUBY_TCL_SPEC = Bundler.load_gemspec('tcl.gemspec')

require 'rubocop/rake_task'

RuboCop::RakeTask.new do |task|
  task.fail_on_error = false
end

require 'rake/extensiontask'
Rake::ExtensionTask.new('tcl_ext', RUBY_TCL_SPEC)
CLEAN.include %w[**/*.{o,bundle,jar,so,obj,pdb,lib,def,exp,log} pkg/ tmp/]

task default: %i[compile test rubocop]
