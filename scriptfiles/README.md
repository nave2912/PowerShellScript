You cannot run this script on the
current system. For more information about running scripts and setting execution policy, see about_Execution_Policies at https:/go.microsoft.com/fwlink/?LinkID=135170.
At line:1 char:1
+ ~~~~~~~~~~~~~~~
    + CategoryInfo          : SecurityError: (:) [], PSSecurityException
    + FullyQualifiedErrorId : UnauthorizedAccess
	
	
	Run Below command to solve unauthorized access:
	
	Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass