program hrdsys;
uses
  Forms,
  windows,
  UnitRegForm in 'public\UnitRegForm.pas',
  UnitHrdUtils in 'public\UnitHrdUtils.pas',
  UnitDMHrdsys in 'public\UnitDMHrdsys.pas' {DMHrdsys: TDataModule},
  UnitHrdMain in 'UnitHrdMain.pas' {hrdMainForm: TTntForm},
  UnitEmp in 'public\UnitEmp.pas' {FormEmp: TtntForm},
  UnitPrtTpl in 'public\UnitPrtTpl.pas' {FormPrtTpl: TForm},
  UnitPrtSet in 'public\UnitPrtSet.pas' {FormPrtSet: TtntForm},
  UnitHrd07 in 'SrcHrd\UnitHrd07.pas' {Formhrd07},
  UnitHrd08 in 'SrcHrd\UnitHrd08.pas' {FormHrd08},
  UnitHrd09 in 'SrcHrd\UnitHrd09.pas' {Formhrd09},
  UnitHrd10 in 'SrcHrd\UnitHrd10.pas' {Formhrd10},
  UnitHrd11 in 'SrcHrd\UnitHrd11.pas' {Formhrd11},
  UnitHrd12 in 'SrcHrd\UnitHrd12.pas' {Formhrd12},
  UnitPrthrd12 in 'SrcHrd\UnitPrthrd12.pas' {FormPrthrd12},
  UnitHrd13 in 'SrcHrd\UnitHrd13.pas' {FormHrd13},
  UnitHrd15 in 'SrcHrd\UnitHrd15.pas' {FormHrd15},
  UnitHrd16 in 'SrcHrd\UnitHrd16.pas' {FormHrd16},
  UnitHrd17 in 'SrcHrd\UnitHrd17.pas' {FormHrd17},
  UnitHrd18 in 'SrcHrd\UnitHrd18.pas' {FormHrd18},
  UnitHrd20 in 'SrcHrd\UnitHrd20.pas' {FormHrd20},
  UnitHrd21 in 'SrcHrd\UnitHrd21.pas' {FormHrd20},
  UnitHrd22 in 'SrcHrd\UnitHrd22.pas' {FormHrd22},
  UnitHrd30 in 'SrcHrd\UnitHrd30.pas' {FormHrd30},
  UnitDut01 in 'SrcDut\UnitDut01.pas' {FormDut01},
  UnitDut02 in 'SrcDut\UnitDut02.pas' {FormDut02},
  UnitDut03 in 'SrcDut\UnitDut03.pas' {FormDut03},
  UnitDut04 in 'SrcDut\UnitDut04.pas' {FormDut04},
  UnitDut05 in 'SrcDut\UnitDut05.pas' {FormDut05},
  UnitDut06 in 'SrcDut\UnitDut06.pas' {FormDut06},
  UnitDut07 in 'SrcDut\UnitDut07.pas' {FormDut07},
  UnitDut08 in 'SrcDut\UnitDut08.pas' {FormDut08},
  UnitDut09 in 'SrcDut\UnitDut09.pas' {FormDut09},
  UnitDut10 in 'SrcDut\UnitDut10.pas' {FormDut10},
  UnitDut11 in 'SrcDut\UnitDut11.pas' {FormDut11},
  UnitDut13 in 'SrcDut\UnitDut13.pas' {FormDut13},
  UnitDut14 in 'SrcDut\UnitDut14.pas' {FormDut14},
  UnitDut15 in 'SrcDut\UnitDut15.pas' {FormDut15},
  UnitDut16 in 'SrcDut\UnitDut16.pas' {FormDut16},
  UnitDut17 in 'SrcDut\UnitDut17.pas' {FormDut17},
  UnitDut18 in 'SrcDut\UnitDut18.pas' {FormDut18},
  UnitDut19 in 'SrcDut\UnitDut19.pas' {FormDut19},
  UnitDut20 in 'SrcDut\UnitDut20.pas' {FormDut20},
  UnitDut21 in 'SrcDut\UnitDut21.pas' {FormDut21},
  UnitDut22 in 'SrcDut\UnitDut22.pas' {FormDut22},
  UnitDut23 in 'SrcDut\UnitDut23.pas' {FormDut23},
  UnitDut24 in 'SrcDut\UnitDut24.pas' {FormDut24},
  UnitDut25 in 'SrcDut\UnitDut25.pas' {FormDut25},
  UnitDut26 in 'SrcDut\UnitDut26.pas' {FormDut26},
  UnitDut28 in 'SrcDut\UnitDut28.pas' {FormDut28},
  UnitDut29 in 'SrcDut\UnitDut29.pas' {FormDut29},
  UnitSal01 in 'SrcSal\UnitSal01.pas' {FormSal01},
  UnitSal02 in 'SrcSal\UnitSal02.pas' {FormSal02},
  UnitSal03 in 'SrcSal\UnitSal03.pas' {FormSal03},
  UnitSal04 in 'SrcSal\UnitSal04.pas' {FormSal04},
  UnitSal05 in 'SrcSal\UnitSal05.pas' {FormSal05},
  UnitSal06 in 'SrcSal\UnitSal06.pas' {FormSal06},
  UnitSal08 in 'SrcSal\UnitSal08.pas' {FormSal08},
  UnitSal09 in 'SrcSal\UnitSal09.pas' {FormSal09},
  UnitSal10 in 'SrcSal\UnitSal10.pas' {FormSal10},
  UnitSal11 in 'SrcSal\UnitSal11.pas' {FormSal11},
  UnitSal12 in 'SrcSal\UnitSal12.pas' {FormSal12},
  UnitSal13 in 'SrcSal\UnitSal13.pas' {FormSal13},
  UnitSal14 in 'SrcSal\UnitSal14.pas' {FormSal14},
  UnitSal16 in 'SrcSal\UnitSal16.pas' {FormSal16},
  UnitSal19 in 'SrcSal\UnitSal19.pas' {FormSal16},
  UnitSal20 in 'SrcSal\UnitSal20.pas' {FormSal20},
  UnitSal22 in 'SrcSal\UnitSal22.pas' {FormSal22},
  UnitSal23 in 'SrcSal\UnitSal23.pas' {FormSal23},
  UnitSal24 in 'SrcSal\UnitSal24.pas' {FormSal23},
  UnitCosSal01 in 'SrcSal\UnitCosSal01.pas' {FormCosSal01},
  UnitCosSal05 in 'SrcSal\UnitCosSal05.pas' {FormCosSal05},
  UnitBus01 in 'SrcBus\UnitBus01.pas' {FormBus01},
  UnitBus02 in 'SrcBus\UnitBus02.pas' {FormBus02},
  UnitBus03 in 'SrcBus\UnitBus03.pas' {FormBus03},
  UnitBus04 in 'SrcBus\UnitBus04.pas' {FormBus04},
  UnitMed01 in 'SrcMed\UnitMed01.pas' {FormMed01},
  UnitMed02 in 'SrcMed\UnitMed02.pas' {FormMed02},
  UnitMed03 in 'SrcMed\UnitMed03.pas' {FormMed03},
  UnitMed04 in 'SrcMed\UnitMed04.pas' {FormMed04},
  UnitMed05 in 'SrcMed\UnitMed05.pas' {FormMed05},
  UnitMed06 in 'SrcMed\UnitMed06.pas' {FormMed06},
  UnitMed07 in 'SrcMed\UnitMed07.pas' {FormMed07},
  UnitMed08 in 'SrcMed\UnitMed08.pas' {FormMed08},
  UnitMed09 in 'SrcMed\UnitMed09.pas' {FormMed09},
  UnitMed10 in 'SrcMed\UnitMed10.pas' {FormMed10},
  UnitMed11 in 'SrcMed\UnitMed11.pas' {FormMed11},
  UnitMed12 in 'SrcMed\UnitMed12.pas' {FormMed12},
  UnitMed13 in 'SrcMed\UnitMed13.pas' {FormMed13},
  UnitMed14 in 'SrcMed\UnitMed14.pas' {FormMed14},
  uFhrd101 in 'SrcFhrd\uFhrd101.pas' {FormFhrd101},
  uFhrd102 in 'SrcFhrd\uFhrd102.pas' {FormFhrd102},
  uFhrd103 in 'SrcFhrd\uFhrd103.pas' {FormFhrd103},
  uFhrd104 in 'SrcFhrd\uFhrd104.pas' {FormFhrd104},
  uFhrd105 in 'SrcFhrd\uFhrd105.pas' {FormFhrd105},
  uFhrd202 in 'SrcFhrd\uFhrd202.pas' {FormFhrd202},
  uFhrd203 in 'SrcFhrd\uFhrd203.pas' {FormFhrd203},
  uFhrd301 in 'SrcFhrd\uFhrd301.pas' {FormFhrd301},
  uFhrd302 in 'SrcFhrd\uFhrd302.pas' {FormFhrd302},
  uFhrd303 in 'SrcFhrd\uFhrd303.pas' {Formfhrd303},
  uFhrd304 in 'SrcFhrd\uFhrd304.pas' {Formfhrd304},
  uFhrd305 in 'SrcFhrd\uFhrd305.pas' {Formfhrd305},
  uFhrd306 in 'SrcFhrd\uFhrd306.pas' {Formfhrd306},
  uFhrd307 in 'SrcFhrd\uFhrd307.pas' {Formfhrd307},
  uFhrd308 in 'SrcFhrd\uFhrd308.pas' {Formfhrd308},
  uFhrd309 in 'SrcFhrd\uFhrd309.pas' {Formfhrd309},
  uFhrd310 in 'SrcFhrd\uFhrd310.pas' {FormFhrd310},
  uFhrd311 in 'SrcFhrd\uFhrd311.pas' {FormFhrd311},
  uFhrd312 in 'SrcFhrd\uFhrd312.pas' {FormFhrd312},
  uFhrd313 in 'SrcFhrd\uFhrd313.pas' {FormFhrd313},
  uFhrd314 in 'SrcFhrd\uFhrd314.pas' {FormFhrd314},
  uFhrd401 in 'SrcFhrd\uFhrd401.pas' {Formfhrd401},
  uFhrd402 in 'SrcFhrd\uFhrd402.pas' {Formfhrd402},
  uFhrd403 in 'SrcFhrd\uFhrd403.pas' {Formfhrd403},
  uFhrd404 in 'SrcFhrd\uFhrd404.pas' {Formfhrd403},
  uPrtFhrd310 in 'SrcFhrd\uPrtFhrd310.pas' {FormFhrd310},
  uPrtFhrd310_rub in 'SrcFhrd\uPrtFhrd310_rub.pas' {FormPrtFhrd310_rub},
  uPrtFhrd314 in 'SrcFhrd\uPrtFhrd314.pas' {FormFhrd314},
  uFhrd305Report in 'SrcFhrd\uFhrd305Report.pas' {Fhrd305Report},
  uFhrd306Report in 'SrcFhrd\uFhrd306Report.pas' {Fhrd306Report},
  uFhrd306ReportA in 'SrcFhrd\uFhrd306ReportA.pas' {Fhrd306ReportA},
  uFhrd307Report in 'SrcFhrd\uFhrd307Report.pas' {Fhrd307Report},
  uFhrd307ReportA in 'SrcFhrd\uFhrd307ReportA.pas' {Fhrd307ReportA},
  uFhrd307ReportB in 'SrcFhrd\uFhrd307ReportB.pas' {Fhrd307ReportB},
  uFhrd401Report in 'SrcFhrd\uFhrd401Report.pas' {Fhrd401Report},
  uFhrd402ReportA in 'SrcFhrd\uFhrd402ReportA.pas' {Fhrd402ReportA},
  uFhrd402ReportH in 'SrcFhrd\uFhrd402ReportH.pas' {Fhrd402ReportH},
  uFhrd102A in 'SrcFhrd\uFhrd102A.pas' {FormFhrd102A},
  UnitPrtDut11 in 'SrcDut\UnitPrtDut11.pas' {FormPrtDut11},
  UnitPrtDut15 in 'SrcDut\UnitPrtDut15.pas' {FormPrtDut15},
  UnitPrtDut29 in 'SrcDut\UnitPrtDut29.pas' {FormPrtDut29},
  UnitPrtSal10 in 'SrcSal\UnitPrtSal10.pas' {FormPrtSal10},
  UnitPrtSal19_rub in 'SrcSal\UnitPrtSal19_rub.pas' {FormPrtSal19_rub},
  UnitPrtSal19_fac in 'SrcSal\UnitPrtSal19_fac.pas' {FormPrtSal19_fac},
  UnitPrtSal12 in 'SrcSal\UnitPrtSal12.pas' {FormPrtSal12},
  UnitSal26 in 'SrcSal\UnitSal26.pas' {FormSal26},
  UnitDut27 in 'SrcDut\UnitDut27.pas' {FormDut27},
  uFhrd204 in 'SrcFhrd\uFhrd204.pas' {FormFhrd204},
  uFhrd205 in 'SrcFhrd\uFhrd205.pas' {Formfhrd205},
  uFhrd206 in 'SrcFhrd\uFhrd206.pas' {Formfhrd206},
  uFhrd207 in 'SrcFhrd\uFhrd207.pas' {Formfhrd207},
  uFhrd208 in 'SrcFhrd\uFhrd208.pas' {Formfhrd208},
  ufhrd209 in 'SrcFhrd\ufhrd209.pas' {Formfhrd209},
  ufhrd210 in 'SrcFhrd\ufhrd210.pas' {Formfhrd210},
  ufhrd211 in 'SrcFhrd\ufhrd211.pas' {FormFhrd211},
  ufhrd212 in 'SrcFhrd\ufhrd212.pas' {Formfhrd212},
  ufhrd213 in 'SrcFhrd\ufhrd213.pas' {FormFhrd213},
  ufhrd214 in 'SrcFhrd\ufhrd214.pas' {FormFhrd214},
  ufhrd215 in 'SrcFhrd\ufhrd215.pas' {FormFhrd215},
  ufhrd216 in 'SrcFhrd\ufhrd216.pas' {FormFhrd216},
  ufhrd217 in 'SrcFhrd\ufhrd217.pas' {FormFhrd217},
  UnitSal28 in 'SrcSal\UnitSal28.pas' {FormSal28},
  UnitDut12 in 'SrcDut\UnitDut12.pas' {FormDut12},
  UnitPrtDut12 in 'SrcDut\UnitPrtDut12.pas' {FormPrtDut12},
  UnitSal21 in 'SrcSal\UnitSal21.pas' {FormSal21},
  UnitSal25 in 'SrcSal\UnitSal25.pas' {Formsal25},
  UnitSal27 in 'SrcSal\UnitSal27.pas' {Formsal27},
  UnitSal32 in 'SrcSal\UnitSal32.pas' {Formsal32},
  UnitDut39 in 'SrcDut\UnitDut39.pas' {FormDut39},
  UnitHrd24 in 'SrcHrd\UnitHrd24.pas' {FormHrd24},
  UnitHrd65 in 'SrcHrd\UnitHrd65.pas' {FormHrd65},
  UnitPrtHrd24 in 'SrcHrd\UnitPrtHrd24.pas' {FormPrtHrd24},
  UnitSal34 in 'SrcSal\UnitSal34.pas' {FormSal34},
  UnitHrd73 in 'SrcHrd\UnitHrd73.pas' {formhrd73},
  UnitHrd72 in 'SrcHrd\UnitHrd72.pas' {FormHrd72},
  UnitPrtHrd73 in 'SrcHrd\UnitPrtHrd73.pas' {FormPrtHrd73},
  UnitDut40 in 'SrcDut\UnitDut40.pas' {FormDut40},
  UnitSal18 in 'SrcSal\UnitSal18.pas' {FormSal18},
  UnitPrtDut12_hb in 'SrcDut\UnitPrtDut12_hb.pas' {FormPrtDut12_hb},
  UnitSal07 in 'SrcSal\UnitSal07.pas' {FormSal07},
  UnitSal37 in 'SrcSal\UnitSal37.pas' {FormSal37},
  UnitSal15 in 'SrcSal\UnitSal15.pas' {FormSal15},
  prtSal15 in 'SrcSal\prtSal15.pas' {FormPrtSal15};

// uFhrd204 in 'SrcFhrd\uFhrd204.pas' {FormFhrd204};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDMHrdsys, DMHrdsys);
  Application.CreateForm(ThrdMainForm, hrdMainForm);
  // Application.CreateForm(TFormEmp, FormEmp);
 // Application.CreateForm(TFormPrtTpl, FormPrtTpl);
 // Application.CreateForm(TFormPrtSet, FormPrtSet);
  Application.Run;
end.