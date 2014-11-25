require 'spec_helper'

describe Treebank::Transform do
  it 'has a version number' do
    expect(Treebank::Transform::VERSION).not_to be nil
  end

  # Examples taken from http://nlp.perseus.tufts.edu/syntax/treebank/ldt/1.5/data/1999.02.0010.xml

  let(:tb1) do
<<EOF
<?xml version="1.0"?>
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

  let(:tb2) do
<<EOF
<treebank>
  <sentence id="126" document_id="Perseus:text:1999.02.0010" subdoc="text=Catil.:Speech=1:chapter=7" span="si4:desinam0">
    <word id="1" form="si" lemma="si1" postag="c--------" head="6" relation="AuxC"/>
    <word id="2" form="est" lemma="sum1" postag="v3spia---" head="1" relation="ADV"/>
    <word id="3" form="verus" lemma="verus1" postag="a-s---mn-" head="2" relation="PNOM"/>
    <word id="4" form="," lemma="comma1" postag="u--------" head="1" relation="AuxX"/>
    <word id="5" form="ne" lemma="ne1" postag="c--------" head="7" relation="AuxC"/>
    <word id="6" form="opprimar" lemma="opprimo1" postag="v1spsp---" head="5" relation="ExD_CO"/>
    <word id="7" form="," lemma="comma1" postag="u--------" head="0" relation="COORD"/>
    <word id="8" form="sin" lemma="si1" postag="c--------" head="15" relation="AuxC"/>
    <word id="9" form="falsus" lemma="falsus1" postag="a-s---mn-" head="8" relation="PNOM_ExD0_ADV"/>
    <word id="10" form="," lemma="comma1" postag="u--------" head="8" relation="AuxX"/>
    <word id="11" form="ut" lemma="ut1" postag="c--------" head="7" relation="AuxC"/>
    <word id="12" form="tandem" lemma="tandem1" postag="d--------" head="15" relation="AuxY"/>
    <word id="13" form="aliquando" lemma="aliquando1" postag="d--------" head="15" relation="ADV"/>
    <word id="14" form="timere" lemma="timeo1" postag="v--pna---" head="15" relation="OBJ"/>
    <word id="15" form="desinam" lemma="desino1" postag="v1spsa---" head="11" relation="ExD_CO"/>
  </sentence>
</treebank>
EOF
  end

  let(:tb2_result) do
<<EOF
<treebank>
  <sentence id="126" document_id="Perseus:text:1999.02.0010" subdoc="text=Catil.:Speech=1:chapter=7" span="si4:desinam0">
    <word id="1" form="si" lemma="si1" postag="c--------" head="6" relation="AuxC"/>
    <word id="2" form="est" lemma="sum1" postag="v3spia---" head="1" relation="ADV"/>
    <word id="3" form="verus" lemma="verus1" postag="a-s---mn-" head="2" relation="PNOM"/>
    <word id="4" form="," lemma="comma1" postag="u--------" head="1" relation="AuxX"/>
    <word id="5" form="ne" lemma="ne1" postag="c--------" head="7" relation="AuxC"/>
    <word id="6" form="opprimar" lemma="opprimo1" postag="v1spsp---" head="5" relation="ExD_CO"/>
    <word id="7" form="," lemma="comma1" postag="u--------" head="0" relation="COORD"/>
    <word id="8" form="sin" lemma="si1" postag="c--------" head="15" relation="AuxC"/>
    <word id="9" form="falsus" lemma="falsus1" postag="a-s---mn-" head="16" relation="PNOM"/>
    <word id="10" form="," lemma="comma1" postag="u--------" head="8" relation="AuxX"/>
    <word id="11" form="ut" lemma="ut1" postag="c--------" head="7" relation="AuxC"/>
    <word id="12" form="tandem" lemma="tandem1" postag="d--------" head="15" relation="AuxY"/>
    <word id="13" form="aliquando" lemma="aliquando1" postag="d--------" head="15" relation="ADV"/>
    <word id="14" form="timere" lemma="timeo1" postag="v--pna---" head="15" relation="OBJ"/>
    <word id="15" form="desinam" lemma="desino1" postag="v1spsa---" head="11" relation="ExD_CO"/>
    <word id="16" insertion_id="0016e" form="[0]" artificial="true" head="8" relation="ADV"/>
  </sentence>
</treebank>
EOF
  end

  let(:tb3) do
<<EOF
<treebank>
  <sentence id="95" document_id="Perseus:text:1999.02.0010" subdoc="text=Catil.:Speech=1:chapter=6" span="quid2:vero0">
    <word id="1" form="quid" lemma="quis1" postag="p-s---nn-" head="0" relation="SBJ_ExD0_PRED"/>
    <word id="2" form="vero" lemma="verus1" postag="d--------" head="0" relation="AuxY_ExD0_PRED"/>
  </sentence>
</treebank>
EOF
  end

  let(:tb3_result) do
<<EOF
<treebank>
  <sentence id="95" document_id="Perseus:text:1999.02.0010" subdoc="text=Catil.:Speech=1:chapter=6" span="quid2:vero0">
    <word id="1" form="quid" lemma="quis1" postag="p-s---nn-" head="3" relation="SBJ"/>
    <word id="2" form="vero" lemma="verus1" postag="d--------" head="3" relation="AuxY"/>
    <word id="3" insertion_id="0002e" artificial="elliptic" relation="PRED" head="0" form="[0]"/>
  </sentence>
</treebank>
EOF
  end

  #let(:tb4) do
#<<EOF
#<treebank>

#</treebank>
#EOF
  #end

  describe "#transform" do
    it "returns the document when there is nothing to transform" do
      tb = Treebank::Transform.new(tb1)
      result = tb.transform
      expect(result).to eq tb1
    end

    context "with a single simple ellipsis" do
      it "inserts a new elliptic node and updates the head" do
        tb = Treebank::Transform.new(tb2)
        result = tb.transform
        expect(result).to eq tb2_result
      end
    end
  end
end
