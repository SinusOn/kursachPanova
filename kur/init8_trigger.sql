CREATE OR REPLACE FUNCTION logf1() RETURNS trigger AS $$
BEGIN
 insert into logtab(id_pay, oldtotal, date_note, type_operation) values(OLD.id, OLD.total, current_date, 'Update');
RETURN OLD;
END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER trig1
AFTER UPDATE ON payment FOR EACH ROW
EXECUTE PROCEDURE logf1 ();


CREATE OR REPLACE FUNCTION logf2() RETURNS trigger AS $$
BEGIN
 insert into logtab2(id_subscription, oldcost, date_note, type_operation) values(OLD.id, OLD.cost, current_date, 'Update');
RETURN OLD;
END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER trig2
AFTER UPDATE ON subscription FOR EACH ROW
EXECUTE PROCEDURE logf2();
