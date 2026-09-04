-- Fabric notebook source

-- METADATA ********************

-- META {
-- META   "kernel_info": {
-- META     "name": "synapse_pyspark"
-- META   },
-- META   "dependencies": {}
-- META }

-- CELL ********************

-- =====================================================================
-- Datastore Configuration: POD Environment
-- Environment: DEV
-- Generated: 2026-04-09
-- =====================================================================
-- Purpose:
--   Register all Fabric datastores (Lakehouses, Warehouses) for the PROD environment.
--   This replaces Variable Library entries for datastore details.
--
-- CI/CD Notes:
--   - Create separate notebooks for each environment (datastore_DEV, datastore_PROD, etc.)
--   - Each notebook contains environment-specific GUIDs
--   - Deploy the appropriate notebook as part of your ADO pipeline
--
-- To Add a New Datastore:
--   1. Create the Lakehouse/Warehouse in Fabric
--   2. Copy the artifact GUID and workspace GUID from Fabric
--   3. Add an INSERT statement below
--   4. Run this cell or deploy via CI/CD
-- =====================================================================


-- METADATA ********************

-- META {
-- META   "language": "sparksql",
-- META   "language_group": "synapse_pyspark"
-- META }

-- CELL ********************

-- =====================================================================
-- STEP 1: Clear existing datastore configuration (full refresh)
-- =====================================================================
TRUNCATE TABLE dbo.Datastore_Configuration;

-- =====================================================================
-- STEP 2: Insert DEV environment datastore configuration
-- =====================================================================


INSERT INTO [dbo].[Datastore_Configuration] 
    (Datastore_Name, Datastore_Type, Datastore_ID, Workspace_ID, Workspace_Name, Medallion_Layer, Endpoint, Connection_ID)
VALUES
-- Core Medallion Architecture Datastores
('LearningPlatforms_Bronze', 'Lakehouse', 'd420c65c-448b-44f5-9e44-d8088cd294af', '3adcd483-5053-4ed5-af6f-cbc4131e1e03', 'Ingest_Prod_LearningPlatforms', 'Bronze', NULL, NULL),
('metadata_lakehouse', 'Lakehouse', '4893d0db-df9e-414e-8a7e-11a43e07dc88', '3adcd483-5053-4ed5-af6f-cbc4131e1e03', 'Ingest_Prod_LearningPlatforms', NULL, NULL, NULL),
('metadata_warehouse', 'Warehouse', '2a8bb212-62c2-4bbb-a434-7c50473c5949', '3adcd483-5053-4ed5-af6f-cbc4131e1e03', 'Ingest_Prod_LearningPlatforms', 'Gold', 'gbf3pplisvlerpn7az2zo6h4xq-6h2ekd4orc2e3ejsiylzky7e4q.datawarehouse.fabric.microsoft.com', NULL),
('Blackboard - Prod', 'ExternalDatabase', 'N/A', '3adcd483-5053-4ed5-af6f-cbc4131e1e03', 'Ingest_Prod_LearningPlatforms', NULL, NULL, '41339987-9b8d-4d15-8ff0-adc8bbdbdd5f')



-- METADATA ********************

-- META {
-- META   "language": "sparksql",
-- META   "language_group": "synapse_pyspark"
-- META }
