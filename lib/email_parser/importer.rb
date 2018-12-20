require 'pry'
class EmailParser::Importer

#   attr_accessor :path
#
#
#
# def initialize(path)
#   binding.pry
#   @path = path
# end


def self.create_files
  binding.pry
  Dir["#{path}/*.mail"].collect do |file|
  end
end

# def import
#   filename = files
#   filename.each do |file|
# Song.new_by_filename(file)
# end
# end



end
