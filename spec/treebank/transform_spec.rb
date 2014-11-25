require 'spec_helper'

describe Treebank::Transform do
  it 'has a version number' do
    expect(Treebank::Transform::VERSION).not_to be nil
  end

  # Examples taken from http://nlp.perseus.tufts.edu/syntax/treebank/ldt/1.5/data/1999.02.0010.xml

  let(:tb1) do
<<EOF
<treebank>
  <sentence id="2" document_id="Perseus:text:1999.02.0010" subdoc="text=Catil.:Speech=1:chapter=1" span="quam0:eludet0">
    <word id="1" form="quam" lemma="quam1" postag="d--------" head="2" relation="ADV"/>
    <word id="2" form="diu" lemma="diu1" postag="d--------" head="8" relation="ADV"/>
    <word id="3" form="etiam" lemma="etiam1" postag="c--------" head="8" relation="AuxY"/>
    <word id="4" form="furor" lemma="furor2" postag="n-s---mn-" head="8" relation="SBJ"/>
    <word id="5" form="iste" lemma="iste1" postag="p-s---mn-" head="4" relation="ATR"/>
    <word id="6" form="tuus" lemma="tuus1" postag="a-s---mn-" head="4" relation="ATR"/>
    <word id="7" form="nos" lemma="nos1" postag="p-p---ma-" head="8" relation="OBJ"/>
    <word id="8" form="eludet" lemma="eludo1" postag="v3sfia---" head="0" relation="PRED"/>
  </sentence>
</treebank>
EOF
  end

  describe "#transform" do
    it "returns the document when there is nothing to transform" do
      tb = Treebank::Transform.new(tb1)
      result = tb.transform
      expect(result).to be tb1
    end
  end
end
