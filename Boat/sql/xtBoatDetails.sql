
 
  

IF not exists (Select top 1 1 from sys.tables where name='xtBoatDetails')
Begin
	Create table xtBoatDetails
	(
		BoatID BIGINT IDENTITY(1,1) NOT NULL,
		BoatName NVARCHAR(100),
		HourlyRate bigint,
		CONSTRAINT PK_xtBoatDetails_BoatID PRIMARY KEY (BoatID)
	)
 End

 
 
  