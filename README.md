# ProjectManagementSystem

Database used:

create database operis;

use operis;

create table user
(
    uid      int auto_increment
        primary key,
    email    varchar(255)         not null,
    fname    varchar(255)         not null,
    password varchar(255)         not null,
    admin    tinyint(1) default 0 not null,
    constraint email
        unique (email),
    constraint uid
        unique (uid)
);

create table project
(
    id     int auto_increment
        primary key,
    name   varchar(255) not null,
    uid    int          not null,
    status varchar(255) not null,
    constraint id
        unique (id),
    constraint project_user_uid
        foreign key (uid) references user (uid)
);

create table task
(
    tid         int auto_increment
        primary key,
    date        varchar(255) not null,
    tname       varchar(255) not null,
    member      varchar(255) not null,
    deliverable varchar(255) null,
    image       varchar(255) null,
    pid         int          not null,
    constraint tid
        unique (tid),
    constraint task_project_id
        foreign key (pid) references project (id)
);

create index task_user_uid
    on task (pid);
