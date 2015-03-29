using BiomolecularStructures.Mafft
using Base.Test
using FastaIO
using BioSeq

mafft_expected = [("gi|166158130|ref|NP_001107279.1| interleukin 4 [Xenopus (Silurana) tropicalis]","MSNLGRILCAVLGLFHLLSANPVPSSKLQIAIEEIISELVNNKITHK-----KCFVPTPYDDEEEASVEEISCRAFKSLKHVCASER--------------------KNLRLLNASLITMFSE-----NVECSINNDEQKDLISVIEDLLTFFRAQM-RKLVMNPKH")  
 ("gi|55742622|ref|NP_999288.1| interleukin-4 precursor [Sus scrofa]","M-GLTSQLIPTLVCLLACTSNFVHGHKCDITLQEIIKTL--NILTARKNSCMELPVTDVFAAPENTTEKETFCRASTVLRHIYRHHT----CMK-------------SLLSGLDRNLSSMAN-------MTCSVHEAKKSTLKDFLERLKTIMKEKY-SKC------")               
 ("gi|55741696|ref|NP_001007080.1| interleukin 4 [Gallus gallus]","MSSSLPTLLALLVLLAGPGAVPTLCLQLSVPLMESIRIV--NDIQGE-VSCVKMNVTDIFADNKTNNKTELLCKASTI---VWESQH----CH--------------KNLQGLFLNMRQLLNASSTSLKAPCPTAAGNTTSMEKFLADLRTFFHQLAKNK-------")                   
 ("gi|50978886|ref|NP_001003159.1| interleukin-4 precursor [Canis lupus familiaris]","M-GLTSQLIPTLVCLLALTSTFVHGHNFNITIKEIIKML--NILTARNDSCMELTVKDVFTAPKNTSDKEIFCRAATVLRQIYTHN-----CSN-------------RYLRGLYRNLSSMAN-------KTCSMNEIKKSTLKDFLERLKVIMQKKY-YRH------")
 ("gi|42627877|ref|NP_958427.1| interleukin-4 precursor [Rattus norvegicus]","M-GLSPHLAVTLFCFLICTGNGIHGCN-DSPLREIINTL--NQVTEKGTPCTEMFVPDVLTATRNTTENELICRASRVLRKFYFPRDVPP-CLK-------NKSGVLGELRKLCRGVSGLNS------LRSCTVNESTLTTLKDFLESLKSILRGKYLQSCTSM--S")        
 ("gi|58743333|ref|NP_001008993.1| interleukin-4 isoform delta2 [Pan troglodytes]","M-GLTSQLLPPLFFLLACAGNFVHGHKCDITLQEIIKTL--NSLTEQ----------------KNTTEKETFCRAATVLRQFYSHHEKDTRCLGATAQQFHRHKQLIRFLKRLDRNLWGLAG------LNSCPVKEANQSTLENFLERLKTIMREKY-SKCSS----")  
 ("gi|112807223|ref|NP_001036804.1| interleukin-4 precursor [Felis catus]","M-DLTSQLIPALVCLLAFTSTFVHGQNFNNTLKEIIKTL--NILTARNDSCMELTVMDVLAAPKNTSDKEIFCRATTVLRQIYTHHN----CST-------------KFLKGLDRNLSSMAN-------RTCSVNEVKKCTLKDFLERLKAIMQKKY-SKH------")          
 ("2B8U:A|PDBID|CHAIN|SEQUENCE|HOMO SAPIENS","-------------------------HKCDITLQEIIKTL--NSLTEQKTLCTELTVTDIFAASKNTTEKETFCRAATVLRQFYSHHEKDTRCLGATAQQFHRHKQLIRFLKRLDRNLWGLAG------LNSCPVKEANQSTLENFLERLKTIMREKY-SKCSS----")]

@test mafft(Pkg.dir("BiomolecularStructures","examples/fasta","il4.fasta")) == mafft_expected

fasta_in_string = ">gi|166158130|ref|NP_001107279.1| interleukin 4 [Xenopus (Silurana) tropicalis]
MSNLGRILCAVLGLFHLLSANPVPSSKLQIAIEEIISELVNNKITHKKCFVPTPYDDEEEASVEEISCRA
FKSLKHVCASERKNLRLLNASLITMFSENVECSINNDEQKDLISVIEDLLTFFRAQMRKLVMNPKH


>gi|55742622|ref|NP_999288.1| interleukin-4 precursor [Sus scrofa]
MGLTSQLIPTLVCLLACTSNFVHGHKCDITLQEIIKTLNILTARKNSCMELPVTDVFAAPENTTEKETFC
RASTVLRHIYRHHTCMKSLLSGLDRNLSSMANMTCSVHEAKKSTLKDFLERLKTIMKEKYSKC


