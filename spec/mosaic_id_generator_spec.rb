require "rspec"
require_relative "../#{File.basename(__FILE__).gsub( /_spec/ , "" )}"

RSpec.describe "mosaic id generator" do
  describe "#generate" do
    let( :pubkey ){ "B4F12E7C9F6946091E2CB8B6D3A12B50D17CCBBF646386EA27CE2946A7423DCF" }

    context "nonce 0" do
      nonce    = 0
      expected = "0DC67FBE1CAD29E3".downcase
      it{ expect( generate_mosaicid( pubkey , nonce ) ).to eq expected }
    end

    context "nonce 1" do
      nonce    = 1
      expected = "26514E2A1EF33824".downcase
      it{ expect( generate_mosaicid( pubkey , nonce ) ).to eq expected }
    end
  end
end
