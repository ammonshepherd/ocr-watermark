require "version"
require "thor"

module Ocrwm
  class Cli < Thor
    option :copy, :type => :boolean, :default => false, :desc => "Make a copy of the images."
    option :ocr, :type => :boolean, :default => false, :desc => "OCR the images."
    option :pdf, :type => :boolean, :default => false, :desc => "Create a PDF of the copied images."
    option :water_mark, :type => :boolean, :default => false, :desc => "Watermark the images."
    option :label, :default => "Copyright ©2013 KZ Gedenkstätte Neuengamme"
    desc "go FILENAME", "Make copies, OCR, and watermark images."
    def go(dir=".")
    end
  end
end
