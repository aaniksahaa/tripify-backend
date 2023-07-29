
SELECT table_name, COUNT(column_name) AS attribute_count
FROM all_tab_columns
WHERE owner = 'C##TRIPIFY'
GROUP BY table_name;