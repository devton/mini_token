class MiniToken
  TOKEN_SIZE = 6
  TOKEN_CHARACTERS = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890'

  class << self
    def output(size = nil)
      generate { @token_size = size.nil? ? TOKEN_SIZE : size }
    end

    private

      def generate
        yield if block_given?
        token = []
        @token_size.times { token << TOKEN_CHARACTERS[pointer] }
        token.join
      end

      def pointer
        srand
        rand(MiniToken::TOKEN_CHARACTERS.size)
      end
  end
end