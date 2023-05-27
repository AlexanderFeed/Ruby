create table if not exists Student (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
	first_name varchar(20) not null,
	sur_name	varchar(20) not null,
	last_name varchar(20) not null,
	git	varchar(50) null,
	phone varchar(12) null,
	tg varchar(30) null,
	mail varchar(50) null
);