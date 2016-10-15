USE [MDLABData]
GO
INSERT INTO [dbo].[TestPanelInfo]
	([TestPanelID], [TestSubpanelID], [Description])
VALUES
	(1, 0, 'Hormonal panel'),
	(1, 1, 'Thyroid panel'),
	(1, 2, 'Phosphorus-calcium exchange panel'),
	(1, 3, 'Reproductive panel'),
	(1, 4, 'Hypothalamic-pituitary-adrenal hormones panel'),
	(1, 5, 'Carbohydrate metabolism disorders panel'),
	(2, 0, 'Prenatal diagnosis panel'),
	(3, 0, 'Karyotyping panel'),
	(4, 0, 'Oncological panel'),
	(5, 0, 'Infectious panel'),
	(5, 1, 'Hepatitis'),
	(5, 4, 'Other infections'),
	(5, 21, 'CMV-infection'),
	(5, 22, 'Herpetic infection'),
	(5, 41, 'Parasitic studies'),
	(6, 0, 'Immunological panel'),
	(6, 1, 'Autoimmunological studies'),
	(6, 2, 'Diagnosis of immune causes of infertility'),
	(6, 3, 'Diagnosis of celiac disease'),
	(6, 4, 'Rheumatoid panel'),
	(6, 5, 'Immune system indices'),
	(6, 6, 'Diagnosis of antiphospholipidic syndrome'),
	(7, 0, 'Bacteriological studies panel'),
	(8, 0, 'Cytological studies panel'),
	(10, 0, 'Biochemical studies panel'),
	(10, 1, 'Clinical Chemistry'),
	(10, 2, 'Lipid metabolism indices'),
	(10, 3, 'Vitamins'),
	(10, 4, 'Diagnosis of anemia'),
	(10, 5, 'Cardiovascular disease markers'),
	(10, 6, 'Acute phase markers'),
	(11, 0, 'General clinical studies panel'),
	(11, 1, 'Blood test'),
	(11, 2, 'Hemostasis evaluation'),
	(11, 3, 'Urine test'),
	(11, 4, 'Stool test'),
	(12, 0, 'Non-invasive method of assessing liver panel'),
	(13, 0, 'Other studies panel'),
	(13, 1, 'Drugs monitoring'),
	(13, 2, 'Heavy metals'),
	(13, 3, 'Amino acids'),
	(14, 0, 'Genetic studies panel');
GO

INSERT INTO [dbo].[Laboratories]
	([NumberBuilding], [NumberStreet], [Street], [City], [Country])
VALUES
	(NULL, 33, 'Konovaltsia', 'Lviv', 'Ukraine'),
	(NULL, 104, 'Lubinska', 'Lviv', 'Ukraine'),
	(NULL, 113, 'Volodymyra Velykogo', 'Lviv', 'Ukraine'),
	(NULL, 15, 'Nekrasova', 'Lviv', 'Ukraine'),
	('b', 2, 'Chornovola', 'Lviv', 'Ukraine'),
	(NULL, 12, 'Lychakivska', 'Lviv', 'Ukraine'),
	(NULL, 21, 'Sykhivska', 'Lviv', 'Ukraine'),
	('b', 25, 'Getmana Mazepy', 'Lviv', 'Ukraine'),
	(NULL, 53, 'Chervonoyi Kalyny', 'Lviv', 'Ukraine');
GO

INSERT INTO [dbo].[TestTypes]
	([TestTypeCode], [TestPanelCode], [TestSubpanelCode], [TestDescription], [UnitPrice])
