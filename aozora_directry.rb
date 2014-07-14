require 'rubygems'
require 'bundler/setup'
require 'thor'
require 'nokogiri'
require 'open-uri'
require 'fileutils'

class AozoraDirectry < Thor
  option :dir_path, :aliases => '-d', :required => true
  option :book_url, :aliases => '-u', :required => true
  desc "create", "create aozora bunko directry"
  def create()
    dir_path = options[:dir_path]
    url = options[:book_url]

    output = []
    output << "BookUrl: #{url}"
    output << "CreateDirectry: #{dir_path}"
    puts output.join("\n")

    FileUtils.mkdir(dir_path) unless FileTest.exist?(dir_path)
    doc = Nokogiri(open(url))

    line = 1
    doc.at('.main_text').content.split(/\r\n/).each do |text|
      text.split(/[,|.|。|、]/).each do |sentence|
        dir_name = "#{dir_path}/#{line}.#{sentence}"
        FileUtils.mkdir(dir_name) unless FileTest.exist?(dir_name)
        line += 1
      end
    end
  end
end

AozoraDirectry.start(ARGV)
