Gem::Specification.new do |s|
  s.author = "Ryan Scott Lewis"
  s.email = "c00lryguy@gmail.com"
  s.homepage = "http://github.com/c00lryguy/fancy_logger"

  s.description = "An easily customizable logger with style."
  s.summary = "Simplify your logging."
  
  s.require_paths = ["lib"]
  
  s.name = File.basename(__FILE__, ".gemspec")
  s.version = File.read("VERSION")
  
  s.files = Dir['{bin,examples,lib,spec,test}/**/*']
  
  %W{Gemfile.lock *.gemspec README.* README Rakefile VERSION *.thor LICENSE LICENSE.*}.each do |file|
    s.files.unshift(file) if File.exists?(file)
  end
  
  %W{README.* README VERSION LICENSE LICENSE.*}.each do |file|
    (s.extra_rdoc_files ||= []).unshift(file) if File.exists?(file)
  end
  
  # If you only specify one application file in executables, that file becomes 
  # the default executable. Therefore, you only need to specify this value if you 
  # have more than one application file. 
  # 
  # Remove this whole section if you do not have any binaries within your project.
  if s.executables.length > 1
    if exe = s.executables.find { |e| e.include?(File.basename(__FILE__, ".gemspec")) }
      s.default_executable = exe
    else
      s.default_executable = s.executables.first
    end
  end
  
  s.test_files = Dir['{examples,spec,test}/**/*']
  
  # Add dependencies here:
  # This is required for your gem to work:
  # s.add_dependency("some_required_gem", "~> 0.1.0")
  # This is required for developers to build and test your gem:
  s.add_dependency("rainbow", "~> 1.1.3")
  s.add_dependency("outline", "~> 0.1.5")
  s.add_development_dependency("rspec", "~> 2.6.0")
  s.add_development_dependency("at", "~> 0.1.2")
end