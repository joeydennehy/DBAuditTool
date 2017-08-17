Before the demo release:
	1. Dump demo structure only into an sql file
	2. Dump demo structure and data for the following tables:
		setting
		guidestarapi
		role
		emaildomain
	3. Create a local connection (if you don't already have one)
	4. Create a local demo database (if you don't already have one). Call it "local_demo_prev"
	5. Execute the demo sql file you created in step 1 into the local_demo_prev database.
	6. Execute the demo sql files you created in step 2 into the local_demo_prev database.

After the demo release:
	1. Repeat all steps in the "Before the demo release" section except instead of calling the database "local_demo_prev" call it "local_demo"
	2. Run the "local_demo to local_demo_prev" sql file. This will give you any differences from the previous release that you can evaluate and determine if the queries need updating.

After the prod release:
	1. Run the "glm_demo to glm_mig" sql file and export any results that got returned.
	2. Run the "glm_demo to glm_prod" sql file and export any results that got returned. 