>gi|55741696|ref|NP_001007080.1| interleukin 4 [Gallus gallus]
MSSSLPTLLALLVLLAGPGAVPTLCLQLSVPLMESIRIVNDIQGEVSCVKMNVTDIFADNKTNNKTELLC
KASTIVWESQHCHKNLQGLFLNMRQLLNASSTSLKAPCPTAAGNTTSMEKFLADLRTFFHQLAKNK"

mafft_expected_from_string = [("gi|166158130|ref|NP_001107279.1| interleukin 4 [Xenopus (Silurana) tropicalis]","M---SNLGRILCAVLGLFHLLSANPVPSSKLQIAIEEIISEL--VNNKI-THKKCFVPTPYDDEEEASVEEISCRAFKSLKHVCASE--RKN-LRLLNASLITMFSEN-----VECSINNDEQKDLISVIEDLLTFFRAQMRKLVMNPKH")
 ("gi|55742622|ref|NP_999288.1| interleukin-4 precursor [Sus scrofa]","MGLTSQLIPTLVCLLAC----TSNFVHGHKCDITLQEIIKTLNILTARKNSCMELPVTDVFAAPENTTEKETFCRASTVLRHIYRHHTCMKSLLSGLDRNLSSMANMT-------CSVHEAKKSTLKDFLERLKTIMKEKYSK------C")             
 ("gi|55741696|ref|NP_001007080.1| interleukin 4 [Gallus gallus]","M---SSSLPTLLALLVLLAGPGAVPTLCLQLSVPLMESIRIVNDIQGEV-SCVKMNVTDIFADNKTNNKTELLCKASTI---VWESQHCHKN-LQGLFLNMRQLLNASSTSLKAPCPTAAGNTTSMEKFLADLRTFFHQLAKN------K")]

@test mafft_from_string(fasta_in_string) == mafft_expected_from_string

@test mafft(Pkg.dir("BiomolecularStructures","examples/fasta","il4.fasta"), :linsi) == mafft_expected

mafft_ginsi_expected = {("gi|166158130|ref|NP_001107279.1| interleukin 4 [Xenopus (Silurana) tropicalis]","MSNLGRILCAVLGLFHLLSANPVPSSKLQIAIEEIISELVNNKITHK-----KCFVPTPYDDEEEASVEEISCRAFKSLKHVCASER--------------------KNLRLLNASLITMFSE-----NVECSINNDEQKDLISVIEDLLTFFRAQMRKLVMNPKH"),("gi|55742622|ref|NP_999288.1| interleukin-4 precursor [Sus scrofa]","MGLTSQLIPTLVCLLACTS-NFVHGHKCDITLQEIIKTL--NILTARKNSCMELPVTDVFAAPENTTEKETFCRASTVLRHIYRHHTCMK-----------------SLLSGLDRNLSSMAN-------MTCSVHEAKKSTLKDFLERLKTIMKEKYSK------C"),("gi|55741696|ref|NP_001007080.1| interleukin 4 [Gallus gallus]","MSSSLPTLLALLVLLAGPGAVPTLCLQLSVPLMESIRIV--NDIQGE-VSCVKMNVTDIFADNKTNNKTELLCKASTI---VWESQHCH------------------KNLQGLFLNMRQLLNASSTSLKAPCPTAAGNTTSMEKFLADLRTFFHQLAKN------K"),("gi|50978886|ref|NP_001003159.1| interleukin-4 precursor [Canis lupus familiaris]","MGLTSQLIPTLVCLLALTS-TFVHGHNFNITIKEIIKML--NILTARNDSCMELTVKDVFTAPKNTSDKEIFCRAATVLRQIYT-HNCSN-----------------RYLRGLYRNLSSMAN-------KTCSMNEIKKSTLKDFLERLKVIMQKKYYR------H"),("gi|42627877|ref|NP_958427.1| interleukin-4 precursor [Rattus norvegicus]","MGLSPHLAVTLFCFLICTG-NGIHGCN-DSPLREIINTL--NQVTEKGTPCTEMFVPDVLTATRNTTENELICRASRVLRKFYFPRD--------VPPCLKNKSGVLGELRKLCRGVSGLNS------LRSCTVNESTLTTLKDFLESLKSILRGKYLQ-SCTSMS"),("gi|58743333|ref|NP_001008993.1| interleukin-4 isoform delta2 [Pan troglodytes]","MGLTSQLLPPLFFLLACAG-NFVHGHKCDITLQEIIKTL--NSLTEQ----------------KNTTEKETFCRAATVLRQFYSHHEKDTRCLGATAQQFHRHKQLIRFLKRLDRNLWGLAG------LNSCPVKEANQSTLENFLERLKTIMREKYSK--CS--S"),("gi|112807223|ref|NP_001036804.1| interleukin-4 precursor [Felis catus]","MDLTSQLIPALVCLLAFTS-TFVHGQNFNNTLKEIIKTL--NILTARNDSCMELTVMDVLAAPKNTSDKEIFCRATTVLRQIYTHHNCST-----------------KFLKGLDRNLSSMAN-------RTCSVNEVKKCTLKDFLERLKAIMQKKYSK------H"),("2B8U:A|PDBID|CHAIN|SEQUENCE|HOMO SAPIENS","-------------------------HKCDITLQEIIKTL--NSLTEQKTLCTELTVTDIFAASKNTTEKETFCRAATVLRQFYSHHEKDTRCLGATAQQFHRHKQLIRFLKRLDRNLWGLAG------LNSCPVKEANQSTLENFLERLKTIMREKYSK--CS--S")}

