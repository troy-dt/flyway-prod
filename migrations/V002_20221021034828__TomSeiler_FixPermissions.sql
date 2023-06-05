SET NUMERIC_ROUNDABORT OFF
GO
SET ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT, QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
PRINT N'Altering [dbo].[vw_ReportingSnapshotLatest_KpisCombined_All]'
GO

ALTER view [dbo].[vw_ReportingSnapshotLatest_KpisCombined_All]
as
/*
select * from [dbo].[vw_ReportingSnapshotLatest_KpisCombined_All] where projectid = 387  -- ts local pea 55secs, 156492 rows

		TS 2020-12-09 ... create. fixed set of attribute fields. 
							manipulate StatisticTypeID (=9 for attributes) to push stats into fields.
							Attributes are fields obvs.
							add fields to teh pivot as needed
							best bet will be to dynamic pivot again, maybe in the php and feed through an API to power BI.
		ts 2021-01-30 ... added timestamp (=inputtimestamp) from teh main kpi select. the attribute one was not right anyway?
		ts 2021-02-01 ... added projectid for filtering
		ts 2021-02-24 ... add commments
		ts 2021-06-09 ... shifted teh join to ips back up to main view
		ts 2021-06-17 ... added PlodDAtaId (= stagingid)
		ts 2021-06-22 ... create from view KPINew_AllMappedPrimaryKpis_WithAttributes, customise field set to suit MCR
		ts 2021-06-23 ... add RelatedEquipId
		ts 2021-06-24 ... add start and end times
		ts 2021-06-25 ... add revised value.
		ts 2021-06-28 ... pull attrypedesc from attributes view
		ts 2021-07-14 ... create new version in two parts. join in Power BI
		ts 2021-07-20 ... create, dynamically!!

auto-created on:Jun 26 2022  5:12PM
--use this to find all fields:
select Distinct [a_AttrTypeDesc] from tbl_DWH_Attributes_v3 where a_projectid = 387



todo:
add related equipment code!
change teh projectid filter at the bottom to be 399


*/

--the attributes: fixed pivot for now.add or subtract fields as necessary. put the dynamic pivot back into teh web and service an api for suckinginto reporting.
select [a].[UniqueDataSetId]
     , [a].[Date]
     , [a].[Shift]
     , [a].[ProjectID]
     , [a].[ActualValue]


     , [a].[MetricValue]
     , [a].[TargetValue]

     , [a].[MetricCode]
     , [a].[MetricDesc]
     , [a].MetricSubtotalCode
     , [a].[StatisticCode]
     , [a].Units
     , [a].EmployeeName
     , [a].EquipmentCode
     , [a].LocationCode







     , [a].Site
     , [a].[ActivityDesc]

     , [a].BogFrom
     , [a].BogTo
     , [a].BudgetCode
     , [a].ConsumableDesc
     , [a].[ConsumableDescShort]
     , [a].CrewCode
     , [a].DestDestCode
     , [a].DestinationCode
     , [a].[DumpedTimeStamp]
     , [a].[DumpedTruckCount]

     , [a].[EndTime]

     , [a].EquipTypeCode
     , [a].[InputComment]
     , [a].[InputPhoto]
     , [a].[InputTimeStamp]
     , [a].Level
     , [a].LoadedAtCode
     , [a].[LoadedTimestamp]
     , [a].[LoadedTruckCount]

     , [a].LocnMasterSourceCode
     , [a].LocnSourceCode
     , [a].Material
     , [a].MaterialDescOp

     , [a].[OriginalValue]
     , [a].ProcessDesc
     , [a].ProjectMask
     , [a].[ReasonDescription]
     , [a].[RevisedValue]
     , [a].[StartTime]


     , [a].[SupervisorComments]

     , [Chainage] =       coalesce(b.[Chainage], bb.[Chainage])
     , [HaulDistance] =   coalesce(b.[HaulDistance], bb.[HaulDistance])
     , [HoleDepth] =      coalesce(b.[HoleDepth], bb.[HoleDepth])
     , [HoleDiam] =       coalesce(b.[HoleDiam], bb.[HoleDiam])
     , [HRS (COMP)] =     coalesce(b.[HRS (COMP)], bb.[HRS (COMP)])
     , [HRS (ENG)] =      coalesce(b.[HRS (ENG)], bb.[HRS (ENG)])
     , [HRS-PERC1] =      coalesce(b.[HRS-PERC1], bb.[HRS-PERC1])
     , [HRS-PERC2] =      coalesce(b.[HRS-PERC2], bb.[HRS-PERC2])
     , [HRS-PPACK1] =     coalesce(b.[HRS-PPACK1], bb.[HRS-PPACK1])
     , [HRS-PPACK2] =     coalesce(b.[HRS-PPACK2], bb.[HRS-PPACK2])
     , [KM] =             coalesce(b.[KM], bb.[KM])
     , [SprayThickness] = coalesce(b.[SprayThickness], bb.[SprayThickness])
     , [TimeStamp] =      coalesce(b.[TimeStamp], bb.[TimeStamp])
from [syn_STO_ReportingSnapshot_KpiStats_All] as a

  left join (
    select --join fields
      --PvtJn_TaskID = a.detailid  --integer.
      ProjectId
    , PvtJn_TaskId
    , PvtJn_InputGroupId
      --,PvtJn_OperatorDateShift =NULL -- CAST(OperatorId AS varchar) + +CAST(date AS varchar)++Shift

      --the field with teh dynamic field names:
    , Pvt_FieldNames
      --the field with the values to be pivoted. no need to aggregate, I am already aggregating here (can do a count or whatever I want)
    , Pvt_Value = max(a.[AttributeValue])

    from
    --dbo.tbl_DWH_ProdDataStorage AS pds
    --INNER JOIN  select * from 
    dbo.[syn_STO_ReportingSnapshot_AttributesTable_All] as a with (nolock)  --v3 has only attributes.
    --ON a.DetailID = pds.DetailID
    --and pds.[Sequence] = a.[Sequence] dont do seuqnce on the join! because stat7 is only on sequence 0
    --INNER JOIN dbo.tbl_SYS_AttributeType AS at  WITH (NOLOCK)
    --        ON a.AttributeTypeID = at.AttTypeID
    where PvtJn_InputGroupId >= 0
    -- WHERE --pds.ProjectID = @ProjectID 
    --  a_ProjectId = 399
    --AND pds.Date BETWEEN @Date AND @Date2
    --AND pds.BudgetCodeID =1
    --AND pds.StatisticID = 7
    group by a.PvtJn_InputGroupId
           , a.PvtJn_TaskId
             --,a.PvtJn_InputGroupId
           , [a].[ProjectId]
           , Pvt_FieldNames) as a
  pivot
  (
  max(Pvt_Value)
  for Pvt_FieldNames in (
  [Chainage], [HaulDistance], [HoleDepth], [HoleDiam], [HRS (COMP)], [HRS (ENG)], [HRS-PERC1], [HRS-PERC2], [HRS-PPACK1], [HRS-PPACK2], [KM], [SprayThickness], [TimeStamp])
  ) as b


    on a.PvtJn_TaskId = b.PvtJn_TaskId
      and (a.PvtJn_InputGroupId = b.PvtJn_InputGroupId)-- OR b.PvtJn_InputGroupId = -1)  -- -1 indicates this attribute input is not inside the group

  --repeat the join for ones outsite the group (or inseide I forget)
  left join (
    select --join fields
      --PvtJn_TaskID = a.detailid  --integer.
      ProjectId
    , PvtJn_TaskId
    , PvtJn_InputGroupId
      --,PvtJn_OperatorDateShift =NULL -- CAST(OperatorId AS varchar) + +CAST(date AS varchar)++Shift

      --the field with teh dynamic field names:
    , Pvt_FieldNames
      --the field with the values to be pivoted. no need to aggregate, I am already aggregating here (can do a count or whatever I want)
    , Pvt_Value = max(a.[AttributeValue])

    from
    --dbo.tbl_DWH_ProdDataStorage AS pds
    --INNER JOIN  
    dbo.[syn_STO_ReportingSnapshot_AttributesTable_All] as a with (nolock)  --v3 has only attributes.
    --ON a.DetailID = pds.DetailID
    --and pds.[Sequence] = a.[Sequence] dont do seuqnce on the join! because stat7 is only on sequence 0
    --INNER JOIN dbo.tbl_SYS_AttributeType AS at  WITH (NOLOCK)
    --        ON a.AttributeTypeID = at.AttTypeID
    where PvtJn_InputGroupId < 0
    -- WHERE --pds.ProjectID = @ProjectID 
    --  a_ProjectId = 399
    --AND pds.Date BETWEEN @Date AND @Date2
    --AND pds.BudgetCodeID =1
    --AND pds.StatisticID = 7
    group by --a.PvtSeqJoin
    a.PvtJn_TaskId
  , a.PvtJn_InputGroupId
  , [a].[ProjectId]
  , Pvt_FieldNames) as a
  pivot
  (
  max(Pvt_Value)
  for Pvt_FieldNames in (
  [Chainage], [HaulDistance], [HoleDepth], [HoleDiam], [HRS (COMP)], [HRS (ENG)], [HRS-PERC1], [HRS-PERC2], [HRS-PPACK1], [HRS-PPACK2], [KM], [SprayThickness], [TimeStamp])
  ) as bb
    on a.PvtJn_TaskId = bb.PvtJn_TaskId

where a.projectid = 3
GO
PRINT N'Altering [dbo].[procDWH_iplodDocumentUsersFeedback_Upd]'
GO
ALTER PROCEDURE [dbo].[procDWH_iplodDocumentUsersFeedback_Upd]
	@dataSyncTriggerPoint AS INT = 0
    , @ProjectID AS INT
    , @DocumentID AS INT
    , @DocumentPageNo AS INT
    , @DocumentIssue AS NVARCHAR(MAX)
    , @EmployeeId AS INT
    , @SubmittedDate AS DATETIME
    --, @DocumentUserFeedbackIdNew AS INT = 0 OUTPUT
	, @appCfgRefreshPoint AS INT = 0 OUTPUT
AS
/**********************************************************************
Purpose :	Update/Insert for tbl_DWH_iplodDocumentUsersFeedback tbl.
Notes   :	-


GRANT SELECT ON [dbo].[tbl_DWH_iplodDocumentUsersFeedback] TO [Public]
GRANT EXECUTE ON [dbo].[procDWH_iplodDocumentUsersFeedback_Upd] TO [Public]

History  :	IRJ	02-Nov-2018	Initial Creation.
			IRJ	30-Mar-2019 Added @dataSyncTriggerPoint input param.
							Added @appCfgRefreshPoint output param.
**********************************************************************/
SET NOCOUNT ON
DECLARE @error AS INT = 0
--DECLARE @tranCount AS INT = @@TRANCOUNT
--PRINT '' + OBJECT_NAME(@@PROCID) + ', TxCnt: ' + CONVERT(NVARCHAR, @tranCount)

--IF (@tranCount = 0) 
--BEGIN
--	--PRINT '' + OBJECT_NAME(@@PROCID) + ': Setting up transaction.'
--	SET XACT_ABORT ON	
--	SET IMPLICIT_TRANSACTIONS OFF
--	BEGIN TRAN
--END


	-- Init.
	SET @dataSyncTriggerPoint = ISNULL(@dataSyncTriggerPoint, 0)
	SET @appCfgRefreshPoint = 0

	-- Update OR Insert ?
	IF NOT EXISTS (SELECT DocumentUserFeedbackId 
				FROM dbo.tbl_DWH_iplodDocumentUsersFeedback
				WHERE DocumentID = @DocumentID
					AND EmployeeId = @EmployeeId
					AND SubmittedDate = @SubmittedDate)
	BEGIN
		-- Insert.	
		INSERT INTO dbo.tbl_DWH_iplodDocumentUsersFeedback
			(ProjectID, DocumentID, DocumentPageNo, DocumentIssue, EmployeeId, SubmittedDate, CreatedDate)
		VALUES (@ProjectID, @DocumentID, @DocumentPageNo, @DocumentIssue, @EmployeeId, @SubmittedDate, GETDATE())

		---- Get the latest identity.	
		--SET @DocumentUserFeedbackIdNew = SCOPE_IDENTITY()			
	END


	-- Get the latest system error.
	SELECT @error = @@ERROR WHERE @error = 0
	IF (@error <> 0)
	BEGIN
		--IF (@tranCount = 0) ROLLBACK TRAN
		RETURN @error
	END

	---- Set the return values.
	--SET @DocumentUserFeedbackIdNew = @DocumentUserFeedbackId


-- Finish now.
--IF (@tranCount = 0) COMMIT TRAN
RETURN 0
GO
PRINT N'Altering [dbo].[procDWH_iplodUserMessages_Upd]'
GO
ALTER PROCEDURE [dbo].[procDWH_iplodUserMessages_Upd]
	@dataSyncTriggerPoint AS INT = NULL,
	@employeeId AS INT,
	@userMessageId AS NVARCHAR(200),
	@processedDate AS DATETIME,
	@appCfgRefreshPoint AS INT = 0 OUTPUT
AS
/**********************************************************************
Purpose :	UserMessages - mark as processed.
Notes   :	-

EXEC dbo.procDWH_iplodUserMessages_Upd -1, 1, '01-Nov-2018'
EXEC dbo.procDWH_iplodUserMessages_Upd -1, 2, '01-Nov-2018'
EXEC dbo.procDWH_iplodUserMessages_Upd -1, 12345,'1234_localONly', '07-Oct-2018'


GRANT SELECT ON [dbo].[tbl_DBT_iplodUserMessages] TO [Public]
GRANT SELECT ON [dbo].[tbl_DBT_iplodUserMessageUsers] TO [Public]
GRANT SELECT ON [dbo].[tbl_DWH_iplodUserMessageUserLogs] TO [Public]
GRANT EXECUTE ON [dbo].[procDWH_iplodUserMessages_Upd] TO [Public]

History  :	IRJ	02-Nov-2018	Initial Creation.
			IRJ	30-Mar-2019 Added @dataSyncTriggerPoint input param.
							Added @appCfgRefreshPoint output param.
			IRJ	28-Jan-2020	Modified @userMessageId to NVARCHAR(200).
			ts 2020-09-09 .. split the handling for local only messages
**********************************************************************/
SET NOCOUNT ON
DECLARE @Error AS INT = 0


	-- Init.
	SET @dataSyncTriggerPoint = ISNULL(@dataSyncTriggerPoint, 0)
	SET @appCfgRefreshPoint = 0
	SET @processedDate = ISNULL(@processedDate, GETDATE())

DECLARE @UserMessageIdInt int = CONVERT(int,REPLACE(@UserMessageId,'_localOnly','')) --take the suffix back off. this table still INT!
	-- Log it...
	IF NOT EXISTS (
			SELECT UserMessageUserLogId 
			FROM dbo.tbl_DWH_iplodUserMessageUserLogs
			WHERE EmployeeId = @employeeId
				AND UserMessageId = @userMessageId
				AND ProcessedDate = @processedDate)
	BEGIN
		-- Insert.	the logs are logged in same table for both
		INSERT INTO dbo.tbl_DWH_iplodUserMessageUserLogs
			(UserMessageId, EmployeeId, ProcessedDate)
		SELECT @userMessageId--UM.UserMessageId
			, @EmployeeId
			, @ProcessedDate
		
		--dont need this jin? is problematic for local only FROM dbo.tbl_DBT_iplodUserMessages AS UM
		--WHERE UM.UserMessageId = @UserMessageId
	END


	-- and disable it? normal
IF @userMessageId NOT LIKE '%_localOnly'
	begin
	UPDATE UMU
	SET UMU.IsEnabled = 0
		, UMU.LastModifiedOn = @processedDate
	FROM dbo.tbl_DBT_iplodUserMessageUsers AS UMU
	WHERE UserMessageId = @UserMessageIdInt
		AND EmployeeId = @EmployeeId
		AND @userMessageId NOT LIKE '%_localOnly'
END

	-- and disable it? Local Only 
IF @userMessageId  LIKE '%_localOnly'
	begin
	UPDATE UMU
	SET UMU.IsEnabled = 0
		, UMU.LastModifiedOn = @processedDate
	FROM dbo.tbl_DBT_iplodUserMessageUsers_LocalOnly AS UMU
	WHERE UserMessageId = @UserMessageIdInt
		AND EmployeeId = @EmployeeId
		AND @userMessageId  LIKE '%_localOnly'
END


-- Get the latest system error.
SELECT @Error = @@ERROR WHERE @Error = 0
IF (@Error <> 0)
BEGIN
	RETURN @Error
END

-- Finish now.
RETURN 0
GO
PRINT N'Altering [dbo].[procWRK_MessageQueue_Ins]'
GO

ALTER PROCEDURE [dbo].[procWRK_MessageQueue_Ins]
	@MessageQueuePayloadJson AS NVARCHAR(MAX)
	, @DataSyncTriggerPoint AS INT = 0
	, @LogSessionInfoId AS BIGINT = 0
	, @TaskHeaderIdOnSyncPoint AS BIGINT = null
	, @SessionIdOnSyncPoint AS NVARCHAR(50) = null
    , @MessageQueueIdNew AS BIGINT = 0 OUTPUT
    , @StatusId INT = 0
AS
/**********************************************************************
Purpose :	Insert for tbl_WRK_MessageQueue tbl.
Notes   :	-



DECLARE @MessageQueuePayloadJson AS NVARCHAR(MAX) = 'foo'
DECLARE @MessageQueueIdNew AS BIGINT = 0

-- Init.
EXEC procWRK_MessageQueue_Ins @MessageQueuePayloadJson = @MessageQueuePayloadJson, @DataSyncTriggerPoint = 12345, @MessageQueueIdNew = @MessageQueueIdNew OUTPUT

-- Read attempts (multiple)...
EXEC procWRK_MessageQueue_Sel @MessageQueueId = @MessageQueueIdNew
EXEC procWRK_MessageQueue_Sel @MessageQueueId = @MessageQueueIdNew
EXEC procWRK_MessageQueue_Sel @MessageQueueId = @MessageQueueIdNew

-- Post Processing.
EXEC procWRK_MessageQueue_Post @MessageQueueId = @MessageQueueIdNew



GRANT EXECUTE ON [dbo].[procWRK_MessageQueue_Sel] TO [Public]

History  :	IRJ	26-Aug-2021	Initial Creation.
			IRJ	04-Jan-2022	Added @DataSyncTriggerPoint input parameter.
			IRJ	31-Jan-2022	Added @LogSessionInfoId input parameter.
      ts 2022-07-13 ... add @StatusId
**********************************************************************/
SET NOCOUNT ON
DECLARE @error AS INT = 0
DECLARE @tranCount AS INT = @@TRANCOUNT
--PRINT '' + OBJECT_NAME(@@PROCID) + ', TxCnt: ' + CONVERT(NVARCHAR, @tranCount)


IF (@tranCount = 0) 
BEGIN
	--PRINT '' + OBJECT_NAME(@@PROCID) + ': Setting up transaction.'
	SET XACT_ABORT ON	
	SET IMPLICIT_TRANSACTIONS OFF
	BEGIN TRAN
END


	-- Insert.	
	INSERT INTO dbo.tbl_WRK_MessageQueue
		(DataSyncTriggerPoint, LogSessionInfoId, MessageQueuePayloadJson, DateCreated, TaskHeaderIdOnSyncPoint, SessionIdOnSyncPoint, StatusId)
	VALUES (@DataSyncTriggerPoint, @LogSessionInfoId, @MessageQueuePayloadJson, GETDATE(), @TaskHeaderIdOnSyncPoint, @SessionIdOnSyncPoint,@StatusId)
	
	
	-- Get the latest identity.	
	SET @MessageQueueIdNew = SCOPE_IDENTITY()			


	-- Basic output.
	SELECT 
		MessageQueueId
		, DataSyncTriggerPoint
		, LogSessionInfoId
		, MessageQueuePayloadJson
		, DateCreated
		, DateRead
		, DateCompleted
	FROM dbo.tbl_WRK_MessageQueue 
	WHERE MessageQueueId = @MessageQueueIdNew


-- Get the latest system error.
SELECT @error = @@ERROR WHERE @error = 0
IF (@error <> 0)
BEGIN
	IF (@tranCount = 0) ROLLBACK TRAN
	RETURN @error
END


-- Finish now.
IF (@tranCount = 0) COMMIT TRAN
RETURN 0


GO
PRINT N'Altering [dbo].[procWRK_MessageQueue_Post]'
GO

ALTER PROCEDURE [dbo].[procWRK_MessageQueue_Post]
    @MessageQueueId AS BIGINT
AS
/**********************************************************************
Purpose :	Update/Insert for tbl_WRK_MessageQueue tbl.
Notes   :	-


GRANT EXECUTE ON [dbo].[procWRK_MessageQueue_Sel] TO [Public]
--todo: test
History  :	IRJ	26-Aug-2021	Initial Creation.
**********************************************************************/
SET NOCOUNT ON
DECLARE @error AS INT = 0


	-- Flag as all done.
	UPDATE dbo.tbl_WRK_MessageQueue
	SET DateCompleted = GETDATE()
	WHERE MessageQueueId = @MessageQueueId


	-- Basic output.
	SELECT 
		MessageQueueId
		, MessageQueuePayloadJson
		, DateCreated
		, DateRead
		, DateCompleted
	FROM dbo.tbl_WRK_MessageQueue 
	WHERE MessageQueueId = @MessageQueueId


-- Finish now.
RETURN 0


GO
PRINT N'Altering [dbo].[procWRK_MessageQueue_Pushed]'
GO
ALTER procedure [dbo].[procWRK_MessageQueue_Pushed] @MessageQueueId as bigint

as

/**********************************************************************

Purpose :	Update for tbl_WRK_MessageQueue tbl.

Notes   :	-





GRANT EXECUTE ON [dbo].[procWRK_MessageQueue_Pushed] TO [Public]



History  :	DS	19-May-2022	Initial Creation. Direct copy of [dbo].[procWRK_MessageQueue_Post], just updatibg different field.

**********************************************************************/

begin

    set nocount on;



    -- Flag as all done.

    update dbo.tbl_WRK_MessageQueue

    set DatePushed = getdate()

    where MessageQueueId = @MessageQueueId;





    -- Basic output.

    select MessageQueueId

         , MessageQueuePayloadJson

         , DateCreated

         , DateRead

         , DateCompleted

         , DataSyncTriggerPoint

         , LogSessionInfoId

         , TaskHeaderIdOnSyncPoint

         , SessionIdOnSyncPoint

         , DatePushed

    from dbo.tbl_WRK_MessageQueue

    where MessageQueueId = @MessageQueueId;



    -- Finish now.

    return 0;

end;





GO
PRINT N'Altering [dbo].[procWRK_MessageQueue_Sel]'
GO


ALTER PROCEDURE [dbo].[procWRK_MessageQueue_Sel]
    @MessageQueueId AS BIGINT
AS
/**********************************************************************
Purpose :	Update/Insert for tbl_WRK_MessageQueue tbl.
Notes   :	-


GRANT EXECUTE ON [dbo].[procWRK_MessageQueue_Sel] TO [Public]

History  :	IRJ	26-Aug-2021	Initial Creation.
			IRJ	06-Sep-2021	Allowed ALL unprocessed MessageQueueId up to
							and including @MessageQueueId to be returned.
**********************************************************************/
SET NOCOUNT ON
DECLARE @error AS INT = 0


	 -- Init.
	DECLARE @messageData TABLE (  
	   MessageQueueId INT
	);


	-- Update first.
	UPDATE dbo.tbl_WRK_MessageQueue
	SET DateRead = GETDATE()
	OUTPUT 
		inserted.MessageQueueId
		INTO @messageData
	WHERE 
		MessageQueueId <= @MessageQueueId
		AND DateRead IS NULL


	-- Get an unread message.
	SELECT 
		WRK.MessageQueueId,
		MessageQueuePayloadJson, 
		DateCreated, 
		DateRead, 
		DateCompleted
	FROM @messageData AS TMP
		INNER JOIN dbo.tbl_WRK_MessageQueue AS WRK ON TMP.MessageQueueId = WRK.MessageQueueId
	ORDER BY
		WRK.MessageQueueId ASC


-- Finish now.
RETURN 0

GO
PRINT N'Altering [dbo].[procWRK_MessageQueue_Status]'
GO


ALTER PROCEDURE [dbo].[procWRK_MessageQueue_Status]
AS
/**********************************************************************
Purpose :	Select for tbl_WRK_MessageQueue tbl.
Notes   :	-


EXEC dbo.procWRK_MessageQueue_Status
SELECT * FROM dbo.tbl_WRK_MessageQueue


GRANT EXECUTE ON [dbo].[procWRK_MessageQueue_Status] TO [Public]

History  :	IRJ	07-Sep-2021	Initial Creation.
**********************************************************************/
SET NOCOUNT ON
DECLARE @error AS INT = 0


	-- Completed Processed.
	DECLARE @completeMessageQueueId AS BIGINT
	DECLARE @completeDateRead AS DATETIME
	DECLARE @completeDateCompleted AS DATETIME
	SELECT 
		TOP 1
		@completeMessageQueueId = MessageQueueId,
		@completeDateRead = DateRead,
		@completeDateCompleted = DateCompleted
	FROM dbo.tbl_WRK_MessageQueue 
	WHERE 
		NOT DateRead IS NULL
		AND NOT DateCompleted IS NULL
	ORDER BY
		MessageQueueId DESC


	-- Last Processing.
	DECLARE @processingMessageQueueId AS BIGINT
	DECLARE @processingDateRead AS DATETIME
	SELECT 
		TOP 1
		@processingMessageQueueId = MessageQueueId,
		@processingDateRead = DateRead
	FROM dbo.tbl_WRK_MessageQueue 
	WHERE 
		NOT DateRead IS NULL
		AND DateCompleted IS NULL
	ORDER BY
		MessageQueueId ASC

	-- and as a CSV.
	DECLARE @processingMessageQueueIds AS NVARCHAR(MAX)
	SELECT @processingMessageQueueIds = SUBSTRING(
								(SELECT ',' + CONVERT(NVARCHAR(50), MessageQueueId)
								FROM dbo.tbl_WRK_MessageQueue
								WHERE 
									NOT DateRead IS NULL
									AND DateCompleted IS NULL
								ORDER BY MessageQueueId ASC
								FOR XML PATH('')), 2, 200000)


	-- Pending.
	DECLARE @pendingMessageQueueId AS BIGINT
	DECLARE @pendingDateCreated AS DATETIME
	SELECT 
		TOP 1
		@pendingMessageQueueId = MessageQueueId,
		@pendingDateCreated = DateCreated
	FROM dbo.tbl_WRK_MessageQueue 
	WHERE 
		DateRead IS NULL
	ORDER BY
		MessageQueueId ASC

	-- and as a CSV.
	DECLARE @pendingMessageQueueIds AS NVARCHAR(MAX)
	SELECT @pendingMessageQueueIds = SUBSTRING(
								(SELECT ',' + CONVERT(NVARCHAR(50), MessageQueueId)
								FROM dbo.tbl_WRK_MessageQueue
								WHERE 
									DateRead IS NULL
								ORDER BY MessageQueueId ASC
								FOR XML PATH('')), 2, 200000)

	-- Output.
	SELECT 
		-- Completed.
		completeMessageQueueId = ISNULL(@completeMessageQueueId, 0),
		completeDateRead = ISNULL(@completeDateRead, '01-Jan-1900'),
		completeDateCompleted = ISNULL(@completeDateCompleted, '01-Jan-1900'),
		-- Processing.
		processingMessageQueueId = ISNULL(@processingMessageQueueId, 0),
		processingDateRead = ISNULL(@processingDateRead, '01-Jan-1900'),
		processingMessageQueueIds = CASE WHEN @processingMessageQueueIds IS NULL THEN '' ELSE ',' + @processingMessageQueueIds + ',' END,
		-- Pending.
		pendingMessageQueueId = ISNULL(@pendingMessageQueueId, 0),
		pendingDateCreated = ISNULL(@pendingDateCreated, '01-Jan-1900'),
		pendingMessageQueueIds = CASE WHEN @pendingMessageQueueIds IS NULL THEN '' ELSE ',' + @pendingMessageQueueIds + ',' END


-- Finish now.
RETURN 0

GO
PRINT N'Altering [dbo].[procWRK_StoresDetails_Ins]'
GO