VALUES
	(2001, 1, 1, 'Microsomal antibodies (AMS thyroid)', 140.00),
	(1002, 1, 1, 'Thyroglobulin, antibodies (ATG)', 160.00),
	(1004, 1, 1, 'Thyroid Stimulating Hormone (TSH)', 140.00),
	(1095, 1, 1, 'Package # 1 (Thyroid: TSH, T4 free, AMSt) (Thyroid Stimulating Hormone (TSH); Free Thyroxine (T4 free); Microsomal antibodies (AMS thyroid))', 360.00),
	(1096, 1, 1, 'Package # 2 (Thyroid: TSH, T3 free, T4 free) (Thyroid Stimulating Hormone (TSH); Free Thyroxine (T4 free); Free Triiodthyronine (T3 free))', 360.00),
	(1703, 1, 1, 'Package # 274 (Monitoring of thyroid cancer) (Thyroid Stimulating Hormone (TSH); Thyroglobulin, antibodies (ATG); Thyroglobulin (TG); Free Thyroxine (T4 free))', 450.00),
	(1131, 1, 1, 'Package # 3 (Screening of thyroid autoimmune diseases) (Thyroid Stimulating Hormone (TSH); Thyroid peroxidase, antibodies (ATPO); Thyroglobulin, antibodies (ATG))', 350.00),
	(1157, 1, 1, 'Package # 3.1 (Thyroid: TSH, T4 Free, ATPO) (Thyroid Stimulating Hormone (TSH); Thyroid peroxidase, antibodies (ATPO); Free Thyroxine (T4 free))', 400.00),
	(1158, 1, 1, 'Package # 3.2 (Thyroid: TSH, T4 Free, ATG) (Thyroid Stimulating Hormone (TSH); Thyroglobulin, antibodies (ATG); Free Thyroxine (T4 free))', 340.00),
	(1159, 1, 1, 'Package # 3.3 (Thyroid: TSH, T4 Free, ATG, calcitonin) (Thyroid Stimulating Hormone (TSH); Thyroglobulin, antibodies (ATG); Free Thyroxine (T4 free); Calcitonin)', 550.00),
	(1218, 1, 1, 'Package # 3.5 (Thyroid: TSH, ATPO, T3 Free, T4 Free) (Thyroid Stimulating Hormone (TSH); Thyroid peroxidase, antibodies (ATPO); Free Thyroxine (T4 free); Free Triiodthyronine (T3 free))', 450),
	(1111, 1, 1, 'Package # 35 (Autoimmune disorders. Thyroid) (Thyroid Stimulating Hormone (TSH); Thyroid peroxidase, antibodies (ATPO); Thyroglobulin, antibodies (ATG); Free Thyroxine (T4 free); Free Triiodthyronine (T3 free); TSH receptor, IgG antibodies (Anti-TSHR))', 750.00),
	(1228, 1, 2, 'Vitamin D total (D2+D3)', 330.00),
	(9205, 1, 2, 'Marker of bone matrix formation (Total P1NP)', 550.00),
	(1022, 1, 2, 'Osteocalcin', 300.00),
	(1704, 1, 2, 'Package # 275 (Diagnosis of hyperparathyroidism) (Parathyroid hormone; Phosphorus; Ionized calcium (serum); Vitamin D total (D2+D3))', 490.00),
	(1163, 1, 2, 'Package # 3.4 (Parathyroid) (Parathyroid hormone; Phosphorus; Ionized calcium (serum))', 250.00),
	(1113, 1, 2, 'Package # 37 (Condition of bones) (Calcium total (serum); Parathyroid hormone; Osteocalcin; Phosphorus)', 440.00),
	(9000, 1, 3, 'Androstenedione', 200.00),
	(2084, 1, 3, 'Anti-Mullerian hormone (AMH, MIS)', 340.00),
	(1009, 1, 3, 'Luteinizing Hormone (LH)', 160.00),
	(1010, 1, 3, 'Progesterone', 160.00),
	(1011, 1, 3, 'Prolactine', 160.00),
	(1013, 1, 3 ,'Total Testosterone (T total)', 160.00),
	(2002, 1, 3, 'Free Testosterone (T free)', 200.00),
	(1572, 1, 3, 'Package # 128 (Hyperprolactinemia) (Thyroid Stimulating Hormone (TSH); Free Thyroxine (T4 free); Prolactin )', 340.00),
	(1097, 1, 3, 'Package # 13 (Hormonal 1) (Luteinizing Hormone (LH); Prolactin ; Follicle stimulating hormone (FSH))', 360.00),
	(1214, 1, 3, 'Package # 14.3 (Hormonal 5) (Dehydroepiandrosterone sulfate (DHEA-S); Free Testosterone (T free); Cortisol)', 440.00),
	(1134, 1, 3, 'Package # 15 (Free testosterone index) (Sex hormone-binding globulin (SHBG); Total Testosterone (T total); Free androgen index (total testosterone/SHBG))', 260.00),
	(2005, 1, 4, 'Human growth hormone (HGH)', 170.00),
	(2220, 1, 4, 'Vascular endothelial growth factor-A (VEGF-A)', 1400.00),
	(1268, 1, 4, 'Package # 47 (Growth factors) (Human growth hormone (HGH); Insulin-like growth factor - 1 (IGF-1); Insulin-like growth factor binding protein 3 (IGF-BP3))', 540.00),
	(1080, 1, 5, 'Glycated hemoglobin (HbA1c)', 150.00),
	(1078, 1, 5, 'Glucose (daily urine)', 80.00),
	(1079, 1, 5, 'Glucose (serum)', 80.00),
	(1019, 1, 5, 'Insulin', 160.00),
	(9305, 1, 5, 'Proinsulin', 450.00),
	(2111, 1, 5, 'Tyrosine, IgG antibodies', 550.00),
	(1576, 1, 5, 'Package # 134 (Violation of carbohydrate metabolism) (Glucose (serum); Insulin; Connecting Peptide (C-Peptide); Glycated hemoglobin (HbA1c); Calculation of HOMA index)', 440.00),
	(1105, 2, 0, 'PAPP-A (Pregnancy-Associated Plasma Protein A)', 200.00),
	(2082, 2, 0, 'Placental lactogen',270.00),
	(2004, 2, 0, 'Free estriol (E3)', 150.00),
	(7026, 2, 0, 'Karyotyping (chorionic villi), CITO', 4500.00),
	(7025, 2, 0, 'Karyotyping (chorionic villi)', 1700.00),
	(1024, 4, 0, 'Neuron-specific enolase (NSE)', 280.00),
	(2094, 4, 0, 'Tumor marker HE4', 370.00),
	(2006, 5, 1, 'Hepatitis A virus (HAV), IgG antibodies', 180.00),
	(1034, 5, 1, 'Hepatitis A virus (HAV), IgM antibodies', 180.00),
	(1144, 5, 1, 'Hepatitis A virus (HAV), total antibodies', 190.00),
	(2008, 5, 1, 'Hepatitis B virus (HBV), HBeAg, total antibodies', 220.00),
	(2015, 5, 1, 'Hepatitis D virus (HDV), total antibodies', 190.00),
	(2017, 5, 1, 'Hepatitis E virus (HEV), IgG antibodies', 160.00),
	(2016, 5, 1, 'Hepatitis E virus (HEV), IgM antibodies', 160.00),
	(1573, 5, 1, 'Package # 131 (Primary screening for hepatitis B) (Hepatitis B virus (HBV), HbsAg (Australia antigen); Hepatitis B virus (HBV), HBcorAg, total antibodies)', 280.00),
	(1622, 5, 1, 'Package # 174 (Primary screening for hepatitis B and C) (Hepatitis B virus (HBV), HbsAg (Australia antigen); Hepatitis B virus (HBV), HBcorAg, total antibodies; Hepatitis C virus (HCV), IgM antibodies; Hepatitis C virus (HCV), antigens cor, NS3, NS4, NS5, IgG antibodies)', 610.00),
	(2231, 5, 4, 'Leishmania spp., IgG antibodies', 190.00),
	(2229, 5, 4, 'Schistosoma mansoni, IgG antibodies', 200.00),
	(2232, 5, 4, 'Trypanosoma cruzi, IgG antibodies', 220.00),
	(3045, 5, 21, 'PCR. Cytomegalovirus (buccal scraping, qualitative determination)', 160.00);
GO

INSERT INTO [dbo].[UserRoles]
	([Description])
VALUES
	('ADMIN'),
	('STAFF'),
	('PATIENT');
GO

insert into [dbo].[Users]
	([UserName], [RoleID])
values
	('admin', 1),
	('d_staff', 2),
	('user', 3);
GO
insert into [dbo].[Patients]
	([PatientID], [FirstName], [LastName], [Gender], [Phone])
values
	(3, 'Dear', 'Patient', 1, 380980000012);
GO
insert into [dbo].[Staff]
	([StaffID], [LaboratoryID], [IDCardNumber], [FirstName], [LastName])
values
	(2, 1, 57000123, 'Staff', 'Member');
GO
-- generate some random password salt
DECLARE @psalt varchar(32)
SELECT @psalt = CAST(ROUND(RAND()*1e4, 0) as varchar)
-- hash simple password
DECLARE @upass varbinary(16)
SELECT @upass = HASHBYTES('MD5', '1111')
INSERT INTO [dbo].[UserCredentials]
	([PasswordID], [PasswordSalt], [PasswordHash])
values
	(3, @psalt, HASHBYTES('MD5', @psalt + CAST(@upass as varchar)));
GO
