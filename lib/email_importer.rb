require 'pry'
class EmailImporter

  attr_accessor :path



def initialize(path)
  binding.pry
  @path = path
end


# def files
#   Dir["#{path}/*.mp3"].collect do |file|
#     array = file.split('mp3s/')
#     array[1]
#   end
# end

# def import
#   filename = files
#   filename.each do |file|
# Song.new_by_filename(file)
# end
# end



end