ALTER PROCEDURE [dbo].[procWRK_StoresDetails_Ins]
    @callingUserId AS INT 
    , @StoresId AS NVARCHAR(50)
    , @SalesLineRecId AS BIGINT
    , @StoresDetailId AS NVARCHAR(100)
    , @SalesLineRecVersion AS INT
    , @ItemId AS NVARCHAR(50)
    , @Quantity AS NUMERIC(18,12)
	, @LineDescription AS NVARCHAR(MAX) = ''
    , @IsEnabled AS INT
    , @OrderBy AS INT
	, @StoresItemWasScanned AS INT = 1
    , @IntolerableValuesRegExp AS NVARCHAR(4000)
	, @attributesJson AS NVARCHAR(MAX) = NULL
AS
/**********************************************************************
Purpose :	Update/Insert for tbl_WRK_StoresDetails tbl.
Notes   :	-


GRANT EXECUTE ON [dbo].[procWRK_StoresDetails_Ins] TO [Public]

History  :	IRJ	15-Feb-2019	Initial Creation.
			IRJ	30-Mar-2019	Added @LineDescription input param.
			IRJ	19-Jan-2021	Added @attributesJson input param.
			IRJ	13-Oct-2021	Added StoresItemWasScanned input field.
**********************************************************************/
SET NOCOUNT ON
DECLARE @error AS INT = 0
DECLARE @tranCount AS INT = @@TRANCOUNT
--PRINT '' + OBJECT_NAME(@@PROCID) + ', TxCnt: ' + CONVERT(NVARCHAR, @tranCount)


IF (@tranCount = 0) 
BEGIN
	--PRINT '' + OBJECT_NAME(@@PROCID) + ': Setting up transaction.'
	SET XACT_ABORT ON	
	SET IMPLICIT_TRANSACTIONS OFF
	BEGIN TRAN
END


	-- Init.
	SET @LineDescription = ISNULL(@LineDescription, '')


	-- Update OR Insert ?
	IF NOT EXISTS (SELECT StoresId 
			FROM dbo.tbl_WRK_StoresDetails
			WHERE StoresId = @StoresId 
				AND SalesLineRecId = @SalesLineRecId)
	BEGIN
		-- Insert.	
		INSERT INTO dbo.tbl_WRK_StoresDetails
			(StoresId, SalesLineRecId, StoresDetailId, SalesLineRecVersion, ItemId, Quantity, LineDescription, IsEnabled, OrderBy, StoresItemWasScanned, IntolerableValuesRegExp, DateCreated, CreatedBy)
		VALUES (@StoresId, @SalesLineRecId, @StoresDetailId, @SalesLineRecVersion, @ItemId, @Quantity, @LineDescription, @IsEnabled, @OrderBy, @StoresItemWasScanned, @IntolerableValuesRegExp, GETDATE(), CONVERT(NVARCHAR(50), @callingUserId))
	END


	-- Get the latest system error.
	SELECT @error = @@ERROR WHERE @error = 0
	IF (@error <> 0)
	BEGIN
		IF (@tranCount = 0) ROLLBACK TRAN
		RETURN @error
	END


-- Finish now.
IF (@tranCount = 0) COMMIT TRAN
RETURN 0

GO
PRINT N'Altering [dbo].[procWRK_StoresHeaders_Ins]'
GO


ALTER PROCEDURE [dbo].[procWRK_StoresHeaders_Ins]
    @callingUserId AS INT 
	, @dataSyncTriggerPoint AS INT = NULL
    , @ProjectID AS INT
	, @WarehouseId AS NVARCHAR(50) = ''
    , @StoresId AS NVARCHAR(50)
    , @StoresTypeId AS INT
	, @VendorId AS NVARCHAR(50) = ''
    , @EquipmentCode AS NVARCHAR(50)
    , @StoresDescription AS NVARCHAR(max)
    , @StoresStatus AS NVARCHAR(50)
    , @PlannedStartDate AS DATETIME
    , @PlannedStartShift AS NVARCHAR(50)
    , @Group1 AS NVARCHAR(100)
    , @Group2 AS NVARCHAR(100)
    , @DisplayText AS NVARCHAR(100)
    , @IsEnabled AS INT
    , @OrderBy AS INT
    , @IntolerableValuesRegExp AS NVARCHAR(4000)
	, @attributesJson AS NVARCHAR(MAX) = NULL
	, @appCfgRefreshPoint AS INT = 0 OUTPUT
AS
/**********************************************************************
Purpose :	Update/Insert for tbl_WRK_StoresHeaders tbl.
Notes   :	-


GRANT EXECUTE ON [dbo].[procWRK_StoresHeaders_Ins] TO [Public]

History  :	IRJ	15-Feb-2019	Initial Creation.
			IRJ	30-Mar-2019	Added @WarehouseId input param.
							Added @dataSyncTriggerPoint input param.
							Added @appCfgRefreshPoint output param.
			IRJ	15-May-2019	Added @VendorId input value.
			IRJ	19-Jan-2021	Added @attributesJson input param.
**********************************************************************/
SET NOCOUNT ON
DECLARE @error AS INT = 0
DECLARE @tranCount AS INT = @@TRANCOUNT
--PRINT '' + OBJECT_NAME(@@PROCID) + ', TxCnt: ' + CONVERT(NVARCHAR, @tranCount)


IF (@tranCount = 0) 
BEGIN
	--PRINT '' + OBJECT_NAME(@@PROCID) + ': Setting up transaction.'
	SET XACT_ABORT ON	
	SET IMPLICIT_TRANSACTIONS OFF
	BEGIN TRAN
END


	-- Init.
	SET @dataSyncTriggerPoint = ISNULL(@dataSyncTriggerPoint, 0)
	SET @appCfgRefreshPoint = 0
	SET @WarehouseId = ISNULL(@WarehouseId, '')
	SET @VendorId = ISNULL(@VendorId, '')


	-- Get OperationId from ProjectId.
	DECLARE @operationId AS INT
	SELECT @operationId = OperationID   
	FROM dbo.tbl_DBT_Project 
	WHERE ProjectID = @projectID  
	SET @operationId = ISNULL(@operationId, 0)


	-- Update OR Insert ?
	IF NOT EXISTS (SELECT StoresId 
			FROM dbo.tbl_WRK_StoresHeaders
			WHERE StoresId = @StoresId)
	BEGIN
		-- Insert.	
		INSERT INTO dbo.tbl_WRK_StoresHeaders
			(OperationID, ProjectID, WarehouseId, StoresId, StoresTypeId, VendorId, EquipmentCode, StoresDescription, StoresStatus, PlannedStartDate, PlannedStartShift, Group1, Group2, DisplayText, IsEnabled, OrderBy, IntolerableValuesRegExp, DateCreated, CreatedBy)
		VALUES (@OperationID, @ProjectID, @WarehouseId, @StoresId, @StoresTypeId, @VendorId, @EquipmentCode, @StoresDescription, @StoresStatus, @PlannedStartDate, @PlannedStartShift, @Group1, @Group2, @DisplayText, @IsEnabled, @OrderBy, @IntolerableValuesRegExp, GETDATE(), CONVERT(NVARCHAR(50), @callingUserId))
	END


	-- Get the latest system error.
	SELECT @error = @@ERROR WHERE @error = 0
	IF (@error <> 0)
	BEGIN
		IF (@tranCount = 0) ROLLBACK TRAN
		RETURN @error
	END


-- Finish now.
IF (@tranCount = 0) COMMIT TRAN
RETURN 0

GO
PRINT N'Altering [dbo].[procWRK_TaskDetail_Post]'
GO
ALTER PROCEDURE [dbo].[procWRK_TaskDetail_Post]
    @callingUserId AS INT 
    , @ProjectId AS INT
    , @TaskHeaderId AS BIGINT
	, @EmployeeId AS INT
    , @TaskDetailId AS INT
AS
/**********************************************************************
Purpose :	Post processing for tbl_WRK_TaskDetail tbl.
Notes   :	-


GRANT EXECUTE ON [dbo].[procWRK_TaskDetail_Post] TO [Public]

History  :	IRJ	01-Apr-2019	Initial Creation.
			IRJ	28-Aug-2019	Added @EmployeeId input parameter.
			IRJ	31-Jan-2020	Modified TaskHeaderId to BIGINT.
**********************************************************************/
SET NOCOUNT ON
DECLARE @error AS INT = 0
--DECLARE @tranCount AS INT = @@TRANCOUNT
--PRINT '' + OBJECT_NAME(@@PROCID) + ', TxCnt: ' + CONVERT(NVARCHAR, @tranCount)

--IF (@tranCount = 0) 
--BEGIN
--	--PRINT '' + OBJECT_NAME(@@PROCID) + ': Setting up transaction.'
--	SET XACT_ABORT ON	
--	SET IMPLICIT_TRANSACTIONS OFF
--	BEGIN TRAN
--END



	-- Actually delete Quantities!
	DELETE
	FROM dbo.tbl_WRK_TaskDetailQty 
	WHERE TaskHeaderId = @TaskHeaderId 
		AND ProjectId = @ProjectId 
		AND EmployeeId = @EmployeeId
		AND TaskDetailId = @TaskDetailId
		AND IsDeleted <> 0





	-- Get the latest system error.
	SELECT @error = @@ERROR WHERE @error = 0
	IF (@error <> 0)
	BEGIN
		--IF (@tranCount = 0) ROLLBACK TRAN
		RETURN @error
	END


-- Finish now.
--IF (@tranCount = 0) COMMIT TRAN
RETURN 0
GO
PRINT N'Altering [dbo].[procWRK_TaskDetail_Upd]'
GO
ALTER PROCEDURE [dbo].[procWRK_TaskDetail_Upd]
    @callingUserId AS INT 
	, @DeviceUpdated AS DATETIME = NULL
    , @TaskHeaderId AS BIGINT
    , @ProjectId AS INT
	, @EmployeeId AS INT
    , @TaskDetailId AS INT
    , @TaskDetailTypeId AS INT
	-- Mining Specific.
    , @FieldType AS VARCHAR(42)
    , @InputID AS NVARCHAR(50)
	-- Stores Specific.
	, @InventoryItemId AS NVARCHAR(50) = ''
	, @StoresLocationID AS NVARCHAR(50) = ''
	, @StoresID AS NVARCHAR(50) = ''
	, @StoresRecID AS NVARCHAR(50) = ''
	, @StoresRecVer AS NVARCHAR(50) = ''
	, @StoresBarcodeBads AS NVARCHAR(MAX) = '|||'
	-- General.
	, @InputGroup AS NVARCHAR(max) = NULL
	, @GroupIdx AS INT = 0
	, @IsDeleted AS INT = 0
    , @InputValue AS NVARCHAR(max)
    , @InputCommentRequired AS INT
    , @InputComment AS NVARCHAR(max)
    , @InputPhotoRequired AS INT
    , @InputPhoto AS NVARCHAR(max)
    , @InputAuthRequired AS INT
    , @InputAuth AS NVARCHAR(max)
	, @InputAuthId AS INT = NULL
    , @InputGenericLookupRequired AS INT = 4096
    , @InputGenericLookup AS NVARCHAR(max) = ''
	, @InputGenericLookupId AS NVARCHAR(max) = ''
	, @OrderBy AS INT = 0
AS
/**********************************************************************
Purpose :	Update/Insert for tbl_WRK_TaskDetail tbl.
Notes   :	-


GRANT SELECT ON [dbo].[tbl_WRK_TaskDetail] TO [Public]
GRANT EXECUTE ON [dbo].[procWRK_TaskDetail_Upd] TO [Public]

History  :	IRJ	01-Nov-2018	Initial Creation.
			IRJ	08-Nov-2018	Added Stores specific fields.
							Improved annotations.
			IRJ	21-Jan-2019	Added @DeviceUpdated input.
			IRJ	25-Jan-2019	Added InputAuthId.
			IRJ	01-Apr-2019	Added Logically delete tbl_WRK_TaskDetailQty.
			IRJ	24-Jul-2019	Added @StoresID input parameter.
			IRJ	28-Aug-2019	Added @EmployeeId input parameter.
			IRJ	22-Sep-2019	Added GenericLookup input parameters.
			IRJ	30-Sep-2019	Added StoresBarcodeBads input value.
			IRJ	31-Jan-2020	Modified TaskHeaderId to BIGINT.
			ts 2020-05-26 ... don't give null Device Updated a value here!
**********************************************************************/
SET NOCOUNT ON
DECLARE @error AS INT = 0
--DECLARE @tranCount AS INT = @@TRANCOUNT
--PRINT '' + OBJECT_NAME(@@PROCID) + ', TxCnt: ' + CONVERT(NVARCHAR, @tranCount)

--IF (@tranCount = 0) 
--BEGIN
--	--PRINT '' + OBJECT_NAME(@@PROCID) + ': Setting up transaction.'
--	SET XACT_ABORT ON	
--	SET IMPLICIT_TRANSACTIONS OFF
--	BEGIN TRAN
--END

	-- Init.
	SET @DeviceUpdated = ISNULL(@DeviceUpdated, '')--not much point deriving it here!GETDATE())
	SET @InputGroup = ISNULL(@InputGroup, '')
	SET @GroupIdx = ISNULL(@GroupIdx, 0)
	SET @IsDeleted = ISNULL(@IsDeleted, 0)
	SET @InputValue = ISNULL(@InputValue, '')
	SET @InputAuthId = ISNULL(@InputAuthId, 0)
	SET @OrderBy = ISNULL(@OrderBy, 0)
	-- Mining Specific.
    SET @FieldType = ISNULL(@FieldType, '')
    SET @InputID = ISNULL(@InputID, '')
	-- Stores Specific.
	SET @InventoryItemId = ISNULL(@InventoryItemId, '')
	SET @StoresLocationID = ISNULL(@StoresLocationID, '')
	SET @StoresID = ISNULL(@StoresID, '')
	SET @StoresRecID = ISNULL(@StoresRecID, '')
	SET @StoresRecVer = ISNULL(@StoresRecVer, '')


	-- Update OR Insert ?
	IF EXISTS (SELECT TaskHeaderId 
			FROM dbo.tbl_WRK_TaskDetail
			WHERE TaskHeaderId = @TaskHeaderId 
				AND ProjectId = @ProjectId 
				AND EmployeeId = @EmployeeId
				AND TaskDetailId = @TaskDetailId)
	BEGIN
		UPDATE dbo.tbl_WRK_TaskDetail
		SET 
			TaskDetailTypeId = @TaskDetailTypeId
			-- Mining Specific.
			, FieldType = @FieldType
			, InputID = @InputID
			-- Stores Specific.
			, InventoryItemId = @InventoryItemId
			, StoresLocationId = @StoresLocationId
			, StoresID = @StoresID
			, StoresRecId = @StoresRecId
			, StoresRecVer = @StoresRecVer
			, StoresBarcodeBads = CASE WHEN @StoresBarcodeBads = '|||' 
										THEN StoresBarcodeBads
									ELSE @StoresBarcodeBads
									END
			-- General.
			, InputGroup = @InputGroup
			, GroupIdx = @GroupIdx
			, IsDeleted = @IsDeleted
			, InputValue = @InputValue
			, InputCommentRequired = @InputCommentRequired
			, InputComment = @InputComment
			, InputPhotoRequired = @InputPhotoRequired
			, InputPhoto = @InputPhoto
			, InputAuthRequired = @InputAuthRequired
			, InputAuth = @InputAuth
			, InputAuthId = @InputAuthId
			, InputGenericLookupRequired = @InputGenericLookupRequired
			, InputGenericLookup = @InputGenericLookup
			, InputGenericLookupId = @InputGenericLookupId
			, OrderBy = @OrderBy
			, DateUpdated = GETDATE()
			, UpdatedBy = CONVERT(NVARCHAR(50), @callingUserId)
		WHERE TaskHeaderId = @TaskHeaderId 
			AND ProjectId = @ProjectId 
			AND EmployeeId = @EmployeeId
			AND TaskDetailId = @TaskDetailId


		-- Logically delete tbl_WRK_TaskDetailQty.
		UPDATE dbo.tbl_WRK_TaskDetailQty
		SET IsDeleted = 1
		WHERE TaskHeaderId = @TaskHeaderId 
			AND ProjectId = @ProjectId 
			AND EmployeeId = @EmployeeId
			AND TaskDetailId = @TaskDetailId
	END
	ELSE
	BEGIN
		-- Insert.	
		SET @StoresBarcodeBads = CASE WHEN @StoresBarcodeBads = '|||' 
										THEN NULL
									ELSE @StoresBarcodeBads
									END

		INSERT INTO dbo.tbl_WRK_TaskDetail
			(DeviceUpdated, TaskHeaderId, ProjectId, EmployeeId, TaskDetailId, TaskDetailTypeId, FieldType, InputID, InventoryItemId, StoresLocationId, StoresID, StoresRecId, StoresRecVer, StoresBarcodeBads, InputGroup, GroupIdx, IsDeleted, InputValue, InputCommentRequired, InputComment, InputPhotoRequired, InputPhoto, InputAuthRequired, InputAuth, InputAuthId, InputGenericLookupRequired, InputGenericLookup, InputGenericLookupId, OrderBy, DateCreated, CreatedBy, DateUpdated, UpdatedBy)
		VALUES (@DeviceUpdated, @TaskHeaderId, @ProjectId, @EmployeeId, @TaskDetailId, @TaskDetailTypeId, @FieldType, @InputID, @InventoryItemId, @StoresLocationId, @StoresID, @StoresRecId, @StoresRecVer, @StoresBarcodeBads, @InputGroup, @GroupIdx, @IsDeleted, @InputValue, @InputCommentRequired, @InputComment, @InputPhotoRequired, @InputPhoto, @InputAuthRequired, @InputAuth, @InputAuthId, @InputGenericLookupRequired, @InputGenericLookup, @InputGenericLookupId,  @OrderBy, GETDATE(), CONVERT(NVARCHAR(50), @callingUserId), NULL, NULL)
	END


	-- Get the latest system error.
	SELECT @error = @@ERROR WHERE @error = 0
	IF (@error <> 0)
	BEGIN
		--IF (@tranCount = 0) ROLLBACK TRAN
		RETURN @error
	END


-- Finish now.
--IF (@tranCount = 0) COMMIT TRAN
RETURN 0

GO
PRINT N'Altering [dbo].[procWRK_TaskDetailQty_Upd]'
GO
ALTER PROCEDURE [dbo].[procWRK_TaskDetailQty_Upd]
    @callingUserId AS INT 
    , @TaskHeaderId AS BIGINT
    , @ProjectId AS INT
	, @EmployeeId AS INT
    , @TaskDetailId AS INT
	, @ItemID AS NVARCHAR(50)
	, @Location AS NVARCHAR(50)
	-- Stores.
	, @StoresQty AS DECIMAL(9,3) = NULL
	-- TruckCount.
	, @TruckCountLoad AS DATETIME = NULL
	, @TruckCountDump AS DATETIME = NULL
	-- Flag.
	, @DeviceUpdated AS DATETIME = NULL
AS
/**********************************************************************
Purpose :	Update/Insert for tbl_WRK_TaskDetailQty tbl.
Notes   :	-


GRANT SELECT ON [dbo].[tbl_WRK_TaskDetailQty] TO [Public]
GRANT EXECUTE ON [dbo].[procWRK_TaskDetailQty_Upd] TO [Public]

History  :	IRJ	01-Nov-2018	Initial Creation.
			IRJ	21-Dec-2018	Added internals for table updates.
			IRJ	04-Mar-2019	Added @TruckCountLoad, @TruckCountDump and @DeviceUpdated input parameters.
							Made this data bucket Stores and TruckCount capable.
			IRJ	01-Apr-2019	Added IsDeleted logic.
			IRJ	28-Aug-2019	Added @EmployeeId input parameter.
			IRJ	30-Sep-2019	Modified NUMERIC to DECIMAL(9,3).
			IRJ	31-Jan-2020	Modified TaskHeaderId to BIGINT.
**********************************************************************/
SET NOCOUNT ON
DECLARE @error AS INT = 0
--DECLARE @tranCount AS INT = @@TRANCOUNT
--PRINT '' + OBJECT_NAME(@@PROCID) + ', TxCnt: ' + CONVERT(NVARCHAR, @tranCount)

--IF (@tranCount = 0) 
--BEGIN
--	--PRINT '' + OBJECT_NAME(@@PROCID) + ': Setting up transaction.'
--	SET XACT_ABORT ON	
--	SET IMPLICIT_TRANSACTIONS OFF
--	BEGIN TRAN
--END


	-- Init.
	SET @StoresQty = ISNULL(@StoresQty, 0)
	SET @DeviceUpdated= ISNULL(@DeviceUpdated, GETUTCDATE())


	-- Got existing?
	DECLARE @TaskDetailQtyId AS INT = 0
	SELECT TOP (1)
		@TaskDetailQtyId = TaskDetailQtyId 
	FROM dbo.tbl_WRK_TaskDetailQty
	WHERE TaskHeaderId = @TaskHeaderId
		AND ProjectId = @ProjectId
		AND EmployeeId = @EmployeeId
		AND TaskDetailId = @TaskDetailId
		AND ItemId = @ItemId
		AND [Location] = @Location
	ORDER BY TaskDetailQtyId DESC
	SET @TaskDetailQtyId = ISNULL(@TaskDetailQtyId, -1)


	-- Insert / Update.
	IF EXISTS (SELECT TaskDetailQtyId 
			FROM dbo.tbl_WRK_TaskDetailQty
			WHERE TaskDetailQtyId = @TaskDetailQtyId)
	BEGIN
		UPDATE dbo.tbl_WRK_TaskDetailQty
		SET 
			-- Stores.
			Quantity = @StoresQty
			-- Truck Count.
			, TruckCountLoad = @TruckCountLoad
			, TruckCountDump = @TruckCountDump
			-- Flags.
			, DeviceUpdated = @DeviceUpdated
			, DateUpdated = GETDATE()
			, UpdatedBy = @callingUserId
			, IsDeleted = 0
		WHERE TaskDetailQtyId = @TaskDetailQtyId
	END
	ELSE
	BEGIN
		-- Insert.	
		INSERT INTO dbo.tbl_WRK_TaskDetailQty
			(TaskHeaderId, ProjectId, EmployeeId, TaskDetailId, ItemId, [Location], Quantity, TruckCountLoad, TruckCountDump, DeviceUpdated, DateCreated, CreatedBy, DateUpdated, UpdatedBy, IsDeleted)
		VALUES (@TaskHeaderId, @ProjectId, @EmployeeId, @TaskDetailId, @ItemId, @Location, @StoresQty, @TruckCountLoad, @TruckCountDump, @DeviceUpdated, GETDATE(), @callingUserId, GETDATE(), @callingUserId, 0)

		-- Get the latest identity.	
		SET @TaskDetailQtyId = SCOPE_IDENTITY()			
	END


	-- Get the latest system error.
	SELECT @error = @@ERROR WHERE @error = 0
	IF (@error <> 0)
	BEGIN
		--IF (@tranCount = 0) ROLLBACK TRAN
		RETURN @error
	END

-- Finish now.
--IF (@tranCount = 0) COMMIT TRAN
RETURN 0
GO
PRINT N'Altering [dbo].[procWRK_TaskHeader_Post]'
GO
ALTER PROCEDURE [dbo].[procWRK_TaskHeader_Post]
	@callingUserId AS INT 
	, @dataSyncTriggerPoint AS INT = NULL
    , @TaskHeaderId AS BIGINT
	, @ProjectId AS INT
	, @EmployeeId AS INT
	, @appCfgRefreshPoint AS INT = 0 OUTPUT
AS
/**********************************************************************
Purpose :	Post processing for tbl_WRK_TaskHeader tbl.
Notes   :	-


GRANT SELECT ON [dbo].[tbl_WRK_TaskHeader] TO [Public]
GRANT EXECUTE ON [dbo].[procWRK_TaskHeader_Post] TO [Public]

History  :	IRJ	14-Feb-2019	Initial Creation.
			IRJ	30-Mar-2019	Added @dataSyncTriggerPoint input param.
							Added @appCfgRefreshPoint output param.
			IRJ	16-May-2019	Removed the stripping of '_PA_' InputValue - all parts needed!
			IRJ 24-Jul-2019	Added support for 'StoresAllPutAway' (70).
			IRJ	05-Aug-2019 Modified to utilise StoresId field to better handle 'StoresAllPutAway' (70).
			IRJ	28-Aug-2019	Added @EmployeeId input parameter.
			IRJ	31-Jan-2020	Modified TaskHeaderId to BIGINT.
**********************************************************************/
SET NOCOUNT ON
DECLARE @error AS INT = 0
--DECLARE @tranCount AS INT = @@TRANCOUNT
--PRINT '' + OBJECT_NAME(@@PROCID) + ', TxCnt: ' + CONVERT(NVARCHAR, @tranCount)

--IF (@tranCount = 0) 
--BEGIN
--	--PRINT '' + OBJECT_NAME(@@PROCID) + ': Setting up transaction.'
--	SET XACT_ABORT ON	
--	SET IMPLICIT_TRANSACTIONS OFF
--	BEGIN TRAN
--END


	-- Init.
	SET @dataSyncTriggerPoint = ISNULL(@dataSyncTriggerPoint, 0)
	SET @appCfgRefreshPoint = 0
	DECLARE @storesId AS NVARCHAR(50)


	-- Get current basics.
	DECLARE @EquipmentId AS INT
	DECLARE @EquipmentTypeId AS INT
	DECLARE @EquipmentActivityId AS INT
	DECLARE @StatusId AS INT
	SELECT
		@ProjectId = ProjectId,
		@EquipmentId = EquipmentId,
		@EquipmentTypeId = EquipmentTypeId, 
		@EquipmentActivityId = EquipmentActivityId,
		@StatusId = StatusId
	FROM dbo.tbl_WRK_TaskHeader AS TH 
	WHERE TaskHeaderId = @TaskHeaderId
		AND ProjectId = @ProjectId
		AND EmployeeId = @EmployeeId


	-- 50 = Completed - Saved.
	-- 99 = Completed - Finalised.
	IF (@StatusId IN (50, 99))
	BEGIN

		-- StoresPOPutAway (65)?
		-- StoresAllPutAway (70)?
		IF EXISTS (SELECT TaskHeaderId
				FROM dbo.tbl_WRK_TaskDetail AS TD
				WHERE TaskHeaderId = @TaskHeaderId
					AND ProjectId = @ProjectId
					AND EmployeeId = @EmployeeId
					AND IsDeleted = 0
					-- StoresPOPutAway (65), StoresAllPutAway (70).
					AND TaskDetailTypeId IN (65, 70)
			)
		BEGIN	
			DECLARE cur_WRK_TaskDetail
			CURSOR LOCAL FAST_FORWARD FOR  
				SELECT 
					DISTINCT StoresId
				FROM [dbo].[tbl_WRK_TaskDetail]
				WHERE TaskHeaderId = @TaskHeaderId
					AND ProjectId = @ProjectId
					AND EmployeeId = @EmployeeId
					AND IsDeleted = 0
					-- StoresItemDetail (50)
					AND TaskDetailTypeId = 50
				ORDER BY StoresId ASC
			OPEN cur_WRK_TaskDetail

			-- Get first record.
			FETCH NEXT FROM cur_WRK_TaskDetail 
			INTO @StoresId
			-- now loop
			WHILE (@@FETCH_STATUS=0) 
			BEGIN
				-- Debug.
				--SELECT @StoresId AS StoresId

				-- Drop 'old' details.
				DELETE
				FROM dbo.tbl_WRK_StoresDetails
				WHERE StoresId = @storesId

				-- Drop 'old' header.
				DELETE
				FROM dbo.tbl_WRK_StoresHeaders
				WHERE StoresId = @storesId

				-- Get the next key.
				FETCH NEXT FROM cur_WRK_TaskDetail 
				INTO @StoresId
			END
			-- and close cursor.
			CLOSE cur_WRK_TaskDetail
			DEALLOCATE cur_WRK_TaskDetail
		END

	END


	-- Get the latest system error.
	SELECT @error = @@ERROR WHERE @error = 0
	IF (@error <> 0)
	BEGIN
		--IF (@tranCount = 0) ROLLBACK TRAN
		RETURN @error
	END


-- Finish now.
--IF (@tranCount = 0) COMMIT TRAN
RETURN 0
GO
PRINT N'Altering [dbo].[procWRK_TaskHeader_Upd]'
GO

