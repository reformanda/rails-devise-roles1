TYPE=VIEW
query=select `a`.`board_id` AS `board_id`,`a`.`award_option_id` AS `award_option_id`,`a`.`grand_total` AS `grand_total` from (`usaascvb_development`.`highest_score_for_board_vw` `a` join `usaascvb_development`.`all_scores_for_board_vw` `b` on(((`a`.`board_id` = `b`.`board_id`) and (`a`.`award_option_id` = `b`.`award_option_id`) and (`a`.`grand_total` = `b`.`grand_total`))))
md5=ed29090c76de9909c2f9b84672350a60
updatable=0
algorithm=0
definer_user=root
definer_host=%
suid=1
with_check_option=0
timestamp=2016-12-20 03:57:12
create-version=1
source=select `a`.`board_id` AS `board_id`,`a`.`award_option_id` AS `award_option_id`,`a`.`grand_total` AS `grand_total` from (`highest_score_for_board_vw` `a` join `all_scores_for_board_vw` `b` on(((`a`.`board_id` = `b`.`board_id`) and (`a`.`award_option_id` = `b`.`award_option_id`) and (`a`.`grand_total` = `b`.`grand_total`))))
client_cs_name=utf8
connection_cl_name=utf8_general_ci
view_body_utf8=select `a`.`board_id` AS `board_id`,`a`.`award_option_id` AS `award_option_id`,`a`.`grand_total` AS `grand_total` from (`usaascvb_development`.`highest_score_for_board_vw` `a` join `usaascvb_development`.`all_scores_for_board_vw` `b` on(((`a`.`board_id` = `b`.`board_id`) and (`a`.`award_option_id` = `b`.`award_option_id`) and (`a`.`grand_total` = `b`.`grand_total`))))
