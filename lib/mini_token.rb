require 'sequel'
TOKEN_ENV = 'production'

class MiniToken < Struct.new(:db, :token)
  TOKEN_SIZE = 6
  TOKEN_CHARACTERS = (('A'..'Z').to_a+('a'..'z').to_a+('0'..'9').to_a)
  DB_PATH = File.expand_path(File.join(File.dirname(__FILE__), '..', 'db'))

  class << self
    def output(size = nil)
      generate { @token_size = size.nil? ? TOKEN_SIZE : size }
    end

    def truncate_tokens
      connection
      @db.truncate
    end

    def delete_token(param)
      connection
      @db.filter(:token => param).delete
    end

    def find(param)
      connection
      t = @db.first(:token => param)
      t[:token] unless t.nil?
    end

    def all
      connection
      @db.all
    end

    private

      def generate
        yield if block_given?
        @token = TOKEN_CHARACTERS.sample(@token_size).join
        exist_token?
      end

    protected

      def exist_token?
        connection
        @db.first(:token => @token).nil? ? storing : generate unless @token.nil?
      end

      def storing
        @token if @db.insert(:token => @token)
      end

      def connection
        sequel = Sequel.sqlite(DB_PATH+(TOKEN_ENV=='production' ? '/mini_token.db' : '/mini_token_test.db' ))
        @db = sequel[:tokens]
      end
  end
end