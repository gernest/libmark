require "./spec_helper"

describe Mark do
  # TODO: Write tests

  it "works" do
    false.should eq(false)
  end
end

describe Mark::Scanner do
  it "Tokenizes input text" do
    h= "# hello world"
    s=Mark::Scanner.new(h)
    toks=s.scan
    toks.each do |item|
      p item
    end
  end
end