ALTER PROCEDURE [dbo].[procWRK_TaskHeader_Upd]
	@callingUserId AS INT 
	, @DeviceCreated AS DATETIME = NULL
	, @dataSyncTriggerPoint AS INT = NULL
    , @TaskHeaderId AS BIGINT
    , @ProjectId AS INT
    , @EmployeeId AS INT
    , @WarehouseId AS NVARCHAR(50) = NULL
    , @AppDeploymentMode AS NVARCHAR(50) = NULL
    , @DeviceName AS NVARCHAR(50) = NULL
    , @DeviceSerialNo AS NVARCHAR(50) = NULL
    , @DeviceOS AS NVARCHAR(50) = NULL
    , @AppId AS NVARCHAR(50) = NULL
    , @AppVersion AS NVARCHAR(50) = NULL
    , @TimeUtcLeaveDevice AS DATETIME = NULL
    , @TimeUtcArriveAPI AS DATETIME = NULL
    , @ParentTaskHeaderId AS BIGINT
    , @ParentEquipmentTypeId AS INT
    , @SessionId AS NVARCHAR(50) 
    , @SessionTaskId AS INT
    , @WorkTypeId AS INT
    , @IsDayShift AS INT
    , @ShiftDate AS DATETIME
    , @ShiftDuration AS DECIMAL(9,3)
    , @EquipmentId AS INT
    , @EquipmentTypeId AS INT
    , @EquipmentActivityId AS INT
    , @ActivityReasonID AS INT
    , @StartTime AS DATETIME
    , @EndTime AS DATETIME
    , @DurationMins AS INT
    , @StatusId AS INT
	, @appCfgRefreshPoint AS INT = 0 OUTPUT
AS
/**********************************************************************
Purpose :	Update/Insert for tbl_WRK_TaskHeader tbl.
Notes   :	-


GRANT SELECT ON [dbo].[tbl_WRK_TaskHeader] TO [Public]
GRANT EXECUTE ON [dbo].[procWRK_TaskHeader_Upd] TO [Public]

History  :	IRJ	01-Nov-2018	Initial Creation.
			IRJ	21-Jan-2019	Added @DeviceCreated input.
			IRJ	30-Mar-2019	Added @dataSyncTriggerPoint input param.
							Added @appCfgRefreshPoint output param.
			IRJ	15-May-2019 Added @WarehouseId input param.
			IRJ	28-Aug-2019	Added EmployeeId to primary key.
			IRJ	31-Jan-2020	Modified TaskHeaderId to BIGINT.
			IRJ	18-Aug-2020	Added @DeviceSerialNo input param.
			IRJ	22-Sep-2021	Added numerous input parameters :-
							, @AppDeploymentMode AS NVARCHAR(50)
							, @DeviceName AS NVARCHAR(50)
							, @DeviceOS AS NVARCHAR(50)
							, @AppId AS NVARCHAR(50)
							, @AppVersion AS NVARCHAR(50)
							, @TimeUtcLeaveDevice AS DATETIME
							, @TimeUtcArriveAPI AS DATETIME
      ts 2021-11-16 ... don't send null sessionids in! it is teh old TaskHeaderId=0 shite data from device.
**********************************************************************/
SET NOCOUNT ON
DECLARE @error AS INT = 0
--DECLARE @tranCount AS INT = @@TRANCOUNT
--PRINT '' + OBJECT_NAME(@@PROCID) + ', TxCnt: ' + CONVERT(NVARCHAR, @tranCount)

--IF (@tranCount = 0) 
--BEGIN
--	--PRINT '' + OBJECT_NAME(@@PROCID) + ': Setting up transaction.'
--	SET XACT_ABORT ON	
--	SET IMPLICIT_TRANSACTIONS OFF
--	BEGIN TRAN
--END


	-- Init.
	SET @dataSyncTriggerPoint = ISNULL(@dataSyncTriggerPoint, 0)
	SET @appCfgRefreshPoint = 0
	SET @DeviceCreated = ISNULL(@DeviceCreated, GETDATE())
	SET @WarehouseId = ISNULL(@WarehouseId, '')
	SET @DeviceSerialNo = ISNULL(@DeviceSerialNo, '')
	-- Init 22-Sep-2021.
	SET @AppDeploymentMode = ISNULL(@AppDeploymentMode, '?')
	SET @DeviceName = ISNULL(@DeviceName, '')
	SET @DeviceOS = ISNULL(@DeviceOS, '')
	SET @AppId = ISNULL(@AppId, '')
	SET @AppVersion = ISNULL(@AppVersion, '')
  SET  @SessionId = isnull(@SessionId, 'no_sess')
	--@TimeUtcLeaveDevice
	--@TimeUtcArriveAPI


	-- Update OR Insert ?
	IF EXISTS (SELECT TaskHeaderId 
			FROM dbo.tbl_WRK_TaskHeader
			WHERE TaskHeaderId = @TaskHeaderId 
				AND ProjectId = @ProjectId
				AND EmployeeId = @EmployeeId)
	BEGIN
		UPDATE dbo.tbl_WRK_TaskHeader
		SET WarehouseId = @WarehouseId
			, AppDeploymentMode = @AppDeploymentMode
			, DeviceName = @DeviceName
			, DeviceSerialNo = @DeviceSerialNo
			, DeviceOS = @DeviceOS
			, AppId = @AppId
			, AppVersion = @AppVersion
			, TimeUtcLeaveDevice = @TimeUtcLeaveDevice
			, TimeUtcArriveAPI = @TimeUtcArriveAPI
			, ParentTaskHeaderId = @ParentTaskHeaderId
			, ParentEquipmentTypeId = @ParentEquipmentTypeId
			, SessionId = @SessionId
			, SessionTaskId = @SessionTaskId
			, WorkTypeId = @WorkTypeId
			, IsDayShift = @IsDayShift
			, ShiftDate = @ShiftDate
			, ShiftDuration = @ShiftDuration
			, EquipmentId = @EquipmentId
			, EquipmentTypeId = @EquipmentTypeId
			, EquipmentActivityId = @EquipmentActivityId
			, ActivityReasonID = @ActivityReasonID
			, StartTime = @StartTime
			, EndTime = @EndTime
			, DurationMins = @DurationMins
			, StatusId = @StatusId
			, DateUpdated = GETDATE()
			, UpdatedBy = CONVERT(NVARCHAR(50), @callingUserId)
		WHERE TaskHeaderId = @TaskHeaderId 
			AND ProjectId = @ProjectId
			AND EmployeeId = @EmployeeId
	END
	ELSE
	BEGIN
		-- Insert.	
		INSERT INTO dbo.tbl_WRK_TaskHeader
			(DeviceCreated, TaskHeaderId, ProjectId, EmployeeId, WarehouseId, AppDeploymentMode, DeviceName, DeviceSerialNo, DeviceOS, AppId, AppVersion, TimeUtcLeaveDevice, TimeUtcArriveAPI, ParentTaskHeaderId, ParentEquipmentTypeId, SessionId, SessionTaskId, WorkTypeId, IsDayShift, ShiftDate, ShiftDuration, EquipmentId, EquipmentTypeId, EquipmentActivityId, ActivityReasonID, StartTime, EndTime, DurationMins, StatusId, DateCreated, CreatedBy, DateUpdated, UpdatedBy)
		VALUES (@DeviceCreated, @TaskHeaderId, @ProjectId, @EmployeeId, @WarehouseId, @AppDeploymentMode, @DeviceName, @DeviceSerialNo, @DeviceOS, @AppId, @AppVersion, @TimeUtcLeaveDevice, @TimeUtcArriveAPI, @ParentTaskHeaderId, @ParentEquipmentTypeId, @SessionId, @SessionTaskId, @WorkTypeId, @IsDayShift, @ShiftDate, @ShiftDuration, @EquipmentId, @EquipmentTypeId, @EquipmentActivityId, @ActivityReasonID, @StartTime, @EndTime, @DurationMins, @StatusId, GETDATE(), CONVERT(NVARCHAR(50), @callingUserId), NULL, NULL)
	END


	-- Get the latest system error.
	SELECT @error = @@ERROR WHERE @error = 0
	IF (@error <> 0)
	BEGIN
		--IF (@tranCount = 0) ROLLBACK TRAN
		RETURN @error
	END


-- Finish now.
--IF (@tranCount = 0) COMMIT TRAN
RETURN 0


GO
PRINT N'Altering [dbo].[SP_API_IPLODSetup_UIGroupGroupDetails]'
GO

ALTER procedure [dbo].[SP_API_IPLODSetup_UIGroupGroupDetails]
	@operationId AS int,
	@projectId AS int,
	@appId AS nvarchar(100) = NULL,
	@appVersion AS nvarchar(50) = NULL,
	@appDeploymentMode AS nvarchar(50) = NULL,
	@appCfgRefreshPoint AS int = NULL,
	@fromDate AS datetime = NULL,
	@uiGroupGroupDetailsId AS int = 0,
	@deviceSerialNo AS NVARCHAR(50) = NULL,
    @employeeId AS INT = NULL,
	@isPurge AS int OUTPUT ,
	 @IsLocationsActive int=1, @IsTruckingActive int=1, @IsattributesActive int=1, @IsPrestartHistoryActive int=1, @IsPrestartLiveHistoryActive int=1, @IsHazardHistoryActive int=1, 
					@IsEquipmentActive int=1, @IsWorkOrdersActive int=1, @IsMaterialsActive int=1, @IsRaiseboreActive int=1, @IsTabletSerialsActive int=1
					,@IsProdDrillHistoryActive int = 1, @IsEquipStatusActive int = 1, @IsPastWorkOrdersActive int =1
          , @IsiPlodFaqsActive INT =1
						--addnew

					,@DebugMode INT = 0

AS
/**********************************************************************
Purpose :	Lookup Config - UIGroupGroupDetails.
Notes   :	-


DECLARE @isPurge AS INT
EXEC dbo.SP_API_IPLODSetup_UIGroupGroupDetails @operationId = 0, @projectId = 399,  @isPurge = @isPurge OUTPUT, @appCfgRefreshPoint =3
, @appDeploymentMode = 'mining_fitters', @appVersion = 'v2022.05.16 (302)'  --  ,@DebugMode = 1
SELECT @isPurge AS isPurge


DECLARE @isPurge AS INT
EXEC dbo.SP_API_IPLODSetup_UIGroupGroupDetails @operationId = 0, @projectId = 291, @uiGroupGroupDetailsId = 247, @isPurge = @isPurge OUTPUT
SELECT @isPurge AS isPurge



DECLARE @isPurge AS INT    --should be about 6-10 secs on local
  EXEC dbo.SP_API_IPLODSetup_UIGroupGroupDetails   @operationId =0, @projectId =399,@appDeploymentMode='mining_fitters',@appCfgRefreshPoint=2,@FromDate='', @isPurge = @isPurge OUTPUT
 SELECT @isPurge AS isPurge

DECLARE @isPurge AS INT    --should be about 6-10 secs on local
  EXEC dbo.SP_API_IPLODSetup_UIGroupGroupDetails   @operationId =0, @projectId =3,@appDeploymentMode='stores',@appCfgRefreshPoint=2,@FromDate='', @isPurge = @isPurge OUTPUT
 SELECT @isPurge AS isPurge

DECLARE @isPurge AS INT
  EXEC dbo.SP_API_IPLODSetup_UIGroupGroupDetails   @operationId =0, @projectId =236,@appDeploymentMode='mining_fitters',@appCfgRefreshPoint=2,@FromDate='', @isPurge = @isPurge OUTPUT
 SELECT @isPurge AS isPurge

 DECLARE @isPurge AS INT    --should be about 6-10 secs on local
  EXEC dbo.SP_API_IPLODSetup_UIGroupGroupDetails   @operationId =0, @projectId =399,@appDeploymentMode='mining_fitters',@appCfgRefreshPoint=1,@FromDate='', @isPurge = @isPurge OUTPUT
  ,@DebugMode=1
 SELECT @isPurge AS isPurge

 --testing:
 @projectId =236,@appDeploymentMode='stores' = 3282, 12 secs  7 sec 3282
  @projectId =236,@appDeploymentMode='mining_fitters' = 3805, 11 secs  >> same
  @projectId =236,@appDeploymentMode='processplant' = 3805, 11 secs  >> 13 3484


GRANT EXECUTE ON [dbo].[SP_API_IPLODSetup_UIGroupGroupDetails] TO [Public]

History  :	IRJ	27-Feb-2019	Initial Creation.
			IRJ	27-Feb-2019	Modified @appDeploymentMode NVARCHAR(50) > INT input param.
							Added @appCfgRefreshPoint input param.
							Added @isPurge OUTPUT param.
							Added IsDeleted output field.
			TS	28-Feb-2019	Added some test data.
			IRJ	04-Mar-2019	Added reference to dbo.zTestUIGroupGroupDetail test data.
			CA 2019-05-17 Added Prestart DataSet
			TS 2019-05-17 changed comments,  InputMatchId (concat FieldType and InputId) (instead of matching on FieldType)
			CA 2019-05-17 Added _1 to all parameter ones. 
			TS 2019-07-31 ... added purge stuff
			TS 2019-08-05 ... set IsPUrge =1 whenever getting data
			TS 2019-08-07 ... added UTC conversion
			TS 2019-08-22 ... shifted OrderBy calc up to top so we can incporpoate the Group1 and Group2 settings
			TS 2019-09-23 ... added the attributes ones
							... remove zz table
			TS 2019-09-23 ... modified the List type for Attributes
			ts 2019-12-20 ... fleshed out the location listings
			ts 2020-01-03 ... expanded location listing to include those with no ticks (just active) ... maybe should have it so that locations require at least one tick? but need a tickbox for all occasions before we do this (ie = workshop)
							... should strip out the loading bays and destinations from the normal list of active locations?

			ts 2020-02-23 ... older set of prestart histories for test server
			ts 2020-02-23 ... duplicate all prestart faults (because of fault in the selector on current version. (didn't work)
			ts 200-02-24 ... add EquipId to the Group2 in prestarts.  can revert this once bug is fixed in iplod (say v144 and above)
			ts 2020-02-24 ... add object updated
			ts 2020-02-25 ... made test data  older for prestart history ... 150 days, revert the additional EquipType ...
			sh 2020-03-26 ... added stores
			ts 2020-04-05 ... added query logs
					-09 /... added top 25 onto this call for logs
					-15 ... added more to the api logs
					-15 ... LoadedAt should be LoadedFrom
					-15 ... added LoadedBy
					-16 ... only send stores posting history to stores
			ts 2020-04-20 ... older history for stores on test server
			ts 2020-05-12 ... AttributesJson
			ts 2020-05-25 ... combine source adn dest into haul route
						... stub in -1 for missing haul route
			ts 2020-05-27	... add distance Atr
							... add Mateiarl SG
							... fix teh JSON format
							... aded distances object to the get latest
			ts 2020-05-31 ... add Attributes JSON to the text value if debug mode is on


		ts 2020-05-31 ... FOR JSON PATH not supported on standard 2012 locals. have replace with a dodgy build of a json string until we can get the locals upgraded

		ts 2020-06-04 ...  added failed configs
		ts 2020-06-15 ... fixed failed configs
		ts 200-06-17 ... with no locks on the last modified sniffs
		ts 2020-06-17 ... don't send a bunch of these for AND @appDeploymentMode <> 'stores' (just to keep the data send low
		ts 2020-07-05 ... filters on equip list
		CA 2020-07-07 ... Added config for locations to ignore level if deploymenymode is RB.
		ts 2020-07-22 ... added related equipment for jumbo who bored the cut
		ts 2020-07-29 ... added feedback advice to prestarts
		ts 2020-08-05 ... smaller prestart history to keep the speeds ok
		ts 2020-08-07 ... fix missing haul route
		ts 2020-08-10 .. remove the drill on related equipment
		ts 2020-08-10 ... pull the v3 ogs dataset. it does tcurrently work ebcause I made the duration fields INT. also it is not really that useful
		ts 2020-08-17 ... add hazard history 
		ts 2020-08-19 ... don't send much history for TWIs on test server (to keep it running quicky)
		ts 2020-08-20 ... smaller history for stores on live
		ts 2020-08-24 ... locaiton active filter on haul routes. plus isnullorempty on the Distnaces.IsDeleted (flag not handled in the front end yet
		ts 2020-08-31 ... add ITs to loaded by field
		ts 2020-09-13 ... get RefNo (Work Orders)
		ts 2020-09-24 ... add test data for @test project
						... might need to trash the normal data when there is z data on @IsTestProject?
		ts 2020-10-01 ... only get history and work order stuff from the cached test data.
		CA 2020-10-19... Added RB dataset
		ts 2020-10-21 ... add serial numbers
						... pulled the sniff on @LastModiffied ... getting too unwieldy to find all the data
		CA 2020-11-05 ... Swapped prestart history to prestartHistory_GetFromLive for RB 


		TS 2020-11-12 ... config the datasets to save query time
		ts 2020-12-07 ... amend the haul routes to register unticked haul routes
		CA 2021-01-19 ... Updated Prestart History call to also do Maint History
		CA 2021-01-20 ... Optimisations to prestart hist

		ts 2021-01-21 ... various optimisations, incld switch the attribtues call to view
						.. into source control
		ts 2021-02-04 ... add Sysmaterial atribute

		ts 2021-02-09 ... try again on maint history.

		ts 2021-02-10 ... put the live histroy back in (subject to turning on in dpeloyment mode configs)
						...add teh IsActive flags to the call so as to over-ride the configs when debugging
						... split out separtae sections to make it easier to troubleshoot query plans
		ts 2021-02-15 ... remove the Loading Bay ticks from active locations, on config.  
						... ISNULL!!!
		CA 2021-02-15 ... Added Pit + OreBody config for Group1 Locn for peak on default Attr 3
		CA 2021-02-16 ... cast the DefaultAttr 3 join as varchar because of dataType errors on join
		ts 2021-02-23 ... added the location flag fields for filter calc
						... don't put it in JSON, put it in filter field. the JSON stuff won't be hydrated into fields yet
						... put AllActive in so that blank Param fields work just the first one in fact)
		ts 2021-03-04 ... add Levels into attrs for filtering
		ts 2021-03-17 ... change ELSE on teh z table
		ts 2021-04-19 ... filter calc for work orders
		CA 2021-04-26 ... added 14 day prestart history
		CA 2021-05-10 ... Added Surfce location tick
		ts 2021-06-03 ... added two new lists, ProdDrillingHistory + EquipStatus
		ts 2021-06-04 ... stubb in zz location
		ts 2021-06-08 ... add the new list for Past Work Oders
		ts 2021-08-06 ... fix datatype on teh wo list
		ts 2021-07-23 ... bake teh arithabour in, fuck it
		ts 2021-07-27 ... add param filtering for materials
		ts 2021-07-28 ... {yep, better}  try putting proddrill rownum here
		<<this needs to deploy with alter on proddriling history view>>
		ts 2021-09-07 ... get all failed posting history, however old they are
							... set @projectId= abs(@projectId)
		CA 2021-09-14 ... Added AssosciateNumeral to Attrs as AttrJSON
		ts 2021-09-16 ... order by history (down the bottom) do TextId for History ones
						... add some debugging
    ts 2021-11-13 .. hack to get the BRK failover to work
    ts 2021-11-13 ... kill out prestart history for brk as a temporarly desparate measure (in teh failover)
                    ... also get from caechd attributes
                    ... don't do this for BRK while in failover REMOVE!!
	CA 2021-12-15 ... Added Sign Register Group
	CA 2022-01-05 ... Removed Cached attrs
	CA 2022-01-14 ... Added LocationInGroup. Have a decently fast method now. Get Tom to validate before live. 
	CA 2022-03-23 ... Fixed sign register being missing. Good work version history.
  ts 2022-03-25 ...   DECLARE @OrigProj INT = @projectId
  ts 2022-04-07 ... added fake mode
  ts 2022-04-27 ... add the FAQs
  2022-08-03 CA ... Added SignRegister locns stuff
  2022-08-04 CA ... Added stope sign register
  2022-08-24 CA ... Added MCR hazard uiGroupGroup
  2022-10-14 TS ... DONT' DO NVARCHAR (BECUASE IT IS NOT HANDLED IN ALL THE SUB QUERIES)



IF ADDING NEW DATASET, UPDATE THE MaxModified query set for that object. NAH, killed ths out

if optimising, maybe check the order by trickery for history (it has stringpad on every line)

*******************

HOW TO ADD NEW LIST:
*******************
1. add new input type in tbl_SYS_InputTypeOptions, eg: ( 'ProdDrill History (readonly)', '*ProdDrillHistory', 28, 'datatypedisplayed,calcfunction,tolerancelower,tolerancelowertext,toleranceupper,toleranceuppertext', 'questionid,loadedfrom,loadedto,questiontype', 'inputid,forelabel', getdate(), 137, 1, NULL )


2. add into the mapping table,  dbo.tbl_SYS_iplodInputTypeMappings, eg: ( N'*MaintHistory', N'*MaintHistory', getdate(), 1, N'copied from prestarthistroy ts', 0, N'', N'', N'', 250, N'', 1 )
3. make the new view, similiar to this maybe: 
4. add new bits in the below, search fro "addnew" + variable on the call
5. add the deploymentmode config to turn it on/off: eg:
									INSERT INTO dbo.tbl_SYS_iplodDeploymentModeConfigs(DeploymentModeConfigName, DeploymentModeName, DeploymentModeConfigValue, Active, Comments, EditedDate, EditedBy)
									VALUES

									( N'IsActiveGrpGrpComponent_EquipStatus', N'_Default', N'0', 1, 'whether or not to call this component in the ui group group proc, because it is a beast to run on central, so turn off things not needed', GETDATE(), 137 ), 
									( N'IsActiveGrpGrpComponent_EquipStatus', N'Mining_Fitters', N'1', 1, 'whether or not to call this component in the ui group group proc, because it is a beast to run on central, so turn off things not needed',GETDATE(), 137 )




**********************************************************************/
SET NOCOUNT on

--2021-06-23
SET  ARITHABORT ON;
  DECLARE @OrigProj INT = @projectId

set @projectId= abs(@projectId)



DECLARE @Error AS int = 0


DECLARE @IsTempDeploymentModeToken INT = (SELECT case WHEN  FakeDeploymentMode <> TrueDeploymentMode OR killthisapp = 1  --add kill this app, in case we map fakemode = truemode
                                                  then 1 else 0 end  FROM dbo.tvf_DeploymentModeMapping (@appDeploymentMode, @ProjectId) )
DECLARE @TempTokenIsOutOfDate INT = case WHEN @IsTempDeploymentModeToken = 0 THEN 0
                                          WHEN    @IsTempDeploymentModeToken =1 THEN (SELECT  KillThisApp FROM dbo.tvf_DeploymentModeMapping (@appDeploymentMode, @ProjectId) )
                                          ELSE 0 
                                          END   
DECLARE @TrueDeploymentMode NVARCHAR(50) = (select TOP 1 TrueDeploymentMode FROM  dbo.tvf_DeploymentModeMapping (@appDeploymentMode, @ProjectId))
  SET @appDeploymentMode = case WHEN @IsTempDeploymentModeToken = 1 THEN @TrueDeploymentMode ELSE ISNULL(@appDeploymentMode, 'Mining') END  --2022-04-07

	-- init.
	SET @uiGroupGroupDetailsId = ISNULL(@uiGroupGroupDetailsId, 0)
	SET @appId = ISNULL(@appId, 'au.com.pybar.iplod')
	SET @appVersion = ISNULL(@appVersion, '2019.01.01')
	--SET @appDeploymentMode = ISNULL(@appDeploymentMode, 'Mining')
	SET @appCfgRefreshPoint = ISNULL(@appCfgRefreshPoint, 1)	-- Login Config Button.
	SET @isPurge  =  dbo.udfIsPurge('SP_API_IPLODSetup_UIGroupGroupDetails',@appDeploymentMode,@appCfgRefreshPoint);	-- 0 = false, else true.


	DECLARE @NewestSourceData datetime 
	SET @NewestSourceData = GETDATE();  --if ispurge=1 get everything anyway

		--this is the offset from UTC to compare modified on (local time) to @FromDate on device (UTC)
	DECLARE @UtcOffset numeric =  CONVERT(numeric,dbo.udfUTCVsWebBAROffset()) * -1;

	--For hiding the level group option when pit is used for location grouping. Mainly for RB.
	DECLARE @LocationLevelIgnore INT = CASE WHEN @appDeploymentMode = 'Raisebore' THEN 1 ELSE 0 END 

	--reset the fromdate to "local"
	SET @fromDate = DATEADD(HOUR,@UtcOffset,@FromDate);
	DECLARE @Today DATE = CONVERT(DATE,GETDATE())

		-- Get OperationId from ProjectId.
		SELECT @operationId = OperationID   
		FROM dbo.tbl_DBT_Project 
		WHERE ProjectID = @projectID
		SET @operationId = ISNULL(@operationId, 0)

declare @warehouse nvarchar(25) = (select top 1  warehouse from  dbo.FN_GetWarehouses(@operationId))

DECLARE @AllowLocal INT = (SELECT TOP 1 allowlocal FROM tbl_DBT_Project tdp where tdp.ProjectID = @projectId)

DECLARE @IsInFailOverToCentralKillThisProc int = iif((@AllowLocal=0 and @projectId  =291  --add oter prjoects that are in faiover here. OR OPTIMISE THE DAMN QUERY TO RUN ON CETNRAL!
                                                                        ), 1, 0)

DECLARE @IsSignRegisterActive INT = (SELECT isnull(dbo.FN_GetConfigValue(@ProjecTid,'IsSignRegisterActive'),0));
--Stope only one (Mcr)
DECLARE @IsSignRegisterStopesActive INT = (SELECT isnull(dbo.FN_GetConfigValue(@ProjecTid,'IsSignRegisterStopesActive'),0));

DECLARE @SignRegisterSrc varchar(50) = CAST(ISNULL(dbo.FN_GetConfigValue(@ProjectID, 'ViewSrc'), 'UniqueSigns' ) AS varchar(50) )


		IF @isPurge =20-- 0 --if not purging, then get most recent data first to decide whether or not to proceed or not
						BEGIN 
							SET @NewestSourceData =  (SELECT MAX(ModOn) 
															FROM 
																		(SELECT modOn= MAX(ModifiedOn) FROM dbo.tbl_DBT_Materials WITH (NOLOCK) WHERE ProjectID = @projectId 
																		UNION ALL 
																		SELECT modOn= MAX(ModifiedOn) FROM dbo.tbl_DBT_Location WITH (NOLOCK) WHERE ProjectID = @projectId 
																		union ALL 
																		SELECT modOn= MAX(ModifiedOn) FROM dbo.tbl_DBT_Distances WITH (NOLOCK) WHERE ProjectID = @projectId 
																					UNION ALL														
																		SELECT modOn =  max(modify_date )
																			FROM sys.objects
																			WHERE  name IN( 'SP_API_IPLODSetup_UIGroupGroupDetails' , 'FN_GetAttributes','View_ShiftSummary_PrestartHistory','View_API_PostingSummary','View_API_v3LogInfo')
																		UNION ALL 
																		SELECT ModOn = MAX([PostedDate] ) 
																		FROM dbo.tbl_API_Posting WITH (NOLOCK)
																		WHERE @appDeploymentMode = 'Stores'
																		UNION ALL 
																		SELECT ModOn = MAX([CreatedDate] ) 
																		FROM dbo.tbl_API_Posting WITH (NOLOCK)
																		WHERE @appDeploymentMode = 'Stores'

																		) AS tbl


														);
	END 

IF @IsInFailOverToCentralKillThisProc = 1 
BEGIN
set @isPurge =0 --so we do'nt trash them out!

end


IF (@NewestSourceData > @FromDate OR @isPurge = 1 OR @isPurge = 0) --jump into this anyway ... getting too hard to find all teh last modified. will need to think again if it takes too long to update.
     -- AND @IsInFailOverToCentralKillThisProc < >1  --2021-11-13

	BEGIN

SET @isPurge = 1 ; --sync config table has decided IsPurge = 0, however data has indicated that some data is newer than app.  no incremental loads on this table though, so need to set Purge to 1 in this scenario

DECLARE @IsLiveDb int =  dbo.FN_IsLiveDB(@ProjectId);
DECLARE @IsTestProject int =  dbo.FN_IsTestProject(137,@ProjectId);
DECLARE @DaysOfHistoryForPrestarts int = (SELECT CASE WHEN @IsLiveDb =0 THEN 28 ELSE 
						(SELECT ISNULL((select TOP 1 DeploymentModeConfigValue from [dbo].[udf_iPlodDeploymentConfigs] 
												(@appDeploymentMode,'PrestartHistoryDays')  
												)
								,7)) END);  -- if live db set to 7; get older ones 90  -- if live db set to 7; get older ones 90
DECLARE @DaysOfHistoryForStores int = (SELECT CASE WHEN @IsLiveDb =0 THEN 25 ELSE 5 END);  -- if live db set to 7; get older ones 90
DECLARE @DaysOfHistoryForHazards int = (SELECT CASE WHEN @IsLiveDb =0 THEN 2 ELSE 28 END);  -- if live db set to 7; get older ones 90
DECLARE @DaysOfHistoryForProdDrill int = 7-- (SELECT CASE WHEN @IsLiveDb =0 THEN 7 ELSE 7 END);  -- if live db set to 7; get older ones 90

