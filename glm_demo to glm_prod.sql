SELECT 
	*
FROM information_schema.`TABLES`
WHERE
    (
        (table_schema='glm_demo') OR
        (table_schema='glm_prod')
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
        (table_schema='glm_prod')
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
        (table_schema='glm_prod')
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
        (table_schema='glm_prod')
    )
GROUP BY
	TABLE_NAME,
  INDEX_NAME
HAVING COUNT(1)=1
ORDER BY 
	TABLE_NAME,
	INDEX_NAME;


SELECT * from glm_demo.setting
LEFT JOIN glm_prod.setting ON glm_demo.setting.SettingId = glm_prod.setting.SettingId
WHERE 
glm_demo.setting.DefaultValue != glm_prod.setting.DefaultValue
OR
glm_demo.setting.Description != glm_prod.setting.Description
OR
glm_demo.setting.ElementType != glm_prod.setting.ElementType
OR
glm_demo.setting.FoundationEditable != glm_prod.setting.FoundationEditable
OR
glm_demo.setting.Label != glm_prod.setting.Label
OR
glm_demo.setting.PossibleValues != glm_prod.setting.PossibleValues
OR
glm_demo.setting.ProductCategory != glm_prod.setting.ProductCategory
OR
glm_demo.setting.Sequence != glm_prod.setting.Sequence
OR
glm_prod.setting.SettingId IS NULL;

SELECT * from glm_demo.guidestarapi
LEFT JOIN glm_prod.guidestarapi ON glm_demo.guidestarapi.Id = glm_prod.guidestarapi.Id
WHERE 
glm_prod.guidestarapi.ElementType != glm_demo.guidestarapi.ElementType
OR
glm_prod.guidestarapi.JsonPath != glm_demo.guidestarapi.JsonPath
OR
glm_prod.guidestarapi.Label != glm_demo.guidestarapi.Label
OR
glm_prod.guidestarapi.Sequence != glm_demo.guidestarapi.Sequence
OR
glm_prod.guidestarapi.Id IS NULL;

SELECT * from glm_demo.role
LEFT JOIN glm_prod.role ON glm_demo.role.RoleId = glm_prod.role.RoleId
WHERE 
glm_demo.role.`Name` != glm_prod.role.`Name`
OR
glm_demo.role.FoundationId != glm_prod.role.FoundationId
OR
glm_demo.role.Sequence != glm_prod.role.Sequence
OR
glm_prod.role.RoleId IS NULL;

SELECT * from glm_demo.emaildomain
LEFT JOIN glm_prod.emaildomain ON glm_demo.emaildomain.EmailDomainId = glm_prod.emaildomain.EmailDomainId
WHERE 
glm_prod.emaildomain.EmailDomainId is NULL;