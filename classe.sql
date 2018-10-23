--
-- PostgreSQL database dump
--

-- Dumped from database version 10.5 (Ubuntu 10.5-0ubuntu0.18.04)
-- Dumped by pg_dump version 10.5 (Ubuntu 10.5-0ubuntu0.18.04)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: classe; Type: TABLE; Schema: public; Owner: dani
--

CREATE TABLE public.classe (
    id integer NOT NULL,
    nom character varying(20) NOT NULL,
    cognoms character varying(50) NOT NULL,
    matricula integer NOT NULL
);


ALTER TABLE public.classe OWNER TO dani;

--
-- Data for Name: classe; Type: TABLE DATA; Schema: public; Owner: dani
--

COPY public.classe (id, nom, cognoms, matricula) FROM stdin;
1	PENELOPE	GUINESS	857467
2	NICK	WAHLBERG	234525
52	CARMEN	HUNT	52345
53	MENA	TEMPLE	523454
54	PENELOPE	PINKETT	5234543
55	FAY	KILMER	52345433
56	DAN	HARRIS	34634
57	JUDE	CRUISE	346341
58	CHRISTIAN	AKROYD	3463413
59	DUSTIN	TAUTOU	34634134
60	HENRY	BERRY	346341345
61	CHRISTIAN	NEESON	456784
62	JAYNE	NEESON	4567844
63	CAMERON	WRAY	45678445
\.


--
-- Name: classe classe_id_key; Type: CONSTRAINT; Schema: public; Owner: dani
--

ALTER TABLE ONLY public.classe
    ADD CONSTRAINT classe_id_key UNIQUE (id);


--
-- PostgreSQL database dump complete
--