declare @showDebugIds int = (SELECT dbo.FN_GetConfigValue(@ProjecTid,'ShowDebugIds'));

declare @LoadingBaysAreNotActualLocations int = (SELECT isnull(dbo.FN_GetConfigValue(@ProjecTid,'LoadingBaysAreNotActualLocations'),0));

-- Location Group1 Pit + Orebody 
declare @LocationGroup1PitOrebody int = (SELECT isnull(dbo.FN_GetConfigValue(@ProjectID,'LocationGroup1PitOrebody'),0));


/***
Some configs for decidding which datat sets to get
**/

--DECLARE @IsLocationsActive int, @IsTruckingActive int, @IsattributesActive int, @IsPrestartHistoryActive Int, @IsPrestartLiveHistoryActive Int, @IsHazardHistoryActive int, 
--					@IsEquipmentActive int, @IsWorkOrdersActive int, @IsMaterialsActive int, @IsRaiseboreActive int, @IsTabletSerialsActive int;

--DECLARE @ForceAll int = 0;
--if calling with 0, turn each one off
set @IsLocationsActive = IIF(@IsLocationsActive = 0,0 ,(SELECT ISNULL((select TOP 1 DeploymentModeConfigValue from [dbo].[udf_iPlodDeploymentConfigs] (@appDeploymentMode,'IsActiveGrpGrpComponent_Locations')  ),1)))
		SET @IsTruckingActive = IIF(@IsTruckingActive = 0,0 ,(SELECT ISNULL((select TOP 1 DeploymentModeConfigValue from [dbo].[udf_iPlodDeploymentConfigs] (@appDeploymentMode,'IsActiveGrpGrpComponent_Trucking')  ),1)))
		SET @IsattributesActive = IIF(@IsattributesActive = 0,0 ,(SELECT ISNULL((select TOP 1 DeploymentModeConfigValue from [dbo].[udf_iPlodDeploymentConfigs] (@appDeploymentMode,'IsActiveGrpGrpComponent_Attributes')  ),1)))
		SET @IsPrestartHistoryActive =case WHEN @AllowLocal = 0 AND @IsInFailOverToCentralKillThisProc = 1 THEN 0 ELSE  --2021-11-13
                                          IIF(@IsPrestartHistoryActive = 0,0 ,(SELECT ISNULL((select TOP 1 DeploymentModeConfigValue from [dbo].[udf_iPlodDeploymentConfigs] (@appDeploymentMode,'IsActiveGrpGrpComponent_PrestartHistory')  ),1)))


			                                      end
      SET @IsPrestartLiveHistoryActive =-- case WHEN @AllowLocal = 0 AND @IsInFailOverToCentralKillThisProc = 1  THEN 0 ELSE  --2021-11-13
                                    IIF(@IsPrestartLiveHistoryActive = 0,0 ,(SELECT ISNULL((select TOP 1 DeploymentModeConfigValue from [dbo].[udf_iPlodDeploymentConfigs] (@appDeploymentMode,'IsActiveGrpGrpComponent_PrestartLiveHistory')  ),0)))
                                           --   end

	set @IsHazardHistoryActive =case WHEN @AllowLocal = 0 AND @IsInFailOverToCentralKillThisProc = 1  THEN 0 ELSE  --2021-11-13
                                            IIF(@IsHazardHistoryActive = 0,0 ,(SELECT ISNULL((select TOP 1 DeploymentModeConfigValue from [dbo].[udf_iPlodDeploymentConfigs] (@appDeploymentMode,'IsActiveGrpGrpComponent_HazardHistory')  ),1)))
		                                                    end
    SET @IsEquipmentActive = IIF(@IsEquipmentActive = 0,0,(SELECT ISNULL((select TOP 1 DeploymentModeConfigValue from [dbo].[udf_iPlodDeploymentConfigs] (@appDeploymentMode,'IsActiveGrpGrpComponent_Equipments')  ),1)))
		SET @IsWorkOrdersActive = IIF(@IsWorkOrdersActive = 0,0 ,(SELECT ISNULL((select TOP 1 DeploymentModeConfigValue from [dbo].[udf_iPlodDeploymentConfigs] (@appDeploymentMode,'IsActiveGrpGrpComponent_WorkOrders')  ),1)))
		SET @IsMaterialsActive = IIF(@IsMaterialsActive = 0,0 ,(SELECT ISNULL((select TOP 1 DeploymentModeConfigValue from [dbo].[udf_iPlodDeploymentConfigs] (@appDeploymentMode,'IsActiveGrpGrpComponent_Materials')  ),1)))
		SET @IsRaiseboreActive = IIF(@IsRaiseboreActive = 0,0 ,(SELECT ISNULL((select TOP 1 DeploymentModeConfigValue from [dbo].[udf_iPlodDeploymentConfigs] (@appDeploymentMode,'IsActiveGrpGrpComponent_Raisebore')  ),1)))
		SET @IsTabletSerialsActive = IIF(@IsTabletSerialsActive = 0,0 ,(SELECT ISNULL((select TOP 1 DeploymentModeConfigValue from [dbo].[udf_iPlodDeploymentConfigs] (@appDeploymentMode,'IsActiveGrpGrpComponent_TabletSerials')  ),1)))
		SET @IsProdDrillHistoryActive =   case WHEN @AllowLocal = 0 AND @IsInFailOverToCentralKillThisProc = 1  THEN 0 ELSE  --2021-11-13
                                           IIF(@IsProdDrillHistoryActive = 0,0 ,(SELECT ISNULL((select TOP 1 DeploymentModeConfigValue from [dbo].[udf_iPlodDeploymentConfigs] (@appDeploymentMode,'IsActiveGrpGrpComponent_ProdDrill')  ),1)))
	                                               end
  	SET @IsEquipStatusActive =  case WHEN @AllowLocal = 0 AND @IsInFailOverToCentralKillThisProc = 1  THEN 0 ELSE  --2021-11-13
                                  IIF(@IsEquipStatusActive = 0,0 ,(SELECT ISNULL((select TOP 1 DeploymentModeConfigValue from [dbo].[udf_iPlodDeploymentConfigs] (@appDeploymentMode,'IsActiveGrpGrpComponent_EquipStatus')  ),1)))
		                                          end
    SET @IsPastWorkOrdersActive = case WHEN @AllowLocal = 0 AND @IsInFailOverToCentralKillThisProc = 1  THEN 0 ELSE  --2021-11-13
                                    IIF(@IsPastWorkOrdersActive = 0,0 ,(SELECT ISNULL((select TOP 1 DeploymentModeConfigValue from [dbo].[udf_iPlodDeploymentConfigs] (@appDeploymentMode,'IsActiveGrpGrpComponent_PastWorkOrders')  ),1)))
                                            END


--addnew



	--	SELECT @IsLocationsActive , @IsTruckingActive , @IsattributesActive , @IsPrestartHistoryActive , @IsHazardHistoryActive , 
		--			@IsEquipmentActive , @IsWorkOrdersActive , @IsMaterialsActive , @IsRaiseboreActive , @IsTabletSerialsActive ;




