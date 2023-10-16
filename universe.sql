--
-- PostgreSQL database dump
--

-- Dumped from database version 12.16 (Ubuntu 12.16-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.16 (Ubuntu 12.16-0ubuntu0.20.04.1)

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
    name character varying(255) NOT NULL,
    size integer NOT NULL,
    type text,
    has_black_hole boolean NOT NULL,
    discovered boolean
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
    name character varying(255) NOT NULL,
    type character varying(50),
    diameter integer,
    is_inhabited boolean NOT NULL,
    atmosphere boolean NOT NULL,
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
    name character varying(255) NOT NULL,
    type character varying(50),
    radius integer NOT NULL,
    gravity numeric NOT NULL,
    has_water boolean NOT NULL,
    star_id integer
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
-- Name: satellite; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.satellite (
    satellite_id integer NOT NULL,
    name character varying(255) NOT NULL,
    purpose text,
    launch_date date,
    is_active boolean NOT NULL,
    planet_id integer
);


ALTER TABLE public.satellite OWNER TO freecodecamp;

--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.satellite_satellite_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.satellite_satellite_id_seq OWNER TO freecodecamp;

--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.satellite_satellite_id_seq OWNED BY public.satellite.satellite_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(255) NOT NULL,
    type character varying(50),
    age bigint,
    mass numeric NOT NULL,
    is_supernova boolean NOT NULL,
    galaxy_id integer
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
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: satellite satellite_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite ALTER COLUMN satellite_id SET DEFAULT nextval('public.satellite_satellite_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 100000, 'Spiral', true, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 120000, 'Spiral', false, false);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 50000, 'Irregular', false, true);
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 150000, 'Elliptical', true, true);
INSERT INTO public.galaxy VALUES (5, 'Centaurus A', 60000, 'Elliptical', false, false);
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 70000, 'Spiral', false, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 'Terrestrial', 3474, false, false, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Irregular', 22, false, false, 2);
INSERT INTO public.moon VALUES (3, 'Europa', 'Ice Moon', 3122, false, false, 3);
INSERT INTO public.moon VALUES (4, 'Titan', 'Giant Moon', 5150, false, true, 4);
INSERT INTO public.moon VALUES (5, 'Triton', 'Cold Triton', 2705, false, false, 5);
INSERT INTO public.moon VALUES (6, 'Callisto', 'Ice Moon', 4800, false, false, 4);
INSERT INTO public.moon VALUES (7, 'Enceladus', 'Ice Moon', 504, false, true, 5);
INSERT INTO public.moon VALUES (8, 'Ganymede', 'Giant Moon', 5262, false, false, 1);
INSERT INTO public.moon VALUES (9, 'Oberon', 'Cold Triton', 1523, false, false, 3);
INSERT INTO public.moon VALUES (10, 'Charon', 'Pluto Moon', 1207, false, false, 2);
INSERT INTO public.moon VALUES (11, 'Deimos', 'Irregular', 12, false, false, 2);
INSERT INTO public.moon VALUES (12, 'Iapetus', 'Two-Faced', 1468, false, false, 4);
INSERT INTO public.moon VALUES (13, 'Rhea', 'Ice Moon', 1528, false, false, 5);
INSERT INTO public.moon VALUES (14, 'Dione', 'Ice Moon', 1123, false, false, 3);
INSERT INTO public.moon VALUES (15, 'Miranda', 'Umbriel Moon', 472, false, false, 2);
INSERT INTO public.moon VALUES (16, 'Ariel', 'Umbriel Moon', 1158, false, false, 3);
INSERT INTO public.moon VALUES (17, 'Titania', 'Cold Triton', 1578, false, false, 1);
INSERT INTO public.moon VALUES (18, 'Umbriel', 'Umbriel Moon', 1169, false, false, 2);
INSERT INTO public.moon VALUES (19, 'Io', 'Volcanic', 3637, false, true, 3);
INSERT INTO public.moon VALUES (20, 'Mimas', 'Cratered Moon', 396, false, false, 4);
INSERT INTO public.moon VALUES (21, 'Hyperion', 'Irregular', 360, false, false, 5);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'Terrestrial', 6371, 9.8, true, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 'Terrestrial', 3389, 3.7, false, 1);
INSERT INTO public.planet VALUES (3, 'Jupiter', 'Gas Giant', 69911, 24.79, false, 4);
INSERT INTO public.planet VALUES (4, 'Saturn', 'Gas Giant', 58232, 10.44, false, 5);
INSERT INTO public.planet VALUES (5, 'Neptune', 'Ice Giant', 24622, 11.15, true, 2);
INSERT INTO public.planet VALUES (6, 'Kepler-186f', 'Exoplanet', 8440, 1.75, false, 3);
INSERT INTO public.planet VALUES (7, 'Gliese 581g', 'Exoplanet', 19500, 1.1, true, 2);
INSERT INTO public.planet VALUES (8, 'WASP-121b', 'Exoplanet', 16127, 3.8, false, 4);
INSERT INTO public.planet VALUES (9, 'HD 209458 b', 'Exoplanet', 9373, 9.32, true, 1);
INSERT INTO public.planet VALUES (10, '55 Cancri e', 'Exoplanet', 8160, 12.63, false, 2);
INSERT INTO public.planet VALUES (11, 'GJ 1214 b', 'Exoplanet', 27395, 1.87, true, 3);
INSERT INTO public.planet VALUES (12, 'K2-18b', 'Exoplanet', 12885, 5.68, false, 5);


--
-- Data for Name: satellite; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.satellite VALUES (1, 'Hubble Space Telescope', 'Observation', '1990-04-24', true, 1);
INSERT INTO public.satellite VALUES (2, 'ISS', 'Space Station', '1998-11-20', true, 3);
INSERT INTO public.satellite VALUES (3, 'GPS IIR-20(M)', 'Navigation', '2009-03-24', true, 4);
INSERT INTO public.satellite VALUES (4, 'Landsat 8', 'Earth Observation', '2013-02-11', true, 1);
INSERT INTO public.satellite VALUES (5, 'Tiangong', 'Space Laboratory', '2011-09-29', true, 2);
INSERT INTO public.satellite VALUES (6, 'Mars Reconnaissance Orbiter', 'Mars Exploration', '2005-08-12', true, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'G-type', 5000000000, 1989000000000000000000000000000, false, 1);
INSERT INTO public.star VALUES (2, 'Alpha Centauri A', 'G-type', 6000000000, 2200000000000000000000000000000, false, 1);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 'M-type', 8000000000, 70000000000000000000000000000000, true, 5);
INSERT INTO public.star VALUES (4, 'Sirius', 'A-type', 200000000, 2020000000000000000000000000000, false, 1);
INSERT INTO public.star VALUES (5, 'Proxima Centauri', 'M-type', 4000000000, 240000000000000000000000000000, false, 1);
INSERT INTO public.star VALUES (6, 'Rigel', 'B-type', 9000000000, 25000000000000000000000000000000, false, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.satellite_satellite_id_seq', 6, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: satellite satellite_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_name_key UNIQUE (name);


--
-- Name: satellite satellite_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_pkey PRIMARY KEY (satellite_id);


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
-- Name: satellite satellite_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

