# frozen_string_literal: true

require 'test_helper'
require 'yaml'

User = Struct.new(:name, :job, keyword_init: true)

class HexletCodeTest < Minitest::Test
  def setup
    @user = User.new
    fixture_tags = read_fixture_file('tags.yml')
    @tags = YAML.safe_load(fixture_tags)
  end

  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_it_build_single_tag
    assert { ::HexletCode::Tag.build('br') == @tags['br'] }
    assert { ::HexletCode::Tag.build('hr') == @tags['hr'] }
  end

  def test_it_build_single_tag_with_attributes
    assert { ::HexletCode::Tag.build('img', src: 'path/to/image') == @tags['img'] }
    assert { ::HexletCode::Tag.build('input', type: 'submit', value: 'Save') == @tags['input_save'] }
  end

  def test_form_for_build_form_tag
    assert { ::HexletCode.form_for(@user) == @tags['form'] }
  end

  def test_from_for_build_form_tag_with_action
    assert { ::HexletCode.form_for(@user, url: '/users') == @tags['form_users'] }
  end

  def test_from_for_build_form_tag_with_block
    assert { ::HexletCode.form_for(@user) { |f| } == @tags['form'] }
  end
end
