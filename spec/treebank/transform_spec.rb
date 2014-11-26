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
<?xml version="1.0"?>
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
<?xml version="1.0"?>
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
    <word id="16" insertion_id="0015e" form="[0]" artificial="elliptic" head="8" relation="ADV"/>
  </sentence>
</treebank>
EOF
  end

  let(:tb3) do
<<EOF
<?xml version="1.0"?>
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
<?xml version="1.0"?>
<treebank>
  <sentence id="95" document_id="Perseus:text:1999.02.0010" subdoc="text=Catil.:Speech=1:chapter=6" span="quid2:vero0">
    <word id="1" form="quid" lemma="quis1" postag="p-s---nn-" head="3" relation="SBJ"/>
    <word id="2" form="vero" lemma="verus1" postag="d--------" head="3" relation="AuxY"/>
    <word id="3" insertion_id="0002e" form="[0]" artificial="elliptic" head="0" relation="PRED"/>
  </sentence>
</treebank>
EOF
  end

  let(:tb4) do
<<EOF
<?xml version="1.0"?>
<treebank>
  <sentence id="31" document_id="Perseus:text:1999.02.0010" subdoc="text=Catil.:Speech=1:chapter=2" span="si0:dicat0">
    <word id="1" form="si" lemma="si1" postag="c--------" head="8" relation="AuxC"/>
    <word id="2" form="te" lemma="tu1" postag="p-s---ma-" head="7" relation="SBJ"/>
    <word id="3" form="iam" lemma="jam1" postag="d--------" head="7" relation="AuxY"/>
    <word id="4" form="," lemma="comma1" postag="u--------" head="5" relation="AuxX"/>
    <word id="5" form="Catilina" lemma="Catilina1" postag="n-s---mv-" head="7" relation="ExD"/>
    <word id="6" form="," lemma="comma1" postag="u--------" head="5" relation="AuxX"/>
    <word id="7" form="comprehendi" lemma="comprehendo1" postag="v--pnp---" head="1" relation="OBJ_ExD0_ADV_CO"/>
    <word id="8" form="," lemma="comma1" postag="u--------" head="16" relation="COORD"/>
    <word id="9" form="si" lemma="si1" postag="c--------" head="8" relation="AuxC"/>
    <word id="10" form="interfici" lemma="interficio1" postag="v--pnp---" head="11" relation="OBJ"/>
    <word id="11" form="iussero" lemma="jubeo1" postag="v1stia---" head="9" relation="ADV_CO"/>
    <word id="12" form="," lemma="comma1" postag="u--------" head="8" relation="AuxX"/>
    <word id="13" form="credo" lemma="credo1" postag="v1spia---" head="0" relation="PRED"/>
    <word id="14" form="," lemma="comma1" postag="u--------" head="13" relation="AuxX"/>
    <word id="15" form="erit" lemma="sum1" postag="v3sfia---" head="16" relation="AuxV"/>
    <word id="16" form="verendum" lemma="vereor1" postag="t-spgpna-" head="13" relation="PRED"/>
    <word id="17" form="mihi" lemma="ego1" postag="p-s---md-" head="16" relation="ADV"/>
    <word id="18" form="ne" lemma="ne1" postag="c--------" head="16" relation="AuxC"/>
    <word id="19" form="non" lemma="non1" postag="d--------" head="18" relation="AuxZ_ExD1_ADV"/>
    <word id="20" form="hoc" lemma="hic1" postag="p-s---na-" head="18" relation="SBJ_ExD2_OBJ_ExD1_ADV"/>
    <word id="21" form="potius" lemma="potis1" postag="d--------" head="18" relation="ADV_ExD1_ADV"/>
    <word id="22" form="omnes" lemma="omnis1" postag="a-p---mn-" head="23" relation="ATR"/>
    <word id="23" form="boni" lemma="bonus1" postag="a-p---mn-" head="18" relation="SBJ_ExD1_ADV"/>
    <word id="24" form="serius" lemma="serus1" postag="d--------" head="18" relation="ADV_ExD2_OBJ_ExD1_ADV"/>
    <word id="25" form="a" lemma="ab1" postag="r--------" head="18" relation="AuxP"/>
    <word id="26" form="me" lemma="ego1" postag="p-s---mb-" head="25" relation="ADV_ExD2_OBJ_ExD1_ADV"/>
    <word id="27" form="quam" lemma="quam1" postag="d--------" head="21" relation="AuxC"/>
    <word id="28" form="quisquam" lemma="quisquam1" postag="p-s---mn-" head="32" relation="SBJ"/>
    <word id="29" form="crudelius" lemma="crudelis1" postag="d--------" head="30" relation="ADV"/>
    <word id="30" form="factum" lemma="facio1" postag="t-srppna-" head="32" relation="OBJ"/>
    <word id="31" form="esse" lemma="sum1" postag="v--pna---" head="30" relation="AuxV"/>
    <word id="32" form="dicat" lemma="dico2" postag="v3spsa---" head="27" relation="ADV"/>
  </sentence>
