require "rspec"
require_relative "../#{File.basename(__FILE__).gsub( /_spec/ , "" )}"

RSpec.describe "namespace id generator" do
  describe "#generate" do
    context "root" do
      ns_name  = "cat"
      expected = "B1497F5FBA651B4F".downcase
      it{ expect( generate_namespaceid( ns_name ) ).to eq expected }
    end

    context "child" do
      parent_id = "B1497F5FBA651B4F"
      ns_name   = "alice"
      expected  = "E9786461CCE9B2D6".downcase
      it{ expect( generate_namespaceid( ns_name , parent_id ) ).to eq expected }
    end
  end
end
