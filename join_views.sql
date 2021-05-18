--views with joins

drop view album_w_tracks_view;
create view album_w_tracks_view
as
select album_nm   as album_name,
       release_dt as drop_date,
       rating     as current_rating,
       track_nm   as track
from albums join tracks t on albums.id = t.album_id;

drop view musicians_with_albums_view;
create view musicians_with_albums_view
as
select musician_nm   as musician,
       album_nm   as album_name,
       release_dt as drop_date,
       rating     as current_rating
from musicians m join albums a on m.id = a.musician_id;

select * from musicians_with_albums_view;