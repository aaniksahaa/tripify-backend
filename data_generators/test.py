with open('./data_generators/temp.txt','r') as f:
    lines = f.readlines()

seq_tables = []

for line in lines:
    line = line.strip()
    table_name = line.split(' ')[2].split('_')[0]
    seq_tables.append(table_name)

print(seq_tables)

#print(lines)