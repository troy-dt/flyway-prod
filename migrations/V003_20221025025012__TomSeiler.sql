SET NUMERIC_ROUNDABORT OFF
GO
SET ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT, QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
PRINT N'Altering [dbo].[vw_ReportingSnapshotLatest_KpisCombined_All]'
GO
ALTER   VIEW [dbo].[vw_ReportingSnapshotLatest_KpisCombined_All]
AS 
/*
select * from [dbo].[vw_ReportingSnapshotLatest_KpisCombined_All] where projectid = 387  -- ts local pea 55secs, 156492 rows
 DO NOT EDIT THIS VIEW, IT NEEDS TO BE EDITED IN HERE SP_ProjSetup_BuildDynamicView_ReportingAttributes
AUTO CREATED on:Oct 23 2022  6:36PM
*/
 SELECT 
											 SnapshotBuildDateTime = EtlDateTime
                       ,[a].[UniqueDataSetId]
                       ,[a].[PvtJn_TaskId]
                       ,[a].[Date]
                       ,[a].[Shift]
                       ,[a].[ProjectID]
                       ,[a].[ActualValue]
                       ,[a].[MetricValue]
                       ,[a].[TargetValue]
                       ,[a].[MetricCode]
                       ,[a].[MetricDesc]
                       ,[a].[MetricSubtotalCode]
                       ,[a].[StatisticCode]
                       ,[a].[Units]
                       ,[a].[EmployeeName]
                       ,[a].[EquipmentCode]
                       ,[a].[LocationCode]
                       ,[a].[MaterialDescOp]
                       ,[a].[Site]
                       ,[a].[ActivityDesc]
                       ,[a].[BogFrom]
                       ,[a].[BogTo]
                       ,[a].[BudgetCode]
                       ,[a].[CalStartTime]
                       ,[a].[CalEndTime]
                       ,[a].[ConsumableDesc]
                       ,[a].[ConsumableDescShort]
                       ,[a].[CrewCode]
                       ,[a].[DestDestCode]
                       ,[a].[DestinationCode]
                       ,[a].[DumpedTimeStamp]
                       ,[a].[DumpedTruckCount]
                       ,[a].[EndTime]
                       ,[a].[EquipTypeCode]
                       ,[a].[InputComment]
                       ,[a].[InputPhoto]
                       ,[a].[InputTimeStamp]
                       ,[a].[Level]
                       ,[a].[LoadedAtCode]
                       ,[a].[LoadedTimestamp]
                       ,[a].[LoadedTruckCount]
                       ,[a].[LocnMasterSourceCode]
                       ,[a].[LocnSourceCode]
                       ,[a].[OriginalValue]
                       ,[a].[ProcessDesc]
                       ,[a].[ProjectMask]
                       ,[a].[ReasonDescription]
                       ,[a].[RevisedValue]
                       ,[a].[StartTime]
                       ,[a].[SupervisorComments]
					   ,[a].[WorkArea]
                       ,[a].[StatisticID]
                       ,[a].[TaskComments]
					   ,[a].[ReasonID]
                       ,[a].[RelatedEquipID]
                       ,[a].[PvtJn_InputGroupId]
                      , [Authorised by] = coalesce(b.[Authorised by], bb.[Authorised by]), [Batch Number] = coalesce(b.[Batch Number], bb.[Batch Number]), [Bogging Tram Distance] = coalesce(b.[Bogging Tram Distance], bb.[Bogging Tram Distance]), [BreakThrough] = coalesce(b.[BreakThrough], bb.[BreakThrough]), [Cables - TwinSingle] = coalesce(b.[Cables - TwinSingle], bb.[Cables - TwinSingle]), [Chainage] = coalesce(b.[Chainage], bb.[Chainage]), [Cut Number] = coalesce(b.[Cut Number], bb.[Cut Number]), [Diameter - Pilot] = coalesce(b.[Diameter - Pilot], bb.[Diameter - Pilot]), [Drill Plan No.] = coalesce(b.[Drill Plan No.], bb.[Drill Plan No.]), [Explosive Type] = coalesce(b.[Explosive Type], bb.[Explosive Type]), [Feedback Comments] = coalesce(b.[Feedback Comments], bb.[Feedback Comments]), [Further action - hazard] = coalesce(b.[Further action - hazard], bb.[Further action - hazard]), [HaulDistance] = coalesce(b.[HaulDistance], bb.[HaulDistance]), [Hazard Comments] = coalesce(b.[Hazard Comments], bb.[Hazard Comments]), [Hazards_Fit] = coalesce(b.[Hazards_Fit], bb.[Hazards_Fit]), [Hole ID] = coalesce(b.[Hole ID], bb.[Hole ID]), [HoleDepth] = coalesce(b.[HoleDepth], bb.[HoleDepth]), [HoleDiam] = coalesce(b.[HoleDiam], bb.[HoleDiam]), [HRS (COMP)] = coalesce(b.[HRS (COMP)], bb.[HRS (COMP)]), [HRS (ENG)] = coalesce(b.[HRS (ENG)], bb.[HRS (ENG)]), [HRS-PERC1] = coalesce(b.[HRS-PERC1], bb.[HRS-PERC1]), [HRS-PERC2] = coalesce(b.[HRS-PERC2], bb.[HRS-PERC2]), [HRS-PPACK1] = coalesce(b.[HRS-PPACK1], bb.[HRS-PPACK1]), [HRS-PPACK2] = coalesce(b.[HRS-PPACK2], bb.[HRS-PPACK2]), [Immediate action taken] = coalesce(b.[Immediate action taken], bb.[Immediate action taken]), [iplodOnly_Levels] = coalesce(b.[iplodOnly_Levels], bb.[iplodOnly_Levels]), [iplodOnly_LocnNearestEWay] = coalesce(b.[iplodOnly_LocnNearestEWay], bb.[iplodOnly_LocnNearestEWay]), [KM] = coalesce(b.[KM], bb.[KM]), [Linear Advance] = coalesce(b.[Linear Advance], bb.[Linear Advance]), [Loadwright weight empty] = coalesce(b.[Loadwright weight empty], bb.[Loadwright weight empty]), [Loadwright weight full] = coalesce(b.[Loadwright weight full], bb.[Loadwright weight full]), [placeholder] = coalesce(b.[placeholder], bb.[placeholder]), [Prestart General Comments] = coalesce(b.[Prestart General Comments], bb.[Prestart General Comments]), [Production Drilling Diameter] = coalesce(b.[Production Drilling Diameter], bb.[Production Drilling Diameter]), [Production Drilling Reason] = coalesce(b.[Production Drilling Reason], bb.[Production Drilling Reason]), [Reason for Sign Install] = coalesce(b.[Reason for Sign Install], bb.[Reason for Sign Install]), [Reason for Sign Removal] = coalesce(b.[Reason for Sign Removal], bb.[Reason for Sign Removal]), [Reasons] = coalesce(b.[Reasons], bb.[Reasons]), [Rings - text] = coalesce(b.[Rings - text], bb.[Rings - text]), [Service Task Type] = coalesce(b.[Service Task Type], bb.[Service Task Type]), [Service Tasks] = coalesce(b.[Service Tasks], bb.[Service Tasks]), [Shift Boss ID] = coalesce(b.[Shift Boss ID], bb.[Shift Boss ID]), [Shot Number] = coalesce(b.[Shot Number], bb.[Shot Number]), [Shot type (EoS or Sleeping)] = coalesce(b.[Shot type (EoS or Sleeping)], bb.[Shot type (EoS or Sleeping)]), [Shotcrete Depth] = coalesce(b.[Shotcrete Depth], bb.[Shotcrete Depth]), [Shotcrete Depth Measurement Max] = coalesce(b.[Shotcrete Depth Measurement Max], bb.[Shotcrete Depth Measurement Max]), [Shotcrete Depth Measurement Min] = coalesce(b.[Shotcrete Depth Measurement Min], bb.[Shotcrete Depth Measurement Min]), [Shotcrete Depth Probe Holes] = coalesce(b.[Shotcrete Depth Probe Holes], bb.[Shotcrete Depth Probe Holes]), [Shotcrete Incycle/Rehab] = coalesce(b.[Shotcrete Incycle/Rehab], bb.[Shotcrete Incycle/Rehab]), [Shotcrete Thickness] = coalesce(b.[Shotcrete Thickness], bb.[Shotcrete Thickness]), [Shotecrete Profile] = coalesce(b.[Shotecrete Profile], bb.[Shotecrete Profile]), [Sign Reason] = coalesce(b.[Sign Reason], bb.[Sign Reason]), [SlumpResult] = coalesce(b.[SlumpResult], bb.[SlumpResult]), [Spray Time] = coalesce(b.[Spray Time], bb.[Spray Time]), [Spraying Chemical] = coalesce(b.[Spraying Chemical], bb.[Spraying Chemical]), [SprayThickness] = coalesce(b.[SprayThickness], bb.[SprayThickness]), [Time Elapsed] = coalesce(b.[Time Elapsed], bb.[Time Elapsed]), [TimeStamp] = coalesce(b.[TimeStamp], bb.[TimeStamp]), [TruckingType] = coalesce(b.[TruckingType], bb.[TruckingType]), [Type of Sign] = coalesce(b.[Type of Sign], bb.[Type of Sign])FROM [syn_STO_ReportingSnapshot_KpiStats_All] AS a

LEFT JOIN (SELECT  ProjectId
   ,PvtJn_TaskId
   ,PvtJn_InputGroupId
    ,Pvt_FieldNames
   ,Pvt_Value = MAX(a.[AttributeValue])

  FROM
   dbo.[syn_STO_ReportingSnapshot_AttributesTable_All] AS a WITH (NOLOCK) 
  WHERE PvtJn_InputGroupId >= 0
    GROUP BY a.PvtJn_InputGroupId
          ,a.PvtJn_TaskId
          ,[a].[ProjectId]
          ,Pvt_FieldNames) AS a
PIVOT
(
MAX(Pvt_Value)
FOR Pvt_FieldNames IN (
 [Authorised by], [Batch Number], [Bogging Tram Distance], [BreakThrough], [Cables - TwinSingle], [Chainage], [Cut Number], [Diameter - Pilot], [Drill Plan No.], [Explosive Type], [Feedback Comments], [Further action - hazard], [HaulDistance], [Hazard Comments], [Hazards_Fit], [Hole ID], [HoleDepth], [HoleDiam], [HRS (COMP)], [HRS (ENG)], [HRS-PERC1], [HRS-PERC2], [HRS-PPACK1], [HRS-PPACK2], [Immediate action taken], [iplodOnly_Levels], [iplodOnly_LocnNearestEWay], [KM], [Linear Advance], [Loadwright weight empty], [Loadwright weight full], [placeholder], [Prestart General Comments], [Production Drilling Diameter], [Production Drilling Reason], [Reason for Sign Install], [Reason for Sign Removal], [Reasons], [Rings - text], [Service Task Type], [Service Tasks], [Shift Boss ID], [Shot Number], [Shot type (EoS or Sleeping)], [Shotcrete Depth], [Shotcrete Depth Measurement Max], [Shotcrete Depth Measurement Min], [Shotcrete Depth Probe Holes], [Shotcrete Incycle/Rehab], [Shotcrete Thickness], [Shotecrete Profile], [Sign Reason], [SlumpResult], [Spray Time], [Spraying Chemical], [SprayThickness], [Time Elapsed], [TimeStamp], [TruckingType], [Type of Sign])
) AS b


  ON a.PvtJn_TaskId = b.PvtJn_TaskId
    AND (a.PvtJn_InputGroupId = b.PvtJn_InputGroupId)-- OR b.PvtJn_InputGroupId = -1)  
LEFT JOIN (SELECT 
    ProjectId
   ,PvtJn_TaskId
   ,PvtJn_InputGroupId
   ,Pvt_FieldNames
   ,Pvt_Value = MAX(a.[AttributeValue])
  FROM
  dbo.[syn_STO_ReportingSnapshot_AttributesTable_All] AS a WITH (NOLOCK) 
  WHERE PvtJn_InputGroupId < 0
  GROUP BY --a.PvtSeqJoin
  a.PvtJn_TaskId
 ,a.PvtJn_InputGroupId
 ,[a].[ProjectId]
 ,Pvt_FieldNames) AS a
PIVOT
(
MAX(Pvt_Value)
FOR Pvt_FieldNames IN (
 [Authorised by], [Batch Number], [Bogging Tram Distance], [BreakThrough], [Cables - TwinSingle], [Chainage], [Cut Number], [Diameter - Pilot], [Drill Plan No.], [Explosive Type], [Feedback Comments], [Further action - hazard], [HaulDistance], [Hazard Comments], [Hazards_Fit], [Hole ID], [HoleDepth], [HoleDiam], [HRS (COMP)], [HRS (ENG)], [HRS-PERC1], [HRS-PERC2], [HRS-PPACK1], [HRS-PPACK2], [Immediate action taken], [iplodOnly_Levels], [iplodOnly_LocnNearestEWay], [KM], [Linear Advance], [Loadwright weight empty], [Loadwright weight full], [placeholder], [Prestart General Comments], [Production Drilling Diameter], [Production Drilling Reason], [Reason for Sign Install], [Reason for Sign Removal], [Reasons], [Rings - text], [Service Task Type], [Service Tasks], [Shift Boss ID], [Shot Number], [Shot type (EoS or Sleeping)], [Shotcrete Depth], [Shotcrete Depth Measurement Max], [Shotcrete Depth Measurement Min], [Shotcrete Depth Probe Holes], [Shotcrete Incycle/Rehab], [Shotcrete Thickness], [Shotecrete Profile], [Sign Reason], [SlumpResult], [Spray Time], [Spraying Chemical], [SprayThickness], [Time Elapsed], [TimeStamp], [TruckingType], [Type of Sign])
) AS bb
  ON a.PvtJn_TaskId = bb.PvtJn_TaskId
  
 WHERE a.ProjectId = 3
GO
PRINT N'Altering [dbo].[tvf_ServerDetails]'
GO

ALTER FUNCTION [dbo].[tvf_ServerDetails] (@ProjectId int)
RETURNS TABLE
AS
RETURN
(
    /*  
	Change log
	2021-05-05 ts ... create. for the purposes of identifying a database/installation.  alter this funciton when installing. 
	2021-06-11 ts ... add PrimaryProjectId
  2022-07-18 ts ... added the environment type. note, this needs to be deployed manually!!
  2022-10-24 ts .. add version to get by till flyway goes live
	DO NOT DEPLOY THIS FUNCTION INTO EXISTING LIVE ENVIRONMENTS!!!
	*/

 select 
	ServerAlias = 'manage-repo-test'  --alter this to match the url after installation of the instance
	,ServerName = (select @@servername)
	,PrimaryProjectId = 3
  ,EnvironmentType =  case when  dbo.FN_IsLocal(@ProjectId) =1 then 'LOCAL' else 'CENTRAL' end
  ,ManageVersion = 'v20221024.01'
  -- ,EnvironmentType = 'LOCAL'
	--add other server/installation variables here as needed



)
GO
PRINT N'Altering [dbo].[SP_ProjSetup_BuildCacheTablesWithMerge]'
GO
ALTER PROCEDURE [dbo].[SP_ProjSetup_BuildCacheTablesWithMerge]
-- Add the parameters for the stored procedure here
@Date DATE = NULL,
@Shift VARCHAR(2) = '',
@Type VARCHAR(25) = '',
@ProjectID INT,
@CrewID INT = 0,
@UserId INT = 0,
@Debugmode INT = 0,
@ShowTimings INT = 0
,@CacheRefreshCallPoint NVARCHAR(25) = 'TaskDetails_Manual'  --nominate where we calling from. see in the proc for options. do different things based on this.
                                                            --if adding new call points, add belwo in two spots. where we override @CacheRefreshCallPoint to ignore if not out of date
                                                              -- and where we actually proceed with the whole shebang
, @Result INT = NULL OUTPUT
, @ResultMessage VARCHAR(MAX) = NULL OUTPUT

AS
BEGIN
  /*		
  		call act reason, manually, all versions
      exec  [dbo].SP_ProjSetup_BuildCacheTablesWithMerge @ProjectID = 3, @CacheRefreshCallPoint = 'TaskDetails_Manual'
	 select * from   dbo.tbl_DBT_GetTaskDetails_ForIplod_Cached_V2 with (nolock)




      exec  [dbo].SP_ProjSetup_BuildCacheTablesWithMerge @ProjectID = 3, @CacheRefreshCallPoint = 'iplodWhatToDo',@debugmode =1

      exec  [dbo].SP_ProjSetup_BuildCacheTablesWithMerge @ProjectID = 399, @CacheRefreshCallPoint = 'ShiftSummary'

  		exec  [dbo].SP_ProjSetup_BuildCacheTablesWithMerge @ProjectID = 399, @CacheRefreshCallPoint = 'Attr_Manual'

  

  
  	2021-07-19 ts ... created for caching the attributes list.
  					
2022-09-20 ts ... CLEAN START. use merge methodology. map the call back to where we are calling from
2022-09-28 ts ... heck in v2 cache table fo ralreay done
2022-10-04 ts ... fixed web calc string vs calc string in specials
              ... add the bit out of the taskdeetails view for fixed summary proc
2022-10-05 ts ... check on updated tvf_FixedConfigs_iPlodSummaryTemplateDetails
2022-10-06 ts ... do'nt deal with app calcs, only web calcs (get calcs for app on the way out the door)
              ... try putting NULLS into some key fields (if empty)
              ... don't get the summary templates from act reason (get from fixed)
              ... how come the RowNum=1 doesnn't work on the merge! just delete it instead.
              ... don't put these in, dervie on teh way out using mapping: 
                                                  alter table dbo.tbl_DBT_GetTaskDetails_ForIplod_Cached_V2 drop column TaskDetailType 
                                                       , TaskDetailTypeId 
                                                       , TaskDetailTypeImageFileName

              ... don't do the merge if smaller than 1000 rows (something must be fucked)
              ... also bring Stat7 into the fold for the web. so we don't have to call twice to pick it up.
              ... add PageLabels
  2022-10-10  ... handling for no locnattribute setttings
              ... when bringing the summary configs, use web calc string
  2022-10-15 ... don't do duration calc (the web page handles it automatically)
  2022-10-19 ... get params for maint working. put -1 on the OrigProject same like normal special inputs.
              ... order by OrigProject asc for killing excess params
 2022-10-20 ... handling for multi-project.
            ... pull the typecsv out of teh rownum for deleting dupes (retain OrigProject) to avoid dupes coming out of params table.
2022-10-23 ts ... where did the statcalc_7's go?
              ... I killed them trying to fix CRC!! 
              ... todo: how come they were sneaking into the CRC recalcengine?





todo: if wondering why duration calcs aren't showing in summary screen on PLOD, add this:
INSERT INTO dbo.tbl_DBT_ActReasonInputLink (OperationID, ProjectID, ActReasonLinkID, TaskName, InputType, InputID, AutoValue, ExcludeFromApp, ExcludeFromWeb, InputLoop, DisplayOrder, DisplayTrap, DataTypeDisplayed, DecPlaces, LogDuration, CalcFunction, ForeLabel, AftLabel, HelpText, CompulsoryTrap, WriteZero, AllowDefault, DefaultValue, ReviewTrap, ToleranceLower, TL_Text, ToleranceUpper, TU_Text, IntolerableValue, IV_Text, Comments, ModifiedOn, Shareable, InputGroup, PlanTaskName, PlanTaskColour, PlanDefaultDuration, PlanDefaultStatValue, PlanDefaultEquipID, DisplayInputComments, Type, TrapIntolerableComment, IsInputCommentRequired, IsInputPhotoRequired, IsInputAuthRequired, ReportingBitwise) VALUES
(1, 1, 1609, 'zz_iplod_InputsForAllTasks', 'StatCalc', 7, NULL, 0, 1, NULL, 6, NULL, 'decimal', 1, NULL, 'Duration', 'Time Taken', '', '', NULL, NULL, NULL, '', 0, NULL, '', NULL, '', NULL, '', NULL, CONVERT(DATETIME, '2022-10-11 22:50:17.217', 121), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Maint,Mining,Processing,Shiftboss,MinerOrFitter', NULL, 2, 16, 128, 68)
GO



  */

  -- SET NOCOUNT ON added to prevent extra result sets from
  -- interfering with SELECT statements.
  SET NOCOUNT ON;

  --check on temp tables:
  IF OBJECT_ID('tempdb..#allinputs') IS NOT NULL   drop TABLE #allinputs;
 IF OBJECT_ID('tempdb..#inputsprep') IS NOT NULL  drop table  #inputsprep;
IF OBJECT_ID('tempdb..#cte_ActiveARs') IS NOT NULL   DROP TABLE #cte_ActiveARs;
 IF OBJECT_ID('tempdb..#tdformerge') IS NOT NULL  drop table #tdformerge;

DECLARE @PrimaryDbName nvarchar(50) = (SELECT tmsd.PrimaryDbName FROM master.dbo.tvf_MasterServerDetails(@Projectid) AS tmsd )

                                                DECLARE @OperationID INT;
                                                set @OperationID =
                                                (
                                                    select OperationID from tbl_DBT_Project WITH (NOLOCK) where ProjectID = @Projectid
                                                );
  DECLARE @ReturnAsTable INT;
  IF (@Result IS NULL)
    SET @ReturnAsTable = 1

--Find whether certain caches are old. 
 DECLARE  @NewestTaskDetailsSourceData datetime = (SELECT
                  MAX(ModOn)
                FROM (SELECT
                    modOn = MAX(ModifiedOn)
                  FROM dbo.tbl_DBT_ActReasonInputLink
                  WHERE ProjectID IN (@projectId, 1)
                  UNION ALL
                  SELECT
                    modOn = MAX(ModifiedOn)
                  FROM dbo.tbl_DBT_ParameterSetup
                  WHERE ProjectID IN (@projectId, 1)
                  UNION ALL
                  SELECT
                    modOn = MAX(ModifiedOn)
                  FROM dbo.tbl_SYS_Questions AS tsq
                 -- WHERE ProjectID IN (@projectId, 1)
                  UNION ALL 
                  SELECT
                    modOn = MAX(ModifiedOn)
                  FROM dbo.tbl_SYS_QuestionCategories  AS tsq
                 -- WHERE ProjectID IN (@projectId, 1)
                  UNION ALL 
                  SELECT
                    modOn = MAX(modify_date)
                  FROM sys.objects
                  WHERE name IN ('SP_API_IPLODSetup_Inputs', 'udf_GetTaskDetails_ForIplod', 'udf_GetCalcFunctions_ForIplod','SP_ProjSetup_BuildCacheTablesWithMerge','tvf_FixedConfigs_iPlodSummaryTemplateDetails')) AS tbl);
            
            DECLARE @LatestAppTaskBuildDAte DATETIME =(SELECT MAX (dte) FROM ( select dte = MAX(DAteCreated) FROM tbl_DBT_GetTaskDetails_ForIplod_Cached_v2 where projectid = @projectid
														UNION ALL 
														select dte = MAX(DateUpdated) FROM tbl_DBT_GetTaskDetails_ForIplod_Cached_v2 where projectid = @projectid
																			) AS tbl)
      
      declare @AppTaskDAtaNeedsBuilding int = case WHEN  isnull(@NewestTaskDetailsSourceData,getdate()) <  isnull(@LatestAppTaskBuildDAte,0) THEN 0
                                              ELSE 1 end

--does teh attribute cache need rebiulding?
 DECLARE  @NewestSourceDataAttr datetime = (SELECT
                  MAX(ModOn)
                FROM (SELECT
                    modOn = MAX(ModifiedOn)
                  FROM dbo.tbl_SYS_Attribute AS tsa
                  
                  UNION ALL
                  SELECT
                    modOn = MAX(ModifiedOn)
                  FROM dbo.tbl_SYS_AttributeType AS tsat
                  

                  UNION ALL 
                  SELECT
                    modOn = MAX(modify_date)
                  FROM sys.objects
                  WHERE name IN ('view_GetAttributes_LIVE')) AS tbl);
            
            DECLARE @LatestBuildDAteAttr DATETIME = (select max(ModifiedOn) FROM dbo.view_GetAttributes_Cached AS vgac where projectid = @projectid)
                    
                    declare @AttrNeedsBuilding int = case WHEN  isnull(@NewestSourceDataAttr,getdate()) >  isnull(@LatestBuildDAteAttr,0) /*AND @buildAttributesCacheLite =1*/ THEN 1
                                                            ELSE 0 end                                                    

--over-ride some things based on cache not out of date
SET @CacheRefreshCallPoint = case WHEN @CacheRefreshCallPoint in( 'iplodWhatToDo','PageLabels') AND  @AppTaskDAtaNeedsBuilding =0 THEN 'CacheIsAlreadyGood'
                                  WHEN @CacheRefreshCallPoint LIKE 'TaskDetails%' THEN 'TaskDetails'
                                  ELSE @CacheRefreshCallPoint end




--need some more things

  DECLARE @AR_GetINputForAllTasks INT = (SELECT TOP 1
      ISNULL(ActReasonID, 0)
    FROM dbo.tbl_DBT_ActReasonSpecialHandlingLink WITH (NOLOCK)
    WHERE AR_GroupingName = 'ARWithInputsForAlliPlodTasks'
    AND Active = 1);




IF @Debugmode=1 SELECT '@CacheRefreshCallPoint'=@CacheRefreshCallPoint,'@AppTaskDAtaNeedsBuilding'=@AppTaskDAtaNeedsBuilding,
'@LatestAppTaskBuildDAte'=@LatestAppTaskBuildDAte,'@NewestTaskDetailsSourceData'=@NewestTaskDetailsSourceData;

--start doing the jam

  DECLARE @TranCount INT;
  SET @TranCount = @@trancount;

  BEGIN TRY

    --SET TRANSACTION ISOLATION LEVEL SERIALIZABLE; --old mate on the internet reckoned this was needed?
    IF @TranCount = 0
      BEGIN TRANSACTION
    ELSE
      SAVE TRANSACTION SP_PS_BuildCacheTablesWithMerge;


/***********
do the work.
**************/

        
IF @CacheRefreshCallPoint IN ( 'iplodWhatToDo','TaskDetails','PageLabels' ) --add other ones what need to run this section


--todo: this needs fixing:
/*
SELECT tdaril.ActReasonInputLinkID,tdps.ParamSU_ID FROM dbo.tbl_DBT_ParameterSetup AS tdps
inner JOIN dbo.tbl_DBT_ActReasonInputLink AS tdaril
ON tdaril.ActReasonInputLinkID = tdps.ParamSU_ID
select * from dbo.udf_GetTaskDetails_ForIplod(3, '', 99, 0) 
*/


BEGIN  --MERGE ONLYFORAPP TASK DETAISL:
                                             If @Debugmode = 1 SELECT 'startTaskDetails'=getdate()
                                           -- DECLARE @Projectid INT = 3, @Operationid int = 83 ,@type NVARCHAR(15) = '',@debugMode int = 1, @OnlyForApp int = 99
                                           --put it into a temp table so I can kill dupes:
                                          
                                              --rip the guts out of that stupid function and put it in here:
        --START PREPPING FOR TASK DETAILS
										DECLARE @ShowzzDummyLocnInIplod INT = CAST(ISNULL(dbo.FN_GetConfigValue(@ProjectID, 'ShowzzDummyLocnInIplod'), 0) AS INT)

												  DECLARE @AR_FixedParamsForAllTasks TABLE (
													ActivityReasonId INT    --make better config for this back into a table somewhere
												   ,Type NVARCHAR(25) NULL
												   ,IsServiceSheet INT NULL
												  )
												  INSERT INTO @AR_FixedParamsForAllTasks (ActivityReasonId
												  , Type
												  , IsServiceSheet)
													VALUES (1770 -- ActivityReasonId - int
													, N'Maint' -- Type - nvarchar(25)
													, 1)
													--, (1770  --don't think this is needed anymore ? we are doing based on IsServiceSheet across both maint and service sheets
													--,'ServiceSheets'
													--,1)
													, (1771, 'Maint', 0)

												  DECLARE @IsFixedParams4Maint INT = 1
												  --declare @IsFixedParams4SrvcSheets  int  = 1

												  -- Get config.
												  DECLARE @AttrLocn_1Method AS NVARCHAR(35);
												  DECLARE @AttrLocn_2Method AS NVARCHAR(35);
												  DECLARE @AttrLocn_3Method AS NVARCHAR(35);
												  SELECT
													@AttrLocn_1Method = isnull(AttrLocn_1Method,'AttrList')  --2022-10-10
												   ,@AttrLocn_2Method = isnull(AttrLocn_2Method,'AttrList')
												   ,@AttrLocn_3Method = isnull(AttrLocn_3Method,'AttrList')

												  FROM dbo.[udfLocnAttrMethods](@OperationID, @Projectid, '');  --2020-04-27

												  DECLARE @TwiAlias NVARCHAR(25) = dbo.FN_TWIAlias(@Projectid);
												  --from dbo.udfConfigConstants(@OperationID, @Projectid, '');

												  --these are act reasons activated on @Project
												  --;WITH cte_ActiveARs 
												  --AS (
												  CREATE TABLE  #cte_ActiveARs  (
													ActivityReasonId INT
												   ,ActivityID INT NULL
												   ,IsSpecialTemplate INT NULL
												   ,CombinedHaulRoute INT NULL
												   ,IsServiceSheet INT NULL
												   ,Type NVARCHAR(100) COLLATE DATABASE_DEFAULT NULL 
													--,ActivityID int null
												   ,ReasonID INT NULL
												   ,ProcessID INT NULL
   
												  )
												  INSERT INTO #cte_ActiveARs (ActivityReasonId
												  , ActivityID
												  , IsSpecialTemplate
												  , CombinedHaulRoute
												  , IsServiceSheet
												  , Type
												  --,ActivityID
												  , ReasonID
												  , ProcessID)

													SELECT DISTINCT
													  ActivityReasonId = ActReasonLinkID
													  --added these two for filtering out the extra input joins at the bottom of this function
													 ,arl.ActivityID
													 ,IsSpecialTemplate = ISNULL(arsh.ActReasonID, 0)
													 ,CombinedHaulRoute = ISNULL(haul.ActReasonID, 0)
													 ,IsServiceSheet = IIF(srcv.ActReasonID IS NULL, 0, 1)  --All service sheets regardles of @Type should be treated the same. if not servicesheet, then also treated teh same (regardless of ACtivty)
													 ,a.Type
													  --,arl.ActivityID
													 ,arl.ReasonID
													 ,arl.ProcessID
													--INTO #cte_ActiveARs
													FROM dbo.tbl_DBT_ActReasonInputLink AS a WITH (NOLOCK)
													INNER JOIN dbo.tbl_SYS_ActivityReasonLink AS arl WITH (NOLOCK)
													  ON a.ActReasonLinkID = arl.ActivityreasonLinkID
													LEFT JOIN dbo.tbl_DBT_ActReasonSpecialHandlingLink AS arsh WITH (NOLOCK)
													  ON a.ActReasonLinkID = arsh.ActReasonID
														AND arsh.AR_GroupingType = 'SpecialiPLODTemplates'
														AND arsh.ProjectID = 1
													LEFT JOIN dbo.tbl_DBT_ActReasonSpecialHandlingLink AS srcv WITH (NOLOCK)
													  ON a.ActReasonLinkID = srcv.ActReasonID
														AND srcv.AR_GroupingName = 'AR_ServiceSheets'
														AND srcv.ProjectID = 1
													LEFT JOIN dbo.tbl_DBT_ActReasonSpecialHandlingLink AS haul WITH (NOLOCK)
													  ON a.ActReasonLinkID = haul.ActReasonID
														AND haul.AR_GroupingName = 'CombinedHaulRoute'
														AND haul.ProjectID = 1

													WHERE InputType LIKE 'Stat%'
													AND InputID = 7 --duration input added indicates active task
													AND a.ProjectID = @Projectid
      --START DOING MORE PREP
												   SELECT
												  ActivityReasonId = ActReasonLinkID
												 ,InputType
												 ,InputID
												 ,ari.ProjectID
												 ,OrigProject = ProjectId
												 ,PartitionMethod = dbo.FN_IsNullorEmpty(PartitionMethod, 'normal')
												 ,RowNum_Project_Input = --get inputs from Project1, allowed to customise by adding inputs to individual project
												  ROW_NUMBER() OVER (PARTITION BY ActReasonLinkID
												  -- , ari.ProjectID
												  , InputType
												  , InputID
												  ORDER BY ActReasonLinkID
												  , ari.ProjectID DESC--2020-09-15. switch this. if adding a field to @Project, then this should over-ride same input on Project1  ASC
												  , InputType
												  , InputID
												  , ActReasonInputLinkID
												  )

												 ,RowNum_Project = --get inputs from Project1, not allowed any customisation 
												  CASE
													WHEN ari.ProjectID = 1 THEN ActReasonLinkID
													ELSE 0
												  END --ROW_NUMBER() OVER (PARTITION BY ActReasonLinkID,ProjectID , InputType, InputId ORDER BY ActReasonLinkID,ProjectID ASC, InputType, InputId,ActReasonInputLinkId )

												 ,RowNum_Input_Project =  --get inputs from normal project, allowed to add input to Project2 that will apply to all projects
												  ROW_NUMBER() OVER (PARTITION BY ActReasonLinkID
												  , InputType
												  , InputID
												  ORDER BY ActReasonLinkID
												  , InputType
												  , InputID
												  , ari.ProjectID ASC --2020-09-15 swtich this. if adding an input to Project2, then this input should over-rule the same input on @Project DESC
												  , ActReasonInputLinkID
												  )
												  INTO #allinputs
												FROM tbl_DBT_ActReasonInputLink AS ari WITH (NOLOCK)
												LEFT JOIN (SELECT DISTINCT
													ActReasonID
												   ,PartitionMethod
												  FROM dbo.tbl_DBT_ActReasonSpecialHandlingLink WITH (NOLOCK)
												  WHERE ProjectID = 1
												  AND AR_GroupingName <> 'AR_TWIs'
												  OR (
												  AR_GroupingName = 'AR_TWIs'
												  AND @TwiAlias = 'TWI'
												  ) --get TWI stuff from Project1 as long as TWIs arent aliased on this project
												) AS ars
												  ON ari.ActReasonLinkID = ars.ActReasonID
												WHERE ari.ProjectID IN (1, @Projectid, 2)
												--2022-10-07 AND NOT (ari.InputType = 'Stat'
											        --	AND ari.InputID = 7) -- 2019-02-26
												AND NOT (ari.InputType = 'Stat'
												AND ari.InputID = 86) -- 2020-04-16
											  --2022-07-13 AND (ari.ActReasonLinkID = @ActReasonId OR @ActReasonId =0)
  
											  IF @ShowTimings =1 SELECT '#InputsINserted'=GETDATE();

											  IF @DebugMode =1 SELECT * FROM #allinputs;
  
											  CREATE INDEX xx#allinputsXXbalh ON #allinputs (ProjectID,ActivityReasonId,InputType,InputID) INCLUDE (PartitionMethod,	RowNum_Project_Input,	RowNum_Project,	RowNum_Input_Project)
											 --update the stats (becuase #table query stats may be remembered from prior runs!
											 UPDATE STATISTICS #allinputs
											  UPDATE STATISTICS #cte_ActiveARs
											 --todo reomve the 1=2e
											 --todo shift handling for all @OnlyForApps in this!!!

											 IF @ShowTimings =1 SELECT '#InputsIndexDone'=GETDATE();

											--create the table so it forms the same way every time
											create table #INputsPrep  (
											  RowId INT NULL
											 ,[ProjectID] INT NULL
											 ,[OperationID] INT NULL
											 ,[ActReasonID] INT NULL
											 --,TaskDetailType [NVARCHAR](50) COLLATE DATABASE_DEFAULT    NOT NULL
											 --,TaskDetailTypeId [INT] NOT NULL
											 --,TaskDetailTypeImageFileName [NVARCHAR](100)  COLLATE DATABASE_DEFAULT   NOT NULL
											 --,Active INT NOT NULL
											 ,[InputType] VARCHAR(250) COLLATE DATABASE_DEFAULT NULL 
											 ,[FieldType] VARCHAR(250) COLLATE DATABASE_DEFAULT NULL 
											 ,[InputID] INT NULL
											 ,[HelpText] VARCHAR(MAX) COLLATE DATABASE_DEFAULT NULL 
											 ,[DisplayOrder] INT NULL
											 ,[DisplayTrap] INT NULL
											 ,[DataTypeDisplayed] [VARCHAR](250) COLLATE DATABASE_DEFAULT NULL 
											 ,[DecPlaces] [INT] NULL
											 ,TimeStampThisInput INT NULL
											-- ,[CalcString] [VARCHAR](2500) COLLATE DATABASE_DEFAULT NULL 
											 ,[ForeLabel] [VARCHAR](MAX) COLLATE DATABASE_DEFAULT NULL 
											 ,[AftLabel] [VARCHAR](250) COLLATE DATABASE_DEFAULT NOT NULL 
											 ,[CompulsoryTrap] [INT] NULL
											 ,[DefaultValue] [VARCHAR](250) COLLATE DATABASE_DEFAULT NULL 
											 ,[ReviewTrap] [INT] NULL
											 ,[IntolerableValues] [VARCHAR](50) COLLATE DATABASE_DEFAULT NULL 
											 ,[InitialValidationMsg] [VARCHAR](MAX) COLLATE DATABASE_DEFAULT NULL 
											 ,[FinalValidationMsg] [VARCHAR](MAX) COLLATE DATABASE_DEFAULT NULL 
											 ,[InputListSelectionFilter] [VARCHAR](MAX) COLLATE DATABASE_DEFAULT NULL 
											 ,[Shareable] [VARCHAR](10) COLLATE DATABASE_DEFAULT NULL 
											 ,[InputGroup] [VARCHAR](50) COLLATE DATABASE_DEFAULT NULL 
											 ,[SummaryGroup] INT NULL
											 ,[DisplayInputComments] [INT] NULL
											 ,[TypeCsvOld] [VARCHAR](100) COLLATE DATABASE_DEFAULT NULL 
											 ,[TypeIdsCsv] [VARCHAR](100) COLLATE DATABASE_DEFAULT NULL 
											 ,[TrapIntolerableComment] [INT] NULL
											 ,[IsInputCommentRequired] [INT] NULL
											 ,[IsInputPhotoRequired] [INT] NULL
											 ,[IsInputAuthRequired] [INT] NULL
											 ,[KeepOnCopy] [INT] NULL
											 ,[ModifiedOn] [DATETIME] NOT NULL
											 ,Param1 VARCHAR(50) COLLATE DATABASE_DEFAULT NULL 
											 ,Param2 VARCHAR(50) COLLATE DATABASE_DEFAULT NULL 
											 ,Param3 VARCHAR(50) COLLATE DATABASE_DEFAULT NULL 
											 ,Param4 VARCHAR(35) COLLATE DATABASE_DEFAULT NULL 
											 ,WebCalcString [VARCHAR](250) COLLATE DATABASE_DEFAULT NULL 
											 ,AttrJson [NVARCHAR](MAX) COLLATE DATABASE_DEFAULT NULL 
											 ,SupportedVersion INT NULL
											 ,AdditionalRegex NVARCHAR(500)  COLLATE DATABASE_DEFAULT 
											 ,td_ReportingBitWise INT NULL
											 ,ToleranceLower DEC(18, 6) NULL
											 ,TL_Text VARCHAR(MAX)COLLATE DATABASE_DEFAULT NULL  
											 ,ToleranceUpper DEC(18, 6) NULL
											 ,TU_Text VARCHAR(MAX)COLLATE DATABASE_DEFAULT NULL  
											 ,td_ActivityID INT NULL
											 ,td_ReasonID INT NULL
											 ,td_ProcessID INT null
											  , ExcludeFromApp int null
											  , ExcludeFromWeb int NULL
                                              ,OrigProject INT null
                                              ,DeploymentModeCsv varchar(250) null
											)

	--START DOING THE POPULATING OF TASK DETAILS
										INSERT INTO #inputsprep 
																	([RowId],
																	[ActReasonID],
																	[InputType],
																	[FieldType],
																	[InputID],
																	[HelpText],
																	[DisplayOrder],
																	[DisplayTrap],
																	[DataTypeDisplayed],
																	[DecPlaces],
																	[TimeStampThisInput],
																--	[CalcString],
																	[ForeLabel],
																	[AftLabel],
																	[CompulsoryTrap],
																	[DefaultValue],
																	[ReviewTrap],
																	[IntolerableValues],
																	[InitialValidationMsg],
																	[FinalValidationMsg],
																	[InputListSelectionFilter],
																	[Shareable],
																	[InputGroup],
																	[SummaryGroup],
																	[DisplayInputComments],
																	[TypeCsvOld],
																	[TypeIdsCsv],
																	[TrapIntolerableComment],
																	[IsInputCommentRequired],
																	[IsInputPhotoRequired],
																	[IsInputAuthRequired],
																	[KeepOnCopy],
																	[ModifiedOn],
																	[Param1],
																	[Param2],
																	[Param3],
																	[Param4],
																	[WebCalcString],
																	[AttrJson],
																	[SupportedVersion],
																	[AdditionalRegex],
																	[td_ReportingBitWise],
																	[ToleranceLower],
																	[TL_Text],
																	[ToleranceUpper],
																	[TU_Text],
																	[td_ActivityID],
																	[td_ReasonID],
																	[td_ProcessID]
													  , ExcludeFromApp 
													   , ExcludeFromWeb 
													   ,OrigProject,DeploymentModeCsv)
									 --these are unique set of inputs, filtered depending on PartitionMethod from above.  some global handling in this set for transitioning to new iplod
										  SELECT
											RowId = ActReasonInputLinkID
										   ,[ActReasonID] = [ActReasonLinkID]
										   ,InputType =
                											CASE --leave the input type handling here because this Function is used to cull ARs that do not have any inputs
                											  /*******
                																InputType is converted to something meaningful for app here.  however "Fieldtype" is mapped to WebInputytpe in the mapping table, and is used when importing back to staging table.
                														 *********/
                											  WHEN ari.InputType = 'AttrLocn_1' THEN @AttrLocn_1Method
                											  WHEN ari.InputType = 'AttrLocn_2' THEN @AttrLocn_2Method
                											  WHEN ari.InputType = 'AttrLocn_3' THEN @AttrLocn_3Method
                											  WHEN
                												(
                												ari.InputType = 'Stat' AND
                												ari.InputID = 17
                												) THEN 'TrkCount'  --this is the input for adding timestamped truck loads.  will give us back the LogDuration Field. can push back to a flag field and use on other inputs if needed 
                											  WHEN
                												(
                												ari.InputType = 'Stat' AND
                												ari.InputID = 15
                												) THEN 'TimeStamp' --this is timestamp statistic, converts to 4 digit 24hr format
                											  --WHEN @OnlyForApp = 0 AND
                											   -- ari.InputType LIKE '%InGroup%' THEN 'Parameter'
                											  ELSE ISNULL(ari.InputType, 'no map for input type')
                											END
										   ,FieldType =
            											CASE
            											  WHEN --don't need this! @OnlyForApp IN (0, 1) AND
            												ari.InputType LIKE '%InGroup%' THEN REPLACE(ari.InputType, 'InGroup', '')
            											  ELSE ari.InputType     --this is for putting correct input type back on upload to server (needs to be on the JSON uploaded)
            											END                -- General.

										   ,InputID =
          											CASE
          											  WHEN --don't need this! @OnlyForApp IN (0, 1) AND
          												ari.InputType LIKE '%InGroup%' THEN 1
          											  ELSE ari.InputID
          											END
          											/*case
          																when ari.InputType like 'Attr%' then
          																	ari.InputID * -1
          																else
          																	ari.InputID
          															end  */             --change the attribute inputIDs to -ve so as to avoid confusion to stats or others
          											--alternative method for bringing bog stats back to server (if we decide not to keep the InputType alias field --CASE WHEN  InputType Like '%bog%' THEN cast(Left(inputtype,1)+substring(inputtype,3,1)as int)  ELSE InputID END--get both bog to and bog from IDs out of the INputType name and join together into the ID so the INputIDs are unique.  need to subsitute back in ID=16 when uploading to server
										   ,HelpText = ISNULL(Q.QHelpText, ari.HelpText) /*case
																			 when ari.InputType like 'Q%' then
																				 Q.QHelpText
																			 else
																				 ari.HelpText
																		 end  */ --2019-09-18  already mapped the questions on the join, safe to use IsNULL           --should include this in the mapping table?
										   ,DisplayOrder = DisplayOrder * 100 --force inputs below parameters
										   ,DisplayTrap                                  --display the input
										   ,DataTypeDisplayed = CONVERT(NVARCHAR(255),
											CASE
											  WHEN
												(
												ari.InputType = 'Stat' AND
												ari.InputID = 17
												) THEN 'TrkCount'
											  ELSE ISNULL(Q.AnswerType, CAST(ari.DataTypeDisplayed AS VARCHAR))
											END)
											/*CASE   --2019-04-30 
																  when ari.InputType like 'Q%' then
																	  isnull(Q.AnswerType, '')
																  else
																	  cast(ari.DataTypeDisplayed as varchar)
															  end */                   --data type for user input
										   ,DecPlaces                                    --decimal places, could be combined into new datatypedisplayed format (eg DECIMAL(5,2)
										   ,TimeStampThisInput = LogDuration       --for making timestamp on the input saved
										  /* ,CalcString =
                          											CASE
                          											  WHEN --don't need this! @OnlyForApp IN (0, 1) AND
                          												ari.InputType LIKE '%InGroup%' THEN CASE
                          												  WHEN ari.InputType = 'locationInGroup' THEN ' ?'
                          													+ '((UIGroupGroupDetailFilterCsv LIKE ' + CHAR(39) + '%{Location_1|||LocnParam1}%' + CHAR(39) + ') '  --blank in param1 field will result in all active locns
                          													+ ' OR (UIGroupGroupDetailFilterCsv LIKE ' + CHAR(39) + '%{Location_1|||LocnParam2}%' + CHAR(39) + ') '  --2021-04-19, don't put commas here, they are already included in LocnParam values in teh attrJson beloew
                          													+ ' OR (UIGroupGroupDetailFilterCsv LIKE ' + CHAR(39) + '%{Location_1|||LocnParam3}%' + CHAR(39) + ') '
                          													+ ') '
                          												  WHEN ari.inputtype = 'MaterialInGroup' THEN ' ?'
                          													+ '((UIGroupGroupDetailFilterCsv LIKE ' + CHAR(39) + '%{Material_1|||MatParam1}%' + CHAR(39) + ') '  --blank in param1 field will result in all active locns
                          													+ ' OR (UIGroupGroupDetailFilterCsv LIKE ' + CHAR(39) + '%{Material_1|||MatParam2}%' + CHAR(39) + ') '  --2021-04-19, don't put commas here, they are already included in LocnParam values in teh attrJson beloew
                          													+ ' OR (UIGroupGroupDetailFilterCsv LIKE ' + CHAR(39) + '%{Material_1|||MatParam3}%' + CHAR(39) + ') '
                          													+ ') '
                          												--SELECT * FROM [dbo].[udf_GetCalcFunctions_ForIplod](194,'get_all')
                          												END
                          
                          											  ELSE
                          
                          												/*IIF(LEFT(ISNULL(calcfn.AppCalcFunction,''),2) LIKE '%=%' OR LEFT(ISNULL(calcfn.AppCalcFunction,''),2) LIKE '%*%' OR LEFT(ISNULL(calcfn.AppCalcFunction,''),2) LIKE '%#%'
                          																							,replace ( replace (REPLACE(calcfn.AppCalcFunction,'=','=ROUND(') ,'*','*ROUND('),'#','#ROUND(')
                          																				  + ','+CAST(ISNULL(ari.DecPlaces,0) AS nvarchar)	+')'	--2020-8-08
                          																					--otherwise:
                          																					,ISNULL(calcfn.AppCalcFunction,''))
                          																					--,'') --CalcFunction      --need mapping table for web calc function names vs iplod calc strings.
                          															*/
                          												calcfn.AppCalcFunction
                          
                          											END*/
										   ,ForeLabel = ISNULL(Q.QuestionText, ForeLabel) /*case
																 when ari.InputType like 'Q%' then
																	 Q.QuestionText
																 else
																	 ForeLabel
															 end    */           --should include this in the mapping table?
										   ,AftLabel
										   ,CompulsoryTrap                               --is input compulsory? notify user
										   ,DefaultValue = IIF(AllowDefault = 1, DefaultValue, '') --only send value if allowed                              --existing value to load input with ...  is over-ridden by [DefaultString] if applicable
										   ,ReviewTrap
										   ,IntolerableValues = ISNULL(Q.IntolerableValue, CAST(ISNULL(ari.IntolerableValue, '') AS VARCHAR))
											/*case
																  when ari.InputType like 'Q%' then
																	  isnull(Q.IntolerableValue, '')
																  else
																	  cast(ari.IntolerableValue as varchar)
															  end*/
										   ,InitialValidationMsg = --ISNULL(Qparam.NotificationText, HelpText)         --need new field for this? currently borrowed into here
											CASE
											  WHEN ari.InputType LIKE 'Q%' AND
												Qparam.Category IS NULL THEN ISNULL(Q.NotificationText, '') ----if not mapped to question category, then get the notification text from question table.
											  WHEN ari.InputType LIKE 'Q%' AND
												Qparam.Category IS NOT NULL THEN COALESCE(NULLIF(Qparam.NotificationText, ''), NULLIF(q.NotificationText, ''), '')  --2020-06-26 get from qparam, unless null or ''--otherwise get from question category
											  --ELSE ari.HelpText  --need new field for this? currently borrowed into here
											  ELSE ISNULL(ari.[IV_Text], '')  --2020-04-23 ... grab this field for initial validation. final validation causes valid intolerable and will show review screen on device
											--SELECT * FROM dbo.tbl_DBT_ActReasonInputLink
											END
										   ,FinalValidationMsg =
											CASE
											  WHEN ari.InputType LIKE 'Q%' AND
												Qparam.Category IS NOT NULL THEN ISNULL(Qparam.FinalNotificationText, '')  --final nofification not available on question table yet if mapped to question category, then get from there.
											  --removed 2020-04-23 , FinalValidationMsg triggers teh review screen (valid intolerable) WHEN ari.InputType LIKE 'Q%' AND Qparam.Category IS  NULL THEN ISNULL(Q.NotificationText, '')    --if not mapped to question category, then get the notification text from question table.
											  -- dbo.FN_IsNullorEmpty(Qparam.FinalNotificationText,isnull(Q.NotificationText, ''))  --2020-03-06
											  WHEN ari.InputType LIKE 'Q%' AND
												Qparam.Category IS NULL THEN ''
											  ELSE  --SELECT * FROM dbo.tbl_SYS_Questions
												--SELECT * FROM dbo.tbl_SYS_QuestionCategories												
												--ISNULL(ari.[IV_Text], '')
												''  --mostly don't use the final validation message for non-questions ... if we need to will add a new field?
											END
										   ,InputListSelectionFilter = ''                --could put name of table to query in here?
										   ,Shareable                                    --not used for data entry, used for returning summary stats
										   ,InputGroup                                   --for putting inputs together in a group cycle that can be repeated
										   ,SummaryGroup =
											CASE
											  WHEN --don't need this! @OnlyForApp IN (0, 1) AND
												ari.InputType LIKE '%InGroup%' THEN 1
											  ELSE 0
											END
										   ,DisplayInputComments                         --whether to display comment box as well as input so user can add comments against an input.

										   ,TypeCsvOld = ari.[Type]            --need to convert these to integer string
										   ,TypeIdsCsv = '' /* don't do this twice, had to take it to the top to use @DeploymentMode ISNULL((
																	SELECT DISTINCT
																		   ',' + CONVERT(nvarchar(50), TypeID)
																	FROM dbo.udfSplit([Type], ',')  AS CSV
																		INNER JOIN dbo.tbl_SYS_Type AS LookT
																			ON CSV.Item = LookT.TypeCode
																	FOR XML PATH('')
																) + ','
															  , ''

														   )*/
											--this is the handling if user selects Intolerable value
										   ,[TrapIntolerableComment] = COALESCE(NULLIF(Qparam.IntolerableBitWise, ''), NULLIF(q.IntolerableBitWise, ''), TrapIntolerableComment)
											--ISNULL(qparam.IntolerableBitWise, [TrapIntolerableComment])


											--these are regardless of user answer
										   ,[IsInputCommentRequired] = ISNULL(qparam.[IsInputCommentRequired], ari.[IsInputCommentRequired])
										   ,[IsInputPhotoRequired] = ISNULL(qparam.[IsInputPhotoRequired], ari.[IsInputPhotoRequired])
										   ,[IsInputAuthRequired] = ISNULL(qparam.[IsInputAuthRequired], ari.[IsInputAuthRequired])
										   ,KeepOnCopy = 0
										   ,ari.ModifiedOn                               --should combine with questions?
										   ,Param1 =
											CASE
											  WHEN --don't need this! @OnlyForApp IN (0, 1) AND
												ari.InputType LIKE '%InGroup%' THEN 'Development'
											  ELSE ''
											END
										   ,Param2 =
											CASE
											  WHEN --don't need this! @OnlyForApp IN (0, 1) AND
												ari.InputType LIKE '%InGroup%' THEN 'Production'
											  ELSE ''
											END
										   ,Param3 = ''
										   ,Param4 = ''
										   ,WebCalcString = CalcFunction --for mapping back to the web
										   ,AttrJson =''/*=removed from here, put into the view
											CASE
											  WHEN --don't need this! @OnlyForApp IN (0, 1) AND
												ari.InputType LIKE '%InGroup%' THEN CASE
												  WHEN ari.InputType = 'locationinGroup' -- and isnull(DBT.Param1,'') <> '' --if the first one is blank, then assume "AllActive"
												  THEN '[{"Key":"LocnParam1","Value":",Production,"}'
													+ ',{"Key":"LocnParam2","Value":",Development,"}'
													--+ iif(isnull(param1,'') <> '' , ',{"Key":"LocnParam2","Value":",'+ isnull(Param2,'') + ',"}','')
													--+ iif(isnull(Param3,'') <> '' , ',{"Key":"LocnParam3","Value":",'+ isnull(Param3,'') + ',"}','')				


													+ ']'
												  WHEN ari.InputType = 'MaterialInGroup' -- and isnull(DBT.Param1,'') <> '' --if the first one is blank, then assume "AllActive"
												  THEN '[{"Key":"MatParam1","Value":",Production,"}'
													+ ',{"Key":"MatParam2","Value":",Development,"}'
													--	+ iif(isnull(Param2,'') <> '' , ',{"Key":"MatParam2","Value":",'+ isnull(Param2,'') + ',"}','')
													--	+ iif(isnull(Param3,'') <> '' , ',{"Key":"MatParam3","Value":",'+ isnull(Param3,'') + ',"}','')				


													+ ']'
												  ELSE ''
												END
											  ELSE ISNULL(calcfn.AttrJSON, '')
											END*/




										   ,SupportedVersion =0-- ISNULL(calcfn.MinVersionSupported, 0) --defo supported if null!
										   ,Qparam.AdditionalRegex
										   ,td_ReportingBitWise = ari.ReportingBitwise
										   ,ToleranceLower = IIF(ari.InputType LIKE 'Q%' OR ari.InputType = 'pagebreak', NULL, ToleranceLower)  --2021-04-27 
										   ,TL_Text = IIF(ari.InputType LIKE 'Q%' OR ari.InputType = 'pagebreak', NULL, TL_Text)
										   ,ToleranceUpper = IIF(ari.InputType LIKE 'Q%' OR ari.InputType = 'pagebreak', NULL, ToleranceUpper)
										   ,TU_Text = IIF(ari.InputType LIKE 'Q%' OR ari.InputType = 'pagebreak', NULL, TU_Text)
										   ,td_ActivityID=actar.ActivityID
										   ,td_ReasonID =actar.ReasonID
										   ,td_ProcessID =actar.ProcessID
										   , ari.ExcludeFromApp 
													   , ari.ExcludeFromWeb 
													   ,ai.OrigProject
                             ,DeploymentModeCsv = null
										--INTO #inputsprep
										  FROM dbo.tbl_DBT_ActReasonInputLink AS ari WITH (NOLOCK)
										  INNER JOIN #cte_ActiveARs AS actar
											ON actar.ActivityReasonId = ari.[ActReasonLinkID]
										  INNER JOIN #allinputs AS ai
											ON ari.ProjectID = ai.ProjectID
											AND ari.InputType = ai.InputType
											AND ari.InputID = ai.InputID
											AND ari.ActReasonLinkID = ai.ActivityReasonId
										  LEFT JOIN dbo.tbl_SYS_Questions AS Q WITH (NOLOCK)
											ON ari.InputID = Q.QuestionID
											AND ari.InputType LIKE 'Q%'
										  LEFT OUTER JOIN (SELECT
											  *
											FROM [dbo].[udf_GetQuestionDetails](@ProjectID, @Type)) AS Qparam
											ON q.Category = Qparam.category
										 -- OUTER APPLY dbo.udf_GetCalcFunctions_ForIplod(@projectid, ari.CalcFunction) AS calcfn
										  WHERE (
										  (
										  PartitionMethod = 'normal'
										  AND ari.ProjectID = @Projectid
										  )
										  OR (
										  PartitionMethod = 'AR_Project'
										  AND ari.ProjectID = 1
										  ) --just filter on proj1 here ... don't need the RowNum?
										  OR
										  (
										  PartitionMethod = 'AR_Project_Input'
										  AND RowNum_Project_Input = 1
										  )
										  OR (
										  PartitionMethod IN ('AR_Input_Project', 'Normal')  --allowed to whack an input on all projects, without identifying partiion method in special handling table
										  AND RowNum_Input_Project = 1
										  AND ari.ProjectID = 2  --2020-07-28 
										  )
										  )
                      
										  --only get inputs that are on active tasks for @ProjectID
										  --2021-05-24 switch from exists to inner join so we can grab the act/proc/reason IDs
										  --and EXISTS
										  --(
										  --    SELECT ActivityReasonId
										  --    FROM #cte_ActiveARs actar
										  --    WHERE actar.ActivityReasonId = ari.[ActReasonLinkID]
										  --	--cte_ActiveARs.ActivityReasonId is always going to exist!
										  --)
										  AND ari.ProjectID IN (@Projectid, 1, 2)
                     and  actar.IsSpecialTemplate = 0 --2022-10-06
                     /*not exists ( --get these from fixed config below
                          select tdarshl.ActReasonID
                          from dbo.tbl_DBT_ActReasonSpecialHandlingLink as tdarshl
                          where tdarshl.AR_Groupingname in ('ARTemplatesShiftSummary', 'ShiftSummaryWorkflowActivityReasonIdCsv', 'ShiftSummaryActivityReasonNonFinaliseIdsCSV')
                            and tdarshl.ActReasonID = ari.ActReasonLinkID)
                            */
										  --2021-04-07   AND ((ISNULL(ExcludeFromApp, 0) <> 1 AND @OnlyForApp = 1) 
										  --	OR (ISNULL(ExcludeFromApp, 0)+ISNULL(ExcludeFromWeb, 0) <> 2 AND @OnlyForApp = 0))  --if both ticked, then the input doesn't show anywhere.  but if the input goes to the app, then it needs to be shown in the web now (because no import through to PDS anymore)
										/*doing this latere now  AND (((ExcludeFromApp <> 1
										  OR ari.ExcludeFromApp IS NULL)
										  AND @OnlyForApp = 1)
										  OR (ExcludeFromApp + ExcludeFromWeb IN (0, 1, NULL)
										  AND @OnlyForApp = 0))  --if both ticked, then the input doesn't show anywhere.  but if the input goes to the app, then it needs to be shown in the web now (because no import through to PDS anymore)
										  */
										  --dont get unmapped statcalcs to device
										 --shift this to down bottom too AND NOT ((calcfn.AppCalcFunction = ''
										--  OR calcfn.AppCalcFunction IS NULL)
										 -- AND ari.InputType LIKE '%calc%'
									   --   AND @OnlyForApp = 1) --200-07-10  2020-07-22  added @onlyForapp just to be sure
										  --  AND NOT (@OnlyForApp = 0 AND ari.InputType = 'SummaryCalc') --2020-07-27 better to get iplodinputmappings ExcludeFromImport?  should be covered down the bottom with ExcludeFromImport
										--  AND 1=2

										 -- UNION ALL
									/*SELECT  QUOTENAME([name]) + ',' as ColumnName,
											TYPE_NAME(user_type_id) as DataTypeName, * 
									FROM tempdb.sys.columns 
									WHERE OBJECT_ID = OBJECT_ID('tempdb..#inputsprep');	 
									*/
									IF @ShowTimings =1 SELECT '#inputsprep_1stOneINserted'=GETDATE();

		--START DOING A FEW MORE INSERTS OF TASK DETAILS (USING UNION)
			 --add the parameters and whatnot
												INSERT INTO #inputsprep 
																			([RowId],
																			[ActReasonID],
																			[InputType],
																			[FieldType],
																			[InputID],
																			[HelpText],
																			[DisplayOrder],
																			[DisplayTrap],
																			[DataTypeDisplayed],
																			[DecPlaces],
																			[TimeStampThisInput],
																		--	[CalcString],
																			[ForeLabel],
																			[AftLabel],
																			[CompulsoryTrap],
																			[DefaultValue],
																			[ReviewTrap],
																			[IntolerableValues],
																			[InitialValidationMsg],
																			[FinalValidationMsg],
																			[InputListSelectionFilter],
																			[Shareable],
																			[InputGroup],
																			[SummaryGroup],
																			[DisplayInputComments],
																			[TypeCsvOld],
																			[TypeIdsCsv],
																			[TrapIntolerableComment],
																			[IsInputCommentRequired],
																			[IsInputPhotoRequired],
																			[IsInputAuthRequired],
																			[KeepOnCopy],
																			[ModifiedOn],
																			[Param1],
																			[Param2],
																			[Param3],
																			[Param4],
																			[WebCalcString],
																			[AttrJson],
																			[SupportedVersion],
																			[AdditionalRegex],
																			[td_ReportingBitWise],
																			[ToleranceLower],
																			[TL_Text],
																			[ToleranceUpper],
																			[TU_Text],
																			[td_ActivityID],
																			[td_ReasonID],
																			[td_ProcessID], ExcludeFromApp 
															   , ExcludeFromWeb ,OrigProject,DeploymentModeCsv)
											
                          												  SELECT [RowId],								[ActReasonID],								[InputType],								[FieldType],								[InputID],								[HelpText],								[DisplayOrder],								[DisplayTrap],								[DataTypeDisplayed],
																			[DecPlaces],								[TimeStampThisInput],							--	[CalcString],
                                      								[ForeLabel],								[AftLabel],								[CompulsoryTrap],								[DefaultValue],								[ReviewTrap],								[IntolerableValues],
																			[InitialValidationMsg],								[FinalValidationMsg],								[InputListSelectionFilter],								[Shareable],								[InputGroup],								[SummaryGroup],								[DisplayInputComments],
																			[TypeCsvOld],								[TypeIdsCsv],								[TrapIntolerableComment],								[IsInputCommentRequired],								[IsInputPhotoRequired],								[IsInputAuthRequired],								[KeepOnCopy],
																			[ModifiedOn],								[Param1],								[Param2],								[Param3],								[Param4],								[WebCalcString],								[AttrJson]='',								[SupportedVersion],								[AdditionalRegex],
																			[td_ReportingBitWise],								[ToleranceLower],								[TL_Text],								[ToleranceUpper],								[TU_Text],								[td_ActivityID],								[td_ReasonID],								[td_ProcessID] 
																			, ExcludeFromApp 
															   , ExcludeFromWeb , OrigProject,DeploymentModeCsv
                              
																		  FROM (  
		--GRAB THE SPECIALS																  
																		  SELECT     RowId                    = ActReasonInputLinkID *-1 --otherwise will get duplicates!!! device doesnt like
																				   , [ActReasonID]       = tasks.ActivityReasonId  --[ActReasonLinkID]
																				   , InputType                = CASE /*--leave the input type handling here because this Function is used to cull ARs that do not have any inputs
																													when ari.InputType = 'AttrLocn_1' then
																														@AttrLocn_1Method
																													when ari.InputType = 'AttrLocn_2' then
																														@AttrLocn_2Method
																													when ari.InputType = 'AttrLocn_3' then
																														@AttrLocn_3Method
																													when
																													(
																														ari.InputType = 'Stat'
																														and ari.InputID = 17
																													) then
																														'TrkCount'*/  --this is the input for adding timestamped truck loads.  will give us back the LogDuration Field. can push back to a flag field and use on other inputs if needed 
																													WHEN
																													(
																														ari.InputType = 'Stat'
																														AND ari.InputID = 15
																													) THEN
																														'TimeStamp' --this is timestamp statistic, converts to 4 digit 24hr format
																													ELSE
																														ISNULL(ari.InputType, 'no map for input type')
																												END
																				   , FieldType                = ari.InputType     --this is for putting correct input type back on upload to server (needs to be on the JSON uploaded)
																																  -- General.
																				   , InputID                  =  ari.InputID /*case
																													when ari.InputType like 'Attr%' then
																														ari.InputID * -1
																													else
																														ari.InputID
																												end  */             --change the attribute inputIDs to -ve so as to avoid confusion to stats or others
																																  --alternative method for bringing bog stats back to server (if we decide not to keep the InputType alias field --CASE WHEN  InputType Like '%bog%' THEN cast(Left(inputtype,1)+substring(inputtype,3,1)as int)  ELSE InputID END--get both bog to and bog from IDs out of the INputType name and join together into the ID so the INputIDs are unique.  need to subsitute back in ID=16 when uploading to server
																				   , HelpText =ISNULL(Q.QHelpText,ari.HelpText) /*case
																													when ari.InputType like 'Q%' then
																														Q.QHelpText
																													else
																														ari.HelpText
																												end  */ --2019-09-18  already mapped the questions on the join, safe to use IsNULL           --should include this in the mapping table?
																				   , DisplayOrder             =iif(ari.InputID = 6331,displayorder *100000  --hard coded hackery to put this question at the bottom. should shift to specialhandling or something I guess
                              																											, DisplayOrder *-1)  -- will put these ones at top of task.  will need to fix somehow if want to get some to the end of the task--* 10 --force inputs below parameters
																				   , DisplayTrap                                  --display the input
																				   , DataTypeDisplayed       = ISNULL(Q.AnswerType,CAST(ari.DataTypeDisplayed AS varchar)) /*CASE   --2019-04-30 
																													when ari.InputType like 'Q%' then
																														isnull(Q.AnswerType, '')
																													else
																														cast(ari.DataTypeDisplayed as varchar)
																												end */                   --data type for user input
																				   , DecPlaces                                    --decimal places, could be combined into new datatypedisplayed format (eg DECIMAL(5,2)
																				   , TimeStampThisInput       = LogDuration       --for making timestamp on the input saved
																				 --  , CalcString              =ISNULL(calcfn.AppCalcFunction,'') --        --need mapping table for web calc function names vs iplod calc strings.
																				  
																				  , ForeLabel                = ISNULL(Q.QuestionText,ForeLabel) /*case
																													when ari.InputType like 'Q%' then
																														Q.QuestionText
																													else
																														ForeLabel
																												end    */           --should include this in the mapping table?
																				   , AftLabel
																				   , CompulsoryTrap                               --is input compulsory? notify user
																				   , DefaultValue     = IIF(AllowDefault=1 ,DefaultValue,'') --only send value if allowed                            --existing value to load input with ...  is over-ridden by [DefaultString] if applicable
																				   , ReviewTrap
																				   , IntolerableValues        = ISNULL(Q.IntolerableValue,CAST(ISNULL(ari.IntolerableValue,'') AS varchar))
                              																					/*case
																													when ari.InputType like 'Q%' then
																														isnull(Q.IntolerableValue, '')
																													else
																														cast(ari.IntolerableValue as varchar)
																												end*/
																				   , InitialValidationMsg     = --ISNULL(Qparam.NotificationText, HelpText)         --need new field for this? currently borrowed into here
                              																					CASE WHEN  ari.InputType LIKE 'Q%' AND Qparam.Category IS  NULL THEN ISNULL(Q.NotificationText, '') ----if not mapped to question category, then get the notification text from question table.
                              																							WHEN  ari.InputType LIKE 'Q%' AND Qparam.Category IS NOT NULL THEN COALESCE(NULLIF(Qparam.NotificationText,''),NULLIF(q.NotificationText,''), '') --otherwise get from question category
                              
                              																							ELSE ari.HelpText  --need new field for this? currently borrowed into here
                              																								end
                              													, FinalValidationMsg       = CASE
																													WHEN ari.InputType LIKE 'Q%' AND Qparam.Category IS NOT NULL THEN ISNULL(Qparam.FinalNotificationText,'')  --if mapped to question category, then get from there.
                              																					 --removed 2020-04-23 , FinalValidationMsg triggers teh review screen (valid intolerable) WHEN ari.InputType LIKE 'Q%' AND Qparam.Category IS  NULL THEN ISNULL(Q.NotificationText, '')    --if not mapped to question category, then get the notification text from question table.
																												   -- dbo.FN_IsNullorEmpty(Qparam.FinalNotificationText,isnull(Q.NotificationText, ''))  --2020-03-06
																													WHEN  ari.InputType LIKE 'Q%' AND Qparam.Category IS  NULL THEN ''
                              																					  ELSE  --SELECT * FROM dbo.tbl_SYS_Questions
																														ISNULL(ari.[IV_Text], '')
																												END 
																				   , InputListSelectionFilter = ''                --could put name of table to query in here?
																				   , Shareable                                    --not used for data entry, used for returning summary stats
																				   , InputGroup                                   --for putting inputs together in a group cycle that can be repeated
																				   , SummaryGroup             = 0
																				   , DisplayInputComments                         --whether to display comment box as well as input so user can add comments against an input.
                              
																				   , TypeCsvOld               = ari.[Type]  /*CASE WHEN tasks.ActivityID IN (4,5,6) THEN 'Maint'
                              																						CASE WHEN tasks.ActivityID IN (4,5,6) THEN 'Maint'	--miners don't need to do a TWI for Equip breakdowns! might be changed? should put to config somehow
                              																					--WHEN 
                              																					ELSE 'Mining,Maint'
                              																					END */  --[Type]            --need to convert these to integer string
																				   , TypeIdsCsv               = --CASE WHEN tasks.ActivityID IN (4,5,6) THEN ',3,'	--miners don't need to do a TWI for Equip breakdowns! might be changed? should put to config somehow 2019-12-09
                              																					--ELSE ',1,3,'
                              																					--enD 
                              																						ISNULL((
																														   select distinct
																																  ',' + convert(nvarchar(50), TypeID)
																														   from dbo.udfSplit(ari.[Type], ',')  as CSV
																															   inner join dbo.tbl_SYS_Type as LookT
																																   on CSV.Item = LookT.TypeCode
																														   for xml path('')
																													   ) + ','
																													 , ''
                              
                              																					   )
                              													  --this is the handling if user selects Intolerable value
                              													 ,[TrapIntolerableComment] =  COALESCE(NULLIF(Qparam.IntolerableBitWise,''),NULLIF(q.IntolerableBitWise,''), TrapIntolerableComment)
                              
                              
                              
                              
                              
                              
                              													 --these are regardless of user answer
                              													 ,[IsInputCommentRequired] = ISNULL(qparam.[IsInputCommentRequired], ari.[IsInputCommentRequired])
                              													 ,[IsInputPhotoRequired] = ISNULL(qparam.[IsInputPhotoRequired], ari.[IsInputPhotoRequired])
                              													 ,[IsInputAuthRequired] = ISNULL(qparam.[IsInputAuthRequired], ari.[IsInputAuthRequired])
																				   , KeepOnCopy               = 0
																				   , ari.ModifiedOn                               --should combine with questions?
                              		 												  ,Param1=''
                              												  ,Param2 =''
                              												  ,Param3 = ''
                              												  ,Param4 =''
                                                        ,WebCalcString = ari.CalcFunction
                              												  ,td_ActivityID = tasks.ActivityID
																			  ,td_ProcessId = tasks.processid
																			  ,td_ReasonId = tasks.reasonid
                              												  ,RowNum = ROW_NUMBER() OVER (PARTITION BY tasks.ActivityReasonId,ari.inputtype,ari.inputid ORDER BY tasks.ActivityReasonId,ari.inputtype,ari.inputid,ari.projectid desc )
                              												  ,[td_ReportingBitwise]= [ari].[ReportingBitwise]
																			  ,SupportedVersion =0-- ISNULL(calcfn.MinVersionSupported, 0)
																			  ,Qparam.AdditionalRegex
																					 ,ToleranceLower = IIF(ari.InputType LIKE 'Q%' OR ari.InputType = 'pagebreak', NULL, ToleranceLower)  --2021-04-27 
																				   ,TL_Text = IIF(ari.InputType LIKE 'Q%' OR ari.InputType = 'pagebreak', NULL, TL_Text)
																				   ,ToleranceUpper = IIF(ari.InputType LIKE 'Q%' OR ari.InputType = 'pagebreak', NULL, ToleranceUpper)
																				   ,TU_Text = IIF(ari.InputType LIKE 'Q%' OR ari.InputType = 'pagebreak', NULL, TU_Text)
																				   , ExcludeFromApp = ISNULL(ExcludeFromApp,0)
																				   , ExcludeFromWeb --2022-10-19 use the flag on the table instead of hard coding it.= 1  --exclude all special inputs from web.
																				   ,OrigProject = -1  ---1 is special
                                           ,DeploymentModeCsv = NULL
																			  FROM dbo.tbl_DBT_ActReasonInputLink AS ari WITH (NOLOCK)
																				 LEFT JOIN dbo.tbl_SYS_Questions AS Q WITH (NOLOCK)
																					  ON ari.InputID = Q.QuestionID
																						 AND ari.InputType LIKE 'Q%'
																		  LEFT OUTER JOIN (SELECT * FROM [dbo].[udf_GetQuestionDetails](@ProjectID, @Type)) AS Qparam
                              														ON q.Category = Qparam.category
																			  cross JOIN #cte_ActiveARs AS tasks
                              											--	   OUTER APPLY dbo.udf_GetCalcFunctions_ForIplod(@projectid,ari.CalcFunction) AS calcfn	
																			  WHERE ari.projectID in ( 1,@ProjectID)
                              												AND ari.ActReasonLinkID = @AR_GetINputForAllTasks--205 --get actual one from config soemwhere
                              												AND (activityId IN (1,4,5,6) -- put this on config somewhere if need to change 
                  																				  OR (ari.InputType = 'statcalc' and inputid = 7)  --let the duration one come in. can add others here programtically, might need to grease them through in the iplodSetup_inputs proc too.
                  																				  )
                              												AND tasks.IsSpecialTemplate = 0 
																		  AND NOT (ari.InputType = 'Stat' AND ari.InputID = 7)  --2019-12-06
																				--    AND ((ISNULL(ExcludeFromApp, 0) <> 1 AND @OnlyForApp = 1) 
                              																	--OR (ISNULL(ExcludeFromApp, 0)+ISNULL(ExcludeFromWeb, 0) <> 2 AND @OnlyForApp = 0))  --if both ticked, then the input doesn't show anywhere.  but if the input goes to the app, then it needs to be shown in the web now (because no import through to PDS anymore)
                              
                              												--	and (((ExcludeFromApp  <> 1  or ari.ExcludeFromApp is null) and @OnlyForApp = 1) 
                              																	--OR (ExcludeFromApp+ExcludeFromWeb in (0,1,null) AND @OnlyForApp = 0))  --if both ticked, then the input doesn't show anywhere.  but if the input goes to the app, then it needs to be shown in the web now (because no import through to PDS anymore)
                              													--				OR (ExcludeFromWeb in (0,null) AND @OnlyForApp = 0)) --for the speicals, use the excludefromweb checkbos for its intended purpose.
                              												--remove from web: 2020-04-17
                              												--AND @OnlyForApp =1
                              												--removed again 2021-07-12. put "excludeFromImprot" filter below on the join	
																			  ) AS specials 
																			  where RowNum  =1 



											union all

	--set of parameters (not able to customise parameters for projects if they come from Project1)
												  SELECT
													-- Mining Specific Return Fields.
													RowId = ParamSU_ID
												   ,[ActReasonID]=DBT.ActivityReasonID
												   ,InputType = 'Parameter'
												   ,[FieldType] = DBT.FieldName /*=
													CASE
													  WHEN @OnlyForApp = 1 AND
														aar.CombinedHaulRoute > 0 AND
														DBT.FieldName = 'destination' THEN 'HaulRoute'  ----2020-05-25 special handling for combining into one for app (not supported in the web yet)
													  WHEN @OnlyForApp = 1 AND
														DBT.FieldName = 'RelatedEquipment' AND
														aar.ProcessID = 4 THEN 'RelatedEquipmentUJ' --2020-07-22, swticheroo for jumboer list on chargeup tasks. because we don't have filtering in the uigroupgroup lists. have added a dataset in UI_GroupGroup to match this.
													  ELSE FieldName
													END--these are the only ones that are allowed to be copied when user copy task
													*/
													-- General.
												   ,[InputID] = 1
												   ,HelpText
												   ,[DisplayOrder] =
													CASE
													  WHEN Fieldname = 'CommentsCheck' THEN 1000000
													  ELSE DBT.DisplayOrder
													END
												   ,[DisplayTrap] = 1
												   ,[DataTypeDisplayed] = ''
												   ,[DecPlaces] = 0
												   ,TimeStampThisInput = 0
												--   ,[CalcString] =''
                           /*=
													CASE
													  WHEN DBT.FieldName = 'location' THEN ' ?'
														+ '((UIGroupGroupDetailFilterCsv LIKE ' + CHAR(39) + '%{Location_1|||LocnParam1}%' + CHAR(39) + ') '  --blank in param1 field will result in all active locns
														+ ' OR (UIGroupGroupDetailFilterCsv LIKE ' + CHAR(39) + '%{Location_1|||LocnParam2}%' + CHAR(39) + ') '  --2021-04-19, don't put commas here, they are already included in LocnParam values in teh attrJson beloew
														+ ' OR (UIGroupGroupDetailFilterCsv LIKE ' + CHAR(39) + '%{Location_1|||LocnParam3}%' + CHAR(39) + ') '
														+ ') '
													  WHEN DBT.FieldName = 'Material' THEN ' ?'
														+ '((UIGroupGroupDetailFilterCsv LIKE ' + CHAR(39) + '%{Material_1|||MatParam1}%' + CHAR(39) + ') '  --blank in param1 field will result in all active locns
														+ ' OR (UIGroupGroupDetailFilterCsv LIKE ' + CHAR(39) + '%{Material_1|||MatParam2}%' + CHAR(39) + ') '  --2021-04-19, don't put commas here, they are already included in LocnParam values in teh attrJson beloew
														+ ' OR (UIGroupGroupDetailFilterCsv LIKE ' + CHAR(39) + '%{Material_1|||MatParam3}%' + CHAR(39) + ') '
														+ ') '
													  WHEN DBT.FieldName = 'RefNo' THEN ' ?'
														+ '((UIGroupGroupDetailFilterCsv LIKE ' + CHAR(39) + '%,{TaskHeader|||EquipmentCode},%' + CHAR(39) + ') '  --blank in param1 field will result in all active locns
														+ ' OR (UIGroupGroupDetailFilterCsv LIKE ' + CHAR(39) + '%,ALLEQUIP,%' + CHAR(39) + ') '
														+ ') '



													  ELSE ''
													END*/
												   ,[ForeLabel] =[DisplayLabel]
													/*CASE
													  WHEN @OnlyForApp = 1 AND
														aar.CombinedHaulRoute > 0 AND
														DBT.FieldName = 'destination' THEN 'Haul Route'  ----2020-05-25 special handling for combining into one for app (not supported in the web yet)
													  ELSE [DisplayLabel]
													END*/
												   ,[AftLabel] = ''
												   ,[CompulsoryTrap] = [EntryTrap]
												   ,[DefaultValue] = IIF(DBT.AllowDefault = 1, DBT.DefaultValue, '') --only send value if allowed
												   ,[ReviewTrap]
												   ,IntolerableValues = null
													/*CASE
													  WHEN --@OnlyForApp = 1 AND
														aar.CombinedHaulRoute > 0 AND
														DBT.FieldName = 'destination' THEN '-1'  ----2020-05-25 special handling for missing haul route
													  WHEN --@OnlyForApp = 1 AND
														@ShowzzDummyLocnInIplod = 1 AND
														DBT.FieldName = 'location' THEN '-1'  --2021-06-04
													  --could nearly replace this CASES and just set intolerable to be -1 for all parameter fields?
													  ELSE NULL
													END*/
												   ,InitialValidationMsg =
													CASE
													  WHEN --@OnlyForApp = 1 AND
														aar.CombinedHaulRoute > 0 AND
														DBT.FieldName = 'destination' THEN 'Please write the actual haul route in comments'  ----2020-05-25 special handling for missing haul route
													  ELSE NULL
													END
												   ,FinalValidationMsg = NULL
												   ,InputListSelectionFilter = ISNULL([Param1], '') + ',' + ISNULL([Param2], '') + ',' + ISNULL([Param3], '') + ','
													+ ISNULL([Param4], '')
												   ,[Shareable] = ''
												   ,[InputGroup] = ''
												   ,[SummaryGroup]                         --used to summarising in reports
												   ,[DisplayInputComments] = 0
												   ,TypeCsvOld =
													CASE
													  WHEN @IsFixedParams4Maint = 1 AND
														aar.ActivityID IN (4, 5, 6)/*--2021-05-24*/ THEN REPLACE(REPLACE(dbt.[Type], 'ServiceSheets', ''), 'maint', '')      --2021-05-05--need to kill out type here (web app still uses varchar type) --need to convert these to integer string
													  --when @IsFixedParams4SrvcSheets = 1 then replace (dbt.[Type] ,'ServiceSheets','') --2021-05-05--not sure if this will kill both?? might need to nest them
													  ELSE dbt.[Type]
													END
												   ,TypeIdsCsv = '' /* don't do this twice, had to take it to the top to use @DeploymentMode  ISNULL((
																				SELECT DISTINCT
																					   ',' + CONVERT(nvarchar(50), TypeID)
																				FROM dbo.udfSplit(dbt.[Type], ',')  AS CSV
																					INNER JOIN dbo.tbl_SYS_Type AS LookT
																						ON CSV.Item = LookT.TypeCode
																		where not exists(select fp.ActivityReasonId from @AR_FixedParamsForAllTasks as fp  --2021-05-05don't get Type for types where we set all params on a zz task
																									where   LookT.TypeCode =    fp.type)
																				FOR XML PATH('')
																			) + ','
																		  , ''
																		   )*/

												   ,[TrapIntolerableComment] =
													CASE
													  WHEN --@OnlyForApp = 1 AND
														aar.CombinedHaulRoute > 0 AND
														DBT.FieldName = 'destination' THEN 8  ----2020-05-25 special handling for missing haul route 
													  WHEN --@OnlyForApp = 1 AND
														@ShowzzDummyLocnInIplod = 1 AND
														DBT.FieldName = 'location' THEN 8
													  ELSE 1
													END
												   ,[IsInputCommentRequired] = 0
												   ,[IsInputPhotoRequired] = 0
												   ,[IsInputAuthRequired] = 0

												   ,KeepOnCopy =
													CASE
													  WHEN aar.ActivityID = 1 AND
														DBT.FieldName <> 'CommentsCheck' THEN 1
													  ELSE 0
													END
												   ,dbt.ModifiedOn
												   ,DBT.Param1
												   ,DBT.Param2
												   ,DBT.Param3
												   ,DBT.Param4
												   ,WebCalcString = ''
												   ,AttrJson =''/*=
													CASE
													  WHEN DBT.FieldName = 'location' -- and isnull(DBT.Param1,'') <> '' --if the first one is blank, then assume "AllActive"
													  THEN '[{"Key":"LocnParam1","Value":",' + dbo.FN_IsNotNullorEmpty(DBT.Param1, DBT.Param1, 'AllActive') + ',"}'
														+ IIF(ISNULL(DBT.Param2, '') <> '', ',{"Key":"LocnParam2","Value":",' + ISNULL(DBT.Param2, '') + ',"}', '')
														+ IIF(ISNULL(DBT.Param3, '') <> '', ',{"Key":"LocnParam3","Value":",' + ISNULL(DBT.Param3, '') + ',"}', '')


														+ ']'
													  WHEN DBT.FieldName = 'Material' -- and isnull(DBT.Param1,'') <> '' --if the first one is blank, then assume "AllActive"
													  THEN '[{"Key":"MatParam1","Value":",' + dbo.FN_IsNotNullorEmpty(DBT.Param1, DBT.Param1, 'AllActive') + ',"}'
														+ IIF(ISNULL(DBT.Param2, '') <> '', ',{"Key":"MatParam2","Value":",' + ISNULL(DBT.Param2, '') + ',"}', '')
														+ IIF(ISNULL(DBT.Param3, '') <> '', ',{"Key":"MatParam3","Value":",' + ISNULL(DBT.Param3, '') + ',"}', '')


														+ ']'
													  ELSE ''
													END*/
												   ,SupportedVersion = 0--can't do it here becuase it will kill locaiton field!!!. do it in the final iif (DBT.FieldName = 'location',20210220,0) 
												   ,AdditionalRegex = null
												   ,td_ReportingBitWise = DBT.ReportingBitwise --add field to the params table?!
												   ,ToleranceLower = null
												   ,TL_Text = null
												   ,ToleranceUpper = NULL
												   ,TU_Text = NULL
												   ,td_ActivityID=aar.ActivityID
												   ,td_ReasonID =aar.ReasonID
												   ,td_ProcessID =aar.ProcessID
												   , ExcludeFromApp = case when aar.CombinedHaulRoute > 0  AND fieldname = 'LoadedFrom' then 1 
																	  else  ISNULL(ExcludeFromApp,0) end
													, ExcludeFromWeb =0
													, OrigProject = DBT.ProjectID
                          ,DeploymentModeCsv = NULL
												  --, DBT.ReportingBitwise
												  FROM dbo.tbl_DBT_ParameterSetup AS DBT WITH (NOLOCK)
												  LEFT JOIN (SELECT DISTINCT
													  ActReasonID
													FROM dbo.tbl_DBT_ActReasonSpecialHandlingLink WITH (NOLOCK)
													WHERE ProjectID = 1
													AND PartitionMethod = 'AR_Project'  --2020-06-26 this means all elements of a task come from Project1..  more sophisticated partition methods not available on parameters
													AND AR_GroupingName <> 'AR_TWIs'
													OR (
													AR_GroupingName = 'AR_TWIs'
													AND @TwiAlias = 'TWI'
													)) AS Proj1
													ON DBT.ActivityReasonID = Proj1.ActReasonID
												  --LEFT OUTER JOIN dbo.tbl_SYS_ActivityReasonLink AS arl WITH (NOLOCK) 
												  --ON DBT.ActivityReasonID = arl.ActivityreasonLinkID
												  INNER JOIN #cte_ActiveARs AS aar
													ON DBT.ActivityReasonID = aar.ActivityReasonId
												  WHERE -- ISNULL(ExcludeFromApp, 0) <> 1
												  /*(((ExcludeFromApp <> 1
												  OR ExcludeFromApp IS NULL)
												  AND @OnlyForApp = 1)
												  OR (@OnlyForApp = 0))  --if both ticked, then the input doesn't show anywhere.  but if the input goes to the app, then it needs to be shown in the web now (because no import through to PDS anymore)
												  AND*/
												  ((
												  ProjectID = @Projectid
												  AND Proj1.ActReasonID IS NULL
												  ) --get from @Project
												  OR
												  (
												  Proj1.ActReasonID IS NOT NULL
												  AND DBT.ProjectID = 1
												  ) --or get from Project1
												  ) --2020-03-27

												  --AND NOT (@OnlyForApp = 1
												  --AND aar.CombinedHaulRoute > 0
												  --AND fieldname = 'LoadedFrom') --2020-05-25. haulroute remove or expand this as necessry, is for sending only one haul route field to the app.
												 -- AND 1=2


												  UNION ALL

 --set of parameters for fixed param templates, SErvice Sheets
												  SELECT
													-- Mining Specific Return Fields.
													RowId = ParamSU_ID
												   ,[ActReasonID] = aar.ActivityReasonID
												   ,InputType = 'Parameter'
												   ,[FieldType] = DBT.FieldName /*=
													CASE
													  WHEN @OnlyForApp = 1 AND
														aar.CombinedHaulRoute > 0 AND
														DBT.FieldName = 'destination' THEN 'HaulRoute'  ----2020-05-25 special handling for combining into one for app (not supported in the web yet)
													  WHEN @OnlyForApp = 1 AND
														DBT.FieldName = 'RelatedEquipment' AND
														aar.ProcessID = 4 THEN 'RelatedEquipmentUJ' --2020-07-22, swticheroo for jumboer list on chargeup tasks. because we don't have filtering in the uigroupgroup lists. have added a dataset in UI_GroupGroup to match this.
													  ELSE FieldName
													END--these are the only ones that are allowed to be copied when user copy task
													*/
													-- General.
												   ,[InputID] = 1
												   ,HelpText
												   ,[DisplayOrder] --leave it up teh top! we don't put commenst on service sheets anyway= CASE WHEN Fieldname = 'CommentsCheck' THEN 10000 ELSE DBT.DisplayOrder END
												   ,[DisplayTrap] = 1
												   ,[DataTypeDisplayed] = ''
												   ,[DecPlaces] = 0
												   ,TimeStampThisInput = 0
												   --,[CalcString] =''
													/*CASE
													  WHEN DBT.FieldName = 'location' THEN ' ?'
														+ '((UIGroupGroupDetailFilterCsv LIKE ' + CHAR(39) + '%{Location_1|||LocnParam1}%' + CHAR(39) + ') '  --blank in param1 field will result in all active locns
														+ ' OR (UIGroupGroupDetailFilterCsv LIKE ' + CHAR(39) + '%{Location_1|||LocnParam2}%' + CHAR(39) + ') '  --2021-04-19, don't put commas here, they are already included in LocnParam values in teh attrJson beloew
														+ ' OR (UIGroupGroupDetailFilterCsv LIKE ' + CHAR(39) + '%{Location_1|||LocnParam3}%' + CHAR(39) + ') '
														+ ') '
													  WHEN DBT.FieldName = 'RefNo' THEN ' ?'
														+ '((UIGroupGroupDetailFilterCsv LIKE ' + CHAR(39) + '%,{TaskHeader|||EquipmentCode},%' + CHAR(39) + ') '  --blank in param1 field will result in all active locns
														+ ' OR (UIGroupGroupDetailFilterCsv LIKE ' + CHAR(39) + '%,ALLEQUIP,%' + CHAR(39) + ') '
														+ ') '



													  ELSE ''
													END*/
												   ,[ForeLabel] =[DisplayLabel]
													/*CASE
													  WHEN @OnlyForApp = 1 AND
														aar.CombinedHaulRoute > 0 AND
														DBT.FieldName = 'destination' THEN 'Haul Route'  ----2020-05-25 special handling for combining into one for app (not supported in the web yet)
													  ELSE [DisplayLabel]
													END*/
												   ,[AftLabel] = ''
												   ,[CompulsoryTrap] = [EntryTrap]
												   ,[DefaultValue] = IIF(DBT.AllowDefault = 1, DBT.DefaultValue, '') --only send value if allowed
												   ,[ReviewTrap]
												   ,IntolerableValues =null /*=
													CASE
													  WHEN --@OnlyForApp = 1 AND--don't need to only push this to app, because this field is not used in web anyway!
														aar.CombinedHaulRoute > 0 AND
														DBT.FieldName = 'destination' THEN '-1'  ----2020-05-25 special handling for missing haul route
													  ELSE NULL
													END*/
												   ,InitialValidationMsg = null
													/*CASE
													  WHEN --@OnlyForApp = 1 AND--don't need to only push this to app, because this field is not used in web anyway!
														aar.CombinedHaulRoute > 0 AND
														DBT.FieldName = 'destination' THEN 'Please write the actual haul route in comments'  ----2020-05-25 special handling for missing haul route
													  ELSE NULL
													END*/
												   ,FinalValidationMsg = NULL
												   ,InputListSelectionFilter ='' /*= ISNULL([Param1], '') + ',' + ISNULL([Param2], '') + ',' + ISNULL([Param3], '') + ','
													+ ISNULL([Param4], '')*/
												   ,[Shareable] = ''
												   ,[InputGroup] = ''
												   ,[SummaryGroup]                         --used to summarising in reports
												   ,[DisplayInputComments] = 0
												   ,TypeCsvOld = dbt.[Type]
												   ,TypeIdsCsv = '' /* don't do this twice, had to take it to the top to use @DeploymentMode  ISNULL((
																				SELECT DISTINCT
																					   ',' + CONVERT(nvarchar(50), TypeID)
																				FROM dbo.udfSplit(dbt.[Type], ',')  AS CSV
																					INNER JOIN dbo.tbl_SYS_Type AS LookT
																						ON CSV.Item = LookT.TypeCode

																				FOR XML PATH('')
																			) + ','
																		  , ''
																		   )*/

												   ,[TrapIntolerableComment] =null /*=
																			  CASE
																				WHEN --@OnlyForApp = 1 and  --don't need to only push this to app, because this field is not used in web anyway!
																				  aar.CombinedHaulRoute > 0 AND
																					  DBT.FieldName = 'destination' THEN 8  ----2020-05-25 special handling for missing haul route
																					ELSE 1
																				  END*/
												   ,[IsInputCommentRequired] = 0
												   ,[IsInputPhotoRequired] = 0
												   ,[IsInputAuthRequired] = 0

												   ,KeepOnCopy=0 /*=
													CASE
													  WHEN aar.ActivityID = 1 AND
														DBT.FieldName <> 'CommentsCheck' THEN 1
													  ELSE 0
													END*/
												   ,dbt.ModifiedOn
												   ,DBT.Param1
												   ,DBT.Param2
												   ,DBT.Param3
												   ,DBT.Param4
												   ,WebCalcString = ''
												   ,AttrJson =''/*
													CASE
													  WHEN DBT.FieldName = 'location' -- and isnull(DBT.Param1,'') <> '' --if the first one is blank, then assume "AllActive"
													  THEN '[{"Key":"LocnParam1","Value":",' + dbo.FN_IsNotNullorEmpty(DBT.Param1, DBT.Param1, 'AllActive') + ',"}'
														+ IIF(ISNULL(DBT.Param2, '') <> '', ',{"Key":"LocnParam2","Value":",' + ISNULL(DBT.Param2, '') + ',"}', '')
														+ IIF(ISNULL(DBT.Param3, '') <> '', ',{"Key":"LocnParam3","Value":",' + ISNULL(DBT.Param3, '') + ',"}', '')


														+ ']'
													  ELSE ''
													END*/
												   ,SupportedVersion = 0--can't do it here becuase it will kill locaiton field!!!. do it in the final iif (DBT.FieldName = 'location',20210220,0) 
												   ,AdditionalRegex = ''
												   ,td_ReportingBitWise = 0 --add field to the params table?!
												   ,ToleranceLower = NULL
												   ,TL_Text = NULL
												   ,ToleranceUpper = NULL
												   ,TU_Text = NULL
												   ,td_ActivityID=aar.ActivityID
												   ,td_ReasonID =aar.ReasonID
												   ,td_ProcessID =aar.ProcessID
												   , ExcludeFromApp = ISNULL(ExcludeFromApp,0)/*= case when aar.CombinedHaulRoute > 0  AND fieldname = 'LoadedFrom' then 1 
																	  else ExcludeFromApp end*/
															   , ExcludeFromWeb =0
															   , OrigProject = -1  --2022-10-19 DBT.ProjectID
                                 ,DeploymentModeCsv = NULL
												FROM #cte_ActiveARs AS aar
												  INNER JOIN dbo.tbl_DBT_ParameterSetup AS DBT WITH (NOLOCK)
													ON ((@IsFixedParams4Maint = 1
													AND (DBT.Type LIKE '%ServiceSheets%'
													OR DBT.Type LIKE '%Maint%')
													AND aar.IsServiceSheet > 0
													AND EXISTS (SELECT
														fp.ActivityReasonId
													  FROM @AR_FixedParamsForAllTasks AS fp
													  WHERE dbt.ActivityReasonID = fp.ActivityReasonId
													  AND fp.IsServiceSheet = 1)
													)  --only get from template
													OR (@IsFixedParams4Maint = 1
													AND (DBT.Type LIKE '%ServiceSheets%'
													OR DBT.Type LIKE '%Maint%')
													AND aar.IsServiceSheet = 0
													AND (aar.Type LIKE '%ServiceSheets%'
													OR aar.Type LIKE '%Maint%')  --non-service sheets may be on other types!
													AND EXISTS (SELECT
														fp.ActivityReasonId
													  FROM @AR_FixedParamsForAllTasks AS fp
													  WHERE dbt.ActivityReasonID = fp.ActivityReasonId
													  AND fp.IsServiceSheet = 0)
													)  --only get from template

													)
												  -- just get all from project 1!  LEFT JOIN
												  --   (
												  --       SELECT DISTINCT
												  --              ActReasonID
												  --       FROM dbo.tbl_DBT_ActReasonSpecialHandlingLink WITH (NOLOCK) 
												  --       WHERE ProjectID = 1
												  --and PartitionMethod = 'AR_Project'  --2020-06-26 this means all elements of a task come from Project1..  more sophisticated partition methods not available on parameters
												  --             AND AR_GroupingName <> 'AR_TWIs'
												  --             OR
												  --             (
												  --                 AR_GroupingName = 'AR_TWIs'
												  --                 AND @TwiAlias = 'TWI'
												  --             )
												  --   )                           AS Proj1
												  --       ON DBT.ActivityReasonID = Proj1.ActReasonID
												  -- LEFT OUTER JOIN dbo.tbl_SYS_ActivityReasonLink AS arl WITH (NOLOCK) 
												  -- ON DBT.ActivityReasonID = arl.ActivityreasonLinkID
												  ---- inner JOIN #cte_ActiveARs AS aar

												  --ON DBT.ActivityReasonID = aar.ActivityReasonId
												  WHERE -- ISNULL(ExcludeFromApp, 0) <> 1
												  aar.ActivityID IN (4, 5, 6)  --2021-05-24
												 /* AND (((ExcludeFromApp <> 1
												  OR ExcludeFromApp IS NULL)
												  AND @OnlyForApp = 1)
												  OR (@OnlyForApp = 0)) */ --if both ticked, then the input doesn't show anywhere.  but if the input goes to the app, then it needs to be shown in the web now (because no import through to PDS anymore)
												  AND DBT.ProjectID = 1 --just get all from proejct 1 to speed up query time.  set this to @Project for situations other than Pybar maybe? or get the query working better. or get from @Project + Proj1 and rownum it
												  AND aar.IsSpecialTemplate = 0
												  --AND 1=2
												  --      ((
												  --          ProjectID = @Projectid
												  --          AND Proj1.ActReasonID IS NULL
												  --      ) --get from @Project
												  --      OR
												  --      (
												  --          Proj1.ActReasonID IS NOT NULL
												  --          AND DBT.ProjectID = 1
												  --      ) --or get from Project1
												  --) --2020-03-27

												 -- AND NOT (@OnlyForApp = 1
												 -- AND aar.CombinedHaulRoute > 0
											   --   AND fieldname = 'LoadedFrom') --2020-05-25. haulroute remove or expand this as necessry, is for sending only one haul route field to the app.


												--and exists (select fp.ActivityReasonId from @AR_FixedParamsForAllTasks as fp
												--			where dbt.ActivityReasonID = fp.ActivityReasonId)
	
  --DO INSERT OF THE SPECIAL FIXED SUMMARY TEMPLATE
  INSERT INTO #inputsprep 
																			([RowId],
																			[ActReasonID],
																			[InputType],
																			[FieldType],
																			[InputID],
																			[HelpText],
																			[DisplayOrder],
																			[DisplayTrap],
																			[DataTypeDisplayed],
																			[DecPlaces],
																			[TimeStampThisInput],
																		--	[CalcString],
																			[ForeLabel],
																			[AftLabel],
																			[CompulsoryTrap],
																			[DefaultValue],
																			[ReviewTrap],
																			[IntolerableValues],
																			[InitialValidationMsg],
																			[FinalValidationMsg],
																			[InputListSelectionFilter],
																			[Shareable],
																			[InputGroup],
																			[SummaryGroup],
																			[DisplayInputComments],
																			[TypeCsvOld],
																			[TypeIdsCsv],
																			[TrapIntolerableComment],
																			[IsInputCommentRequired],
																			[IsInputPhotoRequired],
																			[IsInputAuthRequired],
																			[KeepOnCopy],
																			[ModifiedOn],
																			[Param1],
																			[Param2],
																			[Param3],
																			[Param4],
																			[WebCalcString],
																			[AttrJson],
																			[SupportedVersion],
																			[AdditionalRegex],
																			[td_ReportingBitWise],
																			[ToleranceLower],
																			[TL_Text],
																			[ToleranceUpper],
																			[TU_Text],
																			[td_ActivityID],
																			[td_ReasonID],
																			[td_ProcessID], ExcludeFromApp 
															   , ExcludeFromWeb ,OrigProject,DeploymentModeCsv)
											
                          									/*			  SELECT [RowId],								[ActReasonID],								[InputType],								[FieldType],								[InputID],								[HelpText],								[DisplayOrder],								[DisplayTrap],								[DataTypeDisplayed],
																			[DecPlaces],								[TimeStampThisInput],								[CalcString],								[ForeLabel],								[AftLabel],								[CompulsoryTrap],								[DefaultValue],								[ReviewTrap],								[IntolerableValues],
																			[InitialValidationMsg],								[FinalValidationMsg],								[InputListSelectionFilter],								[Shareable],								[InputGroup],								[SummaryGroup],								[DisplayInputComments],
																			[TypeCsvOld],								[TypeIdsCsv],								[TrapIntolerableComment],								[IsInputCommentRequired],								[IsInputPhotoRequired],								[IsInputAuthRequired],								[KeepOnCopy],
																			[ModifiedOn],								[Param1],								[Param2],								[Param3],								[Param4],								[WebCalcString],								[AttrJson]='',								[SupportedVersion],								[AdditionalRegex],
																			[td_ReportingBitWise],								[ToleranceLower],								[TL_Text],								[ToleranceUpper],								[TU_Text],								[td_ActivityID],								[td_ReasonID],								[td_ProcessID] 
																			, ExcludeFromApp 
															   , ExcludeFromWeb , OrigProject*/
                            select RowId =                       0--pretty sure we pick it up in INputs Proc?yep, uniqueINputId is generated at the last.
                               --, ProjectID --
                               
                               , ActReasonID
                               --, TaskDetailType =              inputType
                              -- , TaskDetailTypeId
                              -- , TaskDetailTypeImageFileName = ''
                              -- , Active
                               , InputType
                               , FieldType =                   InputType
                               , InputID
                               , HelpText
                               , DisplayOrder --=  ROW_NUMBER() OVER ( ORDER BY 1)  --order them the way we want in the fixed config fucntion
                               , DisplayTrap =                 1
                               , DataTypeDisplayed
                               , DecPlaces
                               , TimeStampThisInput =          0
                             --  , CalcString
                               , ForeLabel
                               , AftLabel
                               , CompulsoryTrap
                               , DefaultValue =                '' --shift back if needed.
                               , ReviewTrap =                  0
                               , IntolerableValues
                               , InitialValidationMsg
                               , FinalValidationMsg
                               , InputListSelectionFilter =    ''  --legacy, shift back if needed
                               , Shareable =                   ''  --legacy, shift back if needed
                               , InputGroup
                               , SummaryGroup =                0 --legacy, shift back if needed
                               , DisplayInputComments =        0 --legacy, shift back if needed
                               , TypeCsvOld
                               , TypeIdsCsv
                               , [TrapIntolerableComment]
                               , [IsInputCommentRequired]
                               , [IsInputPhotoRequired]
                               , [IsInputAuthRequired]
                               , KeepOnCopy =                  0  --  shift back if needed
                               , ModifiedOn =                  getdate()
                               , Param1 =                      ''  --legacy, shift back if needed
                               , Param2 =                      ''  --legacy, shift back if needed
                               , Param3 =                      ''  --legacy, shift back if needed
                               , Param4 =                      ''  --legacy, shift back if needed
                               , WebCalcString =              a.CalcString --legacy, shift back if needed
                               , AttrJson =                    ''  -- shift back if needed
                               , SupportedVersion  --supported version can be less than 0, in which case SupportedVersion indicates the maximum version before this input is retired
                               , AdditionalRegex =             ''  -- shift back if needed
                               , td_ReportingBitWise
                               , ToleranceLower =              0  --legacy, shift back if needed
                               , TL_Text =                     ''  --legacy, shift back if needed
                               , ToleranceUpper =              0 --legacy, shift back if needed
                               , TU_Text =                     ''  --legacy, shift back if needed
                               , td_ActivityID =               tsarl.ActivityID
                               , td_ReasonID =                 tsarl.ReasonID
                               , td_ProcessID =                tsarl.ProcessID
                               , ExcludeFromAPp =              0  --OnlyForApp = 1
                               , ExcludeFromWeb =              1
                               , OrigProject = -2
                               --, DeploymentModeCsv --need to handle this in the Inputs Proc WHERE DeploymentModeCsv LIKE @DeploymentMode OR DeploymentModeCsv = ''
                               --, DataSrc =                     'fixedsummaryfunction'
                              -- , AppliesToAllProjects =        'yes!'
                                  ,DeploymentModeCsv
                          from dbo.tvf_FixedConfigs_iPlodSummaryTemplateDetails(@projectid, 0)   /* can't put it here: WITH RECOMPILE*/ as a
                            inner join dbo.tbl_SYS_ActivityReasonLink as tsarl
                              on tsarl.ActivityreasonLinkID = a.ActReasonID
                          --where 1=2

  
  
  
  
  
  
  
  
  
  
  
  --START DOING SOME INDEXES ON THE TEMP TABLE
									  UPDATE #inputsprep SET DataTypeDisplayed=ISNULL(DataTypeDisplayed,'')  --so can make the join below more sargable
									  where 1=1
									  UPDATE STATISTICS #inputsprep

						IF @ShowTimings=1 SELECT '#inputsPrepAllDone'=GETDATE();

	--START DONIG THE TASK DETAILS MERGE

												SELECT DISTINCT
													  RowId
													 ,ProjectId = @Projectid
													 ,OperationId = @OperationID
													 ,[ActReasonID]
													 ,TaskDetailType = LookITM.appInputType
													 ,TaskDetailTypeId = LookITM.appInputTypeId
													 ,TaskDetailTypeImageFileName = LookITM.appInputTypeImageFileName
													 ,Active= ISNULL(LookITM.Active,0)  --can't pu nulls into Active. assume that null means it shouldn't go there?
													 ,InputType
													 ,FieldType
													 ,sudata.InputID
													 ,HelpText
													 ,DisplayOrder-- = ROW_NUMBER() OVER ( ORDER BY sudata.DisplayOrder,sudata.ForeLabel )  --put this to force every line has unique display order. for some reason the app won't show the second item if they have same dispaly order? 2020-03-27
													 ,DisplayTrap
													 ,DataTypeDisplayed
													 ,DecPlaces
													 ,TimeStampThisInput
													-- ,CalcString
													 ,ForeLabel
													 ,AftLabel
													 ,CompulsoryTrap
													 ,DefaultValue
													 ,ReviewTrap
													 ,IntolerableValues /*=
													  CASE --shift Questiontype answers into INTs
														WHEN dbo.udfStringIsNullOrEmpty(IntolerableValues, NULL) <> 0 THEN ''
														WHEN IntolerableValues = 'Yes' THEN '1' + ''
														WHEN IntolerableValues = 'No' THEN '0' + ''
														WHEN IntolerableValues = 'N/A' THEN '-1' + ''
														ELSE IntolerableValues
													  END*/
													 ,InitialValidationMsg
													 ,FinalValidationMsg
													 ,InputListSelectionFilter
													 ,Shareable
													 ,InputGroup =
													  --CASE

													  --  WHEN @OnlyForApp = 0 THEN IIF(RIGHT(InputGroup, 1) = '>', '', InputGroup) --meh, this is unsupported in teh web, not that important This is to strip out GroupMakesNewTask in MANAGE adding new task.

														--ELSE 
														CASE
															WHEN ISNULL(sudata.InputGroup, '') = 'Hazard' THEN '+'
															ELSE ''
														  END
														  +
														  CASE
															WHEN sudata.InputGroup = 'Shift Boss Approval' THEN ''  --to manage transition btwn v2 and 3 can remove when on v3. this was input group on v2 only becasuse we wanted to put it down the bottom below the hazards.
															ELSE sudata.InputGroup
														  END
													 -- END

													  --SELECT DISTINCT inputgroup FROM dbo.tbl_DBT_ActReasonInputLink
													  --for future, suggest we knock up a wee table or function for the InputGroup optinos? or could install the leading symbol in ActReason itself (ideally would strip it out of reporting places shift summary etc that are not iplod)
													  /*
															 ~ (tilde) – indicates that the group cannot be replicated (i.e. no +, it is a singleton),
														+ (plus) – indicates that the group starts visually as just the header, and the first “+”
														selected populates the group, with subsequent “+”’s triggering new groups as per normal.
														The “-“ for the group will remove items from the first group if they are not modified – giving
														the group its initial collapsed appearance.
														 (EMPTY) functions AS per NORMAL expands collapses
															 */


													 ,SummaryGroup
													 ,DisplayInputComments
													 ,TypeCsvOld
													 ,TypeIdsCsv
													 ,[TrapIntolerableComment]
													 ,[IsInputCommentRequired]
													 ,[IsInputPhotoRequired]
													 ,[IsInputAuthRequired]
													 ,KeepOnCopy
													 ,ModifiedOn
													 ,Param1
													 ,Param2
													 ,Param3
													 ,Param4
													 ,WebCalcString = case when sudata.FieldType = 'stat' and sudata.inputid = 7 and  sudata.excludefromweb =1 and sudata.OrigProject <0  then '' --2022-10-23   there are a heap of old data with "duration" calc fucntion on them
                                            else nullif(WebCalcString,'') end  --leave the stat7 calcs come through if they only going to PLOD

													 ,AttrJson
													 ,SupportedVersion /*= put this into the view.
													  CASE
														WHEN SupportedVersion > 0 THEN SupportedVersion
														ELSE ISNULL(LookITM.MinSupportedVersion, 0)
													  END --2022-07-28*/ 
													 ,AdditionalRegex
													 ,td_ReportingBitWise
													 ,ToleranceLower
													 ,TL_Text
													 ,ToleranceUpper
													 ,TU_Text
													 ,td_ActivityID 
													 ,td_ReasonID 
													 ,td_ProcessID 

													 --todo shift these further upstream (retain this over-rdie thought to avoid slow join below)
													 , ExcludeFromApp = ISNULL(ExcludeFromApp,0)/*=  CASE WHEN LookITM.appInputTypeId IS NULL  THEN 1 
																			WHEN LookITM.appInputTypeId=0  THEN 1
																			--WHEN sudata.InputType LIKE '%calc%' AND ISNULL(sudata.CalcString,'') ='' THEN 1
																			ELSE ISNULL(ExcludeFromApp,0) end*/
							
													  , ExcludeFromWeb = CASE WHEN ExcludeFromImport =1 THEN 1  --2022-10-15 if exclude fom imprt, then don't want it. had the logic wrong. 
                                                    when sudata.FieldType = 'stat' and sudata.inputid = 7 and sudata.excludefromapp + sudata.excludefromweb <2 then 0 --2022-10-07 if it is not turned off from both, then send it in for web too. 
                                            ELSE 
																					ISNULL(ExcludeFromWeb,0) end
                             , AppliesToAllProjects = CASE WHEN sudata.OrigProject =@Projectid THEN ''
																						WHEN sudata.OrigProject IN (1,2) THEN 'AllProjects'
																						
																						WHEN sudata.OrigProject =-1  THEN 'AllTasks'
                                            WHEN sudata.OrigProject =-2  THEN 'FixedSummary'
																						ELSE '' END
                                                                                        
														, RowNum = ROW_NUMBER() OVER (partition by sudata.FieldType,sudata.ActReasonID,sudata.ProjectID,sudata.InputID ,sudata.OrigProject  -- use orign project instead of type. need to be careful removing this, must ensure all params come through from specials for Maint--,sudata.TypeCsvOld
                            ORDER BY sudata.FieldType,sudata.ActReasonID,sudata.ProjectID,sudata.InputID,/*sudata.TypeCsvOld,*/sudata.OrigProject )
												    ,DeploymentModeCsv
												INTO #tdformerge  
													FROM 
													--shfit this to above, then join to the # temp table becuase we are computing a join field (inputtype)
													 #inputsprep AS sudata
													LEFT JOIN /*(
													SELECT
														appInputType
													   ,appInputTypeId
													   ,appInputTypeImageFileName
													   ,webInputType
													   ,webDataTypeDisplayed
													   ,Active
													   ,ExcludeFromImport
													   ,MinSupportedVersion
														--this row num may not be totally effectual ... because the web is only interested in webINputType by itself, not including the datatypedisplayed!
													  -- ,rownum = ROW_NUMBER() OVER (PARTITION BY webInputType, webDataTypeDisplayed ORDER BY webInputType, webDataTypeDisplayed, appInputTypeId)
													  FROM */
													  dbo.tbl_SYS_iplodInputTypeMappings	 AS LookITM WITH (NOLOCK)
													 -- WHERE Active > 0) 	 AS LookITM
													  ON sudata.FieldType = LookITM.webInputType
														AND --ISNULL(sudata.DataTypeDisplayed, '') 
																sudata.DataTypeDisplayed= LookITM.webDataTypeDisplayed
														--AND lookITM.rownum = 1
														AND LookITM.Active > 0

												   -- WHERE
													-- App stuff only!
												   /*kill this, put onto logical kills above to avoid this nonsargeable pice of shite
												   NOT (LookITM.appInputType IS NULL) --send upmapped inputs to the web
													AND ((ISNULL(LookITM.appInputTypeId, -1) > 0
													AND @OnlyForApp = 1)--only supported inputs to the app.
													OR
													(ISNULL(LookITM.appInputTypeId, -1) >= 0
													AND @OnlyForApp = 0
													AND (ExcludeFromImport <> 1
													OR LookITM.ExcludeFromImport IS NULL))); -- if sending to web, still need to be "mapped" but can just be a line inteh inputtypemapping table, with 0 app input type
												  --if sending to the web, don't send "ExcludeFromImport" mappings
												  */
--check on row count, don't do the merge if merging nothing in there!
declare @rowcnt int = @@rowcount

  IF @DebugMode =1 AND OBJECT_ID('tempdb..#inputsprep') IS NOT NULL   SELECT ' #tdformergePreDeleted',* FROM  #tdformerge;

--2022-10-06 kill dupes here, instead of trickery on the merge
  delete #tdformerge where RowNum >1

  IF @DebugMode =1 AND OBJECT_ID('tempdb..#inputsprep') IS NOT NULL   SELECT ' #tdformergePostDeleted',* FROM  #tdformerge;

--now do the actual merge
IF @Debugmode=0 and @rowcnt >1000
  begin

                                            MERGE dbo.tbl_DBT_GetTaskDetails_ForIplod_Cached_V2 AS dest
                                            USING --dbo.udf_GetTaskDetails_ForIplod(@projectId, @type, 99, 0) AS src  --call with @onlyForApp =99 will bring both web and app. and has some logic to kill some inputs (ie sets ExcludeFromApp =1 ) check the function
                                                  #tdformerge AS src
                                            ON --the RowIds are not uniquec accros tables!!
                                               -- src.RowId = dest.RowId
                                               src.FieldType = dest.FieldType  --Input type for parameters just = "parameter"
                                               AND src.InputID = dest.InputID
                                               AND src.ProjectID = dest.ProjectID
                                               and src.ActReasonID = dest.ActReasonID
                                               and src.TypeCsvOld = dest.TypeCsvOld
                                              --2022-10-06 dont think this works, they insert anyway. AND src.RowNum =1  --don't bring the occasional duplicated parameter!
                                                --and src.OnlyforApp = dest.OnlyForApp
                                            
                                            WHEN NOT MATCHED BY TARGET THEN	
                                            	INSERT ([RowId], [ProjectID], [OperationID], [ActReasonID]/*, [TaskDetailType], [TaskDetailTypeId], [TaskDetailTypeImageFileName]*/, [Active], [InputType], [FieldType], [InputID], [HelpText], [DisplayOrder], [DisplayTrap], [DataTypeDisplayed], [DecPlaces], [TimeStampThisInput]--, [CalcString]
                                              , [ForeLabel], [AftLabel], [CompulsoryTrap], [DefaultValue], [ReviewTrap], [IntolerableValues], [InitialValidationMsg], [FinalValidationMsg], [InputListSelectionFilter], [Shareable], [InputGroup], [SummaryGroup], [DisplayInputComments], [TypeCsvOld], [TypeIdsCsv], [TrapIntolerableComment], [IsInputCommentRequired], [IsInputPhotoRequired], [IsInputAuthRequired], [KeepOnCopy], [ModifiedOn], [Param1], [Param2], [Param3], [Param4], [WebCalcString], [AttrJson], [SupportedVersion], [AdditionalRegex], [td_ReportingBitWise], [ToleranceLower], [TL_Text], [ToleranceUpper], [TU_Text], [td_ActivityID], [td_ReasonID], [td_ProcessID], [ExcludeFromApp], [ExcludeFromWeb], [DateCreated], [DateUpdated],AppliesToAllProjects,DeploymentModeCsv)
                                            	VALUES (src.[RowId], src.[ProjectID], src.[OperationID], src.[ActReasonID]/*, src.[TaskDetailType], src.[TaskDetailTypeId], src.[TaskDetailTypeImageFileName]*/, src.[Active], src.[InputType], src.[FieldType], src.[InputID], src.[HelpText], src.[DisplayOrder], src.[DisplayTrap], src.[DataTypeDisplayed], src.[DecPlaces], src.[TimeStampThisInput]--, src.[CalcString]
                                              , src.[ForeLabel], src.[AftLabel], src.[CompulsoryTrap], src.[DefaultValue], src.[ReviewTrap], src.[IntolerableValues], src.[InitialValidationMsg], src.[FinalValidationMsg], src.[InputListSelectionFilter], src.[Shareable], src.[InputGroup], src.[SummaryGroup], src.[DisplayInputComments], src.[TypeCsvOld], src.[TypeIdsCsv], src.[TrapIntolerableComment], src.[IsInputCommentRequired], src.[IsInputPhotoRequired], src.[IsInputAuthRequired], src.[KeepOnCopy], src.[ModifiedOn], src.[Param1], src.[Param2], src.[Param3], src.[Param4], src.[WebCalcString], src.[AttrJson], src.[SupportedVersion], src.[AdditionalRegex], src.[td_ReportingBitWise], src.[ToleranceLower], src.[TL_Text], src.[ToleranceUpper], src.[TU_Text], src.[td_ActivityID], src.[td_ReasonID], src.[td_ProcessID]
                                                          , src.ExcludeFromApp, src.ExcludeFromWeb, GETDATE(), GETDATE(),AppliesToAllProjects,DeploymentModeCsv)
                                            
                                            WHEN MATCHED THEN UPDATE SET
                                            	dest.ProjectID = src.ProjectID,
                                            	dest.OperationID = src.OperationID,
                                            	dest.ActReasonID = src.ActReasonID,
                                            --	dest.TaskDetailType = src.TaskDetailType,
                                            	--dest.TaskDetailTypeId = src.TaskDetailTypeId,
                                            	--dest.TaskDetailTypeImageFileName = src.TaskDetailTypeImageFileName,
                                            	dest.Active = src.Active,
                                            	dest.InputType = src.InputType,
                                            	dest.FieldType = src.FieldType,
                                            	dest.InputID = src.InputID,
                                            	dest.HelpText = src.HelpText,
                                            	dest.DisplayOrder = src.DisplayOrder,
                                            	dest.DisplayTrap = src.DisplayTrap,
                                            	dest.DataTypeDisplayed = src.DataTypeDisplayed,
                                            	dest.DecPlaces = src.DecPlaces,
                                            	dest.TimeStampThisInput = src.TimeStampThisInput,
                                            --	dest.CalcString = src.CalcString,
                                            	dest.ForeLabel = src.ForeLabel,
                                            	dest.AftLabel = src.AftLabel,
                                            	dest.CompulsoryTrap = src.CompulsoryTrap,
                                            	dest.DefaultValue = src.DefaultValue,
                                            	dest.ReviewTrap = src.ReviewTrap,
                                            	dest.IntolerableValues = src.IntolerableValues,
                                            	dest.InitialValidationMsg = src.InitialValidationMsg,
                                            	dest.FinalValidationMsg = src.FinalValidationMsg,
                                            	dest.InputListSelectionFilter = src.InputListSelectionFilter,
                                            	dest.Shareable = src.Shareable,
                                            	dest.InputGroup = src.InputGroup,
                                            	dest.SummaryGroup = src.SummaryGroup,
                                            	dest.DisplayInputComments = src.DisplayInputComments,
                                            	dest.TypeCsvOld = src.TypeCsvOld,
                                            	dest.TypeIdsCsv = src.TypeIdsCsv,
                                            	dest.TrapIntolerableComment = src.TrapIntolerableComment,
                                            	dest.IsInputCommentRequired = src.IsInputCommentRequired,
                                            	dest.IsInputPhotoRequired = src.IsInputPhotoRequired,
                                            	dest.IsInputAuthRequired = src.IsInputAuthRequired,
                                            	dest.KeepOnCopy = src.KeepOnCopy,
                                            	dest.ModifiedOn = src.ModifiedOn,
                                            	dest.Param1 = src.Param1,
                                            	dest.Param2 = src.Param2,
                                            	dest.Param3 = src.Param3,
                                            	dest.Param4 = src.Param4,
                                            	dest.WebCalcString = src.WebCalcString,
                                            	dest.AttrJson = src.AttrJson,
                                            	dest.SupportedVersion = src.SupportedVersion,
                                            	dest.AdditionalRegex = src.AdditionalRegex,
                                            	dest.td_ReportingBitWise = src.td_ReportingBitWise,
                                            	dest.ToleranceLower = src.ToleranceLower,
                                            	dest.ToleranceUpper = src.ToleranceUpper,
                                            	dest.TL_Text = src.TL_Text,
                                            	dest.TU_Text = src.TU_Text,
                                            	dest.td_ActivityID = src.td_ActivityID,
                                            	dest.td_ReasonID = src.td_ReasonID,
                                            	dest.td_ProcessID = src.td_ProcessID,
                                              dest.ExcludeFromApp = src.ExcludeFromApp
                                              ,dest.ExcludeFromWeb = src.ExcludeFromWeb
                                              ,dest.[DateUpdated] = getdate()
											  ,dest.AppliesToAllProjects = src.AppliesToAllProjects
                        ,dest.DeploymentModeCsv = src.DeploymentModeCsv
                                            
                                            WHEN NOT MATCHED BY SOURCE and dest.projectid = @projectid THEN	
                                            --todo: change this to logical delete (ie UPDATE) if applicable. (ie if this becomes more than just a cache
                                            		DELETE;

--now update stats
UPDATE STATISTICS tbl_DBT_GetTaskDetails_ForIplod_Cached_V2



				end
	  IF @Debugmode = 1 SELECT 'TaskDetailsMergeAllDone'=getdate()
 
 END --end of the whole shebang (inside teh trans stuff though)                                              
    
--THIS IS THE END OF ALL THE WORK
    
    
               
        

    -- return success
    SET @Result = 1
    SET @ResultMessage = 'Cache Table Updated'
    IF (@ReturnAsTable = 1)
    BEGIN
      SELECT
        @Result AS 'Result'
       ,@ResultMessage AS 'Message';
    END

    IF @TranCount = 0
      COMMIT TRANSACTION;

  END TRY
  BEGIN CATCH

    -- something went wrong, rollback  
    DECLARE @xstate INT = XACT_STATE();
    IF @xstate = 1
      AND @TranCount > 0
      ROLLBACK TRANSACTION SP_PS_BuildCacheTablesWithMerge;
    ELSE
      ROLLBACK

    -- PRINT ERROR_MESSAGE();

    SET @Result = 0
    SET @ResultMessage = ERROR_MESSAGE()
    IF (@ReturnAsTable = 1)
    BEGIN
      SELECT
        @Result AS 'Result'
       ,@ResultMessage AS 'Message';
    END

  END CATCH;



/*********
end of the work
*********/ 

--cleanup some temp stuff
  IF @DebugMode =1 AND OBJECT_ID('tempdb..#inputsprep') IS NOT NULL   SELECT ' #inputsprep',* FROM  #inputsprep;



IF OBJECT_ID('tempdb..#allinputs') IS NOT NULL   drop TABLE #allinputs;
 IF OBJECT_ID('tempdb..#inputsprep') IS NOT NULL  drop table  #inputsprep;
IF OBJECT_ID('tempdb..#cte_ActiveARs') IS NOT NULL   DROP TABLE #cte_ActiveARs;
 IF OBJECT_ID('tempdb..#tdformerge') IS NOT NULL  drop table #tdformerge;

  IF @ShowTimings=1 SELECT 'AllOver'=GETDATE();






/*  this will cause kill state error if altered into the plod db!!!  */
  --if rebuild, rebuild the index too:
  --don't do this until it is needed
  IF 1=2 --AND @RebuildWithDelete = 1 AND @BuildAttributesCache = 1
  BEGIN
    
	ALTER INDEX idx_GetAttributes_Cached ON view_GetAttributes_Cached REBUILD
    ALTER INDEX [idx_GetAttributes_Cached_2] ON view_GetAttributes_Cached REBUILD
  END
  




/*to delete:
       IF @AttrNeedsBuilding =1 OR @BuildAttributesCache = 1 
                    begin
                                                              IF @BuildAttributesCache =1 OR @AttrNeedsBuilding = 1
                                                              BEGIN  --see XXX for the end
                                                                  --get live attributes data into temp table.
                                                                  DECLARE @AttrLive TABLE (
                                                                    [AttProjID] BIGINT NULL  --allow it to go into here, so can get debug results below
                                                                   ,[ProjectID] [INT] NULL
                                                                   ,OperationID [INT] NULL
                                                                   ,[AttributeDescription] [NVARCHAR](200) NULL
                                                                   ,[AttributeTypeID] [INT] NULL
                                                                   ,[AttributeID] [INT] NULL
                                                                   ,[AttTypeDesc] [NVARCHAR](200) NULL
                                                                   ,[Active] [INT] NOT NULL
                                                                   ,[Comments] [NVARCHAR](200) NULL
                                                                   ,AttrMethod [NVARCHAR](25) NULL
                                                                   ,ModifiedOn DATETIME NULL
                                                                   ,AssociatedNumeral DEC(10, 5) NULL
                                                                  )
                                                                  INSERT INTO @AttrLive ([AttProjID]
                                                                  , [ProjectID]
                                                                  , [OperationID]
                                                                  , [AttributeDescription]
                                                                  , [AttributeTypeID]
                                                                  , [AttributeID]
                                                                  , [AttTypeDesc]
                                                                  , [Active]
                                                                  , [Comments]
                                                                  , [AttrMethod]
                                                                  , [ModifiedOn]
                                                                  , AssociatedNumeral)
                                                                    /*todo: sort best method for attPojId
                                                                  	*/
                                                                    SELECt   
                                                                    [AttProjID] -- this overflows INT: = iif([AttProjID]<1000000, -- if it is small enough, whack projectid on the front!  some fuckery to avoid the bigint for a bit longer (only an issue on central PBW with multi-projects
                                                                                        --     CONVERT(INT, + CAST(Projectid AS VARCHAR(5)) + CAST([AttProjID] AS VARCHAR(25)))
                                                                                          --   , [AttProjID]) 
                                                                  , [ProjectID]
                                                                  , [OperationID]
                                                                  , [AttributeDescription]
                                                                  , [AttributeTypeID]
                                                                  , [AttributeID]
                                                                  , [AttTypeDesc]
                                                                  , [Active]
                                                                  , [Comments]
                                                                  , [AttrMethod]
                                                                  , [ModifiedOn]
                                                                  , AssociatedNumeral
                                                                    FROM (
                                                                      SELECT
                                                                      [AttProjID] = IIF([AttributeTypeID] = 107, CONVERT(INT, case WHEN @ProjectID = 3 THEN  '3'  
                                                                                                                                  WHEN @projectid = 291 THEN  '7'
                                                                                                                                    WHEN @projectid = 388 THEN  '2'     
                                                                                                                                    ELSE '-1'end
                                                                      + CAST([AttributeID] AS VARCHAR(25))), --if 107, then the attirbute Id is quite big (= localstagingid). so don't add the attributetypeid on front. start the nymber with a 7 so it doesn't overlap with the others
                                                                      CONVERT(bigint,/* let it go as BIGINT to get debugging results. it will fail on actual insert will result in bigint: cast(ProjectId as varchar)+*/
                                                                      --2021-10-23 allow proj3 to be put in here for test system. if wanting to run multiple @orojecst on live system will need to think again (maybe just make AttProjId = bigints?
                                                                      --The conversion of the varchar value '3100081363' 
                                                                      --select convert(int,2007320576) --overflowed an int column.
                                                                      case WHEN @ProjectID = 3 THEN  '3'
                                                                           WHEN @projectid = 291 THEN  '7'
                                                                           WHEN @projectid = 388 THEN  '2'               
                                                                           --add new project here. as a work around to avoid smashin bigint eveywhere!
                                                              
                                                                           ELSE '-1'
                                                                           end
                                                                      -- + '1'
                                                                      + case WHEN tbl.AttTypeDesc LIKE 'employees%' THEN CAST([AttributeTypeID]  AS VARCHAR) 
                                                                             WHEN tbl.AttTypeDesc LIKE 'location%' THEN  CAST([AttributeTypeID]  AS VARCHAR) 
                                                                      --(locations and employees are unique in their own tables, across projects. try and make them unique in amoungst attributes!)
                                                                          ELSE CAST([dbo].[FN_StringPad]([AttributeTypeID], 4, '0') AS VARCHAR) 
                                                                      end
                                                                      + CAST([AttributeID] AS VARCHAR))
                                                                      )    --just make a compositekey for all. will never fail.--iif([AttProjID] = 0, convert(int ,cast(ProjectId as varchar)+cast(RowNumAttrProjId as varchar) ) * -1 , [AttProjID]) --use actual AttrProjId if we have it, that is a table ID
                                                                     ,[ProjectID]
                                                                     ,[OperationID]
                                                                     ,[AttributeDescription]
                                                                     ,[AttributeTypeID]
                                                                     ,[AttributeID]
                                                                     ,[AttTypeDesc]
                                                                     ,[Active]
                                                                     ,[Comments]
                                                                     ,[AttrMethod]
                                                                     ,[ModifiedOn] = GETDATE()
                                                                     ,AssociatedNumeral
                                                                    FROM (SELECT
                                                                        [AttProjID]
                                                                       ,[ProjectID] = IIF([ProjectID] = 0, @ProjectID, ProjectId)
                                                                       ,[OperationID] = (SELECT
                                                                            OperationId
                                                                          FROM tbl_dbT_Project
                                                                          WHERE ProjectId = @ProjectID)
                                                                       ,[AttributeDescription]
                                                                       ,[AttributeTypeID]
                                                                       ,[AttributeID]
                                                                       ,[AttTypeDesc]
                                                                       ,[Active] = 1
                                                                       ,[Comments] = ''
                                                                       ,AttrMethod
                                                                       ,AssociatedNumeral
                                                                       ,RowNum = ROW_NUMBER() OVER (PARTITION BY [AttributeTypeID], ProjectId, AttProjId ORDER BY [AttributeTypeID], ProjectId, AttProjId)
                                                                       ,RowNumUniqueAttrProjId = ROW_NUMBER() OVER (PARTITION BY [AttributeTypeID], [AttributeID] ORDER BY [AttributeTypeID], [AttributeID], [AttProjID]) --should be the same every time
                                                                      FROM [view_GetAttributes_LIVE]
                                                                      WHERE [ProjectID] IN (@ProjectID
                                                                      , 0)
                                                                      AND ([AttributeTypeID] = @AttrTypeId
                                                                      OR @AttrTypeId = 0)) AS tbl
                                                                    WHERE [tbl].[RowNum] = 1
                                                                    AND tbl.[RowNumUniqueAttrProjId] = 1
                                                                    ) AS tbl
                                                              
                                                              
                                                              
                                                                  IF @RebuildWithDelete = 1
                                                                  BEGIN
                                                                    DELETE [dbo].[view_GetAttributes_Cached]
                                                                    WHERE [ProjectID] = @ProjectID
                                                                      AND ([AttributeTypeID] = @AttrTypeId
                                                                      OR @AttrTypeId = 0)
                                                                  END
                                                              
                                                                  IF @Debugmode = 0
                                                                  BEGIN
                                                                    --update if already there:
                                                                    UPDATE t
                                                                    SET t.[AttributeDescription] = tvp.[AttributeDescription]
                                                                       ,t.[AttributeTypeID] = tvp.[AttributeTypeID]
                                                                       ,t.[AttributeID] = tvp.[AttributeID]
                                                                       ,t.[AttTypeDesc] = tvp.[AttTypeDesc]
                                                                       ,t.[Active] = tvp.[Active]
                                                                       ,t.[Comments] = tvp.[Comments]
                                                                       ,t.AttrMethod = tvp.AttrMethod
                                                                       ,t.[ModifiedOn] = tvp.[ModifiedOn]
                                                                       ,t.AssociatedNumeral = tvp.AssociatedNumeral
                                                              
                                                                    FROM dbo.[view_GetAttributes_Cached] AS t
                                                                    INNER JOIN @AttrLive AS tvp
                                                                      ON t.[AttProjID] = tvp.[AttProjID]
                                                                      AND t.[ProjectID] = [tvp].[ProjectID]
                                                                      AND t.[AttributeTypeID] = tvp.[AttributeTypeID]
                                                                    --where  (t.[AttributeTypeID] =@AttrTypeId or @AttrTypeId=0)  don't need this? 
                                                                    ;
                                                                    --insert if not there yet:
                                                                   --todo: this can't be run from the plod schema db (because it is a syn) so will have to wrap a sql call on @dbDefaultName to perform this.
                                                              					--in practice, unlikely to want to run this attributes rebuild from here as it is a beast.
                                                                       -- DECLARE @Sql NVARCHAR(MAX) = 'use '+@PrimaryDbName+ ' SET IDENTITY_INSERT '+'[dbo].[view_GetAttributes_Cached] ON '
                                                                        --execute ( @Sql )
                                                              
                                                                       SET IDENTITY_INSERT [dbo].[view_GetAttributes_Cached] ON 
                                                              
                                                                    INSERT dbo.[view_GetAttributes_Cached] ([AttProjID], [ProjectID], [OperationID], [AttributeDescription], [AttributeTypeID], [AttributeID], [AttTypeDesc], [Active], [Comments], AttrMethod, [ModifiedOn], AssociatedNumeral)
                                                                      SELECT
                                                                        [AttProjID]
                                                                       ,[ProjectID]
                                                                       ,[OperationID]
                                                                       ,[AttributeDescription]
                                                                       ,[AttributeTypeID]
                                                                       ,[AttributeID]
                                                                       ,[AttTypeDesc]
                                                                       ,[Active]
                                                                       ,[Comments]
                                                                       ,AttrMethod
                                                                       ,[ModifiedOn]
                                                                       ,AssociatedNumeral
                                                                      FROM @AttrLive AS tvp
                                                                      WHERE NOT EXISTS (SELECT
                                                                          1
                                                                        FROM dbo.[view_GetAttributes_Cached]
                                                                        WHERE [AttProjID] = tvp.[AttProjID]
                                                                        AND [ProjectID] = [tvp].[ProjectID]
                                                                        AND [AttributeTypeID] = tvp.[AttributeTypeID]);
                                                                  --	set identity_insert [view_GetAttributes_Cached] off
                                                                  END
                                                              
                                                                  IF @Debugmode = 1
                                                                  BEGIN
                                                                    SELECT
                                                                      [AttProjID]
                                                                     ,[ProjectID]
                                                                     ,[OperationID]
                                                                     ,[AttributeDescription]
                                                                     ,[AttributeTypeID]
                                                                     ,[AttributeID]
                                                                     ,[AttTypeDesc]
                                                                     ,[Active]
                                                                     ,[Comments]
                                                                     ,[AttrMethod]
                                                                     ,[ModifiedOn]
                                                                     ,AssociatedNumeral
                                                                    FROM @AttrLive
                                                              
                                                                    SELECT
                                                                      'duplicates:'
                                                                     ,attprojid--,[ProjectID],[AttributeTypeID]
                                                                     ,COUNT(*) occurrences
                                                                    FROM @AttrLive
                                                                    GROUP BY attprojid--,[ProjectID],[AttributeTypeID]
                                                                    HAVING COUNT(*) > 1;
                                                              
                                                                    SELECT
                                                                      'BIGINTS:'
                                                                     ,*
                                                                    FROM @AttrLive
                                                                    WHERE AttProjID >=2147483648
                                                                    
                                                                    SELECT
                                                                      'dupeIdentityInsertViolations:'
                                                                     ,s.*
                                                                     ,'alreadyincache:'
                                                                     ,vgac.*
                                                                    FROM @AttrLive s
                                                                    inner JOIN 
                                                                    view_GetAttributes_Cached vgac 
                                                                    ON  s.AttProjID = vgac.AttProjID
                                                              
                                                              
                                                                  END
                                                              END --XXXX

            end --whether or not do do rebuild

*/


--this is the final end:
END;
























GO
PRINT N'Altering [dbo].[view_udf_GetTaskDetails_ForIplod_CACHED_ForApp]'
GO
ALTER view [dbo].[view_udf_GetTaskDetails_ForIplod_CACHED_ForApp]
as
/*
SELECT * FROM [dbo].[view_udf_GetTaskDetails_ForIplod_CACHED_ForApp] where projectid = 3 
	SELECT * FROM [dbo].[view_udf_GetTaskDetails_ForIplod_CACHED_ForApp] where projectid  = 194 

ts 2022-07-13 ... created out of frustration, swith to this from the normal one.
ts 2022-09-03 ... bring summary templates from fixed function
CA 2022-09-08 ... Added WIth NoLock to the table
ts 2022-09-24 .. presumabley * might be slower.
ts 2022-09-26 ... created to kill @OnlyForApp
              ... bring some logic
              .. bring a heap more logic out, so it is fixed and not subject to fickle act reason settings.
              ... put some logic flags into ACtive to programatically prevent bad things happening hte app.
              ... add some things
              .. join to the mappings table to pick up the min supported version
              .. add the 
              .. don't kill the calc functions!
              .. dont' kill the attrjson
              ... {fuck knows} kill the fixed config funciton for performance?
              ... put it back.
              ... shift it to the MERGE proc on the task details... dbo.SP_ProjSetup_BuildCacheTablesWithMerge
              ... get the app calc function and the attrjosn on teh way out the door, not saved into teh cache table
              ... {yep better.} do a join instead of apply for the calc string
              ... {} do the CASE parsing on FieldType instead of INputtype
              ... added sargeable fieldtpye for filtering.
              ... try getting rid of locnAttributes 
                            (done in inputs proc now)
                ... don't send stat 7 out the door to inputs
ts 2022-10-12 ... don't send zeros out for tolerances.
ts 2022-10-23 ... supported version can go below zero (indicating retire this input for versions more than this)



              todo: remove this hard coded logic and let it be flexible out of act reason view if necessary.


todo:


,TypeCsvOld =
													CASE
													  WHEN @IsFixedParams4Maint = 1 AND
														aar.ActivityID IN (4, 5, 6)/*--2021-05-24*/ THEN REPLACE(REPLACE(dbt.[Type], 'ServiceSheets', ''), 'maint', '')      --2021-05-05--need to kill out type here (web app still uses varchar type) --need to convert these to integer string
													  --when @IsFixedParams4SrvcSheets = 1 then replace (dbt.[Type] ,'ServiceSheets','') --2021-05-05--not sure if this will kill both?? might need to nest them
													  ELSE dbt.[Type]
													END


*/



select RowId
     , a.ProjectID
     , a.OperationID
     , ActReasonID
     , TaskDetailType =              LookITM.appInputType
     , TaskDetailTypeId =            LookITM.appInputTypeId
     , TaskDetailTypeImageFileName = LookITM.appInputTypeImageFileName
     , Active =                      case
                         when FieldType like '%calc%'
                           and
                           isnull(gcalc.AppCalcFunction, '') = '' then
                           0
                         when FieldType = 'LoadedFrom' then
                           0
                         when isnull(appInputTypeId, 0) = 0 then
                           0
                         else
                           a.Active
               end
     , InputType =                   case --leave the input type handling here because this Function is used to cull ARs that do not have any inputs
                            /*******
    																InputType is converted to something meaningful for app here.  however "Fieldtype" is mapped to WebInputytpe in the mapping table, and is used when importing back to staging table.
    														 *********/
                            /*
                            do this out the ooor in the inputs proc, until a better soln is figured out for the LocnAttrs
                            when FieldType = 'AttrLocn_1' and ManualEntry_1 = 1  then 'AttrInput'
                            when FieldType = 'AttrLocn_2' and ManualEntry_2 = 1  then 'AttrInput'
                            when FieldType = 'AttrLocn_3' and ManualEntry_3 = 1  then 'AttrInput'
                            when fieldtype like 'attrlocn%' then 'AttrList'
                            */

                            /* do it like the above to avoid so many logical reads
                            when   iif(ManualEntry_1 = 1, 'AttrInput', 'AttrList')-- @AttrLocn_1Method
                             when FieldType = 'AttrLocn_2' then
                               iif(ManualEntry_2 = 1, 'AttrInput', 'AttrList')--  @AttrLocn_2Method
                             when FieldType = 'AttrLocn_3' then
                               iif(ManualEntry_3 = 1, 'AttrInput', 'AttrList')-- @AttrLocn_3Method
                               */

                            when
                              (
                                FieldType = 'Stat'
                                and a.InputID = 17
                              ) then
                              'TrkCount'  --this is the input for adding timestamped truck loads.  will give us back the LogDuration Field. can push back to a flag field and use on other inputs if needed 
                            when
                              (
                                FieldType = 'Stat'
                                and a.InputID = 15
                              ) then
                              'TimeStamp' --this is timestamp statistic, converts to 4 digit 24hr format
                            --WHEN @OnlyForApp = 0 AND
                            -- ari.InputType LIKE '%InGroup%' THEN 'Parameter'
                            else
                              [a].[InputType]
                  -- isnull(a.InputType, 'no map for input type')
                  end
     , FieldType =                   case
                            when --@OnlyForApp = 1 AND
                              --assume we all doing it this way now!!! aar.CombinedHaulRoute > 0 AND
                              [FieldType] = 'destination' then
                              'HaulRoute'  ----2020-05-25 special handling for combining into one for app (not supported in the web yet)
                            when --@OnlyForApp = 1 AND
                              [FieldType] = 'RelatedEquipment'
                              and
                              td_ProcessID = 4 then
                              'RelatedEquipmentUJ' --2020-07-22, swticheroo for jumboer list on chargeup tasks. because we don't have filtering in the uigroupgroup lists. have added a dataset in UI_GroupGroup to match this.
                            else
                              [FieldType]
                  end--these are the only ones that are allowed to be copied when user copy task
     , SargeableFieldType =          FieldType
     , a.InputID
     , HelpText
     , DisplayOrder
     , DisplayTrap
     , DataTypeDisplayed
     , DecPlaces
     , TimeStampThisInput
     , CalcString =                  case
                             when FieldType = 'location' then
                               ' ?'
                               + '((UIGroupGroupDetailFilterCsv LIKE ' + char(39) + '%{Location_1|||LocnParam1}%' + char(39) + ') '  --blank in param1 field will result in all active locns
                               + ' OR (UIGroupGroupDetailFilterCsv LIKE ' + char(39) + '%{Location_1|||LocnParam2}%' + char(39) + ') '  --2021-04-19, don't put commas here, they are already included in LocnParam values in teh attrJson beloew
                               + ' OR (UIGroupGroupDetailFilterCsv LIKE ' + char(39) + '%{Location_1|||LocnParam3}%' + char(39) + ') '
                               + ') '
                             when FieldType = 'Material' then
                               ' ?'
                               + '((UIGroupGroupDetailFilterCsv LIKE ' + char(39) + '%{Material_1|||MatParam1}%' + char(39) + ') '  --blank in param1 field will result in all active locns
                               + ' OR (UIGroupGroupDetailFilterCsv LIKE ' + char(39) + '%{Material_1|||MatParam2}%' + char(39) + ') '  --2021-04-19, don't put commas here, they are already included in LocnParam values in teh attrJson beloew
                               + ' OR (UIGroupGroupDetailFilterCsv LIKE ' + char(39) + '%{Material_1|||MatParam3}%' + char(39) + ') '
                               + ') '
                             when FieldType = 'RefNo' then
                               ' ?'
                               + '((UIGroupGroupDetailFilterCsv LIKE ' + char(39) + '%,{TaskHeader|||EquipmentCode},%' + char(39) + ') '  --blank in param1 field will result in all active locns
                               + ' OR (UIGroupGroupDetailFilterCsv LIKE ' + char(39) + '%,ALLEQUIP,%' + char(39) + ') '
                               + ') '

                             when --don't need this! @OnlyForApp IN (0, 1) AND
                               [FieldType] like '%InGroup%' then
                               case
                                         when [FieldType] = 'locationInGroup' then
                                           ' ?'
                                           + '((UIGroupGroupDetailFilterCsv LIKE ' + char(39) + '%{Location_1|||LocnParam1}%' + char(39) + ') '  --blank in param1 field will result in all active locns
                                           + ' OR (UIGroupGroupDetailFilterCsv LIKE ' + char(39) + '%{Location_1|||LocnParam2}%' + char(39) + ') '  --2021-04-19, don't put commas here, they are already included in LocnParam values in teh attrJson beloew
                                           + ' OR (UIGroupGroupDetailFilterCsv LIKE ' + char(39) + '%{Location_1|||LocnParam3}%' + char(39) + ') '
                                           + ') '
                                         when [FieldType] = 'MaterialInGroup' then
                                           ' ?'
                                           + '((UIGroupGroupDetailFilterCsv LIKE ' + char(39) + '%{Material_1|||MatParam1}%' + char(39) + ') '  --blank in param1 field will result in all active locns
                                           + ' OR (UIGroupGroupDetailFilterCsv LIKE ' + char(39) + '%{Material_1|||MatParam2}%' + char(39) + ') '  --2021-04-19, don't put commas here, they are already included in LocnParam values in teh attrJson beloew
                                           + ' OR (UIGroupGroupDetailFilterCsv LIKE ' + char(39) + '%{Material_1|||MatParam3}%' + char(39) + ') '
                                           + ') '
                               --SELECT * FROM [dbo].[udf_GetCalcFunctions_ForIplod](194,'get_all')
                               end

                             else
                               gcalc.AppCalcFunction
                   --CalcString
                   end
     , ForeLabel =                   case
                            when --@OnlyForApp = 1 AND
                              --assume we all doing it this way. aar.CombinedHaulRoute > 0 AND
                              [FieldType] = 'destination' then
                              'Haul Route'  ----2020-05-25 special handling for combining into one for app (not supported in the web yet)
                            else
                              ForeLabel
                  end
     , AftLabel
     , CompulsoryTrap
     , DefaultValue
     , ReviewTrap
     , IntolerableValues =           case --shift Questiontype answers into INTs
                                    when dbo.udfStringIsNullOrEmpty(IntolerableValues, null) <> 0 then
                                      ''
                                    when IntolerableValues = 'Yes' then
                                      '1' + ''
                                    when IntolerableValues = 'No' then
                                      '0' + ''
                                    when IntolerableValues = 'N/A' then
                                      '-1' + ''
                                    when FieldType = 'destination' then
                                      '-1'  ----2020-05-25 special handling for missing haul route
                                    when FieldType = 'location' then
                                      '-1' --dummy location drilled in according to this config I believe: @ShowzzDummyLocnInIplod
                                    else
                                      IntolerableValues
                          end
     , InitialValidationMsg =        case
                                       when FieldType = 'destination' then
                                         'Please write the actual haul route in comments'
                                       else
                                         InitialValidationMsg
                             end
     , FinalValidationMsg
     , InputListSelectionFilter =    isnull([Param1], '') + ',' + isnull([Param2], '') + ',' + isnull([Param3], '') + ','
       + isnull([Param4], '')
     , Shareable
     , InputGroup
     , SummaryGroup
     , DisplayInputComments
     , TypeCsvOld
     , TypeIdsCsv
     , [TrapIntolerableComment] =    case
                                           when FieldType = 'destination' then
                                             8  ----2020-05-25 special handling for missing haul route
                                           when FieldType = 'location' then
                                             8
                                           else
                                             [TrapIntolerableComment]
                                 end
     , [IsInputCommentRequired]
     , [IsInputPhotoRequired]
     , [IsInputAuthRequired]
     , KeepOnCopy =                  case
                             when td_ActivityID = 1
                               and
                               FieldType <> 'CommentsCheck'
                               and
                               inputtype = 'parameter' then
                               1
                             else
                               0
                   end
     , a.ModifiedOn
     , Param1
     , Param2
     , Param3
     , Param4
     , WebCalcString
     , AttrJson =                    case
                           -- when --don't need this! @OnlyForApp IN (0, 1) AND
                           -- FieldType like '%InGroup%' then
                           --case
                           when FieldType = 'locationinGroup' -- and isnull(DBT.Param1,'') <> '' --if the first one is blank, then assume "AllActive"
                           then
                             '[{"Key":"LocnParam1","Value":",Production,"}'
                             + ',{"Key":"LocnParam2","Value":",Development,"}'
                             --+ iif(isnull(param1,'') <> '' , ',{"Key":"LocnParam2","Value":",'+ isnull(Param2,'') + ',"}','')
                             --+ iif(isnull(Param3,'') <> '' , ',{"Key":"LocnParam3","Value":",'+ isnull(Param3,'') + ',"}','')				


                             + ']'
                           when FieldType = 'MaterialInGroup' -- and isnull(DBT.Param1,'') <> '' --if the first one is blank, then assume "AllActive"
                           then
                             '[{"Key":"MatParam1","Value":",Production,"}'
                             + ',{"Key":"MatParam2","Value":",Development,"}'
                             --	+ iif(isnull(Param2,'') <> '' , ',{"Key":"MatParam2","Value":",'+ isnull(Param2,'') + ',"}','')
                             --	+ iif(isnull(Param3,'') <> '' , ',{"Key":"MatParam3","Value":",'+ isnull(Param3,'') + ',"}','')				

                             + ']'
                           when FieldType = 'location' -- and isnull(DBT.Param1,'') <> '' --if the first one is blank, then assume "AllActive"
                           then
                             '[{"Key":"LocnParam1","Value":",' + dbo.FN_IsNotNullorEmpty(Param1, Param1, 'AllActive') + ',"}'
                             + iif(isnull(Param2, '') <> '', ',{"Key":"LocnParam2","Value":",' + isnull(Param2, '') + ',"}', '')
                             + iif(isnull(Param3, '') <> '', ',{"Key":"LocnParam3","Value":",' + isnull(Param3, '') + ',"}', '')


                             + ']'
                           when FieldType = 'Material' -- and isnull(DBT.Param1,'') <> '' --if the first one is blank, then assume "AllActive"
                           then
                             '[{"Key":"MatParam1","Value":",' + dbo.FN_IsNotNullorEmpty(Param1, Param1, 'AllActive') + ',"}'
                             + iif(isnull(Param2, '') <> '', ',{"Key":"MatParam2","Value":",' + isnull(Param2, '') + ',"}', '')
                             + iif(isnull(Param3, '') <> '', ',{"Key":"MatParam3","Value":",' + isnull(Param3, '') + ',"}', '')


                             + ']'
                           when a.FieldType like '%calc%' then
                             gcalc.AttrJSON
                           else
                             isnull(a.AttrJSON, '')
                 end
     , SupportedVersion =            case
                                   when SupportedVersion <> 0 then  --2022-10-23
                                     SupportedVersion
                                   when a.FieldType like '%calc%' then
                                     gcalc.MinVersionSupported
                                   else
                                     isnull(LookITM.MinSupportedVersion, 0)
                         end --2022-07-28  --supported version can be less than 0, in which case SupportedVersion indicates the maximum version before this input is retired
     , AdditionalRegex
     , td_ReportingBitWise
     , ToleranceLower =              nullif(ToleranceLower, 0)  --be very careful relaxing this!  it will get pushed out to device and render stat calcs invalid (with nothing to fix them)
       --the assumption here is that we would not use toleranceUpper/lower with value of zero. if want to force something to be compulsory use the compulsory flag instead.
     , TL_Text
     , ToleranceUpper =              nullif(ToleranceLower, 0)
     , TU_Text
     , td_ActivityID
     , td_ReasonID
     , td_ProcessID
       --,OnlyForApp
     , ExcludeFromApp
     , ExcludeFromWeb
     , DeploymentModeCsv --=        ''
     , DataSrc =                     'cachetable'
     , AppliesToAllProjects
from tbl_DBT_GetTaskDetails_ForIplod_Cached_v2 as a with (nolock)

  --just join the fukker, I put a unique constraint on it
  left join --(    select MinSupportedVersion = max(MinSupportedVersion)
  -- , appInputTypeId
  --from 
  dbo.tbl_SYS_iplodInputTypeMappings as LookITM with (nolock)
    --where Active > 0
    --group by appInputTypeId) as LookITM
    --on a.TaskDetailTypeId = LookITM.appInputTypeId
    on LookITM.Active = 1
      and a.FieldType = LookITM.webInputType
      and a.DataTypeDisplayed = LookITM.webDataTypeDisplayed

  --left join dbo.tbl_DBT_LocationAttributes as tdla with (nolock)
  -- on a.ProjectID = tdla.ProjectID
  -- and a.FieldType like '%attr%'


  -- outer apply dbo.udf_GetCalcFunctions_ForIplod(a.ProjectID, a.WebCalcString) as gcalc
  left join dbo.udf_GetCalcFunctions_ForIplod(0, 'get_all') as gcalc
    on a.WebCalcString = gcalc.WebCalcFunction

where /*not exists (
        select tdarshl.ActReasonID
        from dbo.tbl_DBT_ActReasonSpecialHandlingLink as tdarshl
        where tdarshl.AR_Groupingname in ('ARTemplatesShiftSummary', 'ShiftSummaryWorkflowActivityReasonIdCsv', 'ShiftSummaryActivityReasonNonFinaliseIdsCSV')
          and tdarshl.ActReasonID = a.ActReasonID)
          
      and */
      a.ExcludeFromApp = 0
      and not ([FieldType] = 'LoadedFrom')--the app deals hauls routes as composites single input, hinged off the destination. the web app uses 2 separate fields.
      and not (a.FieldType = 'stat'
        and a.InputID = 7)
      and a.active = 1
/*union all
--2022-10-04 put this into the dbo.SP_ProjSetup_BuildCacheTablesWithMerge
select RowId =                       0--pretty sure we pick it up in INputs Proc?yep, uniqueINputId is generated at the last.
     , ProjectID --
     , OperationID =                 (
         select top 1 OperationId
         from tbl_dbT_Project
         where ProjectId = ProjectID) --presume pick this up in INputs Proc?
     , ActReasonID
     , TaskDetailType =              inputType
     , TaskDetailTypeId
     , TaskDetailTypeImageFileName = ''
     , Active
     , InputType
     , FieldType =                   InputType
     , InputID
     , HelpText
     , DisplayOrder --=  ROW_NUMBER() OVER ( ORDER BY 1)  --order them the way we want in the fixed config fucntion
     , DisplayTrap =                 1
     , DataTypeDisplayed
     , DecPlaces
     , TimeStampThisInput =          0
     , CalcString
     , ForeLabel
     , AftLabel
     , CompulsoryTrap
     , DefaultValue =                '' --shift back if needed.
     , ReviewTrap =                  0
     , IntolerableValues
     , InitialValidationMsg
     , FinalValidationMsg
     , InputListSelectionFilter =    ''  --legacy, shift back if needed
     , Shareable =                   ''  --legacy, shift back if needed
     , InputGroup
     , SummaryGroup =                0 --legacy, shift back if needed
     , DisplayInputComments =        0 --legacy, shift back if needed
     , TypeCsvOld
     , TypeIdsCsv
     , [TrapIntolerableComment]
     , [IsInputCommentRequired]
     , [IsInputPhotoRequired]
     , [IsInputAuthRequired]
     , KeepOnCopy =                  0  --  shift back if needed
     , ModifiedOn =                  getdate()
     , Param1 =                      ''  --legacy, shift back if needed
     , Param2 =                      ''  --legacy, shift back if needed
     , Param3 =                      ''  --legacy, shift back if needed
     , Param4 =                      ''  --legacy, shift back if needed
     , WebCalcString =               ''  --legacy, shift back if needed
     , AttrJson =                    ''  -- shift back if needed
     , SupportedVersion  --supported version can be less than 0, in which case SupportedVersion indicates the maximum version before this input is retired
     , AdditionalRegex =             ''  -- shift back if needed
     , td_ReportingBitWise
     , ToleranceLower =              0  --legacy, shift back if needed
     , TL_Text =                     ''  --legacy, shift back if needed
     , ToleranceUpper =              0 --legacy, shift back if needed
     , TU_Text =                     ''  --legacy, shift back if needed
     , td_ActivityID =               tsarl.ActivityID
     , td_ReasonID =                 tsarl.ReasonID
     , td_ProcessID =                tsarl.ProcessID
     , ExcludeFromAPp =              0  --OnlyForApp = 1
     , ExcludeFromWeb =              1
     , DeploymentModeCsv --need to handle this in the Inputs Proc WHERE DeploymentModeCsv LIKE @DeploymentMode OR DeploymentModeCsv = ''
     , DataSrc =                     'fixedsummaryfunction'
     , AppliesToAllProjects =        'yes!'
from dbo.tvf_FixedConfigs_iPlodSummaryTemplateDetails(0, 0)   /* can't put it here: WITH RECOMPILE*/ as a
  inner join dbo.tbl_SYS_ActivityReasonLink as tsarl
    on tsarl.ActivityreasonLinkID = a.ActReasonID
--where 1=2
*/

/*
todo: check on these:
I have inspected the following:	399
Sign Register	399
Stope Sign Register	399
<p>Please write your name here</p>	291
<p>I would like to bring the following matters and hazards to my Supervisors attentions</p>	399
How To Guides	399






*/


























GO
PRINT N'Refreshing [dbo].[View_ShiftSummary_HoleTemperatureReadings]'
GO
EXEC sp_refreshview N'[dbo].[View_ShiftSummary_HoleTemperatureReadings]'
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
EXEC dbo.SP_API_IPLODSetup_UserMessages @operationId = 0, @projectId = 387, @isPurge = @isPurge OUTPUT, @appDeploymentMode = 'mining_fitters', @appVersion = 'v2022.10.13 (269)'
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
              ts 2022-10-24 ... add fixed message for bug in v323/324


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

                                  UNION ALL --2022-10-24 --remove after job done
                              		SELECT
                              			OperationID = @operationId
                              			, ProjectId = @projectId
                              			, UserMessageId = '-324'
                              			, IsAckRequired = 1
                              			, UserMessageHtml  = --html not fucking supported?--[dbo].[FN_MarkupFullHtml_v2]('This Version of '+@AppName + ' has a known bug!',1,0,'Red','') +'
'This Version of PLOD has a known bug! <br>
<br> 
<br> 
<br> PLEASE AVOID USE OF THE NEW LINE BUTTON WHEN TYPING COMMENTS  <br> 
<br> 
<br> 
<br> (It may cause you to be booted out and unable to log back into that shift) <br> 
<br> 
<br> 
<br> We are working to release a fix for this issue ASAP <br> '

					
                              			, IsEnabled = 1
                              			, OrderBy = 2
                              			, ForEmployeeIdsCsv = '0'
                              
                              			, LastModifiedOn =GETDATE()
                              			-- Flags.
                              			, SpecificEmployeeCount = 0
                              			,Username = ' - The '+@AppName + ' Team.'
                              			WHERE @appVersionInt between 20221001 and 20221020
                              


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
PRINT N'Altering [dbo].[SP_ProjectSetup_WebbarSync_AutomatedTestingQueries]'
GO

ALTER   PROCEDURE [dbo].[SP_ProjectSetup_WebbarSync_AutomatedTestingQueries]
    @ProjectID AS INT,
    @UserID AS INT,
    @TestPlanCode AS NVARCHAR(250)
AS
BEGIN

    /*
	Changelog:
	20220816 IP Inital commit
	*/

    SET NOCOUNT ON;

    DECLARE @IsLiveDB INT = dbo.FN_IsLiveDB(@ProjectID);

    DECLARE @QueryList CURSOR;
    DECLARE @RowID AS INT;
    DECLARE @QueryScript AS NVARCHAR(MAX);

    DECLARE @ErrorMsg AS NVARCHAR(MAX);
    DECLARE @QueryStatus AS TINYINT;

    -- for time recording
    DECLARE @t1 DATETIME;
    DECLARE @t2 DATETIME;
    DECLARE @QueryTime DECIMAL(18,6);

    SET @QueryList = CURSOR FOR
    SELECT t.RowID,
           QueryScript = REPLACE(t.QueryScript, '{ProjectID}', @ProjectID)
    FROM [dbo].[tbl_DBT_QueryLogsTesting] AS t
		LEFT JOIN dbo.tbl_DBT_QueryLogsTestingRun AS r
			ON t.RowID = r.QLTRowID
    WHERE t.TestPlanDescription = @TestPlanCode
          AND
          (
              @IsLiveDB = 0
              OR
              (
                  @IsLiveDB = 1
                  AND t.IsAllowedInProduction = 1
              )
          )
		  AND 
		  (
			  r.QLTRowID IS NULL -- the query is not run yet
			  OR r.QueryStatus = 0 -- or it ran but failed
		  )
	ORDER BY t.QueryRunDateTime ASC;

    OPEN @QueryList;
    FETCH NEXT FROM @QueryList INTO @RowID, @QueryScript;

    -- iterate through each lines of query to change the ProjectID and run it
    WHILE @@FETCH_STATUS = 0
    BEGIN

        BEGIN TRY

            BEGIN TRANSACTION TestQuery;

            SET @t1 = SYSDATETIME();
            EXEC sp_executesql @QueryScript;
            SET @t2 = SYSDATETIME();

            SET @QueryTime = DATEDIFF(MILLISECOND, @t1, @t2);
            SET @QueryTime = @QueryTime / 1000;
			PRINT @QueryTime
			SET @ErrorMsg = NULL;
			SET @QueryStatus = 1;

            COMMIT TRANSACTION TestQuery;

        END TRY
        BEGIN CATCH
            IF (@@TRANCOUNT > 0)
            BEGIN
                ROLLBACK TRANSACTION TestQuery;
                SET @ErrorMsg = ERROR_MESSAGE();
				SET @QueryStatus = 0;
            END;
        END CATCH;

		-- insert the result into log table
        INSERT INTO [dbo].[tbl_DBT_QueryLogsTestingRun]
        (
            [QLTRowID],
			[UserID],
            [QueryRunDateTime],
            [QueryTime],
            [QueryStatus],
            [ErrorMsg]
        )
        VALUES
        (
			@RowID
			,@UserID
			,GETDATE()
			,@QueryTime
			,@QueryStatus
			,@ErrorMsg
		);
				
		FETCH NEXT FROM @QueryList INTO @RowID, @QueryScript;
    END;
END;
GO
PRINT N'Altering [dbo].[SP_ProjSetup_BuildDynamicView_ReportingAttributes]'
GO

ALTER PROCEDURE [dbo].[SP_ProjSetup_BuildDynamicView_ReportingAttributes]
    -- Add the parameters for the stored procedure here
    @ProjectID INT,
   @UserId int = 0,
   @Debugmode int = 0,
    @Viewname VARCHAR(255),
   @RebuildWithDelete int = 0,
   @IncludeIDFields INT = 0
as
BEGIN
/*
 exec [SP_ProjSetup_BuildDynamicView_ReportingAttributes] @Projectid = 3, @Viewname= 'vw_ReportingSnapshotLatest_KpisCombined_All' --, @Debugmode = 1
 with recompile  

 exec [SP_ProjSetup_BuildDynamicView_ReportingAttributes] @Projectid = 3, @Viewname= 'vw_ReportingSnapshotLatest_KpisCombined_All' , @Debugmode = 1
 exec [SP_ProjSetup_BuildDynamicView_ReportingAttributes] @Projectid = 401, @Viewname= 'vw_ReportingSnapshotLatest_KpisCombined_AllWithIDs',@IncludeIDFields=1 --, @Debugmode = 1

 for teh pursposes of creating a dynamic view with the required fields from teh data. this view is then used in reporring.


2021-11-25 ts ... add teh statributes
2022-06-14 ts ... use the reporting snapshot syns instead of raw data
              ... and wire in the coalesec ones
              ... add handling for null on the substrinc
2022-06-26 ts ... change the order, put the important ones up top
2022-07-11 ts ... add cal times
              ... save teh old one away
2022-07-14 ian ... added logging to table
2022-10-12 ts ... call with @projectid filter too
2022-10-13 ts ... comment with blocks instead of --
              ... qualify the field names to try and bring WorkArea in
              ... not that. don't put new lines between the fields !!! 
              ... add PvtJn_TaskId
              ... add some IDs to come everytime
              ... don't do nvarchar. maybe we runnign out of room!
              ... try putting nvarchar back
			  ... remove teh nested comments
			  ... add some debugging
        ... remove all teh commentary to save on characters
2022-10-23 ts ... add etl datetime




todo: add MaterialSys 

*/

    SET NOCOUNT ON;

  --  BEGIN TRY

	 ---- SET TRANSACTION ISOLATION LEVEL SERIALIZABLE; --old mate on the internet reckoned this was needed?
  --      BEGIN TRANSACTION;

 declare @dyn_col_list NVARCHAR(MAX) = ''

    --already in there SELECT @dyn_col_list  = ' ProjectId											,PvtJn_TaskId 											,PvtJn_InputGroupId '



SELECT --get the dynamic ones from the pivot
@dyn_col_list = COALESCE(@dyn_col_list + ', ','') + QUOTENAME([a_AttrTypeDesc])
				FROM (SELECT DISTINCT
							 [a_AttrTypeDesc]	=Pvt_FieldNames
						FROM 
            [dbo].[syn_STO_ReportingSnapshot_AttributesTable_All] 
					--	dbo.tbl_DWH_Attributes_v3 
						where @ProjectId = projectid
            AND isnull(Pvt_FieldNames,'') <> '' 
          /*  UNION ALL 
            SELECT DISTINCT
							 tss.StatisticCode	
						FROM 
						dbo.tbl_DWH_ProdDataStorage_v3  a
            LEFT JOIN tbl_SYS_Statistic tss
              ON a.StatisticID = tss.StatisticID
						where @ProjectId = projectid
            AND tss.StatisticTypeID = 9*/
						) as tbl
  ORDER BY [a_AttrTypeDesc]


--kill the first comma:
SET @dyn_col_list = iif(@dyn_col_list is null, null,  substring(@dyn_col_list, 2, len(@dyn_col_list)-1))

--use this to make the coalesce bit:
 declare @dyn_col_listCoalesce NVARCHAR(MAX) = ''

SELECT --get the dynamic ones from the pivot
@dyn_col_listCoalesce =
 COALESCE(@dyn_col_listCoalesce + ', ','') +
           
           QUOTENAME([a_AttrTypeDesc]) + ' = ' + 'coalesce(b.'+quotename([a_AttrTypeDesc]) + ', bb.'+ quotename([a_AttrTypeDesc]) +')'
                                    
				FROM (SELECT DISTINCT
							 [a_AttrTypeDesc]	=Pvt_FieldNames
						FROM 
            [dbo].[syn_STO_ReportingSnapshot_AttributesTable_All] 
					--	dbo.tbl_DWH_Attributes_v3 
						where @ProjectId = projectid
            AND isnull(Pvt_FieldNames,'') <> '' 
           /* UNION ALL 
            SELECT DISTINCT
							 tss.StatisticCode	
						FROM 
						dbo.tbl_DWH_ProdDataStorage_v2  a
            LEFT JOIN tbl_SYS_Statistic tss
              ON a.StatisticID = tss.StatisticID
						where 291 = projectid
            AND tss.StatisticTypeID = 9*/
          
						) as tbl
  ORDER BY [a_AttrTypeDesc]




    DECLARE @execVar NVARCHAR(MAX) = N'CREATE OR ALTER VIEW [dbo].['+@Viewname +']
AS 
/*
select * from [dbo].['+@Viewname +'] where projectid = 387  -- ts local pea 55secs, 156492 rows
 DO NOT EDIT THIS VIEW, IT NEEDS TO BE EDITED IN HERE SP_ProjSetup_BuildDynamicView_ReportingAttributes
'
+ 'AUTO CREATED on:'+CAST(GETDATE() AS VARCHAR(25))+
'
*/
 SELECT 
											 SnapshotBuildDateTime = EtlDateTime
                       ,[a].[UniqueDataSetId]
                       ,[a].[PvtJn_TaskId]
                       ,[a].[Date]
                       ,[a].[Shift]
                       ,[a].[ProjectID]
                       ,[a].[ActualValue]
                       ,[a].[MetricValue]
                       ,[a].[TargetValue]
                       ,[a].[MetricCode]
                       ,[a].[MetricDesc]
                       ,[a].[MetricSubtotalCode]
                       ,[a].[StatisticCode]
                       ,[a].[Units]
                       ,[a].[EmployeeName]
                       ,[a].[EquipmentCode]
                       ,[a].[LocationCode]
                       ,[a].[MaterialDescOp]
                       ,[a].[Site]
                       ,[a].[ActivityDesc]
                       ,[a].[BogFrom]
                       ,[a].[BogTo]
                       ,[a].[BudgetCode]
                       ,[a].[CalStartTime]
                       ,[a].[CalEndTime]
                       ,[a].[ConsumableDesc]
                       ,[a].[ConsumableDescShort]
                       ,[a].[CrewCode]
                       ,[a].[DestDestCode]
                       ,[a].[DestinationCode]
                       ,[a].[DumpedTimeStamp]
                       ,[a].[DumpedTruckCount]
                       ,[a].[EndTime]
                       ,[a].[EquipTypeCode]
                       ,[a].[InputComment]
                       ,[a].[InputPhoto]
                       ,[a].[InputTimeStamp]
                       ,[a].[Level]
                       ,[a].[LoadedAtCode]
                       ,[a].[LoadedTimestamp]
                       ,[a].[LoadedTruckCount]
                       ,[a].[LocnMasterSourceCode]
                       ,[a].[LocnSourceCode]
                       ,[a].[OriginalValue]
                       ,[a].[ProcessDesc]
                       ,[a].[ProjectMask]
                       ,[a].[ReasonDescription]
                       ,[a].[RevisedValue]
                       ,[a].[StartTime]
                       ,[a].[SupervisorComments]
					   ,[a].[WorkArea]
                       ,[a].[StatisticID]
                       ,[a].[TaskComments]
					   ,[a].[ReasonID]
                       ,[a].[RelatedEquipID]
                       ,[a].[PvtJn_InputGroupId]
                      '+ CASE WHEN @IncludeIDFields=0 THEN '' 
					  ELSE
					   '/*ID fields:*/
						,[a].[ActivityID]
                       ,[a].[ActivityReasonID]
                       ,[a].[AttrTypeId_289]
                       ,[a].[AttrTypeId_48]
                       ,[a].[BogFromId]
                       ,[a].[BogToId]
                       ,[a].[BudgetCodeID]
                       ,[a].[ConsumableID]
                       ,[a].[ConsumableProjID]
                       ,[a].[CrewID]
                       ,[a].[DataStoreID]
                       ,[a].[DestinationID]
                       ,[a].[DestMasterID]
                       ,[a].[DetailID]
                       ,[a].[EquipmentID]
                       ,[a].[EquipTypeId]
                       ,[a].[LoadedAtId]
                       ,[a].[LocationID]
                       ,[a].[MaterialID]
                       ,[a].[MaterialSysId]
                       ,[a].[Metric_SubtotalId]
                       ,[a].[MetricId]
                       ,[a].[MonthTargetID]
                       ,[a].[OperationID]
                       ,[a].[OperatorID]
                       ,[a].[PlodDataId]
                       ,[a].[ProcessID]
                       ,[a].[RelatedEquipmentID]
                       ,[a].[RelatedEquipTypeId]
                       ,[a].[Sequence]
                       ,[a].[SourceMasterID]
                       ,[a].[StatisticTypeID]
                       ,[a].[SubtotalId]
                       ,[a].[UniqueTaskId]
                       ,[a].[WorkType]
														' end + @dyn_col_listCoalesce +

										  'FROM [syn_STO_ReportingSnapshot_KpiStats_All] AS a

LEFT JOIN (SELECT  ProjectId
   ,PvtJn_TaskId
   ,PvtJn_InputGroupId
    ,Pvt_FieldNames
   ,Pvt_Value = MAX(a.[AttributeValue])

  FROM
   dbo.[syn_STO_ReportingSnapshot_AttributesTable_All] AS a WITH (NOLOCK) 
  WHERE PvtJn_InputGroupId >= 0
    GROUP BY a.PvtJn_InputGroupId
          ,a.PvtJn_TaskId
          ,[a].[ProjectId]
          ,Pvt_FieldNames) AS a
PIVOT
(
MAX(Pvt_Value)
FOR Pvt_FieldNames IN (
'+ @dyn_col_list+
')
) AS b


  ON a.PvtJn_TaskId = b.PvtJn_TaskId
    AND (a.PvtJn_InputGroupId = b.PvtJn_InputGroupId)-- OR b.PvtJn_InputGroupId = -1)  
LEFT JOIN (SELECT 
    ProjectId
   ,PvtJn_TaskId
   ,PvtJn_InputGroupId
   ,Pvt_FieldNames
   ,Pvt_Value = MAX(a.[AttributeValue])
  FROM
  dbo.[syn_STO_ReportingSnapshot_AttributesTable_All] AS a WITH (NOLOCK) 
  WHERE PvtJn_InputGroupId < 0
  GROUP BY --a.PvtSeqJoin
  a.PvtJn_TaskId
 ,a.PvtJn_InputGroupId
 ,[a].[ProjectId]
 ,Pvt_FieldNames) AS a
PIVOT
(
MAX(Pvt_Value)
FOR Pvt_FieldNames IN (
'
+@dyn_col_list+
')
) AS bb
  ON a.PvtJn_TaskId = bb.PvtJn_TaskId
  
 '+ iif( @ProjectId = 1 ,''  , 'WHERE a.ProjectId = ' +cast(@ProjectID as varchar(25)))  /*if calling the build proc  with @ProjectID = 1 then don't filter.*/
                                    
                      
declare @CurrentSchema Nvarchar(max);
select @CurrentSchema = definition
from sys.objects o
    join sys.sql_modules m
        on m.object_id = o.object_id
where o.object_id = object_id(@Viewname)
      and o.type = 'V'
                      
                      
	if @Debugmode=1
	BEGIN
    PRINT  'dyn_col_list len:'+CAST(LEN(@dyn_col_list) AS VARCHAR(25))
	PRINT  'dyn_col_listCoalesce len:'+CAST(LEN(@dyn_col_listCoalesce) AS VARCHAR(25))
	PRINT  '@execVar len:'+CAST(LEN(@execVar) AS VARCHAR(25))
	print '@dyn_col_list= '+ @dyn_col_list 
  	print '@dyn_col_listCoalesce= '+ @dyn_col_listCoalesce 
	print '@execVar= ' +@execVar 
  	select '@dyn_col_list= '+ @dyn_col_list
  	select '@dyn_col_listCoalesce= '+ @dyn_col_listCoalesce
	select '@execVar= ' +@execVar
	select '@CurrentSchema= ' +ISNULL(@CurrentSchema, 'new view')
	end
     if @Debugmode = 0 and @dyn_col_list <>''  --don't make it if no attributes available on the data.
		begin 
    BEGIN TRY
   
		-- logs the changes into table
		insert into tbl_STO_DynamicSchema_ChangeLog (ProjectID, ViewName, OldSchema, ChangeNotes, ChangeDateTime, UserID) values (@ProjectID, @Viewname, ISNULL(@CurrentSchema, 'new view'), 'autojob', getdate(), @UserId);

		exec sp_executesql @execVar;
	
    END TRY

    BEGIN CATCH
        PRINT ERROR_MESSAGE();
    END catch
    	end

end




GO
PRINT N'Refreshing [dbo].[vw_Integration_External_LoadScan]'
GO
EXEC sp_refreshview N'[dbo].[vw_Integration_External_LoadScan]'
GO
PRINT N'Altering [dbo].[SP_ProjSetup_GenericListEdits_Data]'
GO
ALTER procedure [dbo].[SP_ProjSetup_GenericListEdits_Data] @ListName NVARCHAR(50) = 'LocProfiles', @UserID INT = 0, @ProjectID INT = 0
AS
BEGIN
    SET NOCOUNT ON;
    /*
	EXEC [dbo].[SP_ProjSetup_GenericListEdits_Data] @ProjectID = 194, @UserID = 137, @ListName = 'LocProfiles'
		EXEC [dbo].[SP_ProjSetup_GenericListEdits_Data] @ProjectID = 194, @UserID = 137, @ListName = 'LocLevels'
	EXEC [dbo].[SP_ProjSetup_GenericListEdits_Data] @ProjectID = 194, @UserID = 137, @ListName = 'GSSStandard'
  EXEC [dbo].[SP_ProjSetup_GenericListEdits_Data] @ListName = N'SignRegister', @UserID = 250, @ProjectID = 259


	Change log:
	2021-01-08 (IP) initial commit
	2021-01-15 ts return the list id fields (Id and Lable)
	2021-01-26 ww Add LocLevels
	2021-01-27 ww Fix bug static value for LocLevels (project = 1)
	2021-02-09 ww add for GSS
	2021-02-03 ts ... loclevels not giving any data (need ELSE apparently
	2021-03-24 ts ... add ips table
	2021-03-25 ww ... add attrtypes
	2021-03-26 ts ... add attributes
	2021-03-30 ww ... remove groupName
	2021-04-07 ts ... add groupname for new rows on attributes
	2021-04-08 ts ... pickup attrtype on add new
	2021-05-21 ts ... standardise handling for add new lines
	2021-06-03 ts ... add order by on loclevels
				... added @ProjectId and @OperationID to add new rows
	2021-06-04 ts ... added sys pages
	2021-06-10 ts ... add Sys_PLOD_Devices
					... fix datatype
	2021-06-17 ts ... add fields to devices
	2021-06-28 ts ... add equiplisting
	2021-06-30 ts ... colour codings into equipment
	2021-07-02 ts ... do'nt grpu equipment
	2021-07-14 ian ... added sysqcategories and loadscan
	2021-07-27 ian ... added PlodSessionHistory
	2021-08-20 ts ... added group for the plod session history
	2021-08-23 ts ... add RigName to the tablets for mapping to raisebore rigs
	2021-09-09 ian ... add Docs_SurveyMemos
	2021-09-23 ian ... added shitplan various lists
	2021-09-27 ian ... added SYS_TargetFields
	2021-09-27 ian ... added DBT_TargetFields
  2021-10-21 ts ... survey memos go is as SurveyMemos group
  2021-11-29 ian ... added plodconfigs
  2021-12-10 CA ... Add SIgn Register
  2022-01-14 IP ... add TargetsUpload
  2022-02-09 ts ... bring new fields from the view changes for session histroy.
                ... change the order by on the plod session history (put work type last. date desc first
  2022-02-04 ian ... added PlodSyncHistory
  2022-02-15 ts ... order on the session historuy
  2022-02-21 ts ... group by employeename on session histroy
  2022-03-15 ian ... added new list for sync jobs
  2022-03-17 ian ... changed AllowedTypeIdsCsv value
  2022-03-17 ian ... added locationId for Docs_SurveyMemos
  2022-04-12 ian ... added Dbt_Locations
  2022-05-03 ts ... add proj filter to qr generator 
  2022-05-04 CA ... Added EquipPit filter for sys_EquipList. Filters on UserGroupPitID
  2022-05-25 ts ... don't get all of employees table for session hsitroy!
  2022-06-17 CA ... Comment for Toms QR changes so it isnt overwritten.......
   2022-06-17 CA ... So Equip List tidy ups
   2022-06-30 ian ... added sync task dashboard
  2022-07-05 CA ... Users fixes
  2022-07-19 ian ... added add_updateV2
  2022-08-03 CA ... Added SignRegister locns stuff
  2022-08-04 CA ... Added stope sign register
  2022-09-04 CA ... Added Comments for signs
  2022-09-26 IP ... added ActReasonEdits ListName
  2022-09-26 IP ... added ExcludeFromWeb and App
  2022-10-07 IP ... drop TaskDetailType, TaskDetailTypeId
  2022-10-11 RF ... Added scanDensityFactor to sys_equiplists
  2022-10-12 IP ... add join to [vw_Iplod_GetAR_TaskGroupingsAll] for ask Group name on ActReasonEdits
   2022-10-15 ts ... or proj 1 for Sync task dashboard
	*/

	DECLARE @IsDBAdmin INT = dbo.FN_IsWebbarFullAdmin(@UserID)
  DECLARE @OperationID INT = (SELECT
      OperationID
    FROM dbo.tbl_DBT_Project
    WHERE ProjectID = @ProjectID)
	declare @ShadeForAddNewLine nvarchar(25) = '#ffb84d'
	DECLARE @IsLocal int = dbo.FN_IsLocal(@ProjectID)
	DECLARE @IsTestDb int = IIF(dbo.FN_IsLiveDB(@ProjectID)=1,0,1)
	DECLARE @UploadPath VARCHAR(128) = [dbo].[udf_FilePath](@ProjectID, 'Document_Location',@IsLocal,@IsTestDb)
  DECLARE @Cmd nvarchar(150) = ''
  
 -- Use this to show passwords only of lower usergroups
  declare @UserGroupLevel INT = (SELECT UserGroup FROM tbl_SYS_User where UserID = @UserID)


DECLARE @SignRegisterSrc varchar(50) = CAST(ISNULL(dbo.FN_GetConfigValue(@ProjectID, 'ViewSrc'), 'UniqueSigns' ) AS varchar(50) )


    IF @ListName = 'LocProfiles'
    BEGIN
        SELECT 
			--hard coded fields:
            ListName = 'LocProfiles'
            --,ListValueId = ProfileID   -- eg ProfileId
            --,ListValueLabel = 'Profile'  -- eg Profile
            ,LineShadeColour = 'white' -- used to grey out inactive lines. (http://www.colors.commutercreative.com/grid/)

			         --List IdentityFields
                     ,ProfileID  --ListValueId
                     , Profile   --ListValueLabel

            --dynamic fields:
            ,OperationID
            ,ProjectID
            -- ,Profile
            ,DriveType
            ,Width
            ,Height
            ,HolesPerCut
            ,NominalCutLength
            ,OreTonnesPerM
            ,WasteTonnesPerM
            ,ProfileArea
            ,Comments
            ,DefaultGSS_ID
            ,ModifiedOn
        FROM dbo.tbl_DBT_LocationProfiles
        WHERE ProjectID = @ProjectID

        UNION ALL

		-- for add new line
        SELECT 
			--hard coded fields:
            ListName = 'LocProfiles'
            --,ListValueId = -1                   -- eg ProfileId
            --,ListValueLabel = 'Add New Profile' -- eg Profile
            ,LineShadeColour = @ShadeForAddNewLine--'orange'         -- used to grey out inactive lines. (http://www.colors.commutercreative.com/grid/)

			,ProfileID = -1  --ListValueId
            , Profile  =  '<< Add New Profile >>'  --ListValueLabel

            --dynamic fields:
            ,OperationID = @OperationID
            ,ProjectID = @ProjectID
            -- ,Profile
            ,DriveType = NULL
            ,Width = NULL
            ,Height = NULL
            ,HolesPerCut = NULL
            ,NominalCutLength = NULL
            ,OreTonnesPerM = NULL
            ,WasteTonnesPerM = NULL
            ,ProfileArea = NULL
            ,Comments = NULL
            ,DefaultGSS_ID = NULL
            ,ModifiedOn = GETDATE()

	order by Profile

    END;
  ELSE
  IF @ListName = 'LocLevels'
    BEGIN
        SELECT 
			--hard coded fields:
            ListName = 'LocLevels'
            ,LineShadeColour = 'white' 
			,LevelID  --ListValueId
            ,LevelDescription--ListValueLabel
            ,OperationID
			--dynamic fields:
            ,ProjectID
			,RL
			,LongDescription

        FROM dbo.tbl_DBT_LocationLevels
        WHERE ProjectID = @ProjectID

        UNION ALL

		-- for add new line
        SELECT 
			--hard coded fields:
            ListName = 'LocLevels'
            ,LineShadeColour =@ShadeForAddNewLine-- 'orange' 
			,LevelID = -1 --ListValueId
            ,LevelDescription = '<< Add new Level >>' --ListValueLabel
            --dynamic fields:
			            ,OperationID = @OperationID
            ,ProjectID = @ProjectID
            --,OperationID = NULL
            --,ProjectID = NULL
     ,RL = NULL
     ,LongDescription = NULL
            order by LevelDescription
    END;
	IF @ListName = 'GSSStandard'
    BEGIN
        SELECT 
			--hard coded fields:
            ListName = 'GSSStandard'
            ,LineShadeColour = 'white' 
			,GSS_ID  --ListValueId
			,GS_StandardCode--ListValueLabel
            ,OperationID
			--dynamic fields:
			,ProjectID
			,GS_Description
			,Rate
			,ShotcreteMatID
			,ShotcreteThickness
			,ShotcreteRate

        FROM dbo.tbl_DBT_GSSStandards
        WHERE ProjectID = @ProjectID

        UNION ALL

		-- for add new line
        SELECT 
			--hard coded fields:
            ListName = 'GSSStandard'
            ,LineShadeColour = @ShadeForAddNewLine--'white' 
			,GSS_ID = -1 --ListValueId
            ,GS_StandardCode = '<< Add new GSS Standard >>' --ListValueLabel
			,OperationID = @OperationID
            --dynamic fields:
            ,ProjectID = @ProjectID
			,GS_Description = NULL
			,Rate = NULL
			,ShotcreteMatID = NULL
			,ShotcreteThickness = NULL
			,ShotcreteRate = NULL
    END;

	--add new lists below here
	IF @ListName = 'AttrTypes'
	BEGIN
	  SELECT 
			--hard coded fields:
            ListName = 'AttrTypes'
            ,LineShadeColour = 'white' 
			,AttTypeID  --ListValueId
			,AttTypeDesc--ListValueLabel
			--dynamic fields:
			,Active
			,Comments
        FROM dbo.tbl_SYS_AttributeType
	 UNION ALL
	 SELECT 
			--hard coded fields:
            ListName = 'AttrTypes'
            ,LineShadeColour = @ShadeForAddNewLine--'white' 
			,AttTypeID = -1 --ListValueId
            ,AttTypeDesc = '<< Add new Attribute Type >>' --ListValueLabel
            --dynamic fields:
			,Active = 1
			,Comments = null
         order by AttTypeDesc
	END;

		--add new lists below here
	IF @ListName = 'Attributes'
	BEGIN
	  SELECT 
			--hard coded fields:
            ListName = 'Attributes'
            ,LineShadeColour = 'white' 
			,AttributeID  --ListValueId
			,AttributeDescription--ListValueLabel
			,GroupNameDisplay = cast(a.AttributeTypeID as varchar) + ' (' +at.AttTypeDesc + ')'

				--dynamic fields:
			--,ProcessID
     --, AttributeDescription
     , AttributeTypeID
     , Units
     , a.Active
     , a.Comments
    -- , IsDefault
        FROM dbo.tbl_SYS_Attribute as a
		inner join dbo.tbl_SYS_AttributeType as at
			on a.AttributeTypeID = at.AttTypeID
	 UNION ALL
	 SELECT 
			--hard coded fields:
            ListName = 'Attributes'
            ,LineShadeColour =@ShadeForAddNewLine-- 'white' 
			,AttributeID = -1 --ListValueId
            ,AttributeDescription = '<< Add new List Value for '+a.AttTypeDesc +' >>' --ListValueLabel
			,GroupNameDisplay=cast(a.AttTypeID as varchar) + ' (' +a.AttTypeDesc + ')'
            --dynamic fields:
			--,ProcessID
     --, AttributeDescription
     , AttributeTypeID = a.AttTypeID 
     , Units = null
     , Active = 1
     , Comments= null
	 from dbo.tbl_SYS_AttributeType a
    -- , IsDefault
	order by AttributeDescription

	END;

	IF @ListName = 'SysMenuLinks'
	BEGIN
	--SELECT PageID, PageDescription FROM dbo.tbl_SYS_PagesDataEntry

	  SELECT 
			--hard coded fields:
            ListName = 'SysMenuLinks'
            ,LineShadeColour =ButtonColour -- 'white' 
			,PageID  --ListValueId
			,PageDescription--ListValueLabel
     ,GroupNameDisplay =
      CASE
        WHEN Active = 0 THEN 'Inactive'
        ELSE MenuList
      END

				--dynamic fields:
     ,PageName
     ,Active
     ,MinUserGroup
     ,MenuList
     ,ButtonColour
     ,AllowedOnLocal
     ,PageCode
     ,HeaderMessageHtml
FROM dbo.tbl_SYS_PagesDataEntry
	 UNION ALL
	 SELECT DISTINCT
			--hard coded fields:
            ListName = 'SysMenuLinks'
            ,LineShadeColour =@ShadeForAddNewLine-- 'white' 
			,PageID  =-1
			,PageDescription ='<< Add new Menu Link on ' + MenuList
			,GroupNameDisplay =MenuList

				--dynamic fields:
     ,PageName = NULL
     ,Active = NULL
     ,MinUserGroup = NULL
     ,MenuList = NULL
     ,ButtonColour = NULL
     ,AllowedOnLocal = NULL
     ,PageCode = NULL
     ,HeaderMessageHtml = NULL

	 FROM dbo.tbl_SYS_PagesDataEntry
    -- , IsDefault
	order by PageDescription

	END;

	--Sys_PLOD_Devices
	IF @ListName = 'Sys_PLOD_Devices'
	BEGIN


	  SELECT 
			--hard coded fields:
            ListName = 'Sys_PLOD_Devices'
            ,LineShadeColour =  'white' 
			, TabletId  --ListValueId
			, DeviceAssetNo--ListValueLabel
			--,GroupNameDisplay --= case WHEN Active=0 THEN 'Inactive' ELSE MenuList end

				--dynamic fields:
     ,DeviceSerialNo
     ,RealSerialNo
     ,[RigName]
     ,TabletModel
     ,AppVersion
     ,OSVersion
			,FailedConfigCalls 
			,LongConfigCalls
     ,LastUsedBy
     ,AppDeploymentMode
     ,LastUsedOn = CONVERT(VARCHAR, LastUsedOn, 23)
     ,LastUsedSession

			from dbo.[View_ShiftSummaryInsights_TabletSerialNumbers_ForWeb]
			where OperationId = @OperationID

--	 UNION ALL
--	 SELECT DISTINCT
--			--hard coded fields:
--            ListName = 'Sys_PLOD_Devices'
--            ,LineShadeColour =@ShadeForAddNewLine-- 'white' 
--			,PageID  =-1
--			,PageDescription ='<< Add new Menu Link on ' + MenuList
--			,GroupNameDisplay =MenuList

--				--dynamic fields:
--, PageName=null, Active=null, MinUserGroup=null, MenuList=null, ButtonColour=null, AllowedOnLocal=null, PageCode=null, HeaderMessageHtml=null


	END;

--Sys_EquipList
	IF @ListName = 'Sys_EquipList'
	BEGIN

    SELECT
      [tbl].[ListName]
         , [tbl].[LineShadeColour]  
         , [tbl].[EquipmentID]
         , [tbl].[EquipmentCode]
		-- ,GroupNameDisplay  --2021-07-02
         , [tbl].[EquipmentDescription]
         , [tbl].[EquipSerialNo]
         , [tbl].[EquipTypeID]
         , [tbl].[ProjectID]
         , [tbl].[LoadFactor]
         , [tbl].[ScanDensityFactor] 
         , [LastModifiedOn] = CONVERT(VARCHAR, [LastModifiedOn], 23)  --throws error on front end!
         , [tbl].[Active]
         , [tbl].[TrackTimeUsage]
         , [tbl].[MappingEquipCode]
         , [ShiftPlanColour] ---= [dbo].[FN_MarkupFullHtml_v2] ([tbl].[ShiftPlanColour],1,0,'black',[tbl].[ShiftPlanColour])
	 ,tbl.EquipPitID
     ,[tbl].[ChangeHistory]
    FROM (SELECT
			--hard coded fields:
            ListName = 'Sys_EquipList'
       ,LineShadeColour =
        CASE
          WHEN active = 0 THEN 'lightgrey'
          WHEN [ShiftPlanColour] = 'lime' THEN ''
          ELSE [ShiftPlanColour]
        END--lime is fucking bright. it is "standard" for shift summary (e do'nt distinguish between equipmnet )'white' 
			,[a].[EquipmentID]  --ListValueId
			,[a].[EquipmentCode]--ListValueLabel
			,GroupNameDisplay =  [a].[EquipTypeDescription]

		--dynamic fields:
           , [a].[EquipmentDescription]
           , [a].[EquipSerialNo]
           , [a].[EquipTypeID]
           , [a].[ProjectID]
           , [a].[LoadFactor]
           , [a].[LastModifiedOn]
           , [a].[Active]
           , [a].[TrackTimeUsage]
           , [a].[MappingEquipCode]
           , [a].[ShiftPlanColour]
	   ,a.EquipPitID
           , [a].[ChangeHistory]
		   , [a].[EquipTypeDescription]
       , [a].[ScanDensityFactor]


        FROM dbo.[vw_ProjSetup_EquipmentListing] as a
    inner JOIN 
        (
          SELECT usrgrp.* FROM 
          dbo.FN_GetWebbarUserGroups(@UserID) usrgrp
           INNER join tbl_SYS_User AS usr
            ON usr.UserGroup = usrgrp.UserGroupID
            AND usr.UserID = @UserID) 
         AS usrgrp2

      ON ( usrgrp2.UserGroupPitID LIKE '%' + cast(a.EquipPitID as varchar(10)) + '%'
          OR (usrgrp2.UserGroupPitID is NULL OR usrgrp2.UserGroupPitID = '')) 


		where [a].[ProjectID]= @ProjectID
    


	 UNION ALL
	 SELECT top 1  --2021-07-02
					--hard coded fields:
            ListName = 'Sys_EquipList'

	            ,LineShadeColour =@ShadeForAddNewLine-- 'white' 
			,[EquipmentID] = -1 --ListValueId
            ,[EquipmentCode] = '<< Add new Equipment >>'	
						,GroupNameDisplay = [a].[EquipTypeDescription]
		--dynamic fields:
           , [EquipmentDescription] =''
           , [EquipSerialNo]=null
           , [EquipTypeID]= NULL --[a].[EquipTypeID]  -- Turned off the 
           , [ProjectID]=@ProjectID
           , [LoadFactor]=NULL 
           , [LastModifiedOn]=null
           , [Active]=99
           , [TrackTimeUsage]=null
           , [MappingEquipCode]=null
           , [ShiftPlanColour]=NULL
	         , [EquipPitID] = NULL
           , [ChangeHistory]=NULL
		       , [EquipTypeDescription]  =''
           , [ScanDensityFactor]=NULL
       

		   from [dbo].[tbl_SYS_ResEquipTypes] a
      WHERE active > 0) AS tbl
		order by [Active] desc, [EquipTypeDescription]
	END;






	--this one is a bit different, not working yet:
	IF @ListName ='IplodStagingInsert'
    begin
    --select ''
      /* don't show existing it is huge! 
		SELECT 
			--hard coded fields:
            ListName = 'IplodStagingInsert'
            ,LineShadeColour = 'white' 
			,GSS_ID  --ListValueId
			,GS_StandardCode--ListValueLabel
            ,OperationID
			--dynamic fields:
			,ProjectID
			,GS_Description
			,Rate
			,ShotcreteMatID
			,ShotcreteThickness
			,ShotcreteRate

        FROM dbo.tbl_DWH_iPlodStagingTableEdited
        WHERE ProjectID = @ProjectID

		*/


        --UNION ALL

		-- for add new line
        SELECT 
			--hard coded fields:
            ListName = 'IplodStagingInsert'
            ,LineShadeColour = 'white' 
			,DetailID = -1 --ListValueId
            ,GS_StandardCode = '<< Add new Staging >>' --ListValueLabel
			,OperationID = NULL
            --dynamic fields:
            ,ProjectID = null
			,GS_Description = NULL
			,Rate = NULL
			,ShotcreteMatID = NULL
			,ShotcreteThickness = NULL
			,ShotcreteRate = NULL

    END;

	IF @ListName = 'SysQCategories'
	BEGIN
		SELECT
      ListName = 'SysQCategories'
     ,LineShadeColour = 'white'
     ,QuestionCatID
     ,Category
     ,NotificationText
     ,IntolerableBitWise
     ,IsInputAuthRequired
     ,IsInputPhotoRequired
     ,IsInputCommentRequired
     ,Active
     ,ModifiedOn
     ,ModifiedBy
     ,Comments
     ,IsCompulsory
     ,FinalNotificationText
     ,AdditionalRegex
		FROM dbo.tbl_SYS_QuestionCategories
		UNION ALL
		SELECT
      ListName = 'SysQCategories'
     ,LineShadeColour = 'white'
     ,QuestionCatID = -1
     ,Category = '<< Add New Category >>'
     ,NotificationText = ''
     ,IntolerableBitWise = ''
     ,IsInputAuthRequired = ''
     ,IsInputPhotoRequired = ''
     ,IsInputCommentRequired = ''
     ,Active = 1
     ,ModifiedOn = GETDATE()
     ,ModifiedBy = @UserID
     ,Comments = ''
     ,IsCompulsory = ''
     ,FinalNotificationText = ''
     ,AdditionalRegex = ''
		ORDER BY Category, QuestionCatID DESC
	END

	IF @ListName = 'Sys_LoadScan'
	BEGIN
    SELECT
      ListName = 'Sys_LoadScan'
     ,LineShadeColour = 'white'
     ,ProjectId
     ,TruckId
     ,ID
     ,WeighingDate
     ,WeighingTime
     ,TagNo
     ,Wheel1
     ,Wheel2
     ,Wheel3
     ,Wheel4
     ,Wheel5
     ,Wheel6
     ,Wheel7
     ,Wheel8
     ,Wheel9
     ,Wheel10
     ,TruckTotal
     ,Direction
     ,TareDate
     ,TareTime
     ,TareWeight
     ,NetWeight
     ,ScanComments
     ,ScannerDataDBId
     ,ScannerVolumeRawValue
     ,ScannerDeterminedValid
     ,ScannerDeterminedLoaded
     ,CalculatedVolumeValue
     ,OnboardScale
     ,Unit
     ,Speed
     ,WeighingMode
     ,SiteId
     ,ScaleId
     ,TareGross
     ,Driver
     ,Material
     ,[from]
     ,[to]
     ,Notes
     ,SQLUpdate
		FROM dbo.vw_Integration_External_LoadScan
		UNION ALL
    SELECT
      ListName = 'Sys_LoadScan'
     ,LineShadeColour = 'white'
     ,ProjectId = ''
     ,TruckId = ''
     ,ID = ''
     ,WeighingDate = CONVERT(DATE, GETDATE())
     ,WeighingTime = CONVERT(TIME, GETDATE())
     ,TagNo = ''
     ,Wheel1 = 0.0
     ,Wheel2 = 0.0
     ,Wheel3 = 0.0
     ,Wheel4 = 0.0
     ,Wheel5 = 0.0
     ,Wheel6 = 0.0
     ,Wheel7 = 0.0
     ,Wheel8 = 0.0
     ,Wheel9 = 0.0
     ,Wheel10 = 0.0
     ,TruckTotal = 0.0
     ,Direction = ''
     ,TareDate = ''
     ,TareTime = ''
     ,TareWeight = 0.0
     ,NetWeight = 0.0
     ,ScanComments = ''
     ,ScannerDataDBId = 0.0
     ,ScannerVolumeRawValue = 0.0
     ,ScannerDeterminedValid = 0.0
     ,ScannerDeterminedLoaded = 0.0
     ,CalculatedVolumeValue = 0.0
     ,OnboardScale = ''
     ,Unit = ''
     ,Speed = 0.0
     ,WeighingMode = ''
     ,SiteId = ''
     ,ScaleId = ''
     ,TareGross = ''
     ,Driver = ''
     ,Material = ''
     ,[from] = ''
     ,[to] = ''
     ,Notes = ''
     ,SQLUpdate = 0;
    END;

    IF @ListName = 'Dbt_EmailJobs'
    BEGIN
    SELECT
      ListName = 'Dbt_EmailJobs'
     ,LineShadeColour = 'white'
     ,[EmailJobId]
     ,[EmailJobDesc]
     ,[Comments]
     ,[ProjectId]
     ,[OperationId]
     ,[RecipientEmailCsv]
     ,[CCCsv]
     ,[BCCCsv]
     ,[Subject]
     ,[BodyHtml]
     ,[UrlForAttachment]
     ,[QueryStringForTable]
     ,[EmailJobType]
     ,[MinHour]
     ,[MaxHour]
     ,[FrequencyMins]
     ,[ModifiedOn]
     ,[IsEnabled]
     ,[ChangeHistory]
     ,[HistoryEmailSent]
        FROM [dbo].[vw_ProjSetup_EmailJobs] j
        UNION ALL
    SELECT
      ListName = 'Dbt_EmailJobs'
     ,LineShadeColour = 'white'
     ,[EmailJobId] = -1
     ,[EmailJobDesc] = '<< Add new Email Job >>'
     ,[Comments] = ''
     ,[ProjectId] = ''
     ,[OperationId] = ''
     ,[RecipientEmailCsv] = ''
     ,[CCCsv] = ''
     ,[BCCCsv] = ''
     ,[Subject] = ''
     ,[BodyHtml] = ''
     ,[UrlForAttachment] = ''
     ,[QueryStringForTable] = ''
     ,[EmailJobType] = ''
     ,[MinHour] = ''
     ,[MaxHour] = ''
     ,[FrequencyMins] = ''
     ,[ModifiedOn] = GETDATE()
     ,[IsEnabled] = 1
     ,[ChangeHistory] = ''
     ,[HistoryEmailSent] = ''
        ORDER BY [EmailJobDesc],
                 [EmailJobId] DESC;
    END;

	IF @ListName = 'Sys_Users'
    BEGIN
     SELECT
      ListName = 'Sys_Users'
     ,LineShadeColour = 'white'
     ,UserID
     ,Username
     ,Password
     ,FirstName
     ,LastName
     ,Comments
     ,Active
    -- ,IsAdmin
     ,UserGroup
     ,
      -- CONVERT(DATETIME, DateAdded, 105) AS DateAdded,
      OperationID
     ,ProjectID
     ,BookmarkCode
     ,MinepointCode
     ,UserEmailAddress
     ,ChangeHistory = IIF(ChangeHistory <> '', '...' + RIGHT(ChangeHistory, 250),'')
        FROM [dbo].[vw_ProjSetup_ManageUsers] j
        -- Need a way to hide rows of admin users etc. 
        WHERE j.UserGroup <= @UserGroupLevel
        AND (@UserGroupLevel = 88 OR j.Username not like '%Automate%')
       
        UNION ALL
    SELECT
      ListName = 'Sys_Users'
     ,LineShadeColour = 'white'
     ,UserID = -1
     ,Username = '<< Add new User >>'
     ,Password = '',
      FirstName = ''
     ,LastName = ''
     ,Comments = ''
     ,Active = 1
    -- ,IsAdmin = ''
     ,UserGroup = ''
     ,
      -- DateAdded = GETDATE(),
      OperationID = @OperationID
     ,ProjectID = @ProjectID
     ,BookmarkCode = ''
     ,MinepointCode = ''
     ,UserEmailAddress = ''
     ,ChangeHistory = ''
        ORDER BY Username,
                 [UserId] DESC;
    END;

	IF @ListName = 'PlodSessionHistory'
    begin
   -- EXEC [dbo].[SP_ProjSetup_GenericListEdits_Data] @ListName = N'PlodSessionHistory', @UserID = 137, @ProjectID = 3
    
    SELECT
      ListName = 'PlodSessionHistory'
     ,LineShadeColour = IIF(shift = 'ns', 'lightgrey', 'white')
     ,GroupNameDisplay = WorkType + ' - ' + tde.EmployeeName-- cast(ShiftDate as varchar)  +' - ' +Shift +' - ' + WorkType
          ,a.*  --changed to * so we bring additions to teh fields every time the view changes.
			   /*WorkType,
			   EmployeeId,
				GenericUserRealName,
				AppIsUpToDate,
				ShiftDate,
				Shift,
				CountOfFinalisedTasks,
				CountOfDraftTasks,
				CountOfImportedTasks,
				DeviceAssetNo,
				ProjectId,
				SessionId,
				DeviceTimeVsSrvSeconds,
				DeviceSerialNo,
				ViewPlodLink*/
        FROM [dbo].[View_ShiftSummaryInsights_PlodSessionHistory_ForWeb]  as a
          left JOIN tbl_DBT_Employees tde 
              ON a.EmployeeId = tde.EmployeeID
              AND a.ProjectId = tde.ProjectID
		where a.[ProjectId] = @ProjectID
		--UNION ALL
  --      SELECT ListName = 'PlodSessionHistory',
  --             LineShadeColour = 'white',
		--	   WorkType = '<< Add New >>',
		--		EmployeeId = -1,
		--		GenericUserRealName = '',
		--		AppIsUpToDate = '',
		--		ShiftDate = CAST( GETDATE() AS Date ),
		--		Shift = '',
		--		CountOfFinalisedTasks = 0,
		--		CountOfDraftTasks = 0,
		--		CountOfImportedTasks = 0,
		--		DeviceAssetNo = '',
		--		ProjectId = 0,
		--		SessionId = '',
		--		DeviceTimeVsSrvSeconds = 0,
		--		DeviceSerialNo = ''
        ORDER BY shiftdate desc, WorkType , tde.EmployeeName
        ;
    END;

	IF @ListName = 'ShiftPlanTasks'
	BEGIN
    SELECT
      ListName = 'ShiftPlanTasks'
     ,LineShadeColour = IIF(ISNULL(PlanTaskColour, '') IS NOT NULL, PlanTaskColour, 'white')
     ,ActReasonInputLinkID
     ,Activity
     ,PLODTaskName
     ,ProcessDescription
     ,PlanTaskName
     ,PlanTaskColour
     ,PlanDefaultDuration
     ,PlanDefaultStatValue
     ,OperationID
     ,ProjectID
		FROM [dbo].[vw_ProjSetup_ShiftPlanTasks_Mining]
		WHERE [ProjectID] = @ProjectID
		--UNION ALL
  --      SELECT ListName = 'ShiftPlanTasks',
		--	LineShadeColour = 'white',
		--	ActReasonInputLinkID = -1,
		--	Activity = '<< Add New >>',
		--	PLODTaskName = '',
		--	ProcessDescription = '',
		--	OperationID = '',
		--	ProjectID = '',
		--	ActReasonLinkID = '',
		--	PlanTaskName = '',
		--	PlanTaskColour = '',
		--	PlanDefaultDuration = 0.0,
		--	PlanDefaultStatValue = 0.0,
		--	InputType = '',
		--	InputID = ''
        ORDER BY ActReasonInputLinkID DESC;
	END

	IF @ListName = 'Docs_SurveyMemos'
	BEGIN
    SELECT
      ListName = 'Docs_SurveyMemos'
         , LineShadeColour = 'white'
         , DocumentID
         , DocumentName
         , DocumentGroup
         , UploadPath = @UploadPath
         , DocumentFile
         , IsEnabled
         , LocationId
         , AllowedTypeIdsCsv
         , HelpGuideForTypeIdsCsv
         , ProjectID
         , OperationID
         , CreatedDate
         , CreatedBy
		FROM [dbo].[vw_ProjSetup_Documents_SurveyMemos]
		UNION ALL
    SELECT
      ListName = 'Docs_SurveyMemos'
         , LineShadeColour = 'white'
         , DocumentID = -1
         , DocumentName = '<< Add New >>'
         , DocumentGroup = 'SurveyMemos'
         , [UploadPath] = @UploadPath
         , DocumentFile = ''
         , IsEnabled = 1
         , LocationId = null
         , AllowedTypeIdsCsv = ',1,'
         , HelpGuideForTypeIdsCsv = ''
         , ProjectID = @ProjectID
         , OperationID = @OperationID
         , CreatedDate = getdate()
         , CreatedBy = @UserID
		ORDER BY DocumentID DESC
	END

	IF @ListName = 'ShiftPlanList_Priority'
	BEGIN
    SELECT
      ListName = 'ShiftPlanList_Priority'
     ,LineShadeColour = 'white'
     ,ShiftPlanPriorityID
     ,Priority
     ,TextColour
     ,ProjectID
     ,OperationID
     ,Active
     ,ModifiedOn
		FROM [dbo].[tbl_STO_ShiftPlanList_Priority]
		UNION ALL
    SELECT
      ListName = 'ShiftPlanList_Priority'
     ,LineShadeColour = 'white'
     ,ShiftPlanPriorityID = -1
     ,Priority = -1
     ,TextColour = '<< Add New Shift Plan List Priority >>'
     ,ProjectID = @ProjectID
     ,OperationID = @OperationID
     ,Active = 1
     ,ModifiedOn = GETDATE()
		ORDER BY ShiftPlanPriorityID DESC
	END

	IF @ListName = 'ShiftPlanList_EOSStatus'
	BEGIN
    SELECT
      ListName = 'ShiftPlanList_EOSStatus'
     ,LineShadeColour = 'white'
     ,ShiftPlanEOSStatusID
     ,EOSStatus
     ,TextColour
     ,ProjectID
     ,OperationID
     ,Active
     ,ModifiedOn
		FROM [dbo].[tbl_STO_ShiftPlanList_EOSStatus]
		UNION ALL
    SELECT
      ListName = 'ShiftPlanList_EOSStatus'
     ,LineShadeColour = 'white'
     ,ShiftPlanEOSStatusID = -1
     ,EOSStatus = '<< Add New Shift Plan List EOS Status >>'
     ,TextColour = ''
     ,ProjectID = @ProjectID
     ,OperationID = @OperationID
     ,Active = 1
     ,ModifiedOn = GETDATE()
		ORDER BY ShiftPlanEOSStatusID DESC
	END

	IF @ListName = 'ShiftPlanList_EquipStatus'
	BEGIN
    SELECT
      ListName = 'ShiftPlanList_EquipStatus'
     ,LineShadeColour = 'white'
     ,ShiftPlanEquipStatusID
     ,EOSStatus
     ,TextColour
     ,ProjectID
     ,OperationID
     ,Active
     ,ModifiedOn
		FROM [dbo].[tbl_STO_ShiftPlanList_EquipStatus]
		UNION ALL
    SELECT
      ListName = 'ShiftPlanList_EquipStatus'
     ,LineShadeColour = 'white'
     ,ShiftPlanEquipStatusID = -1
     ,EOSStatus = '<< Add New Shift Plan List Equip Status >>'
     ,TextColour = ''
     ,ProjectID = @ProjectID
     ,OperationID = @OperationID
     ,Active = 1
     ,ModifiedOn = GETDATE()
		ORDER BY ShiftPlanEquipStatusID DESC
	END

	IF @ListName = 'ShiftPlanList_SPileStatus'
	BEGIN
    SELECT
      ListName = 'ShiftPlanList_SPileStatus'
     ,LineShadeColour = 'white'
     ,ShiftPlanSPileStatusID
     ,Label
     ,TextColour
     ,HighlightColour
     ,ProjectID
     ,OperationID
     ,Active
     ,ModifiedOn
		FROM [dbo].[tbl_STO_ShiftPlanList_SPileStatus]
		UNION ALL
    SELECT
      ListName = 'ShiftPlanList_SPileStatus'
     ,LineShadeColour = 'white'
     ,ShiftPlanSPileStatusID = -1
     ,Label = '<< Add New Shift Plan List SPile Status >>'
     ,TextColour = ''
     ,HighlightColour = ''
     ,ProjectID = @ProjectID
     ,OperationID = @OperationID
     ,Active = 1
     ,ModifiedOn = GETDATE()
		ORDER BY ShiftPlanSPileStatusID DESC
	END

	IF @ListName = 'SYS_TargetFields'
	BEGIN
    SELECT
      ListName = 'SYS_TargetFields'
     ,LineShadeColour = 'white'
     ,TargetFieldID
     ,TargetShort
     ,TargetFieldDescription
     ,StatisticCode
     ,ActivityComments
     ,AreaDescription
     ,ReasonDescription
     ,Active
		FROM [dbo].[vw_ProjSetup_TargetsMasterList]
		UNION ALL
    SELECT
      ListName = 'SYS_TargetFields'
     ,LineShadeColour = 'white'
     ,TargetFieldID = -1
     ,TargetShort = '<< Add new target >>'
     ,TargetFieldDescription = ''
     ,StatisticCode = ''
     ,ActivityComments = ''
     ,AreaDescription = ''
     ,ReasonDescription = ''
     ,Active = 1
		ORDER BY TargetFieldID DESC
	END

	IF @ListName = 'DBT_TargetFields'
	BEGIN
    SELECT
      ListName = 'DBT_TargetFields'
     ,LineShadeColour = 'white'
     ,MonthlyFieldID
     ,TargetShort
     ,TargetDescription
     ,Active
     ,Sequence
     ,Frequency
     ,RefDate
     ,LocationID
     ,EquipmentID
     ,TargetDescription
     ,MaterialID
     ,WeeklyPlan
		FROM [dbo].[vw_ProjSetup_TargetsProjectList]
		UNION ALL
    SELECT
      ListName = 'DBT_TargetFields'
     ,LineShadeColour = 'white'
     ,MonthlyFieldID = -1
     ,TargetShort = '<< add new target fields >>'
     ,TargetFieldDescription = ''
     ,Active = 1
     ,Sequence = ''
     ,Frequency = ''
     ,RefDate = ''
     ,LocationID = ''
     ,EquipmentID = ''
     ,TargetDescription = ''
     ,MaterialID = ''
     ,WeeklyPlan = ''
		ORDER BY MonthlyFieldID DESC
	end

  if @ListName = 'GenerateQR'
  begin
    SELECT distinct
      ListName = 'GenerateQR'
      , LineShadeColour = iif(vpsp.Active =0, 'grey' ,'white')
     -- , iplodConfigID
     ,vpsp.Projectid
     ,vpsp.ProjectCode
     ,vpsp.iplodConfigID
      , vpsp.ConfigName
      , vpsp.ConfigValue
      , vpsp.Comments
      , vpsp.ConfigLabel
      , vpsp.Active
      , vpsp.QrGeneratorJson
    from [dbo].vw_ProjSetup_PLODConfigs vpsp
    WHERE vpsp.Projectid= @ProjectID --2022-05-03
    ORDER by active desc,vpsp.ConfigName
--SELECT * FROM dbo.tbl_SYS_iplodConfigs AS tsc


  END
  if @ListName = 'SignRegister'
    BEGIN
      
      SELECT 
            ListName = 'SignRegister'
     ,LineShadeColour =
      CASE
        WHEN s.SignChangeIncrement = 1 THEN 'white'
        ELSE 'lightgrey'
      END
     ,s.LocationID
     ,date = FORMAT(s.date, 'dd-MM-yy')
            ,s.shift
            ,s.projectid
     ,CalStartTime  -- FORMAT(s.CalStartTime, 'dd-MM-yy hh:mm:ss')
     ,CalEndTime  -- FORMAT(s.CalendTime, 'dd-MM-yy hh:mm:ss')
            ,s.Task
            ,s.[Sign Number]
            ,s.[Type of Sign]
            ,s.Reason
            ,s.Comments
            ,s.[Authorised by]
            ,s.[Installed by]
            ,s.DataStoreID
            ,s.DetailID
			,UniqueID
       ,s.SignChangeIncrement
            
         FROM View_ShiftSummary_SignRegister AS s
		 WHERE s.projectid = @ProjectID
     AND ViewSrc = @SignRegisterSrc

    union ALL 
      SELECT 
            ListName = 'SignRegister'
            ,LineShadeColour = 'white'
            ,LocationID = NULL 
     ,date = FORMAT(GETDATE(), 'dd-MM-yy')
            ,shift = NULL 
            ,projectid = @ProjectID 
            ,CalStartTime = getdate() 
            ,CalEndTime = getdate()
            ,Task = NULL 
            ,[Sign Number] = NULL
            ,[Type of Sign] = NULL 
            ,Reason = NULL 
            ,Comments = NULL
            ,[Authorised by] = '<< Add new Sign >>' 
            ,[Installed by] = NULL 
            ,DataStoreID= NULL 
            ,DetailID = NULL 
			,UniqueID = -1
         ,SignChangeIncrement = NULL 


    ORDER BY s.SignChangeIncrement ,[sign number]



    END 

 if @ListName = 'SignRegisterStopes'
    BEGIN
      
      SELECT 
            ListName = 'SignRegisterStopes'
     ,LineShadeColour =
      CASE
        WHEN s.SignChangeIncrement = 1 THEN 'white'
        ELSE 'lightgrey'
      END
     ,s.LocationID
     ,date = FORMAT(s.date, 'dd-MM-yy')
            ,s.shift
            ,s.projectid
     ,CalStartTime  -- FORMAT(s.CalStartTime, 'dd-MM-yy hh:mm:ss')
     ,CalEndTime  -- FORMAT(s.CalendTime, 'dd-MM-yy hh:mm:ss')
            ,s.Task
            ,s.[Sign Number]
            ,s.[Type of Sign]
            ,s.Reason
            ,s.comments
            ,s.[Authorised by]
            ,s.[Installed by]
            ,s.DataStoreID
            ,s.DetailID
			,UniqueID
       ,s.SignChangeIncrement
            
         FROM View_ShiftSummary_SignRegister_UniqueLocns_StopeSigns AS s
		 WHERE s.projectid = @ProjectID
     AND ViewSrc = @SignRegisterSrc

    union ALL 
      SELECT 
            ListName = 'SignRegisterStopes'
            ,LineShadeColour = 'white'
            ,LocationID = NULL 
     ,date = FORMAT(GETDATE(), 'dd-MM-yy')
            ,shift = NULL 
            ,projectid = @ProjectID 
            ,CalStartTime = getdate() 
            ,CalEndTime = getdate()
            ,Task = NULL 
            ,[Sign Number] = NULL
            ,[Type of Sign] = NULL 
            ,Reason = NULL 
            ,Comments = NULL 
            ,[Authorised by] = '<< Add new Sign >>' 
            ,[Installed by] = NULL 
            ,DataStoreID= NULL 
            ,DetailID = NULL 
			,UniqueID = -1
         ,SignChangeIncrement = NULL 


    ORDER BY s.SignChangeIncrement ,[sign number]



    END 

	if @ListName = 'TargetsUpload'
    BEGIN

      SELECT 
            ListName = 'TargetsUpload'
     ,LineShadeColour =
      CASE
        WHEN ROW_NUMBER() OVER (ORDER BY DataStoreID) % 2 = 0 THEN 'white'
        ELSE 'lightgrey'
      END
			,DataStoreID
			,BudgetCodeID
			,MonthTargetID
			,ProcessID
			,ActivityID
			,ReasonID
			,StatisticID
			,EquipmentID
			,MaterialID
			,MaterialSysID
			,LocationID
			,Date
			,Shift
			,Value

         FROM vw_ProjSetup_TargetsDataUpload
		 WHERE ProjectID = @ProjectID

    union ALL 
      SELECT 
            ListName = 'TargetsUpload'
            ,LineShadeColour = 'white'
			,DataStoreID = NULL 
			,BudgetCodeID = NULL 
			,MonthTargetID = NULL 
			,ProcessID = NULL 
			,ActivityID = NULL 
			,ReasonID = NULL 
			,StatisticID = NULL 
			,EquipmentID = NULL 
			,MaterialID = NULL 
			,MaterialSysID = NULL 
			,LocationID = NULL 
			,Date = GETDATE() 
			,Shift = NULL
			,Value = NULL

    ORDER BY [Date]



    end 

if @ListName = 'PlodSyncHistory'
    BEGIN

      SELECT
            ListName = 'PlodSyncHistory'
     ,LineShadeColour =
      CASE
        WHEN ROW_NUMBER() OVER (ORDER BY MessageQueueId) % 2 = 0 THEN 'white'
        ELSE 'lightgrey'
      END
      			,MessageQueueId
      			,DeviceAssetNo
      			,DateCreated
      			,DateCompleted
      			,DataSyncTriggerPoint
      			,JsonPayload
      			,LengthOfPayload
      			,EmployeeId
      			,AppDeploymentMode
      			,SessionId
      			,AppVersion
      			,DeviceSerialNo
      			,DeviceOS
      			,TaskHeaderId
            ,PayloadSessionId
            ,PayloadEmployeeId
            ,PayloadDeviceOS

         FROM View_ShiftSummaryInsights_PlodSyncHistory

    union ALL
      SELECT
            ListName = 'PlodSyncHistory'
            ,LineShadeColour = 'white'
			      ,MessageQueueId = null
      			,DeviceAssetNo = null
      			,DateCreated = getdate()
      			,DateCompleted = null
      			,DataSyncTriggerPoint = null
      			,JsonPayload = null
      			,LengthOfPayload = null
      			,EmployeeId = null
      			,AppDeploymentMode = null
      			,SessionId = null
      			,AppVersion = null
      			,DeviceSerialNo = null
      			,DeviceOS = null
      			,TaskHeaderId = null
            ,PayloadSessionId = null
            ,PayloadEmployeeId = null
            ,PayloadDeviceOS = null

    ORDER BY DateCreated
    end


    if @ListName = 'Sys_AutoSyncTasks'
    BEGIN

      SELECT
            ListName = 'Sys_AutoSyncTasks'
            ,LineShadeColour = 'white'
      			,ID
      			,AutoTaskName
      			,InUse
      			,TaskComments
      			,MinHour
      			,MaxHour
      			,FreqMins
      			,ProjectID
      			,IsCycleThroughProjects
      			,IsTestOnly
      			,IsOnlyForThisUser
      			,OverrideSchedule_RunOnceWithin10MinutesOf
      			,IsAllowedOnLocal
      			,ChangeComments
            ,ExcludeDBNameCsv
            ,ExcludeUserNameCsv
            ,LastRunDateTime

         FROM vw_ProjSetup_Sys_AutoSyncTasks

    union ALL
      SELECT
            ListName = 'Sys_AutoSyncTasks'
            ,LineShadeColour = 'white'
			      ,ID = -1
      			,AutoTaskName = null
      			,InUse = 0
      			,TaskComments = null
      			,MinHour = null
      			,MaxHour = null
      			,FreqMins = null
      			,ProjectID = null
      			,IsCycleThroughProjects = 0
      			,IsTestOnly = 0
      			,IsOnlyForThisUser = null
      			,OverrideSchedule_RunOnceWithin10MinutesOf = null
      			,IsAllowedOnLocal = 0
      			,ChangeComments = null
            ,ExcludeDBNameCsv = null
            ,ExcludeUserNameCsv = null
            ,LastRunDateTime = null

    ORDER BY ID
    end

    if @ListName = 'Dbt_Locations'
    begin
      set @Cmd = N'exec SP_ProjSetup_GenericListEdits_Data_Locations @ProjectID = @ProjectID_Value;'
      EXEC sp_executesql @Cmd, N'@ProjectID_Value INT', @ProjectID;
    end

	if @ListName = 'SyncTasksDashboard'
    begin
		SELECT
            ListName = 'SyncTasksDashboard'
            ,LineShadeColour = 'white'
			,ID
			,AutoTaskName         --visible inline
			,InUse                --visible inline
			,TaskComments         --visible inline
			,MinHour              --visible inline
			,MaxHour              --visible inline
			,FreqMins             --visible inline
			,ProjectID
			,IsCycleThroughProjects
			,IsOnlyForThisUser
			,IsTestOnly
			,OverrideSchedule_RunOnceWithin10MinutesOf
			,IsAllowedOnLocal
			,ModifiedOn
			,ChangeComments
			,ExcludeDBNameCsv
			,ExcludeUserNameCsv
			,FailedCount
			,SuccessCount
			,FailedPercentage      --visible inline
			,[FailedPercentageAsDecimal] = isnull(FailedPercentageAsDecimal, 0)
			,Last3Failed
			,MostRecentFail
			,MostRecentSuccess
			,MostRecentFailRowId
			,MostRecentSuccessRowId
			,MostRecentFailMessage --visible inline
			,thirdlastFailDate
			,thirdlastRowId
		from
			[dbo].[vw_ProjSetup_SyncTasksDashboard]
		WHERE (ProjectID = @ProjectID or ProjectID=1) --2022-10-25
		union all
		SELECT
            ListName = 'SyncTasksDashboard'
            ,LineShadeColour = 'white'
			,ID = -1
			,AutoTaskName = '<< Add new Auto Sync Task >>'
			,InUse = 999999
			,TaskComments = null
            ,MinHour = null
            ,MaxHour = null
			,FreqMins = null
			,ProjectID = null
			,IsCycleThroughProjects = null
			,IsOnlyForThisUser = null
			,IsTestOnly = null
			,OverrideSchedule_RunOnceWithin10MinutesOf = null
			,IsAllowedOnLocal = null
			,ModifiedOn = null
			,ChangeComments = null
			,ExcludeDBNameCsv = null
			,ExcludeUserNameCsv = null
			,FailedCount = null
			,SuccessCount = null
			,FailedPercentage = null      --visible inline
			,FailedPercentageAsDecimal = 0
			,Last3Failed = null
			,MostRecentFail = null
			,MostRecentSuccess = null
			,MostRecentFailRowId = null
			,MostRecentSuccessRowId = null
			,MostRecentFailMessage = null --visible inline
			,thirdlastFailDate = null
			,thirdlastRowId = null
			order by INUse desc , ID
    end

	if @ListName = 'QueueUpdates'
begin
    select ListName = 'QueueUpdates'
          ,LineShadeColour = 'white'
          ,ManageUpdatePackageNumber     --table id, not editable.
          ,InstanceCodeCsv               --this is a list method
          ,Active                        --tickbox
          ,UserId                        --page user
          ,SystemComponentName           --this is a list of options see card
          ,UpdateNotes                   --text field (optional)
          ,SQLScript                     --need to be able to past update scripts into here.
          ,DbToRunSqlOn                  -- list of all databases on current server
          ,DockerCodeTag                 -- text entry optional
          ,PhpGitTag_DefaultContainer    -- text entry optional
          ,PhpGitTag_BackgroundContainer -- text entry optional
          ,PlodSchemaDbVersion           -- text entry optional
          ,ManageSchemaDbVersion         -- text entry optional
          ,UpdateWindowStartdate         --date picker
          ,UpdateWindowEndDate           -- date picker
          ,UpdateWindowMinHr             --integer
          ,UpdateWindowMaxHr             --interger
          ,DateTimeQueued                --auto-date field = time of insert 
          ,UpdateResults                 --read only info delivered to teh page
          ,UpdateChangeLog               --join to generic list logging same like we normally do.
    from [dbo].[vw_ProjSetup_UpdateQueue]
    union all
    select ListName = 'QueueUpdates'
          ,LineShadeColour = 'white'
          ,ManageUpdatePackageNumber = -1
          ,InstanceCodeCsv = null
          ,Active = null
          ,UserId = null
          ,SystemComponentName = null
          ,UpdateNotes = null
          ,SQLScript = null
          ,DbToRunSqlOn = null
          ,DockerCodeTag = null
          ,PhpGitTag_DefaultContainer = null
          ,PhpGitTag_BackgroundContainer = null
          ,PlodSchemaDbVersion = null
          ,ManageSchemaDbVersion = null
          ,UpdateWindowStartdate = null
          ,UpdateWindowEndDate = null
          ,UpdateWindowMinHr = null
          ,UpdateWindowMaxHr = null
          ,DateTimeQueued = getdate()
          ,UpdateResults = null
          ,UpdateChangeLog = null;
end;
  IF @ListName = 'ActReasonEdits'
  BEGIN
    SELECT TOP 100 ListName = 'ActReasonEdits'
          ,LineShadeColour = 'white'
          ,TaskdetailsCacheId
			    ,GroupNameDisplay = tg.TaskName
          ,RowId
          ,t.ProjectID
          ,OperationID
          ,ActReasonID
          ,t.TaskName
          ,EquipTypesAllowed
          ,ACTIVE
          ,InputType
          ,FieldType
          ,InputID
          ,HelpText
          ,DisplayOrder
          ,DisplayTrap
          ,DataTypeDisplayed
          ,DecPlaces
          ,TimeStampThisInput
          ,CalcString
          ,ForeLabel
          ,AftLabel
          ,CompulsoryTrap
          ,DefaultValue
          ,ReviewTrap
          ,IntolerableValues
          ,InitialValidationMsg
          ,FinalValidationMsg
          ,InputListSelectionFilter
          ,Shareable
          ,InputGroup
          ,SummaryGroup
          ,DisplayInputComments
          ,TypeCsvOld
          ,TypeIdsCsv
          ,TrapIntolerableComment
          ,IsInputCommentRequired
          ,IsInputPhotoRequired
          ,IsInputAuthRequired
          ,KeepOnCopy
          -- ,ModifiedOn -- handled on trigger
          ,Param1
          ,Param2
          ,Param3
          ,Param4
          ,WebCalcString
          ,AttrJson
          ,SupportedVersion
          ,AdditionalRegex
          ,td_ReportingBitWise
          ,ToleranceLower
          ,TL_Text
          ,ToleranceUpper
          ,TU_Text
          ,td_ActivityID
          ,td_ReasonID
          ,td_ProcessID         
          ,ExcludeFromApp
          ,ExcludeFromWeb
          ,DateCreated
          -- ,DateUpdated  -- handled on trigger
          ,ChangeHistory = IIF(ChangeHistory <> '', '...' + RIGHT(ChangeHistory, 250),'')
    FROM dbo.vw_Iplod_GetAR_TaskDetailsForEditAndUpload AS t
    LEFT JOIN [dbo].[vw_Iplod_GetAR_TaskGroupingsAll] AS tg
    ON t.ActReasonID = tg.ActivityReasonId
    UNION ALL
      SELECT ListName = 'ActReasonEdits'
          ,LineShadeColour = 'white'
          ,TaskdetailsCacheId = -1
			    ,GroupNameDisplay = 'New'
          ,RowId = NULL
          ,ProjectID = NULL
          ,OperationID = NULL
          ,ActReasonID = NULL
          ,TaskName = NULL
          ,EquipTypesAllowed = NULL
          ,ACTIVE = NULL
          ,InputType = NULL
          ,FieldType = NULL
          ,InputID = NULL
          ,HelpText = NULL
          ,DisplayOrder = NULL
          ,DisplayTrap = NULL
          ,DataTypeDisplayed = NULL
          ,DecPlaces = NULL
          ,TimeStampThisInput = NULL
          ,CalcString = NULL
          ,ForeLabel = NULL
          ,AftLabel = NULL
          ,CompulsoryTrap = NULL
          ,DefaultValue = NULL
          ,ReviewTrap = NULL
          ,IntolerableValues = NULL
          ,InitialValidationMsg = NULL
          ,FinalValidationMsg = NULL
          ,InputListSelectionFilter = NULL
          ,Shareable = NULL
          ,InputGroup = NULL
          ,SummaryGroup = NULL
          ,DisplayInputComments = NULL
          ,TypeCsvOld = NULL
          ,TypeIdsCsv = NULL
          ,TrapIntolerableComment = NULL
          ,IsInputCommentRequired = NULL
          ,IsInputPhotoRequired = NULL
          ,IsInputAuthRequired = NULL
          ,KeepOnCopy = NULL
          -- ,ModifiedOn = GETDATE() -- handled on trigger
          ,Param1 = NULL
          ,Param2 = NULL
          ,Param3 = NULL
          ,Param4 = NULL
          ,WebCalcString = NULL
          ,AttrJson = NULL
          ,SupportedVersion = NULL
          ,AdditionalRegex = NULL
          ,td_ReportingBitWise = NULL
          ,ToleranceLower = NULL
          ,TL_Text = NULL
          ,ToleranceUpper = NULL
          ,TU_Text = NULL
          ,td_ActivityID = NULL
          ,td_ReasonID = NULL
          ,td_ProcessID = NULL          
          ,ExcludeFromApp = NULL       
          ,ExcludeFromWeb = NULL       
          ,DateCreated = GETDATE()
          -- ,DateUpdated = GETDATE() -- handled on trigger
          ,ChangeHistory = NULL
  END
END;

/****** Object:  StoredProcedure [dbo].[SP_ProjSetup_GenericListEdits_FieldSettings]    Script Date: 13/08/2021 07:28:00 ******/
SET ANSI_NULLS ON
















GO
PRINT N'Creating [dbo].[tbl_STO_DriftSchema_Records]'
GO
CREATE TABLE [dbo].[tbl_STO_DriftSchema_Records]
(
[RowID] [int] NOT NULL IDENTITY(1, 1),
[ProjectID] [int] NOT NULL,
[ObjectName] [nvarchar] (500) NOT NULL,
[CurrentSchema] [nvarchar] (max) NOT NULL,
[DbVersion] [varchar] (1000) NULL,
[StashDateTime] [datetime] NOT NULL,
[UserID] [int] NOT NULL,
[Comments] [varchar] (max) NULL
)
GO
PRINT N'Creating [dbo].[vw_ProjSetup_NonFlywayDriftStatus]'
GO

create   view [dbo].[vw_ProjSetup_NonFlywayDriftStatus]
as 
/*
select * from [dbo].[vw_ProjSetup_NonFlywayDriftStatus]
2022-10-24 ... ts ... create to check drift.
                  ... don't let teh drift be dealt with, if the object has been modified since it was last dealt with!
                  


exec[dbo].[SP_Utility_ResetDrift]@ObjectName='vw_ProjSetup_NonFlywayDriftStatus',@UserID=137,@ConflictComments='merge back to source contorl'
*/

--check on drift:
with cte as (SELECT -- a.databasename
 b.name
,b.type
,b.modify_date
, b.create_date 
,b.object_id
, VersionBuildDateTime = ver.modify_date
,DbVersion =  isnull((select top 1 ManageVersion from   dbo.tvf_ServerDetails (0 )),'missing')
,DriftIsMergedToSC = case when StashDateTime>ver.modify_date and b.modify_date < tsdsr.StashDateTime then 1 else 0 end
,StashDateTime
--,StashComments = Comments
FROM sys.objects as b with (nolock)
/*left JOIN tbl_SYS_ManageSqlStatsAtTimeOfBuild AS a
  ON a.BuildStatDesc = b.name 
      AND a.BuildMeasureType = 'DbObjectModifiedOn'
      and a.databasename = DB_NAME()*/
inner join sys.objects as ver with (nolock)
    on ver.name = 'tvf_ServerDetails'
    and b.modify_date > ver.modify_date
left join (select StashDateTime=max(StashDateTime),ObjectName from  dbo.tbl_STO_DriftSchema_Records group by ObjectName)as tsdsr
--dbo.tbl_STO_DriftSchema_Records  as tsdsr
  on b.name   = tsdsr.ObjectName

WHERE b.type in('P','FN','sn','v')
--and a.databasename = DB_NAME()
--AND (a.BuildStatDateValue < b.modify_date OR a.BuildStatDateValue is null)

)

select * from cte

/*
tbl.DbVersion
,tbl.VersionBuildDateTime
,DriftedObjects =STUFF((SELECT ',' + name
            FROM cte
            FOR XML PATH('')) ,1,1,'') 
 from cte as tbl
*/
GO
PRINT N'Altering [dbo].[SP_ProjSetup_MenuLinks]'
GO
ALTER PROCEDURE [dbo].[SP_ProjSetup_MenuLinks] @ProjectID INT, @UserGroup INT, @UserId INT = 0
AS
BEGIN
  /*
	 EXEC [dbo].[SP_ProjSetup_MenuLinks] @ProjectID = '3', @UserGroup = '9', @UserID = 705
	  EXEC [dbo].[SP_ProjSetup_MenuLinks] @ProjectID = '291', @UserGroup = '3' 
	Change log
	(TS) added min user groupIDs to button labels 20180709
	(TS)  added ordering 20180808, alter on the active filter
	(TS) 20181003 ... added PageID NOT IN (96,98) to allow maintenance pages to be added through pages DE, and still retain their colour

	TS 2018-12-23 added dodgy fix on the inputs for fuel
	TS 2019-02-02 commented out dodgy fix. 
			added special handling for PEAK (to put the dual buttons on)  to put in properly, should add colour and method mapping to the typeconfig table. also add projectId/OperationID?
	IP 2019-02-15 change @IsLocal to use the function instead (FN_IsLocal)
	ts 2020-04-14 fix for peak. use this to nominate dbt_webbarConfigs=TypeAliasCsv
	CA 2020-04-29 Increased typealias length
	TS 2020-09-07 handle modes active config
	CA 2020-09-15 Added DT trial handling
	ts 2020-09-15 comment out the errant call on sys pages table
	ts 2020-09-21 replace the special @OpCode (for the intranet link)
	ts 2020-11-05 ... config permissions of pages that are normally only for admin users (replace the DBT table with teh new permissions method
	ts 2021-04-21 ... type modes acitve maint
	ts 2021-05-21 ... get diagnsotic shift summary alias (testing)
	ts 2021-05-31 ... show pageIds
					... don't whack mode on if mode is already on
  ts 2021-9-29 ... over-ride on webbar input for local webbars.
  ts 2021-09-30 ... also don't publish "edit review data" page on locals
  ts 2021-11-08 ... update for support of pms central. only want the reporting page there for now. can add other linux pages as needed be on TWO spots below.
  ian 2022-01-27 ... added param userId 
  ian 2022-02-02 ... added select pageId
  ian 2022-03-18 ... added SidebarMenuShade, SidebarMenuTextColour, SideBarMenuSelectedPageShade, SideBarMenuSelectedPageTextColour
  CA 2022-05-04 ... Added MenuLinksExclusion based on userGroupConfig
  ts 2022-05-15 ... add isnull on the excl so all pages don't drop off the face of teh earth
  ian 2022-06-06 ... added SidebarMenuGroupColour and SidebarMenuGroupShade
  ts 2022-07-15 ... kill the transition
  CA 2022-09-29 ... Made the colours actually readable
  ts 2022-10-07 ... commit chris' change
  ts 2022-10-07 ... call on the cache builder
  ts 2022-10-24 .. add drift objects!
	*/
  -- SET NOCOUNT ON added to prevent extra result sets from
  -- interfering with SELECT statements.
  SET NOCOUNT ON;
  --remove!!! 
  /*  --nice place to put some transition scripts that need to run while something beds in!
  IF @ProjectID IN (231,219,291,236,259)
   BeGIN
    UPDATE 
    dbo.tbl_DWH_iPlodStagingTableEdited 
    SET InputType = 'Stat', InputID = 132
    WHERE inputtype = 'cons' AND InputID = 0
    AND Projectid = @ProjectID
  END*/


  DECLARE @DBAdminUserGroup INT
  SET @DBAdminUserGroup = (SELECT
      Configvalue
    FROM tbl_SYS_webbarConfigs
    WHERE configname = 'UserGroup_DB_Admin');
  DECLARE @OpCode AS VARCHAR(3)
  SET @OpCode = (SELECT
      OperationCode
    FROM dbo.tbl_DBT_Project AS p
    INNER JOIN dbo.tbl_DBT_Operation AS o
      ON p.OperationID = o.OperationID
      AND p.ProjectID = @ProjectID)


  DECLARE @isLOCAL INT  --not used yet down below, just putting here for reference in case we want it
  SET @isLOCAL = [dbo].[FN_IsLocal](@ProjectID)

  DECLARE @TypeAliasSupported NVARCHAR(512) = dbo.FN_GetConfigValue(@Projectid, 'TypeAliasCsv');
  DECLARE @TypeModesActiveMining INT = (SELECT TOP 1
      CAST(ConfigValue AS INT)
    FROM dbo.FN_ProjSetup_TypeAlias_V2(@ProjectID, 'mining', 1, 'TypeModesActive', ''));
  DECLARE @TypeModesActiveMaint INT = (SELECT TOP 1
      CAST(ConfigValue AS INT)
    FROM dbo.FN_ProjSetup_TypeAlias_V2(@ProjectID, 'maint', 3, 'TypeModesActive', ''));


  DECLARE @IsPDSStillATable INT = CASE
    WHEN OBJECT_ID('dbo.tbl_DWH_ProdDataStorage', 'U') IS NOT NULL THEN 1
    ELSE 0
  END
  --select @IsPDSStillATable  --if it isn't a table, then we don't want webar input page on locals!

  -- ELSE 
  --BEGIN

  DECLARE @IsPmsCentralTransition INT = 0-- IIF(USER_NAME() = 'ManageWebApp' AND DB_NAME() = 'pbw', 1, 0)   --this indicates that it is teh linux server that services the PBW database.
  DECLARE @IsPBWOldSchoolIIS INT = IIF(USER_NAME() <> 'ManageWebApp' AND DB_NAME() = 'pbw', 1, 0)

  IF @IsPmsCentralTransition = 0
  BEGIN

    -- all pages that don't need to be added to DBT_PagesDE, currently only available on [CENTRAL]
 SELECT * FROM (
 SELECT
      CASE
        WHEN @UserGroup = @DBAdminUserGroup THEN [PageDescription] + ' (' + CAST(MinUserGroup AS VARCHAR) + ', ID=' + CAST(s.pageid AS VARCHAR) + ')'
        ELSE [PageDescription]
      END AS 'ButtonLabel'
     ,[Link] = REPLACE([PageName], '{OpCode}', @OpCode) +
      CASE
        WHEN @TypeModesActiveMining = 1 AND
          s.PageCode LIKE 'shiftsummarymining%' AND
          s.PageCode <> 'shiftsummarymining24' AND
          s.PageName NOT LIKE '%?mode%' --2021-05-31
        THEN '?mode=DataV'
        WHEN @TypeModesActiveMaint = 1 AND
          s.PageCode LIKE 'shiftsummarymaint%' AND
          s.PageName NOT LIKE '%?mode%' --2021-05-31
        THEN '?mode=DataV'
        ELSE ''
      END  --as 'Link'
     ,MenuList
     ,ButtonColour =
      CASE
        WHEN MinUserGroup > @UserGroup AND
          s.PageID NOT IN (96, 98) THEN '#252524'
        ELSE ISNULL(ButtonColour, '#337ab7')
      END  --adding yellow colour for pages on normal users that shouldn't be there
     ,MinUserGroup = @UserGroup  --maybe the page is 
      --,isnull(AllowedOnLocal,0) 
     ,@isLOCAL AS IsLocal
     ,s.PageID
     ,ISNULL(tsupl.UserPageLinkID, 0) AS isFavourite
     ,SideBarMenuShade = '#939598'
     ,SidebarMenuTextColour = 'black'
     ,SideBarMenuSelectedPageShade = '#8E44AD'
     ,SideBarMenuSelectedPageTextColour = 'white'
     ,SidebarMenuGroupColour = 'white'--'#939598'
     ,SidebarMenuGroupShade = '#276eb1'
     ,s.Active
    FROM [dbo].[tbl_SYS_PagesDataEntry] AS s
    LEFT JOIN [dbo].tbl_sys_UserPageLink tsupl
      ON s.PageID = tsupl.PageId
        AND tsupl.UserId = @UserId
    OUTER APPLY [dbo].[FN_ProjSetup_UserPermissions](@Projectid, @UserGroup * -1, s.PageCode, '_AllTypes', '_AllModes', 'GlobalPagePermissions') perm
    OUTER APPLY [dbo].[FN_ProjSetup_UserPermissions](@Projectid, @UserID, 'Reporting', '_AllTypes', '_AllModes', 'MenuLinksExclusions') menuexcl

    WHERE Active >= 1
    AND MenuList IS NOT NULL --AND MenuList <> 'Data Entry'
    AND (ISNULL(MinUserGroup, @DBAdminUserGroup) <= @UserGroup   --null ones are only available for admin users 
    OR EXISTS (SELECT
        PageID
      FROM tbl_DBT_PagesDE AS d
      WHERE ProjectID = @ProjectID
      AND Include = 1
      AND s.PageID = d.PageID)
    OR ISNULL(CAST(perm.PermissionConfigValue AS INT), 0) > 0  --global access permissions, greater than 0 is allowed to view, other permissionValues may dictate further locks inside the app
    )   --allows us to add pages to discreet projects...
    AND

    ((@isLOCAL = 1
    AND AllowedOnLocal = 1)
    OR @isLOCAL = 0)
    --trash this piece of hackery ... ((@isLOCAL = 1 AND AllowedOnLocal = 1 ) 
    --OR (@isLOCAL = 0 and @ProjectID <> 377)
    --OR @ProjectID = 377 AND (AllowedOnLocal = 1 OR s.PageID IN (99,116)))

    AND Active >= 1
    --handling for supported shift summary type aliases:
    AND ((LEFT(ISNULL(s.PageCode, 'x'), 12) = 'shiftsummary'
    AND ISNULL(@TypeAliasSupported, ',mining,maint,') LIKE '%,' + SUBSTRING(s.PageCode, 13, 25) + ',%')
    OR LEFT(ISNULL(s.PageCode, 'x'), 12) <> 'shiftsummary'
    OR s.MenuList = 'Diagnostic'  --get shfit plan testing page into diagnostic
    )

    --handling for supported shift plan aliases:
    AND ((LEFT(ISNULL(s.PageCode, 'x'), 11) = 'shiftplanv2'
    AND ISNULL(@TypeAliasSupported, ',mining,maint,') LIKE '%,' + SUBSTRING(s.PageCode, 12, 25) + ',%')
    OR LEFT(ISNULL(s.PageCode, 'x'), 11) <> 'shiftplanv2'
    OR s.MenuList = 'Diagnostic'  --get shfit plan testing page into diagnostic
    )

    AND NOT (@IsPDSStillATable = 0
    AND @isLOCAL = 1
    AND s.PageID IN (90, 94))  --2021-09-29 don't show webbar input page on local webbars in Pybar that have ProdDataStorage as a syn and view

    --specific EXCLUSIONS (ie these pages are not supported by the old IIS jobby. strip out once no more IIS anywhere.
    --ts 2021-11-08
    AND NOT (@IsPBWOldSchoolIIS = 1
    AND s.PageName = '../projectsetup.php/reporting'
    )


    AND ISNULL(menuexcl.PermissionConfigValue, '') NOT LIKE '%' + CAST(s.PageID AS VARCHAR(20)) + '%'

union all --2022-10-24 add drift "detection" clear this out using [SP_Utility_ResetDrift]
   SELECT
       ButtonLabel = name
     ,[Link] = 'exec[dbo].[SP_Utility_ResetDrift]@ObjectName='+char(39)+name+char(39)+',@UserID='+cast(@userId as varchar(25))+',@ConflictComments='+char(39)
     ,MenuList = '!!!DRIFTED OBJECTS!!!'
     ,ButtonColour = 'red' 
     ,MinUserGroup = @UserGroup  --maybe the page is 
      --,isnull(AllowedOnLocal,0) 
     ,@isLOCAL AS IsLocal
     ,PageID = object_id
     , isFavourite = 0
     ,SideBarMenuShade = '#939598'
     ,SidebarMenuTextColour = 'black'
     ,SideBarMenuSelectedPageShade = '#8E44AD'
     ,SideBarMenuSelectedPageTextColour = 'white'
     ,SidebarMenuGroupColour = 'white'--'#939598'
     ,SidebarMenuGroupShade = '#276eb1'
     ,ACtive = -1
     from dbo.[vw_ProjSetup_NonFlywayDriftStatus]
     where @UserGroup =88
     and DriftIsMergedToSC = 0
) as tbl
    ORDER BY ACtive, MenuList, tbl.ButtonLabel   --PageDescription

  --END
  -- SELECT * FROM dbo.tbl_SYS_PagesDataEntry WHERE PageDescription LIKE '%shift%'
  /*
  UNION ALL 


  -- swap this one back in after webbar2 is live ... could either edit teh old links in SYS_PagesDE (for old PageIDs) or add the new versions into DBT_PagesDE for each project
  --put the AND MenuList <> 'Data Entry' back in top select
  SELECT 
  [Button]  as 'ButtonLabel'
  ,b.[PageName] as 'Link'
  ,'Data Entry' as MenuList
  ,ButtonColour = isnull(ButtonColour,'#337ab7')
  ,MinUserGroup as MinUserGroup
  ,CASE WHEN b.PageID <35 THEN 0 ELSE 1 END as IsLocal  --remove old app pages from local
  FROM [dbo].[tbl_DBT_PagesDE] as a
  INNER JOIN [dbo].[tbl_SYS_PagesDataEntry]   as b on a.PageID = b.PageID
  WHERE ProjectID = @ProjectID
	AND isnull(MinUserGroup,@DBAdminUserGroup) <= @UserGroup   --null ones are only available for admin users 
	AND b.Active = 1  and a.Include = 1
*/


  END

  IF @IsPmsCentralTransition = 1
  BEGIN

    --copy from above initially, just hack for now.
    SELECT
      CASE
        WHEN @UserGroup = @DBAdminUserGroup THEN [PageDescription] + ' (' + CAST(MinUserGroup AS VARCHAR) + ', ID=' + CAST(s.pageid AS VARCHAR) + ')'
        ELSE [PageDescription]
      END AS 'ButtonLabel'
     ,[Link] = REPLACE([PageName], '{OpCode}', @OpCode) +
      CASE
        WHEN @TypeModesActiveMining = 1 AND
          s.PageCode LIKE 'shiftsummarymining%' AND
          s.PageCode <> 'shiftsummarymining24' AND
          s.PageName NOT LIKE '%?mode%' --2021-05-31
        THEN '?mode=DataV'
        WHEN @TypeModesActiveMaint = 1 AND
          s.PageCode LIKE 'shiftsummarymaint%' AND
          s.PageName NOT LIKE '%?mode%' --2021-05-31
        THEN '?mode=DataV'
        ELSE ''
      END  --as 'Link'
     ,MenuList
     ,ButtonColour =
      CASE
        WHEN MinUserGroup > @UserGroup AND
          PageID NOT IN (96, 98) THEN '#252524'
        ELSE ISNULL(ButtonColour, '#337ab7')
      END  --adding yellow colour for pages on normal users that shouldn't be there
     ,MinUserGroup = @UserGroup  --maybe the page is 
      --,isnull(AllowedOnLocal,0) 
     ,@isLOCAL AS IsLocal
     ,s.PageID
     ,SideBarMenuShade = '#939598'
     ,SidebarMenuTextColour = '#276EB1'
     ,SideBarMenuSelectedPageShade = '#276EB1'
     ,SideBarMenuSelectedPageTextColour = '#939598'
    FROM [dbo].[tbl_SYS_PagesDataEntry] AS s
    OUTER APPLY [dbo].[FN_ProjSetup_UserPermissions](@Projectid, @UserGroup * -1, s.PageCode, '_AllTypes', '_AllModes', 'GlobalPagePermissions') perm
    WHERE Active >= 1
    AND MenuList IS NOT NULL --AND MenuList <> 'Data Entry'
    AND (ISNULL(MinUserGroup, @DBAdminUserGroup) <= @UserGroup   --null ones are only available for admin users 
    OR EXISTS (SELECT
        PageID
      FROM tbl_DBT_PagesDE AS d
      WHERE ProjectID = @ProjectID
      AND Include = 1
      AND s.PageID = d.PageID)
    OR ISNULL(CAST(perm.PermissionConfigValue AS INT), 0) > 0  --global access permissions, greater than 0 is allowed to view, other permissionValues may dictate further locks inside the app


    )   --allows us to add pages to discreet projects...
    AND

    ((@isLOCAL = 1
    AND AllowedOnLocal = 1)
    OR @isLOCAL = 0)
    --trash this piece of hackery ... ((@isLOCAL = 1 AND AllowedOnLocal = 1 ) 
    --OR (@isLOCAL = 0 and @ProjectID <> 377)
    --OR @ProjectID = 377 AND (AllowedOnLocal = 1 OR s.PageID IN (99,116)))

    AND Active >= 1
    --handling for supported shift summary type aliases:
    AND ((LEFT(ISNULL(s.PageCode, 'x'), 12) = 'shiftsummary'
    AND ISNULL(@TypeAliasSupported, ',mining,maint,') LIKE '%,' + SUBSTRING(s.PageCode, 13, 25) + ',%')
    OR LEFT(ISNULL(s.PageCode, 'x'), 12) <> 'shiftsummary'
    OR s.MenuList = 'Diagnostic'  --get shfit plan testing page into diagnostic
    )

    --handling for supported shift plan aliases:
    AND ((LEFT(ISNULL(s.PageCode, 'x'), 11) = 'shiftplanv2'
    AND ISNULL(@TypeAliasSupported, ',mining,maint,') LIKE '%,' + SUBSTRING(s.PageCode, 12, 25) + ',%')
    OR LEFT(ISNULL(s.PageCode, 'x'), 11) <> 'shiftplanv2'
    OR s.MenuList = 'Diagnostic'  --get shfit plan testing page into diagnostic
    )

    AND NOT (@IsPDSStillATable = 0
    AND @isLOCAL = 1
    AND s.PageID IN (90, 94))  --2021-09-29 don't show webbar input page on local webbars in Pybar that have ProdDataStorage as a syn and view

    --specific INCLUSIONS intially
    -- ts 2021-11-08
    AND (s.PageName = '../projectsetup.php/reporting'
    OR @UserGroup = 88)

    --swithc to EXCLUSIONS after cutover:


    ORDER BY ACtive, MenuList, PageDescription

  END

--do some cache builds
  exec [dbo].SP_ProjSetup_BuildCacheTablesWithMergeOtherCaches @ProjectID = @projectid
                                                             , @CacheRefreshCallPoint = 'MenuLinks';



END

GO
PRINT N'Altering [dbo].[SP_ProjSetup_WebbarSync_Etl_kpiSnapshot]'
GO
ALTER PROCEDURE [dbo].[SP_ProjSetup_WebbarSync_Etl_kpiSnapshot] @ProjectId INT, @UserID INT = 0, @SyncJobName VARCHAR(25) = 'Etl_KpiSnapshot_IncrementalDaily'
, @DebugMode INT = 0, @StartDate DATE = NULL, @EndDAte DATE = NULL
, @GetLiveDataOnly INT = 0  --this returns only the kpi dataset, not the second attributes dataset. can be called into sql funcitons by calling the proc into a temptable.
, @ObfuscateData INT = 1
, @ShiftToProject3 INT = 0
,@RunToThisStep int = 99
AS

BEGIN
  SET NOCOUNT ON;
  SET ANSI_WARNINGS OFF;

  /* calls:
  exec [dbo].[SP_ProjSetup_WebbarSync_Etl_kpiSnapshot] @ProjectId = 399, @SyncJobName  = 'Etl_KpiSnapshot_IncrementalDaily'        ,@StartDate  = '2021-12-01', @EndDAte = '2021-12-01'
  
  
  
  
  
  changelog:
  2022-02-09 ts create
  2022-02-18 ts ... remove the commma
  2022-02-22 ts ... attributes one needs different date field
  2022-02-24 ts ... add EtlDateTime field so we know when data has been chunked into the other end
                ... attribute returns "date" when it should return "inputdate"
  2022-05-23 ts ... add these to the call: declare @ObfuscateData int = 1
                  declare @ShiftToProject3 int = 1 
   2022-05-24 ts ... fix the subtotalid (too big)
   2022-06-07 ts ... explicitly reference the v4 of att and pds views (so as to manage the pybar transition) can shift back to PDS proper once all syn's are onto that one.
   2022-06-15 ts ... bring the new CutNumberId param
                  ... join on atributeid instaed
                  .. obfuscate if I want to
   2022-07-11 ts ... add CalStart and CalEndtimes: ALTER TABLE dbo.tbl_STO_ReportingSnapshot_KpiStats_All ADD CalStartTime datetime, CalEndTime datetime
    2022-08-01 ts ... add debugging
                  ... Made UniqieDataSEtId very big in the creation of #Combined. so it can get updated effectivly below
                  ... add PitId
    2022-10-12 ts ... add ignore warnings
    2022-10-21 ts ... fix metricSubtotalId being null
                    ... put this up top to ease trouble shooting
                    ... clean up temp tables at the top too
                    ... added NULL as an option to MetricSubtotal fake valueup top. so didn't get cant insert NULL into temp table erorr.
                    ... added crf? to missing ELSE on th ecrf backfill clause unlikely to be real world problem?>

  */

  /***********************
  notes: need to bring teh v4 pds view and v4 attr view for this.
                          the premise of this is that the mapping is more transparent and this whole thing is optimised for date filter (not all time) expected use of this would be for 1-2 days at a time. though likely 1mth could be done "live" once optimsed.
  todo: shift teh attributes pickup to dwh Attr Syn? (it is currently fixed to the v3 view.
  
  **************************/


  /***
  speed test results:
  pickup teh data:
  RestoreForTest CA repo test 2022-02-03. Stats only:                                                      31 days MCR, = 22289 rows 60 secs, 1day MCR = 1092 2 secs
                                                                                                                                      Stats and attributes :     31 days MCR, = 22289 rows + 7500 rosws of attributes  2.5mins, 1day MCR = 1092 2 secs
  
  ****/

  /*testing:
  --drop table  tbl_STO_ReportingSnapshot_KpiStats_All
  --drop table tbl_STO_ReportingSnapshot_AttributesTable_All
  select * from   tbl_STO_ReportingSnapshot_KpiStats_All
  select * from  tbl_STO_ReportingSnapshot_AttributesTable_All
  */

SET @ObfuscateData  = CASE WHEN datediff(day,'2022-06-28',getdate()) < 1  THEN  1 ELSE @ObfuscateData end
 SET @ShiftToProject3  = CASE WHEN  datediff(day,'2022-06-28',getdate()) < 1 THEN  1 ELSE @ShiftToProject3 end


  SET @StartDate = ISNULL(@startdate, @enddate)
  SET @EndDAte = ISNULL(@EndDate, @StartDate)
  --declare @ProjectId int = 399

  --todo, use IFs around @SyncJobName to decide how to set these flags:
  --declare @ObfuscateData int = 1
  --declare @ShiftToProject3 int = 1 



  IF OBJECT_ID('tempdb..#Stats') IS NOT NULL   drop TABLE #Stats;
  
  IF OBJECT_ID('tempdb..#attr') IS NOT NULL   drop TABLE #attr;
  
  IF OBJECT_ID('tempdb..#combined') IS NOT NULL   drop TABLE #combined;
  
  IF OBJECT_ID('tempdb..#attrPivoted') IS NOT NULL   drop TABLE #attrPivoted;
  
  IF OBJECT_ID('tempdb..#ForInsert') IS NOT NULL   drop TABLE #ForInsert;


 -- DECLARE @RunToThisStep INT = 7
  DECLARE @SelectIntoLocalTable INT = 0 -- for creating the dest tbale structures

  /****************************************
  pick up teh data
  *****************************************/
  SELECT
    [Date] = CONVERT(DATE, a.Date)
   ,a.Shift
   ,a.BudgetCodeID
   ,a.LocationID
   ,a.DestinationId  --bringing destinationId into the final result, could CASE it into LocationId for certain situations (like backfill)
   ,a.ProcessID
   ,a.ProjectID
   ,a.StatisticID
   ,a.ReasonID
   ,MaterialID = a.MaterialID
   ,MaterialSysId = a.[MaterialSysID]
   ,Material = m.MaterialDescOp
   ,a.EquipmentID  /*= CASE WHEN ProcessId IN (4) THEN a.RelatedEquipmentID  --for dev charging link it back to the jumbo, not the charge unit. nah can't do this, it messes up the equipment stats (eg equpiment downtime) do it further upstream in reporting
                                                                                                ELSE  a.EquipmentID  END*/
   ,a.OperatorID

   ,Metric_SubtotalId =case when a.statisticid = 7 then null --we are updaint hti field belwo. make it allowed to have NULLS wen the temp table is created.
                          else  '_2345_' end  --this is only VARCHAR(6) on the dest table!  also need to allow it to be the correct size when temp table is created

   ,[Value] --= CASE WHEN a.StatisticID = 155 AND MetricValue >= 91 THEN 0.5 ELSE 0 END
    -- ,[a].[RevisedValue]
   ,MetricValue = [Value]
   ,ActualValue = IIF([a].[BudgetCodeID] = 1, [Value], 0)
   ,TargetValue = IIF([a].[BudgetCodeID] <> 1, [Value], 0)
   ,eq.EquipTypeId
   ,RelatedEquipTypeId = eqr.EquiptypeId
   ,a.CrewId
   ,[cr].[CrewCode]
   ,DataSource = 'pds'
   ,ConsumableProjId --= NULL
   ,[a].[ConsumableID]
   ,LocationCode = l.LocationCode
   ,ls.SourceMasterID
   ,DestinationCode = d.LocationCode
    --  , a.[DestinationID]
   ,dest.DestMasterID
   ,a.ActivityID
   ,ConsumableDescShort = ''--a.ConsumableDescShort
   ,m.MaterialDescOp
   ,eq.EquipmentCode
   ,re.EquipTypeCode
   ,a.DetailID
   ,RelatedEquipmentID
   ,RelatedEquipID = eqr.EquipmentCode
   ,p.ProjectMask--= LEFT (tvProjMask.ProjectMask,6)
   ,s.StatisticCode
   ,ReasonDescription = ISNULL(NULLIF(arl.ReasonAlias, ''), r.ReasonDescription)
   ,em.EmployeeName
   ,Units = u.UnitsCode
   ,TStamp
   ,[Site] = o.OperationCode
   ,ActivityDesc = aa.ActivityComments + ' - ' + aa.ActivityDescription
   ,ProcessDesc = pp.ProcessDescription
   ,a.OperationID
   ,a.DataStoreID
   ,s.StatisticTypeID
   ,LocnSourceCode = l.SourceCode
   ,DestDestCode = dest.DestDescription
   ,BudgetCode
   ,a.Sequence
   ,ConsumableDesc = [cp].[ConsumableDescShort]
    --  ,DestinationCode = d.LocationCode
   ,BogFrom = bogf.BogFromDesc
   ,BogTo = bogt.BogToDesc
   ,[BogFromId] = IIF([a].[ProcessID] = 6, [a].[LoadedFrom], 0)
   ,[BogToId] = [a].[LoadedTo]
   ,LoadedAtCode = lla.locationCode
   ,LoadedAtId = [a].[LoadedFrom]
   ,Level = L.LocLevel
   ,WorkArea = pit.PitCode
   ,LocnMasterSourceCode = sysls.SourceDesc
    --,MasterSourceDesc = sysls.SourceDesc
   ,InputTimeStamp = a.TStamp
    --join back to ips for these ones
    --todo: bring some more fields through pds:
   ,TaskComments = [GenComments]
   ,a.InputComment
   ,a.SupervisorComments
   ,a.InputPhoto
   ,a.RevisedValue
   ,a.[StartTime]
   ,a.[EndTime]
   ,[OriginalValue] = IIF([a].[StatisticID] = 7, [a].[OrigValue], NULL)   --this for stat7 ebcuase non-time tasks get massaged time (to 0) add other thinkgs that might bet massaged here as necessary. or even join to recon log to see original logged on (at th eperil of slow quere!)
   ,PvtJn_TaskId = a.detailid -- CAST(st.detailid AS nvarchar(50)) -- +'_'+CAST(st.Sequence AS nvarchar)
   ,PvtJn_InputGroupId = a.Sequence
   ,PlodDataId = a.datastoreid
   ,UniqueTaskId = a.DetailID
   ,a.MonthTargetID
   ,[a].[ActivityReasonID] 
   ,a.CutNumberId
   ,CutNumberLabel = vgac.AttributeDescription
   ,l.PitId
   INTO #stats
  FROM dbo.tbl_DWH_ProdDataStorage_v4 AS a WITH (NOLOCK)
  --best not to do this if we can
  --left join [dbo].[tbl_DWH_iPlodStagingTableEdited] as ips with (NOLOCK)
  --ON a.DataStoreID = ips.StagingID
  --AND a.ProjectID = ips.ProjectID
  --and [a].[Date] = [ips].[Date]
  left JOIN dbo.view_GetAttributes_Cached AS vgac
    ON a.cutnumberId = vgac.AttributeID
    AND vgac.AttributeTypeID  = 107
  LEFT JOIN dbo.tbl_SYS_Crew AS cr
    ON a.CrewId = cr.CrewID
  LEFT JOIN dbo.tbl_DBT_ConsumablesProjectLink AS cp
    ON a.ConsumableProjID = cp.ConsumableProjectID
  INNER JOIN dbo.tbl_SYS_Equipment AS eq WITH (NOLOCK)
    ON a.EquipmentID = eq.EquipmentCodeID
  LEFT JOIN [dbo].[tbl_SYS_ActivityReasonLink] AS arl WITH (NOLOCK)
    ON a.[ActivityReasonID] = arl.[ActivityreasonLinkID]
  INNER JOIN dbo.tbl_SYS_ResEquipTypes AS re WITH (NOLOCK)
    ON eq.EquipTypeID = re.EquipTypeID
  LEFT JOIN dbo.tbl_SYS_BogFrom AS bogf
    ON a.LoadedFrom = bogf.BogFromID
      AND a.ProcessID IN (9, 5)
  LEFT JOIN dbo.tbl_SYS_BogTo AS bogt
    ON a.LoadedTo = bogt.BogToID
      AND a.ProcessID IN (9, 5)
  LEFT JOIN dbo.tbl_SYS_Equipment AS eqr WITH (NOLOCK)
    ON a.RelatedEquipmentID = eqr.EquipmentCodeID
  LEFT JOIN dbo.tbl_DBT_Location AS l WITH (NOLOCK)
    ON a.locationid = l.locationID
  LEFT JOIN dbo.tbl_DBT_Pit AS pit
    ON l.PitID = pit.PitID
  LEFT JOIN dbo.tbl_DBT_LocationSources AS ls WITH (NOLOCK)
    ON l.SourceID = ls.SourceID
  LEFT JOIN dbo.tbl_DBT_Location AS lla WITH (NOLOCK)
    ON a.LoadedFrom = lla.locationID --join on loaded At
  LEFT JOIN dbo.tbl_DBT_LocationSources AS las WITH (NOLOCK)
    ON lla.SourceID = las.SourceID
  LEFT JOIN dbo.tbl_DBT_Materials AS m WITH (NOLOCK)
    ON a.MaterialID = m.MaterialOpID
  LEFT JOIN dbo.tbl_DBT_Location AS d WITH (NOLOCK)
    ON a.DestinationID = d.LocationID
  LEFT JOIN dbo.tbl_DBT_LocationDest AS dest WITH (NOLOCK)
    ON d.DestID = dest.DestID
  LEFT JOIN dbo.tbl_SYS_Statistic AS s WITH (NOLOCK)
    ON a.StatisticID = s.StatisticID
  LEFT JOIN dbo.tbl_SYS_Units AS u WITH (NOLOCK)
    ON s.UnitID = u.UnitsID
  --LEFT JOIN  dbo.tbl_SYS_Equipment AS e ON tbl.EquipmentId = e.EquipmentCodeID  
  --LEFT JOIN dbo.tbl_SYS_ResEquipTypes AS re ON e.EquipTypeID = re.EquipTypeID
  --LEFT JOIN dbo.tbl_DBT_Location AS l ON tbl.locationid = l.locationID 
  --LEFT JOIN dbo.tbl_DBT_Location AS d ON tbl.DestinationID = l.LocationID
  INNER JOIN dbo.tbl_DBT_Project AS p WITH (NOLOCK)
    ON a.ProjectID = p.ProjectID
  INNER JOIN dbo.tbl_DBT_Operation AS o WITH (NOLOCK)
    ON p.OperationId = o.OperationID

  INNER JOIN dbo.tbl_DBT_BudgetCode AS bu WITH (NOLOCK)
    ON a.BudgetCodeID = bu.BudgetCodeID
  --INNER JOIN dbo.tbl_SYS_Equipment AS eq ON tbl.EquipmentID = eq.EquipmentCodeId
  INNER JOIN dbo.tbl_SYS_Reason AS r WITH (NOLOCK)
    ON a.ReasonID = r.ReasonID
  INNER JOIN dbo.tbl_SYS_Activity AS aa WITH (NOLOCK)
    ON a.ActivityID = aa.ActivityID

  INNER JOIN dbo.tbl_SYS_Process AS pp WITH (NOLOCK)
    ON pp.ProcessID = a.ProcessID
  LEFT JOIN dbo.tbl_DBT_Employees AS em WITH (NOLOCK)
    ON a.OperatorID = em.EmployeeID
  LEFT JOIN dbo.tbl_SYS_LocationSources AS sysls WITH (NOLOCK)
    ON ls.SourceMasterID = sysls.MasterSourceID
  --LEFT JOIN   dbo.[FN_ProjectMaskMap_New](NULL,NULL) tvProjMask 
  --        ON a.ProjectID = tvProjMask.ProjectID AND a.LocationID = tvProjMask.LocationID


  WHERE a.date BETWEEN @StartDate AND @EndDAte
  AND [a].[ProjectID] = @ProjectId



  --pick up teh attributes. 
  --todo: make this dynamic!!

  /*
  select * from [dbo].[vw_Reporting_KPINew_AllMappedPrimaryKpis_Attributes_MCR] where a_projectid = 399 and date between '2021-06-01' and '2021-07-15'  ts local pea 55secs, 156492 rows
  
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
                          CA 2021-12-23 ... Added Gold actual and forcast for grams and ounces (they are stat-trubites)
                          ts 
  
  */

  --the attributes: fixed pivot for now.add or subtract fields as necessary. put the dynamic pivot back into teh web and service an api for suckinginto reporting.

  SELECT --join fields
    --PvtJn_TaskID = a.detailid  --integer.
    ProjectId = a_ProjectId
   ,PvtJn_TaskId = [DetailID]
   ,PvtJn_InputGroupId = [PvtSeqJoin]
    -- ,a.detailid
    -- ,PvtSeqJoin
    --,PvtJn_OperatorDateShift =NULL -- CAST(OperatorId AS varchar) + '_'+CAST(date AS varchar)+'_'+Shift

    --the field with teh dynamic field names:
   ,Pvt_FieldNames = a.a_AttrTypeDesc
    --the field with the values to be pivoted. no need to aggregate, I am already aggregating here (can do a count or whatever I want)
   ,a.AttributeValue
   ,AttributeId
   ,AttributeTypeID
   ,[InputDate] = CONVERT(DATE, a.[InputDate]) INTO #attr
  FROM
  --dbo.tbl_DWH_ProdDataStorage AS pds
  --INNER JOIN  
  --select top 1 * FROM 
  dbo.tbl_DWH_Attributes_v4 AS a WITH (NOLOCK)  --v3 has only attributes.
  --ON a.DetailID = pds.DetailID
  --and pds.[Sequence] = a.[Sequence] don't do seuqnce on the join! because stat7 is only on sequence 0
  --INNER JOIN dbo.tbl_SYS_AttributeType AS at  WITH (NOLOCK)
  --        ON a.AttributeTypeID = at.AttTypeID

  WHERE --pds.ProjectID = @ProjectID 
  a_ProjectId = @ProjectId
  AND [a].[InputDate] BETWEEN @StartDate AND @EndDAte
  --AND pds.Date BETWEEN @Date AND @Date2
  --AND pds.BudgetCodeID =1
  --AND pds.StatisticID = 7

  --pivot some Attributes for joining, Or inserting to the main table? (add to this if need be)

  SELECT
    ProjectId
   ,PvtJn_TaskId --= [DetailID]
   ,PvtJn_InputGroupId --= PvtSeqJoin
   ,InputDate
   ,AttTypeId_48 = [48]
   ,AttTypeId_289 = [289] INTO #attrPivoted
  FROM (SELECT --join fields
      --PvtJn_TaskID = a.detailid  --integer.
      ProjectId
     ,PvtJn_TaskId
     ,PvtJn_InputGroupId
      --,PvtJn_OperatorDateShift =NULL -- CAST(OperatorId AS varchar) + '_'+CAST(date AS varchar)+'_'+Shift

      --the field with teh dynamic field names:
     ,Pvt_AttrTypeIds = [a].[AttributeTypeID]
      --the field with the values to be pivoted. no need to aggregate, I am already aggregating here (can do a count or whatever I want)
     ,Pvt_Value = MAX(a.[AttributeID])
     ,a.InputDate
    FROM [#attr] AS a
    WHERE [a].[AttributeTypeID] IN (48, 289)  --these are for Prod Drill mapping. add others as necessary
    GROUP BY PvtJn_TaskId
            ,PvtJn_InputGroupId
            ,a.InputDate
            ,a.[AttributeTypeID]
            ,[a].[ProjectId]) AS a
  PIVOT
  (
  MAX(Pvt_Value)
  FOR Pvt_AttrTypeIds IN ([48]
  , [289]
  )
  ) AS pvt




  IF @debugmode = 1
  BEGIN
    SELECT
      'Stats'
     ,*
    FROM [#stats]
        SELECT distinct
      'Stats_MetricSubtotal'
     ,Metric_SubtotalId
    FROM [#stats]
    SELECT
      'Attributes'
     ,*
    FROM [#Attr]
    SELECT
      '#attrPivoted'
     ,*
    FROM #attrPivoted
    SELECT
      'Attributes'
     ,*
    FROM [#Attr]
  --where pvt_taskid = 1078847

  /*select 'dupes in attr', * from (select     ProjectId 
                                                                                                     ,detailid
                                                                                                     ,PvtSeqJoin
                                                                                                              ,Pvt_FieldNames 
                                                                                                   ,AttributeValue
                                                                                                     , AttributeId
                                                                                                              , RowNum = ROW_NUMBER() OVER (PARTITION BY PvtSeqJoin,detailid,projectid, AttributeTypeID ORDER BY PvtSeqJoin,detailid,projectid, AttributeTypeID )
                                                                                                  from #attr) as b
                                                                                                  where [b].[RowNum] > 1
  */
  END


IF @DebugMode = 1 BEGIN

SELECT '#attr JustBuilt',* FROM #attr AS a

end



  /****************************************
  join to attributes, just enough to get some attrs reqruied for the mapping:
  *****************************************/
  --todo: make this dynamic too!
  IF @RunToThisStep >= 2
  BEGIN
    --SELECT * FROM [#stats]

    SELECT
      UniqueDataSetId = '003_12341231243_00_000_01_03_tbc_1234JustInCase'  --need to make it big enogh tht it doesn't get truncated below.
     ,a.*
     ,LoadedTruckCount =
      CASE
        WHEN a.[ProcessID] = 6 AND
          ISNULL(a.revisedValue, '') <> '' THEN 1
        ELSE NULL
      END  -- IIF ([st].[ProcessID]=6,convert(int,left(st.revisedValue,1)),null)
     ,DumpedTruckCount = IIF(a.[ProcessID] = 6, a.[ActualValue], NULL)
     ,LoadedTimestamp = IIF(a.[ProcessID] = 6, SUBSTRING(a.revisedValue, 12, LEN(a.revisedValue)), NULL)
     ,DumpedTimeStamp = IIF(a.[ProcessID] = 6, a.InputTimeStamp, NULL)

      --need some attribute values for mapping
     ,AttrTypeId_48 = COALESCE(b.AttTypeId_48, bb.AttTypeId_48)
     ,AttrTypeId_289 = COALESCE(b.AttTypeId_289, bb.AttTypeId_289)

      --, ActivityReasonId = 0 --tbc, need to haul through the below views.


     ,WorkType = 'Mining'  --tbc, need to haul through the below views.


    INTO #Combined
    FROM #Stats AS a

    LEFT JOIN --(SELECT
    -- *
    --FROM s
    [#attrPivoted] AS b
      --WHERE PvtJn_InputGroupId >= 0) AS b
      ON a.PvtJn_TaskId = b.PvtJn_TaskId
        AND a.PvtJn_InputGroupId = b.PvtJn_InputGroupId
        --date is filterd out on initial select. and a.Date = b.inputDate
        AND a.ProjectID = b.ProjectId
        AND b.PvtJn_InputGroupId >= 0-- OR b.PvtJn_InputGroupId = -1)  -- -1 indicates this attribute input is not inside the group

    LEFT JOIN --(SELECT
    -- *
    --FROM 
    [#attrPivoted] AS bb
      ON bb.PvtJn_InputGroupId < 0
        --and a.Date = bb.inputDate
        AND a.ProjectID = bb.ProjectId
        AND a.PvtJn_TaskId = bb.PvtJn_TaskId

  --and (a.PvtJn_InputGroupId = b.PvtJn_InputGroupId)-- OR b.PvtJn_InputGroupId = -1)  -- -1 indicates this attribute input is not inside the group




  END

  IF @DebugMode = 1
  BEGIN
    SELECT
      '[#Combined]'
     ,*
    FROM [#Combined]
  END
  /****************************************
  do some obfuscation
  *****************************************/
  IF @RunToThisStep >= 3
    AND @ObfuscateData = 1
  BEGIN

    UPDATE [#Combined]
    SET LocationCode = LocnSourceCode + '_' + CAST(LocationId AS VARCHAR(25))
       ,EquipmentCode = EquipTypeCode + '_' + CAST(EquipmentId AS VARCHAR(25))
       ,EmployeeName = 'Employee #' + CAST(OperatorId AS VARCHAR(25)) --be nice to  bring Position up here and go "Jumbo Operator # 1"
       ,[Site] = IIF(@ShiftToProject3 = 1, 'TEST', [Site])
       ,[ProjectID] = IIF(@ShiftToProject3 = 1, 3, [ProjectId])




  END


  /****************************************
  do teh KPI mapping
  *****************************************/
  IF @RunToThisStep >= 4
  BEGIN
                                                --CREATE VIEW [dbo].[View_KPINew_Stat18_Tonnes_v3]
                                            
                                                /*
                                                select * from  [dbo].[View_KPINew_Stat18_Tonnes] where projectid = 259 and budgetcodeid = 1   10secs 16976
                                                select * from  [dbo].[View_KPINew_Stat18_Tonnes] where projectid = 259 and budgetcodeid = 1 and metricid = 6  --1 sec 7345rows
                                                select * from  [dbo].[View_ProddataStorage_DailySummary] where projectid = 259 and budgetcodeid = 1 and metricsort = 6  --13 secs 1084 rows
                                                2020-07-20 ts ... create from the all encompassing KPI function becuase it is too slow
                                                                                                ... everything from PDS. soon enough this will be a view anyway.  leave the function calling out of ips for now ... can shift it back to this view ultimately?
                                                2020-07-28 ts ... whack in the new handling for splitting Ore Tonnes
                                                2020-07-29 ts ... addedhandling for the target backfill task 329
                                                2020-7-30 ts ... added nolock to all, ditch the ProjMaskMap ... to save query time. it is added in ProdDataDailySummary view anyway
                                                2020-08-24 ts ... add datastoreid
                                                2020-08-26 ts ... sinulls on teh las for ore tonnes
                                                2020-08-28 ts ... shift bogging out to stope bogging (primary) 
                                                2020-09-14 ts ... bring StatisticTypeID, LocnSourceCode = l.LocationCode, DestDestCode = '', BudgetCode, Sequence, ConsumableDesc='', DestinationCode='', BogFrom='', BogTo='', LoadedAtCode='' , Level=l.LocLevel, WorkArea = pit.PitCode  and drop the filter for only mapped ones
                                                2020-11-26 ts ... add loc level and work area
                                                2020-12-01 ts ... add Material  ; 2021-01-15 ts ... add timestamp    
                                                2021-04-06 ts ... target for ore tonnes to ROM
                                                                                                ... handle null destination as ROM (so that targets flow into this mapping too)
                                                                                                ... add comment on why targets don't show (location for Ore tonnes target needs to have either prod or dev source code)
                                                2021-04-13 ts ... add tonnes mapping for shotcrete hydraulic fill.
                                                2021-09-08 CA ... Changed LocnSourceCode = l.SourceCode from l.LocationCode. Also changed the changelog text for 2020-09-14. Added MasterSourceDesc
                                                2021-12-13 CA ... BogFrom and BogTo changed from being blank
                                                2021-11-25 ... join in arl for reason alias                     <<add change log>>
                                                
                                                if adding to the statisic filters on teh WHERE, need to remove out of this:
                                                View_KPINew_StatV_UnmappedStats
                                                */
                                            
                                            
              UPDATE [#Combined]
                                                SET Metric_SubtotalId = --combo of metricId and SubtotalId
                                                CASE
                                                  --trucking tonnes:
                                                  --ore tonnes
                                                  WHEN StatisticID = 18 AND
                                                    ReasonID = 172 AND
                                                    MaterialSysId = 11 THEN    --put isnulls on the destmaster for targets, however we may have to put in new Reason for trucking to rom if they need separate target
                                                    CASE
                                                      WHEN SourceMasterID = 2 AND
                                                        ISNULL(DestMasterID, 4) /*2021-04-06 handle null as ROM, they are Targets anyway*/ = 4 AND
                                                        ISNULL(SourceMasterID, 0) <> 10 THEN '006_01' --dev (to rom). not rehandled
                                                      WHEN SourceMasterID = 1 AND
                                                        ISNULL(DestMasterID, 4) /*handle null as ROM, they are Targets anyway*/ = 4 AND
                                                        ISNULL(SourceMasterID, 0) <> 10 THEN '006_02' --stope (to rom)
                                                      WHEN SourceMasterID = 2 AND
                                                        ISNULL(DestMasterID, 4) /*handle null as ROM, they are Targets anyway*/ <> 4 AND
                                                        ISNULL(SourceMasterID, 0) <> 10 THEN '006_03'  --dev (not to rom)
                                                      WHEN SourceMasterID = 1 AND
                                                        ISNULL(DestMasterID, 4) /*handle null as ROM, they are Targets anyway*/ <> 4 AND
                                                        ISNULL(SourceMasterID, 0) <> 10 THEN '006_04'  --stope (not to rom)
                                                      WHEN /*ls.SourceMasterID = 1 AND*/ ISNULL(DestMasterID, 4) /*handle null as ROM, they are Targets anyway*/ = 4 AND
                                                        ISNULL(SourceMasterID, 0) = 10 THEN '006_05' --rehandle (to rom)
                                                      WHEN /*ls.SourceMasterID = 2 AND*/ ISNULL(DestMasterID, 4) /*handle null as ROM, they are Targets anyway*/ <> 4 AND
                                                        ISNULL(SourceMasterID, 0) = 10 THEN '006_06'  --rehandle (not to rom)
                                            
                                                      --note, when target location.SourceCode is neither Prod or Dev, the targets will fall into 006_00. a fix for this would be to simply make sure the default Location for ore tonnes have Dev or Prod. 
                                                      --another fix might be to map teh 006_00 in KPI project table
                                                      ELSE '006_00'  --catch all, based on ... a.StatisticID = 18 AND a.ReasonID = 172 AND m.MaterialSysId = 11
                                                    END
                                                  --resample one
                                                  WHEN StatisticID = 18 AND
                                                    ReasonID = 172 AND
                                                    MaterialSysId = 13 THEN  --resample tonnes
                                                    --CASE WHEN ls.SourceMasterID = 2 THEN '039_01' --dev
                                                    --          WHEN ls.SourceMasterID = 1 THEN '039_02' --stope
                                                    --          ELSE '039_00'
                                                    '039_00'
                                                  --END
                                            
                                                  --Waste Tonnes hauled (not backfilled)                                                             --NOTE: this original KPI will map tonnes to backfill into this KPI!   [dbo].[View_KPI_12_WasteTonne] . ..ts 2020-02-11
                                                  --update 2020-02-20 ... backfill tonnes needs to be mapped independently to waste tonnes. bu
                                            
                                                  WHEN (StatisticID = 18) AND
                                                    (ReasonID = 172) AND
                                                    (MaterialSysId = 12) AND
                                                    NOT (ISNULL(DestMasterID, 0) = 1 AND
                                                    ProcessId = 6)  --added to avoid mapping backfill into here. same filter as for KPI set 019_..
                                                    AND NOT ReasonID = 329  -- don't get the backfill targets either
                                                  THEN '012_00'
                                                  WHEN (StatisticID = 18) AND
                                                    (ReasonID = 172) AND
                                                    (MaterialSysId = 12) AND
                                                    (ISNULL(DestMasterID, '') = 1 OR
                                                    reasonid = 329)  --backfill target goes in here because we don't handle destination on targets
                                                    AND ProcessId = 6  --this bit is waste tonnes trucked as well as backfilled
                                                  THEN '019_02'  --map this to Metric 12 as well. (the join to SYS_KPI_DEfins should duplicate the lines)
                                            
                                            
                                                  --backfill, waste
                                                  WHEN (StatisticID = 18) AND
                                                    (MaterialSysId = 12) --THEN 
                                                    --CASE WHEN  (a.LoadedTo = 3) OR (a.ReasonID = 329) THEN '019_01' --bogged to stope (or target)
                                                    --mapped up with waste tonnes hauled. no specifica target for trucking waste tonnes? WHEN  ((dest.DestMasterID = 1) AND ProcessId = 6) /*OR (a.ReasonID = 329)*/ THEN  '019_02' --trucked to stope (NOT target, will need to bring new target reason maybe. also this has ramafications with the dual mapping of waste tonnes (will likely duplicate the target?)
                                                    --remapped like this because it was removing the waste bogging trans from mapping donwn below 2020-05-14
                                                    AND ((ISNULL([BogToId], 0) = 3) OR
                                                    (ReasonID = 329)) THEN '019_01' --bogged to stope (or target)
                                                  --END    
                                                  --backfill, CRF
                                                  WHEN (StatisticID = 18) AND
                                                    (MaterialSysId = 23) THEN CASE
                                                                              WHEN (ISNULL([BogToId], 0) = 3) OR
                                                                                (ReasonID = 329) THEN '029_01' --bogged to stope (or target)
                                                                              WHEN ((ISNULL(DestMasterID, 0) = 1) AND
                                                                                ProcessId = 6) OR
                                                                                (ReasonID = 329) THEN '029_02' --trucked to stope (or target) this target will already be mapped into 029_01 ... ?
                                                                                else 'crf?'  --so there is no null and so we can find mapping issues.
                                                                            END
                                                                    
                                                  --stope bogging
                                                  WHEN StatisticID = 18 AND
                                                    ProcessID = 5 AND
                                                    ISNULL([BogFromId], 0) = 4 THEN '049_' + CAST(ISNULL([BogFromId], '') AS VARCHAR) + CAST(ISNULL([BogToId], '') AS VARCHAR)  --build the subtotal part dynamically
                                            
                                                  --Other bogging
                                                  WHEN StatisticID = 16 AND
                                                    ProcessID = 5 AND
                                                    ISNULL([BogFromId], 0) <> 4 THEN '034_' + CAST(ISNULL([BogFromId], '') AS VARCHAR) + CAST(ISNULL([BogToId], '') AS VARCHAR)  --build the subtotal part dynamically
                                            
                                            
                                                  --hydraulic fill in tonnes
                                                  WHEN StatisticID = 18 AND
                                                    ReasonID = 1731 THEN '051_02'
                                                  --other bogging, no backfill, dynamically set.
                                                  /*                      kill this for now, it likely will slow shit up. don't think that it is being used anymore anyway (was for THA stope bogging data into their daily spreadsheet)
                                                                          WHEN a.StatisticID = 18 AND a.ProcessID = 5 AND ISNULL(a.LoadedTo,0) NOT IN (0,3,5) AND ISNULL(a.loadedFrom,0) not in (0,4) THEN 
                                                                                                                          '034_' +CAST (ISNULL(a.LoadedFrom,'') AS varchar)+CAST (ISNULL(a.LoadedTo,'') AS varchar)  --build the subtotal part dynamically
                                                  */
                                            
                                            
                                                  ELSE Metric_SubtotalId
                                                END
            WHERE StatisticID IN (18)
                                            

                                                --tkms: (and # of trucks)
            UPDATE [#Combined]
                                                SET Metric_SubtotalId = --combo of metricId and SubtotalId
                                                CASE
                                            
                                                  --Trucking
                                                  WHEN Statisticid = 37 THEN '005_00'  --TKMs
                                            
                                                  WHEN Statisticid = 17 THEN '052_00'  -- # of Trucks
                                                  ELSE Metric_SubtotalId
                                                END
                                            
                                            
             WHERE StatisticID IN (17, 37)
                                            
                                            
                                            
                                            
                                            
                                            
                                                /*
                                                
                                                SELECT * FROM  [dbo].[View_KPINew_Stat6_Drillm]
                                                2020-07-30 ts ... only get equiptype=PD into metric=3.  need to be careful unwinding this ... there appears to be some historical data with UJ drilling into Process=7 (eg service holes, probe holes)
                                                2020-07-30 ts ... make new metric for Operator Error Redrill
                                                                                                ... new line for misc drilling
                                                2020-7-30 ts ... added nolock to all, ditch the ProjMaskMap ... to save query time. it is added in ProdDataDailySummary view anyway
                                                                                                ... remove teh equiptpeId filter for normal prod drilling .... if you drill with a cabolter it should still count!
                                                2020-08-03 ts ... added  cleanouts. not currenly coded as actual drilling, but put in here anyway
                                                                                                ... allow the stat
                                                2020-08-25 ts ... add datastoreid 
                                                2020-08-26 ts ... change jumbo drillm
                                                2020-09-14 ts ... bring StatisticTypeID, LocnSourceCode = l.SourceCode, DestDestCode = '', BudgetCode, Sequence, ConsumableDesc='', DestinationCode='', BogFrom='', BogTo='', LoadedAtCode='' , Level=l.LocLevel, WorkArea = pit.PitCode , MasterSourceDesc = sysls.SourceDesc and drop the filter for only mapped ones
                                                2020-11-04 ts ... swtihc some pd drillign onto new Metric_Subtotals
                                                                                    ... ditch the "operator error" redrill mapping and instead map all redrills to that subtotal id
                                                2020-11-05 ts ... remove teh equiptype=113 filter on all actual drilling (bound by reason, left it there for Misc drilling see notes from 2020-07-30. PEA was using cable bolter to do production drilling
                                                
                                                */
                                            
                                            
                                            
              UPDATE a
                                                SET Metric_SubtotalId = --combo of metricId and SubtotalId
                                                CASE
                                                  --Production drilling , non-sludge.  if we need to allow other EquipTypes in here, need to be careful looking at historical ... there may be some accidental UJ doing service holes on ProcessID=7
                                                  WHEN a.Statisticid = 6 AND
                                                    a.ReasonID <> 260 THEN --no redrilling due to operator error, no sludge drilling
                                                    CASE
                                                      WHEN a.ProcessID = 7 /*AND eq.EquipTypeID = 113 2020-07-30*/ /*is auto:*/ AND CAST(ISNULL([AttrTypeId_289], '') AS VARCHAR(25)) <> '1663' AND
                                                        a.ReasonId IN (270, 161, 296, 287, 283, 256) --+ slashing. up and down + collaring. pilot and ream (in case we get ITH back)
                                                        AND /*Any redrill reason:*/ CAST(ISNULL([AttrTypeId_48], '') AS VARCHAR(25)) NOT IN (147, 154, 155, 167) THEN '003_01'  --normal drilling, not auto and not misc
                                            
                                                      WHEN a.ProcessID = 7 AND
                                                        a.EquipTypeID = 113  /*is auto:*/ AND CAST(ISNULL([AttrTypeId_289], '') AS VARCHAR(25)) <> '1663' AND
                                                        a.ReasonId NOT IN (270, 161, 296, 287, 283, 256) --eg probe or service hole
                                                        AND /*Operator Error redrill reason (ignored)*/ CAST(ISNULL([AttrTypeId_48], '') AS VARCHAR(25)) <> 'xx' THEN '050_01'  -- misc drilling, not auto and not operator error redrill  2020-11-04 new KPIid also don't worry about redrills on this misc shit
                                            
                                            
                                                      WHEN a.ProcessID = 7 /*AND eq.EquipTypeID = 113 2020-11-05*/ AND /*is auto:*/ CAST(ISNULL([AttrTypeId_289], '') AS VARCHAR(25)) = '1663' AND /*any redrill reason:*/
                                                        CAST(ISNULL([AttrTypeId_48], '') AS VARCHAR(25)) NOT IN (147, 154, 155, 167) THEN '003_02'                     --unmanned auto drilling
                                                      WHEN a.ProcessID = 7 /*AND eq.EquipTypeID = 113 2020-11-05*/ --AND /*is auto:*/CAST(ISNULL(aut.AttributeID,'') AS varchar(25)) <> 1663 
                                                        AND /*any redrill redrill reason:*/ CAST(ISNULL([AttrTypeId_48], '') AS VARCHAR(25)) IN (147, 154, 155, 167) THEN '003_03'                        --any redrilling.    operator error redrill.
                                            
                                            
                                                      WHEN a.ProcessID = 10 AND
                                                        a.EquiptypeId = 113 THEN '002_01'  --doesnt matter which rig drills cables
                                                      WHEN a.ProcessID = 10 AND
                                                        a.EquiptypeId = 126 THEN '002_02'  --I believe that the old KPI mapping had re-drill mapped separately ... is this even legit?! there are two reasons for cable drilling ... is something we could map again like that as requested. see [View_KPI_17_CaboltReDrill]
                                            
                                                      WHEN a.ProcessID = 10 AND
                                                        a.EquiptypeId = 91 THEN '002_03'
                                                      WHEN a.ProcessID = 10 AND
                                                        a.EquiptypeId NOT IN (113, 126, 91) THEN '002_00'
                                                      WHEN a.ProcessID = 1 THEN '045_01' --dev drilling 2020-08-26
                                                      WHEN a.ProcessID = 3 THEN '045_02' --GS Drilling  
                                            
                                                      WHEN a.ProcessId = 19 THEN '013_00'  --diamond drilling
                                                      ELSE Metric_SubtotalId
                                                    END
                                                  --sludge drilling
                                                  WHEN a.Statisticid = 6 AND
                                                    CAST(ISNULL([AttrTypeId_48], '') AS VARCHAR(25)) <> '167' AND
                                                    a.ReasonID = 260 THEN CASE
                                                      WHEN a.EquiptypeId = 113 THEN '027_01'  --PD
                                                      WHEN a.EquiptypeId = 126 THEN '027_02'  --UJ
                                                      WHEN a.EquiptypeId = 91 THEN '027_03'  --CB
                                                      ELSE '027_00'
                                                    END
                                                  WHEN a.StatisticID = 165 THEN '048_01'   --cleanout metres
                                                  ELSE Metric_SubtotalId
                                                END
                                            
                                            
                                            
                                                FROM [#Combined] AS a
                                            
           WHERE StatisticID IN (6, 165)
                                                AND ProcessId <> 17 --raisebore
                                            
                                            
                                            
                                            
                                            
                                            
                                                --create    View [dbo].[View_KPINew_Stat7_TimeUsage_v3]
            UPDATE a
                                                SET Metric_SubtotalId = --combo of metricId and SubtotalId
                                                CASE
                                                  --Equipment Downtime and other time mapping
                                                  /*********
                                                  be careful mapping this, it will only take the first map. need to exclude reason or whatever so that we get an explicit, clean map here. (to put it onto more than one KPI, map twice in the sys_kpi defin tabl
                                                  *********/
                                                  WHEN a.StatisticID = 7 AND
                                                    a.ActivityID IN (4, 5, 6) AND
                                                    a.ReasonID <> 239 --removed Type, this will pull through to PDS automatically when this is a view)AND Type LIKE 'Mining%' --only get hours on Mining type. maint type has duplicates because of multiple fitters working on single machine.
                                                  THEN '008_00'
                                                  WHEN a.StatisticID = 7 AND
                                                    a.ReasonID = 239 --AND Type LIKE 'Mining%'
                                                  THEN '037_00'  --Daily Services  these will be reproted twice in unfiltered select on this function!! *mapped twice in te KPIdef'ns table
                                                  WHEN a.StatisticID = 7 AND
                                                    a.ActivityID = 1 --AND Type LIKE 'Mining%'
                                                  THEN '036_00'  --PRDT Hrs
                                                  WHEN a.StatisticID = 7 AND
                                                    a.ActivityID IN (2, 3) --AND Type LIKE 'Mining%'
                                                  THEN '043_00'  --PRDT Hrs
                                            
                                            
                                            
                                                  ELSE Metric_SubtotalId
                                            
                                                END
                                            
                                            
                                            
                                                FROM [#Combined] AS a
                                            
           WHERE a.StatisticID = 7
                                            
                                            
                                            
                                            
                                                --create    View [dbo].[View_KPINew_StatV_CablesNotDrill_v3]
            UPDATE a
                                                SET Metric_SubtotalId = --combo of metricId and SubtotalId
                                                CASE
                                                  --Cables (not drilling)
                                                  WHEN a.StatisticID = 35 THEN '009_00'  --INSTALL add some sub total splits for manual vs cabolter?
                                                  WHEN a.StatisticID = 46 THEN '010_00'  --TEnsion 
                                            
                                            
                                                  ELSE Metric_SubtotalId
                                                END
                                            
                                            
                                            
                                                FROM [#Combined] AS a
                                            
            WHERE a.StatisticID IN (35, 46)
                                            
                                                --create    View [dbo].[View_KPINew_StatV_Consumables_v3]
              UPDATE a
                                                SET Metric_SubtotalId = --combo of metricId and SubtotalId
                                                CASE
                                                  --GSBoltsInstalled (except the ones below) REMOVE FROM THIS LIST if adding to special consumable KPI mapping
                                                  WHEN (a.ConsumableID <> 87) AND
                                                    (MonthTargetID <> 56) AND
                                                    (a.StatisticID = 10)  --only bolts on this one.
                                                  THEN '032_00' --all consumables
                                            
                                                  --special consumables
                                                  WHEN (a.StatisticID = 10) AND
                                                    (a.ConsumableID = 87 OR
                                                    MonthTargetID = 56) THEN '032_01' --2.4 resins
                                            
                                                  WHEN a.StatisticID = 11 THEN '024_00' --mesh #
                                            
                                                  ELSE Metric_SubtotalId
                                                END
                                            
                                                FROM [#Combined] AS a
                                            
              WHERE ISNULL(a.ConsumableProjID, 0) <> 0
                                            
                                            
                                            
                                                --create    View [dbo].[View_KPINew_StatV_DevAdvance_v3]
                                            
                                                /*
                                                2020-12-16 ts ... add drag cut to "stripping"
                                                                                                ... add teh exclusion of drag cut
                                                2021-09-08 CA ... Changed LocnSourceCode = l.SourceCode from l.LocationCode. Also changed the changelog text for 2020-09-14. Added MasterSourceDesc
                                                
                                                
                                                */
                                            
                                            
            UPDATE a
                                                SET Metric_SubtotalId = --combo of metricId and SubtotalId
                                                CASE
                                                  WHEN a.Statisticid = 13 THEN CASE
                                                      WHEN a.ProcessID = 4 AND
                                                        a.ReasonID = 248 THEN '001_01'  --face charging
                                                      WHEN a.ProcessID = 4 AND
                                                        a.ReasonID IN (301, 164) THEN '001_02'  --  stripping + drag cut.
                                                      WHEN a.ProcessID = 3 THEN '001_03'  --rehab
                                                      WHEN NOT (a.ProcessID IN (3, 4) AND
                                                        a.ReasonID IN (248, 164, 301)) THEN '001_00' --other? not sure what it would be
                                                      ELSE Metric_SubtotalId
                                                    END
                                                  --stripping vol
                                                  WHEN a.Statisticid = 49 THEN '023_00'
                                            
                                                  --rehab linear adv
                                                  WHEN (a.StatisticID = 105) AND
                                                    (a.ReasonID = 166) THEN '035_00'
                                                  ELSE Metric_SubtotalId
                                                END
                                                FROM [#Combined] AS a
                                            
             WHERE a.StatisticID IN (13, 49, 105)
                                            
                                            
                                                --create    View [dbo].[View_KPINew_StatV_MostRecentEntry_v3]
               UPDATE [#Combined]
                                                SET Metric_SubtotalId = --combo of metricId and SubtotalId
                                                CASE
                                            
                                                  WHEN a.StatisticID = 164 THEN '047_01'          --Open Void to Fill                                                                    
                                                  WHEN a.StatisticID = 163 THEN '047_02'          --Broken Ore Stocks    
                                                  WHEN a.StatisticID = 162 THEN '047_03'          --Drilled Ore Stocks      
                                                  WHEN a.StatisticID = 161 THEN '047_04'          --Developed Ore Stocks           
                                                  ELSE Metric_SubtotalId
                                                END
                                                FROM [#Combined] AS a
              WHERE a.StatisticID IN (164,
              163,
              162,
              161)
                                            
                                            
                                                --create    View [dbo].[View_KPINew_StatV_PerfectDay_v3]
               UPDATE a
                                                SET Metric_SubtotalId = --combo of metricId and SubtotalId
                                                CASE
                                                  --perfect day yes or no. can't do easily here?!
                                                  --WHEN a.StatisticID = 155 AND MetricValue >= 91
                                                  --                        THEN '038_00' 
                                                  WHEN a.StatisticID = 155 -- AND Value >= 91
                                                  THEN '040_00' -- perfect day shift score
                                                  --'038_00' -- pefect day count
                                                  ELSE Metric_SubtotalId
                                                END
                                            
                                            
                                            
                                            
                                                FROM [#Combined] AS a
                                            
                 WHERE a.StatisticID = 155 --ISNULL(a.ConsumableProjID,0) <>0
                                            
                                            
                                            
                                                --create    View [dbo].[View_KPINew_StatV_Raisebore_v3]
                 UPDATE a
                                                SET Metric_SubtotalId = --combo of metricId and SubtotalId
                                                CASE
                                                  --shotcrete dumping (shaftlining)
                                                  WHEN a.StatisticID = 150 -- AND Value >= 91
                                                  THEN '042_00'
                                                  WHEN a.Reasonid = 316 AND
                                                    a.StatisticID = 6 THEN '022_00'
                                                  WHEN a.Reasonid = 247 AND
                                                    a.StatisticID = 6 THEN '021_00'
                                                  WHEN a.Reasonid = 177 AND
                                                    a.StatisticID = 6 THEN '020_00' -- END AS Metric, 
                                                  -- CASE WHEN a.Reasonid = 316 THEN 22 WHEN a.Reasonid = 247 THEN 21 WHEN a.Reasonid = 177 THEN 20 ELSE NULL
                                            
                                            
                                                  ELSE Metric_SubtotalId
                                                END
                                            
                                                FROM [#Combined] AS a
                WHERE a.StatisticID IN (6, 150)
                AND a.ProcessID = 17
                                            
                                            
                                            
                                            
                                            
                                                --create    View [dbo].[View_KPINew_StatV_ShotCrete_v3]
                  UPDATE a
                                                SET Metric_SubtotalId = --combo of metricId and SubtotalId
                                                CASE
                                                  --Shotcrete
                                                  WHEN a.Statisticid = 27 THEN '004_00'  --m3 sprayed
                                                  WHEN a.Statisticid = 50 THEN '030_00' --m2 sprayed
                                                  WHEN a.Statisticid = 78 AND
                                                    a.ReasonID <> 1731 THEN '026_00'         --m3 transported
                                                  WHEN a.Statisticid = 78 AND
                                                    a.ReasonID = 1731 THEN '051_01'           --m3 hydraulic fill
                                                  ELSE Metric_SubtotalId
                                                END
                                                FROM [#Combined] AS a
                 WHERE a.StatisticID IN (27, 50, 78)
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                                --create    View [dbo].[View_KPINew_StatV_StopingActivities_v3]
                   UPDATE a
                                                SET Metric_SubtotalId = --combo of metricId and SubtotalId
                                                CASE
                                            
                                                  --Stoping activities
                                                  WHEN a.StatisticID = 26 AND
                                                    a.ProcessID = 8 THEN '011_00'   --tonnes fired                                                               
                                                  ELSE Metric_SubtotalId
                                            
                                                END
                                            
                                                FROM [#Combined] AS a
                                            
                 WHERE a.StatisticID IN (26)
                                            
                                            
                                            
                                            
                                            
                                            
                                                --create view [dbo].[View_KPINew_StatV_UnmappedStats_v3]
                 UPDATE a
                                                SET Metric_SubtotalId = --combo of metricId and SubtotalId
                                                CASE
                                            
                                                  --Stoping activities
                                                  WHEN a.StatisticID = 26 AND
                                                    a.ProcessID = 8 THEN '011_00'    --tonnes fired                                                               
                                                  --backfill, waste
                                                  WHEN (a.StatisticID = 16) AND
                                                    (MaterialSysID = 12) --THEN 
                                                    --CASE WHEN  (a.LoadedTo = 3) OR (a.ReasonID = 329) THEN '019_01' --bogged to stope (or target)
                                                    --mapped up with waste tonnes hauled. no specifica target for trucking waste tonnes? WHEN  ((dest.DestMasterID = 1) AND ProcessId = 6) /*OR (a.ReasonID = 329)*/ THEN  '019_02' --trucked to stope (NOT target, will need to bring new target reason maybe. also this has ramafications with the dual mapping of waste tonnes (will likely duplicate the target?)
                                                    --remapped like this because it was removing the waste bogging trans from mapping donwn below 2020-05-14
                                                    AND ((ISNULL(a.BogToId, 0) = 3) OR
                                                    (a.ReasonID = 329)) THEN '019_01' --bogged to stope (or target)
                                                  --END    
                                                  --backfill, CRF
                                                  WHEN (a.StatisticID = 16) AND
                                                    (MaterialSysId = 23) THEN CASE
                                                      WHEN (ISNULL(a.BogToId, 0) = 3) OR
                                                        (a.ReasonID = 329) THEN '029_01' --bogged to stope (or target)
                                                      WHEN ((ISNULL(DestMasterID, 0) = 1) AND
                                                        a.ProcessId = 6) OR
                                                        (a.ReasonID = 329) THEN '029_02' --trucked to stope (or target) this target will already be mapped into 029_01 ... ?
                                                      ELSE 'xx'
                                                    END
                                            
                                                  --stope bogging
                                                  WHEN a.StatisticID = 16 AND
                                                    a.ProcessID = 5 AND
                                                    ISNULL(a.BogFromId, 0) = 4 THEN '049_' + CAST(ISNULL(a.BogFromId, '') AS VARCHAR) + CAST(ISNULL(a.BogToId, '') AS VARCHAR)  --build the subtotal part dynamically
                                            
                                                  --Other bogging
                                                  WHEN a.StatisticID = 16 AND
                                                    a.ProcessID = 5 AND
                                                    ISNULL(a.BogFromId, 0) <> 4 THEN '034_' + CAST(ISNULL(a.BogFromId, '') AS VARCHAR) + CAST(ISNULL(a.BogToId, '') AS VARCHAR)  --build the subtotal part dynamically
                                            
                                                  ELSE Metric_SubtotalId
                                                END
                                            
                                            
                                                FROM [#Combined] AS a
                    WHERE a.StatisticID NOT IN (26, 27, 50, 78, 164,
                    163,
                    162,
                    161,
                    155,
                    13, 49, 105,
                    35, 46
                    , 6, 165
                    , 18, 37, 17
                    , 7
                    , 150)
                    AND ISNULL(a.ConsumableProjID, 0) = 0



  END  --end kpi mapping



  /****************************************
  Join to Kpi mapping table
  *****************************************/
  IF @RunToThisStep >= 5
  BEGIN
    --todo: join to dbt kpis table to get revised descriptions?
    SELECT
      [a].[UniqueDataSetId]
     ,[a].[Date]
     ,[a].[Shift]
     ,[a].[ProjectID]
     ,[a].Site
     ,[a].[ActivityDesc]
     ,[a].[ActualValue]
     ,[a].BogFrom
     ,[a].BogTo
     ,[a].BudgetCode
     ,[a].ConsumableDesc
     ,[a].[ConsumableDescShort]
     ,[a].CrewCode
     ,[a].DestDestCode
     ,[a].DestinationCode
     ,[a].[DumpedTimeStamp]
     ,[a].[DumpedTruckCount]
     ,[a].EmployeeName
     ,[a].[EndTime]
     ,[a].EquipmentCode
     ,[a].EquipTypeCode
     ,[a].[InputComment]
     ,[a].[InputPhoto]
     ,[a].[InputTimeStamp]
     ,[a].Level
     ,[a].LoadedAtCode
     ,[a].[LoadedTimestamp]
     ,[a].[LoadedTruckCount]
     ,[a].LocationCode
     ,[a].LocnMasterSourceCode
     ,[a].LocnSourceCode
     ,[a].Material
     ,[a].MaterialDescOp
     ,
      --[a].[MetricCode],
      --[a].[MetricDesc],
      [a].[MetricValue]
     ,[a].[OriginalValue]
     ,[a].ProcessDesc
     ,[a].ProjectMask
     ,[a].[ReasonDescription]
     ,[a].[RevisedValue]
     ,[a].[StartTime]
     ,[a].[StatisticCode]
     ,
      --[a].[MetricSubtotalCode], 
      [a].[SupervisorComments]
     ,[a].[TargetValue]
     ,[a].[TaskComments]
     ,[a].Units
     ,[a].[Value]
     ,[a].WorkArea
     ,

      /*ID fields:*/
      [a].[ActivityID]
     ,[a].[ActivityReasonID]
     ,[a].[AttrTypeId_289]
     ,[a].[AttrTypeId_48]
     ,[a].[BogFromId]
     ,[a].[BogToId]
     ,[a].[BudgetCodeID]
     ,[a].[ConsumableID]
     ,[a].[ConsumableProjID]
     ,[a].[CrewID]
     ,[a].[DataStoreID]
     ,[a].[DestinationID]
     ,[a].DestMasterID
     ,[a].[DetailID]
     ,[a].[EquipmentID]
     ,[a].EquipTypeId
     ,[a].[LoadedAtId]
     ,[a].[LocationID]
     ,[a].[MaterialID]
     ,[a].[MaterialSysId]
     ,[a].[Metric_SubtotalId]
     ,
      --[a].[MetricId],
      [a].[MonthTargetID]
     ,[a].[OperationID]
     ,[a].[OperatorID]
     ,[a].[PlodDataId]
     ,[a].[ProcessID]
     ,[a].[PvtJn_InputGroupId]
     ,[a].[PvtJn_TaskId]
     ,[a].[ReasonID]
     ,[a].RelatedEquipID
     ,[a].[RelatedEquipmentID]
     ,[a].RelatedEquipTypeId
     ,[a].[Sequence]
     ,[a].SourceMasterID
     ,[a].[StatisticID]
     ,[a].[StatisticTypeID]
     ,
      --[a].[SubtotalId],
      [a].[UniqueTaskId]
     ,[a].[WorkType]
     ,MetricCode = kpi.[KPICode]
     ,MetricDesc = [kpi].[KPIDescription]
     ,MetricId = [kpi].[KPIId]
     ,kpi.SubtotalId
     ,MetricSubtotalCode = kpi.[SubtotalDesc] 
      ,a.CutNumberId
      ,a.CutNumberLabel
      ,a.PitId
     INTO #ForInsert
    FROM [#Combined] AS a
    LEFT JOIN [dbo].[tbl_SYS_KPI_Definitions] AS kpi WITH (NOLOCK)
      ON a.Metric_SubtotalId = kpi.Metric_SubtotalId  --inner join. we have an Active>0 below anyway!
        AND kpi.Active > 0



  END
  /**********************************
  Do some final massaging of data:
  **********************************/
IF @DebugMode = 1 BEGIN

SELECT '[#ForInsert]B4FinalMassage',
ProjectID_ForId=CAST(a.ProjectID AS NVARCHAR(25)) + '_' 
,PLODDataId_ForId =CAST(a.PLODDataId AS NVARCHAR(25)) + '_' 
,Metric_SubtotalId_ForId= ISNULL(a.Metric_SubtotalId, 'xx_xxx') + '_' 
,MetricId_ForId= ISNULL(CAST(a.MetricId AS NVARCHAR(25)), 'xx_xxx') + '_' 
, SubtotalId_ForId = ISNULL(CAST(a.SubtotalId AS NVARCHAR(25)), 'xx_xxx')
,* FROM [#ForInsert] AS a

SELECT '#attr B4FinalMassage',* FROM #attr AS a

end

if @RunToThisStep >=6
begin
  UPDATE a
  SET LocationCode =
      CASE
        WHEN [MetricId] IN (18, 19, 29) THEN DestinationCode
        ELSE LocationCode
      END  --if backfilling, then populate locaiton with destination
     ,LocationId =
      CASE
        WHEN [MetricId] IN (18, 19, 29) THEN a.destinationId
        ELSE a.LocationId
      END --if backfilling, then populate locaiton with destination

     ,MetricValue = [Value]
     ,ActualValue =
      CASE
        WHEN a.BudgetCodeID = 1 THEN [Value]
        ELSE 0
      END
     ,TargetValue =
      CASE
        WHEN a.budgetCodeId <> 1 THEN [Value]
        ELSE 0
      END
     ,UniqueDataSetId = CAST(a.ProjectID AS NVARCHAR(25)) + '_' + CAST(a.PLODDataId AS NVARCHAR(25)) + '_' + ISNULL(a.Metric_SubtotalId, 'xx_xxx')
      + '_' + ISNULL(CAST(a.MetricId AS NVARCHAR(25)), 'xx_xxx') + '_' + ISNULL(CAST(a.SubtotalId AS NVARCHAR(25)), 'xx_xxx')  --add MetricId, becuase might map same Metric_SubtotalId twice
  FROM [#ForInsert] AS a
  WHERE 1 = 1
end

  IF @DebugMode = 1
  BEGIN
    SELECT
      '[#ForInsert]'
     ,*
    FROM [#ForInsert]
  END

  --now return the datasets:
  /***************
  if changing the column set here, need to modify the destination table (and funcitons) too.
  some functions call this proc to get live data.
  *****************/
  IF @GetLiveDataOnly = 1 and @RunToThisStep > = 7
  BEGIN
    --todo: cleanup this, from the top though!
    SELECT
      *
    FROM [#ForInsert]

  END

IF @DebugMode = 1 BEGIN

SELECT '[#ForInsert]_B4FinalSelects',* FROM [#ForInsert] AS a
SELECT '#attr_B4FinalSelects',* FROM #attr AS a

end


  IF @GetLiveDataOnly = 0
    AND @SelectIntoLocalTable = 0 and @RunToThisStep>=8
  BEGIN
    SELECT
      'EtlDetails'
    SELECT
      SourceTableName = 'KpiSnapshot'  --refers to the table datset delievered below
     ,'DestinationTableName' = 'tbl_STO_ReportingSnapshot_KpiStats_All'
     ,ModeForInsert = 'DeleteAndInsert'  --or 'UpdateOrInsert'
     ,FilterForDelete = 'WHERE ProjectID = ' + CAST(IIF(@ShiftToProject3 = 1, 3, @ProjectId) AS VARCHAR(25))
      + '  AND Date BETWEEN  ' + CHAR(39) + FORMAT(@StartDate, 'yyyy-MM-dd') + CHAR(39) + ' AND ' + CHAR(39) + FORMAT(@EndDAte, 'yyyy-MM-dd') + CHAR(39)
     ,IdentityFieldName = NULL --only used for  'UpdateOrInsert'
    UNION ALL --allows for pulling bulk tables out, eg all DBT tables
    SELECT
      SourceTableName = 'AttrSnapshot'
     ,'DestinationTableName' = 'tbl_STO_ReportingSnapshot_AttributesTable_All'
     ,ModeForInsert = 'DeleteAndInsert'  --or 'UpdateOrInsert'
     ,FilterForDelete = 'WHERE ProjectID = ' + CAST(IIF(@ShiftToProject3 = 1, 3, @ProjectId) AS VARCHAR(25))
      + '  AND InputDate BETWEEN  ' + CHAR(39) + FORMAT(@StartDate, 'yyyy-MM-dd') + CHAR(39) + ' AND ' + CHAR(39) + FORMAT(@EndDAte, 'yyyy-MM-dd') + CHAR(39)
     ,IdentityFieldName = NULL --only used for  'UpdateOrInsert'



    SELECT
      'TableDataSets'

    SELECT
      SourceTableName = 'KpiSnapshot'
    SELECT
      [a].[UniqueDataSetId]
     ,[a].[Date]
     ,[a].[Shift]
     ,[a].[ProjectID]
     ,[a].Site
     ,[a].[ActivityDesc]
     ,[a].[ActualValue]
     ,[a].BogFrom
     ,[a].BogTo
     ,[a].BudgetCode
     ,[a].ConsumableDesc
     ,[a].[ConsumableDescShort]
     ,[a].CrewCode
     ,[a].DestDestCode
     ,[a].DestinationCode
     ,[a].[DumpedTimeStamp]
     ,[a].[DumpedTruckCount]
     ,[a].EmployeeName
     ,[a].[EndTime]
     ,[a].EquipmentCode
     ,[a].EquipTypeCode
     ,[a].[InputComment]
     ,[a].[InputPhoto]
     ,[a].[InputTimeStamp]
     ,[a].Level
     ,[a].LoadedAtCode
     ,[a].[LoadedTimestamp]
     ,[a].[LoadedTruckCount]
     ,[a].LocationCode
     ,[a].LocnMasterSourceCode
     ,[a].LocnSourceCode
     ,[a].Material
     ,[a].MaterialDescOp
     ,[a].[MetricCode]
     ,[a].[MetricDesc]
     ,[a].[MetricValue]
     ,[a].[OriginalValue]
     ,[a].ProcessDesc
     ,[a].ProjectMask
     ,[a].[ReasonDescription]
     ,[a].[RevisedValue]
     ,[a].[StartTime]
     ,[a].[StatisticCode]
     ,[a].[MetricSubtotalCode]
     ,[a].[SupervisorComments]
     ,[a].[TargetValue]
     ,[a].[TaskComments]
     ,[a].Units
     ,[a].[Value]
     ,[a].WorkArea
     ,

      /*ID fields:*/
      [a].[ActivityID]
     ,[a].[ActivityReasonID]
     ,[a].[AttrTypeId_289]
     ,[a].[AttrTypeId_48]
     ,[a].[BogFromId]
     ,[a].[BogToId]
     ,[a].[BudgetCodeID]
     ,[a].[ConsumableID]
     ,[a].[ConsumableProjID]
     ,[a].[CrewID]
     ,[a].[DataStoreID]
     ,[a].[DestinationID]
     ,[a].DestMasterID
     ,[a].[DetailID]
     ,[a].[EquipmentID]
     ,[a].EquipTypeId
     ,[a].[LoadedAtId]
     ,[a].[LocationID]
     ,[a].[MaterialID]
     ,[a].[MaterialSysId]
     ,[a].[Metric_SubtotalId]
     ,[a].[MetricId]
     ,[a].[MonthTargetID]
     ,[a].[OperationID]
     ,[a].[OperatorID]
     ,[a].[PlodDataId]
     ,[a].[ProcessID]
     ,[a].[PvtJn_InputGroupId]
     ,[a].[PvtJn_TaskId]
     ,[a].[ReasonID]
     ,[a].RelatedEquipID
     ,[a].[RelatedEquipmentID]
     ,[a].RelatedEquipTypeId
     ,[a].[Sequence]
     ,[a].SourceMasterID
     ,[a].[StatisticID]
     ,[a].[StatisticTypeID]
     ,[a].[SubtotalId]
     ,[a].[UniqueTaskId]
     ,[a].[WorkType]
     ,EtlDateTime = GETDATE()
        ,a.CutNumberId
        ,CutNumberLabel
        ,CalStartTime = st.VAlue
        ,CalEndTime = en.Value
        ,a.PitId
    --into #createtableFromThis
    FROM [#ForInsert] AS a
    outer APPLY dbo.tvf_ConvertToCalDateTime(a.date,a.starttime,a.shift) AS st  --presumably no overhead in doing it here? migth be slower if the #toinsert is a big beast?
       outer APPLY dbo.tvf_ConvertToCalDateTime(a.date,a.endtime,a.shift) AS en

    SELECT
      SourceTableName = 'AttrSnapshot'

    SELECT
      UniqueAttrId = CAST(a.ProjectID AS NVARCHAR(25)) + '_' + CAST(a.[PvtJn_TaskId] AS NVARCHAR(25)) + '_' + ISNULL(CAST(a.[PvtJn_InputGroupId] AS NVARCHAR(25)), 'XX')
     ,[ProjectId]
     ,PvtJn_TaskId
     ,PvtJn_InputGroupId
     ,[Pvt_FieldNames]
     ,[AttributeValue]
     ,[AttributeID]
     ,[AttributeTypeID]
     ,[InputDate]
     ,EtlDateTime = GETDATE()
    -- into #createAttrTableFromThis
    FROM [#attr] AS a

  END

  --now cleanup temporary datasets:





  -- other notes:
  /*
  call the job "PushDataJobs"
  it will throw new line into rabbit queue table for each table.
  could use php to pick up the job, restful API to receive the data and queu. then rabbit could kick the php on the otherside.
  should sniff the dest table fields and insert with the ones comign (unless they don't match, then fail the job)
  
  don't do the last 24 being live thing. just keep it a bit simpler and pull everything through the view and snapshot
  
  make simpler version of the current MCR reporting combined view, select fields out of below new view WHERE Projectid = 399
  
  need these:
  CREATE SYNONYM [dbo].[syn_STO_ReportingSnapshot_KpiStats_All] FOR manage_reporting.dbo.[tbl_STO_ReportingSnapshot_KpiStats_All]
  CREATE SYNONYM [dbo].[syn_STO_ReportingSnapshot_AttributesTable_All] FOR  manage_reporting.dbo.[tbl_STO_ReportingSnapshot_AttributesTable_All]
  
  
  */
  IF @SelectIntoLocalTable = 1
  BEGIN
    SELECT
      ID = IDENTITY(INT, 1, 1)
     ,t.* INTO dbo.tbl_STO_ReportingSnapshot_AttributesTable_All
    FROM [#attr] t

    SELECT
      ID = IDENTITY(INT, 1, 1)
     ,t.* INTO dbo.tbl_STO_ReportingSnapshot_KpiStats_All
    FROM [#ForInsert] t


  --end
  END

  --cleanup:
  
  IF OBJECT_ID('tempdb..#Stats') IS NOT NULL   drop TABLE #Stats;
  
  IF OBJECT_ID('tempdb..#attr') IS NOT NULL   drop TABLE #attr;
  
  IF OBJECT_ID('tempdb..#combined') IS NOT NULL   drop TABLE #combined;
  
  IF OBJECT_ID('tempdb..#combined2') IS NOT NULL   drop TABLE #combined2;
  
  IF OBJECT_ID('tempdb..#attrPivoted') IS NOT NULL   drop TABLE #attrPivoted;
  
  IF OBJECT_ID('tempdb..#ForInsert') IS NOT NULL   drop TABLE #ForInsert;

 /* DROP TABLE #Stats
  DROP TABLE #attr
  DROP TABLE #combined
  DROP TABLE #attrPivoted
  DROP TABLE #ForInsert
*/

END








GO
PRINT N'Altering [dbo].[SP_ShiftSummary_DataExport_v4]'
GO
ALTER PROCEDURE [dbo].[SP_ShiftSummary_DataExport_v4] @Date DATE,
@Date2 DATE,
@ProjectID INT = 0,
@Type VARCHAR(25),
@DebugMode INT = 0
, @UserID INT = NULL

AS
BEGIN
  SET NOCOUNT ON;

  /*
  exec  [dbo].[SP_ShiftSummary_DataExport_v3] @Date ='2021-01-30' , @DATE2 = '2021-03-31', @ProjectID =259, @Type = 'PhysicalsPivot' 



  exec [dbo].[SP_ShiftSummary_DataExport_v3]
    @Date ='2020-06-16',
    @Date2 ='2020-06-16',
    @ProjectID =194,
    @Type ='ShiftTimeline',
	@DebugMode  =0
	,@UserID  = 137

  exec [dbo].[SP_ShiftSummary_DataExport_v3]
    @Date ='2020-08-01',
    @Date2 ='2020-08-06',
    @ProjectID =194,
    @Type ='Shiftboss_01',
	@DebugMode  =0
	,@UserID  = 137


  */
  -- SET ANSI_WARNINGS OFF;  --installed because we think this: Warning: Null value is eliminated by an aggregate or other SET operation. was affecting the export
  /*

TAB NAMES ONLY ALLOWED TO BE 30 CHAR long!!!!!


exec  [dbo].[SP_ShiftSummary_DataExport_v3] @Date ='2021-06-05' , @DATE2 = '2021-06-06', @ProjectID =399, @Type = 'Consusage'  --'Fitters'

exec  [dbo].[SP_ShiftSummary_DataExport_v3] @Date ='2020-12-05' , @DATE2 = '2020-12-05', @ProjectID =387, @Type = 'PLODUploads'  --'Fitters'



*/
  /* change log
		
			CA 2022-01-06 ... Add Sign Register Export
      ts 2022-05-25 ..
      ts 2022-07-13 ... add temperatures
      2022-08-03 CA ... Added SignRegister locns stuff
      2022-10-23 ts ... add teh snapshot physicals

  
V4 DataExport. Mainly to get around the hold up on v3 for pybar

TO DO:


*/

  IF @ProjectID = 0
  BEGIN
    SET @ProjectID = (SELECT TOP 1
        ProjectId = PrimaryProjectId
      FROM [dbo].[tvf_ServerDetails](0))
  END

  SET ARITHABORT ON;
  DECLARE @Columns AS VARCHAR(MAX)

  DECLARE @IsLocal INT
  SET @IsLocal = dbo.FN_IsLocal(@ProjectID);

  DECLARE @OpCode VARCHAR(4)
  SET @OpCode = (SELECT
      OperationCode
    FROM dbo.tbl_DBT_Project AS p
    INNER JOIN dbo.tbl_DBT_Operation AS o
      ON p.operationID = o.OperationID
      AND p.ProjectID = @ProjectID)
  DECLARE @DATAAREAID NVARCHAR(4) = 'pms'

  DECLARE @Columns2 AS VARCHAR(MAX)

  DECLARE @AX_PROJID NVARCHAR(20)
  SELECT
    @AX_PROJID = ProjectMask
  FROM tbl_DBT_Project
  WHERE ProjectID = @projectID

  IF @Date2 IS NULL
    OR @Date2 = ''
    SET @Date2 = @Date;

  DECLARE @OpID AS INT;
  SET @OpID = (SELECT
      OperationID
    FROM tbl_DBT_Project
    WHERE ProjectID = @ProjectID);

  DECLARE @TWIALIAS AS VARCHAR(15);
  SET @TWIALIAS = (SELECT
      [dbo].[FN_TWIAlias](@ProjectID));

  DECLARE @PrestartARIDs AS VARCHAR(100);
  SET @PrestartARIDs = (SELECT
      ConfigValue
    FROM tbl_SYS_webbarConfigs
    WHERE ConfigName = 'AR_Prestarts'
    AND Active = 1); --  need to add grader to this when I make the reason?


  DECLARE @MajorEquipTypeIdsCsv NVARCHAR(500) = ',57,77,91,95,96,107,113,114,118,126,127,130,131,132,133,';  --shift to config, call it in here too: [FN_KpiComplex_1100_Equip_WeeklySrvIntolerance]

   DECLARE @SignRegisterSrc varchar(50) = CAST(ISNULL(dbo.FN_GetConfigValue(@ProjectID, 'ViewSrc'), 'UniqueSigns' ) AS varchar(50) )



  IF @Type = 'SignRegister'
  BEGIN
    SELECT
      'Current Sign Status' AS 'TabTitle';
    SELECT
      Location = L.LocationCode
     ,Date = a.date
     ,Shift = a.shift
     ,
      -- projectid,

      Task = reas.ReasonDescription
     ,[Sign Number] = signnum.AttributeDescription
     ,
      --  [Type of Sign],
      Reason
     ,[Authorised by]
     ,[Installed by] = e.EmployeeName
     ,[Task Start Time] = CalStartTime
     ,[Task End Time] = CalEndTime
    --  DataStoreID,
    -- DetailID
    --  SignChangeIncrement
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

    WHERE SignChangeIncrement = 1 -- 1 is the most recent change
    AND a.projectid = @ProjectID
      AND ViewSrc = @SignRegisterSrc
    ORDER BY [Sign Number] ASC

    SELECT
      'Sign History' AS 'TabTitle';
    SELECT
      Location = L.LocationCode
     ,Date = a.date
     ,Shift = a.shift
     ,
      -- projectid,

      Task = reas.ReasonDescription
     ,[Sign Number] = signnum.AttributeDescription
     ,
      --   [Type of Sign],
      Reason
     ,[Authorised by]
     ,[Installed by] = e.EmployeeName
     ,[Task Start Time] = CalStartTime
     ,[Task End Time] = CalEndTime
     ,
      --  DataStoreID,
      -- DetailID
      [ChangeNumber] = SignChangeIncrement
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
    WHERE SignChangeIncrement <> 1 -- 1 is the most recent change
    AND a.projectid = @ProjectID
    ORDER BY [Sign Number] ASC, SignChangeIncrement ASC

  END




  IF @Type in ( 'AllPhysicals_v4','EtlKpiSnapshot') --looks like I already had this wired up?! got another one now.
  BEGIN
    SELECT
      'All Physicals' AS 'TabTitle';

SELECT *--date,shift,a.ActualValue 
FROM syn_STO_ReportingSnapshot_Combined_All as a
    WHERE a.ProjectID = @ProjectID 
      AND a.Date BETWEEN @Date AND @Date2 
/*
SELECT *--date,shift,a.ActualValue 
FROM syn_STO_ReportingSnapshot_Combined_All as a
    WHERE a.ProjectID = 439 
      AND a.Date BETWEEN '2022-10-01' AND '2022-10-23' 

*/

  END 

  IF @Type = 'HoleTemperatures_MCO'
  BEGIN
    SELECT
      'Hole Temps' AS 'TabTitle';

SELECT *--date,shift,a.ActualValue 
FROM dbo.View_ShiftSummary_HoleTemperatureReadings AS a
    WHERE a.ProjectID = @ProjectID AND a.Date BETWEEN @Date AND @Date2 


  END 


/*
    ELSE 
        SELECT 'Type does not exist' AS 'name';






  exec [dbo].[SP_ShiftSummary_DataExport_v3]
    @Date ='2020-01-01',
    @Date2 ='2020-07-31',
    @ProjectID =259,
    @Type ='PivotPrototype',
	@DebugMode  =0
	,@UserID  = 137





*/

END;




GO
PRINT N'Creating [dbo].[SP_Utility_ResetDrift]'
GO
CREATE   procedure [dbo].[SP_Utility_ResetDrift]
    -- Add the parameters for the stored procedure here
@ObjectName varchar(max) = null
, @DbVersion varchar(max) = null
, @ProjectID int = 0
, @UserID int = 0
, @DebugMode int = 0
, @ConflictComments varchar(max) = null
as
begin
    /*
        exec [dbo].[SP_Utility_ResetDrift] @ObjectName = 'SP_ProjSetup_BuildDynamicView_ReportingAttributes' @DbVersion = '1.0'

        2022-10-24 ian ... initial work
        2022-10-24 ts ... db version should be known, not passed in.
    */

    set nocount on;

    declare @CurrentSchema nvarchar(max);
    select @CurrentSchema = m.definition
    from sys.objects o
             join sys.sql_modules m
                  on m.object_id = o.object_id
    where o.object_id = object_id(@ObjectName)


--get from tvfserverdetails function for now, swap to flyway with go live with that
set @DbVersion = isnull((select top 1 ManageVersion from   dbo.tvf_ServerDetails (@ProjectId )),'missing')

    


    if @Debugmode = 1
        begin
            print 'currentSchema len:' + cast(len(@CurrentSchema) as varchar(25))
        end

    if (@CurrentSchema <> '')
        begin
            begin try
                insert into tbl_STO_DriftSchema_Records (
                    ProjectID, ObjectName, CurrentSchema, DbVersion, StashDateTime, UserID,Comments
                )
                values (
                           @ProjectID, @ObjectName, @CurrentSchema, @DbVersion, getdate(), @UserID,@ConflictComments
                       )
            end try
            begin catch
                print error_message();
            end catch
        end
    else
        begin
            print 'no schema found'
        end
end
GO
PRINT N'Refreshing [dbo].[View_ShiftSummary_HoleTemperatureReadings_OptimiseTS]'
GO
EXEC sp_refreshview N'[dbo].[View_ShiftSummary_HoleTemperatureReadings_OptimiseTS]'
GO
PRINT N'Refreshing [dbo].[vw_Integration_Employees_Basic]'
GO
EXEC sp_refreshview N'[dbo].[vw_Integration_Employees_Basic]'
GO
PRINT N'Refreshing [dbo].[vw_Integration_Employees]'
GO
EXEC sp_refreshview N'[dbo].[vw_Integration_Employees]'
GO
PRINT N'Refreshing [dbo].[vw_Integration_EquipmentDetails]'
GO
EXEC sp_refreshview N'[dbo].[vw_Integration_EquipmentDetails]'
GO
PRINT N'Refreshing [dbo].[vw_Integration_LocationDetails]'
GO
EXEC sp_refreshview N'[dbo].[vw_Integration_LocationDetails]'
GO
PRINT N'Refreshing [dbo].[vw_Integration_Materials]'
GO
EXEC sp_refreshview N'[dbo].[vw_Integration_Materials]'
GO
PRINT N'Refreshing [dbo].[vw_Integration_TaskList]'
GO
EXEC sp_refreshview N'[dbo].[vw_Integration_TaskList]'
GO
PRINT N'Refreshing [dbo].[vw_Integration_TruckingDetailsCentric_Bstream]'
GO
EXEC sp_refreshview N'[dbo].[vw_Integration_TruckingDetailsCentric_Bstream]'
GO
PRINT N'Refreshing [dbo].[vw_Integration_TruckingDetailsCentric]'
GO
EXEC sp_refreshview N'[dbo].[vw_Integration_TruckingDetailsCentric]'
GO
PRINT N'Refreshing [dbo].[vw_Reporting_KPINew_AllMappedPrimaryKpis_Combined_MCR_etlVersion]'
GO
EXEC sp_refreshview N'[dbo].[vw_Reporting_KPINew_AllMappedPrimaryKpis_Combined_MCR_etlVersion]'
GO
PRINT N'Refreshing [dbo].[vw_Reporting_ReportComments]'
GO
EXEC sp_refreshview N'[dbo].[vw_Reporting_ReportComments]'
GO
PRINT N'Creating index [UK_tbl_DBT_QueryLogsTesting_RowID] on [dbo].[tbl_DBT_QueryLogsTesting]'
GO
CREATE UNIQUE CLUSTERED INDEX [UK_tbl_DBT_QueryLogsTesting_RowID] ON [dbo].[tbl_DBT_QueryLogsTesting] ([RowID])
GO