@test mafft(Pkg.dir("BiomolecularStructures","examples/fasta","il4.fasta"), :ginsi) == mafft_ginsi_expected
@test mafft(Pkg.dir("BiomolecularStructures","examples/fasta","il4.fasta"), :einsi) == mafft_expected

mafft_fftnsi_expected = {("gi|166158130|ref|NP_001107279.1| interleukin 4 [Xenopus (Silurana) tropicalis]","MSNLGRILCAVLGLFHLLSANPVPSSKLQIAIEEIISELVNNKITHK-----KCFVPTPYDDEEEASVEEISCRAFKSLKHV---------CASER-----------KNLRLLNASLITMFSEN-----VECSINNDEQKDLISVIEDLLTFFRAQMRKLVMNPKH"),("gi|55742622|ref|NP_999288.1| interleukin-4 precursor [Sus scrofa]","MG-LTSQLIPTLVCLLACTSNFVHGHKCDITLQEIIKTL--NILTARKNSCMELPVTDVFAAPENTTEKETFCRASTVLRHIYRHHT----CMK-------------SLLSGLDRNLSSMANM-------TCSVHEAKKSTLKDFLERLKTIMKEKYSKC------"),("gi|55741696|ref|NP_001007080.1| interleukin 4 [Gallus gallus]","MSSSLPTLLALLVLLAGPGAVPTLCLQLSVPLMESIRIV--NDIQGE-VSCVKMNVTDIFADNKTNNKTELLCKASTIVWESQH-------CH--------------KNLQGLFLNMRQLLNASSTSLKAPCPTAAGNTTSMEKFLADLRTFFHQLAKNK------"),("gi|50978886|ref|NP_001003159.1| interleukin-4 precursor [Canis lupus familiaris]","MG-LTSQLIPTLVCLLALTSTFVHGHNFNITIKEIIKML--NILTARNDSCMELTVKDVFTAPKNTSDKEIFCRAATVLRQIYTHN-----CSN-------------RYLRGLYRNLSSMANK-------TCSMNEIKKSTLKDFLERLKVIMQKKYYRH------"),("gi|42627877|ref|NP_958427.1| interleukin-4 precursor [Rattus norvegicus]","MG-LSPHLAVTLFCFLICTGNGIHGCN-DSPLREIINTL--NQVTEKGTPCTEMFVPDVLTATRNTTENELICRASRVLRKFYFPRDVPP-CLKNKSGVL-------GELRKLCRGVSGLNSLR------SCTVNESTLTTLKDFLESLKSILRGKYLQSCTSMS-"),("gi|58743333|ref|NP_001008993.1| interleukin-4 isoform delta2 [Pan troglodytes]","MG-LTSQLLPPLFFLLACAGNFVHGHKCDITLQEIIKTL--NSLTEQ----------------KNTTEKETFCRAATVLRQFYSHHEKDTRCLGATAQQFHRHKQLIRFLKRLDRNLWGLAGLN------SCPVKEANQSTLENFLERLKTIMREKYSKCSS----"),("gi|112807223|ref|NP_001036804.1| interleukin-4 precursor [Felis catus]","MD-LTSQLIPALVCLLAFTSTFVHGQNFNNTLKEIIKTL--NILTARNDSCMELTVMDVLAAPKNTSDKEIFCRATTVLRQIYTHHN----CST-------------KFLKGLDRNLSSMANR-------TCSVNEVKKCTLKDFLERLKAIMQKKYSKH------"),("2B8U:A|PDBID|CHAIN|SEQUENCE|HOMO SAPIENS","-------------------------HKCDITLQEIIKTL--NSLTEQKTLCTELTVTDIFAASKNTTEKETFCRAATVLRQFYSHHEKDTRCLGATAQQFHRHKQLIRFLKRLDRNLWGLAGLN------SCPVKEANQSTLENFLERLKTIMREKYSKCSS----")}

