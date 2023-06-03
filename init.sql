CREATE DATABASE azura;

CREATE ROLE admin WITH CREATEDB PASSWORD 'root';

CREATE TABLE IF NOT EXISTS masters
(
    id        SERIAL PRIMARY KEY,
    name      VARCHAR(30),
    about     VARCHAR(255),
    thumbnail VARCHAR(255),
    login     VARCHAR(255),
    password  VARCHAR(255),
    role      VARCHAR(15)
);

CREATE TABLE IF NOT EXISTS operations_type
(
    id        SERIAL PRIMARY KEY,
    name      VARCHAR(50),
    about     TEXT,
    thumbnail VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS operations
(
    id        SERIAL PRIMARY KEY,
    type_id   INT REFERENCES operations_type (id),
    name      VARCHAR(100),
    thumbnail VARCHAR(255),
    about     TEXT,
    gallery   VARCHAR(255)
);

CREATE TABLE If NOT EXISTS benefits
(
    id            SERIAL PRIMARY KEY,
    operations_id INT REFERENCES operations (id),
    header        VARCHAR(50),
    body          VARCHAR(255)
);

CREATE TABLE If NOT EXISTS questions
(
    id            SERIAL PRIMARY KEY,
    operations_id INT REFERENCES operations (id),
    header        VARCHAR(255),
    body          TEXT
);

CREATE TABLE If NOT EXISTS facts
(
    id            SERIAL PRIMARY KEY,
    operations_id INT REFERENCES operations (id),
    body          VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS classification
(
    id            SERIAL PRIMARY KEY,
    name          VARCHAR(50),
    operations_id INT REFERENCES operations (id)
);

CREATE TABLE IF NOT EXISTS subtypes
(
    id                SERIAL PRIMARY KEY,
    classification_id INT REFERENCES classification (id),
    name              VARCHAR(150),
    price             DOUBLE PRECISION,
    time_min          INT,
    time_max          INT
);

CREATE TABLE IF NOT EXISTS entry
(
    id            SERIAL PRIMARY KEY,
    master_id     INT REFERENCES masters (id),
    client_name   VARCHAR(40),
    phone         VARCHAR(20),
    email         VARCHAR(100),
    subtype_id    INT REFERENCES subtypes (id),
    booking_day   DATE,
    starting_time TIME,
    status        VARCHAR(15) DEFAULT ('ACTIVE')
);

CREATE TABLE IF NOT EXISTS masters_operations
(
    master_id     INT REFERENCES masters (id),
    operations_id INT REFERENCES operations (id)
);


-- MASTERS
insert into masters (name, about, thumbnail, login, password, role) values ('Владислава', 'Косметик — эстетист, визажист, массажист, мастер педикюра', '/home/lesnoy/Pictures/azura/masters/Rectangle.jpg', 'vlada22', null, 'ADMIN');
insert into masters (name, about, thumbnail, login, password, role) values ('Ольга', 'Мастер маникюра, бровист', '/home/lesnoy/Pictures/azura/masters/Rectangle1.jpg', 'olga21', null, 'MODERATOR');
insert into masters (name, about, thumbnail, login, password, role) values ('Виолетта', 'Мастер бровист', '/home/lesnoy/Pictures/azura/masters/Rectangle2.jpg', 'veta25', null, 'MODERATOR');

-- SERVICE TYPE
insert into operations_type (name, about, thumbnail) values ('Массаж', 'Массаж - заебись', 'https://furor.salon/images/img/Brovi-i-resnicy/modelirovanie-brovej.jpg');
insert into operations_type (name, about, thumbnail) values ('Аппаратная косметология', 'АППАРАТ НОРМ', 'https://caramel.ua/uploads/blog/smt_1503920000.jpg');
insert into operations_type (name, about, thumbnail) values ('Ногти', 'Ногти = Лицо', 'https://kudagid.ru/images/moda/manikur/Manicure.jpg');
insert into operations_type (name, about, thumbnail) values ('Брови', 'Мы делаем брови', 'https://furor.salon/images/img/Brovi-i-resnicy/modelirovanie-brovej.jpg');
insert into operations_type (name, about, thumbnail) values ('Ресницы', 'Украшение глаз', 'https://kudagid.ru/images/moda/manikur/Manicure.jpg');
insert into operations_type (name, about, thumbnail) values ('Визаж', 'Не ебу что это', 'https://caramel.ua/uploads/blog/smt_1503920000.jpg');
insert into operations_type (name, about, thumbnail) values ('Мужчинам', '(no homo)', 'https://furor.salon/images/img/Brovi-i-resnicy/modelirovanie-brovej.jpg');
insert into operations_type (name, about, thumbnail) values ('Перманентный макияж', 'Пермач каждому', 'https://kudagid.ru/images/moda/manikur/Manicure.jpg');

-- SERVICES
insert into operations (type_id, name, thumbnail, about, gallery)values (3, 'Криолиполиз', 'картинка', 'текст', 'путь к картнкам');
insert into operations (type_id, name, thumbnail, about, gallery)values (3, 'Вакуумный гидропилинг', 'картинка', 'текст', 'путь к картнкам');
insert into operations (type_id, name, thumbnail, about, gallery)values (3, 'Rf-лифтинг', 'картинка', 'текст', 'путь к картнкам');
insert into operations (type_id, name, thumbnail, about, gallery)values (3, 'Вакуумный массаж тела', 'картинка', 'текст', 'путь к картнкам');
insert into operations (type_id, name, thumbnail, about, gallery)values (3, 'Тонинг кожи и корекция жировых отложений', 'картинка', 'текст', 'путь к картнкам');

-- BENEFITS
insert into benefits(operations_id, header, body)VALUES (2, 'Безопасность', 'Процедура которая не требует хирургического вмешательства, что делает её более безопасной и менее рискованной, чем другие процедуры омоложения');
insert into benefits(operations_id, header, body)VALUES (2, 'Минимальное время восстановления', 'Не требует много времени длявосстановления, чтопозволяет вам сразу вернутсья к своим делам');
insert into benefits(operations_id, header, body)VALUES (2, 'Широкий спектр применения', 'Эта процедура может быть проведена на любой области тела, включая лицо, декольте, шею, живот и бедра');
insert into benefits(operations_id, header, body)VALUES (2, 'Результат', 'Результаты данной процедуры могут быть заметны уже после первой сессии, однако для достижения максимального эффекта рекомендуется произвести от 3 до 6 процедур');

-- QUESTIONS
insert into questions(operations_id, header, body)VALUES (2, 'Какие задачи решает RF-лифтинг?', 'Lorem Ipsum - это текст-"рыба", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной "рыбой" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum.');
insert into questions(operations_id, header, body)VALUES (2, 'Как проходит процедура?', 'Давно выяснено, что при оценке дизайна и композиции читаемый текст мешает сосредоточиться. Lorem Ipsum используют потому, что тот обеспечивает более или менее стандартное заполнение шаблона, а также реальное распределение букв и пробелов в абзацах, которое не получается при простой дубликации "Здесь ваш текст.. Здесь ваш текст.. Здесь ваш текст.." Многие программы электронной вёрстки и редакторы HTML используют Lorem Ipsum в качестве текста по умолчанию, так что поиск по ключевым словам "lorem ipsum" сразу показывает, как много веб-страниц всё ещё дожидаются своего настоящего рождения. За прошедшие годы текст Lorem Ipsum получил много версий. Некоторые версии появились по ошибке, некоторые - намеренно (например, юмористические варианты).');
insert into questions(operations_id, header, body)VALUES (2, 'Какие есть риски после процедуры?', 'Многие думают, что Lorem Ipsum - взятый с потолка псевдо-латинский набор слов, но это не совсем так. Его корни уходят в один фрагмент классической латыни 45 года н.э., то есть более двух тысячелетий назад. Ричард МакКлинток, профессор латыни из колледжа Hampden-Sydney, штат Вирджиния, взял одно из самых странных слов в Lorem Ipsum, "consectetur", и занялся его поисками в классической латинской литературе. В результате он нашёл неоспоримый первоисточник Lorem Ipsum в разделах 1.10.32 и 1.10.33 книги "de Finibus Bonorum et Malorum" ("О пределах добра и зла"), написанной Цицероном в 45 году н.э. Этот трактат по теории этики был очень популярен в эпоху Возрождения. Первая строка Lorem Ipsum, "Lorem ipsum dolor sit amet..", происходит от одной из строк в разделе 1.10.32');
insert into questions(operations_id, header, body)VALUES (2, 'Курс процедур и стоит ли повторять процедуру?', 'Нет никого, кто любил бы боль саму по себе, кто искал бы её и кто хотел бы иметь её просто потому, что это боль..');
insert into questions(operations_id, header, body)VALUES (2, 'Какие есть рекомендации до и после процедуры?', 'Pellentesque a finibus dolor. Aliquam at malesuada enim. Pellentesque blandit nisl sollicitudin libero scelerisque, quis luctus diam vehicula. Cras vel rutrum urna. Nulla mattis nec.');

-- QUESTIONS
insert into facts(operations_id, body)VALUES (2, 'Уменьшение морщин');
insert into facts(operations_id, body)VALUES (2, 'Тонизирование кожи');
insert into facts(operations_id, body)VALUES (2, 'Омоложение кожи');


-- CLASSIFICATION
insert into classification (name, operations_id)values ('Rf-лифтинг тела:', 3);
insert into classification (name, operations_id)values ('Rf-лифтинг лица:', 3);

-- SUBTYPES
insert into subtypes (classification_id, name, price, time_min, time_max) values (1, 'внутренняя поверхность бедра', 30.00, 30, 50);
insert into subtypes (classification_id, name, price, time_min, time_max) values (1, 'руки полностью', 27.00, 20, 50);
insert into subtypes (classification_id, name, price, time_min, time_max) values (1, 'живот', 50.00, 30, 45);
insert into subtypes (classification_id, name, price, time_min, time_max) values (1, 'ягодицы', 56.00, 30, 50);
insert into subtypes (classification_id, name, price, time_min, time_max) values (1, 'бедра полностью', 28.00, 20, 25);
insert into subtypes ( classification_id, name, price, time_min, time_max) values (2, 'периорбитальная область (вокруг глаз)', 10.00, 20, 50);
insert into subtypes (classification_id, name, price, time_min, time_max) values (2, 'область глаз + губы', 16.00, 20, 30);
insert into subtypes (classification_id, name, price, time_min, time_max) values (2, 'внутренняя поверхност рук', 45.00, 30, 50);


-- MASTERS SERVICE
insert into masters_operations (master_id, operations_id) values (1, 5);
insert into masters_operations (master_id, operations_id) values (1, 3);
insert into masters_operations (master_id, operations_id) values (2, 2);

-- ENTRY
insert into entry (master_id, client_name, phone, email, subtype_id, booking_day, starting_time, status) values (1, 'Kirill', '+79217485004', 'kilril01@mail.ru', 4, '2023-05-17', '15:00:00', 'ACTIVE');
insert into entry (master_id, client_name, phone, email, subtype_id, booking_day, starting_time, status) values (1, 'Kirill', '+79217485004', 'kilril01@mail.ru', 5, '2023-05-19', '12:00:00', 'COMPLETE');
insert into entry (master_id, client_name, phone, email, subtype_id, booking_day, starting_time, status) values (2, 'Maksim', '+79245674898', 'chikez@mail.ru', 8, '2023-05-17', '17:00:00', 'CANCELED');

