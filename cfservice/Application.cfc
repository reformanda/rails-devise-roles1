<cfcomponent>
	<cfset this.name="restappcfc2">
    <cfset this.restsettings.cfclocation = "./">
    <cfset this.restsettings.skipcfcwitherror = true>
    
    <cffunction name="onApplicationStart" returnType="boolean" output="false">
    	<cfset application.restsettings.cfclocation = "./">
    	<cfreturn true>
    </cffunction>
    
	<cffunction name="onRequestStart" returnType="boolean" output="false">
		<cfargument name="thePage" type="string" required="true">

		<!--- For Internationalization Encoding --->
		<cfcontent type="text/html; charset=utf-8">
		<cfset setEncoding("form","utf-8")>
		<cfset setEncoding("url","utf-8")>
		
		<cfif IsDefined("url.refresh")>
			<cfset temp = this.onApplicationStart()>
		</cfif>
        
        <cfreturn true>
    </cffunction>        
</cfcomponent>