                   List of relations
+--------+------------------+----------+--------------+
| Schema |       Name       |   Type   |    Owner     |
+--------+------------------+----------+--------------+
| public | creatures        | table    | freecodecamp |
| public | creatures_id_seq | sequence | freecodecamp |
| public | galaxy           | table    | freecodecamp |
| public | galaxy_id_seq    | sequence | freecodecamp |
| public | moon             | table    | freecodecamp |
| public | moon_id_seq      | sequence | freecodecamp |
| public | planet           | table    | freecodecamp |
| public | planet_id_seq    | sequence | freecodecamp |
| public | star             | table    | freecodecamp |
| public | star_id_seq      | sequence | freecodecamp |
+--------+------------------+----------+--------------+

                     
                         GALAXY
                     
universe=> SELECT * FROM galaxy;
+-----------+-------------+-------------+----------------+------+
| galaxy_id | galaxy_name | galaxy_type | has_black_hole | name |
+-----------+-------------+-------------+----------------+------+
|         2 | Threxon     | Elliptical  | f              | none |
|         1 | Caldrevia   | Spiral      | t              | none |
|         3 | Myrravell   | Irregular   | t              | none |
|         7 | Vael        | Spiral      | f              | none |
|         8 | Zen         | Elliptical  | t              | none |
|         9 | Orranyx     | Irregular   | f              | none |
+-----------+-------------+-------------+----------------+------+
  (6 rows)

universe=> \d galaxy
                                        Table "public.galaxy"
+----------------+-----------------------+-----------+----------+------------------------------------+
|     Column     |         Type          | Collation | Nullable |              Default               |
+----------------+-----------------------+-----------+----------+------------------------------------+
| galaxy_id      | integer               |           | not null | nextval('galaxy_id_seq'::regclass) |
| galaxy_name    | character varying(30) |           |          |                                    |
| galaxy_type    | text                  |           |          |                                    |
| has_black_hole | boolean               |           | not null | false                              |
| name           | character varying(30) |           | not null | 'none'::character varying          |
+----------------+-----------------------+-----------+----------+------------------------------------+
Indexes:
    "galaxy_pkey" PRIMARY KEY, btree (galaxy_id)
    "galaxy_name_key" UNIQUE CONSTRAINT, btree (galaxy_name)
Foreign-key constraints:
    "galaxy_name_fkey" FOREIGN KEY (galaxy_name) REFERENCES galaxy(galaxy_name)
Referenced by:
    TABLE "galaxy" CONSTRAINT "galaxy_name_fkey" FOREIGN KEY (galaxy_name) REFERENCES galaxy(galaxy_name)
    TABLE "star" CONSTRAINT "star_galaxy_id_fkey" FOREIGN KEY (galaxy_name) REFERENCES galaxy(galaxy_name)


                          STAR
universe=> SELECT * FROM star;
+---------+-----------+-------------+--------------+------+----------------------------+
| star_id | star_name | galaxy_name | will_explode | name | star_age_billions_of_years |
+---------+-----------+-------------+--------------+------+----------------------------+
|       1 | Vela      | Caldrevia   | f            | none |                          5 |
|       2 | Kireth    | Threxon     | t            | none |                         11 |
|       3 | Nuaros    | Myrravell   | f            | none |                          8 |
|       4 | Aurethis  | Vael        | t            | none |                         13 |
|       5 | Kae       | Zen         | f            | none |                          2 |
|       6 | Syrion    | Orranyx     | t            | none |                         15 |
+---------+-----------+-------------+--------------+------+----------------------------+
(6 rows)

universe=> \d star
                                              Table "public.star"
+----------------------------+-----------------------+-----------+----------+----------------------------------+
|           Column           |         Type          | Collation | Nullable |             Default              |
+----------------------------+-----------------------+-----------+----------+----------------------------------+
| star_id                    | integer               |           | not null | nextval('star_id_seq'::regclass) |
| star_name                  | text                  |           | not null |                                  |
| galaxy_name                | text                  |           |          |                                  |
| will_explode               | boolean               |           | not null | false                            |
| name                       | character varying(30) |           | not null | 'none'::character varying        |
| star_age_billions_of_years | integer               |           |          |                                  |
+----------------------------+-----------------------+-----------+----------+----------------------------------+
Indexes:
    "star_pkey" PRIMARY KEY, btree (star_id)
    "star_name_key" UNIQUE CONSTRAINT, btree (star_name)
Foreign-key constraints:
    "star_galaxy_id_fkey" FOREIGN KEY (galaxy_name) REFERENCES galaxy(galaxy_name)
Referenced by:
    TABLE "planet" CONSTRAINT "planet_star_name_fkey" FOREIGN KEY (star_name) REFERENCES star(star_name)

                     PLANET

universe=> SELECT * FROM planet;
+-----------+-------------+-----------+-----------------------+------+
| planet_id | planet_name | star_name | age_millions_of_years | name |
+-----------+-------------+-----------+-----------------------+------+
|         1 | Solara      | Vela      |                  3800 | none |
|         2 | Vibra       | Vela      |                  2200 | none |
|         3 | Obsolis     | Kireth    |                  5400 | none |
|         4 | Synthia     | Kireth    |                  1600 | none |
|         5 | Geosyn      | Nuaros    |                  4900 | none |
|         6 | Thalmera    | Aurethis  |                  3900 | none |
|         7 | Nyxari      | Kae       |                  1500 | none |
|         8 | Orra        | Syrion    |                  5200 | none |
|         9 | Zeph        | Aurethis  |                  2300 | none |
|        10 | Velmara     | Kae       |                  4100 | none |
|        11 | Cindross    | Syrion    |                   800 | none |
|        12 | Maren       | Aurethis  |                  6000 | none |
|        13 | Zare        | Vela      |                  2400 | none |
|        14 | Myrrakos    | Kireth    |                  3700 | none |
|        15 | Ossyrel     | Nuaros    |                  1300 | none |
|        16 | Thirelia    | Aurethis  |                  4200 | none |
|        17 | Velkara     | Kae       |                   900 | none |
|        18 | Sorynth     | Syrion    |                  3000 | none |
|        19 | Aluneth     | Kireth    |                  5600 | none |
|        20 | Caelthar    | Vela      |                  2200 | none |
+-----------+-------------+-----------+-----------------------+------+
(20 rows)

