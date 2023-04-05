


# 1. ERGOT SRTR analytical code [^1]

**Look for code by Ctrl+F**
**Be aware that there will be a 6-month lag in SRTR data update for outcomes that need follow-up, such as death and graft failure. So for example if you have Sep 2015 data set, it’s safer to include data in or earlier than Mar 2015 for analysis of these outcomes**
**For candidate datasets, can_endwlfu indicates the last date of follow-up**
**For donor dispositions, such as discard, there is no lag**
**Discuss how to model missing data with your mentor- model-wise deletion? Imputation? Missing indicator? <- probably not the last option **


1. [Patient survival/death](https://raw.githubusercontent.com/jhutrc/jhutrc.github.io/main/1.patient.survival.do)
2. [graft survival (death censored and all-cause)](https://raw.githubusercontent.com/jhutrc/jhutrc.github.io/main/2.graft.survival.do)
3. [DGF](https://raw.githubusercontent.com/jhutrc/jhutrc.github.io/main/3.dgf.do)
4. [PNF](https://raw.githubusercontent.com/jhutrc/jhutrc.github.io/main/4.pnf.do)
5. [Acute rejection](https://raw.githubusercontent.com/jhutrc/jhutrc.github.io/main/5.acute.rejection.do)
6. [Racial category](https://raw.githubusercontent.com/jhutrc/jhutrc.github.io/main/6.racial.category.do)
7. [PRA (Panel Reactive Antibody)](https://raw.githubusercontent.com/jhutrc/jhutrc.github.io/main/7.pra.do),[Time-varying PRA](https://raw.githubusercontent.com/jhutrc/jhutrc.github.io/main/7.time.varying.pra.do)
8. [Kidney disease etiology/diagnosis](https://raw.githubusercontent.com/jhutrc/jhutrc.github.io/main/8.kidney.disease.etiology.do)
9. [Fix ABO](https://raw.githubusercontent.com/jhutrc/jhutrc.github.io/main/9.fix.abo.do)/[ABO mismatch](https://raw.githubusercontent.com/jhutrc/jhutrc.github.io/main/9.abo.mismatch.dohttps://raw.githubusercontent.com/jhutrc/jhutrc.github.io/main/9.abo.mismatch.do)
10. [Age categories](https://raw.githubusercontent.com/jhutrc/jhutrc.github.io/main/10.age.do)
11. [BMI](https://raw.githubusercontent.com/jhutrc/jhutrc.github.io/main/11.bmi.do)
12. [CIT (Cold Ischemia Time)](https://raw.githubusercontent.com/jhutrc/jhutrc.github.io/main/12.cit.do)
13. [Donor DM, HTN, terminal SCr>1.5, and manually recode ECD](https://raw.githubusercontent.com/jhutrc/jhutrc.github.io/main/13.donorDM.htn.scr.ecd.do), [SCr Assessment](https://raw.githubusercontent.com/jhutrc/jhutrc.github.io/main/13.creatinine.assessment.do)
14. [HLA mismatch](https://raw.githubusercontent.com/jhutrc/jhutrc.github.io/main/14.hla.do)
15. [Duration of pre-KT dialysis (vs listing?)](https://raw.githubusercontent.com/jhutrc/jhutrc.github.io/main/15.duration.of.dialysis.do)
16. HCV (by diagnosis for [candidate](https://raw.githubusercontent.com/jhutrc/jhutrc.github.io/main/16.candidate.hcv.do)/by serostatus for [recip](https://raw.githubusercontent.com/jhutrc/jhutrc.github.io/main/16.recipient.hcv.do)/by serostatus for [donor](https://raw.githubusercontent.com/jhutrc/jhutrc.github.io/main/16.donor.hcv.do))
17. [HCC (by diagnosis/by exception points)](https://raw.githubusercontent.com/jhutrc/jhutrc.github.io/main/17.hcc.do)
18. [Immunosuppression/Induction](https://raw.githubusercontent.com/jhutrc/jhutrc.github.io/main/18.immunosuppression.do)
19. [Insurance](https://raw.githubusercontent.com/jhutrc/jhutrc.github.io/main/19.insurance.do)
20. [KDRI/KDPI](https://raw.githubusercontent.com/jhutrc/jhutrc.github.io/main/20.kdpr.do)
21. [DRI](https://raw.githubusercontent.com/jhutrc/jhutrc.github.io/main/21.dri.do)
22. [EPTS](https://raw.githubusercontent.com/jhutrc/jhutrc.github.io/main/22.epts.dohttps://raw.githubusercontent.com/jhutrc/jhutrc.github.io/main/22.epts.do)
23. [Machine perfusion](https://raw.githubusercontent.com/jhutrc/jhutrc.github.io/main/23.machine.perfusion.do)
24. [MELD (listing /transplant)](https://raw.githubusercontent.com/jhutrc/jhutrc.github.io/main/24.meld.do)
25. [Previous solid organ Tx/ previous KT](https://raw.githubusercontent.com/jhutrc/jhutrc.github.io/main/25.previous.transplant.do)
26. [Organ Sharing](https://raw.githubusercontent.com/jhutrc/jhutrc.github.io/main/26.organ.sharing.do)
27. [De-identification Code](https://raw.githubusercontent.com/jhutrc/jhutrc.github.io/main/27.d-identification.code.do)
28. [Transplant Date](https://raw.githubusercontent.com/jhutrc/jhutrc.github.io/main/28.transplant.date.do)
29. [LDPKI](https://raw.githubusercontent.com/jhutrc/jhutrc.github.io/main/29.ldpki.do)

[^1]: by Allan Massie et al.


# 2. Some additional notes about SRTR models 

OK to use the SRTR 2014 model. Pay attention to the model updates.
NEW variables in latest SRTR Deceased-Donor Kidney 1 yr Graft Survival issued in 2015:
Candidate symptomatic peripheral vascular disease (0.1% - 2.9% 2000-2014)
Candidate Total Albumin (41% missing in 2000 -> declines almost linearly to 7% missing In 2014)
Donor Arginine Vasopressin (introduced in 2005, and extremely non-missing since then (0.05-0.12% missing per year)
Donor Drug-treated Systemic Hypertension (introduced in ’95, missingness: 0.03%-0.1% from 2000-2014) *also note increasing yes’s over time, which could be an indication of ppl reporting it more or increased use of these drugs given the obesity epidemic<- could combine witfdh donor history of hypertension
Recip Did the patient receive any pre-tx blood transfusions? (rec_pretx_txfus missing 0.01% from 2000-2013, 1.2% 2014) don’t use can_prev_txfus!!

