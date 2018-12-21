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
  files = Dir["/db/raw_emails.mail"].each {|file| require file }
  binding.pry
end

# def import
#   filename = files
#   filename.each do |file|
# Song.new_by_filename(file)
# end
# end



end
