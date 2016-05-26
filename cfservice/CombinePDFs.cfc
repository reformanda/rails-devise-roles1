<cfcomponent rest="true" restpath="/combinePDF"> 
     
    <!--- combines sumission document and endorsement letter into a single pdf ---> 
    <!--- returns Base64 encoded string --->
    <cffunction name="processDocument" access="remote" returntype="any" httpmethod="POST" > 
        <cfargument name="endorsement" type="String" required="yes" restArgSource="Form" /> 	
        <cfargument name="submission" type="String" required="yes" restArgSource="Form" />

       		<cftry>

            <cfset local.endorsement = GetTempFile(GetTempDirectory(), "endorsement")>
            <cfset local.endorsement_pdf = local.endorsement & ".pdf">
            <cfset local.submission = GetTempFile(GetTempDirectory(), "submission")>
            <cfset local.submission_pdf = local.submission & ".pdf">
            <cfset local.combined = GetTempFile(GetTempDirectory(), "combined")>
            <cfset local.combined_pdf = local.combined & ".pdf">
        
        	<cffile action="write" file="#local.endorsement_pdf#" output="#ToBinary(endorsement)#">
            
            <cffile action="write" file="#local.submission_pdf#" output="#ToBinary(submission)#">
            
            <cfpdf 
                action="merge"
                source="#local.endorsement_pdf#,#local.submission_pdf#"
                destination="#local.combined_pdf#" 
                overwrite="yes">

            <cffile action="readbinary"
               file="#local.combined_pdf#"
               variable = "binpdf">
               
			<!--- clean up temp files --->
            <cffile action="delete"
            file="#local.combined_pdf#">
            
            <cffile action="delete"
            file="#local.endorsement#">
            
            <cffile action="delete"
            file="#local.endorsement_pdf#">
            
            <cffile action="delete"
            file="#local.submission#">
            
            <cffile action="delete"
            file="#local.submission_pdf#">
              
            <cfreturn "#BinaryEncode(binpdf,'Base64')#">
            <cfcatch>

           		<cfreturn "#cfcatch.message#">
              	
            </cfcatch>
        	</cftry>
           
    </cffunction>
     
 
    
       
</cfcomponent>