@test mafft(Pkg.dir("BiomolecularStructures","examples/fasta","il4.fasta"), :fftnsi) == mafft_fftnsi_expected


mafft_fftns_expected = {("gi|166158130|ref|NP_001107279.1| interleukin 4 [Xenopus (Silurana) tropicalis]","MSNLGRILCAVLGLFHLLSANPVPS--------SKLQIAIEEIISELVNNKITHK-----KCFVPTPYDDEEEASVEEISCRAFKSLKHV---------CASER-----------KNLRLLNASLITMFSENVECSINNDEQKDLISVIEDLLTFFRAQMRKLVMNPKH--------"),("gi|55742622|ref|NP_999288.1| interleukin-4 precursor [Sus scrofa]","-MGLTSQLIPTLVCLLACTSNFVHG--------HKCDITLQEIIKTL--NILTARKNSCMELPVTDVFAAPENTTEKETFCRASTVLRHIYRHHT----CMK-------------SLLSGLDRNLSSMANM--TCSVHEAKKSTLKDFLERLKT---------IMKEKYSKC-----"),("gi|55741696|ref|NP_001007080.1| interleukin 4 [Gallus gallus]","---MSSSL-PTLLALLVL----LAGPGAVPTLCLQLSVPLMESIRIV--NDIQGE-VSCVKMNVTDIFADNKTNNKTELLCKASTIVWE--SQH-----CHK-------NLQGLFLNMRQL-LNASSTSLKA-PCPTAAGNTTSMEKFLADLRTFFH-----QLAKNK---------"),("gi|50978886|ref|NP_001003159.1| interleukin-4 precursor [Canis lupus familiaris]","-MGLTSQLIPTLVCLLALTSTFVHG--------HNFNITIKEIIKML--NILTARNDSCMELTVKDVFTAPKNTSDKEIFCRAATVLRQIYT-HN----CSN-------------RYLRGLYRNLSSMANK--TCSMNEIKKSTLKDFLERLKV---------IMQKKYYRH-----"),("gi|42627877|ref|NP_958427.1| interleukin-4 precursor [Rattus norvegicus]","-MGLSPHLAVTLFCFLICTGNGIHG--------CN-DSPLREIINTL--NQVTEKGTPCTEMFVPDVLTATRNTTENELICRASRVLRKFYFPRDVPP-CLK-------NKSGVLGELRKLCRGVSGLNSLR-SCTVNESTLTTLKDFLESLKS---------ILRGKYLQSCTSMS"),("gi|58743333|ref|NP_001008993.1| interleukin-4 isoform delta2 [Pan troglodytes]","-MGLTSQLLPPLFFLLACAGNFVHG--------HKCDITLQEIIKTL--NSLTEQ----------------KNTTEKETFCRAATVLRQFYSHHEKDTRCLGATAQQFHRHKQLIRFLKRLDRNLWGLAGLN-SCPVKEANQSTLENFLERLKT---------IMREKYSKCSS---"),("gi|112807223|ref|NP_001036804.1| interleukin-4 precursor [Felis catus]","-MDLTSQLIPALVCLLAFTSTFVHG--------QNFNNTLKEIIKTL--NILTARNDSCMELTVMDVLAAPKNTSDKEIFCRATTVLRQIYTHHN----CST-------------KFLKGLDRNLSSMANR--TCSVNEVKKCTLKDFLERLKA---------IMQKKYSKH-----"),("2B8U:A|PDBID|CHAIN|SEQUENCE|HOMO SAPIENS","---------------------------------HKCDITLQEIIKTL--NSLTEQKTLCTELTVTDIFAASKNTTEKETFCRAATVLRQFYSHHEKDTRCLGATAQQFHRHKQLIRFLKRLDRNLWGLAGLN-SCPVKEANQSTLENFLERLKT---------IMREKYSKCSS---")}

@test mafft(Pkg.dir("BiomolecularStructures","examples/fasta","il4.fasta"), :fftns) == mafft_fftns_expected

