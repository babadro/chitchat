create table users (
  id         serial primary key,
  uuid       varchar(64) not null unique,
  name       varchar(255),
  email      varchar(255) not null unique,
  password   varchar(255) not null,
  created_at timestamp not null   
);

create table sessions (
  id         serial primary key,
  uuid       varchar(64) not null unique,
  email      varchar(255),
  user_id    integer references users(id),
  created_at timestamp not null   
);

create table polls (
  id          serial primary key,
  uuid        varchar(64) not null unique,
  topic       text,
  description TEXT, 
  user_id     integer references users(id),
  created_at  timestamp not null,
  start       TIMESTAMP not null,
  finish      TIMESTAMP not null,
  status      SMALLINT   
);

create table posts (
  id         serial primary key,
  uuid       varchar(64) not null unique,
  body       text,
  user_id    integer references users(id),
  thread_id  integer references threads(id),
  created_at timestamp not null  
);

create table options (
  id          SERIAl PRIMARY KEY,
  poll_id     INTEGER REFERENCES polls(id)
  title       TEXT,
  description TEXT,
  it_happened BOOLEAN
)

create table bets (
  id		      serial primary key,
  expert	    boolean,
  amount	    real,
  created_at  timestamp not null,
  user_id     INTEGER REFERENCES users(id),
  options
);