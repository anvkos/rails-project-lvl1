# frozen_string_literal: true

require 'test_helper'

class HexletCodeTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_it_build_single_tag
    assert { ::HexletCode::Tag.build('br') == '<br>' }
    assert { ::HexletCode::Tag.build('hr') == '<hr>' }
  end

  def test_it_build_single_tag_with_attributes
    assert { ::HexletCode::Tag.build('img', src: 'path/to/image') == '<img src="path/to/image">' }
    assert { ::HexletCode::Tag.build('input', type: 'submit', value: 'Save') == '<input type="submit" value="Save">' }
  end
end