</treebank>
EOF
  end

  let(:tb4_result) do
<<EOF
<?xml version="1.0"?>
<treebank>
  <sentence id="31" document_id="Perseus:text:1999.02.0010" subdoc="text=Catil.:Speech=1:chapter=2" span="si0:dicat0">
    <word id="1" form="si" lemma="si1" postag="c--------" head="8" relation="AuxC"/>
    <word id="2" form="te" lemma="tu1" postag="p-s---ma-" head="7" relation="SBJ"/>
    <word id="3" form="iam" lemma="jam1" postag="d--------" head="7" relation="AuxY"/>
    <word id="4" form="," lemma="comma1" postag="u--------" head="5" relation="AuxX"/>
    <word id="5" form="Catilina" lemma="Catilina1" postag="n-s---mv-" head="7" relation="ExD"/>
    <word id="6" form="," lemma="comma1" postag="u--------" head="5" relation="AuxX"/>
    <word id="7" form="comprehendi" lemma="comprehendo1" postag="v--pnp---" head="33" relation="OBJ"/>
    <word id="8" form="," lemma="comma1" postag="u--------" head="16" relation="COORD"/>
    <word id="9" form="si" lemma="si1" postag="c--------" head="8" relation="AuxC"/>
    <word id="10" form="interfici" lemma="interficio1" postag="v--pnp---" head="11" relation="OBJ"/>
    <word id="11" form="iussero" lemma="jubeo1" postag="v1stia---" head="9" relation="ADV_CO"/>
    <word id="12" form="," lemma="comma1" postag="u--------" head="8" relation="AuxX"/>
    <word id="13" form="credo" lemma="credo1" postag="v1spia---" head="0" relation="PRED"/>
    <word id="14" form="," lemma="comma1" postag="u--------" head="13" relation="AuxX"/>
    <word id="15" form="erit" lemma="sum1" postag="v3sfia---" head="16" relation="AuxV"/>
    <word id="16" form="verendum" lemma="vereor1" postag="t-spgpna-" head="13" relation="PRED"/>
    <word id="17" form="mihi" lemma="ego1" postag="p-s---md-" head="16" relation="ADV"/>
    <word id="18" form="ne" lemma="ne1" postag="c--------" head="16" relation="AuxC"/>
    <word id="19" form="non" lemma="non1" postag="d--------" head="34" relation="AuxZ"/>
    <word id="20" form="hoc" lemma="hic1" postag="p-s---na-" head="35" relation="SBJ"/>
    <word id="21" form="potius" lemma="potis1" postag="d--------" head="34" relation="ADV"/>
    <word id="22" form="omnes" lemma="omnis1" postag="a-p---mn-" head="23" relation="ATR"/>
    <word id="23" form="boni" lemma="bonus1" postag="a-p---mn-" head="34" relation="SBJ"/>
    <word id="24" form="serius" lemma="serus1" postag="d--------" head="35" relation="ADV"/>
    <word id="25" form="a" lemma="ab1" postag="r--------" head="18" relation="AuxP"/>
    <word id="26" form="me" lemma="ego1" postag="p-s---mb-" head="35" relation="ADV"/>
    <word id="27" form="quam" lemma="quam1" postag="d--------" head="21" relation="AuxC"/>
    <word id="28" form="quisquam" lemma="quisquam1" postag="p-s---mn-" head="32" relation="SBJ"/>
    <word id="29" form="crudelius" lemma="crudelis1" postag="d--------" head="30" relation="ADV"/>
    <word id="30" form="factum" lemma="facio1" postag="t-srppna-" head="32" relation="OBJ"/>
    <word id="31" form="esse" lemma="sum1" postag="v--pna---" head="30" relation="AuxV"/>
    <word id="32" form="dicat" lemma="dico2" postag="v3spsa---" head="27" relation="ADV"/>
    <word id="33" insertion_id="0032e" form="[0]" artificial="elliptic" head="1" relation="ADV_CO"/>
    <word id="34" insertion_id="0032f" form="[1]" artificial="elliptic" head="18" relation="ADV"/>
    <word id="35" insertion_id="0032g" form="[2]" artificial="elliptic" head="34" relation="OBJ"/>
  </sentence>
</treebank>
EOF
  end

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

    context "when multiple token are children of the same ellipsis" do
      it "inserts a new elliptic node and updates the head" do
        tb = Treebank::Transform.new(tb3)
        result = tb.transform
        expect(result).to eq tb3_result
      end
    end

    context "when ellipses are chained" do
      it "does as it should" do
        tb = Treebank::Transform.new(tb4)
        result = tb.transform
        expect(result).to eq tb4_result
      end
    end
  end
end
