Table "public.stations"
Column    |       Type        |                       Modifiers
--------------+-------------------+-------------------------------------------------------
id           | integer           | not null default nextval('stations_id_seq'::regclass)
station_info | character varying |
line_id      | integer           |
Indexes:
"stations_pkey" PRIMARY KEY, btree (id)

trains-# \d line
Did not find any relation named "line".
trains-# \d lines
Table "public.lines"
Column   |       Type        |                     Modifiers
-----------+-------------------+----------------------------------------------------
id        | integer           | not null default nextval('lines_id_seq'::regclass)
line_info | character varying |
Indexes:
"lines_pkey" PRIMARY KEY, btree (id)

trains-# \d stations
Table "public.stations"
Column    |       Type        |                       Modifiers
--------------+-------------------+-------------------------------------------------------
id           | integer           | not null default nextval('stations_id_seq'::regclass)
station_info | character varying |
line_id      | integer           |
Indexes:
"stations_pkey" PRIMARY KEY, btree (id)

trains-# \d train_time
Table "public.train_time"
Column   |       Type        | Modifiers
------------+-------------------+-----------
train_time | character varying | 
