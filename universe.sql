--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(60) NOT NULL,
    star_id integer NOT NULL,
    description text,
    asteroid_type character varying(30) NOT NULL,
    diameter_in_km numeric(8,2),
    discovery_year integer,
    is_near_earth boolean
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(60) NOT NULL,
    description text,
    galaxy_type character varying(30) NOT NULL,
    age_in_millions_of_years integer,
    diameter_in_light_years integer,
    distance_from_earth_mly numeric(10,3),
    has_life boolean,
    is_spherical boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(60) NOT NULL,
    planet_id integer NOT NULL,
    description text,
    diameter_in_km integer,
    discovery_year integer,
    orbital_period_in_days numeric(8,3),
    is_spherical boolean,
    has_atmosphere boolean
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(60) NOT NULL,
    star_id integer NOT NULL,
    description text,
    planet_type character varying(30) NOT NULL,
    diameter_in_km integer,
    known_moons integer,
    orbital_period_in_days numeric(12,2),
    has_atmosphere boolean,
    has_life boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(60) NOT NULL,
    galaxy_id integer NOT NULL,
    description text,
    star_type character varying(30) NOT NULL,
    age_in_millions_of_years integer,
    temperature_in_kelvin integer,
    distance_from_earth_ly numeric(12,5),
    has_planets boolean,
    is_visible_to_naked_eye boolean
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 1, 'The largest object in the asteroid belt, also a dwarf planet', 'C-type', 939.40, 1801, false);
INSERT INTO public.asteroid VALUES (2, 'Pallas', 1, 'The third largest object in the asteroid belt', 'B-type', 512.00, 1802, false);
INSERT INTO public.asteroid VALUES (3, 'Vesta', 1, 'A bright asteroid with a giant impact basin', 'V-type', 525.40, 1807, false);
INSERT INTO public.asteroid VALUES (4, 'Hygiea', 1, 'A dark asteroid that is a candidate dwarf planet', 'C-type', 434.00, 1849, false);
INSERT INTO public.asteroid VALUES (5, 'Eros', 1, 'A near-Earth asteroid visited by the NEAR Shoemaker probe', 'S-type', 16.80, 1898, true);
INSERT INTO public.asteroid VALUES (6, 'Bennu', 1, 'A near-Earth asteroid sampled by OSIRIS-REx', 'B-type', 0.49, 1999, true);
INSERT INTO public.asteroid VALUES (7, 'Ryugu', 1, 'A near-Earth asteroid sampled by Hayabusa2', 'C-type', 0.90, 1999, true);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'The barred spiral galaxy that contains our solar system', 'Barred spiral', 13600, 100000, 0.000, true, false);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'The nearest large galaxy to the Milky Way', 'Spiral', 10000, 220000, 2.537, false, false);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'A small spiral galaxy in the Local Group', 'Spiral', 10000, 60000, 2.730, false, false);
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 'A satellite galaxy of the Milky Way', 'Irregular', 13000, 14000, 0.163, false, false);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'A galaxy with a bright nucleus and a large central bulge', 'Unbarred spiral', 13000, 50000, 29.300, false, false);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', 'A grand design spiral galaxy interacting with a smaller neighbor', 'Spiral', 13000, 76000, 23.000, false, false);
INSERT INTO public.galaxy VALUES (7, 'Messier 87', 'A giant elliptical galaxy with a supermassive black hole', 'Elliptical', 13000, 120000, 53.500, false, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 'Earth''s only natural satellite', 3475, NULL, 27.322, true, false);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 'The larger and closer moon of Mars', 22, 1877, 0.319, false, false);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 'The smaller and more distant moon of Mars', 12, 1877, 1.263, false, false);
INSERT INTO public.moon VALUES (4, 'Io', 5, 'The most volcanically active body in the solar system', 3643, 1610, 1.769, true, true);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 'An icy moon with a subsurface ocean', 3122, 1610, 3.551, true, false);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 'The largest moon in the solar system', 5268, 1610, 7.155, true, false);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 'A heavily cratered moon of Jupiter', 4821, 1610, 16.689, true, false);
INSERT INTO public.moon VALUES (8, 'Amalthea', 5, 'A small, irregular, reddish inner moon of Jupiter', 167, 1892, 0.498, false, false);
INSERT INTO public.moon VALUES (9, 'Mimas', 6, 'A small moon with a very large crater', 396, 1789, 0.942, true, false);
INSERT INTO public.moon VALUES (10, 'Enceladus', 6, 'An icy moon that erupts water geysers', 504, 1789, 1.370, true, false);
INSERT INTO public.moon VALUES (11, 'Tethys', 6, 'A moon made almost entirely of water ice', 1062, 1684, 1.888, true, false);
INSERT INTO public.moon VALUES (12, 'Dione', 6, 'An icy moon of Saturn with bright ice cliffs', 1123, 1684, 2.737, true, false);
INSERT INTO public.moon VALUES (13, 'Rhea', 6, 'The second largest moon of Saturn', 1527, 1672, 4.518, true, false);
INSERT INTO public.moon VALUES (14, 'Titan', 6, 'The largest moon of Saturn, with a thick atmosphere', 5150, 1655, 15.945, true, true);
INSERT INTO public.moon VALUES (15, 'Iapetus', 6, 'A moon with one dark side and one bright side', 1469, 1671, 79.322, true, false);
INSERT INTO public.moon VALUES (16, 'Miranda', 7, 'A small moon of Uranus with varied terrain', 472, 1948, 1.413, false, false);
INSERT INTO public.moon VALUES (17, 'Ariel', 7, 'A bright moon of Uranus with canyons', 1158, 1851, 2.520, true, false);
INSERT INTO public.moon VALUES (18, 'Umbriel', 7, 'A dark, heavily cratered moon of Uranus', 1169, 1851, 4.144, true, false);
INSERT INTO public.moon VALUES (19, 'Titania', 7, 'The largest moon of Uranus', 1577, 1787, 8.706, true, false);
INSERT INTO public.moon VALUES (20, 'Oberon', 7, 'The outermost large moon of Uranus', 1523, 1787, 13.463, true, false);
INSERT INTO public.moon VALUES (21, 'Triton', 8, 'The largest moon of Neptune, orbiting in a retrograde direction', 2707, 1846, 5.877, true, true);
INSERT INTO public.moon VALUES (22, 'Nereid', 8, 'An irregular moon of Neptune with a very eccentric orbit', 340, 1949, 360.140, false, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 'The smallest planet and the closest to the Sun', 'Terrestrial', 4879, 0, 87.97, false, false);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 'A hot planet with a thick carbon dioxide atmosphere', 'Terrestrial', 12104, 0, 224.70, true, false);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 'The only planet known to support life', 'Terrestrial', 12742, 1, 365.25, true, true);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 'A cold desert planet with a thin atmosphere', 'Terrestrial', 6779, 2, 687.00, true, false);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 'The largest planet in the solar system', 'Gas giant', 139820, 95, 4332.60, true, false);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 'A gas giant known for its extensive ring system', 'Gas giant', 116460, 146, 10759.00, true, false);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 'An ice giant that rotates on its side', 'Ice giant', 50724, 28, 30688.50, true, false);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 'The most distant planet from the Sun', 'Ice giant', 49244, 16, 60182.00, true, false);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', 2, 'A rocky exoplanet in the habitable zone of Proxima Centauri', 'Terrestrial', 13600, 0, 11.19, false, false);
INSERT INTO public.planet VALUES (10, '51 Pegasi b', 3, 'A hot Jupiter that orbits very close to its star', 'Hot Jupiter', 190000, 0, 4.23, false, false);
INSERT INTO public.planet VALUES (11, 'TRAPPIST-1e', 4, 'A rocky planet in the habitable zone of TRAPPIST-1', 'Terrestrial', 11720, 0, 6.10, false, false);
INSERT INTO public.planet VALUES (12, 'TRAPPIST-1f', 4, 'A rocky planet in the outer part of the TRAPPIST-1 habitable zone', 'Terrestrial', 13300, 0, 9.21, false, false);
INSERT INTO public.planet VALUES (13, 'Kepler-452b', 5, 'A super-Earth with an orbit close to that of Earth', 'Super-Earth', 20400, 0, 384.80, false, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'The star at the center of our solar system', 'G-type main sequence', 4600, 5772, 0.00002, true, true);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, 'The closest known star to the Sun', 'M-type red dwarf', 4850, 3042, 4.24000, true, false);
INSERT INTO public.star VALUES (3, '51 Pegasi', 1, 'The first Sun-like star found to host an exoplanet', 'G-type main sequence', 4800, 5790, 50.90000, true, true);
INSERT INTO public.star VALUES (4, 'TRAPPIST-1', 1, 'An ultracool dwarf with seven known Earth-sized planets', 'M-type ultracool dwarf', 7600, 2566, 40.70000, true, false);
INSERT INTO public.star VALUES (5, 'Kepler-452', 1, 'A Sun-like star hosting a possible super-Earth', 'G-type main sequence', 6000, 5757, 1402.00000, true, false);
INSERT INTO public.star VALUES (6, 'Sirius A', 1, 'The brightest star in the night sky', 'A-type main sequence', 242, 9940, 8.60000, false, true);
INSERT INTO public.star VALUES (7, 'Betelgeuse', 1, 'A red supergiant in the constellation Orion', 'M-type red supergiant', 10, 3600, 550.00000, false, true);
INSERT INTO public.star VALUES (8, 'R136a1', 4, 'One of the most massive and luminous stars known', 'Wolf-Rayet', 1, 46000, 163000.00000, false, false);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 7, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: asteroid asteroid_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

