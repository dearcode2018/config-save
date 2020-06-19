

select HEX(AES_ENCRYPT('广东省广州市海珠区','1234567812345678'));



select * from t_user_copy a where id = 17;



select * from t_user_copy a where id = 17;
select a.id, IF(a.ACTIVATE = 1, AES_DECRYPT(UNHEX(a.name),'123'), a.name) AS NAME  from t_user_copy a where  id = 17;


select a.name,a.source,a.type,a.create_dt,a.update_dt from t_user a order by LENGTH(name) desc limit 0, 100
select a.name,a.mobile, a.source,a.type,a.create_dt,a.update_dt from t_user a where a.status = 1 order by LENGTH(mobile) desc limit 0, 100
select a.name,a.CERTIFICATION_CODE, a.CERTIFICATION_TYPE, a.source,a.type,a.create_dt,a.update_dt from t_user a where a.status = 1 order by LENGTH(CERTIFICATION_CODE) desc limit 0, 100

select * from t_user_copy a where id = 17;
select HEX(AES_ENCRYPT(name,'123')), HEX(AES_ENCRYPT(MOBILE,'123')), HEX(AES_ENCRYPT(CERTIFICATION_CODE,'123')) from t_user_copy a where id = 17;



select a.id, HEX(AES_ENCRYPT(CERTIFICATION_CODE,'123')), CERTIFICATION_CODE from t_user_copy a where id = 16;

select a.id, AES_DECRYPT(UNHEX(name),'123') from t_user_copy a where  AES_DECRYPT(UNHEX(name),'123') like '%日结%';


select * from t_user_copy a where id = 16;


select a.id, AES_DECRYPT(UNHEX(mobile),'123'), mobile from t_user_copy a where id = 16;


select a.id, AES_DECRYPT(UNHEX(mobile),'123') from t_user_copy a where  AES_DECRYPT(UNHEX(mobile),'123') like '%345083840%';


select a.id, HEX(AES_ENCRYPT(name,'123')), name from t_user_copy a where id = 16;


-- 13450838409, 16
select a.id, HEX(AES_ENCRYPT(mobile,'123')), mobile from t_user_copy a where id = 16;

select a.id, HEX(AES_ENCRYPT(mobile,'123')), mobile from t_user_copy a where mobile <> ''  limit 0, 50;
select a.id, HEX(AES_ENCRYPT(NAME,'123')), name from t_user_copy a limit 0, 50;


select a.id, HEX(AES_ENCRYPT(CERTIFICATION_CODE,'123')), CERTIFICATION_CODE from  t_user_copy a where a.CERTIFICATION_CODE <> '' limit 0, 50;
