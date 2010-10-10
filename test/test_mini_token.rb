require 'helper'
MiniTest::Unit.autorun

describe MiniToken do
  describe "MiniToken Constants" do
    it "Default Token Size" do
      assert_equal 6, MiniToken::TOKEN_SIZE
    end

    it "Default Token Characters" do
      assert_equal 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890', MiniToken::TOKEN_CHARACTERS
    end
  end

  describe "MiniToken" do
    it "without size defined the generated token should be have 6 characters" do
      assert_equal 6, MiniToken.output.size
    end

    it "with size defined the token should be have the size passed characters" do
      assert_equal 9, MiniToken.output(9).size
    end

    it 'should be return the token string with default size' do
      assert_match /([a-zA-Z0-9]{6})/, MiniToken.output
    end

    it 'should be return the token string with size' do
      assert_match /([a-zA-Z0-9]{10})/, MiniToken.output(10)
    end
  end
end
