# frozen_string_literal: true

module HexletCode
  class Tag
    SINGLE_TAGS = %w[br hr img input].freeze

    def self.build(name, **attrs, &_block)
      attributes = attrs.map { |k, v| "#{k}=\"#{v}\"" }.join(' ')
      tag = "#{name} #{attributes}".strip
      return "<#{tag}>" if SINGLE_TAGS.include?(name)

      content = ''
      content = yield if block_given?
      "<#{tag}>#{content}</#{name}>"
    end
  end
end
