namespace :score_types do
  desc 'Adds AAE score types'
  task add_aae_score_type: :environment do

ScoreType.create!([
description: "AAE Award",
instructions: 'The table provides a rating scale for Judges to assign impact scores for the criteria within each of the below four categories per individual or team nomination. Judges should use the full range of the rating scale and spread their scores to better discriminate between potential awardees. The entire scale (1-9) should always be considered. If a tie arises between nominations after all judges have submitted their scores, the system will alert the administrator, and a tie-breaking request will go back out to the judges.
  </div>
  <div style=" vertical-align:top; float:right; width:48%;">
  <img src="../../images/impact scoring chart.png">
  </div>
  <div style="clear:both">
    <br>

  </div>
       <table class="normal_table">

      <tbody><tr>
        <td><h2>Categories&nbsp;&nbsp;<span class="small" style="color:red">Click <a target="_blank" href="../awards/announcements/pmpdot05-instructions.pdf">here</a> to see/print the full evaluation criteria for this award.</span></h2>
          <table>

              <tbody><tr valign="top">
                <td><strong>Talent Management</strong><br>
                  Team''s effort to have people with right skills, in the right places, at the right times to support mission critical functions</td>
                <td><strong>Leadership</strong><br>
                  Team''s leadership and knowledge transfer efforts to build competencies of current and future leaders</td>
                <td><strong>Strategic Value</strong><br>
                  Value of the Team''s contributions in supporting ASA(ALT)''s
 priorities</td>
                <td><strong>Functional Area</strong><br>
                  Team''s performance relative to the specific functional area criteria.</td>
                  </tr>

          </tbody></table>
          <p></p></td>
</tr>

</tbody></table>',
])

end
end
