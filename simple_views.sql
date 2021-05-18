-- view for users
drop view user_view;
create or replace view user_view as
(select
       nickname_nm as nickname,
       case
        when premium_flg = true then 'premium'
        else 'common'
       end as acc_type,
       now() - registration_dt                   as registered_time,
       overlay(email placing '***' from 2 for 5) as email
from users);

select *
from user_view;

-- view for album
drop view album_view;
create view album_view
as
select album_nm   as album_name,
       release_dt as drop_date,
       rating     as current_rating
from albums;

-- view for musicians
drop view musician_view;
create view musician_view
as
select musician_nm as musician,
       genre_nm    as music_genre,
       site_url    as musicians_site,
       overlay(contract_type_txt placing '***' from 2 for 3) as current_contract
from musicians;


-- view for tracks
drop view track_view;
create view track_view
as
select track_nm    as name,
       duration_min    as music_genre,
       case
        when explicit_flg = true then 'NC-17'
        else 'G'
       end as track_rating
from tracks;

-- view for playlists
drop view playlist_view;
create view playlist_view
as
select playlist_nm as name,
       likes_cnt   as current_likes
from playlists;
