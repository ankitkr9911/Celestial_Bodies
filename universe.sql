--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    asteroid_id bigint NOT NULL,
    name character varying(30) NOT NULL,
    diameter integer NOT NULL,
    mass integer NOT NULL,
    distance_from_earth numeric(2,1) NOT NULL,
    discovery_info text NOT NULL,
    hazardous boolean,
    is_active boolean
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
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
    galaxy_id bigint NOT NULL,
    name character varying(30) NOT NULL,
    distance integer NOT NULL,
    mass integer NOT NULL,
    type text NOT NULL,
    is_dwarf boolean,
    black_hole boolean,
    age numeric(3,1) NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
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
    moon_id bigint NOT NULL,
    name character varying(30) NOT NULL,
    mass integer,
    radius integer,
    atm_details text NOT NULL,
    has_atmosphere boolean NOT NULL,
    is_icy boolean NOT NULL,
    density numeric(3,2) NOT NULL,
    planet_id bigint NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
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
-- Name: moon_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_planet_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_planet_id_seq OWNER TO freecodecamp;

--
-- Name: moon_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_planet_id_seq OWNED BY public.moon.planet_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id bigint NOT NULL,
    name character varying(30) NOT NULL,
    distance_from_star integer NOT NULL,
    mass integer NOT NULL,
    climate text NOT NULL,
    is_habitable boolean,
    has_moons boolean,
    gravity numeric(4,2) NOT NULL,
    star_id bigint NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
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
-- Name: planet_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_star_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_star_id_seq OWNER TO freecodecamp;

--
-- Name: planet_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_star_id_seq OWNED BY public.planet.star_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id bigint NOT NULL,
    name character varying(30) NOT NULL,
    distance integer NOT NULL,
    mass integer NOT NULL,
    age integer NOT NULL,
    type text NOT NULL,
    has_planets boolean,
    is_visible boolean,
    temperature numeric(6,2) NOT NULL,
    galaxy_id bigint NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_galaxy_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: star_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_galaxy_id_seq OWNED BY public.star.galaxy_id;