mafft_nwnsi_expected = {("gi|166158130|ref|NP_001107279.1| interleukin 4 [Xenopus (Silurana) tropicalis]","MSNLGRILCAVLGLFHLLSANPVPSSKLQIAIEEIISELVNNKITHK-----KCFVPTPYDDEEEASVEEISCRAFKSLKHV---------CASER-----------KNLRLLNASLITMFSEN-----VECSINNDEQKDLISVIEDLLTFFRAQMRKLVMNPKH"),("gi|55742622|ref|NP_999288.1| interleukin-4 precursor [Sus scrofa]","MG-LTSQLIPTLVCLLACTSNFVHGHKCDITLQEIIKTL--NILTARKNSCMELPVTDVFAAPENTTEKETFCRASTVLRHIYRHHT----CMK-------------SLLSGLDRNLSSMANM-------TCSVHEAKKSTLKDFLERLKTIMKEKYSKC------"),("gi|55741696|ref|NP_001007080.1| interleukin 4 [Gallus gallus]","MSSSLPTLLALLVLLAGPGAVPTLCLQLSVPLMESIRIV--NDIQGE-VSCVKMNVTDIFADNKTNNKTELLCKASTIVWESQH-------CH--------------KNLQGLFLNMRQLLNASSTSLKAPCPTAAGNTTSMEKFLADLRTFFHQLAKNK------"),("gi|50978886|ref|NP_001003159.1| interleukin-4 precursor [Canis lupus familiaris]","MG-LTSQLIPTLVCLLALTSTFVHGHNFNITIKEIIKML--NILTARNDSCMELTVKDVFTAPKNTSDKEIFCRAATVLRQIYTHN-----CSN-------------RYLRGLYRNLSSMANK-------TCSMNEIKKSTLKDFLERLKVIMQKKYYRH------"),("gi|42627877|ref|NP_958427.1| interleukin-4 precursor [Rattus norvegicus]","MG-LSPHLAVTLFCFLICTGNGIHGCN-DSPLREIINTL--NQVTEKGTPCTEMFVPDVLTATRNTTENELICRASRVLRKFYFPRDVPP-CLKNKSGVL-------GELRKLCRGVSGLNSLR------SCTVNESTLTTLKDFLESLKSILRGKYLQSCTSMS-"),("gi|58743333|ref|NP_001008993.1| interleukin-4 isoform delta2 [Pan troglodytes]","MG-LTSQLLPPLFFLLACAGNFVHGHKCDITLQEIIKTL--NSLTEQ----------------KNTTEKETFCRAATVLRQFYSHHEKDTRCLGATAQQFHRHKQLIRFLKRLDRNLWGLAGLN------SCPVKEANQSTLENFLERLKTIMREKYSKCSS----"),("gi|112807223|ref|NP_001036804.1| interleukin-4 precursor [Felis catus]","MD-LTSQLIPALVCLLAFTSTFVHGQNFNNTLKEIIKTL--NILTARNDSCMELTVMDVLAAPKNTSDKEIFCRATTVLRQIYTHHN----CST-------------KFLKGLDRNLSSMANR-------TCSVNEVKKCTLKDFLERLKAIMQKKYSKH------"),("2B8U:A|PDBID|CHAIN|SEQUENCE|HOMO SAPIENS","-------------------------HKCDITLQEIIKTL--NSLTEQKTLCTELTVTDIFAASKNTTEKETFCRAATVLRQFYSHHEKDTRCLGATAQQFHRHKQLIRFLKRLDRNLWGLAGLN------SCPVKEANQSTLENFLERLKTIMREKYSKCSS----")}

@test mafft(Pkg.dir("BiomolecularStructures","examples/fasta","il4.fasta"), :nwnsi) == mafft_nwnsi_expected

mafft_nwns_expected = {("gi|166158130|ref|NP_001107279.1| interleukin 4 [Xenopus (Silurana) tropicalis]","MSNLGRILCAVLGLFHLLSANPVPS--------SKLQIAIEEIISELVNNKITHK-----KCFVPTPYDDEEEASVEEISCRAFKSLKHV---------CASER-----------KNLRLLNASLITMFSENVECSINNDEQKDLISVIEDLLTFFRAQMRKLVMNPKH--------"),("gi|55742622|ref|NP_999288.1| interleukin-4 precursor [Sus scrofa]","-MGLTSQLIPTLVCLLACTSNFVHG--------HKCDITLQEIIKTL--NILTARKNSCMELPVTDVFAAPENTTEKETFCRASTVLRHIYRHHT----CMK-------------SLLSGLDRNLSSMANM--TCSVHEAKKSTLKDFLERLKT---------IMKEKYSKC-----"),("gi|55741696|ref|NP_001007080.1| interleukin 4 [Gallus gallus]","---MSSSL-PTLLALLVL----LAGPGAVPTLCLQLSVPLMESIRIV--NDIQGE-VSCVKMNVTDIFADNKTNNKTELLCKASTIVWE--SQH-----CHK-------NLQGLFLNMRQL-LNASSTSLKA-PCPTAAGNTTSMEKFLADLRTFFH-----QLAKNK---------"),("gi|50978886|ref|NP_001003159.1| interleukin-4 precursor [Canis lupus familiaris]","-MGLTSQLIPTLVCLLALTSTFVHG--------HNFNITIKEIIKML--NILTARNDSCMELTVKDVFTAPKNTSDKEIFCRAATVLRQIYT-HN----CSN-------------RYLRGLYRNLSSMANK--TCSMNEIKKSTLKDFLERLKV---------IMQKKYYRH-----"),("gi|42627877|ref|NP_958427.1| interleukin-4 precursor [Rattus norvegicus]","-MGLSPHLAVTLFCFLICTGNGIHG--------CN-DSPLREIINTL--NQVTEKGTPCTEMFVPDVLTATRNTTENELICRASRVLRKFYFPRDVPP-CLK-------NKSGVLGELRKLCRGVSGLNSLR-SCTVNESTLTTLKDFLESLKS---------ILRGKYLQSCTSMS"),("gi|58743333|ref|NP_001008993.1| interleukin-4 isoform delta2 [Pan troglodytes]","-MGLTSQLLPPLFFLLACAGNFVHG--------HKCDITLQEIIKTL--NSLTEQ----------------KNTTEKETFCRAATVLRQFYSHHEKDTRCLGATAQQFHRHKQLIRFLKRLDRNLWGLAGLN-SCPVKEANQSTLENFLERLKT---------IMREKYSKCSS---"),("gi|112807223|ref|NP_001036804.1| interleukin-4 precursor [Felis catus]","-MDLTSQLIPALVCLLAFTSTFVHG--------QNFNNTLKEIIKTL--NILTARNDSCMELTVMDVLAAPKNTSDKEIFCRATTVLRQIYTHHN----CST-------------KFLKGLDRNLSSMANR--TCSVNEVKKCTLKDFLERLKA---------IMQKKYSKH-----"),("2B8U:A|PDBID|CHAIN|SEQUENCE|HOMO SAPIENS","---------------------------------HKCDITLQEIIKTL--NSLTEQKTLCTELTVTDIFAASKNTTEKETFCRAATVLRQFYSHHEKDTRCLGATAQQFHRHKQLIRFLKRLDRNLWGLAGLN-SCPVKEANQSTLENFLERLKT---------IMREKYSKCSS---")}

