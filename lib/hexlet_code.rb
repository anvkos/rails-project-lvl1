# frozen_string_literal: true

require_relative 'hexlet_code/version'

module HexletCode
  class Error < StandardError; end

  class Tag
    def self.build(name, **attrs)
      attributes = attrs.map { |k, v| "#{k}=\"#{v}\"" }.join(' ')
      tag = "#{name} #{attributes}".strip
      "<#{tag}>"
    end
  end
end
