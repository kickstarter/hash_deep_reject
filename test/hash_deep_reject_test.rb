require 'test_helper'

class HashDeepRejectTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::HashDeepReject::VERSION
  end

  context "calling deep_reject!" do
    should "work on a 1-layer Hash" do
      val = {a: "a", b: ""}
      expected = {a: "a"}

      assert_equal expected, val.deep_reject! { |k,v| v.empty? }
    end

    should "work on a 2-layer Hash" do
      val = {a: "a", b: {c: ""}}
      expected = {a: "a", b: {}}

      assert_equal expected, val.deep_reject! { |k,v| v.empty? }
    end

    should "work on a 3-layer Hash" do
      val = {a: "a", b: {c: {d: ""}}}
      expected = {a: "a", b: {c: {}}}

      assert_equal expected, val.deep_reject! { |k,v| v.empty? }
    end
  end

  context "calling deep_reject!(true)" do
    should "work on a 1-layer Hash" do
      val = {a: "a", b: ""}
      expected = {a: "a"}

      assert_equal expected, val.deep_reject!(true) { |k,v| v.empty? }
    end

    should "work on a 2-layer Hash" do
      val = {a: "a", b: {c: ""}}
      expected = {a: "a"}

      assert_equal expected, val.deep_reject!(true) { |k,v| v.empty? }
    end

    should "work on a 3-layer Hash" do
      val = {a: "a", b: {c: {d: ""}}}
      expected = {a: "a"}

      assert_equal expected, val.deep_reject!(true) { |k,v| v.empty? }
    end
  end

end
