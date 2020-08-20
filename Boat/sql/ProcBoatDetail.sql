--Store Procedure
 Create procedure ProcBoatDetail
(
	@ID	bigint=NULL,
	@Sptype bigint = NULL,
	@BoatName	nvarchar(100)=NULL,
	@HourlyRate	bigint=NULL,
	@CustomerName	bigint=NULL,
	@OutputValue BIGINT=NULL OUTPUT
)	
As
Begin
	IF(@Sptype = 1)	---- For Inserting New Record
	BEGIN
		IF NOT EXISTS (select TOP 1 1 from xtBoatDetails where BoatName=@BoatName)
		BEGIN
			insert into xtBoatDetails
				(BoatName,HourlyRate)
			values
				(@BoatName,@HourlyRate)
				SET @OutputValue=IDENT_CURRENT('xtBoatDetails')
		END
		ELSE
			SET @OutputValue=-100
		
	END
	ELSE IF( @Sptype = 2)	----  For Updating Existing Record as per Boat ID
BEGIN

   IF   EXISTS (select TOP 1 1 from xtBoatDetails where BoatID=@ID)
   BEGIN
		IF NOT EXISTS (select TOP 1 1 from xtBoatRental where BoatID=@ID)
		BEGIN
			insert into xtBoatRental
				(BoatID,CustomerName)
			values
				(@ID,@CustomerName)
				SET @OutputValue=200
			END
		ELSE
			SET @OutputValue=100
	END
	ELSE 
	SET @OutputValue=404
END
End