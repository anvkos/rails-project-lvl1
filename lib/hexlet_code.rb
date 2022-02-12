# frozen_string_literal: true

require_relative 'hexlet_code/version'
require_relative 'hexlet_code/tag'

module HexletCode
  class Error < StandardError; end

  def self.form_for(_object, options = {}, &_block)
    url = options[:url] || '#'
    fields = ''
    fields = yield self if block_given?
    Tag.build('form', action: url, method: 'post') { fields }
  end
end
