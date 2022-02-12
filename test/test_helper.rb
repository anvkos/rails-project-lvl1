# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'hexlet_code'
require 'bundler/setup'
Bundler.require
require 'minitest/autorun'

def read_fixture_file(filename)
  File.read(
    File.join(
      File.expand_path('fixtures', File.dirname(__FILE__)),
      filename
    )
  )
end
