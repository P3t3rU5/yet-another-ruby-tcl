require_relative 'lib/tcl/version'

Gem::Specification.new do |s|
  s.name = 'yet-another-ruby-tcl'
  s.version = Tcl::VERSION
  s.platform = Gem::Platform::RUBY
  s.authors = ['Sam Stephenson', 'Mark J. Titorenko', 'Pedro Miranda']
  s.email = 'pedro.at.miranda@gmail.com'
  s.homepage = 'http://github.com/p3t3ru5/yet-another-ruby-tcl'
  s.metadata['homepage_uri'] = s.homepage
  s.metadata['source_code_uri'] = s.homepage
  s.metadata['rubygems_mfa_required'] = 'true'
  s.summary = 'A minimal Ruby interface to libtcl.'
  s.description = 'Bindings to the Tcl interpreter for use from within ruby.'
  s.required_ruby_version = '>= 3.0.0'
  s.extra_rdoc_files = %w[LICENSE README.md]
  s.extensions = ['ext/tcl_ext/extconf.rb']

  s.files         = `git ls-files`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.require_paths = ['lib']
end

