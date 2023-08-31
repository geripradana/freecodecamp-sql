--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying,
    galaxy_cluster_id integer NOT NULL,
    galaxy_type text,
    number_of_stars_in_millions integer NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_cluster; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_cluster (
    name character varying,
    galaxy_cluster_id integer NOT NULL,
    distance_from_earth_in_megaparsecs numeric(7,3) NOT NULL
);


ALTER TABLE public.galaxy_cluster OWNER TO freecodecamp;

--
-- Name: galaxy_cluster_galaxy_cluster_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_cluster_galaxy_cluster_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_cluster_galaxy_cluster_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_cluster_galaxy_cluster_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_cluster_galaxy_cluster_id_seq OWNED BY public.galaxy_cluster.galaxy_cluster_id;


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
    name character varying,
    distance_from_planet_in_au numeric(7,6) NOT NULL,
    moon_diameter_in_km numeric(6,2) NOT NULL,
    planet_id integer
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
    name character varying,
    distance_from_earth_in_million_km numeric(12,2) NOT NULL,
    planet_mass_in_earth_mass numeric NOT NULL,
    planet_color text,
    potentially_habitable boolean NOT NULL,
    star_id integer NOT NULL
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
    name character varying,
    bigger_than_the_sun boolean NOT NULL,
    galaxy_id integer NOT NULL,
    age_in_million_years integer NOT NULL
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_cluster galaxy_cluster_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_cluster ALTER COLUMN galaxy_cluster_id SET DEFAULT nextval('public.galaxy_cluster_galaxy_cluster_id_seq'::regclass);


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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 4, 'Spiral', 100);
INSERT INTO public.galaxy VALUES (2, 'NGC 4889', 5, 'Elliptical', 100);
INSERT INTO public.galaxy VALUES (3, 'NGC 1365', 6, 'Barred Spiral', 10);
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 7, 'Elliptical', 200);
INSERT INTO public.galaxy VALUES (5, 'Centaurus A', 8, 'Spiral', 100);
INSERT INTO public.galaxy VALUES (6, 'NGC 3311', 9, 'Elliptical', 100);


--
-- Data for Name: galaxy_cluster; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_cluster VALUES ('Bullet Cluster', 1, 1141.000);
INSERT INTO public.galaxy_cluster VALUES ('Musket Ball Cluster', 2, 2.500);
INSERT INTO public.galaxy_cluster VALUES ('Pandoras Cluster', 3, 1.221);
INSERT INTO public.galaxy_cluster VALUES ('Virgo Cluster', 4, 16.500);
INSERT INTO public.galaxy_cluster VALUES ('Coma Cluster', 5, 99.000);
INSERT INTO public.galaxy_cluster VALUES ('Fornax Cluster', 6, 19.000);
INSERT INTO public.galaxy_cluster VALUES ('Perseus Cluster', 7, 53.500);
INSERT INTO public.galaxy_cluster VALUES ('Centaurus A', 8, 3.800);
INSERT INTO public.galaxy_cluster VALUES ('Hydra Cluster', 9, 51.000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'The Moon', 0.002570, 3475.00, 4);
INSERT INTO public.moon VALUES (2, 'Deimos', 0.001400, 12.40, 3);
INSERT INTO public.moon VALUES (3, 'Phobos', 0.000940, 22.50, 3);
INSERT INTO public.moon VALUES (4, 'Adrastea', 0.000129, 16.00, 5);
INSERT INTO public.moon VALUES (5, 'Aitne', 0.028000, 3.00, 5);
INSERT INTO public.moon VALUES (6, 'Amalthea', 0.018100, 146.00, 5);
INSERT INTO public.moon VALUES (7, 'Io', 0.420000, 3643.20, 5);
INSERT INTO public.moon VALUES (8, 'Europa', 0.670000, 3122.80, 5);
INSERT INTO public.moon VALUES (9, 'Ganymede', 1.070000, 5268.20, 5);
INSERT INTO public.moon VALUES (10, 'Callisto', 1.880000, 4800.00, 5);
INSERT INTO public.moon VALUES (11, 'Titan', 1.220000, 5150.00, 6);
INSERT INTO public.moon VALUES (12, 'Rhea', 0.523000, 1528.00, 6);
INSERT INTO public.moon VALUES (13, 'Iapetus', 0.356000, 1470.00, 6);
INSERT INTO public.moon VALUES (14, 'Dione', 3.770000, 1123.00, 6);
INSERT INTO public.moon VALUES (15, 'Tethys', 2.950000, 1062.00, 6);
INSERT INTO public.moon VALUES (16, 'Encleadus', 2.380000, 504.00, 6);
INSERT INTO public.moon VALUES (17, 'Mimas', 1.870000, 396.00, 6);
INSERT INTO public.moon VALUES (18, 'Miranda', 0.000780, 472.00, 7);
INSERT INTO public.moon VALUES (19, 'Ariel', 0.000670, 1160.00, 7);
INSERT INTO public.moon VALUES (20, 'Naiad', 0.000045, 58.00, 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 92.00, 0.0553, 'Gray', false, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 41.00, 0.815, 'Yellowish-white', false, 1);
INSERT INTO public.planet VALUES (3, 'Mars', 78.00, 0.107, 'Red', true, 1);
INSERT INTO public.planet VALUES (4, 'Earth', 0.00, 1, 'Blue and Green', true, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 629.00, 317.8, 'Orange and White', false, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 1275.00, 95.2, 'Pale Gold', false, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 2723.00, 14.5, 'Pale blue-green', false, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 4351.00, 17.1, 'Deep Blue', false, 1);
INSERT INTO public.planet VALUES (9, 'Kepler-22b', 6054867502.45, 9.1, 'Greenish-blue', true, 7);
INSERT INTO public.planet VALUES (10, 'Proxima Centauri b', 39735067.98, 1.07, NULL, false, 4);
INSERT INTO public.planet VALUES (11, 'Proxima Centauri d', 39735067.98, 0.26, NULL, false, 4);
INSERT INTO public.planet VALUES (13, 'Proxima Centauri c', 39735067.98, 7, NULL, false, 4);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'The Sun', false, 1, 4600);
INSERT INTO public.star VALUES (2, 'Sirius', true, 1, 200);
INSERT INTO public.star VALUES (3, 'Betelgeuse', true, 1, 8);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', false, 1, 4850);
INSERT INTO public.star VALUES (5, 'Alpha Centauri A', true, 1, 6000);
INSERT INTO public.star VALUES (6, 'Antares', true, 1, 12);
INSERT INTO public.star VALUES (7, 'Kepler-22', false, 1, 7000);


--
-- Name: galaxy_cluster_galaxy_cluster_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_cluster_galaxy_cluster_id_seq', 9, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: galaxy_cluster galaxy_cluster_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_cluster
    ADD CONSTRAINT galaxy_cluster_name UNIQUE (name);


--
-- Name: galaxy_cluster galaxy_cluster_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_cluster
    ADD CONSTRAINT galaxy_cluster_pkey PRIMARY KEY (galaxy_cluster_id);


--
-- Name: galaxy galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: galaxy galaxy_cluster_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_cluster_id FOREIGN KEY (galaxy_cluster_id) REFERENCES public.galaxy_cluster(galaxy_cluster_id);


--
-- Name: star galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon moon_planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

