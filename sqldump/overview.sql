
-- List tables of the schema and attribute count

SELECT ROW_NUMBER() OVER (ORDER BY table_name) AS table_no,
       table_name,
       COUNT(column_name) AS attribute_count
FROM all_tab_columns
WHERE owner = 'C##TRIPIFY'
GROUP BY table_name;
