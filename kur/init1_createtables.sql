Create table dance_style (id numeric(5) primary key, name varchar(15), free_place numeric(3) );
Create table teacher (id numeric(5) primary key, name varchar(60) not null, surname varchar(80) not null, middlename varchar(100), expirience numeric(2), phone numeric(11));
Create table subscription (id numeric(5) primary key, time_a_week numeric(2), cost numeric(10) );
Create table payment (id numeric(5) primary key, sid numeric(5), total numeric(10), date_p date );
Create table student (id numeric(5) primary key, name varchar(60) not null, surname varchar(80) not null, middlename varchar(100), pnone numeric(11), addres varchar(30), idsubscription numeric(5) );
Create table classes (id numeric(5) primary key, id_student numeric(5), id_teacher numeric(5), id_dancestyle numeric(5) );
Create table logtab (id_pay numeric(5), oldtotal numeric(10), date_note date, type_operation varchar(10) );
Create table logtab2 (id_subscription numeric(5), oldcost numeric(10), date_note date, type_operation varchar(10) );

alter  table student
add CONSTRAINT fk_student_subscription
FOREIGN key (idsubscription)
REFERENCES subscription(id);

alter  table payment
add CONSTRAINT fk_payment_student
FOREIGN key (sid)
REFERENCES student(id);

alter  table classes
add CONSTRAINT fk_classes_student
FOREIGN key (id_student)
REFERENCES student(id);

alter  table classes
add CONSTRAINT fk_classes_teacher
FOREIGN key (id_teacher)
REFERENCES teacher(id);

alter  table classes
add CONSTRAINT fk_classes_dance_style
FOREIGN key (id_dancestyle)
REFERENCES dance_style(id);
