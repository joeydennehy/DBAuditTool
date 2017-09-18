SELECT 
	*
FROM information_schema.`TABLES`
WHERE
    (
        (table_schema='glm_demo') OR
        (table_schema='glm_mig')
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
        (table_schema='glm_demo') OR
        (table_schema='glm_mig')
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
        (table_schema='glm_demo') OR
        (table_schema='glm_mig')
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
        (table_schema='glm_demo') OR
        (table_schema='glm_mig')
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
        (trigger_schema='glm_demo') OR
        (trigger_schema='glm_mig')
    )
GROUP BY
	EVENT_OBJECT_TABLE,
	ACTION_STATEMENT
HAVING COUNT(1)=1
ORDER BY 
	EVENT_OBJECT_TABLE,
	ACTION_STATEMENT;


SELECT * from glm_demo.setting
LEFT JOIN glm_mig.setting ON glm_demo.setting.SettingId = glm_mig.setting.SettingId
WHERE 
glm_demo.setting.DefaultValue != glm_mig.setting.DefaultValue
OR
glm_demo.setting.Description != glm_mig.setting.Description
OR
glm_demo.setting.ElementType != glm_mig.setting.ElementType
OR
glm_demo.setting.FoundationEditable != glm_mig.setting.FoundationEditable
OR
glm_demo.setting.Label != glm_mig.setting.Label
OR
glm_demo.setting.PossibleValues != glm_mig.setting.PossibleValues
OR
glm_demo.setting.ProductCategory != glm_mig.setting.ProductCategory
OR
glm_demo.setting.Sequence != glm_mig.setting.Sequence
OR
glm_mig.setting.SettingId IS NULL;

SELECT * from glm_demo.guidestarapi
LEFT JOIN glm_mig.guidestarapi ON glm_demo.guidestarapi.Id = glm_mig.guidestarapi.Id
WHERE 
glm_mig.guidestarapi.ElementType != glm_demo.guidestarapi.ElementType
OR
glm_mig.guidestarapi.JsonPath != glm_demo.guidestarapi.JsonPath
OR
glm_mig.guidestarapi.Label != glm_demo.guidestarapi.Label
OR
glm_mig.guidestarapi.Sequence != glm_demo.guidestarapi.Sequence
OR
glm_mig.guidestarapi.Id IS NULL;

SELECT * from glm_demo.role
LEFT JOIN glm_mig.role ON glm_demo.role.RoleId = glm_mig.role.RoleId
WHERE 
glm_demo.role.`Name` != glm_mig.role.`Name`
OR
glm_demo.role.FoundationId != glm_mig.role.FoundationId
OR
glm_demo.role.Sequence != glm_mig.role.Sequence
OR
glm_mig.role.RoleId IS NULL;

SELECT * from glm_demo.emaildomain
LEFT JOIN glm_mig.emaildomain ON glm_demo.emaildomain.EmailDomainId = glm_mig.emaildomain.EmailDomainId
WHERE 
glm_mig.emaildomain.EmailDomainId is NULL;