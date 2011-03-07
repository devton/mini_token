require 'helper'
MiniTest::Unit.autorun

describe MiniToken do
  describe "MiniToken Constants" do
    it "Default Token Size" do
      assert_equal 6, MiniToken::TOKEN_SIZE
    end

    it "Default Token Characters with use join" do
      assert_equal 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789', MiniToken::TOKEN_CHARACTERS.join
    end
  end

  describe "MiniToken" do
    before(:each) do
      cleaner
    end
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

    describe ".truncate_tokens" do
      before(:each) do
        4.times { MiniToken.output }
      end

      it "should have many tokens " do
        assert_equal MiniToken.all.size, 4
      end

      it "when call truncate then don't have more tokens storaged" do
        MiniToken.truncate_tokens
        assert_equal MiniToken.all.size, 0
      end
    end

    describe ".delete_token" do
      before(:each) do
        @token = MiniToken.output
      end

      it "should not have token" do
        MiniToken.delete_token(@token)
        assert_equal nil, MiniToken.find(@token)
      end
    end

    describe ".find" do
      before(:each) do
        @token = MiniToken.output
      end

      it "should return token" do
        assert_equal @token, MiniToken.find(@token)
      end
    end

    describe ".all" do
      before(:each) do
        @token1 = MiniToken.output
        @token2 = MiniToken.output
        @token3 = MiniToken.output
      end

      it "should return one hash with all tokens storaged" do
        assert_equal MiniToken.all, [{:id=>1, :token=>@token1}, {:id=>2, :token=>@token2}, {:id=>3, :token=>@token3}]
      end
    end
  end
end


def mock_tokens
  sequel = Sequel.sqlite(MiniToken::DB_PATH+'/mini_token_test.db')
  sequel[:tokens]
end

def cleaner
  mock_tokens.truncate
end