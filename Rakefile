require 'rake'
require 'fileutils'

task "default" => [:install]

desc "install the dot file into home"
task :install do
  files = Dir.glob("**/*", File::FNM_DOTMATCH).reject{|a| a =~ /.git/ or a =~ /(README.md)|(Rakefile)/ }
  replace_all = false
  files.each do |file|
    FileUtils.mkdir_p "#{ENV['HOME']}/#{File.dirname(file)}" if file =~ /\//
    p file
    next if File.directory? file
    if File.exists? "#{ENV['HOME']}/#{file}" and not replace_all and not FileUtils.cmp(file, "#{ENV['HOME']}/#{file}")
      system("/usr/bin/diff -u #{ENV['HOME']}/#{file} #{Dir.pwd}/#{file}")
      puts "#{file} exists, (r)eplace, (a)ll, (c)ancel"
      unless ENV['force'] == 'true'
        case $stdin.gets.chomp
        when 'a'
          replace_all = true
          replace_file(file)
        when 'r'
          replace_file(file)
        when 'c'
          exit
        else 
          puts "skipping #{file}"
        end
      end
    else
      replace_file(file)
    end 
  end
end

def replace_file(file)
  FileUtils.cp file, "#{ENV['HOME']}/#{file}" unless File.directory? "#{ENV['HOME']}/#{file}"
end
