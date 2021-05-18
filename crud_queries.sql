--CRUD запросы

--1) Musicians

insert into musicians (id, musician_nm, genre_nm)
values (6, 'Green Day', 'rock');

select *
from musicians
where id = 2;

update musicians
set genre_nm = 'russian rock'
where musician_nm = 'Сплин';

delete from musicians
where genre_nm is null;

-- 2) users
insert into users (id, email, premium_flg, nickname_nm)
values (6, 'new_email@gmail.com', true, 'youtube_bloger');

select *
from users
where premium_flg = true;

update users
set premium_flg = true
where premium_flg = false and registration_dt = (select min(registration_dt) from users where premium_flg = false);

delete from users
where nickname_nm similar to '%[0-9]%';