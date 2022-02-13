# frozen_string_literal: true

require_relative 'hexlet_code/version'

module HexletCode
  autoload(:Tag, 'hexlet_code/tag.rb')
  autoload(:Builder, 'hexlet_code/builder.rb')

  class Error < StandardError; end

  def self.form_for(object, options = {}, &_block)
    url = options[:url] || '#'
    builder = Builder.new(object)
    result = yield builder if block_given?
    fields = result || []
    Tag.build('form', action: url, method: 'post') { fields.join('') }
  end
end
