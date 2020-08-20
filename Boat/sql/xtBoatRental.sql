
IF not exists (Select top 1 1 from sys.tables where name='xtBoatRental')
Begin
	Create table xtBoatRental
	(
		BoatRentalID BIGINT IDENTITY(1,1) NOT NULL,
		BoatID bigint,
		CustomerName Nvarchar(100),
		CONSTRAINT PK_xtBoatRental_BoatRentalID PRIMARY KEY (BoatRentalID)
	)
 End

 
 
   