-- Добавление данных в таблицы

insert into users (id, email, nickname_nm, registration_dt) values
    (1, 'azaza@gmail.com', '__joker__', to_date('21-09-2013', 'DD-MM-YYYY'));
insert into users (id, email, premium_flg, nickname_nm) values
    (2, 'phystech.student@mail.ru', true, 'HSE4Life');
insert into users values
    (3, 'a31221@gmail.com', true, 'a31221', to_date('18-11-2016', 'DD-MM-YYYY')),
    (4, 'random_email@yandex.ru', false, '4ekHyTbIu', to_date('11-05-2020', 'DD-MM-YYYY')),
    (5, 'vasilev.vv@phystech.edu', false, 'victor', to_date('17-05-2021', 'DD-MM-YYYY'));

insert into musicians values
    (1, 'Anacondaz', 'rap', 'anacondaz.ru', 'ru_r1'),
    (2, 'Gorillaz', 'hip-hop', 'gorillaz.com', 'en_h4'),
    (3, 'Сплин', 'rap', 'splean.ru', null),
    (4, 'Сатана печет блины', null, null, 'ru_nd'),
    (5, 'Metallica', 'metal', 'metallica.com', 'en_m1');

insert into albums values
    (1, 'Байки инсайдера', to_date('24-09-2015', 'DD-MM-YYYY'), 4.4, 1),
    (2, 'Перезвони мне +79995771202', to_date('12-02-2021', 'DD-MM-YYYY'), 5, 1),
    (3, 'Gorillaz', to_date('26-03-2001', 'DD-MM-YYYY'), 3.8, 2),
    (4, 'Резонанс', to_date('01-03-2014', 'DD-MM-YYYY'), 4.6, 3),
    (5, 'Мент-людоед', to_date('24-05-2013', 'DD-MM-YYYY'), 3.3, 4),
    (6, 'Нормально', to_date('17-03-2012', 'DD-MM-YYYY'), 4.01, 4),
    (7, 'Metallica', to_date('12-08-1991', 'DD-MM-YYYY'), 4.8, 5);

insert into tracks values
    (1, 1, 'Мне мне мне', false, 3.3),
    (2, 1, 'Мама, я люблю', true, 3.5),
    (3, 2, 'Сядь мне на лицо', true, 4.5),
    (4, 2, 'Дождь', false, 2.8),
    (5, 3, 'Feel inc.', false, 3.4),
    (6, 4, 'Всадник', false, 4.2),
    (7, 4, 'Танцуй!', false, 3.5),
    (8, 5, 'Мент людоед', true, 2.4),
    (9, 6, 'Простит утка', false, 1.5),
    (10, 7, 'Nothing else matters', false, 6.3);

insert into playlists values
    (1, 'Для душа', 55, 2),
    (2, 'Sadness((', 3, 4),
    (3, 'Музыка для драки в комнате', 42, 2),
    (4, 'random music', 15, 5);

insert into users_x_tracks values
    (5, 9),
    (1, 3),
    (2, 8),
    (2, 1),
    (5, 1),
    (3, 7),
    (5, 8),
    (4, 9),
    (2, 2),
    (4, 1),
    (4, 10),
    (3, 2),
    (4, 5),
    (2, 3),
    (1, 9),
    (4, 2),
    (5, 10),
    (3, 1),
    (5, 2);

insert into playlists_x_tracks values
    (2, 7), (4, 7), (2, 6), (1, 3), (4, 6), (2, 9), (3, 2), (3, 3), (2, 8), (3, 10), (4, 4), (3, 8), (1, 5), (1, 6), (3, 6), (3, 4), (1, 1);