require 'test/unit'
require 'tmpdir'

class TestTmpdir < Test::Unit::TestCase

  def test_mktmpdir_nil
    Dir.mktmpdir(nil) {|d|
      assert_kind_of(String, d)
    }
  end

  TRAVERSAL_PATH = Array.new(Dir.pwd.split('/').count, '..').join('/') + Dir.pwd + '/'
  TRAVERSAL_PATH.delete!(':') if /mswin|mingw/ =~ RUBY_PLATFORM

  def test_mktmpdir_traversal
    expect = Dir.glob(TRAVERSAL_PATH + '*').count
    Dir.mktmpdir(TRAVERSAL_PATH + 'foo')
    actual = Dir.glob(TRAVERSAL_PATH + '*').count
    assert_equal expect, actual
  end

  def test_mktmpdir_traversal_array
    expect = Dir.glob(TRAVERSAL_PATH + '*').count
    Dir.mktmpdir([TRAVERSAL_PATH, 'foo'])
    actual = Dir.glob(TRAVERSAL_PATH + '*').count
    assert_equal expect, actual
  end

  TRAVERSAL_PATH = Array.new(Dir.pwd.split('/').count, '..').join('/') + Dir.pwd + '/'
  TRAVERSAL_PATH.delete!(':') if /mswin|mingw/ =~ RUBY_PLATFORM

  def test_mktmpdir_traversal
    expect = Dir.glob(TRAVERSAL_PATH + '*').count
    Dir.mktmpdir(TRAVERSAL_PATH + 'foo')
    actual = Dir.glob(TRAVERSAL_PATH + '*').count
    assert_equal expect, actual
end

  def test_mktmpdir_traversal_array
    expect = Dir.glob(TRAVERSAL_PATH + '*').count
    Dir.mktmpdir([TRAVERSAL_PATH, 'foo'])
    actual = Dir.glob(TRAVERSAL_PATH + '*').count
    assert_equal expect, actual
  end

end
