require "test_helper"

using NestedDelete

class NestedDeleteTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::NestedDelete::VERSION
  end

  def test_it_returns_the_hash_itself
    hash = {}
    assert_equal hash.nested_delete!, hash
  end

  def test_it_removes_single_key_from_hash 
    hash = {one: '1'}
    assert_equal Hash.new, hash.nested_delete!(:one)
  end

  def test_it_deletes_multiple_keys
    hash = {one: '1', two: '2', three: '3'}
    expect = {one: '1'}
    assert_equal expect, hash.nested_delete!(:two, :three)
  end

  def test_it_deletes_nothing
    hash = {one: '1', two: '2', three: '3'}
    hash.nested_delete!(nil)
    assert_equal hash, {one: '1', two: '2', three: '3'}
  end

  def test_it_deletes_second_level_hash_key
    child = {one: '1', two: '2', three: '3'}
    parent = {foo: 'bar', child: child}
    expected = {foo: 'bar', child: {two: '2'}}
    assert_equal expected, parent.nested_delete!(:one, :three)
    assert_equal expected, parent
  end

  def test_it_works_for_arrays
    ary = [{one: 1}, {two: 2}]
    ary.nested_delete!(:one)
    assert_equal [{two: 2}], ary
  end

  def test_it_works_for_mix_of_arrays_and_hashes
    mix = {
      :one => 'one',
      :ary => ["foo", {bar: 'baz'}, {nest: [7, {one: 1}], keep: 'this'}, {}],
      "str" => "works"
    }
    expected = {
      ary: ["foo", {nest: [7], keep: 'this'}]
    }
    mix.nested_delete!(:one, :bar, "str")
    assert_equal expected, mix
  end

end
