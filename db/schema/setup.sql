drop table if exists petitions;

create table petitions (
	id serial,
	parliament int not null,
	petition_id int not null,
	url varchar(300) not null,
	action text not null,
	signature_count int not null,
	created_at timestamp not null,
	opened_at timestamp not null,
	closed_at timestamp,
	moderation_threshold_reached_at timestamp,
	response_threshold_reached_at timestamp not null,
	government_response_at timestamp not null,
	government_response_on date not null,
	government_response_summary text not null,
	primary key (id)
);