-- Смысловые запросы к базе данных

-- 1) Вывести длину каждого плейлиста
select distinct playlist_nm, sum(duration_min) over (partition by playlist_nm)
from (select playlist_nm, track_id
from db_project.playlists join playlists_x_tracks pxt on playlists.id = pxt.playlist_id) plists
    join db_project.tracks t on plists.track_id = t.id;

-- 2) Посчитать количество треков у исполнителя
with tracks_of_musicians as (select track_nm, musician_id
from (tracks t join albums a on t.album_id = a.id))
select musician_nm, count(track_nm) as tracks_amnt
from tracks_of_musicians tom join db_project.musicians m on tom.musician_id = m.id
group by musician_nm;

-- 3) Вывести все треки, выпущенные позже определенной даты в формате (исполнитель, трек, дата выпуска)
select musician_nm, track_nm, release_dt
from (select track_nm, release_dt, musician_id
from tracks t join albums a on t.album_id = a.id) track_release join db_project.musicians
on track_release.musician_id = musicians.id
where release_dt > to_date('01-01-2013', 'DD-MM-YYYY');

-- 4) Для каждого пользователя вывести количество треков каждого исполнителя в его скачанных треках
select Имя_пользователя, Исполнитель, sum(Количество_скачанных_треков) as Количество_скачанных_треков
from (with saved_tracks_amnt as
(with album_cnt_info as (select distinct nickname_nm, album_id, count(track_nm) over (partition by nickname_nm, album_id)
from (select nickname_nm, track_id
from users join users_x_tracks uxt on users.id = uxt.user_id) usr_track join tracks on track_id = tracks.id)
select nickname_nm, musician_id, sum(count) over(partition by nickname_nm, musician_id)
from album_cnt_info aci join albums on album_id = albums.id)
select nickname_nm as Имя_пользователя, musician_nm as Исполнитель, sum as Количество_скачанных_треков
from saved_tracks_amnt sta join musicians m on sta.musician_id = m.id
union
select *
from (select nickname_nm as Имя_пользователя, musician_nm as Исполнитель, 0 as Количество_скачанных_треков
from users cross join musicians) cross_join_info) i
group by Имя_пользователя, Исполнитель;

-- 5) Для каждого пользователя вывести треки, которые есть в одном из его плейлистов, но не скачаны у пользователя, и наоборот.
with users_xor_tracks as
(with users_x_playlists as (select u.id, track_id
from playlists p join users u on p.creator_id = u.id join playlists_x_tracks pxt on p.id = pxt.playlist_id)
select *
from users_x_playlists
where (id, track_id) not in (select * from users_x_tracks)
union
select user_id as id, track_id
from users_x_tracks
where (user_id, track_id) not in (select * from users_x_playlists))
select nickname_nm, track_nm
from users_xor_tracks uxt join users on uxt.id = users.id join tracks t on track_id = t.id

