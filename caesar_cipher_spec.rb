require 'caesar_cipher'

RSpec.describe Cipher do
    describe "#caesar_cipher" do

      it "ciphers a word" do
        cipher = Cipher.new
        expect(cipher.caesar_cipher("alex", 42)).to eql("qbun")
			end

			it "works with capital letters" do
        cipher = Cipher.new
        expect(cipher.caesar_cipher("Alex", 42)).to eql("Qbun")
			end

			it "ignores symbols and numbers" do
				cipher = Cipher.new
				expect(cipher.caesar_cipher("Alex!", 42)).to eql("Qbun!")
			end

			it "ciphers multiple words" do
				cipher = Cipher.new
				expect(cipher.caesar_cipher("Alex wants a boat!", 42)).to eql("Qbun mqdji q reqj!")
			end

			
		end # describe do
	end # describe Cipher