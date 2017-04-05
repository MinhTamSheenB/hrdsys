INSERT INTO user_form
   SELECT c.user_id, 'pur80','1','0','0','0','0','0'
   FROM user_form  c
   WHERE  c.form_id='inv121' and   c.user_id not in 
( select d.user_id from user_form d where d.form_id='pur80')
and c.user_id not like 'a%'



