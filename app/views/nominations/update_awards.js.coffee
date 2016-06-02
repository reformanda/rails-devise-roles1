$("select#nomination_award_option_id").empty().append("<%= escape_javascript(render(:partial => 'awards')) %>")
