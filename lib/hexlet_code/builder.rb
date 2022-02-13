# frozen_string_literal: true

module HexletCode
  class Builder
    attr_accessor :fields
    attr_reader :object

    def initialize(object = nil)
      @fields = []
      @object = object
    end

    def input(name, options = {})
      value = ''
      value = object.public_send(name) unless object.nil?
      fields << if options[:as] == :text
                  Tag.build('textarea', cols: 20, rows: 40, name: name) { value }
                else
                  Tag.build('input', name: name, type: 'text', value: value)
                end
    end

    def submit(**attrs)
      value = attrs[:value] || 'Save'
      name = attrs[:name] || 'commit'
      fields << Tag.build('input', name: name, type: 'submit', value: value)
    end
  end
end
