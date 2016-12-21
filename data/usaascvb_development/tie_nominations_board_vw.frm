TYPE=VIEW
query=select `a`.`nomination_id` AS `nomination_id`,`a`.`board_id` AS `board_id`,`a`.`award_option_id` AS `award_option_id`,`a`.`grand_total` AS `grand_total` from (`usaascvb_development`.`tie_nominations_vw` `a` join `usaascvb_development`.`tie_board_vw` `b`) where ((`a`.`board_id` = `b`.`board_id`) and (`a`.`award_option_id` = `b`.`award_option_id`) and (`a`.`grand_total` = `b`.`grand_total`))
md5=1f0d43f31f57fb16fb4cef08973a5eda
updatable=1
algorithm=0
definer_user=root
definer_host=%
suid=1
with_check_option=0
timestamp=2016-12-20 03:57:12
create-version=1
source=select `a`.`nomination_id` AS `nomination_id`,`a`.`board_id` AS `board_id`,`a`.`award_option_id` AS `award_option_id`,`a`.`grand_total` AS `grand_total` from (`tie_nominations_vw` `a` join `tie_board_vw` `b`) where ((`a`.`board_id` = `b`.`board_id`) and (`a`.`award_option_id` = `b`.`award_option_id`) and (`a`.`grand_total` = `b`.`grand_total`))
client_cs_name=utf8
connection_cl_name=utf8_general_ci
view_body_utf8=select `a`.`nomination_id` AS `nomination_id`,`a`.`board_id` AS `board_id`,`a`.`award_option_id` AS `award_option_id`,`a`.`grand_total` AS `grand_total` from (`usaascvb_development`.`tie_nominations_vw` `a` join `usaascvb_development`.`tie_board_vw` `b`) where ((`a`.`board_id` = `b`.`board_id`) and (`a`.`award_option_id` = `b`.`award_option_id`) and (`a`.`grand_total` = `b`.`grand_total`))