universe=> \d planet
                                            Table "public.planet"
+-----------------------+-----------------------+-----------+----------+------------------------------------+
|        Column         |         Type          | Collation | Nullable |              Default               |
+-----------------------+-----------------------+-----------+----------+------------------------------------+
| planet_id             | integer               |           | not null | nextval('planet_id_seq'::regclass) |
| planet_name           | character varying(30) |           |          |                                    |
| star_name             | text                  |           |          |                                    |
| age_millions_of_years | numeric               |           | not null | 0                                  |
| name                  | character varying(30) |           | not null | 'none'::character varying          |
+-----------------------+-----------------------+-----------+----------+------------------------------------+
Indexes:
    "planet_pkey" PRIMARY KEY, btree (planet_id)
    "planet_planet_name_key" UNIQUE CONSTRAINT, btree (planet_name)
Foreign-key constraints:
    "planet_star_name_fkey" FOREIGN KEY (star_name) REFERENCES star(star_name)
Referenced by:
    TABLE "moon" CONSTRAINT "moon_planet_name_fkey" FOREIGN KEY (planet_name) REFERENCES planet(planet_name)

                     MOON

universe=> SELECT * FROM moon;
+---------+-----------+-------------+--------------+------+
| moon_id | moon_name | planet_name | crater_count | name |
+---------+-----------+-------------+--------------+------+
|       1 | Ely       | Solara      |          112 | none |
|       2 | Kyntara   | Vibra       |          238 | none |
|       3 | Aro       | Obsolis     |          154 | none |
|       4 | Phantas   | Synthia     |           89 | none |
|       5 | Rydra     | Geosyn      |          305 | none |
|       6 | Zeri      | Solara      |          214 | none |
|       7 | Moroa     | Vibra       |          168 | none |
|       8 | Kraven    | Obsolis     |          201 | none |
|       9 | Thalyn    | Synthia     |          145 | none |
|      10 | Beyra     | Geosyn      |          252 | none |
|      11 | Ceyra     | Thalmera    |          108 | none |
|      12 | Ulric     | Nyxari      |           75 | none |
|      13 | Varun     | Orra        |          198 | none |
|      14 | Tessan    | Zeph        |          172 | none |
|      15 | Helissa   | Velmara     |          230 | none |
|      16 | Jorith    | Cindross    |           82 | none |
|      17 | Emera     | Maren       |          219 | none |
|      18 | Pharex    | Zare        |          194 | none |
|      19 | Sorna     | Myrrakos    |          160 | none |
|      20 | Tyvan     | Ossyrel     |          127 | none |
+---------+-----------+-------------+--------------+------+
(20 rows)

universe=> \d moon
                                       Table "public.moon"
+--------------+-----------------------+-----------+----------+----------------------------------+
|    Column    |         Type          | Collation | Nullable |             Default              |
+--------------+-----------------------+-----------+----------+----------------------------------+
| moon_id      | integer               |           | not null | nextval('moon_id_seq'::regclass) |
| moon_name    | text                  |           |          |                                  |
| planet_name  | text                  |           |          |                                  |
| crater_count | integer               |           |          |                                  |
| name         | character varying(30) |           | not null | 'none'::character varying        |
+--------------+-----------------------+-----------+----------+----------------------------------+
Indexes:
    "moon_pkey" PRIMARY KEY, btree (moon_id)
    "moon_moon_name_key" UNIQUE CONSTRAINT, btree (moon_name)
Foreign-key constraints:
    "moon_planet_name_fkey" FOREIGN KEY (planet_name) REFERENCES planet(planet_name)

                    CREATURES

universe=> SELECT * FROM creatures;
+--------------+---------------+-----------------+------+
| creatures_id | creature_name | can_communicate | name |
+--------------+---------------+-----------------+------+
|            1 | Verdans       | t               | none |
|            2 | Runari        | t               | none |
|            3 | Echolepts     | t               | none |
|            4 | Dustborn      | t               | none |
|            5 | Golemic AI    | t               | none |
+--------------+---------------+-----------------+------+
(5 rows)

universe=> \d creatures
                                         Table "public.creatures"
+-----------------+-----------------------+-----------+----------+---------------------------------------+
|     Column      |         Type          | Collation | Nullable |                Default                |
+-----------------+-----------------------+-----------+----------+---------------------------------------+
| creatures_id    | integer               |           | not null | nextval('creatures_id_seq'::regclass) |
| creature_name   | text                  |           |          |                                       |
| can_communicate | boolean               |           | not null |                                       |
| name            | character varying(30) |           | not null | 'none'::character varying             |
+-----------------+-----------------------+-----------+----------+---------------------------------------+
Indexes:
    "creatures_pkey" PRIMARY KEY, btree (creatures_id)
    "creatures_creature_name_key" UNIQUE CONSTRAINT, btree (creature_name)
