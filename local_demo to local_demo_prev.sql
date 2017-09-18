SELECT 
	*
FROM information_schema.`TABLES`
WHERE
    (
        (table_schema='local_demo') OR
        (table_schema='local_demo_prev')
    )
GROUP BY
	TABLE_NAME
HAVING COUNT(1)=1;

SELECT 
	TABLE_NAME,
  IS_NULLABLE,
  column_name,
	ordinal_position,
  data_type,
	column_type,
	COUNT(1) rowcount
FROM information_schema.`COLUMNS`
WHERE
    (
        (table_schema='local_demo') OR
        (table_schema='local_demo_prev')
    )
GROUP BY
	TABLE_NAME, 
	IS_NULLABLE, 
	column_name,
	ordinal_position,
  data_type,
  column_type
HAVING COUNT(1)=1
ORDER BY 
	TABLE_NAME,
	COLUMN_NAME;

SELECT 
	TABLE_NAME,
  COLUMN_NAME,
  CONSTRAINT_NAME, 
  REFERENCED_TABLE_NAME,
  REFERENCED_COLUMN_NAME,
	COUNT(1) rowcount
FROM information_schema.KEY_COLUMN_USAGE
WHERE
    (
        (table_schema='local_demo') OR
        (table_schema='local_demo_prev')
    )
GROUP BY
	TABLE_NAME,
  COLUMN_NAME,
  CONSTRAINT_NAME, 
  REFERENCED_TABLE_NAME,
  REFERENCED_COLUMN_NAME
HAVING COUNT(1)=1
ORDER BY 
	TABLE_NAME,
	COLUMN_NAME;

SELECT 
	TABLE_NAME,
  INDEX_NAME,
	COUNT(1) rowcount
FROM information_schema.STATISTICS
WHERE
    (
        (table_schema='local_demo') OR
        (table_schema='local_demo_prev')
    )
GROUP BY
	TABLE_NAME,
  INDEX_NAME
HAVING COUNT(1)=1
ORDER BY 
	TABLE_NAME,
	INDEX_NAME;

SELECT
	trigger_schema, 
	EVENT_OBJECT_TABLE,
	ACTION_STATEMENT,
	COUNT(1) rowcount
FROM information_schema.`TRIGGERS`
WHERE
    (
        (trigger_schema='local_demo') OR
        (trigger_schema='local_demo_prev')
    )
GROUP BY
	EVENT_OBJECT_TABLE,
	ACTION_STATEMENT
HAVING COUNT(1)=1
ORDER BY 
	EVENT_OBJECT_TABLE,
	ACTION_STATEMENT;


SELECT * from local_demo.setting
LEFT JOIN local_demo_prev.setting ON local_demo.setting.SettingId = local_demo_prev.setting.SettingId
WHERE 
local_demo.setting.DefaultValue != local_demo_prev.setting.DefaultValue
OR
local_demo.setting.Description != local_demo_prev.setting.Description
OR
local_demo.setting.ElementType != local_demo_prev.setting.ElementType
OR
local_demo.setting.FoundationEditable != local_demo_prev.setting.FoundationEditable
OR
local_demo.setting.Label != local_demo_prev.setting.Label
OR
local_demo.setting.PossibleValues != local_demo_prev.setting.PossibleValues
OR
local_demo.setting.ProductCategory != local_demo_prev.setting.ProductCategory
OR
local_demo.setting.Sequence != local_demo_prev.setting.Sequence
OR
local_demo_prev.setting.SettingId IS NULL;

SELECT * from local_demo.guidestarapi
LEFT JOIN local_demo_prev.guidestarapi ON local_demo.guidestarapi.Id = local_demo_prev.guidestarapi.Id
WHERE 
local_demo_prev.guidestarapi.ElementType != local_demo.guidestarapi.ElementType
OR
local_demo_prev.guidestarapi.JsonPath != local_demo.guidestarapi.JsonPath
OR
local_demo_prev.guidestarapi.Label != local_demo.guidestarapi.Label
OR
local_demo_prev.guidestarapi.Sequence != local_demo.guidestarapi.Sequence
OR
local_demo_prev.guidestarapi.Id IS NULL;

SELECT * from local_demo.role
LEFT JOIN glm_mig.role ON local_demo.role.RoleId = local_demo_prev.role.RoleId
WHERE 
local_demo.role.`Name` != local_demo_prev.role.`Name`
OR
local_demo.role.FoundationId != local_demo_prev.role.FoundationId
OR
local_demo.role.Sequence != local_demo_prev.role.Sequence
OR
local_demo_prev.role.RoleId IS NULL;

SELECT * from local_demo.emaildomain
LEFT JOIN local_demo_prev.emaildomain ON local_demo.emaildomain.EmailDomainId = local_demo_prev.emaildomain.EmailDomainId
WHERE 
local_demo_prev.emaildomain.EmailDomainId is NULL;