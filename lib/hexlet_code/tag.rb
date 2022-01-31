# frozen_string_literal: true

module HexletCode
  class Tag
    def self.build(name, **attrs)
      attributes = attrs.map { |k, v| "#{k}=\"#{v}\"" }.join(' ')
      tag = "#{name} #{attributes}".strip
      "<#{tag}>"
    end
  end
end
