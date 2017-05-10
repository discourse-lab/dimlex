# DiMLex - Structure

The lexicon is constructed of a number of lexicon entries, numbered by an 'id'. 

Schematically, each entry consists of the following data fields:

**`<orths/>`** List of orthographic variants for this entry. One variant is marked as the 'canonical' spelling.

A connective can be 'phrasal' or a 'single' item, furthermore, phrasal connectives can be 'cont'inuous or 'discont'inuous

**`<ambiguity/>`** Information on whether this form also has a non-connective reading (`<non_conn/>`) and whether the connective has different semantic readings (`<sem_ambiguity/>`). If `<non_conn>1</non_conn>` is marked as `1` (true), the attributes show how often the non-connective reading was encountered (`"freq"`) among how many annotated instances (`"anno_N"`). Note that for some examples (like `"bis`") we know (analytically) that there is a non-connective reading, but this reading was not encountered in the annotated examples. In this case, the value for non_conn is true, but there is no frequency information.

**`<non_conn_reading/>`** Examples and possible POS tags of a usage of this item in its non-connective reading.

**`<focuspart/>`** Whether or not this connective allows for associated focus particles.

**`<correlate/>`** Some connectives frequently appear with "correlates" to mark a discourse relation. 

 It is noted whether the connective is a correlate (`<is_correlate/>`) of another one or whether it can have correlates (`<has_correlate/>`). 
 
  [This information is not included in the current public version of DiMLex.]

**`<stts/>`** Common POS tags, with examples and corpus frequencies.

**`<syn/>`** Syntactic and semantic information on this connective. 

 For ambiguous connectives (that are also syntactically ambiguous), several `<syn/>`-blocks are allowed.

 The syntax block is further divided into the following components:

 * **`<cat/>`** Syntactic category.

 For German, one of:
  
	- *konnadv* (adverb), 
	- *padv* (adverb with prepositional part), 
	- *konj* (coordinating conjunction), 	    'und'
	- *subj* (subordinating conjunction), 	    'weil', 'obwohl'   (requires verb-final complement, can be moved in matrix clause)
	- *v2emb* (v2-embedder), 		    	    'vorausgesetzt'  (V2 complement, but embedded clause can be moved in matrix) 
	- *postp* (postponer),				    'weshalb'	     (verb-final complement, cannot be moved in matrix clause)
	- *appr* (preposition),				    'anstatt'
	- *appo* (postposition),				    'wegen'
	- *apci* (circumposition),			    'um ... willen'
	- *einzel* (isolated)				    	    'dass'

* **`<integr/>`** For adverbs, indication in which syntactic positions they can occur (traditional German 'Felder'-syntax). 

[This information can be provided upon request.]

* **`<ordering/>`** Options for the linear order of arguments arg1 and arg2: *ante*, *post*, *insert*, and/or *desintegr*

* **`<sem/>`** Information on the coherence relation(s) expressed by the connective. 

 Each semantic reading is chosen from the list of PDTB 3.0 relations (see (Webber et al., 2016), LAW workshop). The inventory of senses used here is provided in the file `inventory-pdtb3-senses.txt` The attributes show how often the given sense was encountered (`"freq"`) within the set of annotated examples that were instances of the connective (`anno_N`). (When the sense is rare but well-attested from the literature, these attributes are sometimes empty because the sense was not encountered during annotation.)
