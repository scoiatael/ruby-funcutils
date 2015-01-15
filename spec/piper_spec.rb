require_relative '../lib/funcutils/piper'

describe "Piper" do
  let(:piper) { Funcutils::Piper.new(2) }

  describe ".result" do
    it "should return internal value" do
      expect(piper.result).to eq 2
    end
  end

  describe ".pipe" do
    it "should modify internal value with returned" do
      expect(piper.pipe { |v| v * 2} .result).to eq 4
      expect(piper.pipe { "aaa" } .result).to eq "aaa"
    end

  end

  describe ".initialize" do
    it "should take interval value as argument" do
      expect(Funcutils::Piper.new("c").result).to eq "c"
    end
  end

  describe ".>" do
    it "should be alias to pipe" do
      piperDup = piper.dup
      blck = proc { |v| v+6 }
      expect(piper.pipe(&blck).result).to eq piperDup.>(&blck).result
    end
  end
end

