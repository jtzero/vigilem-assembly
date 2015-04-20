source 'https://rubygems.org'

gemspec

def get_local_if_exists(gem_name, path, git, opts={})
  if File.exists?(path)
    opts[:path] ||= path
    gem gem_name, opts 
  else
    opts[:git] ||= git
    gem gem_name, opts
  end
end

args = ARGV.map {|str| str.gsub(/^:source$/, 'source') }

if (args & (excep = ["--without", "source"]) != excep)
  group :source do
    get_local_if_exists("vigilem-support", "../vigilem-support", "https://github.com/jtzero/vigilem-support.git")
    get_local_if_exists("vigilem-core", "../vigilem-core", "https://github.com/jtzero/vigilem-core.git")
    get_local_if_exists("vigilem-dom", "../vigilem-dom", "https://github.com/jtzero/vigilem-dom.git")
    get_local_if_exists("vigilem-win32_api-stat",  "../vigilem-win32_api-stat", "https://github.com/jtzero/vigilem-win32_api-stat.git")
    get_local_if_exists("vigilem-evdev-stat",  "../vigilem-evdev-stat", "https://github.com/jtzero/vigilem-evdev-stat.git")
    get_local_if_exists("vigilem-x11-stat",  "../vigilem-x11-stat", "https://github.com/jtzero/vigilem-x11-stat.git")
  end
end
