CREATE OR REPLACE PROCEDURE DropAllTables AS
		COUNTER NUMBER;
BEGIN
		COUNTER := 0;
		DBMS_OUTPUT.PUT_LINE('CAUTION !!! All tables are being deleted...');
    FOR t IN (SELECT table_name FROM all_tables WHERE owner = 'C##TRIPIFY') LOOP
        EXECUTE IMMEDIATE 'DROP TABLE ' || t.table_name || ' CASCADE CONSTRAINTS';
				DBMS_OUTPUT.PUT_LINE('Table ' || t.table_name || ' dropped.');
				COUNTER := COUNTER + 1;
    END LOOP;
		DBMS_OUTPUT.PUT_LINE(TO_CHAR(COUNTER) || ' tables successfully deleted...');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: Unable to drop all tables');
END;
/

CREATE OR REPLACE PROCEDURE DropAllSequences AS
		COUNTER NUMBER;
BEGIN
		COUNTER := 0;
		DBMS_OUTPUT.PUT_LINE('CAUTION !!! All sequences are being deleted...');
    FOR seq IN (SELECT sequence_name FROM all_sequences WHERE sequence_owner = 'C##TRIPIFY') 
		LOOP
        EXECUTE IMMEDIATE 'DROP SEQUENCE ' || 'C##TRIPIFY' || '.' || seq.sequence_name;
        DBMS_OUTPUT.PUT_LINE('Sequence ' || seq.sequence_name || ' dropped.');
				COUNTER := COUNTER + 1;
    END LOOP;
		DBMS_OUTPUT.PUT_LINE(TO_CHAR(COUNTER) || ' sequences successfully deleted...');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: Unable to drop all sequences');
END;
/
