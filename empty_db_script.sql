CREATE SCHEMA IF NOT EXISTS db_project;

SET SEARCH_PATH = db_project;

-- Создание таблиц

drop table if exists users cascade;
create table users(
    id              serial PRIMARY KEY,
    email           varchar(64) check ( email similar to '%@%'),
    premium_flg     boolean not null default false,
    nickname_nm     varchar(32) not null ,
    registration_dt date default now() not null
);

drop table if exists musicians cascade;
create table musicians(
    id                 serial PRIMARY KEY,
    musician_nm        varchar(32) not null,
    genre_nm           varchar(32),
    site_url           varchar(256),
    contract_type_txt  varchar(5)
);

drop table if exists albums cascade;
create table albums(
    id              serial PRIMARY KEY,
    album_nm        varchar(64) not null,
    release_dt      date default now(),
    rating          decimal default null check ( (0 <= rating and rating <= 5) or rating is null ),
    musician_id     serial references musicians(id) on delete cascade
);

drop table if exists tracks cascade;
create table tracks(
    id              serial PRIMARY KEY,
    album_id        serial references albums(id) on delete cascade not null,
    track_nm        varchar(32) not null ,
    explicit_flg    boolean default false,
    duration_min    decimal not null
);

drop table if exists playlists cascade;
create table playlists(
    id               serial PRIMARY KEY,
    playlist_nm      varchar(64) not null,
    likes_cnt        bigint default 0,
    creator_id       serial references users(id) on delete cascade not null
);

drop table if exists users_x_tracks cascade;
create table users_x_tracks(
    user_id   serial references users(id) on delete  cascade ,
    track_id  serial references tracks(id) on delete  cascade
);

drop table if exists playlists_x_tracks cascade;
create table playlists_x_tracks(
    playlist_id   serial references playlists(id) on delete cascade ,
    track_id      serial references tracks(id) on delete cascade
);