@test mafft(Pkg.dir("BiomolecularStructures","examples/fasta","il4.fasta"), :nwns) == mafft_nwns_expected

@test alignment_length(mafft_expected_from_string) == 150

expected_amino_acids = Array{AminoAcid,1}[]
push!(expected_amino_acids, aminoacid("MSNLGRILCAVLGLFHLLSANPVPSSKLQIAIEEIISELVNNKITHKKCFVPTPYDDEEEASVEEISCRAFKSLKHVCASERKNLRLLNASLITMFSENVECSINNDEQKDLISVIEDLLTFFRAQMRKLVMNPKH"))

@test to_aminoacids([readfasta(Pkg.dir("BiomolecularStructures","examples/fasta","il4.fasta"))[1]]) == expected_amino_acids

@test mafft_from_fasta(readfasta(Pkg.dir("BiomolecularStructures","examples/fasta","il4.fasta"))) == mafft_expected

#expected_aligned_output = String["MSNLGRILCAVLGLFHLLSANPVPSSKLQIAIEEIISELVNNKITHKKCFVPTPYDDEEEASVEEISCRAFKSLKHVCASERKNLRLLNASLITMFSENVECSINNDEQKDLISVIEDLLTFFRAQMRKLVMNPKH","MGLTSQLIPTLVCLLACTSNFVHGHKCDITLQEIIKTLNILTARKNSCMELPVTDVFAAPENTTEKETFCRASTVLRHIYRHHTCMKSLLSGLDRNLSSMANMTCSVHEAKKSTLKDFLERLKTIMKEKYSKC","MSSSLPTLLALLVLLAGPGAVPTLCLQLSVPLMESIRIVNDIQGEVSCVKMNVTDIFADNKTNNKTELLCKASTIVWESQHCHKNLQGLFLNMRQLLNASSTSLKAPCPTAAGNTTSMEKFLADLRTFFHQLAKNK","MGLTSQLIPTLVCLLALTSTFVHGHNFNITIKEIIKMLNILTARNDSCMELTVKDVFTAPKNTSDKEIFCRAATVLRQIYTHNCSNRYLRGLYRNLSSMANKTCSMNEIKKSTLKDFLERLKVIMQKKYYRH","MGLSPHLAVTLFCFLICTGNGIHGCNDSPLREIINTLNQVTEKGTPCTEMFVPDVLTATRNTTENELICRASRVLRKFYFPRDVPPCLKNKSGVLGELRKLCRGVSGLNSLRSCTVNESTLTTLKDFLESLKSILRGKYLQSCTSMS","MGLTSQLLPPLFFLLACAGNFVHGHKCDITLQEIIKTLNSLTEQKNTTEKETFCRAATVLRQFYSHHEKDTRCLGATAQQFHRHKQLIRFLKRLDRNLWGLAGLNSCPVKEANQSTLENFLERLKTIMREKYSKCSS","MDLTSQLIPALVCLLAFTSTFVHGQNFNNTLKEIIKTLNILTARNDSCMELTVMDVLAAPKNTSDKEIFCRATTVLRQIYTHHNCSTKFLKGLDRNLSSMANRTCSVNEVKKCTLKDFLERLKAIMQKKYSKH","HKCDITLQEIIKTLNSLTEQKTLCTELTVTDIFAASKNTTEKETFCRAATVLRQFYSHHEKDTRCLGATAQQFHRHKQLIRFLKRLDRNLWGLAGLNSCPVKEANQSTLENFLERLKTIMREKYSKCSS"]