declare @GroupGroup table  (	OperationId  int NULL
		, ProjectID  int NULL
		, UIGroupGroupDetailId   varchar(MAX) null
		, UIGroupGroupDetailType   varchar(MAX) null
		, UIGroupGroupDetailFilterCsv   varchar(MAX) null
		, UIGroupGroupDetailFilterParentCsv   varchar(MAX) null
		, TextId   varchar(MAX) null
		, [Text]   varchar(MAX) null
		, Detail  varchar(MAX) null
		, Group1    varchar(MAX) null
		, Group2   varchar(MAX) null
		-- Flags.
		, IsDeleted  int NULL
		, IsEnabled  int NULL
		, OrderBy  int NULL
		, ImageFileName  varchar(MAX) null
		,AttributesJson  varchar(MAX) null)

	--FROM (
 IF 	 @IsLocationsActive  = 1
BEGIN

-- Need to insert locations twice (LocationInGroup and Location). This seemed easiest. 
DECLARE @LocnTemp TABLE  (	OperationId  INT NULL
		, ProjectID  INT NULL
		, UIGroupGroupDetailId   VARCHAR(MAX) NULL
		, UIGroupGroupDetailType   VARCHAR(MAX) NULL
		, UIGroupGroupDetailFilterCsv   VARCHAR(MAX) NULL
		, UIGroupGroupDetailFilterParentCsv   VARCHAR(MAX) NULL
		, TextId   VARCHAR(MAX) NULL
		, [Text]   VARCHAR(MAX) NULL
		, Detail  VARCHAR(MAX) NULL
		, Group1    VARCHAR(MAX) NULL
		, Group2   VARCHAR(MAX) NULL
		-- Flags.
		--, IsDeleted  int NULL
		, IsEnabled  INT NULL
		, OrderBy  INT NULL
		, ImageFileName  VARCHAR(MAX) NULL
		,AttributesJson  VARCHAR(MAX) NULL)

INSERT INTO @GroupGroup(OperationId, ProjectID, UIGroupGroupDetailId, UIGroupGroupDetailType, UIGroupGroupDetailFilterCsv, UIGroupGroupDetailFilterParentCsv, TextId, Text, Detail, Group1, Group2,  IsEnabled, OrderBy, ImageFileName, AttributesJson)
	-- Grab output to re insert

	-- This is how to re-use a list twice in a lightweight manner. Grab the inserted into output table. Re use that. 

	--OUTPUT Inserted.OperationId,Inserted.ProjectID,Inserted.UIGroupGroupDetailId,Inserted.UIGroupGroupDetailType, 
	--		Inserted.UIGroupGroupDetailFilterCsv, Inserted.UIGroupGroupDetailFilterParentCsv, Inserted.TextId,Inserted.Text, Inserted.Detail, 
	--		Inserted.Group1, Inserted.Group2,  Inserted.IsEnabled, Inserted.OrderBy, Inserted.ImageFileName, Inserted.AttributesJson
	--		INTO @LocnTemp

		SELECT OperationID =  @operationId
				,ProjectId = @projectId
				,UIGroupGroupDetailId = 'Location' + '_' + CAST(LocationId AS NVARCHAR)
				, UIGroupGroupDetailType = 'Location_1'  --bascially matches the InputMatchId (concat FieldType and InputId) from input definitions
				, UIGroupGroupDetailFilterCsv =							+',AllActive'  --this is in so that a blank in the first Param1 field will show all locations
																		+ IIF( l.Production = 1 , ',Production' ,'')
																		+ IIF(  l.Development = 1 , ',Development' ,'')
																		+ IIF(  l.BogTruckSource = 1 , ',BogTruckSource' ,'')
																		+ IIF(  l.Cabolting = 1 , ',Cabolting' ,'')
																		+ IIF(  l.LocnTruck = 1 , ',LocnTruck' ,'')
																		+ IIF(  l.RaiseBore = 1 , ',RaiseBore' ,'')
																		+ IIF(  l.ServiceCrew = 1 , ',ServiceCrew' ,'')
																		+ IIF(  l.DiamondDrill = 1 , ',DiamondDrill' ,'')
																		+ IIF(  l.BackfillTo = 1 , ',BackfillTo' ,'')
																		+ IIF(  l.RefugeChamber = 1 , ',RefugeChamber' ,'')
																		 + IIF(  l.EscapeWay = 1 , ',EscapeWay' ,'')
																		  + IIF(  l.Surface = 1 , ',Surface' ,'')
																		 +','


				, UIGroupGroupDetailFilterParentCsv = ''  
				, TextId =  CONVERT (NVARCHAR(50), LocationId)
				, [Text] = l.LocationCode
				, Detail = ''
				, Group1 = CASE WHEN l.PitID = 0 THEN '' 
								WHEN @LocationGroup1PitOrebody = 1 THEN 
									IIF((att.AttributeDescription IS NULL OR att.AttributeDescription = ''),p.PitDescription,p.PitDescription + ' - ' + att.AttributeDescription)
								ELSE p.PitDescription END
				, Group2 = CASE WHEN @LocationLevelIgnore = 1 THEN NULL ELSE l.LocLevel END 
				, IsEnabled = 1
				, OrderBy = ROW_NUMBER() OVER (PARTITION BY l.LocationID ORDER BY l.LocationCode )
				, ImageFileName = ''
				,AttributesJson='[{"Key":"LocLevelId","Value":'+CAST(l.LevelID AS VARCHAR)+'}]'

			FROM dbo.tbl_DBT_Location AS l WITH (NOLOCK)
				LEFT JOIN tbl_DBT_Pit AS p WITH (NOLOCK) ON l.PitID = p.PitID
				LEFT OUTER JOIN dbo.tbl_SYS_Attribute AS att 
					ON CAST(l.DefaultAttributeID_3 AS VARCHAR(10)) = CAST(att.AttributeID AS VARCHAR(10))
					AND @LocationGroup1PitOrebody = 1
			WHERE l.ProjectId = @ProjectId 
				AND l.Active = 1
				AND NOT (ISNULL(@LoadingBaysAreNotActualLocations,0) = 1 AND dbo.FN_IsNullorEmpty(LocnTruck,0)  =1)  --2021-02-15 ts

--				-- Re Insert for LocationInGroup
--INSERT INTO @GroupGroup(OperationId, ProjectID, UIGroupGroupDetailId, UIGroupGroupDetailType, UIGroupGroupDetailFilterCsv, UIGroupGroupDetailFilterParentCsv, TextId, Text, Detail, Group1, Group2,  IsEnabled, OrderBy, ImageFileName, AttributesJson)
--			SELECT OperationId, 
--			ProjectID,
--			UIGroupGroupDetailId = REPLACE(UIGroupGroupDetailId,'Location_','LocationInGroup_'),
--			 UIGroupGroupDetailType = REPLACE(UIGroupGroupDetailType,'Location_','LocationInGroup_'),
--			UIGroupGroupDetailFilterCsv, 
--			UIGroupGroupDetailFilterParentCsv, 
--			TextId, Text, Detail, Group1, Group2,  IsEnabled, OrderBy, ImageFileName, AttributesJson 
--			FROM @LocnTemp
--			-- MCR only need Charging for now for the firing task. Maybe we should have more LocnInGroups for each tick? Or query the main task somehow for param1,2,3,
--			WHERE (UIGroupGroupDetailFilterCsv  LIKE '%Production%' OR UIGroupGroupDetailFilterCsv  LIKE '%Development%')






				--AND @appDeploymentMode <> 'stores'

				--AND @IsTestProject =0
				/*AND (ISNULL(l.Development, 0) + ISNULL(l.Production, 0)
					+ISNULL(l.[Cabolting], 0) + ISNULL(l.[ServiceCrew], 0)			
					+ISNULL(l.[RaiseBore], 0) + ISNULL(l.[DiamondDrill], 0)			
					+ISNULL(l.[BogTruckSource], 0) + ISNULL(l.[ServiceCrew], 0)			
					+ISNULL(l.[EscapeWay], 0) + ISNULL(l.[RefugeChamber], 0)			
					+ISNULL(l.[Surface], 0) + ISNULL(l.[Stockpile], 0)	
						) > 0  --put in filter here for locns allowed to be used for Lcoation Field type
						*/
		--UNION ALL  --add the dummy one for unknown location
		--have commented this out. updated the method to treat all Locations taht start with "NotOnList" to require a comment.
  --      		SELECT OperationID =  @operationId
		--		,ProjectId = @projectId
		--		,UIGroupGroupDetailId = 'Location' + '_' +'-1' --CAST(LocationId AS NVARCHAR)
		--		, UIGroupGroupDetailType = 'Location_1'  --bascially matches the InputMatchId (concat FieldType and InputId) from input definitions
		--		, UIGroupGroupDetailFilterCsv =							+',AllActive'  --this is in so that a blank in the first Param1 field will show all locations
		--																+ iif( 1 = 1 , ',Production' ,'')
		--																+ iif(  1 = 1 , ',Development' ,'')
		--																+ iif( 1 = 1 , ',BogTruckSource' ,'')
		--																+ iif(  1 = 1 , ',Cabolting' ,'')
		--																+ iif( 1 = 1 , ',LocnTruck' ,'')
		--																+ iif(  1 = 1 , ',RaiseBore' ,'')
		--																+ iif(  1 = 1 , ',ServiceCrew' ,'')
		--																+ iif(  1 = 1 , ',DiamondDrill' ,'')
		--																+ iif( 1 = 1 , ',BackfillTo' ,'')
		--																+ iif(  1 = 1 , ',RefugeChamber' ,'')
		--																 + iif(  1 = 1 , ',EscapeWay' ,'')
		--																  + iif( 1 = 1 , ',Surface' ,'')


		--																 +','


		--		, UIGroupGroupDetailFilterParentCsv = ''  
		--		, TextId = '-1'
		--		, [Text] = '... Select this and write actual location ... '
		--		, Detail = ''
		--		, Group1 = 'zz_Missing Location'
		--		, Group2 = 'zz_Missing Location' 
		--		, IsEnabled = 1
		--		, OrderBy =99999999-- ROW_NUMBER() OVER (PARTITION BY l.LocationID ORDER BY l.LocationCode )
		--		, ImageFileName = ''
		--		,AttributesJson=''--'[{"Key":"LocLevelId","Value":'+CAST(l.LevelID AS varchar)+'}]'
		--		WHERE CAST(ISNULL(dbo.FN_GetConfigValue(@ProjectID, 'ShowzzDummyLocnInIplod'), 0) AS int) = 1

		--		locationcode like 'NotOnList%' then bitwise=8
		--		'NotOnList - Rehab Location'
		--		,'NotOnList - Other Location'
		--		,'NotOnList - Rehab Location'
		--		, 'zz_Unknown'


END

 IF 	 @IsTruckingActive =1
BEGIN
		--COMBINED INTO HAUL ROUTE, give it another FieldType
INSERT INTO @GroupGroup(OperationId, ProjectID, UIGroupGroupDetailId, UIGroupGroupDetailType, UIGroupGroupDetailFilterCsv, UIGroupGroupDetailFilterParentCsv, TextId, Text, Detail, Group1, Group2,  IsEnabled, OrderBy, ImageFileName, AttributesJson)

		SELECT OperationID =  @operationId
				,ProjectId = @projectId
				,	UIGroupGroupDetailId = 'HaulRoute' + '_' + CAST(d.DistanceID AS NVARCHAR)
				, UIGroupGroupDetailType = 'HaulRoute_1'  --bascially matches the  InputMatchId (concat FieldType and InputId)  from input definitions
				, UIGroupGroupDetailFilterCsv = ',LocLevelId=' +CAST(ls.LevelID AS VARCHAR)+',' --should fitler based on locations!
				, UIGroupGroupDetailFilterParentCsv = ''
				, TextId = CONVERT(NVARCHAR(50), d.DistanceID)
				, [Text] = ls.LocationCode + ' --> ' +l.LocationCode
				, Detail = ''
				, Group1 = CASE WHEN ls.PitID = 0 THEN '' 
								ELSE ls.PitDescription END
				, Group2 = ls.LocLevel
				, IsEnabled = 1
				, OrderBy = ROW_NUMBER() OVER (PARTITION BY l.LocationID ORDER BY l.LocationCode )
				, ImageFileName = ''
				,AttributesJson='[{"Key":"Distance","Value":'+CAST(d.Distance AS VARCHAR)+'}'
									+',{"Key":"LocLevelId","Value":'+CAST(ls.LevelID AS VARCHAR)+'}'  ---use this in calc
								+']'
					--put ths back!  (SELECT  [Key]='Distance',[Value]= ISNULL(dd.Distance,0) FROM dbo.tbl_DBT_Distances AS dd WHERE d.DistanceID = dd.DistanceID   FOR JSON PATH)

		FROM dbo.tbl_DBT_Location AS l WITH (NOLOCK)
				INNER JOIN dbo.tbl_DBT_Distances AS d
					ON l.LocationID = d.DestID 

				INNER JOIN (SELECT locationid, locationcode,s.DistanceID, ls.LocLevel,ls.PitID,p.PitDescription , ls.LevelID
									FROM dbo.tbl_DBT_Distances AS s WITH (NOLOCK)
									INNER JOIN dbo.tbl_DBT_Location AS ls WITH (NOLOCK) ON s.SourceID = ls.LocationID 
									LEFT JOIN  tbl_DBT_Pit AS p WITH (NOLOCK) ON ls.PitID = p.PitID
									WHERE ls.ProjectID = @projectId
									AND dbo.FN_IsNullorEmpty(s.IsDeleted,0) = 0
									AND ls.Active = 1 --- the source needs to be active too
									AND ls.LocnTruck  =1 --source needs tick
									) AS ls 
									ON d.DistanceID =ls.DistanceID
			WHERE l.ProjectId = @PRojectId 
				AND l.Active = 1 
				AND dbo.FN_IsNullorEmpty(d.IsDeleted,0)=0 --don't need the locn truck tick ... only get if they have setup a distance
				--AND (ISNULL(l.LocnTruck, 0)) > 0  --put in filter here for locns allowed to be used for loaded from Field type
				--AND @appDeploymentMode <> 'stores'
				AND @IsTruckingActive =1
				AND l.DestTruck = 1 --dest needs tick
				--AND @IsTestProject =0

		UNION ALL 
		SELECT	TOP 1  OperationID =  @operationId
				,ProjectId = @projectId
				,
				UIGroupGroupDetailId = 'HaulRoute' + '_' +'-1'-- CAST(-1 AS NVARCHAR)
				, UIGroupGroupDetailType = 'HaulRoute_1'  --bascially matches the  InputMatchId (concat FieldType and InputId)  from input definitions
				, UIGroupGroupDetailFilterCsv = '' --should fitler based on locations!
				, UIGroupGroupDetailFilterParentCsv = ''
				, TextId = '-1'
				, [Text] = '... Select this and write comment ... '
				, Detail = ''
				, Group1 = CASE WHEN l.PitID = '0' THEN '' 
								ELSE 'Missing Haul Route' END --just to give it a grouping if the others have one
				, Group2 =  CASE WHEN l.PitID <> '0' THEN '' 
								ELSE 'Missing Haul Route' END --and the reverse so it isn't duplicated
				, IsEnabled = 1
				, OrderBy = 99999999
				, ImageFileName = ''
				,AttributesJson=''

			FROM dbo.tbl_DBT_Location AS l
			WHERE Active >0
			AND ProjectID = @projectId
			--AND @appDeploymentMode <> 'stores'
			AND @IsTruckingActive =1
			--AND @IsTestProject =0


		--loadedFrom Field Type (COMBINE INTO HAUL ROUTE???)
		UNION ALL 
		SELECT OperationID =  @operationId
				,ProjectId = @projectId
				,	UIGroupGroupDetailId = 'LoadedFrom' + '_' + CAST(l.LocationId AS NVARCHAR)
				, UIGroupGroupDetailType = 'LoadedFrom_1'  --bascially matches the  InputMatchId (concat FieldType and InputId)  from input definitions
				, UIGroupGroupDetailFilterCsv = CASE WHEN Development = 1 THEN ',1,2,' 
													WHEN ServiceCrew = 1 THEN ',3,' 
													ELSE NULL END  --do better than this
				, UIGroupGroupDetailFilterParentCsv = ''
				, TextId = CONVERT(NVARCHAR(50), LocationId)
				, [Text] = l.LocationCode
				, Detail = ''
				, Group1 =  CASE WHEN l.PitID = 0 THEN '' 
								ELSE p.PitDescription END
				, Group2 = l.LocLevel
				, IsEnabled = 1
				, OrderBy = ROW_NUMBER() OVER (PARTITION BY l.LocationID ORDER BY l.LocationCode )
				, ImageFileName = ''
				,AttributesJson=''

			FROM dbo.tbl_DBT_Location AS l WITH (NOLOCK) 
				LEFT JOIN tbl_DBT_Pit AS p WITH (NOLOCK) ON l.PitID = p.PitID
			WHERE l.ProjectId = @PRojectId 
				AND l.Active = 1
				AND (ISNULL(l.LocnTruck, 0)) > 0  --put in filter here for locns allowed to be used for loaded from Field type
				--AND @appDeploymentMode <> 'stores'
				--AND @IsTruckingActive=1
				--AND @IsTestProject =0

union all 

		--destination Field Type (COMBINE INTO HAUL ROUTE???)

		SELECT	 OperationID =  @operationId
				,ProjectId = @projectId
				,UIGroupGroupDetailId = 'Destination' + '_' + CAST(l.LocationId AS NVARCHAR)
				, UIGroupGroupDetailType = 'Destination_1'  --bascially matches the  InputMatchId (concat FieldType and InputId)  from input definitions
				, UIGroupGroupDetailFilterCsv = CASE WHEN Development = 1 THEN ',1,2,' 
													WHEN ServiceCrew = 1 THEN ',3,' 
													ELSE NULL END  --do better than this
				, UIGroupGroupDetailFilterParentCsv = ''
				, TextId = CONVERT(NVARCHAR(50), LocationId)
				, [Text] = l.LocationCode
				, Detail = ''
				, Group1 = CASE WHEN l.PitID = 0 THEN '' 
								ELSE p.PitDescription END
				, Group2 = l.LocLevel
				, IsEnabled = 1
				, OrderBy = ROW_NUMBER() OVER (PARTITION BY l.LocationID ORDER BY l.LocationCode )
				, ImageFileName = ''
				,AttributesJson=''

			FROM dbo.tbl_DBT_Location AS l WITH (NOLOCK) 
				LEFT JOIN tbl_DBT_Pit AS p WITH (NOLOCK) ON l.PitID = p.PitID
			WHERE l.ProjectId = @PRojectId 
				AND l.Active = 1
				AND (ISNULL(l.DestTruck, 0) + ISNULL(l.[BackfillTo], 0)) > 0  --put in filter here for locns allowed to be used for destination Field type
				--AND @appDeploymentMode <> 'stores'

				--AND @IsTestProject =0

	end
 if  @IsEquipmentActive=1
BEGIN

insert into @GroupGroup(OperationId, ProjectID, UIGroupGroupDetailId, UIGroupGroupDetailType, UIGroupGroupDetailFilterCsv, UIGroupGroupDetailFilterParentCsv, TextId, Text, Detail, Group1, Group2,  IsEnabled, OrderBy, ImageFileName, AttributesJson)

--set for LoadedBy param on trucking.  need this thing to work on device:UIGroupGroupDetailFilterCsv so we can reuse this field for othe rthings (eg Jumbo that drilled the cut) though that has always been fraught!
			SELECT	 OperationID =  @operationId
				,ProjectId = @projectId
				,UIGroupGroupDetailId = 'RelatedEquipment' + '_' + CAST(EquipmentID AS NVARCHAR)
							, UIGroupGroupDetailType = 'RelatedEquipment_1'  --bascially matches the  InputMatchId (concat FieldType and InputId)  from input definitions
							, UIGroupGroupDetailFilterCsv = 'tbc' /*CASE WHEN Development = 1 THEN ',1,2,' 
																WHEN ServiceCrew = 1 THEN ',3,' 
																ELSE NULL END  --do better than this*/
							, UIGroupGroupDetailFilterParentCsv = ''
							, TextId = CONVERT(NVARCHAR(50), EquipmentID)
							, [Text] = EquipmentCode
							, Detail = ''
							, Group1 = ''
							, Group2 = IIF(EquipTypeID = 57,'',EquipTypeCode) --if bogger don't require them to tap the drill (will just slow things down) hide the non-normal things away though
							, IsEnabled = 1
							, OrderBy = ROW_NUMBER() OVER (PARTITION BY EquipmentID ORDER BY EquipTypeCode,EquipmentCode )
							, ImageFileName = ''
							,AttributesJson=''
						FROM dbo.View_webbarAPI_EquipmentDetails_Maint
						WHERE EquipTypeID IN (57,19,27,107) AND Active = 1
						AND ProjectID = @ProjectId 
						--AND @appDeploymentMode <> 'stores'

			--AND @IsTestProject =0
end

 if  @IsEquipmentActive=1
BEGIN
insert into @GroupGroup(OperationId, ProjectID, UIGroupGroupDetailId, UIGroupGroupDetailType, UIGroupGroupDetailFilterCsv, UIGroupGroupDetailFilterParentCsv, TextId, Text, Detail, Group1, Group2,  IsEnabled, OrderBy, ImageFileName, AttributesJson)

--set for jumbo who bored the cut on charge tasks.  need this thing to work on device:UIGroupGroupDetailFilterCsv so we can reuse this field for othe rthings (eg Jumbo that drilled the cut) though that has always been fraught!
			SELECT	 OperationID =  @operationId
				,ProjectId = @projectId
				,UIGroupGroupDetailId = 'RelatedEquipmentUJ' + '_' + CAST(EquipmentID AS NVARCHAR)
							, UIGroupGroupDetailType = 'RelatedEquipmentUJ_1'  --bascially matches the  InputMatchId (concat FieldType and InputId)  from input definitions
							, UIGroupGroupDetailFilterCsv = 'tbc' /*CASE WHEN Development = 1 THEN ',1,2,' 
																WHEN ServiceCrew = 1 THEN ',3,' 
																ELSE NULL END  --do better than this*/
							, UIGroupGroupDetailFilterParentCsv = ''
							, TextId = CONVERT(NVARCHAR(50), EquipmentID)
							, [Text] = EquipmentCode
							, Detail = ''
							, Group1 = ''
							, Group2 =''-- EquipTypeCode don't worry about this such a small list
							, IsEnabled = 1
							, OrderBy = ROW_NUMBER() OVER (PARTITION BY EquipmentID ORDER BY EquipTypeCode,EquipmentCode )
							, ImageFileName = ''
							,AttributesJson=''
						FROM dbo.View_webbarAPI_EquipmentDetails_Maint
						WHERE EquipTypeID IN (100,126,130) AND Active = 1
						AND ProjectID = @ProjectId
						--AND @appDeploymentMode <> 'stores'

						--AND @IsTestProject =0

end

 if  @IsMaterialsActive =1
BEGIN
insert into @GroupGroup(OperationId, ProjectID, UIGroupGroupDetailId, UIGroupGroupDetailType, UIGroupGroupDetailFilterCsv, UIGroupGroupDetailFilterParentCsv, TextId, Text, Detail, Group1, Group2,  IsEnabled, OrderBy, ImageFileName, AttributesJson)

		--Material Field Type 
						SELECT	 OperationID =  @operationId
				,ProjectId = @projectId
				,UIGroupGroupDetailId = 'Material' + '_' + CAST(m.MaterialOpID AS NVARCHAR)
								, UIGroupGroupDetailType = 'Material_1'  --bascially matches the  InputMatchId (concat FieldType and InputId)  from input definitions
								, UIGroupGroupDetailFilterCsv = 			+',AllActive'  --this is in so that a blank in the first Param1 field will show all locations

																		+ iif(  m.DevDrilling = 1 , ',DevDrilling' ,'')
																		+ iif(  m.DevGroundSupport = 1 , ',DevGroundSupport' ,'')
																		+ iif(  m.ProdDrilling = 1 , ',ProdDrilling' ,'')
																		+ iif(  m.Trucking = 1 , ',Trucking' ,'')
																		+ iif(  m.BoggingTasks = 1 , ',BoggingTasks' ,'')
																		+ iif(  m.ChargeUp = 1 , ',ChargeUp' ,'')
																		+ iif(  m.RaiseBore = 1 , ',RaiseBore' ,'')
																		+ iif(  m.ServiceCrew = 1 , ',ServiceCrew' ,'')
																		+ iif(  m.DiamondDrill = 1 , ',DiamondDrill' ,'')
																		+ iif(  m.Cabolting = 1 , ',Cabolting' ,'')
																		+ iif(  m.Shotcrete = 1 , ',Shotcrete' ,'')
																		 + iif(  m.AGI = 1 , ',AGI' ,'')
																		  + iif(  m.DiamondDrill = 1 , ',DiamondDrill' ,'')
																		 +','



							, UIGroupGroupDetailFilterParentCsv = ''
								, TextId = CONVERT(NVARCHAR,m.MaterialOpID)
								, [Text] = m.MaterialDescOp
								, Detail = ''
								, Group1 = ''
								, Group2 = ''
								, IsEnabled = 1
								, OrderBy = ROW_NUMBER() OVER (PARTITION BY m.MaterialOpID ORDER BY m.MaterialDescOp )
								, ImageFileName = ''
								,AttributesJson= '[{"Key":"SG","Value":'+CAST(m.SG AS varchar)+'}'	
																						+',{"Key":"MatSysId","Value":'+CAST(m.MaterialID as varchar)+'}'
																						   +']'
												--(SELECT [Key]='SG',[Value]=ISNULL(dd.SG,0) FROM dbo.tbl_DBT_Materials  AS dd WHERE m.MaterialOpID = dd.MaterialOpID  FOR JSON PATH)
							FROM dbo.tbl_DBT_Materials AS m WITH (NOLOCK)
							WHERE ProjectId = @ProjectId 
								AND m.Active = 1 
								--AND @appDeploymentMode <> 'stores'

				--AND @IsTestProject =0
		end

 if @IsWorkOrdersActive=1
begin--work orders, got this from [dbo].[SP_ShiftSummaryMaint_RefNoList] 
insert into @GroupGroup(OperationId, ProjectID, UIGroupGroupDetailId, UIGroupGroupDetailType, UIGroupGroupDetailFilterCsv, UIGroupGroupDetailFilterParentCsv, TextId, Text, Detail, Group1, Group2,  IsEnabled, OrderBy, ImageFileName, AttributesJson)

							 SELECT OperationID =  @operationId
				,ProjectId = @projectId
				, UIGroupGroupDetailId = 'RefNo' + '_' + WorkOrder
									, UIGroupGroupDetailType = 'RefNo_1'  --bascially matches the  InputMatchId (concat FieldType and InputId)  from input definitions
									, UIGroupGroupDetailFilterCsv = ','+RTRIM(EquipCode)+','
									, UIGroupGroupDetailFilterParentCsv = ''
									, TextId = WorkOrder
									, [Text] = WorkOrder + ' - ' + WorkOrderName
									, Detail = ''
									, Group1 = EquipCode
									, Group2 = ''
									, IsEnabled = 1
									, OrderBy = 1
									, ImageFileName = ''
									,AttributesJson=''

									--,CASE WHEN (LEFT(WorkOrder,6) = EquipCode) THEN 1	ELSE 0 END AS 'IsAdHocWO'
									FROM [dbo].[View_WebbarAPI_WorkOrder]  

								  WHERE 
								  --left this filter same for the time being
								  (ACTUALENDDATE >= DATEADD(DAY,-2,@Today) OR CAST(ACTUALENDDATE AS int) = 0 
											OR STATUSCDE = 'In Progress' OR STATUSCDE = 'Approved' OR STATUSCDE = 'Provisional' OR STATUSCDE = 'Released')  
											AND STATUSCDE <> 'Cancelled'
									AND (ProjectID = @ProjectID 
												OR (ProjectID = 0 AND OperationID = @OperationID))
												AND @IsTestProject =0
												AND @IsWorkOrdersActive =1
					UNION ALL 
						--get dummy one for missing
						 SELECT  OperationID =  @operationId
				,ProjectId = @projectId
				,UIGroupGroupDetailId = 'RefNo' + '_' + 'zz_UnknownWO'
							, UIGroupGroupDetailType = 'RefNo_1'  --bascially matches the  InputMatchId (concat FieldType and InputId)  from input definitions
							, UIGroupGroupDetailFilterCsv = ',ALLEQUIP,'  --indicates that all equipment have access to this one.
							, UIGroupGroupDetailFilterParentCsv = ''
							, TextId = 'zz_UnknownWO'
							, [Text] = '_Unknown Work Order'
							, Detail = ''
							, Group1 = '_Unknown Work Order'
							, Group2 = ''
							, IsEnabled = 1
							, OrderBy = 1
							, ImageFileName = ''
							,AttributesJson=''
						--	where 
end



 if  @IsattributesActive=1
begin
--Attribute Lists
insert into @GroupGroup(OperationId, ProjectID, UIGroupGroupDetailId, UIGroupGroupDetailType, UIGroupGroupDetailFilterCsv, UIGroupGroupDetailFilterParentCsv, TextId, Text, Detail, Group1, Group2,  IsEnabled, OrderBy, ImageFileName, AttributesJson)

						SELECT	 OperationID =  @operationId
				,ProjectId = @projectId
				,UIGroupGroupDetailId = CASE WHEN AttTypeDesc = 'POReceiptCancelRemainder' THEN AttributeDescription 
												ELSE   AttributeDescription + '_' + CAST(AttributeID AS NVARCHAR)+ '_' + CAST(AttributeTypeID AS NVARCHAR) + '_' + AttTypeDesc --some things have different attributetypeesc for same attributeTypeid! then there was a config to decide which one to use. probably need to shift this back to attributes function if bringing this config back. it was for refuge chamber location lists in iplodsetup proc for original v2
												END
								, UIGroupGroupDetailType = CASE WHEN AttTypeDesc = 'POReceiptCancelRemainder' THEN AttTypeDesc   --this is how this one is referenced into the IntolerableList, specific for Stores POs
																ELSE 'AttrList' + '_' + CAST(AttributeTypeID AS NVARCHAR)  --I think this is how the normal attribute lists are mapped into iplod inputs. just reference it into the Intolerable in its entirety (with _ID) normal ones appear to have teh _ID stripped out on device to find the correct list?
														END
														--AttrTypeDesc + CASE WHEN AttrTypeDesc = 'POReceiptCancelRemainder' THEN ''ELSE '_' + CAST(AttributeTypeID AS nvarchar) 
																--			END  --bascially matches the  InputMatchId (concat FieldType and InputId)  from input definitions
								, UIGroupGroupDetailFilterCsv = ''
								, UIGroupGroupDetailFilterParentCsv = ''
								, TextId = CASE WHEN AttTypeDesc = 'POReceiptCancelRemainder' THEN  AttributeDescription  --special for the PO 
												 ELSE  CONVERT(NVARCHAR,AttributeID) END  --could put the AttributeDescription into this for other for intolerable lists use cases when they happen too?
								, [Text] =CASE WHEN AttributeDescription = 'POCancelNo' THEN 'Do NOT Cancel'  
											  WHEN AttributeDescription = 'POCancelYes' THEN 'Cancel Remainder'
											 ELSE AttributeDescription  --depending on new use cases for intolerable lists, could/should make new field for AttributeDescription Label.
											 END
								, Detail = ''
								, Group1 = ''
								, Group2 = ''
								, IsEnabled = 1
								, OrderBy = ROW_NUMBER() OVER (PARTITION BY AttributeDescription ORDER BY AttributeDescription )
								, ImageFileName = ''
								,AttributesJson= '[{"Key":"AssociatedNumeral","Value":'+CAST(ISNULL(AssociatedNumeral,0) AS varchar)+'}]'
						 FROM  --FN_GetAttributes( @projectId, '', '', 0, 0,0,'Attr') 
						 [dbo].[view_GetAttributes] vgac --2021-01-21
				--	view_GetAttributes_Cached vgac  --2021-11-13 -- 2022-01-05
          	 WHERE projectid in(0, @projectId) 
						 AND AttributeDescription IS NOT NULL  --no use putting into a list if it is null!

		-- AND @IsTestProject =0
	end
/*UNION ALL 


--Intolerable GenericList in iplod 
		SELECT	UIGroupGroupDetailId =  AttributeDescription + CASE WHEN AttrTypeDesc <> 'POReceiptCancelRemainder' THEN  '_' + CAST(AttributeTypeID AS nvarchar)  --just in case for future to avoid duplicates
																	 ELSE '' END
				, UIGroupGroupDetailType = AttrTypeDesc   --bascially matches the  InputMatchId (concat FieldType and InputId)  from input definitions
				, UIGroupGroupDetailFilterCsv = ''
				, UIGroupGroupDetailFilterParentCsv = ''
				, TextId = CASE WHEN AttrTypeDesc = 'POReceiptCancelRemainder' THEN  AttributeDescription  --special for the PO 
								 ELSE  CONVERT(nvarchar,AttributeID) END  --could put the AttributeDescription into this for other use cases when they happen too?
				, [Text] = CASE WHEN AttributeDescription = 'POCancelNo' THEN 'Do NOT Cancel'
							  WHEN AttributeDescription = 'POCancelYes' THEN 'Cancel Remainder'
							 ELSE AttributeDescription  --depending on new use cases, could/should make new field for AttributeDescription Label
							 END
				, Detail = ''
				, Group1 = ''
				, Group2 = ''
				, IsEnabled = 1
				, OrderBy = ROW_NUMBER() OVER (PARTITION BY AttributeDescription ORDER BY AttributeDescription )
				, ImageFileName = ''
		 from  FN_GetAttributes( @projectId, '', '', 0, 0,0,'Attr') 
		 WHERE AttrTypeDesc LIKE 'IV_%'   --add more to the list with this prefix
			OR AttrTypeDesc = 'POReceiptCancelRemainder'  --special one for POs
*/


 if  @IsPrestartHistoryActive =1
BEGIN
insert into @GroupGroup(OperationId, ProjectID, UIGroupGroupDetailId, UIGroupGroupDetailType, UIGroupGroupDetailFilterCsv, UIGroupGroupDetailFilterParentCsv, TextId, Text, Detail, Group1, Group2,  IsEnabled, OrderBy, ImageFileName, AttributesJson)

					--********************************************
					-- Prestart  +Maint History
					--*******************************************
					SELECT  OperationID =  @operationId
				,ProjectId = @projectId
				,* FROM (
											 SELECT 
													 UIGroupGroupDetailId = 'PrestartHistoryIps_' + CAST(ROW_NUMBER() OVER (ORDER BY date, shift, projectid, operator, equipid, [prestart question],taskname ) AS VARCHAR(20))
													, UIGroupGroupDetailType = CASE WHEN IsPrestartHist = 1 THEN 'PrestartHistory_1' ELSE 'MaintHistory_1' END 
													, UIGroupGroupDetailFilterCsv = ''
													, UIGroupGroupDetailFilterParentCsv = ''
													, TextId = CAST(ROW_NUMBER() OVER (ORDER BY date, shift, projectid, operator, equipid, [prestart question],taskname ) AS VARCHAR(20))
													, [Text] = CASE WHEN IsPrestartHist = 1 THEN 
																CAST(DATEPART(d,Date) AS VARCHAR) + '/' + CAST(DATEPART(m,Date) AS VARCHAR) + '/' + CAST(DATEPART(YY,Date) AS VARCHAR)
																 +' - '+ Shift +' - '+  Operator  
																 + iif([InputType] = 'AttrList', ': '+[Answer], '')
																 + ' - Comments: ' + Comments 
																 + '; FeedbackAdvice: ' + ISNULL(FeedbackAdvice,'')

														else 
																	[Time] + ' - ' + Operator  + ' - Comments: ' + Comments + ' - '
																	 + RefNo

																	-- ISNULL([Time],'') + ' - ' + ISNULL(Operator,'')  + ' - Comments: ' + ISNULL(Comments,'') + ' - ' + ISNULL(RefNo,'')
															END


													, Detail = CAST(ROW_NUMBER() OVER (ORDER BY date, shift, projectid, operator, equipid, [prestart question],taskname ) AS VARCHAR(20))
													, Group1 = CASE WHEN IsPrestartHist = 1 THEN
																LEFT(EquipID,6) + ' - Faults last '+ CAST(@DaysOfHistoryForPrestarts AS VARCHAR) + ' days'
																ELSE 
																LEFT(EquipID,6) + ' - Downtime last '+ CAST(@DaysOfHistoryForPrestarts AS VARCHAR) + ' days'
																END 

													, Group2 = CASE WHEN IsPrestartHist = 1 THEN
																	isnull([Prestart Question] ,'General')
																ELSE CAST(DATEPART(dd,Date) AS VARCHAR) + '/' + CAST(DATEPART(mm,Date) AS VARCHAR) + '/' + CAST(DATEPART(YY,Date) AS VARCHAR)
																	 +' - '+ Shift +' - '+ isnull(TaskName,'')
																END 



													, IsEnabled = 1
													, OrderBy = 1--order by done at top select
													, ImageFileName = ''
													,AttributesJson=''
													FROM [dbo].[View_ShiftSummary_MaintHistory] 
															/*INNER JOIN (SELECT jn = 1   --remove!!
																	UNION ALL
																	SELECT jn=1 
																	) AS b ON 1 = jn*/

											WHERE Date  > DATEADD(DD,-1*@DaysOfHistoryForPrestarts,@Today)  AND [Include] = 1 --AND InputType NOT LIKE 'Stat%'  -- Temporarily made it -100 instead of -7
											AND InputType <>'camera'  --don't take photos back down!
											--AND NOT(Comments ='' AND Answer = '')  
											AND ProjectID = @projectId

											--AND comments IS NOT NULL
											--AND comments <> ''
											--AND @appDeploymentMode <> 'stores'
											) AS tbl1 
					WHERE --text IS NOT NULL   --2021-01-21 can't put this here, it kills the query plan. need to shift it further backup stream (into the include)

					 @IsTestProject =0
					--***************************************
					--End Prestart Hist
					--****************************************
					end

 if  @IsPrestartLiveHistoryActive =1
BEGIN
insert into @GroupGroup(OperationId, ProjectID, UIGroupGroupDetailId, UIGroupGroupDetailType, UIGroupGroupDetailFilterCsv, UIGroupGroupDetailFilterParentCsv, TextId, Text, Detail, Group1, Group2,  IsEnabled, OrderBy, ImageFileName, AttributesJson)

					--********************************************
					-- Prestart LIVE (from wrk) History
					--*******************************************
					SELECT  OperationID =  @operationId
				,ProjectId = @projectId
				,* FROM (
											 SELECT 
													 UIGroupGroupDetailId = 'PrestartHistoryLive_' + CAST(ROW_NUMBER() OVER (ORDER BY date, shift, projectid, operator, equipid, [prestart question],taskname ) AS VARCHAR(20))
													, UIGroupGroupDetailType = CASE WHEN IsPrestartHist = 1 THEN 'PrestartHistory_1' ELSE 'MaintHistory_1' END 
													, UIGroupGroupDetailFilterCsv = ''
													, UIGroupGroupDetailFilterParentCsv = ''
													, TextId = CAST(ROW_NUMBER() OVER (ORDER BY date, shift, projectid, operator, equipid, [prestart question],taskname ) AS VARCHAR(20))
													, [Text] = CASE WHEN IsPrestartHist = 1 THEN 
																CAST(DATEPART(d,Date) AS VARCHAR) + '/' + CAST(DATEPART(m,Date) AS VARCHAR) + '/' + CAST(DATEPART(YY,Date) AS VARCHAR)
																 +' - '+ Shift +' - '+  Operator  + ' - Comments: ' + Comments 
																 + '; FeedbackAdvice: ' + ISNULL(FeedbackAdvice,'')
															ELSE 
																	[Time] + ' - ' + Operator  + ' - Comments: ' + Comments + ' - '
																	 + RefNo

																	-- ISNULL([Time],'') + ' - ' + ISNULL(Operator,'')  + ' - Comments: ' + ISNULL(Comments,'') + ' - ' + ISNULL(RefNo,'')
															END


													, Detail = CAST(ROW_NUMBER() OVER (ORDER BY date, shift, projectid, operator, equipid, [prestart question],taskname ) AS VARCHAR(20))
													, Group1 = CASE WHEN IsPrestartHist = 1 THEN
																LEFT(EquipID,6) + ' - Faults last '+ CAST(@DaysOfHistoryForPrestarts AS VARCHAR) + ' days'
																ELSE 
																LEFT(EquipID,6) + ' - Downtime last '+ CAST(@DaysOfHistoryForPrestarts AS VARCHAR) + ' days'
																END 

													, Group2 = CASE WHEN IsPrestartHist = 1 THEN
																	[Prestart Question] 
																ELSE CAST(DATEPART(DD,Date) AS VARCHAR) + '/' + CAST(DATEPART(mm,Date) AS VARCHAR) + '/' + CAST(DATEPART(YY,Date) AS VARCHAR)
																	 +' - '+ Shift +' - '+ isnull(TaskName,'')
																END 



													, IsEnabled = 1
													, OrderBy = 1--order by done at top select
													, ImageFileName = ''
													,AttributesJson=''
													FROM [dbo].[View_ShiftSummary_MaintHistory_LiveOnly] 
															/*INNER JOIN (SELECT jn = 1   --remove!!
																	UNION ALL
																	SELECT jn=1 
																	) AS b ON 1 = jn*/

											WHERE Date  > DATEADD(DD,-1*@DaysOfHistoryForPrestarts,@Today)  AND [Include] = 1 --AND InputType NOT LIKE 'Stat%'  -- Temporarily made it -100 instead of -7
											AND InputType <>'camera'  --don't take photos back down!
											--AND NOT(Comments ='' AND Answer = '')  
											AND ProjectID = @projectId

											--AND comments IS NOT NULL
											--AND comments <> ''
											--AND @appDeploymentMode <> 'stores'
											) AS tbl1 
					WHERE --text IS NOT NULL   --2021-01-21 can't put this here, it kills the query plan. need to shift it further backup stream (into the include)

					 @IsTestProject =0
					--***************************************
					--End Prestart Hist
					--****************************************
end


 if  @IsHazardHistoryActive=1
BEGIN

IF @projectid <> 399
  BEGIN 
      insert into @GroupGroup(OperationId, ProjectID, UIGroupGroupDetailId, UIGroupGroupDetailType, UIGroupGroupDetailFilterCsv, UIGroupGroupDetailFilterParentCsv, TextId, Text, Detail, Group1, Group2,  IsEnabled, OrderBy, ImageFileName, AttributesJson)
      
      			 SELECT 
      			  OperationID =  @operationId
      				,ProjectId = @projectId
      				,UIGroupGroupDetailId = 'HazardHistory_' + CAST(ROW_NUMBER() OVER (ORDER BY date, shift, projectid, [Location], [Other Info], [Answer] ) AS VARCHAR(20))
      					, UIGroupGroupDetailType = 'HazardHistory_1'
      					, UIGroupGroupDetailFilterCsv = ''
      					, UIGroupGroupDetailFilterParentCsv = ''
      					, TextId = CAST(ROW_NUMBER() OVER (ORDER BY date, shift, projectid, [Location], [Other Info], [Answer] ) AS VARCHAR(20))
      					, [Text] = CAST(DATEPART(d,Date) AS VARCHAR) + '/' + CAST(DATEPART(m,Date) AS VARCHAR) + '/' + CAST(DATEPART(YY,Date) AS VARCHAR)
      								 +' - '+ Shift +' - '+  Operator  + ' - Comments: ' + ISNULL(Comments ,'')
      								 + ' - Other Info: '+ISNULL([Other Info],'')
      								 + '; FeedbackAdvice: ' + ISNULL(FeedbackAdvice,'')
      					, Detail = CAST(ROW_NUMBER() OVER (ORDER BY date, shift, projectid, [Location], [Other Info], [Answer] ) AS VARCHAR(20))
      					, Group1 = ISNULL([Location],'zz_No Location') +' (Last'+ CAST(@DaysOfHistoryForPrestarts AS VARCHAR) + ' days)'
      					, Group2 = Answer
      
      
      
      					, IsEnabled = 1
      					, OrderBy = 1--order by done at top select
      					, ImageFileName = ''
      					,AttributesJson=''    
      
      			FROM [dbo].[View_ShiftSummary_TWIHazards] 
      			WHERE Date  > DATEADD(DD,-1*@DaysOfHistoryForPrestarts,@Today)
      			AND ProjectID = @projectId
      			AND @IsTestProject =0
      END
 

ELSE IF @projectid = 399
  BEGIN 
      insert into @GroupGroup(OperationId, ProjectID, UIGroupGroupDetailId, UIGroupGroupDetailType, UIGroupGroupDetailFilterCsv, UIGroupGroupDetailFilterParentCsv, TextId, Text, Detail, Group1, Group2,  IsEnabled, OrderBy, ImageFileName, AttributesJson)
      
      			 SELECT 
      			  OperationID =  @operationId
      				,ProjectId = @projectId
      				,UIGroupGroupDetailId = 'HazardHistory_' + CAST(ROW_NUMBER() OVER (ORDER BY date, shift, projectid, [Location], [CORRECTIVE ACTIONS], [RECOMMENDATION:] ) AS VARCHAR(20))
      					, UIGroupGroupDetailType = 'HazardHistory_1'
      					, UIGroupGroupDetailFilterCsv = ''
      					, UIGroupGroupDetailFilterParentCsv = ''
      					, TextId = CAST(ROW_NUMBER() OVER (ORDER BY date, shift, projectid, [Location], [CORRECTIVE ACTIONS], [RECOMMENDATION:] ) AS VARCHAR(20))
      					, [Text] = CAST(DATEPART(d,Date) AS VARCHAR) + '/' + CAST(DATEPART(m,Date) AS VARCHAR) + '/' + CAST(DATEPART(YY,Date) AS VARCHAR)
      								 +' - '+ Shift +' - '+  Operator  + ' - Recommendation: ' + ISNULL([RECOMMENDATION:] ,'')
      								 + ' - Action Taken: '+ISNULL([CORRECTIVE ACTIONS],'')
      								 + '; FeedbackAdvice: ' + ISNULL(FeedbackAdvice,'')
      					, Detail = CAST(ROW_NUMBER() OVER (ORDER BY date, shift, projectid, [Location], [CORRECTIVE ACTIONS], [RECOMMENDATION:] ) AS VARCHAR(20))
      					, Group1 = ISNULL([Location],'zz_No Location') +' (Last'+ CAST(@DaysOfHistoryForPrestarts AS VARCHAR) + ' days)'
      					, Group2 = [HAZARD LEVEL] + ': ' + DESCRIPTION  --Answer
      
      
      
      					, IsEnabled = 1
      					, OrderBy = 1--order by done at top select
      					, ImageFileName = ''
      					,AttributesJson=''    
      
      			FROM [dbo].[View_ShiftSummary_TWIHazards_MCR] 
      			WHERE Date  > DATEADD(DD,-1*@DaysOfHistoryForPrestarts,@Today)
      			AND ProjectID = @projectId
      			AND @IsTestProject =0
      END
  END 

--stores
 if  @appDeploymentMode = 'stores' 
BEGIN
insert into @GroupGroup(OperationId, ProjectID, UIGroupGroupDetailId, UIGroupGroupDetailType, UIGroupGroupDetailFilterCsv, UIGroupGroupDetailFilterParentCsv, TextId, Text, Detail, Group1, Group2,  IsEnabled, OrderBy, ImageFileName, AttributesJson)

				SELECT 
				 OperationID =  @operationId
				,ProjectId = @projectId
				, UIGroupGroupDetailId = 'StoresHistory_' + CAST(ROW_NUMBER() OVER (ORDER BY Group1,Group2,Warehouse,CreatedDate,[Text] ) AS VARCHAR(20))
						, UIGroupGroupDetailType = 'StoresHistory_1'
						, UIGroupGroupDetailFilterCsv = ''
						, UIGroupGroupDetailFilterParentCsv = ''
						, TextId = CAST(ROW_NUMBER() OVER (ORDER BY Group1,Group2,Warehouse,CreatedDate,[Text] ) AS VARCHAR(20))
						, [Text]
						, Detail = '' 
						, Group1
						, Group2
						, IsEnabled = 1
						, OrderBy = 1--order by done at top select
						, ImageFileName = ''
						,AttributesJson=''
				FROM
				 View_API_PostingSummary
				 WHERE Warehouse IN (SELECT Warehouse FROM dbo.FN_GetProjectWarehouses(@ProjectID)) 
				 AND (CreatedDate > DATEADD(DD,-1*@DaysOfHistoryForStores,@Today)
						or [StatusId] <>99)  --2021-09-07
				 -- only send to stores
				 AND @IsTestProject =0
 end
 -- Raisebore
 if   @IsRaiseboreActive =1
BEGIN
insert into @GroupGroup(OperationId, ProjectID, UIGroupGroupDetailId, UIGroupGroupDetailType, UIGroupGroupDetailFilterCsv, UIGroupGroupDetailFilterParentCsv, TextId, Text, Detail, Group1, Group2,  IsEnabled, OrderBy, ImageFileName, AttributesJson)

					SELECT 
					 OperationID =  @operationId
				,ProjectId = @projectId
				, UIGroupGroupDetailId 
							, UIGroupGroupDetailType 
							, UIGroupGroupDetailFilterCsv 
							, UIGroupGroupDetailFilterParentCsv
							, TextId 
							, [Text]
							, Detail  
							, Group1
							, Group2
							, IsEnabled 
							, OrderBy 
							, ImageFileName 
							,AttributesJson
					FROM
					 View_ShiftSummary_RaiseboreHistory
					 --WHERE-- @appDeploymentMode = 'Raisebore' 
 end


  -- device serial numbers
 if  @IsTabletSerialsActive =1
BEGIN
insert into @GroupGroup(OperationId, ProjectID, UIGroupGroupDetailId, UIGroupGroupDetailType, UIGroupGroupDetailFilterCsv, UIGroupGroupDetailFilterParentCsv, TextId, Text, Detail, Group1, Group2,  IsEnabled, OrderBy, ImageFileName, AttributesJson)

SELECT 

 OperationID =  @operationId
				,ProjectId = @projectId
				, UIGroupGroupDetailId 
		, UIGroupGroupDetailType 
		, UIGroupGroupDetailFilterCsv 
		, UIGroupGroupDetailFilterParentCsv
		, TextId 
		, [Text]
		, Detail  
		, Group1
		, Group2
		, IsEnabled 
		, OrderBy 
		, ImageFileName 
		,AttributesJson

FROM
View_ShiftSummaryInsights_TabletSerialNumbers
WHERE @operationId = Operationid
end
--addnew
 if  @IsProdDrillHistoryActive =1
BEGIN
insert into @GroupGroup(OperationId, ProjectID, UIGroupGroupDetailId, UIGroupGroupDetailType, UIGroupGroupDetailFilterCsv, UIGroupGroupDetailFilterParentCsv, TextId, Text, Detail, Group1, Group2,  IsEnabled, OrderBy, ImageFileName, AttributesJson)

SELECT 

 OperationID =  @operationId
				,ProjectId = @projectId
				, UIGroupGroupDetailId = UIGroupGroupDetailId+cast(row_number() over (order by date,shift, LocationCode,  EquipmentCode,PvtKey  ) as varchar(20))  --2021-07-28
		, UIGroupGroupDetailType 
		, UIGroupGroupDetailFilterCsv 
		, UIGroupGroupDetailFilterParentCsv
		, TextId =cast(row_number() over (order by date,shift, LocationCode,  EquipmentCode,PvtKey  ) as varchar(20))
		, [Text]
		, Detail  
		, Group1
		, Group2
		, IsEnabled 
		, OrderBy = TextId
		, ImageFileName 
		,AttributesJson

FROM
 [dbo].[View_ShiftSummary_ProdDrillHistory]
WHERE @projectId = ProjectId
AND date >  DATEADD(DAY, - @DaysOfHistoryForProdDrill,@Today)
end


--addnew
 if  @IsPastWorkOrdersActive =1
BEGIN
insert into @GroupGroup(OperationId, ProjectID, UIGroupGroupDetailId, UIGroupGroupDetailType, UIGroupGroupDetailFilterCsv, UIGroupGroupDetailFilterParentCsv, TextId, Text, Detail, Group1, Group2,  IsEnabled, OrderBy, ImageFileName, AttributesJson)

SELECT 

 OperationID =  @operationId
				,ProjectId = @projectId
				, UIGroupGroupDetailId 
		, UIGroupGroupDetailType 
		, UIGroupGroupDetailFilterCsv 
		, UIGroupGroupDetailFilterParentCsv
		, TextId 
		, [Text]
		, Detail  
		, Group1
		, Group2
		, IsEnabled 
		, OrderBy --= TextId
		, ImageFileName 
		,AttributesJson

 FROM dbo.[View_API_WorkOrdersHaveBeenWarehouseIssued] 
 where warehouse = @warehouse and posteddate > dateadd(day,-7,getdate())
end


if  @IsSignRegisterActive = 1
BEGIN
insert into @GroupGroup(OperationId, ProjectID, UIGroupGroupDetailId, UIGroupGroupDetailType, UIGroupGroupDetailFilterCsv, UIGroupGroupDetailFilterParentCsv, TextId, Text, Detail, Group1, Group2,  IsEnabled, OrderBy, ImageFileName, AttributesJson)

					--********************************************
					-- Sign Register Status
					--*******************************************
					SELECT  OperationID =  @operationId
				,ProjectId = @projectId
				,* FROM (
											 SELECT 
													 UIGroupGroupDetailId = 'SignRegister_' + CAST(ROW_NUMBER() OVER (ORDER BY a.date, a.shift, a.projectid, a.[Sign Number],a.LocationID,a.SignChangeIncrement ) AS VARCHAR(20))
													, UIGroupGroupDetailType = 'SignRegister_1'  
													, UIGroupGroupDetailFilterCsv = ''
													, UIGroupGroupDetailFilterParentCsv = ''
													, TextId = CAST(ROW_NUMBER() OVER (ORDER BY a.date, a.shift, a.projectid, a.[Sign Number],a.LocationID,a.SignChangeIncrement ) AS VARCHAR(20))
													, [Text] = CAST(DATEPART(d,Date) AS VARCHAR) + '/' + CAST(DATEPART(m,Date) AS VARCHAR) + '/' + CAST(DATEPART(YY,Date) AS VARCHAR)
																 +' - '+ Shift 

																 +' - Sign Number: '+  signnum.AttributeDescription 
																 + ' - Status: ' + reas.ReasonDescription
																 + ' - Reason: ' + a.Reason
																 + '; Approved by: ' + ISNULL([Authorised by],'') +
																	+ '; Installed by: ' + ISNULL(e.EmployeeName,'')
													, Detail = CAST(ROW_NUMBER() OVER (ORDER BY a.date, a.shift, a.projectid, a.[Sign Number],a.LocationID,a.SignChangeIncrement ) AS VARCHAR(20))
													, Group1 = l.LocationCode

													, Group2 = CASE WHEN SignChangeIncrement = 1 THEN 'Current Signs'
																ELSE 'Old Signs'
																END 



													, IsEnabled = 1
													, OrderBy = 1--order by done at top select
													, ImageFileName = ''
													,AttributesJson=''
													  FROM View_ShiftSummary_SignRegister AS a 
															  LEFT OUTER JOIN dbo.tbl_DBT_Location AS l 
															  ON a.LocationID = l.LocationID
															  LEFT OUTER JOIN dbo.tbl_SYS_ActivityReasonLink AS ar
															  ON a.Task = ar.ActivityreasonLinkID
															  LEFT OUTER JOIN dbo.tbl_SYS_Reason AS reas
															  ON ar.ReasonID = reas.ReasonID
															  LEFT OUTER JOIN dbo.tbl_DBT_Employees AS e
															  ON a.[Installed by] = e.EmployeeID
															  LEFT OUTER JOIN dbo.tbl_SYS_Attribute AS signnum
															  ON a.[Sign Number] = signnum.AttributeID


													WHERE 
													--SignChangeIncrement = 1 -- current signs only
													a.ProjectID = @projectId
                            AND ViewSrc = @SignRegisterSrc
											) AS tbl1 



					/*************
					 -- End Sign Register
					 **************/


end

if  @IsSignRegisterStopesActive = 1
BEGIN
insert into @GroupGroup(OperationId, ProjectID, UIGroupGroupDetailId, UIGroupGroupDetailType, UIGroupGroupDetailFilterCsv, UIGroupGroupDetailFilterParentCsv, TextId, Text, Detail, Group1, Group2,  IsEnabled, OrderBy, ImageFileName, AttributesJson)

					--********************************************
					-- Sign Register Status stopes
					--*******************************************
					SELECT  OperationID =  @operationId
				,ProjectId = @projectId
				,* FROM (
											 SELECT 
													 UIGroupGroupDetailId = 'SignRegisterStopes_' + CAST(ROW_NUMBER() OVER (ORDER BY a.date, a.shift, a.projectid, a.[Sign Number],a.LocationID,a.SignChangeIncrement ) AS VARCHAR(20))
													, UIGroupGroupDetailType = 'SignRegisterStopes_1'  
													, UIGroupGroupDetailFilterCsv = ''
													, UIGroupGroupDetailFilterParentCsv = ''
													, TextId = CAST(ROW_NUMBER() OVER (ORDER BY a.date, a.shift, a.projectid, a.[Sign Number],a.LocationID,a.SignChangeIncrement ) AS VARCHAR(20))
													, [Text] = CAST(DATEPART(d,Date) AS VARCHAR) + '/' + CAST(DATEPART(m,Date) AS VARCHAR) + '/' + CAST(DATEPART(YY,Date) AS VARCHAR)
																 +' - '+ Shift 

																 +' - Sign Number: '+  signnum.AttributeDescription 
																 + ' - Status: ' + reas.ReasonDescription
																 + ' - Reason: ' + a.Reason
																 + '; Approved by: ' + ISNULL([Authorised by],'') +
																	+ '; Installed by: ' + ISNULL(e.EmployeeName,'')
													, Detail = CAST(ROW_NUMBER() OVER (ORDER BY a.date, a.shift, a.projectid, a.[Sign Number],a.LocationID,a.SignChangeIncrement ) AS VARCHAR(20))
													, Group1 = l.LocationCode

													, Group2 = CASE WHEN SignChangeIncrement = 1 THEN 'Current Signs'
																ELSE 'Old Signs'
																END 



													, IsEnabled = 1
													, OrderBy = 1--order by done at top select
													, ImageFileName = ''
													,AttributesJson=''
													  FROM View_ShiftSummary_SignRegister_UniqueLocns_StopeSigns AS a 
															  LEFT OUTER JOIN dbo.tbl_DBT_Location AS l 
															  ON a.LocationID = l.LocationID
															  LEFT OUTER JOIN dbo.tbl_SYS_ActivityReasonLink AS ar
															  ON a.Task = ar.ActivityreasonLinkID
															  LEFT OUTER JOIN dbo.tbl_SYS_Reason AS reas
															  ON ar.ReasonID = reas.ReasonID
															  LEFT OUTER JOIN dbo.tbl_DBT_Employees AS e
															  ON a.[Installed by] = e.EmployeeID
															  LEFT OUTER JOIN dbo.tbl_SYS_Attribute AS signnum
															  ON a.[Sign Number] = signnum.AttributeID


													WHERE 
													--SignChangeIncrement = 1 -- current signs only
													a.ProjectID = @projectId
                            AND ViewSrc = @SignRegisterSrc
											) AS tbl1 



					/*************
					 -- End Sign Register stopes
					 **************/


end


--dbo.View_ShiftSummaryInsights_iPlodFAQs
if  @IsiPlodFaqsActive = 1
BEGIN
insert into @GroupGroup(OperationId, ProjectID, UIGroupGroupDetailId, UIGroupGroupDetailType, UIGroupGroupDetailFilterCsv, UIGroupGroupDetailFilterParentCsv, TextId, Text, Detail, Group1, Group2,  IsEnabled, OrderBy, ImageFileName, AttributesJson)

					--********************************************
					-- iPlodFAQs
					--*******************************************

											 SELECT 
                       OperationID =  @operationId
				                  ,ProjectId = @projectId
													 ,UIGroupGroupDetailId 
													, UIGroupGroupDetailType 
													, UIGroupGroupDetailFilterCsv 
													, UIGroupGroupDetailFilterParentCsv 
													, TextId 
													, [Text] 
													, Detail 
													, Group1 

													, Group2 



													, IsEnabled = 1
													, OrderBy = 1--order by done at top select
													, ImageFileName = ''
													,AttributesJson=''

													FROM  View_ShiftSummaryInsights_iPlodFAQs


													--WHERE 
												--	a.ProjectID = @projectId





					/*************
					 -- iPlodFAQs
					 **************/


end



















-- if  @IsEquipStatusActive =1
--BEGIN
--insert into @GroupGroup(OperationId, ProjectID, UIGroupGroupDetailId, UIGroupGroupDetailType, UIGroupGroupDetailFilterCsv, UIGroupGroupDetailFilterParentCsv, TextId, Text, Detail, Group1, Group2,  IsEnabled, OrderBy, ImageFileName, AttributesJson)

--SELECT 

-- OperationID =  @operationId
--				,ProjectId = @projectId
--				, UIGroupGroupDetailId 
--		, UIGroupGroupDetailType 
--		, UIGroupGroupDetailFilterCsv 
--		, UIGroupGroupDetailFilterParentCsv
--		, TextId 
--		, [Text]
--		, Detail  
--		, Group1
--		, Group2
--		, IsEnabled 
--		, OrderBy 
--		, ImageFileName 
--		,AttributesJson

--FROM
--View_ShiftSummaryInsights_TabletSerialNumbers
--WHERE @operationId = Operationid
--end


/*
 UNION ALL

--AppSessionLogs_

SELECT  TOP 50
 UIGroupGroupDetailId = 'AppSessionLogs_' + CAST([LogSessionInfoId] AS VARCHAR)--CAST(ROW_NUMBER() OVER (ORDER BY Group1,Group2,Warehouse,CreatedDate,[Text] ) AS VARCHAR(20))
		, UIGroupGroupDetailType = 'AppSessionLogs_1'
		, UIGroupGroupDetailFilterCsv = ''
		, UIGroupGroupDetailFilterParentCsv = ''
		, TextId = CAST([LogSessionInfoId] AS VARCHAR) --CAST(ROW_NUMBER() OVER (ORDER BY [LogSessionInfoId],Date,[Text] ) AS VARCHAR(20))
		, [Text] = 'lengthOfDataOut:' + dbo.FN_FormatDecimalAsVarchar([lengthOfDataOut],0)
						+'; TimeInDB:' +  ISNULL(TimeInDB,'not logged')  -- dbo.FN_FormatDecimalAsVarchar(TimeInDB,0)
						+'; TimeInsertToSQLLite:' +  ISNULL(TimeInsertToSQLLite,'Not logged')
						+'; brokenrulecount:' + dbo.FN_FormatDecimalAsVarchar(brokenrulecount,0)
						+'; ObjQuery>'+ dbo.FN_FormatDecimalAsVarchar(@QuerySecs,0) +'secs: ' --dbo.FN_FormatDecimalAsVarchar(brokenrulecount,0)
												+ CASE WHEN ISNULL(DeviceConfigsMs,@QuerySecs*1001) > @QuerySecs*1000 THEN 'DeviceConfigsMs:' + dbo.FN_FormatDecimalAsVarchar(DeviceConfigsMs,0)+'; ' ELSE '' END
												+ CASE WHEN ISNULL(EmployeesMs,@QuerySecs*1001) > @QuerySecs*1000 THEN 'EmployeesMs:' + dbo.FN_FormatDecimalAsVarchar(EmployeesMs,0)+'; ' ELSE '' END 
												+ CASE WHEN ISNULL(WorkTypesMs,@QuerySecs*1001) > @QuerySecs*1000 THEN 'WorkTypesMs:' + dbo.FN_FormatDecimalAsVarchar(WorkTypesMs,0)+'; ' ELSE '' END 
												+ CASE WHEN ISNULL(EquipmentsMs,@QuerySecs*1001) > @QuerySecs*1000 THEN 'EquipmentsMs:' + dbo.FN_FormatDecimalAsVarchar(EquipmentsMs,0)+'; ' ELSE '' END 
												+ CASE WHEN ISNULL(EquipmentActivitiesMs,@QuerySecs*1001) > @QuerySecs*1000 THEN 'EquipmentActivitiesMs:' + dbo.FN_FormatDecimalAsVarchar(EquipmentActivitiesMs,0)+'; ' ELSE '' END 
												+ CASE WHEN ISNULL(EquipmentMetersMs,@QuerySecs*1001) > @QuerySecs*1000 THEN 'EquipmentMetersMs:' + dbo.FN_FormatDecimalAsVarchar(EquipmentMetersMs,0)+'; ' ELSE '' END
												+ CASE WHEN ISNULL(InputsMs,@QuerySecs*1001) > @QuerySecs*1000 THEN 'InputsMs:' + dbo.FN_FormatDecimalAsVarchar(InputsMs,0)+'; ' ELSE '' END
												+ CASE WHEN ISNULL(InventoriesOnHandMs,@QuerySecs*1001) > @QuerySecs*1000 THEN  'InventoriesOnHandMs:' + dbo.FN_FormatDecimalAsVarchar(InventoriesOnHandMs,0)+'; ' ELSE '' END
												+ CASE WHEN ISNULL(StoresHeadersMs,@QuerySecs*1001) > @QuerySecs*1000 THEN 'StoresHeadersMs:' + dbo.FN_FormatDecimalAsVarchar(StoresHeadersMs,0)+'; ' ELSE '' END
												+ CASE WHEN ISNULL(DocumentsMs,@QuerySecs*1001)> @QuerySecs*1000 THEN  'DocumentsMs:' + dbo.FN_FormatDecimalAsVarchar(DocumentsMs,0)+'; ' ELSE '' END
													+ CASE WHEN ISNULL(UserMessagesMs,@QuerySecs*1001) > @QuerySecs*1000 THEN 'UserMessagesMs:' + dbo.FN_FormatDecimalAsVarchar(UserMessagesMs,0)+'; ' ELSE '' END
													+ CASE WHEN ISNULL(GenericLookupsMs,@QuerySecs*1001) > @QuerySecs*1000 THEN 'GenericLookupsMs:' + dbo.FN_FormatDecimalAsVarchar(GenericLookupsMs,0)+'; ' ELSE '' END
													+ CASE WHEN ISNULL(VendorDeliveryNotesMs,@QuerySecs*1001) > @QuerySecs*1000 THEN 'VendorDeliveryNotesMs:' + dbo.FN_FormatDecimalAsVarchar(VendorDeliveryNotesMs,0)+'; ' ELSE '' END
						+'; FailedCalls:'
												+ CASE WHEN ISNULL(DeviceConfigsMs,-1) =-1 THEN 'DeviceConfigsMs:' + '= FAILED!; ' ELSE '' END
												+ CASE WHEN ISNULL(EmployeesMs,-1) = -1 THEN 'EmployeesMs:' +  '= FAILED!; ' ELSE '' END 
												+ CASE WHEN ISNULL(WorkTypesMs,-1) = -1 THEN 'WorkTypesMs:' + '= FAILED!; ' ELSE '' END 
												+ CASE WHEN ISNULL(EquipmentsMs,-1) = -1 THEN 'EquipmentsMs:' + '= FAILED!; ' ELSE '' END 
												+ CASE WHEN ISNULL(EquipmentActivitiesMs,-1) = -1 THEN 'EquipmentActivitiesMs:' + '= FAILED!; ' ELSE '' END 
												+ CASE WHEN ISNULL(EquipmentMetersMs,-1) = -1 THEN 'EquipmentMetersMs:' + '= FAILED!; ' ELSE '' END
												+ CASE WHEN ISNULL(InputsMs,-1) = -1 THEN 'InputsMs:' + '= FAILED!; ' ELSE '' END
												+ CASE WHEN ISNULL(InventoriesOnHandMs,-1) = -1 THEN  'InventoriesOnHandMs:' + '= FAILED!; ' ELSE '' END
												+ CASE WHEN ISNULL(StoresHeadersMs,-1) = -1 THEN 'StoresHeadersMs:' + '= FAILED!; ' ELSE '' END
												+ CASE WHEN ISNULL(DocumentsMs,-1) = -1 THEN  'DocumentsMs:' + '= FAILED!; ' ELSE '' END
													+ CASE WHEN ISNULL(UserMessagesMs,-1) = -1 THEN 'UserMessagesMs:' + '= FAILED!; ' ELSE '' END
													+ CASE WHEN ISNULL(GenericLookupsMs,-1) = -1 THEN 'GenericLookupsMs:' + '= FAILED!; ' ELSE '' END
													+ CASE WHEN ISNULL(VendorDeliveryNotesMs,-1) = -1 THEN 'VendorDeliveryNotesMs:' + '= FAILED!; ' ELSE '' END					
					+ CASE WHEN ISNULL(brokenrulecount,0) >0 THEN '; BrokenRules:'+ BrokenRuleData ELSE '' END
						--+'; MaxObj.QueryTime:' + dbo.FN_FormatDecimalAsVarchar(MAX(DeviceConfigsMs,)/1000,0)
		, Detail = '' 
		, Group1 = 'DateOfCall:'+ CAST(DateCreated AS VARCHAR)+ '; DeviceName. ='+ deviceName + '; SerialNo. ='+ DeviceSerialNo 
		, Group2 = 'TimeOfCall:' + CAST(FORMAT(DateTimeCreated,'hh:mm tt') AS VARCHAR) + '; CallType:' + CallType
		, IsEnabled = 1
		, OrderBy = 1--order by done at top select
		, ImageFileName = ''
		,AttributesJson=''
FROM
[View_API_v3LogInfo]
 ORDER BY datetimecreated DESC
 */
 /*
       ,[DeviceConfigsCnt]
      ,[DeviceConfigsMs]
      ,[EmployeesCnt]
      ,[EmployeesMs]
      ,[WorkTypesCnt]
      ,[WorkTypesMs]
      ,[EquipmentsCnt]
      ,[EquipmentsMs]
      ,[EquipmentActivitiesCnt]
      ,[EquipmentActivitiesMs]
      ,[EquipmentMetersCnt]
      ,[EquipmentMetersMs]
      ,[InputsCnt]
      ,[InputsMs]
      ,[InventoriesOnHandCnt]
      ,[InventoriesOnHandMs]
      ,[StoresHeadersCnt]
      ,[StoresHeadersMs]
      ,[DocumentsCnt]
      ,[DocumentsMs]
      ,[GenericLookupsCnt]
      ,[GenericLookupsMs]
      ,[UserMessagesCnt]
      ,[UserMessagesMs]
      ,[VendorDeliveryNotesCnt]
      ,[VendorDeliveryNotesMs]
 [LogSessionInfoId]
      ,[CallType]
      ,[REquestTimeDeviceToAPI]
      ,[TimeInApi_IN]
      ,[TimeInDB]
      ,[TimeinAPI_OUT]
      ,[TimeTravelBacktoDevice]
      ,[TimeInsertToSQLLite]
      ,[Datecreated]
      ,[brokenrulecount]
      ,[lengthOfDataOut]
      ,[DeviceSerialNo]
      ,[LeftData]
      ,[2500_DataOut]
      ,[Data]

	  */
	/*	SELECT 
      'Prestart History' AS 'TitleField'
      ,LEFT(EquipID,6) + ' - Faults last 7 days' AS 'GroupingField1'


	  ,[Prestart Question] AS 'GroupingField2'
	  ,''   AS 'LineDesc'
	  ,Comments AS 'Param1'                    -- Operator comments          
      ,FeedbackAdvice AS 'Param2'    -- These are the maint Comments


	  --,CAST(Date as Varchar) 
	  -- C.A. 26/07/18 Pulled the date apart and put it the right way around here
	  ,CAST(DATEPART(d,Date) AS VARCHAR) + '/' + CAST(DATEPART(m,Date) AS VARCHAR) + '/' + CAST(DATEPART(YY,Date) AS VARCHAR)
	   +' - '+ Shift +' - '+  Operator + ' - Comments: 'AS 'Param1Desc'


	  ,'Maint Comments: ' AS 'Param2Desc'
	  , ProjectID

FROM [dbo].[View_ShiftSummary_PrestartHistory] 
WHERE Date  > DATEADD(DD,-7,GETDATE())  AND [Include] = 1 AND InputType NOT LIKE 'Stat%' 
AND NOT(Comments ='' OR Answer = '')
*/

--******************************************





if @IsTestProject = 1 
BEGIN
insert into @GroupGroup(OperationId, ProjectID, UIGroupGroupDetailId, UIGroupGroupDetailType, UIGroupGroupDetailFilterCsv, UIGroupGroupDetailFilterParentCsv, TextId, Text, Detail, Group1, Group2,  IsEnabled, OrderBy, ImageFileName, AttributesJson)


						SELECT 
							OperationID
							, ProjectID
							, UIGroupGroupDetailId
							, UIGroupGroupDetailType
							, UIGroupGroupDetailFilterCsv
							, UIGroupGroupDetailFilterParentCsv
							, TextId
							, [Text]
							, Detail
							, Group1
							, Group2
							--, IsDeleted
							, IsEnabled
							, OrderBy
							, ImageFileName
							,AttributesJson

						FROM dbo.zTestUIGroupGroupDetail AS Look WITH (NOLOCK)
						WHERE ProjectId = @ProjectId AND @isPurge = 1 AND @IsTestProject =1
						AND @appDeploymentMode =Deploymentmode
						AND (Look.UIGroupGroupDetailType LIKE '%history%' OR Look.UIGroupGroupDetailType LIKE 'refno%')
						ORDER BY group1
	end


	SELECT OperationId
         , ProjectID = @OrigProj
         , UIGroupGroupDetailId
         , UIGroupGroupDetailType
         , UIGroupGroupDetailFilterCsv
         , UIGroupGroupDetailFilterParentCsv
         , TextId
         , Text= [Text] + CASE WHEN @showDebugIds = 1 THEN ', AttrJson:'+ISNULL(AttributesJson,'') ELSE '' END
         , Detail
         , Group1
         , Group2
         , IsDeleted =0
         , IsEnabled
         , OrderBy= case when UIGroupGroupDetailType like '%history%' then --if history type views, then order by textId (which has date and shift incorporated) so dates go in correct order
										 row_number() OVER (PARTITION BY UIGroupGroupDetailType ORDER BY  ISNULL(tbl.Group1,''),ISNULL(tbl.Group2,''),[dbo].[FN_StringPad]([TextID],5,'0' ) )  --pad the textid or back to where we started!
						else row_number() OVER (PARTITION BY UIGroupGroupDetailType ORDER BY  ISNULL(tbl.Group1,''),ISNULL(tbl.Group2,''),[Text] )
						end
         , ImageFileName
         , AttributesJson

		 from  @groupgroup
		 as tbl



		 if @DebugMode = 1
		 begin
		 --put whatever you want to test in here:
					SELECT * FROM (
					select OperationId
					 , ProjectID
					 , UIGroupGroupDetailId
					 , UIGroupGroupDetailType
					 , UIGroupGroupDetailFilterCsv
					 , UIGroupGroupDetailFilterParentCsv
					 , TextId
					 , Text= [Text] + CASE WHEN @showDebugIds = 1 THEN ', AttrJson:'+ISNULL(AttributesJson,'') ELSE '' END
					 , Detail
					 , Group1
					 , Group2
					 , IsDeleted =0
					 , IsEnabled
					 , OrderBy= case when UIGroupGroupDetailType like '%history%' then --if history type views, then order by textId (which has date and shift incorporated) so dates go in correct order
													 row_number() OVER (PARTITION BY UIGroupGroupDetailType ORDER BY  ISNULL(tbl.Group1,''),ISNULL(tbl.Group2,''),[dbo].[FN_StringPad]([TextID],5,'0' ))
									else row_number() OVER (PARTITION BY UIGroupGroupDetailType ORDER BY  ISNULL(tbl.Group1,''),ISNULL(tbl.Group2,''),[Text] )
									end
					 , ImageFileName
					 , AttributesJson
					 ,orderbytextid =  row_number() OVER (PARTITION BY UIGroupGroupDetailType ORDER BY  ISNULL(tbl.Group1,''),ISNULL(tbl.Group2,''),[TextID] )
					 ,orderbytext = row_number() OVER (PARTITION BY UIGroupGroupDetailType ORDER BY  ISNULL(tbl.Group1,''),ISNULL(tbl.Group2,''),[Text] )
					 from  @groupgroup as tbl
				where [UIGroupGroupDetailType] like '%history%'
				) as tbl2
				order by UIGroupGroupDetailType,OrderBy
		 end

	END
-- Get the latest system error.
SELECT @Error = @@ERROR WHERE @Error = 0
IF (@Error <> 0)
BEGIN
	RETURN @Error
END

-- Finish now.
RETURN 0














GO
PRINT N'Altering [dbo].[SP_API_IPLODSetup_Documents_SqliteZip]'
GO

ALTER PROCEDURE [dbo].[SP_API_IPLODSetup_Documents_SqliteZip]
	@callingUserId AS INT 
    , @WarehouseId AS NVARCHAR(50) = NULL
    , @ProjectId AS INT
    , @EmployeeId AS INT
    , @AppDeploymentMode AS NVARCHAR(50) 
    , @DeviceName AS NVARCHAR(50) 
    , @DeviceSerialNo AS NVARCHAR(50)
    , @DeviceOS AS NVARCHAR(50)
    , @AppId AS NVARCHAR(50)
    , @AppVersion AS NVARCHAR(50)
	-- File details.
	, @zipPathFileName AS NVARCHAR(128)
	, @zipFileName AS NVARCHAR(128)
	, @zipFileNameOnly AS NVARCHAR(128)
	, @documentId AS INT OUTPUT
AS
/**********************************************************************
Purpose :	Insert for tbl_DBT_iplodDocuments tbl.
Notes   :	Special insert into the documents table for a Sqlite zip upload.


GRANT EXECUTE ON [dbo].[SP_API_IPLODSetup_Documents_SqliteZip] TO [Public]

History  :	IRJ	14-Jan-2022	Initial Creation.
          ts 2022-07-27 ... increase size of fie names
**********************************************************************/
SET NOCOUNT ON
DECLARE @error AS INT = 0
--DECLARE @tranCount AS INT = @@TRANCOUNT
--PRINT '' + OBJECT_NAME(@@PROCID) + ', TxCnt: ' + CONVERT(NVARCHAR, @tranCount)

--IF (@tranCount = 0) 
--BEGIN
--	--PRINT '' + OBJECT_NAME(@@PROCID) + ': Setting up transaction.'
--	SET XACT_ABORT ON	
--	SET IMPLICIT_TRANSACTIONS OFF
--	BEGIN TRAN
--END


	-- Init.
	SET @WarehouseId = ISNULL(@WarehouseId, '')
	SET @DeviceSerialNo = ISNULL(@DeviceSerialNo, '')
	SET @AppDeploymentMode = ISNULL(@AppDeploymentMode, '?')
    SET @WarehouseId = ISNULL(@WarehouseId, '')
    SET @ProjectId = ISNULL(@ProjectId, 0)
    SET @EmployeeId = ISNULL(@EmployeeId, 0)
    SET @AppDeploymentMode = ISNULL(@AppDeploymentMode, '')
	SET @DeviceName = ISNULL(@DeviceName, '')
	SET @DeviceSerialNo = ISNULL(@DeviceSerialNo, '')
	SET @DeviceOS = ISNULL(@DeviceOS, '')
	SET @AppId = ISNULL(@AppId, '')
	SET @AppVersion = ISNULL(@AppVersion, '')
	SET @zipFileName = ISNULL(@zipFileName, '')
	SET @zipFileNameOnly = ISNULL(@zipFileNameOnly, '')
	SET @documentId = 0


	-- Allowed Types?
	DECLARE @AllowedTypeIdsCsv AS NVARCHAR(50) = ',1,2,3,4,5,'


	-- Force Overrides.
	SET @ProjectId = 3


	-- Insert only.
	INSERT INTO dbo.tbl_DBT_iplodDocuments
		(ProjectID, DocumentName, DocumentGroup, DocumentFile, AllowedTypeIdsCsv, HelpGuideForTypeIdsCsv, IsEnabled, CreatedDate, CreatedBy)
	VALUES (@ProjectID, @zipFileNameOnly, 'SqliteZip', @zipFileName, @AllowedTypeIdsCsv, '', 1, GETDATE(), CONVERT(NVARCHAR(50), @callingUserId))
	
	
	-- Get the latest identity.	
	SET @documentId = SCOPE_IDENTITY()


	-- Get the latest system error.
	SELECT @error = @@ERROR WHERE @error = 0
	IF (@error <> 0)
	BEGIN
		--IF (@tranCount = 0) ROLLBACK TRAN
		RETURN @error
	END


-- Finish now.
--IF (@tranCount = 0) COMMIT TRAN
RETURN 0


GO
PRINT N'Altering [dbo].[SP_API_IPLODSetup_UserMessages]'
GO

ALTER PROCEDURE [dbo].[SP_API_IPLODSetup_UserMessages]
	@operationId AS INT,
	@projectId AS INT,
	@appId AS NVARCHAR(100) = NULL,
	@appVersion AS NVARCHAR(50) = NULL,
	@appDeploymentMode AS NVARCHAR(50) = NULL,
	@appCfgRefreshPoint AS INT = NULL,
	@fromDate AS DATETIME = NULL,
	@userMessageId AS NVARCHAR(200) = '0',
	@deviceSerialNo AS NVARCHAR(50) = NULL,
    @employeeId AS INT = NULL,
	@isPurge AS INT OUTPUT 
AS
/**********************************************************************
Purpose :	Lookup Config - UserMessages.
Notes   :	
* iplod messages are inserted to [dbo].[tbl_DBT_iplodUserMessages] and [dbo].[tbl_DBT_iplodUserMessageUsers] on central (or this on locals: [dbo].[tbl_DBT_iplodUserMessages_LocalOnly] 
* no employees in these tables tbl_DBT_iplodUserMessageUsers means this message goes to everyone.
* acknowledgement is processed by the v3 API through this proc: [dbo].[procDWH_iplodUserMessages_Upd] which logs the acknolwedgement and also Sets IsEnabled =0 in this table: tbl_DBT_iplodUserMessageUsers
* the log table [dbo].[tbl_DWH_iplodUserMessageUserLogs] will get synced up to central, by being fed into this proc procDWH_iplodUserMessages_Upd which will update IsEnabled in the here on cetral too tbl_DBT_iplodUserMessageUsers 

** the local messaging to iplods is thorugh: tbl_DBT_iplodUserMessages_LocalOnly NOT QUITE SURE HOW THIS WILL GO, NEEDS TO BE TESTED WELL. NOT SURE HOW IT IS SYNCED BACK UP TO CENTRAL?
likely it 


DECLARE @isPurge AS INT
EXEC dbo.SP_API_IPLODSetup_UserMessages @operationId = 0, @projectId = 53, @isPurge = @isPurge OUTPUT
SELECT @isPurge AS isPurge

DECLARE @isPurge AS INT
EXEC dbo.SP_API_IPLODSetup_UserMessages @operationId = 0, @projectId = 236, @isPurge = @isPurge OUTPUT,@appCfgRefreshPoint = 3, @appDeploymentMode = 'induction'
SELECT @isPurge AS isPurge

DECLARE @isPurge AS INT
EXEC dbo.SP_API_IPLODSetup_UserMessages @operationId = 0, @projectId = 53, @userMessageId = '247', @isPurge = @isPurge OUTPUT
SELECT @isPurge AS isPurge

DECLARE @isPurge AS INT
EXEC dbo.SP_API_IPLODSetup_UserMessages @operationId = 0, @projectId = 3, @isPurge = @isPurge OUTPUT, @appDeploymentMode = 'mining_fitters', @appVersion = 'v2022.07.13 (269)'
SELECT @isPurge AS isPurge


GRANT SELECT ON [dbo].[tbl_DBT_iplodUserMessages] TO [Public]
GRANT SELECT ON [dbo].[tbl_DBT_iplodUserMessageUsers] TO [Public]
GRANT SELECT ON [dbo].[tbl_DWH_iplodUserMessageUserLogs] TO [Public]
GRANT EXECUTE ON [dbo].[SP_API_IPLODSetup_UserMessages] TO [Public]

History  :	IRJ	07-Oct-2018	Initial Creation.
			IRJ	24-Jan-2019	Added @appId, @appVersion, and @appDeploymentMode parameters.
			IRJ	27-Feb-2019	Modified @appDeploymentMode NVARCHAR(50) > INT input param.
							Added @appCfgRefreshPoint input param.
							Added @isPurge OUTPUT param.
							Added IsDeleted output field
			TS 2019-07-31 ... added purge stuff
			TS 2019-08-05 ... set IsPUrge =1 whenever getting data
			TS 2019-08-07 ... added UTC conversion
			IRJ	28-Jan-2020	Modified @userMessageId to NVARCHAR(200).
			ts 2020-04-15 ... added stuff for "Induction"
			ts 2020-08-19 ... send down to local wth local / central flag so we know which table they came out of (so we can add messages onto central as well as direct to local
			ts 2020-08-20 ... added deployment mode filter.
							... added signture
							... handling for ExpiryDate
							... expiry wrong way roudn. add extra lines before for the username
							... add @MinIplodVersion
			ts 2021-05-04  ... get _AllModes too
			ts 2021-08-03 ...   message for retiring the Pybar bundle
							... set @projectId= abs(@projectId)
              2022-03-25 ts ...   DECLARE @OrigProj INT = @projectId
              ts 2022-04-07 ... added fake mode
              ts 2022-07-05 ... hack in some dynamic messagin for MCO
              ts 2022-07-07 ... don't do the purge check


**********************************************************************/
SET NOCOUNT ON
DECLARE @Error AS INT = 0
  DECLARE @OrigProj INT = @projectId
set @projectId= abs(@projectId)


DECLARE @IsTempDeploymentModeToken INT = (SELECT case WHEN  FakeDeploymentMode <> TrueDeploymentMode OR killthisapp = 1  --add kill this app, in case we map fakemode = truemode
                                                  then 1 else 0 end  FROM dbo.tvf_DeploymentModeMapping (@appDeploymentMode, @ProjectId) )
DECLARE @TempTokenIsOutOfDate INT = case WHEN @IsTempDeploymentModeToken = 0 THEN 0
                                          WHEN    @IsTempDeploymentModeToken =1 THEN (SELECT  KillThisApp FROM dbo.tvf_DeploymentModeMapping (@appDeploymentMode, @ProjectId) )
                                          ELSE 0 
                                          END   
DECLARE @TrueDeploymentMode NVARCHAR(50) = (select TOP 1 TrueDeploymentMode FROM  dbo.tvf_DeploymentModeMapping (@appDeploymentMode, @ProjectId))
  SET @appDeploymentMode = case WHEN @IsTempDeploymentModeToken = 1 THEN @TrueDeploymentMode ELSE ISNULL(@appDeploymentMode, 'Mining') END  --2022-04-07

	-- init.
	SET @userMessageId = ISNULL(@userMessageId, 0)
	SET @appId = ISNULL(@appId, 'au.com.pybar.iplod')
	SET @appVersion = ISNULL(@appVersion, '2019.01.01')
    DECLARE @appVersionInt AS INT = CASE WHEN LEN(@appVersion) >= 11
                                            -- Strip and get initial version info!
                                            THEN CONVERT(INT, SUBSTRING(REPLACE(REPLACE(@appVersion, '.', ''), 'v', ''), 1, 8))
                                        ELSE 0
                                        END


--	SET @appDeploymentMode = ISNULL(@appDeploymentMode, 'Mining')
	SET @appCfgRefreshPoint = ISNULL(@appCfgRefreshPoint, 1)	-- Login Config Button.
	SET @isPurge  =  dbo.udfIsPurge('SP_API_IPLODSetup_UserMessages',@appDeploymentMode,@appCfgRefreshPoint);	-- 0 = false, else true.
	DECLARE @AppName nvarchar(50) = dbo.FN_NameOfApp(@projectId,1);

	DECLARE @NewestSourceData datetime 
	SET @NewestSourceData = GETDATE();  --if ispurge=1 get everything anyway

		--this is the offset from UTC to compare modified on (local time) to @FromDate on device (UTC)
	DECLARE @UtcOffset numeric =  CONVERT(numeric,dbo.udfUTCVsWebBAROffset()) * -1;

	--reset the fromdate to "local"
	SET @fromDate = DATEADD(HOUR,@UtcOffset,@FromDate);


		-- Get OperationId from ProjectId.
		SELECT @operationId = OperationID   
		FROM dbo.tbl_DBT_Project 
		WHERE ProjectID = @projectID
		SET @operationId = ISNULL(@operationId, 0)

		IF @isPurge = 0 --if not purging, then get most recent data first to decide whether or not to proceed or not
						BEGIN 
							SET @NewestSourceData =  (SELECT MAX(LastModifiedOn)  FROM dbo.tbl_DBT_iplodUserMessages WHERE ProjectID = 0
											OR ProjectID = @ProjectID);
						END 
--2021-08-03 can likely remove this bit >>>>>>>>>>>>>>>>>>>>>>
 

DECLARE @IsLiveDB nvarchar(25) = dbo.FN_IsLiveDB(@projectId);
DECLARE @IntIncrease nvarchar(25) = CAST(ISNULL((SELECT TOP 1 IntIncrease  FROM dbo.tbl_DBT_Project WHERE @projectId = ProjectID),3) AS nvarchar(25));
declare @BlockThisVersion int = cast(ISNULL(dbo.FN_GetConfigValue(@ProjectID, 'BlockThisVersion'), 0) AS int);
declare @MsgBlockWarningToThisVersion int = cast(ISNULL(dbo.FN_GetConfigValue(@ProjectID, 'MsgBlockWarningToThisVersion'), 0) AS int);
declare @IsBlockThisVersion int = iif(@appVersionInt = @BlockThisVersion,1,0);
declare @IsWarnThisVersion int = iif(@appVersionInt = @MsgBlockWarningToThisVersion,1,0);
--shouldn't need it again! >>>>>>>>>>>>>>>>>>>>>>>>>>>>>

DECLARE @GetHistoricalTemperaturesIntoInputs INT = iif(@projectId in (401,3) ,1,0)


IF (@NewestSourceData > @FromDate OR @isPurge = 1 or @IsBlockThisVersion + @IsWarnThisVersion >0
        or 1=1 )  --always proceed. need to optimise once we have the new messaging engine up and running.
	BEGIN
SET @isPurge = 1 ; --sync config table has decided IsPurge = 0, however data has indicated that some data is newer than app.  no incremental loads on this table though, so need to set Purge to 1 in this scenario



	SELECT
		OperationID
		, ProjectId = @OrigProj
		, UserMessageId
		, IsAckRequired 
		, UserMessageHtml = data.UserMessageHtml + '<br> 
													<br> 
													<br> 
													<br> 
													<br> 
													<br> 
													<br> 
													<br> ' + ISNULL(data.UserName,'')
		, ImageFileName = CASE WHEN IsAckRequired <> 0 THEN 'usermessageack.png'
							ELSE 'usermessage.png'
							END
		, IsDeleted = 0
		, IsEnabled = CASE 
						-- all specific users read? 
						WHEN data.SpecificEmployeeCount > 0 
								AND dbo.udfStringIsNullOrEmpty(data.ForEmployeeIdsCsv, NULL) <> 0 
							THEN 0
						ELSE IsEnabled
						END
		, OrderBy
		, ForEmployeeIdsCsv = CASE 
								-- If 
								WHEN data.SpecificEmployeeCount > 0 
									THEN data.ForEmployeeIdsCsv
								ELSE 
									ISNULL((SELECT DISTINCT 
												',' + CONVERT(NVARCHAR(50), E.EmployeeId) 
											FROM dbo.tbl_DBT_Employees AS E
												LEFT OUTER JOIN dbo.tbl_DWH_iplodUserMessageUserLogs AS UMUL ON E.EmployeeID = UMUL.EmployeeId AND UMUL.UserMessageId = data.UserMessageId
											WHERE (OperationID = @operationId 
													OR SisterOpID_a = @operationId 
													OR SisterOpID_b = @operationId) --add sister sites
                          AND E.Status  =1

												-- Not read!
												AND UMUL.EmployeeId IS NULL
											FOR XML PATH('')) + ','
										, '')
								END
		, SpecificEmployeeCount
	FROM (

                              		-- Dummy.
                              		SELECT
                              			OperationID = @operationId
                              			, ProjectId = @projectId
                              			, UserMessageId = CAST(UserMessageId AS nvarchar(25))
                              			, IsAckRequired 
                              			, UserMessageHtml 
                              			, IsEnabled
                              			, OrderBy = 1
                              			, ForEmployeeIdsCsv = ISNULL((SELECT DISTINCT 
                              												',' + CONVERT(NVARCHAR(50), UMU.EmployeeId) 
                              											FROM dbo.tbl_DBT_iplodUserMessageUsers AS UMU 												
                              											WHERE UMU.UserMessageId = UM.UserMessageId
                              												AND UMU.IsEnabled <> 0
                              											FOR XML PATH('')) + ','
                              										, '')
                              
                              			, LastModifiedOn 
                              			-- Flags.
                              			, SpecificEmployeeCount = ISNULL((SELECT COUNT(UMU.EmployeeId) 
                              											FROM dbo.tbl_DBT_iplodUserMessageUsers AS UMU 												
                              											WHERE UMU.UserMessageId = UM.UserMessageId)
                              										, 0)
                              			, UserName = IIF(dbo.FN_IsWebbarFullAdmin(UM.AddedByUser) =1,' - The '+@AppName + ' Team.',u.Username)
                              		FROM dbo.tbl_DBT_iplodUserMessages AS UM WITH (NOLOCK) 
                              				LEFT JOIN dbo.tbl_SYS_User AS u WITH (NOLOCK) 
                              						ON um.AddedByUser = u.UserID
                              		WHERE 
                              			UM.IsEnabled <> 0
                              			AND (UM.ProjectId = @projectId 
                              					OR UM.ProjectId = 0)
                              			AND UM.UserMessageId = CASE WHEN @userMessageId <> '0' THEN @userMessageId
                              										ELSE UM.UserMessageId
                              										END
                              			AND (@appDeploymentMode = ISNULL(UM.AppDeploymentMode,'mining_fitters') OR UM.AppDeploymentMode = '' or um.AppDeploymentMode ='_AllModes')
                              			AND UM.ExpiryDate > GETDATE()
                              			AND @appVersionInt >= ISNULL( um.MinIplodVersion ,0)
                              UNION ALL		
                              		SELECT
                              			OperationID = @operationId
                              			, ProjectId = @projectId
                              			, UserMessageId = CAST(UserMessageId AS nvarchar(25)) +'_localOnly'  
                              			, IsAckRequired 
                              			, UserMessageHtml 
                              			, IsEnabled
                              			, OrderBy = 1
                              			, ForEmployeeIdsCsv = ISNULL((SELECT DISTINCT 
                              												',' + CONVERT(NVARCHAR(50), UMU.EmployeeId) 
                              											FROM dbo.tbl_DBT_iplodUserMessageUsers_LocalOnly AS UMU 												
                              											WHERE UMU.UserMessageId = UM.UserMessageId
                              												AND UMU.IsEnabled <> 0
                              											FOR XML PATH('')) + ','
                              										, '')
                              
                              			, LastModifiedOn 
                              			-- Flags.
                              			, SpecificEmployeeCount = ISNULL((SELECT COUNT(UMU.EmployeeId) 
                              											FROM dbo.tbl_DBT_iplodUserMessageUsers_LocalOnly AS UMU 												
                              											WHERE UMU.UserMessageId = UM.UserMessageId)
                              										, 0)
                              			, UserName = IIF(dbo.FN_IsWebbarFullAdmin(UM.AddedByUser) =1,' - The '+@AppName + ' Team.',u.Username)
                              		FROM dbo.tbl_DBT_iplodUserMessages_LocalOnly AS UM WITH (NOLOCK)
                              				LEFT JOIN dbo.tbl_SYS_User AS u WITH (NOLOCK) 
                              						ON um.AddedByUser = u.UserID
                              
                              		WHERE 
                              			UM.IsEnabled <> 0
                              			AND (UM.ProjectId = @projectId 
                              					OR UM.ProjectId = 0)
                              			AND UM.UserMessageId = CASE WHEN @userMessageId <> '0' THEN @userMessageId
                              										ELSE UM.UserMessageId
                              										END
                              			AND (@appDeploymentMode = ISNULL(UM.AppDeploymentMode,'mining_fitters') OR UM.AppDeploymentMode = ''or um.AppDeploymentMode ='_AllModes')
                              			AND UM.ExpiryDate > GETDATE()
                              			AND @appVersionInt >=  ISNULL(um.MinIplodVersion ,0)
                              
                            UNION ALL 
                          --for showing message to MCO temperature readings on login.
	                              SELECT distinct
                              			OperationID = @operationId
                              			, ProjectId = @projectId
                              			, UserMessageId = '-1'
                              			, IsAckRequired = 1
                              			, UserMessageHtml  = [dbo].[FN_MarkupFullHtml_v2]('DETAILS OF TEMPERATURE READINGS FROM PREVIOUS SESSION:',1,0,'Black','') +' <br> 
                              													<br> 
                              													<br> 
                              													<br> '
                              													+[dbo].[FN_MarkupFullHtml_v2]('Previous reading: '+ReadingLabelForPlodPageBreak,1,0,'Black','')+ 
                              													'<br> 
                              													
                              													<br> '
                              													+[dbo].[FN_MarkupFullHtml_v2]('Max = '+ dbo.FN_FormatDecimalAsVarchar(MaxR,1)+'deg',0,1,'Black','')
                                                        +'<br> 
                              											
                              													<br> '
                              													+[dbo].[FN_MarkupFullHtml_v2]('Avg = '+ dbo.FN_FormatDecimalAsVarchar(AvgR,1)+'deg',0,1,'Black','')
                                                        +'<br> 
                              													
                              													<br> '
                              													+[dbo].[FN_MarkupFullHtml_v2]('Count of Holes = '+ dbo.FN_FormatDecimalAsVarchar(CountR,1)+'',0,1,'Black','')
                                                         +'<br> 
                              												
                              													<br> '
                              													+[dbo].[FN_MarkupFullHtml_v2]('(If this seems outdated, please update this tablet)',1,1,'Black','')
                              										
                              			, IsEnabled = 1
                              			, OrderBy = 2
                              			, ForEmployeeIdsCsv = '0'
                              
                              			, LastModifiedOn =GETDATE()
                              			-- Flags.
                              			, SpecificEmployeeCount = 0
                              			,Username = ''
                    from (SELECT 
                                                                ReadingLabelForPlodPageBreak
                                                                ,CountR =count(s.ReadingLabelForPlod)
                                                                ,AvgR = AVG(s.InputValueNumeric)
                                                                ,MaxR=Max(s.InputValueNumeric)
                                                                                                                              
                                                                FROM dbo.View_ShiftSummary_HoleTemperatureReadings AS s
                    WHERE s.Date > dateadd(day,-7,getdate())
                    and s.ProjectID = @projectid
                    AND @GetHistoricalTemperaturesIntoInputs =1
                    and s.MostRecentFirstIncrement=1
                            group BY ReadingLabelForPlodPageBreak) as tbl
                            
                            
                            
                            
                            UNION ALL --2021-08-03 --remove after job done
                              		SELECT
                              			OperationID = @operationId
                              			, ProjectId = @projectId
                              			, UserMessageId = '-1'
                              			, IsAckRequired = 1
                              			, UserMessageHtml  = [dbo].[FN_MarkupFullHtml_v2]('This Version of '+@AppName + ' is being retired.',1,0,'Red','') +' <br> 
                              													<br> 
                              													<br> 
                              													<br> '
                              													+[dbo].[FN_MarkupFullHtml_v2](' PLEASE LOG BACK OUT AND OPEN THE OTHER ' +@AppName + ' APP.',1,0,'Black','')+ 
                              													'<br> 
                              													<br> 
                              													<br> 
                              													<br> '
                              													+[dbo].[FN_MarkupFullHtml_v2]('(If the other ' +@AppName + ' app doesnt work, request engineer QR into action)',0,1,'Black','')
                              										
                              			, IsEnabled = 1
                              			, OrderBy = 2
                              			, ForEmployeeIdsCsv = '0'
                              
                              			, LastModifiedOn =GETDATE()
                              			-- Flags.
                              			, SpecificEmployeeCount = 0
                              			,Username = ' - The '+@AppName + ' Team.'
                              			WHERE @IsWarnThisVersion + @IsBlockThisVersion > 0
                              
                              UNION ALL --testing some stuff for induction
                              		SELECT
                              			OperationID = @operationId
                              			, ProjectId = @projectId
                              			, UserMessageId = '-1'
                              			, IsAckRequired = 1
                              			, UserMessageHtml  = 'This is a question that we need them to ackowledge at the start of this induction'
                              			, IsEnabled = 1
                              			, OrderBy = 2
                              			, ForEmployeeIdsCsv = '0'
                              
                              			, LastModifiedOn =GETDATE()
                              			-- Flags.
                              			, SpecificEmployeeCount = 0
                              			,Username = ' - The '+@AppName + ' Team.'
                              			WHERE @appDeploymentMode = 'induction'
                              


	) AS data
	--WHERE (LastModifiedOn > @FromDate 
	--			OR @FromDate IS NULL)
	WHERE data.IsEnabled <> 0 --no need to send out messages that have already been read. the filter is down here because this field is derived 

	ORDER BY 
		OrderBy ASC, 
		UserMessageId ASC
		--UserMessageHtml ASC

		END


-- Get the latest system error.
SELECT @Error = @@ERROR WHERE @Error = 0
IF (@Error <> 0)
BEGIN
	RETURN @Error
END

-- Finish now.
RETURN 0








GO
PRINT N'Altering [dbo].[View_ShiftSummary_PrestartHistory]'
GO
ALTER view [dbo].[View_ShiftSummary_PrestartHistory]
as
/*
select * from [dbo].[View_ShiftSummary_PrestartHistory] where projectid = 387	--and date > '2020-09-01' order by date,operator --3974 3 secs; 
			PEA: 8secs 21517 (old), new: 1:38, 21627
									swap tg to tgAll: 1:43, 21627
									remove stat/statequp: 1:39
									add exists to the actinput table!!
2019-02-20 TS ... added location field for peak
2019-04-15 TS ... added OperatorID 
2019-08-15 TS ... added "inputId" for further filtering
2020-08-21 ts ... change to special handign link table
2020-08-24 CA ... removed fuel readings by adding AND NOT (InputType = 'attrlist' AND prstinputid = 288) 
2020-11-02 ts ... modify to include all things that log faults (not jsut prestarts)
2020-11-03 ts ... modify the labels to include show special for record machine fault (dodgy!)
2021-06-07 ts ... fix attribute lists meters coming through this
				... added locatl stagingid for the phptos join
				... added OR s.ProjectId to the jooin to actreasoninput table. should be fine for dupes becasue it has a distinct?!
				... added IsTrueFault
2021-06-08 ts ... remove teh display order from i (it was causing duplicates across project/Proj1 ... 
							this is a dodgy hack for the main problemw which is that we have prestarts not on proj1 here.
							could simply delete prestart data off proj1 !!! need to sort out a proper soln when we mature the concept of manage-repo
2021-06-08 ts ... add taskname, had to join to sys_reasons. maybe should shift this back to the task grouping fungtion?! (could make it too slow)
2021-07-07 ts ... "CommentsCheck" needs to be separate row in this.
				... various optimisations:	...(MAYBE REVERT: various optimisations: swap task groupings to tg all, don't need to join again to reason table
								...don't need stat vs statequip fudge anymore
								...NAH: join teh task groupings to input table instead THIS WILL KILL INPUTS THAT NO LONGER EXIST ON ACT REASON!
								... change project join to IN instead of OR
								... explicitly qtypes on teh include for intolerables
								...NAH, makes it worse: change teh tg to a EXISTS on the where.
								... add exists on the actinputs table to quell that shit?
			... added flag for is general comment
2022-10-21 ts ... manipulate the flag for istruefault
              ... added isshutdown cehck too

TODO:
before releaseing to pybar, need to check on query speed of this.

LIKELY HAVE TO CHECK ON THE VIEWS FEEDING THE IPLOD HISTORY LIST?


*/
select *
from (
  select distinct Date
                , s.ProjectID
                , 'NotificationText' as 'GroupingField'
                ,   -- this is not displayed, tells you which field to group by on the page
                  Shift
                , e.EmployeeName as 'Operator'
                ,

                  ------- Displaying Time correctly instead of just an int.
                  case
                            when len(cast(convert(float, StartTime) as varchar)) = 3 then
                              '0' + left(cast(convert(float, StartTime) as varchar), 1) + ':' + right(cast(convert(float, StartTime) as varchar), 2) --+ ' Hrs' 
                            when len(cast(convert(float, StartTime) as varchar)) = 2 then
                              '00' + ':' + right(cast(convert(float, StartTime) as varchar), 2)-- + ' Hrs' 
                            else
                              left(cast(convert(float, StartTime) as varchar), 2) + ':' + right(cast(convert(float, StartTime) as varchar), 2)-- + ' Hrs' 
                  end
                  as 'Time'
                  ----------- End time stuff
                , EquipmentID
                , eq.EquipmentCode as 'EquipID'
                , DisplayOrder = 1
                , 'Prestart Question' = case
                                                 when s.InputType like 'Q%' then
                                                   q.QuestionText
                                                 when [s].[InputType] = 'stat'
                                                   and
                                                   [s].[InputID] = 7 then
                                                   'General Comments'
                                                 else
                                                   i.ForeLabel
                                       end
                , 'Answer' = case
                                      when s.inputid = 102
                                        and
                                        s.inputtype = 'attrinput' then
                                        ':'
                                      when s.InputType = 'attrlist' then
                                        isnull(at.AttributeDescription, 'missing answer')
                                      when [s].[InputType] = 'stat'
                                        and
                                        [s].[InputID] = 7 then
                                        ''  --2021-07-07
                                      else
                                        s.InputValue
                            end
                , q.intolerablevalue
                , NotificationText = case
                                              when s.InputType = 'attrlist' then
                                                i.ForeLabel --for attributes, put them into their own place
                                              --2021-07-07, don't think we need to change this logic?
                                              else
                                                isnull(q.category, iif(s.ActivityReasonID = 1696, 'Record Machine Fault', 'Comments / Hour Meters'))    --2020-11-03 
                                    end
                , [Include] = case
                                       when (s.InputValue = q.intolerablevalue
                                           and s.InputType like 'Q%'
                                           or s.InputType not like 'Q%')
                                         and
                                         not (InputValue = ''
                                           and s.InputType not like 'Q%') then
                                         1
                                       else
                                         0
                             end --should bring the stat7 in wihtout changing the logic I think?

                , 'Comments' = case
                                        when s.inputid = 102
                                          and
                                          s.inputtype = 'attrinput' then
                                          s.InputValue
                                        when s.inputid = 7
                                          and
                                          s.inputtype = 'Stat' then
                                          isnull(s.CommentsCheck, '')   --stat7 is brought in to get general comments about the prestart
                                        else
                                          isnull(s.InputComment, '') --+ '  '+isnull(s.CommentsCheck,'') 

                              end
                , s.InputType
                , StagingID
                , FeedbackAdvice
                , LocationId = dbo.FN_IsNullorEmpty(s.Location, 0)
                , s.OperatorID
                , prstInputId = s.InputID
                , prstLocalStagingid = s.LocalStagingID
                , IsTrueFault = case when ( tg.IsPrestart =1 or tg.IsShutdownCheck =1) and s.InputValue = q.intolerablevalue then 1
                                      when /* tg.IsPrestart =0 and*/ s.inputid = 102
                                                      and
                                                      s.inputtype = 'attrinput' then 1 --2022-10-21 non-prestarts are laid out differently. they have faults against attrinput 102 for one thing
                                      else 0 end  --only put true faults into certain places
                , prstTaskAlias = [tg].[TaskName] --isnull(tg_ReasonAlias,reas.ReasonDescription)
                , IsGeneralComment = iif(s.inputid = 7 and s.inputtype = 'Stat', 1, 0)
  from [dbo].[syn_DWH_iPlodStagingTable] as s
  left outer join dbo.[tbl_SYS_Questions] as q
    on s.inputID = q.QuestionID
        and s.InputType like 'Q%'
  left outer join dbo.tbl_DBT_Employees as e
    on s.OperatorID = e.EmployeeID
  left outer join dbo.tbl_SYS_Equipment as eq
    on s.EquipmentID = eq.EquipmentCodeID
  --removed this becuase of teh hard coded Proejct=1 join.
  --replaced with teh outer apply below, which will sort it, but maybe slow?
  left join [dbo].[tbl_DBT_ActReasonInputLink] as i
    on i.ActReasonLinkID = s.ActivityReasonID
        and s.InputID = i.InputID
        and (i.ProjectID = 1
          or s.ProjectID = i.ProjectID) --this allows MCR to be on Proj399
        --and (i.[ProjectID] in (1,s.[ProjectID]))
        and exists (
          select [tgs].[ActivityReasonId]
          from dbo.FN_Iplod_GetAR_TaskGroupings('ReportingSplits', '') as tgs
          where i.[ActReasonLinkID] = tgs.[ActivityReasonId]
            and tgs.[HasFaults] = 1)
        --pybar: and i.[ProjectID] =1
        and (s.InputType = i.InputType)--2021-07-07, don't need this anymore: or s.InputType like 'stat%' and i.InputType like 'stat%') 
  --this will cause historical issues if changing between StatEquip and Stat 
  --... could be dealt with by scripting all historical Staging data back to StatEquip
  --2020-11-02 INNER JOIN dbo.FN_Iplod_GetAR_TaskGroupings('ReportingSplits','AR_Prestarts') AS tg
  --inner join dbo.FN_Iplod_GetAR_TaskGroupings('ReportingSplits','') as tg
  inner join FN_Iplod_GetAR_TaskGroupingsAll(0, 0) as tg  --put projectid as 0, should be fine for most things here (prestarts into special handling on proj1 predominently)
    on s.[ActivityReasonID] = tg.ActivityReasonId
  --	left join dbo.tbl_SYS_Reason as reas
  --	on tg.tg_ReasonId = reas.ReasonID
  --outer apply [dbo].[udf_GetTaskDetails_ForIplod]  --can't apply the projec and join on actreason/inputtype/inpuytid!
  --					(s.ProjectID
  --					,''
  --					,0
  --					, s.ActivityReasonID
  --					) as i


  left join dbo.tbl_SYS_Attribute as at
    on s.InputType = 'attrlist'
        and cast(at.AttributeID as varchar) = s.InputValue
        and at.AttributeTypeID = s.InputID

  where --s.InputType like 'Q%' AND
    tg.HasFaults = 1
    and --2020-11-02
    not (s.inputtype = 'stat'
      and s.inputid = 7
      and ([s].[CommentsCheck] = ''
        or [s].[CommentsCheck] is null))  --2021-07-07
    and not (s.InputType = 'attrlist'
      and s.inputid = 288)
-- AND s.ActivityReasonID  IN (SELECT ID FROM [dbo].[FN_SplitString]
--((SELECT ConfigValue FROM tbl_SYS_WebbarConfigs WHERE ConfigName = 'AR_Prestarts' AND Active = 1 )))

--and exists (select [tgs].[ActivityReasonId] from dbo.FN_Iplod_GetAR_TaskGroupings('ReportingSplits','') as tgs
--		where s.[ActivityReasonID] = tgs.[ActivityReasonId] and tgs.[HasFaults] =1)


) as tbl1
where [Include] = 1
GO
PRINT N'Refreshing [dbo].[View_WebbarAPI_Information]'
GO
EXEC sp_refreshview N'[dbo].[View_WebbarAPI_Information]'
GO
PRINT N'Altering [dbo].[SP_iPlodMessages_INSERT]'
GO
ALTER  PROCEDURE [dbo].[SP_iPlodMessages_INSERT]
@ProjectId AS INT = NULL,
@UserId AS INT,  --the webbar userId of who inserted teh message
@EmployeeIdsCsv AS nvarchar(1000) = '0',  --CSV of the employeeIds recipient of the message
@IsAckRequired AS int = 0,
@MessageText nvarchar(MAX),
@ExpiryDate datetime =NULL,
@AppDeploymentMode nvarchar(50) = NULL,
@MinIplodVersion int = 0,
@debugmode int = 0

AS
/**********************************************************************
EXEC [dbo].[SP_iPlodMessages_INSERT] @ProjectId = '236', @UserId = '137', @IsAckRequired = '1', @EmployeeIdsCsv = '-1' , @MessageText = '
test again to miners'



Purpose : UserMessages - for inserting iplod messages
Notes   : -




GRANT SELECT ON [dbo].[tbl_DBT_iplodUserMessages] TO [Public]
GRANT SELECT ON [dbo].[tbl_DBT_iplodUserMessageUsers] TO [Public]
GRANT SELECT ON [dbo].[tbl_DWH_iplodUserMessageUserLogs] TO [Public]
GRANT EXECUTE ON [dbo].[procDWH_iplodUserMessages_Upd] TO [Public]

History  : 2020-02-25 TS ... initial creation
			2020-08-19 TS ... rejen some specials out again
							...handle @ExpiryDate (to be shifted back to user control. default to 2 wks
							... handle @AppDeploymentMode
			2020-08-24 ts ... add debug mode
						... add minversion
			2020-08-26 ts ... fix up the positiionids for miners
			2020-08-26 ts ... whack in operationid for filtering on sending data down to local
			2020-08-27 ts ... make default expiry 18 days instead.
			2020-08-28 ts ... change filter on employee table to be OperationId instead of Projectid



TO DO:
should allow shiftboss to recall messages?! would need to do an update in this proc

need to nominate PositionCSV config for miners (and classes of people as necessar)
shift this ID stuff upstream for shift summary where they can select multiple users

**********************************************************************/
SET NOCOUNT ON
DECLARE @Error AS INT = 0

--DECLARE @ProjectId int = 194
DECLARE @IsLiveDb int =dbo.FN_IsLiveDB(@ProjectId);
DECLARE @IsLocal int =  dbo.FN_IsLocal(@ProjectId);
DECLARE @UserMessageId int
DECLARE @OperationId int = (SELECT Operationid FROM dbo.tbl_DBT_Project WHERE projectid = @ProjectId );
--set @ExpiryDate if null
SET @ExpiryDate = IIF(@ExpiryDate IS NULL, DATEADD(DAY,18,GETDATE()),@ExpiryDate)  --default to 14 days only. should cover new crews coming in, but not let them get stale
SET @AppDeploymentMode = IIF(@AppDeploymentMode IS NULL, 'Mining_Fitters', @AppDeploymentMode);
--sort out teh emp csv for the specials (note these CSV position configs are also used in the employee proc for iplod
DECLARE @PositionIDFItters nvarchar(500) = ISNULL(dbo.FN_GetConfigValue(@projectId,'PositionIdCsvForFitters'),'0');
DECLARE @PositionIDSparkies nvarchar(500) = ISNULL(dbo.FN_GetConfigValue(@projectId,'PositionIdCsvForSparkies'),'0');
DECLARE @PositionIDMillRats nvarchar(500) = ISNULL(dbo.FN_GetConfigValue(@projectId,'PositionIdCsvForMillRats'),'0');
DECLARE @PositionIdExclusionNotMiners nvarchar(1500) = ISNULL(dbo.FN_GetConfigValue(@projectId,'PositionIdCsvForFitters'),'0')+
														','+ISNULL(dbo.FN_GetConfigValue(@projectId,'PositionIdCsvForSparkies'),'0')
														+','+ISNULL(dbo.FN_GetConfigValue(@projectId,'PositionIdCsvForMillRats'),'0');

DECLARE @EmployeeIdsInt nvarchar(500) = (SELECT REPLACE(@EmployeeIdsCsv,',','') ); --dodgy conversion becasue page may pass in multiples. need to shift this handling upstream
DECLARE  @PositionIdCsvFilter nvarchar(1000)=
											CASE WHEN @EmployeeIdsCsv = '-1' THEN 'miners'		--miners
												WHEN @EmployeeIdsCsv = '-2'	THEN @PositionIDFItters			--fitters
												WHEN @EmployeeIdsCsv = '-3'	THEN @PositionIDMillRats			--millrats
												WHEN @EmployeeIdsCsv = '-4'	THEN 	@PositionIDSparkies		--sparkies
												--WHEN CAST(@EmployeeIdsInt AS int) <= -100  THEN REPLACE(@EmployeeIdsCsv,'-','')
											ELSE '' END
DECLARE @PositionIdIntFilter int =case WHEN CAST(@EmployeeIdsInt AS int) <= -100  THEN CAST(@EmployeeIdsInt AS int) /-100 ELSE 0 END  --special for normal positions ... rejen back to normal positionid
PRINT @PositionIdCsvFilter
PRINT @PositionIdExclusionNotMiners

--put leading and trailing commas (for better filtering on display)
DECLARE @EmployeeIdsCsvForInsert nvarchar(max) = ( SELECT CASE WHEN LEFT(@EmployeeIdsCsv,1)=',' THEN ''ELSE ',' END 
															+ @EmployeeIdsCsv
															+ CASE WHEN right(@EmployeeIdsCsv,1)=',' THEN ''ELSE ',' END 
															);

IF @debugmode = 1
begin
SELECT @PositionIdCsvFilter
end
--DECLARE @MsgTable nvarchar(200)  =SELECT CASE WHEN @IsLocal = 1 THEN 'tbl_DBT_iplodUserMessages_LocalOnly' ELSE 'tbl_DBT_iplodUserMessages' END;
--DECLARE @MsgUsersTable nvarchar(200) = SELECT CASE WHEN @IsLocal = 1 THEN 'tbl_DBT_iplodUserMessageUsers_LocalOnly' ELSE 'tbl_DBT_iplodUserMessageUsers' END;

IF @IsLocal = 0 --on central, add to teh normal tables ... they will be synced down to locals. this is for adding messages to all users
BEGIN
--add the message
INSERT INTO dbo.tbl_DBT_iplodUserMessages
( ProjectID
   ,IsAckRequired
   ,UserMessageHtml
   ,IsEnabled
   ,LastModifiedOn
   ,AddedByUser
   ,ExpiryDate
   ,AppDeploymentMode
   ,RecipientIdCsv
   ,MinIplodVersion
   ,OperationId)
VALUES
( @ProjectId   -- ProjectID - int
   ,@IsAckRequired   -- IsAckRequired - int
   ,@MessageText   -- UserMessageHtml - nvarchar(max)
   ,1   -- IsEnabled - int
   ,GETDATE () -- LastModifiedOn - datetime
   ,@UserId   -- AddedByUser - int
   ,@ExpiryDate
   ,@AppDeploymentMode
   ,@EmployeeIdsCsvForInsert
   ,@MinIplodVersion
   ,@OperationId
)


--find the id
set @UserMessageId  = (SELECT TOP 1 [UserMessageId]  FROM tbl_DBT_iplodUserMessages
WHERE UserMessageHtml = @MessageText
ORDER BY UserMessageId DESC);

PRINT @UserMessageId


--add the user(s) (no lines will result in message being sent to all users. so will userId = 0
INSERT INTO dbo.tbl_DBT_iplodUserMessageUsers
( UserMessageId
   ,EmployeeId
   ,IsEnabled
   ,CreatedOn
   ,LastModifiedOn
   ,OperationId )
SELECT @UserMessageId   -- UserMessageId - int
   ,EmployeeID   -- EmployeeId - int
   ,1   -- IsEnabled - int
   ,GETDATE () -- CreatedOn - datetime
   ,GETDATE () -- LastModifiedOn - datetime
   ,@OperationId
FROM dbo.tbl_DBT_Employees
WHERE Status  =1 AND --ProjectID = @ProjectId
OperationID = @OperationId
AND (@PositionIdCsvFilter = '' AND EmployeeID IN (SELECT ID FROM dbo.FN_SplitString(@EmployeeIdsCsv))
		OR @PositionIdCsvFilter NOT IN ( '','miners') AND PositionID IN (SELECT ID FROM dbo.FN_SplitString(@PositionIdCsvFilter))
		OR @PositionIdCsvFilter = 'miners' AND  PositionID NOT IN (SELECT ID FROM dbo.FN_SplitString(@PositionIdExclusionNotMiners))  --get all else for miners for now till we clean up the csv config situation
		OR (@PositionIdIntFilter > 0 AND PositionID =@PositionIdIntFilter)
		)
AND NOT(@EmployeeIdsCsv = '0')  --don't insert anything if it is going to everyone
--WHERE ID <>0

END

IF @IsLocal = 1  -- if on local, insert to the local tables, these will feed iplod locally and then get hustled up to central for safe keeping
BEGIN
--add the message
INSERT INTO dbo.tbl_DBT_iplodUserMessages_localOnly
( ProjectID
   ,IsAckRequired
   ,UserMessageHtml
   ,IsEnabled
   ,LastModifiedOn
   ,AddedByUser
   ,ExpiryDate
   ,AppDeploymentMode
   ,RecipientIdCsv
   ,MinIplodVersion)
VALUES
( @ProjectId   -- ProjectID - int
   ,@IsAckRequired   -- IsAckRequired - int
   ,@MessageText   -- UserMessageHtml - nvarchar(max)
   ,1   -- IsEnabled - int
   ,GETDATE () -- LastModifiedOn - datetime
   ,@UserId   -- AddedByUser - int
   ,@ExpiryDate
   ,@AppDeploymentMode
   ,@EmployeeIdsCsvForInsert
   ,@MinIplodVersion
)


--find the id
SET @UserMessageId  = (SELECT TOP 1 [UserMessageId]  FROM tbl_DBT_iplodUserMessages_LocalOnly
WHERE UserMessageHtml = @MessageText
ORDER BY UserMessageId DESC);

--add the user(s) (no lines will result in message being sent to all users. so will userId = 0
INSERT INTO dbo.tbl_DBT_iplodUserMessageUsers_localOnly
( UserMessageId
   ,EmployeeId
   ,IsEnabled
   ,CreatedOn
   ,LastModifiedOn)
SELECT @UserMessageId   -- UserMessageId - int
   ,EmployeeId   -- EmployeeId - int
   ,1   -- IsEnabled - int
   ,GETDATE () -- CreatedOn - datetime
   ,GETDATE () -- LastModifiedOn - datetime
FROM dbo.tbl_DBT_Employees
WHERE Status  =1 AND --ProjectID = @ProjectId
OperationID = @OperationId
AND (@PositionIdCsvFilter = '' AND EmployeeID IN (SELECT ID FROM dbo.FN_SplitString(@EmployeeIdsCsv))
		OR @PositionIdCsvFilter NOT IN ( '','miners') AND PositionID IN (SELECT ID FROM dbo.FN_SplitString(@PositionIdCsvFilter))
		OR @PositionIdCsvFilter = 'miners' AND  PositionID NOT IN (SELECT ID FROM dbo.FN_SplitString(@PositionIdExclusionNotMiners))  --get all else for miners for now till we clean up the csv config situation
		OR (@PositionIdIntFilter > 0 AND PositionID =@PositionIdIntFilter)
		)

END


-- Get the latest system error.
SELECT @Error = @@ERROR WHERE @Error = 0
IF (@Error <> 0)
BEGIN
RETURN @Error
END

-- Finish now.
RETURN 0
GO
PRINT N'Altering [dbo].[SP_ProjectSetup_SnapshotTesting_INSERT]'
GO


ALTER  PROCEDURE [dbo].[SP_ProjectSetup_SnapshotTesting_INSERT]
@ProjectId AS INT = NULL,
@UserId AS INT,  --the webbar userId of who inserted teh message
@TestScenarioName AS nvarchar(50) = '',  
@URLAtEndOfTest   AS nvarchar(250) = ''
,@Date date = ''
   ,@Shift AS nvarchar(25) = ''
   ,@PageCode AS nvarchar(50) = ''
   ,@JSONResults  AS nvarchar(max) = ''

AS
/**********************************************************************
Purpose : UserMessages - for inserting snapshot test data
Notes   : -




GRANT SELECT ON [dbo].[tbl_DBT_iplodUserMessages] TO [Public]
GRANT SELECT ON [dbo].[tbl_DBT_iplodUserMessageUsers] TO [Public]
GRANT SELECT ON [dbo].[tbl_DWH_iplodUserMessageUserLogs] TO [Public]
GRANT EXECUTE ON [dbo].[procDWH_iplodUserMessages_Upd] TO [Public]

History  : 2020-04-01 TS ... initial creation



TO DO:
expand to allow update of existing results (set IsSuccess =1 or add Comments)

**********************************************************************/
SET NOCOUNT ON
DECLARE @Error AS INT = 0

--DECLARE @ProjectId int = 194
DECLARE @IsLiveDb int =dbo.FN_IsLiveDB(@ProjectId);
DECLARE @IsLocal int =  dbo.FN_IsLocal(@ProjectId);

DECLARE @DBName nvarchar(50) = DB_NAME();
DECLARE @VersionNumber nvarchar(50) = (SELECT TOP 1 VersionNumber FROM dbo.tbl_SYS_WebbarUpdates ORDER BY [DateTime] DESC);

BEGIN


INSERT INTO dbo.tbl_STO_TestResults
(	ProjectID
   ,DateTimeOfTest
   ,Date
   ,Shift
   ,PageCode
   ,TestScenarionName
   ,URLAtEndOfTest
   ,UserId
   ,DBName
   ,webbarVersionNumber
   ,JSONResults
   ,PageImageResult
   ,IsCorrectResult
   ,Comments)
VALUES
(	@ProjectId		   -- ProjectID - int
   ,GETDATE () -- DateTimeOfTest - datetime
   ,@Date -- Date - date
   ,@Shift		   -- Shift - nvarchar(15)
   ,@PageCode		   -- PageCode - nvarchar(50)
   ,@TestScenarioName		   -- TestScenarionName - nvarchar(50)
   ,@URLAtEndOfTest		   -- URLAtEndOfTest - nvarchar(250)
   ,@UserId	   -- UserId - int
   ,@DBName	   -- DBName - nvarchar(50)
   ,@VersionNumber	   -- webbarVersionNumber - nvarchar(50)
   ,@JSONResults	   -- JSONResults - nvarchar(max)
   ,N''		   -- PageImageResult - nvarchar(max)
   ,0		   -- IsCorrectResult - int
   ,N''		   -- Comments - nvarchar(max)
	)









END


-- Get the latest system error.
SELECT @Error = @@ERROR WHERE @Error = 0
IF (@Error <> 0)
BEGIN
RETURN @Error
END

-- Finish now.
RETURN 0
GO
PRINT N'Altering [dbo].[View_KPI_SecondaryKPISummaryOperatorPrody_For_Reporting]'
GO

ALTER VIEW [dbo].[View_KPI_SecondaryKPISummaryOperatorPrody_For_Reporting]
AS
/*
to send to local:
SELECT * FROM [dbo].[View_KPI_SecondaryKPISummaryOperatorPrody_For_Reporting] WHERE projectid = 399



GRANT SELECT ON  [dbo].[View_KPI_SecondaryKPISummaryOperatorPrody_For_Reporting] TO [Aeris_PowerBI]
go



for adding to employee proc:


created by TS, 2021-02-25 to feed prody data into cracow
these are a beast, likely best feeding other ones into new views (hence the operator prody reference in the name of the view

2021-02-25 ts ... no date filter. also no proejct 53 or 3
2021-09-16 CA ... Remove OperatorPrody from Metric
2022-01-25 CA ... Remove max date. That was for Plod and poorly copied into here. aggregates badly for powerBI

*/
SELECT 
						  Date 
						,ProjectID =  tbl.ProjectID 
						--, Project 
						, SITECODE
						--,OperationID = p.OperationID
			 			, Numerator
						, Denominator 
						, Metric = REPLACE(tbl.Metric,'OperatorPrody_','')
						, MetricSort 
						, Unit
						--, EquipmentId 
						,eq.EquipmentCode
						--, LocationId 
						,l.LocationCode
						--, OperatorId
						,emp.EmployeeName
						, EquipTypeCode
FROM
	(	

 		SELECT			 Date = date
						, ProjectID 
						, Project 
						, SITECODE 
			 			, Numerator = SUM(Numerator)
						, Denominator = SUM(Denominator)
						, Metric 
						, MetricSort 
						, Unit
						, EquipmentId 
						, LocationId =0
						, OperatorId


 FROM [dbo].[view_KpiSecondary_201_OperatorPrody_TKMsPerActiveShift]--(0 , dateadd(day,-42,getdate()), getdate(),  '1' ) AS otk  --previous 6 weeks .... is this sqing and your prveious one on a 2/2
WHERE  --date BETWEEN DATEADD(DAY,-42,GETDATE()) AND  GETDATE()
 projectid NOT IN (3,53)
 GROUP BY  date,ProjectID , Project , SITECODE 	, Metric , MetricSort 		, Unit			, EquipmentId  	, OperatorId
 UNION ALL 
 		SELECT			 Date = date
						, ProjectID 
						, Project 
						, SITECODE 
			 			, Numerator = SUM(Numerator)
						, Denominator = SUM(Denominator)
						, Metric 
						, MetricSort 
						, Unit
						, EquipmentId 
						, LocationId =0
						, OperatorId


 FROM [dbo].[view_KpiSecondary_203_OperatorPrody_BogTonnesPerActiveShift]--(0 , dateadd(day,-42,getdate()), getdate(),  '1' ) AS otk  --previous 6 weeks .... is this sqing and your prveious one on a 2/2
WHERE  --date BETWEEN DATEADD(DAY,-42,GETDATE()) AND  GETDATE()
 projectid NOT IN (3,53)
  GROUP BY  date, ProjectID , Project , SITECODE 	, Metric , MetricSort 		, Unit			, EquipmentId  	, OperatorId

 UNION ALL 
 		SELECT			 Date = date
						, ProjectID 
						, Project 
						, SITECODE 
			 			, Numerator = SUM(Numerator)
						, Denominator = SUM(Denominator)
						, Metric 
						, MetricSort 
						, Unit
						, EquipmentId 
						, LocationId =0
						, OperatorId


 FROM [dbo].[view_KpiSecondary_202_OperatorPrody_DrillmPerActiveShift]--(0 , dateadd(day,-42,getdate()), getdate(),  '1' ) AS otk  --previous 6 weeks .... is this sqing and your prveious one on a 2/2
 WHERE  --date BETWEEN DATEADD(DAY,-42,GETDATE()) AND  GETDATE()
 projectid NOT IN (3,53)
 GROUP BY  date,ProjectID , Project , SITECODE 	, Metric , MetricSort 		, Unit			, EquipmentId  	, OperatorId


 UNION ALL 
 		SELECT			 Date = date
						, ProjectID 
						, Project 
						, SITECODE 
			 			, Numerator = SUM(Numerator)
						, Denominator = SUM(Denominator)
						, Metric 
						, MetricSort 
						, Unit
						, EquipmentId 
						, LocationId =0
						, OperatorId


 FROM [dbo].[view_KpiSecondary_204_OperatorPrody_TwiCountPerActiveShift]--(0 , dateadd(day,-42,getdate()), getdate(),  '1' ) AS otk  --previous 6 weeks .... is this sqing and your prveious one on a 2/2
 WHERE  --date BETWEEN DATEADD(DAY,-42,GETDATE()) AND  GETDATE()
 projectid NOT IN (3,53)
 GROUP BY  date,ProjectID , Project , SITECODE 	, Metric , MetricSort 		, Unit			, EquipmentId  	, OperatorId

  UNION ALL 
 		SELECT			 Date = date
						, ProjectID 
						, Project 
						, SITECODE 
			 			, Numerator = SUM(Numerator)
						, Denominator = SUM(Denominator)
						, Metric 
						, MetricSort 
						, Unit
						, EquipmentId 
						, LocationId --=0
						, OperatorId


 FROM  [dbo].[view_KpiSecondary_200--_OperatorPrody_AllStatsPerPrdtHrs]--(0 , dateadd(day,-42,getdate()), getdate(),  '1' ) AS otk  --previous 6 weeks .... is this sqing and your prveious one on a 2/2
 WHERE --date BETWEEN DATEADD(DAY,-42,GETDATE()) AND  GETDATE()
 projectid NOT IN (3,53)
 GROUP BY  date,ProjectID , Project , SITECODE 	, Metric , MetricSort 		, Unit			, EquipmentId  	, OperatorId, locationid






) AS tbl
LEFT JOIN
	( SELECT EquipmentCodeId, eq.EquipTypeId, EquipTypeCode, eq.EquipmentCode FROM tbl_SYS_Equipment AS eq 
	INNER JOIN tbl_SYS_ResEquipTypes AS re ON eq.EquipTypeId = re.EquiptypeID
	) AS eq
	ON tbl.EquipmentId = eq.EquipmentCodeId
LEFT OUTER JOIN dbo.tbl_DBT_Project AS p ON p.ProjectID = tbl.ProjectID
LEFT JOIN dbo.tbl_DBT_Employees AS emp
	ON emp.EmployeeID =tbl.OperatorId
LEFT JOIN dbo.tbl_DBT_Location AS l
	ON l.LocationID = tbl.LocationId



GO
PRINT N'Refreshing [dbo].[vw_Reporting_KPINew_AllMappedPrimaryKpis_Combined_MCR_etlVersion]'
GO
EXEC sp_refreshview N'[dbo].[vw_Reporting_KPINew_AllMappedPrimaryKpis_Combined_MCR_etlVersion]'
GO
PRINT N'Altering [dbo].[SP_Utility_CreatePowerBIUser]'
GO

ALTER PROCEDURE [dbo].[SP_Utility_CreatePowerBIUser]

@PowerBIUser VARCHAR(50),
@PowerBIPassword VARCHAR(50),
@DataBase VARCHAR(50),
@TheseVarsAreNotUsed VARCHAR(50)



/*
		2021-05-21 CA Made this a script for safekeeping. 

		Don't really need to execute this as an SP, just run the script manually.

*/


AS 
BEGIN 

-- Creates the login AbolrousHazem with password '340$Uuxwp7Mcxo7Khy'.  
CREATE LOGIN Macraes_PowerBI
    WITH PASSWORD = 'MacrA3s1!'


-- Creates a database user for the login created above.  
CREATE USER Macraes_PowerBI FOR LOGIN Macraes_PowerBI;  


-- for granting select on an object to certain user
GRANT SELECT ON OBJECT::webbar.dbo.View_KPINew_AllMappedPrimaryKpis TO Macraes_PowerBI;



-- for granting select on an object to certain user
--REVOKE SELECT ON OBJECT::webbar.dbo.tbl_WRK_TaskHeader TO Macraes_PowerBI;
--GO


END 

GO
PRINT N'Altering permissions on  [dbo].[SP_API_IPLODSetup_Documents_SqliteZip]'
GO
GRANT EXECUTE ON  [dbo].[SP_API_IPLODSetup_Documents_SqliteZip] TO [public]
GO
PRINT N'Altering permissions on  [dbo].[procWRK_TaskDetailQty_Upd]'
GO
GRANT EXECUTE ON  [dbo].[procWRK_TaskDetailQty_Upd] TO [public]
GO
PRINT N'Altering permissions on  [dbo].[procWRK_TaskHeader_Upd]'
GO
GRANT EXECUTE ON  [dbo].[procWRK_TaskHeader_Upd] TO [public]
GO
PRINT N'Altering permissions on  [dbo].[sp_generate_merge]'
GO
GRANT EXECUTE ON  [dbo].[sp_generate_merge] TO [public]
GO
