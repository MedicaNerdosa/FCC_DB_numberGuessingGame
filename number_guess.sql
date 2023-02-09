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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22),
    games_played integer,
    best_game integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (3, 'test2', 12, 28);
INSERT INTO public.users VALUES (15, 'user_1675953370332', 2, 399);
INSERT INTO public.users VALUES (14, 'user_1675953370333', 5, 537);
INSERT INTO public.users VALUES (1, 'test1', 17, 38);
INSERT INTO public.users VALUES (29, 'user_1675953557417', 2, 225);
INSERT INTO public.users VALUES (4, 'test3', 4, 3);
INSERT INTO public.users VALUES (17, 'user_1675953404961', 2, 935);
INSERT INTO public.users VALUES (28, 'user_1675953557418', 5, 238);
INSERT INTO public.users VALUES (6, 'user_1675952900072', 2, 203);
INSERT INTO public.users VALUES (16, 'user_1675953404962', 5, 65);
INSERT INTO public.users VALUES (5, 'user_1675952900073', 5, 33);
INSERT INTO public.users VALUES (8, 'user_1675952946263', 2, 257);
INSERT INTO public.users VALUES (19, 'user_1675953419253', 2, 338);
INSERT INTO public.users VALUES (7, 'user_1675952946264', 5, 454);
INSERT INTO public.users VALUES (31, 'user_1675953576433', 2, 35);
INSERT INTO public.users VALUES (18, 'user_1675953419254', 5, 19);
INSERT INTO public.users VALUES (10, 'user_1675953024660', 2, 361);
INSERT INTO public.users VALUES (9, 'user_1675953024661', 5, 149);
INSERT INTO public.users VALUES (11, 'test4', 1, 10);
INSERT INTO public.users VALUES (30, 'user_1675953576434', 5, 56);
INSERT INTO public.users VALUES (21, 'user_1675953475324', 2, 72);
INSERT INTO public.users VALUES (13, 'user_1675953294034', 2, 28);
INSERT INTO public.users VALUES (20, 'user_1675953475325', 5, 61);
INSERT INTO public.users VALUES (12, 'user_1675953294035', 5, 135);
INSERT INTO public.users VALUES (33, 'user_1675953591186', 2, 689);
INSERT INTO public.users VALUES (23, 'user_1675953501142', 2, 699);
INSERT INTO public.users VALUES (22, 'user_1675953501143', 5, 82);
INSERT INTO public.users VALUES (32, 'user_1675953591187', 5, 95);
INSERT INTO public.users VALUES (25, 'user_1675953530894', 2, 110);
INSERT INTO public.users VALUES (24, 'user_1675953530895', 5, 186);
INSERT INTO public.users VALUES (35, 'user_1675953662741', 2, 13);
INSERT INTO public.users VALUES (27, 'user_1675953540555', 2, 38);
INSERT INTO public.users VALUES (34, 'user_1675953662742', 5, 127);
INSERT INTO public.users VALUES (26, 'user_1675953540556', 5, 402);
INSERT INTO public.users VALUES (37, 'user_1675953678135', 2, 122);
INSERT INTO public.users VALUES (36, 'user_1675953678136', 5, 39);
INSERT INTO public.users VALUES (39, 'user_1675953684679', 2, 155);
INSERT INTO public.users VALUES (38, 'user_1675953684680', 5, 28);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 39, true);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--

