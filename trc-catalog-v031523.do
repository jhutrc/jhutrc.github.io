* trc-catalog-v031523
* deleted block of code:
* lines 24-100 in v031423
* added supplemtary code
* by abi muzaale

quietly {
	
	
	 cls 
	 capture log close
	 log using trc-catalog-v031523.log, replace 
	 
	 //pubmed-generated .csv file names
	 //hundreds of alumni, tens of faculty
	 //more efficient to use faculty as identifiers
	 local faculty ////
	         segevdlauO gentryseau massieabau muzaaleada mcadams-de ///
	         kingeaauOR durandcmau hendersonm werbelwaau katesosauO hannahsung
	 
	 tokenize "`faculty'" //i.e., ``1'' -> segevdlauO, ``2'' -> gentryseau, etc
	 
	 if 1 {  //import pubmed .csv files
	     **********************************

		     noi di "papers by core faculty:"
			 noi di ""
			 
		 forvalues i=1/11 {
	
	         import delimited "csv-``i''-set.csv", encoding(UTF-8) clear 
			 gen faculty="``i''"
			 save dta-``i''.dta, replace 
	
         }	
		
	 }
	 
	 
	 if 2 {  //append .dta files
	 	**********************************

		  forvalues i=1/11 {
		  	 
			 clear 
			 append using dta-``i''.dta
			 noi di "``i'' " _N //tracking
			
		  }
		  
	      //building catalog
		  clear
		  forvalues i=1/11 {
		  	 
			 append using dta-``i''.dta
			 sort publicationyear pmid //i.e., create TRCID after filter
			
		  }

	  
		  if 3 { //filter out-of-scope articles 
		  	 **********************************

		  //pre-ergot, ergot, trc zeitgeist
          //The Best-Laid Schemes of Mice and Men Often Go Awry
		  *** bug alert!!! above title is missed by these keywords ***

		   global keyword ///
		       recipient donor donat transplant graft organ reject fail ///
			   match incomp kidney liver portal cirrhosis pancreas lung ///
               wait list frailty access biopsy ischemic meld unos optn srtr ///
			   renal opo allocation surg older geront geriat hope esrd ///
			   dialysis legislat advocat sensiti ckd readmi author reply ///
			   letter editor kdpi procure cognitive 
			   
			tokenize "$keyword"
			
			noi di ""
			noi di "filter by keyword:"
			noi di ""
 			count if strpos(title,"The Best-Laid Schemes")
			noi di "The Best-Laid Schemes.. Often Go Awry " r(N) //google pmid 
			noi di "PMID: 26382203"
			noi di ""

			postutil clear
			postfile memhold str20(keyword) int(count) using keywords, replace 
			forvalues i=1/46 {
				
				 //drop/keep within loop?
				 //always preserve/restore!
				 preserve
				     keep if strpos(title, "``i''") //filter step1
				     save keyword`i', replace
				     noi di  "``i'' " _N
					 post memhold ("``i''") (_N)

				 restore 
			

			}
			
			postclose memhold 

			
			 preserve
			     use keywords, clear 
                 gsort -count
                 //noi list 
			 restore 

             clear 
             forvalues i=1/46 {
				
				append using keyword`i'
				rm keyword`i'.dta

				
			 }
			 
			duplicates drop pmid, force //filter step2
			count if strpos(title,"The Best-Laid Schemes")
			noi di ""
			noi di "The Best-Laid Schemes.. Often Go Awry " r(N) 

			 
		  }
		  
		  //trc-catalog beyond 2023 requires seperate algorithm
		  keep if inrange(publicationyear,2005,2023) //filter step3
		  sort publicationyear pmid 
		  g TRCID=_n
		  order TRCID pmid publicationyear firstauthor journalbook title 
		  keep TRCID pmid publicationyear firstauthor journalbook title 
		  
		  no di ""
		  noi di "after duplicates dropped:"
		  noi di ""
		  noi di "catalog "_N
		  isid pmid 
		  
		  //aesthetics for ta-delimited .txt
		  format firstauthor %-14s
		  format journalbook %-14s
		  format title %-14s
		  recast str30 firstauthor
		  recast str30 journalbook
		  recast str120 title, force
		  save trc-catalog-v031523, replace 
		  export excel using "trc-catalog-v031523.xlsx", sheetreplace  firstrow(varlabels)
		  log close 
		  
	 }
	 
     //hist publicationyear
     //quiz: back-to-back first-author names in this catalog
     //sorted by publicationyear pmid 
     //does it signify anything?
     //author is on a roll!
     //write code to list instances

}

 




