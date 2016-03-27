create table users (
  id serial,
  display_name varchar(40),
  full_name varchar(60),
  email varchar(40),
  phone varchar(15)
);

create table lists (
  id serial,
  owner_id integer,
  label varchar(60),
  description text
);

create table list_items (
  id serial,
  list_id integer,
  description text
);

insert into lists VALUES (1, 1, 'my first todo list', 'lots of things to do');
insert into list_items VALUES (1, 1, 'get a life'), (2, 1, 'clean your car'), (3, 1, 'buy a house');

create table todo_lists (
  id serial,
  owner_id integer,
  title varchar(255),
  description text
);

insert into todo_lists (owner_id, title, description) VALUES
(4, 'mustang todo', 'All the things that I need to do for my mustang, which is going to be awesome'),
(4, 'house todo', 'Fix them things at home'),
(4, 'work todo', 'keep building this api')

create table items (
  id serial,
  list_id integer,
  title varchar(255),
  description text,
  due_date date,
  complete boolean default false
);

-- insert into items (list_id, title, description, due_date) VALUES
-- (1, 'windshield', 'put that thing in', to_date('20160630', 'YYYYMMDD'))

insert into items (list_id, title, description, due_date) VALUES
(1, 'headlights', 'install them', to_date('20160503', 'YYYYMMDD')),
(1, 'wiring', 'wire the engine, instrument panel, etc.', to_date('20160303', 'YYYYMMDD'))