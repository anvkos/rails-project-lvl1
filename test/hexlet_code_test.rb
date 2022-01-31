# frozen_string_literal: true

require 'test_helper'

User = Struct.new(:name, :job, keyword_init: true)

class HexletCodeTest < Minitest::Test
  def setup
    @user = User.new
  end

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

  def test_form_for_build_form_tag
    assert { ::HexletCode.form_for(@user) == '<form action="#" method="post"></form>' }
  end

  def test_from_for_build_form_tag_with_action
    assert { ::HexletCode.form_for(@user, url: '/users') == '<form action="/users" method="post"></form>' }
  end

  def test_from_for_build_form_tag_with_block
    assert { ::HexletCode.form_for(@user) { |f| } == '<form action="#" method="post"></form>' }
  end
end
