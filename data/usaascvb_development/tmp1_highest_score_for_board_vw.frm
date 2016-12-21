TYPE=VIEW
query=select `a`.`nomination_id` AS `nomination_id`,`b`.`award_option_id` AS `award_option_id`,`a`.`board_id` AS `board_id`,`a`.`score_total` AS `score_total` from (`usaascvb_development`.`scores` `a` join `usaascvb_development`.`nominations` `b` on((`b`.`id` = `a`.`nomination_id`)))
md5=9ce9d5a5fa0d984702c433c24b11e316
updatable=1
algorithm=0
definer_user=root
definer_host=%
suid=1
with_check_option=0
timestamp=2016-12-20 03:57:13
create-version=1
source=select `a`.`nomination_id` AS `nomination_id`,`b`.`award_option_id` AS `award_option_id`,`a`.`board_id` AS `board_id`,`a`.`score_total` AS `score_total` from (`scores` `a` join `nominations` `b` on((`b`.`id` = `a`.`nomination_id`)))
client_cs_name=utf8
connection_cl_name=utf8_general_ci
view_body_utf8=select `a`.`nomination_id` AS `nomination_id`,`b`.`award_option_id` AS `award_option_id`,`a`.`board_id` AS `board_id`,`a`.`score_total` AS `score_total` from (`usaascvb_development`.`scores` `a` join `usaascvb_development`.`nominations` `b` on((`b`.`id` = `a`.`nomination_id`)))