#aligned = readfasta(Pkg.dir("BiomolecularStructures","examples/fasta","il4.fasta"))

#@test print_fasta(aligned) == expected_aligned_output

mafft_profile_expected = {("_seed_3UGM:A|PDBID|CHAIN|SEQUENCE","MASSHHHHHHSSGLVPRGSSGSSMAARPPRAKPAPRRRAAQPSDASPAAQVDLRTLGYSQQQQEKIKPKVRSTVAQHHEALVGHGFTHAHIVALSQHPAALGTVAVTYQHIITALPEATHEDIVGVGKQWSGARALEALLTDAGELRGPPLQLDTGQLVKIAKRGGVTAMEAVHASRNALTGA---PLNLTPAQVVAIASNNGGKQALETVQRLLPVLCQAHGLTPAQVVAIASHDGGKQALETMQRLLPVLCQAHGLPPDQVVAIASNIGGKQALETVQRLLPVLCQAHGLTPDQVVAIASHGGGKQALETVQRLLPVLCQAHGLTPDQVVAIASHDGGKQALETVQRLLPVLCQAHGLTPDQVVAIASNGGGKQALETVQRLLPVLCQAHGLTPDQVVAIASNGGKQALETVQRLLPVLCQAHGLTPDQVVAIASHDGGKQALETVQRLLPVLCQTHGLTPAQVVAIASHDGGKQALETVQQLLPVLCQAHGLTPDQVVAIASNIGGKQALATVQRLLPVLCQAHGLTPDQVVAIASNGGGKQALETVQRLLPVLCQAHGLTPDQVVAIASNGGGKQALETVQRLLPVLCQAHGLTQVQVVAIASNIGGKQALETVQRLLPVLCQAHGLTPAQVVAIASHDGGKQALETVQRLLPVLCQAHGLTPDQVVAIASNGGGKQALETVQRLLPVLCQAHGLTQEQVVAIASNNGGKQALETVQRLLPVLCQAHGLTPDQVVAIASNGGGKQALETVQRLLPVLCQAHGLTPAQVVAIASNIGGKQALETVQRLLPVLCQDHGLTLAQVVAIASNIGGKQALETVQRLLPVLCQAHGLTQDQVVAIASNIGGKQALETVQRLLPVLCQDHGLTPDQVVAIASNIGGKQALETVQRLLPVLCQDHGLTLDQVVAIASNGGKQALETVQRLLPVLCQDHGLTPDQVVAIASNSGGKQALETVQRLLPVLCQDHGLTPNQVVAIASNGGKQALESIVAQLSRPDPALAALTNDHLVALACLGGRPAMDAVKKGLPHAPELIRRVN-RRIGERTSHRV"),("_seed_3UGM:B|PDBID|CHAIN|SEQUENCE","T-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------AGATATGCATCTCCCCCTA--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------CTG---TACACCACCAAAAG-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------T"),("_seed_3UGM:C|PDBID|CHAIN|SEQUENCE","TTTT----------------------------------------------------------------------------------------------------------------------------------------------------------------GGT-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------GGTGTACAGTAGGGGGAGATGCATATCTAAC--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"),("_seed_gi|166158130|ref|NP_001107279.1| interleukin 4 [Xenopus (Silurana) tropicalis]","MSNL------GRILCA----------------------------------------------------------------------VLGLFHLLSANPVPSSKLQIAIEEIISELV------------------------------------------------------------NNKITHK-----KCFVPTPYDDEEEASVEE------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ISCRA-----------------------FKSLKHVCASER----------------------------------------------------------------------------------------------------------------------KNLRLLNASLITMFSE----------------------------NVECSI-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------NNDEQKDLISVIEDLL-------------------------------------TFFRAQM-RKLVMNP--KH"),("_seed_gi|55742622|ref|NP_999288.1| interleukin-4 precursor [Sus scrofa]","M-GL------TSQLIP----------------------------------------------------------------------TLVCLLACTSNFVHGHKCDITLQEIIKTL--------------------------------------------------------------NILTARKNSCMELPVTDVFAAPENTTEKE------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------TFCRA-----------------------STVLRHIYRHHT-----------------------------CMK--------------------------------------------------------------------------------------SLLSGLDRNLSSMAN------------------------------MTCSV-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------HEAKKSTLKDFLERLK-------------------------------------TIMKEKY-SKC--------"),("_seed_gi|55741696|ref|NP_001007080.1| interleukin 4 [Gallus gallus]","MSSS------LPTLLA----------------------------------------------------------------------LLVLLAGPGAVPTLCLQLSVPLMESIRIV--------------------------------------------------------------NDIQGE-VSCVKMNVTDIFADNKTNNKTE------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------LLCKA-----------------------STI---VWESQH-----------------------------CH---------------------------------------------------------------------------------------KNLQGLFLNMRQLLNASSTS-----------------------LKAPCPT-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------AAGNTTSMEKFLADLR-------------------------------------TFFHQLAKNK---------"),("_seed_gi|50978886|ref|NP_001003159.1| interleukin-4 precursor [Canis lupus familiaris]","M-GL------TSQLIP----------------------------------------------------------------------TLVCLLALTSTFVHGHNFNITIKEIIKML--------------------------------------------------------------NILTARNDSCMELTVKDVFTAPKNTSDKE------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------IFCRA-----------------------ATVLRQIYTHN------------------------------CSN--------------------------------------------------------------------------------------RYLRGLYRNLSSMAN------------------------------KTCSM-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------NEIKKSTLKDFLERLK-------------------------------------VIMQKKY-YRH--------"),("_seed_gi|42627877|ref|NP_958427.1| interleukin-4 precursor [Rattus norvegicus]","M-GL------SPHLAV----------------------------------------------------------------------TLFCFLICTGNGIHGCN-DSPLREIINTL--------------------------------------------------------------NQVTEKGTPCTEMFVPDVLTATRNTTENE------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------LICRA-----------------------SRVLRKFYFPRDVPP--------------------------CLK--------------------------------------------------------------------------------NKSGVLGELRKLCRGVSGLNS-----------------------------LRSCTV-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------NESTLTTLKDFLESLK-------------------------------------SILRGKYLQSCTSM----S"),("_seed_gi|58743333|ref|NP_001008993.1| interleukin-4 isoform delta2 [Pan troglodytes]","M-GL------TSQLLP----------------------------------------------------------------------PLFFLLACAGNFVHGHKCDITLQEIIKTL--------------------------------------------------------------NSLTEQ----------------KNTTEKE------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------TFCRA-----------------------ATVLRQFYSHHEKDTR-------------------------CLG-------------------------------------------------------ATAQ-------QFH-----------RHKQLIRFLKRLDRNLWGLAG-----------------------------LNSCPV-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------KEANQSTLENFLERLK-------------------------------------TIMREKY-SKCSS------"),("_seed_gi|112807223|ref|NP_001036804.1| interleukin-4 precursor [Felis catus]","M-DL------TSQLIP----------------------------------------------------------------------ALVCLLAFTSTFVHGQNFNNTLKEIIKTL--------------------------------------------------------------NILTARNDSCMELTVMDVLAAPKNTSDKE------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------IFCRA-----------------------TTVLRQIYTHHN-----------------------------CST--------------------------------------------------------------------------------------KFLKGLDRNLSSMAN------------------------------RTCSV-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------NEVKKCTLKDFLERLK-------------------------------------AIMQKKY-SKH--------"),("_seed_2B8U:A|PDBID|CHAIN|SEQUENCE|HOMO SAPIENS","-----------------------------------------------------------------------------------------------------HKCDITLQEIIKTL--------------------------------------------------------------NSLTEQKTLCTELTVTDIFAASKNTTEKE------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------TFCRA-----------------------ATVLRQFYSHHEKDTR-------------------------CLG-------------------------------------------------------ATAQ-------QFH-----------RHKQLIRFLKRLDRNLWGLAG-----------------------------LNSCPV-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------KEANQSTLENFLERLK-------------------------------------TIMREKY-SKCSS------")}
@test mafft_profile(Pkg.dir("BiomolecularStructures", "examples", "fasta", "3UGM.ali"),Pkg.dir("BiomolecularStructures", "examples", "fasta", "il4.ali")) == mafft_profile_expected

group1 = readall(open(Pkg.dir("BiomolecularStructures", "examples", "fasta", "3UGM.ali")))

group2 = readall(open(Pkg.dir("BiomolecularStructures", "examples", "fasta", "il4.ali")))

@test mafft_profile_from_string(group1, group2) == mafft_profile_expected

group1 = readfasta(Pkg.dir("BiomolecularStructures", "examples", "fasta", "3UGM.ali"))

group2 = readfasta(Pkg.dir("BiomolecularStructures", "examples", "fasta", "il4.ali"))

@test mafft_profile_from_fasta(group1, group2) == mafft_profile_expected


