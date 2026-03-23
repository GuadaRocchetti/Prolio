create table states(
id int not null auto_increment,
state varchar(20),
primary key(id)
);

create table categories(
id int not null auto_increment,
category varchar(20),
primary key (id)
);

create table types_of_contacts(
id int not null auto_increment,
type_of_contact varchar(20),
primary key(id)
);

create table nationalities(
id int not null auto_increment,
nationality varchar(50),
primary key(id)
);

create table rols (
id int not null auto_increment,
rol varchar(20),
primary key(id)
);

create table users (
id int not null auto_increment,
nom varchar(50),
surname varchar(50),
birthday datetime,
nationality_id int,
primary key (id),
foreign key(nationality_id) references nationalities(id)
);

create table contacts (
id int not null auto_increment,
user_id int,
type_of_contact_id int,
contact varchar(50),
primary key(id),
foreign key(user_id) references users(id),
foreign key(type_of_contact_id) references types_of_contacts(id)
);

create table projects (
id int not null auto_increment,
nom varchar(50),
creation_date datetime,
deadline datetime,
ownerr int,
primary key(id),
foreign key(ownerr) references users(id)
);

create table tasks (
id int not null auto_increment,
nom varchar(50),
descr varchar(200),
creation_date datetime,
deadline datetime not null,
project_id int,
category_id int,
state_id int,
primary key(id),
foreign key(project_id) references projects(id),
foreign key(category_id) references categories(id),
foreign key(state_id) references states(id)
);

create table login (
id int not null auto_increment,
userr int,
email varchar(50),
passwordd varchar(50),
primary key(id),
foreign key(userr) references users(id)
);

create table users_x_projects (
id int not null auto_increment,
id_user int,
id_project int,
id_rol int,
id_task int,
primary key (id),
foreign key(id_user) references users(id),
foreign key(id_project) references projects(id),
foreign key(id_rol) references rols(id),
foreign key(id_task) references tasks(id)
);