--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.5
-- Dumped by pg_dump version 9.6.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
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


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: Contact; Type: TABLE; Schema: public; Owner: olivetree
--

CREATE TABLE "Contact" (
    id integer NOT NULL,
    type character varying,
    value character varying,
    user_id numeric
);


ALTER TABLE "Contact" OWNER TO olivetree;

--
-- Name: Contact_id_seq; Type: SEQUENCE; Schema: public; Owner: olivetree
--

CREATE SEQUENCE "Contact_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Contact_id_seq" OWNER TO olivetree;

--
-- Name: Contact_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: olivetree
--

ALTER SEQUENCE "Contact_id_seq" OWNED BY "Contact".id;


--
-- Name: User; Type: TABLE; Schema: public; Owner: olivetree
--

CREATE TABLE "User" (
    id numeric NOT NULL,
    first_name character varying,
    last_name character varying,
    date_of_birth date,
    biography character varying
);


ALTER TABLE "User" OWNER TO olivetree;

--
-- Name: User_id_seq; Type: SEQUENCE; Schema: public; Owner: olivetree
--

CREATE SEQUENCE "User_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "User_id_seq" OWNER TO olivetree;

--
-- Name: User_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: olivetree
--

ALTER SEQUENCE "User_id_seq" OWNED BY "User".id;


--
-- Name: Contact id; Type: DEFAULT; Schema: public; Owner: olivetree
--

ALTER TABLE ONLY "Contact" ALTER COLUMN id SET DEFAULT nextval('"Contact_id_seq"'::regclass);


--
-- Name: User id; Type: DEFAULT; Schema: public; Owner: olivetree
--

ALTER TABLE ONLY "User" ALTER COLUMN id SET DEFAULT nextval('"User_id_seq"'::regclass);


--
-- Data for Name: Contact; Type: TABLE DATA; Schema: public; Owner: olivetree
--

COPY "Contact" (id, type, value, user_id) FROM stdin;
1	email	kyle.coberly@galvanize.com	3
2	email	cj.reynolds@galvanize.com	4
3	email	danny.fritz@galvanize.com	5
4	email	roberto.ortega@galvanize.com	6
5	home	0	5
6	mobile	911	3
\.


--
-- Name: Contact_id_seq; Type: SEQUENCE SET; Schema: public; Owner: olivetree
--

SELECT pg_catalog.setval('"Contact_id_seq"', 6, true);


--
-- Data for Name: User; Type: TABLE DATA; Schema: public; Owner: olivetree
--

COPY "User" (id, first_name, last_name, date_of_birth, biography) FROM stdin;
3	Kyle	Coberly	1961-02-18	Web app developer, business dork, amateur economist
4	CJ	Reynolds	2031-04-28	Does the man have the moustache, or does the moustache have the man?
5	Danny	Fritz	1805-09-15	Definitely a human instructor, not a robot.
6	Roberto	Ortega	2015-10-17	Llamas age faster than people
\.


--
-- Name: User_id_seq; Type: SEQUENCE SET; Schema: public; Owner: olivetree
--

SELECT pg_catalog.setval('"User_id_seq"', 6, true);


--
-- Name: User User_pkey; Type: CONSTRAINT; Schema: public; Owner: olivetree
--

ALTER TABLE ONLY "User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (id);


--
-- Name: Contact Contact_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: olivetree
--

ALTER TABLE ONLY "Contact"
    ADD CONSTRAINT "Contact_user_id_fkey" FOREIGN KEY (user_id) REFERENCES "User"(id) ON DELETE CASCADE;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: galvanize_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE galvanize_admin IN SCHEMA public REVOKE ALL ON TABLES  FROM galvanize_admin;
ALTER DEFAULT PRIVILEGES FOR ROLE galvanize_admin IN SCHEMA public GRANT SELECT,INSERT,DELETE,UPDATE ON TABLES  TO galvanize_admin;


--
-- PostgreSQL database dump complete
--

