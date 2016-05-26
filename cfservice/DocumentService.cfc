<cfcomponent rest="true" restpath="/convertDocxService"> 
     
    <!--- converts ms-docx (sent as Base64 encoded) to pdf (Base64 encoded) ---> 
    <cffunction name="processDocument" access="remote" returntype="any" httpmethod="POST" > 
        <cfargument name="submission" type="String" required="yes" restArgSource="Form" /> 	


       		<cftry>

            <cfset local.submission = GetTempFile(GetTempDirectory(), "submission")>
            <cfset local.submission_docx = local.submission & ".docx">
            <cfset local.submission_pdf = local.submission & ".pdf">
        
        	<cffile action="write" file="#local.submission_docx#" output="#ToBinary(submission)#">
               
            <cfdocument 
                format="pdf" 
                srcfile="#local.submission_docx#" 
                filename="#local.submission_pdf#"
                overwrite="yes"> 
            </cfdocument>

            <cffile action="readbinary"
               file="#local.submission_pdf#"
               variable = "binpdf">
               
            <cffile action="delete"
               file="#local.submission_pdf#">
                            
            <cffile action="delete"
               file="#local.submission_docx#">
               
            <cffile action="delete"
               file="#local.submission#">               
                                             
            
            <cfreturn "#BinaryEncode(binpdf,'Base64')#">
            <cfcatch>

           		<cfreturn "#cfcatch.message#">
              	
            </cfcatch>
        	</cftry>
           
    </cffunction>
     
 
    
       
</cfcomponent>