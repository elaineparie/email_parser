require 'pry'
 # require_relative '../../db/raw_emails/2017-11-02-18:58:15.mail'
class EmailParser::Importer


#   attr_accessor :path
#
#
#
# def initialize(path)
#   @path = path
# end


def self.import_files
  files = []
  some_dir = Dir.open "./db/raw_emails"
  # some_dir.delete(".")
  some_dir.each do |file|
    if file != "." && file != ".." && file != ".DS_Store"
      file = File.open("db/raw_emails/#{file}").read
      files << file
    end

  # file = File.absolute_path file # => "/users/andrew/Documents/plans.txt"
  end
# binding.pry
    # use it here

    emails = files
  # emails = files.each do |file|
  #   file = File.open(file, "r")
  #   file.each do |line|
  #     binding.pry
  #   end
  # end
# ["From: Carmella Draeger <carmella@example.com>
# #   To: Celia Prince <celia@example.com>, Alisson Silva <alisson@example.com>
# #   Cc: iyana@example.com
# #   Message-ID: <1@example>
# #   Subject: Meeting
# #   Date: 2 Nov 2017 18:58:15 +0000
# #
# #   Hi both, can you let me know ideal times for meeting please?",
#   "From: Celia Prince <celia@example.com>
#   To: Carmella Draeger <carmella@example.com>
#   Cc: iyana@example.com, Alisson Silva <alisson@example.com>
#   Message-ID: <2@example>
#   In-Reply-To: <1@example>
#   Subject: RE: Meeting
#   Date: 2 Nov 2017 20:38:12 +0000
#
#   Hey Carmella,
#
#   Tuesday would be best for me. I'm otherwise very busy.
#
#   Best,
#   Celia
#
#   > Hi both, can you let me know ideal times for meeting please?
# ",
# "From: Red Hot Deals!!! <promotions@example.com>
# To: Carmella Draeger <carmella@example.com>
# Message-ID: <5@example>
# Subject: Fidget spinners REDUCED TO CLEAR
# Date: 4 Nov 2017 11:22:00 +0000
#
# Check out this deal - available today only!
#
# https://redhot.deals/3f98j23/fidget-spinners-reduced-to-clear",
# "From: Alisson Silva <alisson@example.com>
# To: Carmella Draeger <carmella@example.com>
# Message-ID: <3@example>
# Subject: Re: Meeting
# Date: 2 Nov 2017 20:42:55 +0000
#
# Wide open, literally any day works!
# "]

  EmailParser::Email.group_into_convos(emails)
end

# def import
#   filename = files
#   filename.each do |file|
# Song.new_by_filename(file)
# end
# end



end
