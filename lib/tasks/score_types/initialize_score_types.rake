namespace :score_types do
  desc 'Initializes score types'
  task initialize_score_types: :environment do

    ScoreType.destroy_all
    

 #<Board id: 1, description: "First Board", start_date: "2016-05-21 23:33:00", end_date: "2016-06-21 23:33:00", nomination_type_id: 1, created_at: "2016-05-21 23:33:25", updated_at: "2016-05-22 01:19:01", users_list: ["", "2"]>]>
    ScoreType.create!([
description: "Single Score Column (1-9)",
instructions: "
<p>Only one score per team nominee; no separate evaluation criteria</p>
<br/>
<table class='table table-striped table-bordered table-hover'>
<thead>
<tr>
<td>
  Impact
</td>
<td>
  Score
</td>
<td>
  Descriptor
</td>
</tr>
</thead>
<tbody>
<tr>
 <td rowspan=3>High</td>
 <td >9*</td>
 <td >Exceptional</td>
</tr>
<tr >
 <td >8</td>
 <td >Outstanding</td>

</tr>
<tr >
 <td >7</td>
 <td >Excellent</td>

</tr>
<tr >
 <td rowspan=3 >Medium</td>
 <td >6</td>
 <td >Very Good</td>

</tr>
<tr >
 <td >5</td>
 <td >Good</td>

</tr>
<tr >
 <td >4</td>
 <td >Satisfactory</td>

</tr>
<tr height=15>
 <td rowspan=3 >Low</td>
 <td >3</td>
 <td >Fair</td>

</tr>
<tr height=14>
 <td >2</td>
 <td >Marginal</td>

</tr>
<tr height=14>
 <td >1</td>
 <td >Poor</td>

</tr>
</table>
<br/>
<p>*A score of <strong>9</strong> may only be given once per judge per nominee</p>		"
      ])


  end
end