--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
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
-- Name: moon planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN planet_id SET DEFAULT nextval('public.moon_planet_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN star_id SET DEFAULT nextval('public.planet_star_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: star galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN galaxy_id SET DEFAULT nextval('public.star_galaxy_id_seq'::regclass);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 946, 870, 2.7, 'Discovered in 1801', false, true);
INSERT INTO public.asteroid VALUES (2, 'Vesta', 525, 259, 1.6, 'Discovered in 1807', false, false);
INSERT INTO public.asteroid VALUES (3, 'Apophis', 370, 27, 0.9, 'Discovered in 2004', true, true);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 2537000, 1200000, 'Spiral', false, true, 10.1);
INSERT INTO public.galaxy VALUES (2, 'Milky Way', 0, 1300000, 'Spiral', false, true, 13.6);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 3000000, 500000, 'Spiral', false, false, 9.5);
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic', 160000, 10000, 'Irregular', true, false, 1.5);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 29000000, 800000, 'Spiral', false, true, 13.0);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', 23000000, 850000, 'Spiral', false, true, 1.0);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 734, 1737, 'Trace of atmosphere', true, false, 3.34, 3);
INSERT INTO public.moon VALUES (2, 'Io', 888, 1821, 'Very thin atmosphere', false, false, 3.53, 5);
INSERT INTO public.moon VALUES (3, 'Europa', 312, 1560, 'Ice-covered potential water', false, true, 3.01, 5);
INSERT INTO public.moon VALUES (4, 'Ganymede', 1480, 2634, 'Thin atmosphere', false, false, 1.94, 5);
INSERT INTO public.moon VALUES (5, 'Callisto', 1820, 2400, 'Thin atmosphere', false, false, 1.88, 5);
INSERT INTO public.moon VALUES (6, 'Titan', 1350, 2575, 'Dense atmosphere', true, true, 1.88, 6);
INSERT INTO public.moon VALUES (7, 'Rhea', 785, 763, 'Thin atmosphere', false, false, 1.23, 6);
INSERT INTO public.moon VALUES (8, 'Enceladus', 113, 504, 'Thin atmosphere', false, true, 1.09, 6);
INSERT INTO public.moon VALUES (9, 'Miranda', 66, 471, 'Very thin atmosphere', false, true, 1.20, 7);
INSERT INTO public.moon VALUES (10, 'Ariel', 451, 158, 'Thin atmosphere', false, false, 1.25, 7);
INSERT INTO public.moon VALUES (11, 'Umbriel', 391, 169, 'Thin atmosphere', false, false, 1.21, 7);
INSERT INTO public.moon VALUES (12, 'Oberon', 38, 761, 'Thin atmosphere', false, false, 1.13, 7);
INSERT INTO public.moon VALUES (13, 'Titania', 39, 788, 'Thin atmosphere', false, false, 1.10, 7);
INSERT INTO public.moon VALUES (14, 'Triton', 100, 1350, 'Thin atmosphere', false, true, 0.88, 8);
INSERT INTO public.moon VALUES (15, 'Phobos', 1, 111, 'None', false, true, 1.80, 3);
INSERT INTO public.moon VALUES (16, 'Deimos', 1, 6, 'None', false, true, 1.48, 3);
INSERT INTO public.moon VALUES (17, 'Charon', 121, 606, 'Thin atmosphere', false, true, 1.45, 4);
INSERT INTO public.moon VALUES (18, 'Haumea', 40, 570, 'None', false, true, 0.81, 4);
INSERT INTO public.moon VALUES (19, 'Makemake', 17, 715, 'None', false, true, 0.77, 4);
INSERT INTO public.moon VALUES (20, 'Eris', 27, 1163, 'None', false, true, 0.81, 4);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 57, 3300, 'Hot', false, false, 0.38, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 108, 4800, 'Hot', false, false, 0.91, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 150, 5900, 'Temperate', true, true, 1.00, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 228, 640, 'Cold', false, true, 0.38, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 778, 189800, 'Gas Giant', false, true, 24.79, 2);
INSERT INTO public.planet VALUES (6, 'Saturn', 1427, 56800, 'Gas Giant', false, true, 10.44, 2);
INSERT INTO public.planet VALUES (7, 'Uranus', 2871, 8620, 'Ice Giant', false, true, 8.69, 2);
INSERT INTO public.planet VALUES (8, 'Neptune', 4495, 10200, 'Ice Giant', false, true, 11.15, 2);
INSERT INTO public.planet VALUES (9, 'Titan', 1427, 1350, 'Cold', false, true, 1.35, 5);
INSERT INTO public.planet VALUES (10, 'Callisto', 1880, 1830, 'Cold', false, true, 1.24, 5);
INSERT INTO public.planet VALUES (11, 'Europa', 628, 310, 'Cold', false, false, 0.13, 5);
INSERT INTO public.planet VALUES (12, 'Ganymede', 1070, 1500, 'Cold', false, true, 0.15, 5);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Proxima Centauri', 4, 1, 4, 'Red Dwarf', true, true, 3050.12, 1);
INSERT INTO public.star VALUES (2, 'Sirius', 8, 2, 1, 'Binary', true, true, 9940.12, 2);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 642, 11, 8, 'Supergiant', false, true, 3500.12, 3);
INSERT INTO public.star VALUES (4, 'Rigel', 860, 21, 8, 'Supergiant', false, true, 1100.02, 4);
INSERT INTO public.star VALUES (5, 'Vega', 25, 2, 1, 'Main Sequence', true, true, 9602.12, 5);
INSERT INTO public.star VALUES (6, 'Aldebaran', 65, 1, 6, 'Red Giant', true, true, 3910.20, 6);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: moon_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_planet_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: planet_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_star_id_seq', 1, false);


--
-- Name: star_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_galaxy_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: star star_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_key UNIQUE (galaxy_id);


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
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

