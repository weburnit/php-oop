--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.8
-- Dumped by pg_dump version 9.5.8

SET statement_timeout = 0;
SET lock_timeout = 0;
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
-- Name: activities; Type: TABLE; Schema: public; Owner: evently_user
--

CREATE TABLE activities (
    id bigint NOT NULL,
    name character varying(191) NOT NULL,
    slug character varying(191) NOT NULL,
    description text NOT NULL,
    price double precision NOT NULL,
    image text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    fk_event bigint NOT NULL,
    fk_vendor bigint NOT NULL
);


ALTER TABLE activities OWNER TO evently_user;

--
-- Name: activities_id_seq; Type: SEQUENCE; Schema: public; Owner: evently_user
--

CREATE SEQUENCE activities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE activities_id_seq OWNER TO evently_user;

--
-- Name: activities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: evently_user
--

ALTER SEQUENCE activities_id_seq OWNED BY activities.id;


--
-- Name: attendee; Type: TABLE; Schema: public; Owner: evently_user
--

CREATE TABLE attendee (
    id bigint NOT NULL,
    name character varying(191) NOT NULL,
    email character varying(191) NOT NULL,
    dob date NOT NULL,
    location bigint,
    fk_event bigint NOT NULL,
    network character varying(128),
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    tier smallint DEFAULT '1'::smallint NOT NULL
);


ALTER TABLE attendee OWNER TO evently_user;

--
-- Name: attendee_id_seq; Type: SEQUENCE; Schema: public; Owner: evently_user
--

CREATE SEQUENCE attendee_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE attendee_id_seq OWNER TO evently_user;

--
-- Name: attendee_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: evently_user
--

ALTER SEQUENCE attendee_id_seq OWNED BY attendee.id;


--
-- Name: codes; Type: TABLE; Schema: public; Owner: evently_user
--

CREATE TABLE codes (
    id bigint NOT NULL,
    value character varying(32) NOT NULL,
    active boolean NOT NULL,
    fk_event bigint NOT NULL,
    fk_code bigint,
    type smallint DEFAULT '1'::smallint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    image text,
    fk_attendee bigint NOT NULL
);


ALTER TABLE codes OWNER TO evently_user;

--
-- Name: codes_activities; Type: TABLE; Schema: public; Owner: evently_user
--

CREATE TABLE codes_activities (
    code_id bigint NOT NULL,
    activity_id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE codes_activities OWNER TO evently_user;

--
-- Name: codes_id_seq; Type: SEQUENCE; Schema: public; Owner: evently_user
--

CREATE SEQUENCE codes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE codes_id_seq OWNER TO evently_user;

--
-- Name: codes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: evently_user
--

ALTER SEQUENCE codes_id_seq OWNED BY codes.id;


--
-- Name: events; Type: TABLE; Schema: public; Owner: evently_user
--

CREATE TABLE events (
    id bigint NOT NULL,
    name character varying(191) NOT NULL,
    slug character varying(191) NOT NULL,
    description text NOT NULL,
    price double precision NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    fk_vendor bigint NOT NULL,
    image text
);


ALTER TABLE events OWNER TO evently_user;

--
-- Name: events_id_seq; Type: SEQUENCE; Schema: public; Owner: evently_user
--

CREATE SEQUENCE events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE events_id_seq OWNER TO evently_user;

--
-- Name: events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: evently_user
--

ALTER SEQUENCE events_id_seq OWNED BY events.id;


--
-- Name: migrations; Type: TABLE; Schema: public; Owner: evently_user
--

CREATE TABLE migrations (
    id bigint NOT NULL,
    migration character varying(191) NOT NULL,
    batch bigint NOT NULL
);


ALTER TABLE migrations OWNER TO evently_user;

--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: evently_user
--

CREATE SEQUENCE migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE migrations_id_seq OWNER TO evently_user;

--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: evently_user
--

ALTER SEQUENCE migrations_id_seq OWNED BY migrations.id;


--
-- Name: password_resets; Type: TABLE; Schema: public; Owner: evently_user
--

CREATE TABLE password_resets (
    email character varying(191) NOT NULL,
    token character varying(191) NOT NULL,
    created_at timestamp with time zone
);


ALTER TABLE password_resets OWNER TO evently_user;

--
-- Name: roles; Type: TABLE; Schema: public; Owner: evently_user
--

CREATE TABLE roles (
    id bigint NOT NULL,
    name character varying(191) NOT NULL,
    weight smallint DEFAULT '0'::smallint NOT NULL
);


ALTER TABLE roles OWNER TO evently_user;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: evently_user
--

CREATE SEQUENCE roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE roles_id_seq OWNER TO evently_user;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: evently_user
--

ALTER SEQUENCE roles_id_seq OWNED BY roles.id;


--
-- Name: social_accounts; Type: TABLE; Schema: public; Owner: evently_user
--

CREATE TABLE social_accounts (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    provider character varying(32) NOT NULL,
    provider_id character varying(191) NOT NULL,
    token character varying(191),
    avatar character varying(191),
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE social_accounts OWNER TO evently_user;

--
-- Name: social_accounts_id_seq; Type: SEQUENCE; Schema: public; Owner: evently_user
--

CREATE SEQUENCE social_accounts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE social_accounts_id_seq OWNER TO evently_user;

--
-- Name: social_accounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: evently_user
--

ALTER SEQUENCE social_accounts_id_seq OWNED BY social_accounts.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: evently_user
--

CREATE TABLE users (
    id bigint NOT NULL,
    name character varying(191) NOT NULL,
    email character varying(191) NOT NULL,
    password character varying(191) NOT NULL,
    active smallint DEFAULT '1'::smallint NOT NULL,
    confirmation_code character(36),
    confirmed boolean DEFAULT true NOT NULL,
    remember_token character varying(100),
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    deleted_at timestamp with time zone
);


ALTER TABLE users OWNER TO evently_user;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: evently_user
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO evently_user;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: evently_user
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: users_roles; Type: TABLE; Schema: public; Owner: evently_user
--

CREATE TABLE users_roles (
    user_id bigint NOT NULL,
    role_id bigint NOT NULL
);


ALTER TABLE users_roles OWNER TO evently_user;

--
-- Name: id; Type: DEFAULT; Schema: public; Owner: evently_user
--

ALTER TABLE ONLY activities ALTER COLUMN id SET DEFAULT nextval('activities_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: evently_user
--

ALTER TABLE ONLY attendee ALTER COLUMN id SET DEFAULT nextval('attendee_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: evently_user
--

ALTER TABLE ONLY codes ALTER COLUMN id SET DEFAULT nextval('codes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: evently_user
--

ALTER TABLE ONLY events ALTER COLUMN id SET DEFAULT nextval('events_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: evently_user
--

ALTER TABLE ONLY migrations ALTER COLUMN id SET DEFAULT nextval('migrations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: evently_user
--

ALTER TABLE ONLY roles ALTER COLUMN id SET DEFAULT nextval('roles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: evently_user
--

ALTER TABLE ONLY social_accounts ALTER COLUMN id SET DEFAULT nextval('social_accounts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: evently_user
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: activities; Type: TABLE DATA; Schema: public; Owner: evently_user
--

COPY activities (id, name, slug, description, price, image, created_at, updated_at, fk_event, fk_vendor) FROM stdin;
2	Racing Event	DQu3ul	Racing Event	12	phpPcWTTf	2017-08-02 11:27:13+00	2017-08-02 11:27:13+00	1	2
3	Gold Activity	vghAuX	Gold Vendor	123	phpp6MWeb	2017-08-03 16:10:14+00	2017-08-03 16:10:14+00	1	3
4	Coffee Ninjas - Free Food	D9ijsn	blah blah blah blah	1	php51crnM	2017-08-04 07:04:42+00	2017-08-04 07:04:42+00	1	4
5	99 Drones - Plane Flying Experience	M9F6tR	fly drones	1	phpsnyTdA	2017-08-04 07:08:07+00	2017-08-04 07:08:07+00	1	5
6	test james activity 1	zvsMfV	its a test activity by james	0	phpcXQGNG	2017-08-05 17:02:16+00	2017-08-05 17:02:16+00	1	2
7	Drones Workshop	DRhDIl	Workshop by 65Drones	0		2017-08-12 02:53:17+00	2017-08-12 02:53:34+00	1	1
43	Caffeinated - $0.50 discount	yri6sA	$0.50 off all items	0	\N	2017-08-14 14:09:22+00	2017-08-14 14:09:22+00	1	14
44	Caffeinated -  Sample Redemption	r0hriy	Coffee Brew	0	\N	2017-08-14 14:10:59+00	2017-08-14 14:10:59+00	1	14
45	Eye Candy - $0.50 discount	Gvs2Ik	$0.50 off all items	0	\N	2017-08-14 14:11:25+00	2017-08-14 14:11:25+00	1	15
46	Eye Candy - Sample Redemption	BrtPsv	Unicorn popcorn	0	\N	2017-08-14 14:12:39+00	2017-08-14 14:12:39+00	1	15
47	Local Motion - $0.50 discount	G9FAuk	$0.50 off all items	0	\N	2017-08-14 14:13:10+00	2017-08-14 14:13:10+00	1	17
48	Local Motion - Sample Redemption	GRtWsW	Honey Roasted Vegetables	0	\N	2017-08-14 14:13:46+00	2017-08-14 14:13:46+00	1	17
49	Back to Basics - $0.50 discount	r2t8f4	$0.50 off all items	0	\N	2017-08-14 14:14:17+00	2017-08-14 14:14:17+00	1	16
50	Back to Basics - Sample Redemption	rkf2uz	Minted Ginger Watermelon Soup	0	\N	2017-08-14 14:15:17+00	2017-08-14 14:15:17+00	1	16
51	Archipelago $0.50 discount	r0hDtz	$0.50 off all items	0		2017-08-14 14:16:47+00	2017-08-14 14:19:29+00	1	13
52	Archipelago Brewery - Sample Redemption	M7I2iR	Sibeh Ho Witbier	0	\N	2017-08-14 14:19:12+00	2017-08-14 14:19:12+00	1	13
54	HIC $1 discount	y8h6sP	$1 off all items	0	\N	2017-08-14 14:21:15+00	2017-08-14 14:21:15+00	1	12
55	HIC - Sample Redemption	NEHEFz	Juices	0	\N	2017-08-14 14:22:11+00	2017-08-14 14:22:11+00	1	12
56	Forever Shiok - Sample Redemption	vQtEiX	Corn Chips	0	\N	2017-08-14 14:22:44+00	2017-08-14 14:22:44+00	1	8
57	Veganburg $1 food discount	ERfgFy	$1 off food items	0	\N	2017-08-14 14:24:07+00	2017-08-14 14:24:07+00	1	11
58	VeganBurg - Sample Redemption	BBfRCr	BBQ franks	0	\N	2017-08-14 14:24:52+00	2017-08-14 14:24:52+00	1	11
59	SmokeOut $0.50 discount	zBHGiX	$0.50 off all items	0	\N	2017-08-14 14:25:50+00	2017-08-14 14:25:50+00	1	9
60	SmokeOut - Sample Redemption	K6FBFp	Bite-sized meringue	0	\N	2017-08-14 14:27:34+00	2017-08-14 14:27:34+00	1	9
62	One Nature - Sample Redemption	vQt7fA	Rooibos Berries Tea/ Freeze Dried Cherries Drink	0	\N	2017-08-14 14:29:16+00	2017-08-14 14:29:16+00	1	10
63	One Nature 10% discount	wVsLh1	10% off all items	0	\N	2017-08-14 14:29:34+00	2017-08-14 14:29:34+00	1	10
64	Dream Catcher: Line follower	Eqt0CQ	Dream Catcher: Line follower workshop	0		2017-08-14 14:30:28+00	2017-08-14 14:34:57+00	1	7
65	Dream Catcher: Motion	xlFLi8	Dream catcher motion workshop	0		2017-08-14 14:31:09+00	2017-08-14 14:34:34+00	1	7
66	Dream Catcher: Obstacle Detection	JQCACO	Dream catcher obstacle detection workshop	0	\N	2017-08-14 14:33:57+00	2017-08-14 14:33:57+00	1	7
67	Basics of a Quadcopter	A1ClCG	Basics of a Quadcopter workshop	0	\N	2017-08-14 14:37:13+00	2017-08-14 14:37:13+00	1	6
68	Drones Flying	JYH1Fz	Public trial drones flying	0	\N	2017-08-14 14:37:49+00	2017-08-14 14:37:49+00	1	6
69	Race Voting	nZh7fJ	one vote for favourite soapbox team	0	\N	2017-08-14 14:40:33+00	2017-08-14 14:40:33+00	1	5
70	Access to race track photo taking	LAIQug	Access to race track	0	\N	2017-08-14 14:41:04+00	2017-08-14 14:41:04+00	1	5
\.


--
-- Name: activities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: evently_user
--

SELECT pg_catalog.setval('activities_id_seq', 70, true);


--
-- Data for Name: attendee; Type: TABLE DATA; Schema: public; Owner: evently_user
--

COPY attendee (id, name, email, dob, location, fk_event, network, created_at, updated_at, tier) FROM stdin;
4	Paul Nguyen	admin.paul@ape.sg	2017-07-27	2	1	one-north Apps	2017-07-20 17:20:34+00	2017-08-09 05:01:04+00	2
5	Kim Tien	weburnittv@gmail.com	1988-02-02	8	1	PULSE Newsletter	2017-07-20 18:57:26+00	2017-08-18 04:09:50+00	2
6	Paul Nguyen	paulaan86@icloud.com	1988-02-02	2	1	Roadshows	2017-07-20 19:03:15+00	2017-08-18 03:17:47+00	2
11	Jia Qi Chua	jiaqi@ape.sg	1995-11-30	8	1	one-north Apps,Electronic Direct Mailer	2017-07-21 16:02:30+00	2017-07-21 16:02:30+00	1
13	Bernard Low	lowbern@gmail.com	1972-02-04	1	1	Social Media	2017-07-25 08:30:43+00	2017-07-25 08:30:43+00	1
14	Jeanelle Tan	jeanelletan@gmail.com	1974-04-16	1	1	Social Media	2017-07-25 11:07:04+00	2017-07-25 11:07:04+00	1
15	Devansh Jain	devansh_jainbpl@yahoo.com	1990-10-10	1	1	Social Media	2017-07-25 16:32:22+00	2017-07-25 16:32:22+00	1
16	Magdeline Sng	buttonaan@hotmail.com	1978-03-16	1	1	one-north Apps,PULSE Newsletter,Electronic Direct Mailer,Word-of-mouth	2017-07-26 01:49:28+00	2017-07-26 01:49:28+00	1
17	Chrishaun Koh	ethelchan07@gmail.com	2011-06-09	1	1	Newspapers	2017-07-26 02:06:04+00	2017-07-26 02:06:04+00	1
18	Dickson	hwdkson@gmail.com	1991-06-26	1	1	Social Media	2017-07-26 02:59:17+00	2017-07-26 02:59:17+00	1
19	Gerardine Tan	rard15@yahoo.com	1971-08-15	6	1	PULSE Newsletter	2017-07-26 08:02:42+00	2017-07-26 08:03:52+00	1
20	Zheng Qingxiang	qingxiang.qx@gmail.com	1982-12-22	1	1	Newspapers	2017-07-26 12:50:38+00	2017-07-26 12:50:39+00	1
21	Chen Yihao	zqxtreme@outlook.com	2007-04-14	1	1	Newspapers	2017-07-26 12:52:42+00	2017-07-26 12:52:42+00	1
22	Chen Zhongwen	zqxtreme_god@hotmail.com	1977-09-05	1	1	Newspapers	2017-07-26 12:55:14+00	2017-07-26 12:55:14+00	1
23	Zheng Yuanzhuo	ryanchong_rc@outlook.com	2015-12-16	1	1	Newspapers	2017-07-26 12:56:30+00	2017-07-26 12:56:30+00	1
24	Tan Siew Lan	ryanchong_rc@hotmail.com	1954-01-21	1	1	Newspapers	2017-07-26 12:57:32+00	2017-07-26 12:57:32+00	1
25	Tay Lim Wang	theknitter99@outlook.com	1952-11-14	1	1	Newspapers	2017-07-26 12:58:48+00	2017-07-26 12:58:48+00	1
26	Ng ho ting jebb	annasuisui88@yahoo.com.hk	1982-01-24	2	1	Social Media	2017-07-26 14:15:23+00	2017-07-26 14:31:53+00	1
27	zoelyn	zoelynchoy@gmail.com	1977-01-18	1	1	Social Media	2017-07-27 04:57:30+00	2017-07-27 04:57:30+00	1
28	Tan Le Tong	zoelyn77@hotmail.com	2008-11-23	1	1	Social Media	2017-07-27 05:43:28+00	2017-07-27 05:43:28+00	1
30	Florence Yeo	nofreefish@yahoo.com.sg	1970-11-01	1	1	Posters,Electronic Direct Mailer	2017-07-28 04:16:41+00	2017-07-28 04:16:41+00	1
31	pearl	pearl@ape.sg	1989-06-05	1	1	Roadshows	2017-07-28 05:21:19+00	2017-08-17 07:27:32+00	1
32	Joyce Chin	joycechin1977@gmail.com	1977-01-25	1	1	Electronic Direct Mailer	2017-07-28 06:11:56+00	2017-07-28 06:11:56+00	1
33	Thong Wei Yuan	thongweiyuan@icloud.com	1994-08-01	1	1	Posters	2017-07-28 08:40:22+00	2017-07-28 08:40:22+00	1
34	Jasmine Chew	bubble_gal86@hotmail.com	1986-06-01	1	1	PULSE Newsletter,Electronic Direct Mailer	2017-07-28 11:15:56+00	2017-07-28 11:15:56+00	1
35	Tam Siew Ling	Siewlingtam@yahoo.c	1972-07-30	1	1	Social Media	2017-07-28 13:32:44+00	2017-07-28 13:32:44+00	1
36	Anne Tam Chai Yin	annechaiyin@hotmail.com	1968-11-16	1	1	Newspapers	2017-07-28 13:34:57+00	2017-08-03 13:25:59+00	1
37	Joyce Shum	shumjoycesk@gmail.com	1940-12-17	1	1	Word-of-mouth	2017-07-29 15:58:07+00	2017-07-29 15:58:07+00	1
38	Faith Wong	hlfaithwong1@gmail.com	1999-02-08	1	1	Social Media	2017-07-30 10:42:37+00	2017-07-30 10:42:37+00	1
39	Goh Jia Ying	gohjiaying10@gmail.com	1999-03-19	1	1	Social Media	2017-07-30 10:45:31+00	2017-07-30 10:45:31+00	1
40	Lynda Lau	lyndalau@rocketmail.com	1960-09-16	1	1	Social Media	2017-07-30 12:06:58+00	2017-07-30 12:06:58+00	1
41	Cherith Lee	ocealaxy@gmail.com	1999-10-29	1	1	Social Media	2017-07-30 14:28:56+00	2017-07-30 14:28:56+00	1
42	Fiqah	Sapri.nr@pg.com	1990-09-10	4	1	Roadshows	2017-07-31 04:10:09+00	2017-07-31 04:10:09+00	1
43	Yasmin	Abdullah.ya@pg.com	1994-07-28	4	1	Roadshows	2017-07-31 04:11:26+00	2017-07-31 04:11:26+00	1
44	Chai Xiao Ran	Chaix@gis.a-star.edu.sg	2017-01-11	4	1	Roadshows	2017-07-31 04:12:15+00	2017-07-31 04:12:15+00	1
45	Wang Ling	Wangl1@gis.a-star.edu.sg	1969-07-17	4	1	Roadshows	2017-07-31 04:13:16+00	2017-07-31 04:13:16+00	1
46	Sun wenjie	Jodiswj@gmail.com	1979-11-25	4	1	Roadshows	2017-07-31 04:14:02+00	2017-07-31 04:14:02+00	1
47	Emily Lee	minyi_83@yahoo.com.hk	1983-05-02	4	1	Roadshows	2017-07-31 04:14:58+00	2017-07-31 04:14:58+00	1
49	Ross	rll_ross@yahoo.com	1987-10-10	1	1	Roadshows	2017-07-31 04:23:50+00	2017-07-31 04:23:50+00	1
50	Sun wendi	Sunwendi@ntu.edu.sg	1987-12-08	4	1	Roadshows	2017-07-31 04:25:10+00	2017-07-31 04:25:10+00	1
51	Yu han	Yu.han@ntu.edu.sg	1979-10-18	4	1	Roadshows	2017-07-31 04:44:50+00	2017-07-31 04:44:50+00	1
52	Lim Chang Siang	Limchangsiang@gmail.com	1988-11-08	4	1	Posters	2017-07-31 04:45:34+00	2017-07-31 04:45:34+00	1
53	Crystal	Crystal-Chan@outlook.com	2017-07-05	1	1	Roadshows	2017-07-31 04:46:16+00	2017-07-31 04:46:16+00	1
54	gee Goh	geegsg@gmail.com	1982-10-20	1	1	Newspapers	2017-07-31 04:49:12+00	2017-07-31 04:49:12+00	1
55	Kuan Jyn Ling	jlkuan@gis.a-star.edu.sg	1989-01-01	4	1	Posters,PULSE Newsletter	2017-07-31 04:49:56+00	2017-07-31 04:49:56+00	1
56	Chang mei mei	changmm@gis.a-star.edu.sg	1992-06-18	2	1	Roadshows	2017-07-31 04:51:57+00	2017-07-31 04:51:57+00	1
57	Neha	Rohatgineha1989@gmail.com	1989-01-10	1	1	Roadshows	2017-07-31 04:52:44+00	2017-07-31 04:52:44+00	1
58	Haiyun	haiyun-see@denka.com.sg	2017-05-05	4	1	Roadshows	2017-07-31 04:54:58+00	2017-07-31 04:54:58+00	1
59	Chin chew lin	chin_chew_lin@bmsi.a-star.edu.sg	2017-07-21	4	1	Roadshows	2017-07-31 04:55:41+00	2017-07-31 04:55:41+00	1
60	Nani Djunaidi	Nani-djunaidi@denka.com.sg	2017-01-03	4	1	Roadshows	2017-07-31 04:56:21+00	2017-07-31 04:56:21+00	1
61	Seah Siok Har	seah_siok_har@bmsi-astar.edu.sg	1967-12-21	4	1	Roadshows	2017-07-31 04:57:08+00	2017-07-31 04:57:08+00	1
62	Weibin	weibin-zhang@denka.com.sg	2017-03-06	4	1	Roadshows	2017-07-31 04:58:14+00	2017-07-31 04:58:14+00	1
63	Tian Oi Theen	tian_oi_theen@bmsi-astar.edu.sg	1970-07-16	4	1	Roadshows	2017-07-31 04:58:59+00	2017-07-31 04:58:59+00	1
64	Giang	le_thi_thu_giang@sbic.a-star.edu.sg	1979-08-16	4	1	Roadshows	2017-07-31 04:59:41+00	2017-07-31 04:59:41+00	1
65	Juan	juanluisdecastro@gmail.com	1978-06-29	1	1	Roadshows	2017-07-31 05:03:18+00	2017-07-31 05:03:18+00	1
66	Wee	weegn@scei.a-star.edu.sg	1965-02-24	4	1	Roadshows	2017-07-31 05:03:58+00	2017-07-31 05:03:58+00	1
67	Sharon Lee	sharon-lee@scei.a-star.edu.sg	1974-06-13	4	1	Roadshows	2017-07-31 05:04:47+00	2017-07-31 05:04:47+00	1
12	Kim Tien	kimtientrancao@gmail.com	1988-02-07	1	1	Roadshows	2017-07-22 06:20:03+00	2017-08-19 17:07:51+00	2
69	Quek	Quek_geok_khim@bmsipo.sg	1975-10-12	4	1	Roadshows	2017-07-31 05:07:03+00	2017-07-31 05:07:03+00	1
70	Jessica Goh	gohps@scei.a-star.edu.sg	1968-08-30	4	1	one-north Apps	2017-07-31 05:08:06+00	2017-08-04 04:48:57+00	1
71	Purabi	purabi.sharma@moleac.com	1976-02-03	4	1	Roadshows	2017-07-31 05:08:52+00	2017-07-31 05:08:52+00	1
72	Yang shen	Sheny@gis.a-star.edu.sg	1981-11-11	1	1	Roadshows	2017-07-31 05:15:08+00	2017-07-31 05:15:08+00	1
73	Li Chenhao	lich@gis.a-star.edu.sg	2017-02-16	4	1	Roadshows	2017-07-31 05:16:05+00	2017-07-31 05:16:05+00	1
74	Yong Fui Fong	yong_fui_fong@sbic.a-star.edu.sg	1979-12-19	4	1	Roadshows	2017-07-31 05:17:06+00	2017-07-31 05:17:06+00	1
75	Ivan	Sungyeu@gmail.com	2017-02-15	4	1	PULSE Newsletter	2017-07-31 05:17:53+00	2017-07-31 05:17:53+00	1
76	Richard	Richardyong77@gmail.com	1977-03-01	1	1	Roadshows	2017-07-31 05:18:34+00	2017-07-31 05:18:34+00	1
77	Rubecca	becciparlour@gmail.com	1987-03-03	4	1	Roadshows	2017-07-31 05:19:57+00	2017-07-31 05:19:57+00	1
78	Farah Arina	rina_sep@hotmail.com	1992-09-24	4	1	Roadshows	2017-07-31 05:20:42+00	2017-07-31 05:20:42+00	1
79	Lim chai eng	Limchaieng1@gmail.com	1972-09-01	4	1	Roadshows	2017-07-31 05:21:21+00	2017-08-04 04:38:27+00	1
80	Fiona	fiona-koh@hotmail.com	1969-11-23	4	1	Roadshows	2017-07-31 05:22:47+00	2017-07-31 05:22:47+00	1
81	Koh Xiao Qing	kohxiaoqing@hotmail.sg	2017-01-08	1	1	Roadshows	2017-07-31 05:24:08+00	2017-07-31 05:24:08+00	1
87	Paul Nguyen	neverdie0203@gmail.com	2017-07-22	8	1	Electronic Direct Mailer	2017-07-31 06:13:54+00	2017-08-12 06:46:10+00	2
88	Yong Kian Leong	kianleong.yong@singaporetech.edu.sg	1982-11-22	1	1	Electronic Direct Mailer	2017-07-31 06:33:48+00	2017-07-31 06:33:48+00	1
89	Celine Sim	contactcels@gmail.com	1979-08-18	1	1	Bus Stop Ads	2017-07-31 07:03:39+00	2017-07-31 07:05:38+00	1
90	Paul Nguyen	testpaul@saloniz.com	1998-09-29	5	1	one-north Apps	2017-07-31 07:10:28+00	2017-08-18 04:15:36+00	2
91	evently123	evently123test@mailinator.com	1983-06-15	3	1	Social Media	2017-07-31 07:11:05+00	2017-07-31 07:11:05+00	1
92	Anna Gan	ganhha@gis.a-star.edu.sg	1984-08-02	4	1	Roadshows	2017-07-31 07:14:02+00	2017-07-31 07:14:02+00	1
93	Ng Lilian	lilian_ng@rsc.a-star.edu.sg	1960-03-10	4	1	Roadshows	2017-07-31 07:15:33+00	2017-07-31 07:15:33+00	1
94	Len shea mei	len_shea_mei@hsa.gov.sg	1976-05-02	2	1	Roadshows	2017-07-31 07:20:12+00	2017-07-31 07:20:12+00	1
95	Paul Nguyen	an.nguyen-hoai@lazada.com	2017-07-20	7	1	one-north Apps	2017-07-31 07:21:05+00	2017-08-12 06:46:13+00	2
96	Joanne	joanne_chan@tlgm.a-star.edu.sg	1960-06-25	4	1	Roadshows	2017-07-31 07:22:41+00	2017-07-31 07:22:41+00	1
97	Jason	Nguyen.j@pg.com	1980-05-07	4	1	Roadshows	2017-07-31 07:23:27+00	2017-07-31 07:23:27+00	1
98	Shirley soo	soo_shirley@yahoo.com	2017-01-05	1	1	Roadshows	2017-07-31 07:26:17+00	2017-07-31 07:26:17+00	1
99	Jenny Aberilla	Aberilla.jc@pg.com	1971-01-18	4	1	Roadshows	2017-07-31 07:27:04+00	2017-07-31 07:27:04+00	1
100	Tan kai ling	Kailingemail@gmail.com	1983-07-27	1	1	Roadshows	2017-07-31 07:27:44+00	2017-07-31 07:27:44+00	1
101	Simran	simransokhi@outlook.com	2000-02-06	4	1	Word-of-mouth	2017-07-31 07:28:27+00	2017-08-18 01:30:25+00	1
102	Aan Saloniz	aan@saloniz.com	1986-02-02	7	1	Roadshows	2017-07-31 07:38:50+00	2017-08-16 14:20:25+00	1
103	Chan Wai Yee	Chanye03@yahoo.com	1973-06-14	4	1	Roadshows	2017-07-31 07:38:59+00	2017-07-31 07:38:59+00	1
104	Soumiya	Boilingwok@gmail.com	1988-01-01	4	1	Roadshows	2017-07-31 07:43:03+00	2017-07-31 07:43:03+00	1
105	Godwin Quianzon	Gquianzon@gmail.com	2017-05-26	4	1	Roadshows	2017-07-31 07:43:48+00	2017-07-31 07:43:48+00	1
106	Shi Chi	leow_shi_chi@bmsipo.sg	1984-04-08	4	1	Electronic Direct Mailer	2017-07-31 07:44:33+00	2017-07-31 07:44:33+00	1
107	KOH XIN HUI	Gladis_koh@hotmail.com	1985-04-26	1	1	Roadshows	2017-07-31 07:45:36+00	2017-07-31 07:45:36+00	1
108	Nur zamarina	Reena.titania@gmail.com	1991-12-24	4	1	Roadshows	2017-07-31 07:46:26+00	2017-07-31 07:46:26+00	1
109	Nishanthi	Ashalovedad@gmail.com	2017-12-14	1	1	Roadshows	2017-07-31 07:47:13+00	2017-07-31 07:47:13+00	1
110	Gianna Q	fgmquianzon@gmail.com	2007-07-26	1	1	Word-of-mouth	2017-07-31 07:51:31+00	2017-07-31 07:51:31+00	1
111	Swati	Swati.6783@gmail.com	1983-07-06	1	1	Social Media	2017-07-31 07:55:32+00	2017-07-31 07:55:32+00	1
112	Vittorio Q	einnav@yahoo.com	2012-01-13	1	1	Word-of-mouth	2017-07-31 07:56:55+00	2017-07-31 07:56:55+00	1
113	Jinhui	Caughtfish@daum.net	2017-07-31	1	1	Roadshows	2017-07-31 07:59:15+00	2017-07-31 07:59:15+00	1
114	Ong Ching Ching	Ongching2@yahoo.com	2017-01-09	4	1	Roadshows	2017-07-31 08:00:05+00	2017-07-31 08:00:05+00	1
115	Wendy tan	Wendy.tan@incresearch.com	1967-06-09	4	1	Roadshows	2017-07-31 08:02:11+00	2017-07-31 08:02:11+00	1
116	Boo Maggie	maggie_boo@bmsi.a-star.edu.sg	2017-05-27	4	1	Roadshows	2017-07-31 08:03:02+00	2017-07-31 08:03:02+00	1
117	Casey Chua	Phideaus@gmail.com	2017-12-06	4	1	Social Media	2017-07-31 08:03:46+00	2017-07-31 08:03:46+00	1
118	Sherry Low	Sherry_low@etpl.sg	1984-01-09	4	1	Electronic Direct Mailer	2017-07-31 08:04:36+00	2017-08-04 04:08:21+00	1
120	Arash	Arash.ne89@gmail.com	1986-08-04	2	1	Posters	2017-07-31 08:08:18+00	2017-08-04 04:45:11+00	1
121	Ang Kok Boon	kbang523@gmail.com	1968-07-12	4	1	Roadshows	2017-07-31 08:30:33+00	2017-07-31 08:30:34+00	1
122	Michael	Trd3gt81@yahoo.com.sg	1981-08-14	4	1	Roadshows	2017-07-31 08:32:02+00	2017-07-31 08:32:02+00	1
123	Parthiban Ganesan	ganesan.p.1@pg.com	1970-04-11	4	1	Roadshows	2017-07-31 08:32:47+00	2017-07-31 08:32:47+00	1
124	Satish Kumar	gsck9@yahoo.co.in	1976-03-09	4	1	Roadshows	2017-07-31 08:33:41+00	2017-07-31 08:33:41+00	1
125	Koh hai seng	Koh.hs@pg.com	1956-10-20	4	1	Roadshows	2017-07-31 08:34:24+00	2017-07-31 08:34:24+00	1
126	Tiong Teck Siew	tts8039@gmail.com	1981-01-29	1	1	Roadshows	2017-07-31 08:35:04+00	2017-07-31 08:35:04+00	1
127	Khoo shin hui	Khooshinhui@hotmail.com	2017-01-21	2	1	Roadshows	2017-07-31 08:37:12+00	2017-07-31 08:37:12+00	1
128	Thompson ng	Thompson288@yahoo.com	2017-01-09	2	1	Roadshows	2017-07-31 08:38:14+00	2017-07-31 08:38:14+00	1
129	Darwin Gosal	darwin@gosal.org	1980-02-29	8	1	Roadshows	2017-07-31 08:39:13+00	2017-07-31 08:39:13+00	1
130	Nitin Sathasivam	Sathasivam.nitin@gmail.com	2017-04-22	2	1	Word-of-mouth	2017-07-31 08:39:52+00	2017-07-31 08:39:52+00	1
131	Aish Prasad	Aishvarma@gmail.com	1982-06-29	2	1	Posters	2017-07-31 08:40:32+00	2017-07-31 08:40:32+00	1
132	Ivy yeung	Ivy.yeung@lr.org	1956-01-08	2	1	Roadshows	2017-07-31 08:41:12+00	2017-07-31 08:41:12+00	1
133	Benjamin Wong	benwong383@yahoo.com.sg	1956-07-23	1	1	Word-of-mouth	2017-07-31 08:41:55+00	2017-07-31 08:41:55+00	1
135	Durairaj baktavachalam	Bakhadurairaj@gmail.com	1961-05-15	1	1	Roadshows	2017-07-31 08:43:03+00	2017-07-31 08:43:03+00	1
136	Esther Goh	Esthergoh@gmail.com	1988-01-06	1	1	Roadshows	2017-07-31 08:46:25+00	2017-07-31 08:46:25+00	1
137	Surizan	Surizan74@yahoo.com	2017-10-16	1	1	Roadshows	2017-07-31 08:47:53+00	2017-07-31 08:47:53+00	1
138	Vannie Q	vannieq@hotmail.com	1977-03-29	1	1	Word-of-mouth	2017-07-31 10:16:25+00	2017-07-31 10:16:25+00	1
139	Kim Tien	kimtien88@icloud.com	1988-12-12	8	1	Bus Stop Ads	2017-07-31 14:06:15+00	2017-07-31 14:06:15+00	1
140	Choon yan	tanchy@scei.a-star.edu.sg	1972-11-06	1	1	Roadshows	2017-07-31 18:35:10+00	2017-08-04 04:11:37+00	1
141	Amol	kokanean@rediffmail.com	1982-05-12	1	1	Roadshows	2017-07-31 18:35:11+00	2017-07-31 18:35:11+00	1
142	Ram Kumar K	kram5206@yahoo.com	1981-02-08	1	1	Roadshows	2017-07-31 18:35:11+00	2017-07-31 18:35:11+00	1
143	Lee mi jung	lee.mj.3@pg.com	1977-12-18	1	1	Roadshows	2017-07-31 18:35:12+00	2017-07-31 18:35:12+00	1
144	Janet Tan	jtlg78@hotmail.com	1978-08-07	1	1	Roadshows	2017-07-31 18:35:12+00	2017-07-31 18:35:12+00	1
145	Zhao Tianyun	tyzhao@ntu.edu.sg	1974-01-19	4	1	Roadshows	2017-07-31 18:37:33+00	2017-07-31 18:37:33+00	1
146	Kyler	alison_sue@hotmail.com	2011-02-06	0	1	Posters	2017-08-02 00:54:41+00	2017-08-02 00:54:41+00	1
147	Wyndee See	wyndee@ape.sg	1994-05-10	0	1	Roadshows	2017-08-02 04:31:06+00	2017-08-12 06:45:14+00	2
148	Xingjian Jiang	juliamaxjiang@gmail.com	2011-08-16	0	1	Electronic Direct Mailer,Word-of-mouth	2017-08-02 04:36:48+00	2017-08-02 04:39:59+00	1
149	Lingxiao Jiang	lingxiaojiang@gmail.com	1978-11-06	0	1	Electronic Direct Mailer,Word-of-mouth	2017-08-02 04:37:43+00	2017-08-02 04:37:43+00	1
150	Xiaojing Wu	wxj.wxj@gmail.com	1979-07-20	0	1	Electronic Direct Mailer,Word-of-mouth	2017-08-02 04:39:23+00	2017-08-02 04:39:23+00	1
151	Paul aan	Paulaan86@gmail.com	1987-08-02	1	1	Posters	2017-08-02 10:59:45+00	2017-08-12 06:46:16+00	2
152	Thomas Nguyen	testemail@gmail.com	1988-08-02	0	1	Roadshows	2017-08-02 11:13:58+00	2017-08-02 11:13:58+00	1
153	Thomas Nguyen	tamdesktop@gmail.com	1975-02-03	0	1	Roadshows	2017-08-02 11:14:42+00	2017-08-02 11:14:42+00	1
154	Linus	linustsg@yahoo.com	2017-07-18	0	1	Roadshows	2017-08-02 15:45:45+00	2017-08-02 15:45:45+00	1
155	Deepak Goyal	Xyzdeepak@gmail.com	1972-02-18	2	1	Roadshows	2017-08-02 15:46:41+00	2017-08-02 15:46:41+00	1
156	Siu yoong	Lsysia80@gmail.com	1980-09-13	2	1	Roadshows	2017-08-02 15:47:27+00	2017-08-02 15:47:27+00	1
157	Bir bahadur verma	birbahadur.verma@sg.abb.com	1967-05-15	0	1	Roadshows	2017-08-02 15:49:09+00	2017-08-02 15:49:09+00	1
158	sabrina	enjie_7@hotmail.com	1981-10-31	2	1	Roadshows	2017-08-02 15:49:59+00	2017-08-02 15:49:59+00	1
159	Edison	Edisonlau5208@hotmail.com	1982-04-01	2	1	Roadshows	2017-08-02 15:50:42+00	2017-08-02 15:50:42+00	1
160	Wayne Wong	Waynewongpain93@gmail.com	1993-01-15	0	1	Roadshows	2017-08-02 15:51:28+00	2017-08-02 15:51:28+00	1
161	Venkatesh	Venkatesh@yahoo.co.in	1974-06-16	0	1	Roadshows	2017-08-02 15:52:14+00	2017-08-02 15:52:14+00	1
162	Shraddha Bhiungade	Shraddha.bhiungade@gmail.com	1985-02-11	2	1	Roadshows	2017-08-02 15:52:59+00	2017-08-02 15:52:59+00	1
163	Ramesh Satini	ramesh.satini@gmail.com	1977-08-07	2	1	Roadshows	2017-08-02 15:53:48+00	2017-08-02 15:53:48+00	1
164	Tan Boon Choon	bchoon22@yahoo.com	1976-09-15	2	1	Posters	2017-08-02 15:54:39+00	2017-08-02 15:54:39+00	1
165	Alicia Leong	alicia_leong@yahoo.com	1978-12-01	0	1	Social Media	2017-08-03 00:36:05+00	2017-08-18 03:14:25+00	1
166	Ashley Lee	yenkim@singnet.com.sg	2002-10-17	0	1	Word-of-mouth	2017-08-03 04:28:08+00	2017-08-03 15:26:24+00	1
167	Lyn Low	lynlow@stjh.org.sg	1992-04-30	0	1	Bus Stop Ads,Word-of-mouth	2017-08-03 06:17:42+00	2017-08-03 06:17:42+00	1
168	Tam Siew Ling	siewlingtam@yahoo.com	1972-07-30	0	1	Posters	2017-08-03 13:24:43+00	2017-08-03 13:24:43+00	1
169	Bhagyashri karanje	Shri.karanje@gmail.com	1985-11-13	2	1	Roadshows	2017-08-03 14:19:23+00	2017-08-03 14:19:23+00	1
170	Jayasakthivel	Jangamuthu@gmail.com	1978-12-12	0	1	Roadshows	2017-08-03 14:20:02+00	2017-08-03 14:20:02+00	1
171	Tpain	Apenkar@gmail.com	1977-10-08	2	1	Social Media	2017-08-03 14:20:50+00	2017-08-03 14:20:50+00	1
172	Nelson Seh	Nelsonseh@outLook.com	1977-07-01	2	1	Roadshows	2017-08-03 14:21:32+00	2017-08-03 14:21:32+00	1
173	Elan	Elan@elanchezhian.com	2017-06-07	2	1	Roadshows	2017-08-03 14:22:06+00	2017-08-03 14:22:06+00	1
174	Sakthivel	Vel.cs1986@gmail.com	1986-06-12	2	1	Roadshows	2017-08-03 14:23:06+00	2017-08-03 14:23:06+00	1
175	Lee Chui Fern	leechuifern@hotmail.com	1976-09-16	2	1	Roadshows	2017-08-03 14:23:46+00	2017-08-03 14:23:46+00	1
177	Ram	Ramvignesh.11@gmail.com	2016-11-28	2	1	Roadshows	2017-08-03 14:25:20+00	2017-08-03 14:25:20+00	1
178	Srinivas	Sridotnet88@gmail.com	1988-06-20	2	1	Roadshows	2017-08-03 14:26:00+00	2017-08-03 14:26:00+00	1
179	Jeff	leongcs@mail.com	1951-11-26	0	1	Roadshows	2017-08-03 14:26:40+00	2017-08-03 14:26:40+00	1
180	Rupa	Rupa.test24@gmail.com	1986-04-24	0	1	Roadshows	2017-08-03 14:27:24+00	2017-08-03 14:27:24+00	1
181	delphine hu	febanddel@gmail.com	1988-05-20	2	1	Roadshows	2017-08-03 14:28:06+00	2017-08-03 14:28:06+00	1
182	Alan Low	alanserene@yahoo.com.sg	1962-08-23	2	1	Roadshows	2017-08-03 14:28:40+00	2017-08-03 14:28:40+00	1
183	kellen	kero_112@yahoo.com	1985-02-11	0	1	Roadshows	2017-08-03 14:29:14+00	2017-08-03 14:29:14+00	1
184	Vijay	Vijayjunjuri@gmail.com	2016-07-20	0	1	Roadshows	2017-08-03 14:30:19+00	2017-08-03 14:30:19+00	1
185	Anandh	daringanandh@gmail.com	1990-07-09	2	1	Roadshows	2017-08-03 14:30:57+00	2017-08-03 14:30:57+00	1
186	Iylia	Iylia9@yahoo.com	1985-09-04	2	1	Roadshows	2017-08-03 14:31:42+00	2017-08-03 14:31:42+00	1
188	Pang moi	Moshakie@gmail.com	1955-09-07	2	1	Roadshows	2017-08-03 14:32:55+00	2017-08-03 14:32:55+00	1
189	Grace ong	apple_cuteshamei@yahoo.com	1990-03-28	0	1	Roadshows	2017-08-03 14:33:35+00	2017-08-03 14:33:35+00	1
190	Chua siew qin	Bubblechuatie@gmail.com	1995-06-07	2	1	Roadshows	2017-08-03 14:34:15+00	2017-08-03 14:34:15+00	1
191	chua chew peng	chewpeng.chua@insead.edu	1972-04-26	2	1	Roadshows	2017-08-03 14:35:05+00	2017-08-03 14:35:05+00	1
192	Aileen	Ailin.tan@insead.edu	2017-04-29	2	1	Roadshows	2017-08-03 14:35:49+00	2017-08-03 14:35:49+00	1
193	Doris	Doris.leo@insead.edu	1977-03-08	0	1	Roadshows	2017-08-03 14:36:35+00	2017-08-03 14:36:35+00	1
194	Doris tan	Caprodec@hotmail.com	1965-12-31	0	1	Roadshows	2017-08-03 14:37:10+00	2017-08-03 14:37:10+00	1
195	Agnes Teo	agnes_teo_kl@yahoo.com	1985-06-25	2	1	Roadshows	2017-08-03 14:37:45+00	2017-08-03 14:37:45+00	1
196	Mabel	Mabel.lee@oracle.com	1959-06-10	2	1	Roadshows	2017-08-03 14:38:26+00	2017-08-03 14:38:26+00	1
197	Lany Zhu	Lanytjoe@yahoo.com	1982-09-24	0	1	Roadshows	2017-08-03 14:39:03+00	2017-08-03 14:39:03+00	1
198	Wong zuan yin	Zuanyin88@hotmail.com	1988-11-29	2	1	Roadshows	2017-08-03 14:39:36+00	2017-08-03 14:39:36+00	1
199	Carrie Ong	carrieong@ymail.com	1978-11-03	2	1	Roadshows	2017-08-03 14:40:31+00	2017-08-03 14:40:31+00	1
200	Ramya	Ramyajv@gmail.com	2017-07-15	0	1	Roadshows	2017-08-03 14:41:06+00	2017-08-03 14:41:06+00	1
201	Cartilage agarwal	Vartika.mca@gmail.com	1980-02-08	0	1	Roadshows	2017-08-03 14:41:40+00	2017-08-03 14:41:40+00	1
202	Summery gandhi	Summery.kumar.gandhi@gmail.com	1983-12-06	2	1	Roadshows	2017-08-03 14:44:55+00	2017-08-03 14:44:55+00	1
204	bhargavi	bhargavi.ns@reddiffmail.com	1980-10-15	1	1	Roadshows	2017-08-03 14:46:00+00	2017-08-03 14:46:00+00	1
205	V s radhakrishna muddala	Mvsradhakrishna@gmail.com	1986-08-28	1	1	Roadshows	2017-08-03 14:46:39+00	2017-08-03 14:46:39+00	1
206	aravind	aravind.kalaiselvan@am.jll.com	1986-07-25	2	1	Roadshows	2017-08-03 14:47:19+00	2017-08-03 14:47:19+00	1
207	Ng Swee Hoon	Swhoon38@gmail.com	1980-01-01	0	1	Roadshows	2017-08-03 14:47:55+00	2017-08-03 14:47:55+00	1
208	Helen yur	Helen.yue@ascendas.com	1980-08-18	0	1	Roadshows	2017-08-03 14:48:35+00	2017-08-03 14:48:35+00	1
209	Elicia Pong	kahuipong@yahoo.com	1981-11-29	0	1	Roadshows	2017-08-03 14:49:21+00	2017-08-03 14:49:21+00	1
210	Poh Kim foong	Kimfoong@hotmail.sg	1979-10-26	0	1	Roadshows	2017-08-03 14:50:33+00	2017-08-03 14:50:33+00	1
212	Simon Chan	simon-chan@live.com	1957-05-11	2	1	Roadshows	2017-08-03 14:52:04+00	2017-08-03 14:52:04+00	1
213	Chen Swee Ping	chensweeping@hotmail.com	2017-07-13	2	1	Roadshows	2017-08-03 14:52:52+00	2017-08-03 14:52:52+00	1
214	Chua Sin Lay	gusto1201@yahoo.com.sg	1980-12-01	2	1	Roadshows	2017-08-03 14:53:34+00	2017-08-03 14:53:34+00	1
215	Jason Tang	tang_teckchong@yahoo.com.sg	1980-03-17	2	1	Roadshows	2017-08-03 14:54:13+00	2017-08-03 14:54:13+00	1
216	Ng Choon Siang	ngcs0717@hotmail.com	1973-07-17	0	1	Roadshows	2017-08-03 14:54:49+00	2017-08-03 14:54:49+00	1
217	Eng Ei Sia	Eisia1003@yahoo.com	1972-12-16	2	1	Roadshows	2017-08-03 14:55:28+00	2017-08-03 14:55:28+00	1
218	connie	connie_kwong@canon.com.sg	1975-04-15	2	1	Roadshows	2017-08-03 14:56:12+00	2017-08-03 14:56:12+00	1
219	Andrew Bay	Andrew_bay@canon.com.sg	1970-10-19	2	1	Roadshows	2017-08-03 14:56:48+00	2017-08-03 14:56:48+00	1
220	Kenny low	Kenny_low@Canon.com.sg	1972-12-26	2	1	Roadshows	2017-08-03 14:57:23+00	2017-08-03 14:57:23+00	1
221	Xie zirong	A0083330@gmail.com	1991-09-03	0	1	Roadshows	2017-08-03 14:57:54+00	2017-08-03 14:57:54+00	1
222	Arief setiawan	ariefsetiawan@hotmail.com	1992-02-20	2	1	Roadshows	2017-08-03 14:58:30+00	2017-08-03 14:58:30+00	1
223	Mainak	mainak6972@yahoo.com	1972-09-06	0	1	Roadshows	2017-08-03 14:59:03+00	2017-08-03 14:59:03+00	1
224	Varun Nurani Subramanian	N.s.varun@gmail.com	1987-06-29	2	1	Roadshows	2017-08-03 14:59:40+00	2017-08-03 14:59:40+00	1
225	Vishal gupta	Vishal.niitan@gmail.com	1989-01-09	1	1	Roadshows	2017-08-03 15:00:23+00	2017-08-03 15:00:23+00	1
226	Rufina	Frenlyflea@yahoo.com	1982-09-11	2	1	Posters,Electronic Direct Mailer	2017-08-03 15:01:13+00	2017-08-03 15:01:13+00	1
228	Raun Keith	keith.raun@gmail.com	1985-12-20	2	1	Roadshows	2017-08-03 15:02:28+00	2017-08-03 15:02:28+00	1
229	Lester	lester@nutonomy.com	1977-01-22	8	1	Social Media	2017-08-03 15:03:11+00	2017-08-03 15:03:11+00	1
231	Tan you liang	tan_you_liang@hotmail.com	1995-08-11	8	1	Social Media	2017-08-03 15:04:31+00	2017-08-03 15:04:31+00	1
232	Nur Amira Binte Samri	nuramira_samri@Canon.com.sg	1989-09-25	2	1	Roadshows	2017-08-03 15:05:14+00	2017-08-03 15:05:14+00	1
233	Gloria	Gloria.thong@gmail.com	1988-11-11	2	1	Roadshows	2017-08-03 15:05:55+00	2017-08-03 15:05:55+00	1
234	Val	Pokeeydots@gmail.com	1988-05-10	2	1	Roadshows	2017-08-03 15:06:34+00	2017-08-03 15:06:34+00	1
235	Michelle Leong	Jialing.michelle@gmail.com	1988-02-15	2	1	Roadshows	2017-08-03 15:07:11+00	2017-08-03 15:07:11+00	1
237	jane	janeo_@hotmail.com	1982-03-20	2	1	Roadshows	2017-08-03 15:08:17+00	2017-08-03 15:08:17+00	1
238	Yeo shufang	Shufang12@yahoo.com	1983-09-14	2	1	Roadshows	2017-08-03 15:09:07+00	2017-08-03 15:09:07+00	1
239	Joanne Lee	Shujuan.lee@gmail.com	1983-06-17	2	1	Roadshows	2017-08-03 15:09:46+00	2017-08-03 15:09:46+00	1
240	Ang Hui Fen	ning_gal43@hotmail.com	1984-08-30	2	1	Roadshows	2017-08-03 15:10:20+00	2017-08-03 15:10:20+00	1
241	Sandra	Sandratlq@hotmail.com	1972-02-11	0	1	Roadshows	2017-08-03 15:11:34+00	2017-08-03 15:11:34+00	1
242	Sandra toh	Sandratbl@hotmail.com	1970-07-28	0	1	Roadshows	2017-08-03 15:12:10+00	2017-08-03 15:12:10+00	1
243	trachelle	trach1814@gmail.com	1990-04-04	0	1	Roadshows	2017-08-03 15:12:54+00	2017-08-03 15:12:54+00	1
244	Winifred sing	Winifredsong@gmail.com	1966-01-05	2	1	Roadshows	2017-08-03 15:13:33+00	2017-08-03 15:13:33+00	1
245	Sashi	sashikalaaaa@gmail.com	1989-03-09	2	1	Roadshows	2017-08-03 15:14:08+00	2017-08-03 15:14:08+00	1
246	Connie	connie_angeline@yahoo.com	1999-04-20	0	1	Roadshows	2017-08-03 15:14:43+00	2017-08-03 15:14:43+00	1
247	Fatin	Nurri.fatin@hotmail.com	1991-10-22	2	1	Roadshows	2017-08-03 15:15:23+00	2017-08-03 15:15:23+00	1
248	Lee Meng Chua	leemengchua@gmail.con	1962-09-01	2	1	Word-of-mouth	2017-08-03 15:21:30+00	2017-08-03 15:21:30+00	1
249	Priscilla	Ngay@scei.a-star.edu.sg	1982-10-29	2	1	Roadshows	2017-08-04 01:54:54+00	2017-08-04 01:54:54+00	1
250	serena	serena.seah@gmail.com	2016-09-09	0	1	Roadshows	2017-08-04 01:55:27+00	2017-08-04 01:55:27+00	1
251	Karishma Sachaphibulkij	Karishmasachdev@gmail.com	1983-03-20	0	1	Roadshows	2017-08-04 01:56:01+00	2017-08-04 01:56:01+00	1
252	Aruna	Aruna.annamalai07@gmail.com	1990-04-16	0	1	Roadshows	2017-08-04 01:56:37+00	2017-08-04 01:56:37+00	1
253	Pippin Merin Panicker	pippinmp@yahoo.co.in	1984-06-08	2	1	Roadshows	2017-08-04 01:57:13+00	2017-08-04 01:57:13+00	1
254	Jessica	Jessica.gan@liquidpay.com	1980-08-01	2	1	Roadshows	2017-08-04 01:57:51+00	2017-08-04 01:57:51+00	1
255	Priyanka	Priya.peens@gmail.com	1983-07-16	0	1	Roadshows	2017-08-04 01:58:24+00	2017-08-04 01:58:24+00	1
256	Chiwfoong	Chuachiwfoong@gmail.com	2016-09-21	0	1	Roadshows	2017-08-04 01:58:56+00	2017-08-04 01:58:56+00	1
257	Esther lee	Esther0.0lee@gmail.com	1992-04-06	2	1	Roadshows	2017-08-04 01:59:24+00	2017-08-04 01:59:24+00	1
258	Man pek kuan	Pekkuanma@gmail.com	1995-08-31	2	1	Roadshows	2017-08-04 01:59:59+00	2017-08-04 01:59:59+00	1
260	Krishna Praveen G	Praveengk2006@gmail.com	1985-11-03	2	1	Roadshows	2017-08-04 02:01:03+00	2017-08-04 02:01:03+00	1
261	choo jia hui	happygirljiahui7@hotmail.com	2017-01-07	2	1	Roadshows	2017-08-04 02:01:33+00	2017-08-04 02:01:33+00	1
263	mok kim hoong	mokkh08@gmail.com	1962-07-12	0	1	Word-of-mouth	2017-08-04 02:02:21+00	2017-08-04 02:02:21+00	1
265	Lee boon leng	Leeboonleng@ymail.com	1962-08-02	2	1	Roadshows	2017-08-04 02:04:05+00	2017-08-04 02:04:05+00	1
266	Vijay Kumar Yadav S	Yadavinda.1@gmail.com	1985-10-23	2	1	Roadshows	2017-08-04 02:04:39+00	2017-08-04 02:04:39+00	1
267	Nikhil Shankar Singh	Nikhilshankarsingh@gmail.com	1983-08-03	2	1	Roadshows	2017-08-04 02:05:18+00	2017-08-04 02:05:18+00	1
268	Arindam Banerjee	becarindam@gmail.com	1982-11-27	2	1	Roadshows	2017-08-04 02:05:48+00	2017-08-04 02:05:48+00	1
269	matthew ong	matthew.ongzx@gmail.com	2017-05-03	0	1	Roadshows	2017-08-04 02:06:21+00	2017-08-04 02:06:21+00	1
270	doreen mok	doreen@thethirdparty.biz	2016-09-24	0	1	Word-of-mouth	2017-08-04 02:06:51+00	2017-08-04 02:06:51+00	1
271	Susan	Susan_lui@hotmail.com	1966-09-25	2	1	Roadshows	2017-08-04 02:07:49+00	2017-08-04 02:07:49+00	1
272	Geoffrey	kinggeoffrey@gmail.com	1998-08-08	0	1	Social Media	2017-08-04 02:08:21+00	2017-08-04 02:08:21+00	1
273	Tan Cheng Hai	chenghai@yahoo.com	2016-09-12	8	1	Roadshows	2017-08-04 02:08:53+00	2017-08-04 02:08:53+00	1
274	Jeff Tan	jefftan08@gmail.com	1993-08-21	2	1	Roadshows	2017-08-04 02:09:21+00	2017-08-04 02:09:21+00	1
275	Patrick sim	Tcpsim@gmail.com	1976-09-25	2	1	Roadshows	2017-08-04 02:09:54+00	2017-08-04 02:09:54+00	1
276	Boon jun	Boonjun@gmail.com	1993-07-26	0	1	Roadshows	2017-08-04 02:10:24+00	2017-08-04 02:10:24+00	1
277	Lim Liza	Lizalim2013@gmail.com	1978-08-22	2	1	Roadshows	2017-08-04 02:10:55+00	2017-08-04 02:10:56+00	1
278	Debby Chen	chenyungi82@gmail.com	1993-07-07	8	1	Roadshows	2017-08-04 02:11:27+00	2017-08-04 02:11:27+00	1
279	Teo Soo hoon	siohoonteo@gmail.com	1970-03-07	2	1	Roadshows	2017-08-04 02:11:55+00	2017-08-04 02:11:55+00	1
280	June Tan	azure619june@gmail.com	1993-06-19	7	1	Roadshows	2017-08-04 02:12:27+00	2017-08-04 02:12:27+00	1
282	woon hui juan	huijuan.woon@yahoo.com.sg	1985-02-10	0	1	Word-of-mouth	2017-08-04 02:13:20+00	2017-08-04 02:13:20+00	1
283	Khatrina	Khatrinajunitha@hotmail.com	1995-08-06	8	1	Posters	2017-08-04 02:14:02+00	2017-08-04 02:14:02+00	1
284	Nicole Goh	nicole.goh@payboy.biz	1998-01-23	7	1	Roadshows	2017-08-04 02:14:54+00	2017-08-04 02:14:54+00	1
285	May Lam	may833@gmail.com	1988-11-21	8	1	Word-of-mouth	2017-08-04 02:15:31+00	2017-08-04 02:15:31+00	1
286	Hong pei	hongggpei@gmail.com	2017-04-02	0	1	Roadshows	2017-08-04 02:16:01+00	2017-08-04 02:16:01+00	1
287	Kent Loi	kent@99.co	1994-02-10	8	1	Word-of-mouth	2017-08-04 02:16:34+00	2017-08-04 02:16:34+00	1
288	Crisix	crisix45@yahoo.com	1970-12-05	0	1	Roadshows	2017-08-04 02:17:40+00	2017-08-04 02:17:40+00	1
289	Venugopalareddy	Dvgr560@gmail.com	1984-03-27	8	1	Roadshows	2017-08-04 02:18:13+00	2017-08-04 02:18:13+00	1
290	Low Hwee Minn	hweeminn1997@hotmail.com	2017-08-07	8	1	Roadshows	2017-08-04 02:18:45+00	2017-08-04 02:18:45+00	1
291	Alice Quek	alicesiv@yahoo.com	1952-09-20	0	1	Roadshows	2017-08-04 02:19:50+00	2017-08-04 02:19:50+00	1
293	Joshua	Josh.777@gmail.com	1990-08-16	0	1	Electronic Direct Mailer	2017-08-04 02:20:44+00	2017-08-04 02:20:44+00	1
294	Annie Chong	chongannie13@yahoo.com	1970-05-29	2	1	Roadshows	2017-08-04 02:21:45+00	2017-08-04 02:21:45+00	1
295	George Cheung	Bluebummountain@gmail.com	1960-10-24	0	1	Newspapers	2017-08-04 02:22:14+00	2017-08-04 02:22:14+00	1
296	Usoiss	ggash@gmail.com	1994-10-12	0	1	one-north Apps	2017-08-04 03:12:13+00	2017-08-04 03:12:13+00	1
298	Felicia	gabrial_c@hotmail.com	1990-11-25	4	1	Roadshows	2017-08-04 03:54:21+00	2017-08-04 03:54:21+00	1
300	Shenba	shenba.bala@disney.com	1976-01-04	0	1	Roadshows	2017-08-04 03:58:29+00	2017-08-04 03:58:29+00	1
301	Peggy lee	peggy.lee@disney.com	1964-05-16	2	1	Roadshows	2017-08-04 03:59:29+00	2017-08-04 03:59:29+00	1
302	Ying	ying19.ong@gmail.con	1973-01-19	0	1	Social Media	2017-08-04 04:00:03+00	2017-08-04 04:00:04+00	1
303	Elizabeth	elizabeth.ng@live.com.sg	1992-05-15	4	1	Posters	2017-08-04 04:02:36+00	2017-08-04 04:02:36+00	1
304	Loh Ying ru	yrloh@etc.a-star.edu.sg	1992-10-21	4	1	Bus Stop Ads,Electronic Direct Mailer	2017-08-04 04:03:54+00	2017-08-04 04:03:54+00	1
305	Carene	carene_loh@outlook.com	1994-08-14	0	1	Posters	2017-08-04 04:04:03+00	2017-08-04 04:04:03+00	1
307	Michelle	mpek@ibn.a-star.edu.sg	1988-07-05	4	1	Roadshows	2017-08-04 04:07:02+00	2017-08-04 04:07:02+00	1
308	Ray	ying19.ong@gmail.com	2009-11-01	0	1	Posters	2017-08-04 04:07:43+00	2017-08-04 04:07:43+00	1
310	Kang Koon hoon	kangkooihoon@gmail.com	1969-09-04	4	1	Roadshows	2017-08-04 04:09:17+00	2017-08-04 04:09:17+00	1
311	Vinitha	vini_el@yahoo.com	1985-06-18	4	1	Posters,PULSE Newsletter	2017-08-04 04:11:16+00	2017-08-04 04:11:16+00	1
312	Chris  Ang	chrissng686@gmail.com	1966-12-04	0	1	Roadshows	2017-08-04 04:11:59+00	2017-08-04 04:11:59+00	1
313	Ashah	ashahyusef@gmail.com	1978-09-19	4	1	Roadshows	2017-08-04 04:12:28+00	2017-08-04 04:12:28+00	1
314	Aidah	aidahsanzo@gmail.com	1996-02-03	0	1	Roadshows	2017-08-04 04:13:08+00	2017-08-04 04:13:08+00	1
315	Nur Nadiah	nadiahbanana@gmail.com	1997-05-26	0	1	Roadshows	2017-08-04 04:14:02+00	2017-08-04 04:14:02+00	1
316	Lee	wanxin.lee89@hotmail.com	1989-10-31	1	1	Roadshows	2017-08-04 04:14:22+00	2017-08-04 04:14:22+00	1
317	Priya retna	Rpretnam@etc.astar.edu.sg	1990-06-30	4	1	Roadshows	2017-08-04 04:15:11+00	2017-08-04 04:15:11+00	1
318	Benjamin Tai	btai@ibn.a-star.edu.sg	1977-07-16	4	1	Roadshows	2017-08-04 04:15:38+00	2017-08-04 04:15:38+00	1
319	Doreen Low	doreen_low@hq.a-star.edu.sg	1986-12-27	4	1	Roadshows	2017-08-04 04:18:28+00	2017-08-04 04:18:28+00	1
320	Ramlah	ramlah.hamid@solvay.com	1971-12-03	4	1	Roadshows	2017-08-04 04:18:52+00	2017-08-04 04:18:52+00	1
322	Juvy Pang	juvy_pang@hq.a-star.edu.sg	1990-12-07	4	1	Roadshows	2017-08-04 04:20:31+00	2017-08-04 04:20:31+00	1
323	Belinda	belinda_goh@hq.a-star.edu.sg	1988-05-18	4	1	Roadshows	2017-08-04 04:20:40+00	2017-08-04 04:20:40+00	1
324	Edna	edna-tan@scei.a-star.edu.sg	1979-03-22	2	1	Word-of-mouth	2017-08-04 04:21:18+00	2017-08-04 04:21:18+00	1
327	Soen Tien	wun_soen_tien@hq.a-star.edu.sg	1979-06-25	4	1	Electronic Direct Mailer	2017-08-04 04:22:02+00	2017-08-04 04:22:02+00	1
328	Loh pei ling	crystal_lpl@yahoo.com.sg	1980-12-07	0	1	Roadshows	2017-08-04 04:22:28+00	2017-08-04 04:22:28+00	1
329	Sophia tan	tansow@scei.a-star.edu.sg	1989-09-04	2	1	Word-of-mouth	2017-08-04 04:23:04+00	2017-08-04 04:23:04+00	1
330	Chin Zhi hui	chinzhihui@gmail.com	1991-05-31	0	1	Word-of-mouth	2017-08-04 04:23:06+00	2017-08-04 04:23:06+00	1
331	Winston	lcywinston@gmail.com	1989-11-24	4	1	Posters	2017-08-04 04:23:09+00	2017-08-04 04:23:09+00	1
332	Serena Chan	serena7707@hotmail.com	1979-03-10	0	1	Roadshows	2017-08-04 04:24:05+00	2017-08-04 04:24:05+00	1
334	Julia Goh	suyun1989@hotmail.com	1989-10-28	0	1	Roadshows	2017-08-04 04:24:34+00	2017-08-04 04:24:34+00	1
335	Low Mei jun	low_meijun@hotmail.com	1985-12-26	4	1	Roadshows	2017-08-04 04:24:59+00	2017-08-04 04:24:59+00	1
336	Lim Jaime	jaime_lim@hq.a-star.edu.sg	1977-04-07	2	1	Roadshows	2017-08-04 04:25:32+00	2017-08-04 04:25:32+00	1
337	Cindy Chua	cindy_chua@hq.a-star.edu.sg	1986-06-15	2	1	Roadshows	2017-08-04 04:26:02+00	2017-08-04 04:26:02+00	1
338	Zi Ying	winter.ozg@gmail.com	1989-01-10	2	1	Roadshows	2017-08-04 04:26:59+00	2017-08-04 04:26:59+00	1
341	Gladys	gladys_ong@live.com.sg	1978-08-06	0	1	Roadshows	2017-08-04 04:30:34+00	2017-08-04 04:30:34+00	1
342	Job Chen	crave4music@hotmail.com	1984-03-31	8	1	Roadshows	2017-08-04 04:30:35+00	2017-08-04 04:30:35+00	1
343	Teow Li fern	eteow@yahoo.com	1976-01-24	0	1	Roadshows	2017-08-04 04:31:36+00	2017-08-04 04:31:36+00	1
344	Jenny saw imm	jenny.saw@solvay.com	1964-06-29	4	1	Roadshows	2017-08-04 04:32:21+00	2017-08-04 04:32:21+00	1
345	Tom Fu	tom.fu@adsc.com.sg	1983-12-26	2	1	Electronic Direct Mailer	2017-08-04 04:32:57+00	2017-08-04 04:32:57+00	1
346	Shantini	shantini20@hotmail.com	1986-07-31	4	1	Roadshows	2017-08-04 04:33:32+00	2017-08-04 04:33:32+00	1
348	Babita Kumari	kbabita1506@gmail.com	1972-06-15	2	1	Roadshows	2017-08-04 04:34:06+00	2017-08-04 04:34:06+00	1
350	Nandita	nmenon4490@gmail.com	1990-04-04	4	1	Posters	2017-08-04 04:35:41+00	2017-08-04 04:35:41+00	1
351	Nazreen	nazreen1105@hotmail.com	1990-05-11	4	1	Posters	2017-08-04 04:35:43+00	2017-08-04 04:35:43+00	1
352	Chen Chau jye	cjchen80@yahoo.com.sg	1980-05-20	4	1	Roadshows	2017-08-04 04:36:16+00	2017-08-04 04:36:16+00	1
353	Hsieh ruoya	ruoyahsieh@gmail.com	1984-01-20	4	1	Roadshows	2017-08-04 04:36:41+00	2017-08-04 04:36:41+00	1
354	Subhashri kundu	subhashri.kundu@gmail.com	1988-09-18	4	1	Posters	2017-08-04 04:37:05+00	2017-08-04 04:37:05+00	1
355	Ketan Save	ketan@eastman.com	1970-06-05	0	1	Roadshows	2017-08-04 04:37:18+00	2017-08-04 04:37:18+00	1
356	Michael	michael26ho@gmail.com	1978-04-26	4	1	Roadshows	2017-08-04 04:37:55+00	2017-08-04 04:37:55+00	1
358	Li yongfeng	li_yongfeng@etpl.sg	1980-12-01	4	1	Roadshows	2017-08-04 04:39:17+00	2017-08-04 04:39:17+00	1
359	Ng San San	ng_san_san@nhic.sg	1984-03-26	4	1	Roadshows	2017-08-04 04:39:37+00	2017-08-04 04:39:37+00	1
360	Patrick goo	patrick_goo@etpl.sg	1985-01-12	4	1	Roadshows	2017-08-04 04:40:22+00	2017-08-04 04:40:22+00	1
361	Brenda Wong	brendawsw@hotmail.com	1993-09-24	2	1	Roadshows	2017-08-04 04:41:04+00	2017-08-04 04:41:04+00	1
362	Choo Jek Min	choo.jm@pg.com	1978-11-01	4	1	Electronic Direct Mailer	2017-08-04 04:41:36+00	2017-08-04 04:41:36+00	1
363	Lew Wei Sern Vincent	lewws@live.com	1962-09-15	1	1	Roadshows	2017-08-04 04:41:38+00	2017-08-04 04:41:38+00	1
364	Neo Rong yun	n.rongyun@gmail.com	1993-01-01	2	1	Posters	2017-08-04 04:42:14+00	2017-08-04 04:42:14+00	1
365	James yip	yipj@simtech.a-star.edu.sg	1977-10-31	2	1	Word-of-mouth	2017-08-04 04:42:33+00	2017-08-04 04:42:33+00	1
366	Dawn Marie Ng	dawnmarieng@gmail.com	1978-09-04	4	1	Newspapers	2017-08-04 04:42:38+00	2017-08-04 04:42:38+00	1
368	Pranay	pranayscom993@hotmail.com	1993-01-09	2	1	Roadshows	2017-08-04 04:43:35+00	2017-08-04 04:43:35+00	1
371	Timy on	timytimy94@gmail.com	1994-01-26	0	1	Roadshows	2017-08-04 04:44:50+00	2017-08-04 04:44:50+00	1
372	Toh Wei Lun	wltoh6@gmail.com	1993-06-06	4	1	Word-of-mouth	2017-08-04 04:46:04+00	2017-08-04 04:46:04+00	1
373	Lee Seow eng	seoweng88@yahoo.com	1973-04-23	4	1	Roadshows	2017-08-04 04:46:17+00	2017-08-04 04:46:17+00	1
374	Sonia ow	owwl@scei.a-star.edu.sg	1975-03-27	4	1	Roadshows	2017-08-04 04:49:10+00	2017-08-04 04:49:10+00	1
375	Chong Chor kun	purple_cck@hotmail.com	1991-01-31	4	1	one-north Apps,Word-of-mouth	2017-08-04 04:50:28+00	2017-08-04 04:50:28+00	1
376	Puspita	proy_11@yahoo.com	1980-11-11	4	1	Posters	2017-08-04 04:50:28+00	2017-08-04 04:50:28+00	1
377	NgoI see min	seemin.ngoi@gmail.com	1991-08-15	4	1	Roadshows	2017-08-04 04:50:34+00	2017-08-04 04:50:34+00	1
378	Tan gun rhu	gyni@gmail.com	1991-06-04	4	1	Bus Stop Ads	2017-08-04 04:51:48+00	2017-08-04 04:51:48+00	1
379	Abhishek Gupta	abhishekg@imcb.a-star.edu.sg	1987-11-13	4	1	Roadshows	2017-08-04 04:54:19+00	2017-08-18 04:03:31+00	1
381	Katherine ang	katang_sunset@yahoo.com-sg	1975-06-15	0	1	Roadshows	2017-08-04 04:56:11+00	2017-08-04 04:56:11+00	1
382	Felicia	fengyi_sky@yahoo.com.sg	1980-08-01	4	1	Roadshows	2017-08-04 04:56:52+00	2017-08-04 04:56:52+00	1
385	Wong Chi Yan	chiyan.94@gmail.com	1994-12-13	0	1	Word-of-mouth	2017-08-04 04:58:07+00	2017-08-04 04:58:07+00	1
386	Nic	rho@imcb.edu.sg	1986-05-21	4	1	Roadshows	2017-08-04 04:58:26+00	2017-08-04 04:58:26+00	1
387	Tian Junfu	implicittian@gmail.com	1994-06-05	2	1	Roadshows	2017-08-04 04:59:44+00	2017-08-04 04:59:44+00	1
388	Lixin	lixin96710@gmail.com	1996-07-10	2	1	Roadshows	2017-08-04 04:59:45+00	2017-08-04 04:59:45+00	1
389	Humaira	nur_humaira_fuadi@brc.a-star.edu.sg	1993-09-08	4	1	Posters	2017-08-04 05:01:51+00	2017-08-04 05:01:51+00	1
390	Syahidah	nur_syahidah@brc.a-star.edu.sg	1992-12-02	4	1	Roadshows	2017-08-04 05:02:08+00	2017-08-04 05:02:08+00	1
391	Ayuni	nur_ayuni_muhdtaib@brc.a-star.edu.sg	1995-05-24	0	1	Bus Stop Ads	2017-08-04 05:02:15+00	2017-08-04 05:02:15+00	1
392	Nissah	khairun_nissah_misnawi@brc.a-star.edu.sg	1992-08-15	4	1	Roadshows	2017-08-04 05:03:16+00	2017-08-04 05:03:16+00	1
393	Kirsten	kirsten.ko.from.tp@imb.a-star.edu.sg	1995-04-09	4	1	Word-of-mouth	2017-08-04 05:03:43+00	2017-08-04 05:03:43+00	1
394	Andrew chan	andrew.chan@imb.a-star.edu.sg	1990-03-27	0	1	Roadshows	2017-08-04 05:03:51+00	2017-08-04 05:03:51+00	1
395	Leong Hwei fen	hfleong@imcb.astar.edu.sg	1977-06-24	4	1	Electronic Direct Mailer	2017-08-04 05:06:09+00	2017-08-04 05:06:09+00	1
396	Eileen Poon	songlp@yahoo.com	1979-07-22	4	1	Roadshows	2017-08-04 05:06:53+00	2017-08-04 05:06:53+00	1
397	Ashley	yyee_2000@yahoo.com	1980-11-04	4	1	Roadshows	2017-08-04 05:07:01+00	2017-08-04 05:07:01+00	1
398	Aashoo	ashg1999@yahoo.com	1972-03-24	2	1	Roadshows	2017-08-04 05:07:20+00	2017-08-04 05:07:20+00	1
399	Alicia yu	aliciayu2006@gmail.com	1979-01-22	0	1	Roadshows	2017-08-04 05:08:11+00	2017-08-04 05:08:11+00	1
400	Tan Chek semg	chekseng80@outlook.com	1980-05-11	0	1	Roadshows	2017-08-04 05:08:30+00	2017-08-04 05:08:30+00	1
402	Valeria Kew	valinkew@gmail.com	1979-11-23	4	1	Roadshows	2017-08-04 05:09:32+00	2017-08-04 05:09:32+00	1
403	Smith nambiar-mann	smitanambiar@gmail.com	1982-02-26	4	1	Roadshows	2017-08-04 05:09:45+00	2017-08-04 05:09:45+00	1
404	Lennard	lennardfoo92@gmail.com	1992-12-12	2	1	Posters	2017-08-04 05:10:47+00	2017-08-04 05:10:47+00	1
405	Michelle	xheartiesx@gmail.com	1992-04-17	2	1	Roadshows	2017-08-04 05:10:58+00	2017-08-04 05:10:58+00	1
406	tanisha garg	tanishagarg1708@gmail.com	1995-08-17	2	1	Posters	2017-08-04 05:11:01+00	2017-08-04 05:11:01+00	1
410	Serene	punyeuny@hotmail.com	1984-11-01	0	1	Roadshows	2017-08-04 05:14:48+00	2017-08-04 05:14:48+00	1
412	Irfan silalahi	silalahirfan@gmail.com	1992-09-18	4	1	Word-of-mouth	2017-08-04 05:15:27+00	2017-08-04 05:15:27+00	1
413	Venetia ong	venetiaong@hotmail.com	1977-05-04	0	1	Roadshows	2017-08-04 05:18:25+00	2017-08-04 05:18:25+00	1
414	Khoh Chiou Ling	chiouling.khoh@sgx.com	1966-12-31	1	1	Roadshows	2017-08-04 05:19:33+00	2017-08-04 05:19:33+00	1
415	Bee	bee_owen@hotmail.com	1990-03-03	4	1	Roadshows	2017-08-04 05:20:00+00	2017-08-04 05:20:00+00	1
416	Elijah pathak	pathake@gis.a-star.edu.sg	1984-06-04	4	1	Roadshows	2017-08-04 05:21:48+00	2017-08-04 05:21:48+00	1
417	Ranie	ranie@gis.astar.edu.sg	1982-01-04	4	1	Roadshows	2017-08-04 05:22:31+00	2017-08-04 05:22:31+00	1
418	Siew Kiang	fejeje@yahoo.com	1995-08-19	0	1	Posters	2017-08-04 05:25:16+00	2017-08-04 05:25:16+00	1
419	Yang Li ling	yangliling@gmail.com	1980-11-30	2	1	PULSE Newsletter	2017-08-04 05:26:03+00	2017-08-04 05:26:03+00	1
420	Jean Lim	jeanlbk@yahoo.com.sg	1965-04-26	0	1	Roadshows	2017-08-04 05:26:38+00	2017-08-04 05:26:38+00	1
422	Chong Keat	ckwong80@gmail.com	1980-08-06	0	1	Roadshows	2017-08-04 05:26:52+00	2017-08-04 05:26:52+00	1
423	Grace nai	monokabo@gmail.com	1994-01-04	0	1	Roadshows	2017-08-04 05:28:10+00	2017-08-04 05:28:10+00	1
424	Krishnaveni	krishnaveni_sautherarajan@bbc.a-star.edu.sg	1993-12-29	4	1	Word-of-mouth	2017-08-04 05:29:01+00	2017-08-04 05:29:01+00	1
425	Siti Diana Jambari	diana_jambari@bbc.a-star.edu.sg	1990-01-24	4	1	Roadshows	2017-08-04 05:29:02+00	2017-08-04 05:29:02+00	1
426	Zhang Siting	stzhang@ibn.a-star.edu.sg	1990-06-19	4	1	Roadshows	2017-08-04 05:34:01+00	2017-08-04 05:34:01+00	1
427	Zhang Siting	stzhang@ibn.a-star.edu.sg	1990-06-19	4	1	Roadshows	2017-08-04 05:34:01+00	2017-08-04 05:34:01+00	1
428	Claire	marineht@hotmail.com	1986-05-03	4	1	Posters	2017-08-04 05:34:58+00	2017-08-04 05:34:59+00	1
430	Alrik Tan	alrik_tan@etpl.sg	1990-05-07	4	1	Roadshows	2017-08-04 05:36:42+00	2017-08-04 05:36:42+00	1
431	Dominic Phua	pangera@gmail.com	1975-04-07	0	1	Roadshows	2017-08-04 05:37:25+00	2017-08-04 05:37:25+00	1
432	Hongbing	hbyu@imcb.a-star.edu.sg	1978-11-08	4	1	Roadshows	2017-08-04 05:37:31+00	2017-08-04 05:37:31+00	1
433	Ruifen	wengruifen@etpl.sg	1982-08-04	4	1	Roadshows	2017-08-04 05:37:49+00	2017-08-04 05:37:50+00	1
434	Tan Yik Wei	yikweit@gmail.com	1984-12-11	0	1	Roadshows	2017-08-04 05:38:46+00	2017-08-04 05:38:46+00	1
435	Jinghan	jhhong@imcb.s-star.edu.sg	1987-10-23	4	1	Roadshows	2017-08-04 05:38:50+00	2017-08-04 05:38:50+00	1
436	Lynn low	lowap@scei.astar.edu.sg	1980-12-15	4	1	Roadshows	2017-08-04 05:40:13+00	2017-08-04 05:40:13+00	1
438	Emily ng	ngsl@scei.a-star.edu.sg	1970-03-04	0	1	Roadshows	2017-08-04 05:40:20+00	2017-08-04 05:40:20+00	1
439	Er Poh Nee	con1225@hotmail.com	1973-04-25	0	1	Roadshows	2017-08-04 05:42:45+00	2017-08-04 05:42:45+00	1
440	Ranjani	nellorevr@d3.a-star.com	1967-10-25	4	1	Roadshows	2017-08-04 05:43:48+00	2017-08-04 05:43:48+00	1
441	Diana jay Umrani	dhananjay@d3.a-star.edu.sg	1974-04-10	0	1	Roadshows	2017-08-04 05:44:37+00	2017-08-04 05:44:37+00	1
442	Edmund tan	edmund.trex@hotmail.com	1993-07-26	0	1	Roadshows	2017-08-04 05:54:10+00	2017-08-04 05:54:10+00	1
444	Subha	subha.biotech@gmail.com	1983-01-11	0	1	Social Media	2017-08-04 05:54:33+00	2017-08-04 05:54:33+00	1
445	Smarajit	chakrabortysmarajit@gmail.com	1981-07-07	0	1	Roadshows	2017-08-04 05:54:59+00	2017-08-04 05:54:59+00	1
447	Charlotte	tan_siang_choo@nea.gov.sg	1957-08-20	4	1	Roadshows	2017-08-04 05:56:54+00	2017-08-04 05:56:54+00	1
448	Mei	weimei_guo@biotrans.astar.edu.sg	1986-12-24	4	1	Roadshows	2017-08-04 05:58:27+00	2017-08-04 05:58:27+00	1
449	Linqin	limlinqin@hotmail.com	1993-06-07	4	1	Posters	2017-08-04 05:58:35+00	2017-08-04 05:58:35+00	1
450	chuajiaqi	chuajiaqi2004@yahoo.com.sg	1991-11-11	0	1	Roadshows	2017-08-04 07:09:22+00	2017-08-04 07:09:22+00	1
453	Lim Boon Whatt	boonwhatt@gmail.com	1972-03-30	0	1	Word-of-mouth	2017-08-04 15:22:42+00	2017-08-04 15:22:42+00	1
454	Eng Yong Leng	mandywong_915@hotmail.com	2011-12-14	0	1	Social Media	2017-08-05 15:22:36+00	2017-08-05 15:24:22+00	1
456	Eng Siang Hui	SH_ENG2@YAHOO.COM.SG	1978-04-22	0	1	Social Media	2017-08-05 15:26:39+00	2017-08-05 15:26:39+00	1
458	Li Ting	smiley_libra89@hotmail.com	1989-09-24	0	1	Posters	2017-08-06 06:22:26+00	2017-08-06 06:22:26+00	1
459	HILDA ZOE CHAN	hildazoechan@yahoo.com.sg	1962-01-07	0	1	Posters	2017-08-06 07:24:35+00	2017-08-06 07:24:35+00	1
461	Charles Tang	charlestangfy@gmail.com	1970-06-25	0	1	Social Media	2017-08-06 15:30:19+00	2017-08-06 15:30:19+00	1
462	Ian tang	gracekaosj@yahoo.com.sg	2011-08-17	0	1	Social Media	2017-08-06 15:31:31+00	2017-08-14 15:12:16+00	1
464	Lim Junfeng	enyel@mail.com	2017-03-01	0	1	Word-of-mouth	2017-08-07 14:12:04+00	2017-08-07 14:15:12+00	1
465	aditya angad chandiramani	aditya.chandiramani@gmail.com	2002-09-09	0	1	Word-of-mouth	2017-08-08 03:35:05+00	2017-08-08 03:35:05+00	1
466	Melissa	swashed@hotmail.com	1987-01-08	0	1	Roadshows	2017-08-08 03:52:47+00	2017-08-19 03:10:00+00	1
467	Kelvin	kelvin_ntuni@yahoo.com	1982-03-27	0	1	Roadshows	2017-08-08 03:53:46+00	2017-08-19 03:12:03+00	1
468	Daniel Zhou	daniel.zhouqx@gmail.com	2003-08-07	0	1	Posters	2017-08-08 04:29:18+00	2017-08-08 04:29:18+00	1
470	Yong Ann Chie	yannchie@gmail.com	1976-02-20	0	1	Posters	2017-08-08 04:32:44+00	2017-08-08 04:32:44+00	1
471	Luther James Balat	lutherjames@gmail.com	1979-11-30	0	1	Posters	2017-08-08 05:02:42+00	2017-08-08 05:02:42+00	1
472	Elisha Adrienne Balat	jhell29@yahoo.com	2005-04-08	2	1	Bus Stop Ads	2017-08-08 05:21:18+00	2017-08-08 05:21:18+00	1
474	li jing	gaohenry@gmail.com	1975-11-27	0	1	Posters	2017-08-08 08:05:12+00	2017-08-08 08:06:38+00	1
475	Lee Yinjie	Yinjie13@gmail.com	1982-01-13	0	1	Posters	2017-08-08 09:29:18+00	2017-08-08 09:29:18+00	1
476	Nathanael	hckhiong@gmail.com	1957-04-08	0	1	Newspapers	2017-08-08 09:58:32+00	2017-08-08 09:58:32+00	1
478	Michael	michaelshlim@singnet.com.sg	1963-05-08	0	1	Posters	2017-08-08 12:37:46+00	2017-08-08 12:37:46+00	1
480	Ann Goh	germaine2598@gmail.com	1963-10-19	0	1	Bus Stop Ads	2017-08-08 12:51:54+00	2017-08-08 12:52:56+00	1
481	Ann Goh	s10162713@connect.np.edu.sg	1963-10-19	0	1	Posters	2017-08-08 13:05:00+00	2017-08-08 13:05:00+00	1
483	Foo Ren Hean	tanikpei@gmail.com	2005-05-05	0	1	Electronic Direct Mailer	2017-08-08 13:14:29+00	2017-08-08 13:17:37+00	1
485	Leong Kwok Hoe Matthew	leong_matthew@hotmail.com	1975-06-20	0	1	Posters	2017-08-08 13:25:10+00	2017-08-08 13:25:10+00	1
486	Caren Tan	carentangp@hotmail.com	1973-01-12	0	1	Posters	2017-08-08 13:25:56+00	2017-08-08 13:25:56+00	1
487	KWAN SIANG HUI	popurchin@yahoo.com	2017-08-18	0	1	Posters	2017-08-08 14:04:55+00	2017-08-08 14:27:31+00	1
488	Seow Boon Kian	janson@watsonep.com.com	2017-08-19	0	1	Posters	2017-08-08 14:10:38+00	2017-08-08 14:10:38+00	1
491	Kwan Siang Hoon	kkwan06@yahoo.com.sg	2017-08-19	0	1	Posters	2017-08-08 14:15:02+00	2017-08-08 14:15:02+00	1
492	Tan Teck Loon	tanteckloon@gmail.com	1977-11-16	0	1	Electronic Direct Mailer	2017-08-09 07:04:59+00	2017-08-09 07:04:59+00	1
493	Steven Chua	stevenchua@onpress.cc	1970-08-26	0	1	Posters	2017-08-09 07:34:55+00	2017-08-09 07:34:55+00	1
494	Quint Fillie	nicolehouweling@hotmail.com	2010-05-25	0	1	Posters	2017-08-09 07:40:28+00	2017-08-09 07:42:22+00	1
495	Saksham Sood	sakshamsood7@gmail.com	1993-10-25	2	1	Roadshows	2017-08-09 10:58:57+00	2017-08-09 10:58:57+00	1
496	Jane Ang	janenyou@gmail.com	1988-05-19	0	1	Posters,Electronic Direct Mailer	2017-08-09 13:03:42+00	2017-08-09 13:03:42+00	1
500	Pam	pammcake@hotmail.com	1971-08-11	0	1	Posters	2017-08-10 03:37:08+00	2017-08-10 03:37:08+00	1
502	Kenneth Chang	kenneth@ape.sg	1992-07-07	0	1	Roadshows	2017-08-10 07:25:22+00	2017-08-10 07:25:22+00	1
505	Joy Mak Shi Xuan	yk_mak@hotmail.com	2008-02-29	0	1	Electronic Direct Mailer	2017-08-10 10:53:47+00	2017-08-10 10:53:47+00	1
506	Choo Hui En	enen-janggeum@hotmail.com	1992-10-05	0	1	Posters	2017-08-10 11:41:25+00	2017-08-10 11:41:25+00	1
507	John Lim	john_limhc@hotmail.com	1968-03-02	0	1	Newspapers	2017-08-10 12:15:16+00	2017-08-10 12:15:16+00	1
511	Wong Yan Siang kaelan	sufen0419@gmail.com	2009-08-20	0	1	Posters	2017-08-10 13:15:37+00	2017-08-10 13:15:37+00	1
512	Chester	ongytc@gmail.com	1985-02-06	0	1	Social Media	2017-08-10 13:52:41+00	2017-08-10 13:52:41+00	1
513	Wen Tong	wentongneo@gmail.com	1988-11-10	0	1	Word-of-mouth	2017-08-10 13:54:53+00	2017-08-10 13:54:53+00	1
514	Asher tan	onge05@gmail.com	2013-11-18	0	1	Word-of-mouth	2017-08-10 14:57:45+00	2017-08-11 09:34:34+00	1
515	Jay Soh	jaysoh000@outlook.com	1992-02-06	0	1	Word-of-mouth	2017-08-10 15:25:43+00	2017-08-10 15:25:43+00	1
516	Sia Kian Chuan	siakianchuan@gmail.com	1979-02-13	0	1	Posters	2017-08-10 15:41:19+00	2017-08-10 15:41:19+00	1
517	Choong Lee Yee	nmicly@gmail.com	1981-06-05	0	1	Posters	2017-08-10 15:43:43+00	2017-08-10 15:43:43+00	1
518	Wendy Loy	loyyongyi_98@hotmail.com	1998-05-15	0	1	Social Media	2017-08-10 17:52:27+00	2017-08-10 17:52:27+00	1
519	Graeme	lpehong@yahoo.com	1973-09-09	0	1	Posters	2017-08-10 21:31:31+00	2017-08-10 21:49:16+00	1
520	Hazel Chong	hazelchong@yahoo.com.sg	1973-07-21	0	1	Social Media	2017-08-11 03:30:38+00	2017-08-11 03:30:38+00	1
521	Jeremy Lim Fang Siang	jerlim78@gmail.com	1978-03-22	0	1	Social Media	2017-08-11 03:54:09+00	2017-08-11 03:54:09+00	1
522	Li hoi man	mandy.hoiman@gmail.com	1982-03-11	0	1	one-north Apps	2017-08-11 04:26:15+00	2017-08-18 04:23:52+00	1
523	Shona ong	sze_ong@yahoo.com	1976-09-15	0	1	Social Media	2017-08-11 09:43:35+00	2017-08-11 09:43:35+00	1
524	Emi Maruyama	Minerva002002@yahoo.co.jp	2017-08-18	0	1	Social Media	2017-08-11 10:56:29+00	2017-08-11 10:56:29+00	1
525	Katelyn Tan	chianie001@gmail.com	2010-10-03	0	1	Social Media	2017-08-11 10:58:04+00	2017-08-11 11:00:14+00	1
526	Grace tan	aikling.tan@nie.edu.sg	2009-06-18	0	1	Posters	2017-08-11 13:48:57+00	2017-08-11 13:48:57+00	1
527	wong seok fun	i_funfun@yahoo.com.sg	1973-02-15	0	1	Social Media	2017-08-11 13:58:39+00	2017-08-11 13:58:39+00	1
528	Ho Min Min	ho_minmin@yahoo.com	1974-05-12	6	1	Electronic Direct Mailer	2017-08-11 15:27:09+00	2017-08-11 15:27:09+00	1
529	SHI YANG	ZYSHI@SINGNET.COM.SG	1975-12-25	0	1	Posters	2017-08-11 16:09:52+00	2017-08-11 16:09:52+00	1
531	Lee Aye Li	leeayeli@hotmail.com	1970-06-07	0	1	Social Media	2017-08-12 00:08:18+00	2017-08-12 00:09:33+00	1
532	michael tan	michaeltan10@hotmail.com	1970-08-18	0	1	Posters	2017-08-12 00:25:44+00	2017-08-12 00:25:44+00	1
534	Rayden Koh	mudbell@hotmail.com	2011-05-23	0	1	Social Media	2017-08-12 00:35:56+00	2017-08-12 00:37:01+00	1
535	Vivian Goh	vivian@keon.com.sg	1974-11-17	0	1	Posters	2017-08-12 01:06:50+00	2017-08-12 01:06:50+00	1
536	Sherry	xueying.wang1@gmail.com	1978-06-19	4	1	Electronic Direct Mailer	2017-08-12 01:23:11+00	2017-08-12 01:23:11+00	1
537	Siew Chin Lau	scdoro@gmail.com	1981-02-11	0	1	Posters	2017-08-12 02:02:48+00	2017-08-12 02:02:48+00	1
540	Sally Xu	Yukijasmine@singnet.com.sg	1971-04-08	0	1	Social Media	2017-08-12 05:23:15+00	2017-08-12 05:23:15+00	1
541	David wong	davidnjohn@icloud.com	2006-10-05	0	1	PULSE Newsletter	2017-08-12 10:29:50+00	2017-08-12 10:29:50+00	1
542	Ang Teng Yang Bennetton	beehweefang@hotmail.sg	2005-08-03	0	1	Posters	2017-08-12 12:27:21+00	2017-08-12 12:38:21+00	1
543	esrivishagan	esrivishagan@gmail.com	2004-06-20	0	1	Roadshows	2017-08-12 13:18:29+00	2017-08-18 04:09:48+00	1
544	leong Yuit Sim	yuitsim@gmail.com	1953-03-28	0	1	Posters	2017-08-12 13:25:22+00	2017-08-12 13:40:44+00	1
546	Lim Juay Khiang	jkhiang@yahoo.com.sg	1960-08-18	0	1	Newspapers	2017-08-12 23:51:03+00	2017-08-12 23:51:03+00	1
547	Lee Tat Wee	leetatwee@yahoo.com.sg	1972-10-13	0	1	Newspapers	2017-08-13 00:33:48+00	2017-08-13 00:33:48+00	1
548	Mun Lai Fun	munlaifun@yahoo.com.sg	1973-12-30	0	1	Newspapers	2017-08-13 00:40:48+00	2017-08-13 00:40:48+00	1
551	Lee Tze Yee, Sarah	sarahleety@yahoo.com.sg	2005-10-21	0	1	Word-of-mouth	2017-08-13 00:44:08+00	2017-08-13 00:44:08+00	1
554	Fong pui san	psfong@gmail.com	1973-12-06	0	1	Newspapers	2017-08-13 01:34:22+00	2017-08-13 01:34:22+00	1
555	Yvonne Lye	yvonnelye7@gmail.com	2017-07-29	0	1	Word-of-mouth	2017-08-13 01:34:44+00	2017-08-13 01:34:44+00	1
557	Megan lim	yixinmegan@gmail.com	2007-06-15	0	1	Newspapers	2017-08-13 01:42:16+00	2017-08-13 01:42:16+00	1
558	Tham Kok Wai	thamkokwai@yahoo.com.sg	1952-09-05	0	1	Newspapers	2017-08-13 02:19:13+00	2017-08-13 02:19:13+00	1
559	Tan Sioh Tiang	siohtiang@yahoo.com.sg	1953-05-29	0	1	Newspapers	2017-08-13 02:27:43+00	2017-08-13 02:27:43+00	1
560	Tan Siew Hiang	thankenny@yahoo.com.sg	1975-10-26	0	1	Newspapers	2017-08-13 02:34:51+00	2017-08-13 02:36:02+00	1
565	Tan Keng Yang	chinhup88@gmail.com	2009-01-31	0	1	Bus Stop Ads	2017-08-13 03:01:08+00	2017-08-13 03:01:08+00	1
566	Tan Keng Woon	hupatwork@gmail.com	2007-03-20	0	1	Bus Stop Ads	2017-08-13 03:05:06+00	2017-08-13 03:05:06+00	1
568	Tan Yan Tong	riskyhup@gmail.com	2017-08-13	0	1	one-north Apps	2017-08-13 03:12:11+00	2017-08-13 03:12:11+00	1
570	Ang  Siew Lan	siewlan0503@yahoo.com.sg	1971-03-05	0	1	Bus Stop Ads	2017-08-13 03:34:20+00	2017-08-13 03:34:20+00	1
571	Tan Chin Hup	chinhup@a8.sg	1973-02-21	0	1	Bus Stop Ads	2017-08-13 03:35:55+00	2017-08-13 03:35:55+00	1
573	Ong wei li	ongweili@gmail.com	1982-10-18	0	1	Posters,Word-of-mouth	2017-08-13 04:14:39+00	2017-08-13 04:14:39+00	1
574	Peter Lo	peter.ss.lo@gmail.com	1968-12-25	0	1	Newspapers	2017-08-13 05:19:37+00	2017-08-13 05:19:37+00	1
575	Charmaine Tan	tancharmaine@hotmail.com	1967-05-19	0	1	Newspapers	2017-08-13 05:28:11+00	2017-08-13 05:46:08+00	1
576	Khoo boochong	davidkhoo2013@gmail.com	1956-06-16	0	1	Newspapers	2017-08-13 05:53:23+00	2017-08-13 05:53:23+00	1
577	Lynette Lee	lynlolee@gmail.com	1967-01-16	0	1	Newspapers	2017-08-13 06:41:49+00	2017-08-13 06:41:49+00	1
579	Lim  Hock  Heng	limnghockheng@yahoo.com.sg	1966-07-23	0	1	Newspapers	2017-08-13 06:49:26+00	2017-08-13 06:49:26+00	1
580	Joanna lim	Sohharlim@hotmail.com	1972-11-21	0	1	Newspapers	2017-08-13 07:13:34+00	2017-08-13 07:13:34+00	1
584	Rennie SNG	rennie_sng@yahoo.com	1974-01-06	0	1	Newspapers	2017-08-13 12:21:28+00	2017-08-13 12:21:28+00	1
585	Akane SNG	renlivegreat@gmail.com	1976-10-03	0	1	Newspapers	2017-08-13 12:24:49+00	2017-08-13 12:28:03+00	1
586	Ng Siong lok	vinceng11@hotmail.com	2008-08-03	0	1	Newspapers	2017-08-13 12:27:29+00	2017-08-13 12:27:29+00	1
587	PATRICK CHUA CHONG YEW	lookforchange@yahoo.com.sg	1972-07-11	0	1	Social Media	2017-08-13 12:27:45+00	2017-08-13 12:47:45+00	1
589	MSun	muzsun@outlook.com	2008-03-31	0	1	Newspapers	2017-08-13 13:02:28+00	2017-08-13 13:42:20+00	1
590	Janis Chan	julesp07@yahoo.com.sg	2010-06-14	0	1	Newspapers	2017-08-13 13:06:50+00	2017-08-13 13:11:36+00	1
592	James Chan	juleszwergie@gmail.com	2007-10-29	0	1	Newspapers	2017-08-13 13:12:45+00	2017-08-13 13:12:45+00	1
596	Claudia Tan	huikoh@hotmail.com	2006-08-30	0	1	Newspapers	2017-08-13 13:19:03+00	2017-08-13 13:23:20+00	1
597	Wayne Chua	wayne@playpoint.com.sg	1974-02-04	0	1	Newspapers	2017-08-13 13:37:35+00	2017-08-13 13:37:35+00	1
598	Pang Kok Leong	ultrabam@yahoo.com	1977-02-17	0	1	Posters	2017-08-13 13:42:28+00	2017-08-13 13:42:28+00	1
602	Caleb Pang Yi Yang	xtineloopy@ymail.com	2006-10-08	0	1	Posters	2017-08-13 13:48:05+00	2017-08-17 12:29:17+00	1
604	KSun	koumei_sng@outlook.com	2009-12-04	0	1	Newspapers	2017-08-13 13:50:13+00	2017-08-13 13:50:13+00	1
605	Avan Ong	rachelang15@gmail.com	2003-08-26	0	1	Posters,Bus Stop Ads	2017-08-13 13:52:49+00	2017-08-13 13:52:49+00	1
608	Juliana Goh	julianajusuf@yahoo.com.sg	1969-09-27	0	1	Newspapers	2017-08-13 14:26:17+00	2017-08-13 14:35:00+00	1
609	james livetest	jsim2583@gmail.com	1983-06-15	2	1	Roadshows	2017-08-13 14:32:42+00	2017-08-13 14:32:42+00	1
611	Wong  Peck Wei	wongpww@hotmail.com	1972-02-24	2	1	Newspapers	2017-08-13 14:55:12+00	2017-08-13 14:55:12+00	1
612	Jonathan	jontann95@hotmail.com	1992-04-10	0	1	Social Media	2017-08-13 15:05:58+00	2017-08-13 15:05:58+00	1
613	Steffany Poh	pohsteffany@gmail.com	1991-11-07	0	1	Social Media	2017-08-13 16:00:25+00	2017-08-13 16:00:25+00	1
615	Dewey Ng	ng.dewey@gmail.com	1996-12-10	0	1	Electronic Direct Mailer	2017-08-14 01:08:45+00	2017-08-14 01:08:45+00	1
617	Chua Sze Min	sminc98@gmail.com	1998-03-19	0	1	Word-of-mouth	2017-08-14 02:16:34+00	2017-08-14 02:16:34+00	1
619	CHIA WEE SOON	NEACWS@HOTMAIL.COM	1953-09-25	0	1	Newspapers	2017-08-14 02:43:57+00	2017-08-14 02:43:57+00	1
620	Hans Carter	hans.carter@ascendas-singbridge.com	1990-06-12	2	1	Word-of-mouth	2017-08-14 03:00:09+00	2017-08-14 03:00:09+00	1
621	Hazel Tow	yunnie6@gmail.com	1979-10-11	0	1	Social Media	2017-08-14 03:08:54+00	2017-08-14 03:08:54+00	1
623	Chong Yin Kiat	yinkiat.chong@instivite.com	1977-04-16	0	1	Word-of-mouth	2017-08-14 03:41:37+00	2017-08-14 03:41:37+00	1
624	Lewis	chan.lewista@gmail.com	1980-05-01	0	1	Word-of-mouth	2017-08-14 04:13:13+00	2017-08-14 04:13:13+00	1
625	Li-May Chew	limay_chew@yahoo.com	1976-09-22	0	1	Word-of-mouth	2017-08-14 04:22:53+00	2017-08-14 04:22:53+00	1
626	Kieran Chai	alexcdigi@yahoo.com	2008-08-30	0	1	Word-of-mouth	2017-08-14 04:23:42+00	2017-08-14 04:23:42+00	1
627	Jayvier Ang	hopauline0907@yahoo.com.sg	2009-06-30	0	1	Word-of-mouth	2017-08-14 05:05:16+00	2017-08-14 05:05:16+00	1
630	gabriel-tjio	gtjio86@yahoo.com	1986-01-29	2	1	Posters,Electronic Direct Mailer	2017-08-14 05:20:40+00	2017-08-14 05:20:40+00	1
631	Linda Lim	linda_lim@bbc.a-star.edu.sg	1988-02-12	2	1	Electronic Direct Mailer	2017-08-14 05:37:07+00	2017-08-14 05:37:07+00	1
632	Quek Ee Ling Ivy	quekel@gis.a-star.edu.sg	1980-10-20	4	1	Electronic Direct Mailer	2017-08-14 05:45:01+00	2017-08-14 05:45:01+00	1
633	Lee Ai Shan	leeas@gis.a-star.edu.sg	1979-09-17	4	1	Electronic Direct Mailer	2017-08-14 05:46:41+00	2017-08-14 05:46:41+00	1
634	Xin Siyuan	prophet_xsy@hotmail.com	1985-03-20	0	1	Word-of-mouth	2017-08-14 06:03:20+00	2017-08-14 06:03:20+00	1
635	rachel	fangshiyi@hotmail.com	1988-12-18	0	1	Word-of-mouth	2017-08-14 06:04:06+00	2017-08-18 02:16:03+00	1
636	Jessie Tan	gntan@hotmail.com	1970-07-12	0	1	Newspapers	2017-08-14 06:04:20+00	2017-08-14 06:04:20+00	1
640	Adrian Mah	adrianmah@gmail.com	1979-04-27	0	1	PULSE Newsletter	2017-08-14 06:41:50+00	2017-08-14 06:41:50+00	1
641	Wylie CHAN	wylie.chan@gmail.com	1979-06-28	0	1	Word-of-mouth	2017-08-14 06:52:37+00	2017-08-14 06:52:37+00	1
642	Kyan So Chuan Zhe	seongmeng@gmail.com	2008-07-22	0	1	Newspapers	2017-08-14 07:06:16+00	2017-08-14 07:06:16+00	1
644	CHUA Shu Ling Keryn	chuasl@gis.a-star.edu.sg	1983-01-03	4	1	Electronic Direct Mailer	2017-08-14 07:16:44+00	2017-08-14 07:16:44+00	1
645	Silvia	boen.s@pg.com	1985-02-25	4	1	Social Media	2017-08-14 07:22:22+00	2017-08-14 07:22:22+00	1
649	Khoo W K	sylvia.limhk@hotmail.com	2011-11-30	0	1	Word-of-mouth	2017-08-14 07:49:24+00	2017-08-14 07:49:24+00	1
650	Peter CL Tan	cltan6009@gmail.com	2013-04-09	0	1	Social Media	2017-08-14 07:56:03+00	2017-08-14 07:56:03+00	1
651	Deon Lai	laisensei@gmail.com	1972-12-07	0	1	Social Media	2017-08-14 08:04:36+00	2017-08-14 08:04:36+00	1
652	Teo Hong Jay	teohongjay@gmail.com	2007-04-22	0	1	Newspapers	2017-08-14 08:07:09+00	2017-08-14 08:07:09+00	1
655	Yan Xu	wander.leibe@gmail.com	2010-05-20	0	1	Electronic Direct Mailer	2017-08-14 08:18:47+00	2017-08-14 08:18:47+00	1
658	Philip	snappyboy.p@gmail.com	1996-06-05	0	1	Social Media	2017-08-14 09:05:41+00	2017-08-14 09:05:41+00	1
660	Yina	sakinahzyina@gmail.com	1996-03-22	0	1	Social Media	2017-08-14 09:08:20+00	2017-08-14 09:08:20+00	1
661	wyndee	hellooooooo@hello.sg	1994-05-10	0	1	Roadshows	2017-08-14 09:26:18+00	2017-08-14 09:26:18+00	1
663	Arun	arunprasad.sholi@gmail.com	2006-05-22	0	1	Posters	2017-08-14 09:52:55+00	2017-08-14 09:52:55+00	1
664	Dorothy Low	Dorotlow@yahoo.com	1971-04-05	0	1	Word-of-mouth	2017-08-14 09:55:48+00	2017-08-14 09:55:48+00	1
667	Janine Jennifer Ng	janinejennifer.ng@gmail.com	1990-02-25	2	1	Roadshows	2017-08-14 10:49:12+00	2017-08-14 10:49:12+00	1
671	SP Chan	panzersp72@gmail.com	1972-09-11	4	1	Social Media	2017-08-14 11:39:58+00	2017-08-14 11:39:58+00	1
672	jareth goh	liling8600@gmail.com	2008-06-06	0	1	Social Media	2017-08-14 12:40:42+00	2017-08-14 12:40:42+00	1
673	Christopher Yeow	chee.hew@clearstate.com	1973-01-02	2	1	Posters	2017-08-14 13:09:55+00	2017-08-14 13:14:29+00	1
676	Yeow Chien Ying	chienyingyeow@hotmail.com	2007-12-30	0	1	Posters	2017-08-14 13:13:08+00	2017-08-14 13:13:08+00	1
677	Gordon NG	gordonng007@gmail.com	1970-05-16	0	1	Newspapers	2017-08-14 13:14:22+00	2017-08-14 13:14:22+00	1
678	May	01sggm@gmail.com	1968-04-10	0	1	Social Media	2017-08-14 13:24:11+00	2017-08-14 13:24:11+00	1
679	beatrice yeo	tmrnvrcome@gmail.com	1991-06-28	4	1	Electronic Direct Mailer	2017-08-14 13:24:35+00	2017-08-14 13:24:35+00	1
680	Lim yi ming	yi_ming92@hotmail.com	1992-05-02	0	1	Social Media	2017-08-14 13:29:00+00	2017-08-14 13:29:00+00	1
682	Hngoi Zi Xin	love_xinno@hotmail.com	1990-11-16	0	1	Social Media	2017-08-14 14:08:49+00	2017-08-14 14:08:49+00	1
683	Ben Clark Balase	benclarkbalase@gmail.com	1995-02-18	0	1	Social Media	2017-08-14 14:14:47+00	2017-08-14 14:14:47+00	1
685	Ma Chung Wai	timothymacw@gmail.com	1968-03-16	0	1	Word-of-mouth	2017-08-14 15:07:09+00	2017-08-14 15:07:09+00	1
686	Ma Qi-En	maqien5@gmail.com	2002-10-05	0	1	Word-of-mouth	2017-08-14 15:08:39+00	2017-08-14 15:08:39+00	1
687	Ma Xin-En	chungwaima@gmail.com	1999-09-27	0	1	Word-of-mouth	2017-08-14 15:09:37+00	2017-08-14 15:09:37+00	1
688	Nikole Liang Xuanni	rodney.neo@gmail.com	2010-01-08	0	1	Social Media	2017-08-14 22:25:14+00	2017-08-14 22:25:14+00	1
690	Chia Siew Seng	css9898@yahoo.com.sg	1971-09-19	0	1	PULSE Newsletter	2017-08-15 00:41:59+00	2017-08-15 00:41:59+00	1
692	Pua Suan Tai	pstmisc@gmail.com	1992-03-21	2	1	Electronic Direct Mailer	2017-08-15 00:57:06+00	2017-08-15 00:57:06+00	1
693	Jeric Bryle Dy	jeric@jericbryledy.com	1989-07-10	0	1	one-north Apps	2017-08-15 01:18:47+00	2017-08-15 01:18:47+00	1
694	Daniel Yap	supeing88@gmail.com	2005-10-26	0	1	Posters	2017-08-15 01:23:56+00	2017-08-15 01:23:56+00	1
695	Ng Hian Hock	nghianhock@gmail.com	1956-10-23	0	1	Word-of-mouth	2017-08-15 01:30:33+00	2017-08-15 01:30:33+00	1
697	Ng Poh Yee	eeyhop@gmail.com	1989-12-09	0	1	Word-of-mouth	2017-08-15 01:32:22+00	2017-08-15 01:32:22+00	1
703	Boss Ross	boss@hotmail.com	1984-04-12	0	1	Roadshows	2017-08-15 02:30:44+00	2017-08-15 02:30:44+00	1
704	Dylene Wong	e0leow@gmail.com	2011-07-04	2	1	Social Media	2017-08-15 02:42:01+00	2017-08-15 02:44:24+00	1
705	Koh Phee tat	whyissit@yahoo.com.sg	1964-02-28	0	1	Word-of-mouth	2017-08-15 02:45:26+00	2017-08-15 02:45:26+00	1
707	jiajia	jiajia@yahoo.com	1997-08-15	0	1	Bus Stop Ads	2017-08-15 03:24:10+00	2017-08-15 03:24:10+00	1
709	seet kwai lin	seetkl@gmail.com	1956-05-23	0	1	Newspapers	2017-08-15 03:48:01+00	2017-08-15 03:48:01+00	1
711	Anni	puppis86@yahoo.com.sg	1986-04-04	0	1	Social Media	2017-08-15 03:58:20+00	2017-08-15 03:58:20+00	1
713	jiayi	kohwai@hotmail.com	2007-07-22	0	1	Newspapers	2017-08-15 04:10:35+00	2017-08-15 04:29:05+00	1
716	Caine	teogenvee@gmail.com	1982-11-29	0	1	Social Media	2017-08-15 05:08:03+00	2017-08-15 05:32:05+00	2
718	Kvell Ong	kvelloxw@gmail.com	1997-07-16	0	1	Social Media	2017-08-15 05:56:29+00	2017-08-15 05:56:29+00	1
719	jiayi	jiayi@hotmail.com	2007-07-22	0	1	Newspapers	2017-08-15 06:17:52+00	2017-08-15 06:17:52+00	1
723	Yen Yu Di	gigugu88@gmail.com	1959-09-08	0	1	Electronic Direct Mailer	2017-08-15 06:44:15+00	2017-08-15 06:48:25+00	1
726	Lim Jie Ying	jieyingjieying@gmail.com	1987-05-06	0	1	Electronic Direct Mailer	2017-08-15 06:46:18+00	2017-08-15 06:46:18+00	1
733	Karen	karenyap23@hotmail.com	1981-05-15	0	1	Social Media	2017-08-15 07:27:33+00	2017-08-15 07:33:06+00	1
734	Lim jia qi	jiaqi94@hotmail.com	1994-12-08	0	1	Social Media	2017-08-15 08:04:08+00	2017-08-15 08:04:08+00	1
736	Eugene low	engliang@hotmail.com	1991-09-09	0	1	Social Media	2017-08-15 08:06:14+00	2017-08-15 08:06:14+00	1
738	Jesselyn Koh	kohjesselyn@gmail.com	1974-12-25	1	1	Word-of-mouth	2017-08-15 08:09:47+00	2017-08-15 08:09:47+00	1
739	Steve Yong	4quadrifolio@gmail.com	1971-04-29	1	1	Social Media	2017-08-15 08:10:56+00	2017-08-15 08:10:56+00	1
741	Pee Hai Rou	peehairou@gmail.com	1994-01-13	0	1	Social Media	2017-08-15 08:31:55+00	2017-08-15 08:31:55+00	1
743	boulder loong	boulderloong@gmail.com	1990-10-15	0	1	Social Media	2017-08-15 08:33:51+00	2017-08-15 08:33:51+00	1
744	Kritik Bahrani	kirtik.bahrani@gmail.com	2000-03-14	0	1	Word-of-mouth	2017-08-15 09:27:41+00	2017-08-15 09:27:41+00	1
745	Brayden Lee	jc_sin@hotmail.com	2007-11-21	0	1	Word-of-mouth	2017-08-15 09:39:50+00	2017-08-15 09:41:30+00	1
747	Pranav Mahatma	mahatmapranav@gmail.com	2002-08-13	0	1	Newspapers	2017-08-15 09:51:00+00	2017-08-15 09:51:00+00	1
748	Heng Li zhen	heliz87@hotmail.com	1987-02-21	0	1	Social Media	2017-08-15 10:37:21+00	2017-08-15 10:37:21+00	1
750	Edwin	eleocm@gmail.com	1976-09-14	0	1	Electronic Direct Mailer	2017-08-15 11:16:36+00	2017-08-15 11:16:36+00	1
752	Tuy Tran	tuy.tran@lazada.com	1990-01-21	0	1	Roadshows	2017-08-15 11:23:34+00	2017-08-15 11:23:34+00	1
753	Nat Lim	nlyh_sword_love@hotmail.com	1986-09-05	0	1	Electronic Direct Mailer	2017-08-15 11:49:23+00	2017-08-15 11:49:23+00	1
755	Elle	ellemono@yahoo.com	1989-09-17	0	1	Electronic Direct Mailer	2017-08-15 11:51:07+00	2017-08-15 11:51:07+00	1
757	Joshua Lim	sqchris@hotmail.com	2008-01-16	0	1	Electronic Direct Mailer	2017-08-15 11:53:49+00	2017-08-15 11:55:49+00	1
758	Zhijuan	Zhijuan347@gmail.com	1990-01-30	0	1	Social Media	2017-08-15 11:57:33+00	2017-08-15 11:57:33+00	1
760	marianne	marianne.tan@lb.org.sg	1970-07-21	0	1	Posters	2017-08-15 12:28:14+00	2017-08-15 12:28:14+00	1
762	NG POH YU	belgar@singnet.com.sg	1973-11-10	0	1	Newspapers	2017-08-15 12:31:58+00	2017-08-15 12:31:58+00	1
764	Ow Hui wen	owhuiwen@gmail.com	1993-12-14	0	1	Social Media	2017-08-15 12:46:26+00	2017-08-15 12:46:26+00	1
765	Hui Ru	elainehuiru@gmail.com	1996-11-21	0	1	Social Media	2017-08-15 12:59:32+00	2017-08-15 12:59:32+00	1
767	Knox Penn	jlf.penn@gmail.com	2012-11-14	0	1	Posters	2017-08-15 13:33:58+00	2017-08-15 13:37:40+00	1
768	Peace lim	diverbeeyong@yahoo.com.sg	2003-09-18	0	1	Social Media	2017-08-15 13:46:53+00	2017-08-17 13:55:14+00	1
774	Penelope	penelopewangxx@gmail.com	1990-02-21	0	1	Posters,Bus Stop Ads	2017-08-15 14:49:06+00	2017-08-15 14:51:10+00	1
776	Penelope	amandalow2017@gmail.com	1990-02-21	0	1	Posters,Bus Stop Ads	2017-08-15 14:53:39+00	2017-08-15 14:53:39+00	1
779	Justin Tan	Tanchunweijustin@yahoo.com.sg	2000-05-18	0	1	Posters,Word-of-mouth	2017-08-15 15:00:46+00	2017-08-15 15:00:46+00	1
781	Samantha Ng	sassysampai09@gmail.com	2001-11-08	0	1	Social Media	2017-08-15 15:05:24+00	2017-08-15 15:05:24+00	1
782	Daniel Gaw	tizzizut@yahoo.com	2008-03-10	1	1	Word-of-mouth	2017-08-15 15:10:44+00	2017-08-17 09:12:56+00	1
786	qifeng yan	zytemilly@hotmail.com	2011-11-30	0	1	Social Media	2017-08-16 00:07:31+00	2017-08-16 01:23:15+00	1
787	Regina Tan	huiyien_tan@yahoo.com.sg	1974-05-01	0	1	Word-of-mouth	2017-08-16 00:15:14+00	2017-08-16 00:16:04+00	1
788	Gerrard Toh	adnil_29@yahoo.com.sg	2007-10-04	0	1	Newspapers	2017-08-16 00:18:24+00	2017-08-16 00:20:18+00	1
789	Sean Yau	yauyongsean@gmail.com	1976-04-08	8	1	Posters,Word-of-mouth	2017-08-16 00:47:17+00	2017-08-16 00:47:17+00	1
792	Sean Goh	misc@seangoh.com	1981-11-23	0	1	Word-of-mouth	2017-08-16 00:49:27+00	2017-08-16 00:49:27+00	1
794	Jesslyn Neo	shellytortor@gmail.com	1978-11-01	0	1	Social Media	2017-08-16 00:52:40+00	2017-08-16 00:52:40+00	1
795	Ray	HC1204@SINGNET.COM.SG	1978-04-01	0	1	Bus Stop Ads	2017-08-16 01:10:05+00	2017-08-16 01:10:05+00	1
797	Nathaniel Chan	shenzy22@gmail.com	2010-04-21	0	1	Social Media	2017-08-16 02:08:50+00	2017-08-16 02:12:20+00	1
805	Ng Poh Khai	ng_khai@hotmail.com	1984-10-20	0	1	Word-of-mouth	2017-08-16 04:26:34+00	2017-08-16 04:26:34+00	1
806	clara	chung_wp@yahoo.com.sg	1970-03-01	0	1	Word-of-mouth	2017-08-16 04:26:39+00	2017-08-16 04:26:39+00	1
807	Low Lee Lee	545low@gmail.com	1959-03-10	0	1	Word-of-mouth	2017-08-16 04:29:41+00	2017-08-16 04:29:41+00	1
809	Dillon	soondillon@gmail.com	1970-07-04	0	1	Word-of-mouth	2017-08-16 04:32:43+00	2017-08-16 04:34:26+00	1
811	Tyler	claracwp@gmail.com	1970-02-08	0	1	Word-of-mouth	2017-08-16 04:37:40+00	2017-08-16 04:37:40+00	1
812	Sheryl	sherylnghx@gmail.com	1991-04-29	0	1	Social Media	2017-08-16 05:17:57+00	2017-08-16 05:17:57+00	1
815	Vicky	huiqivicky@gmail.com	1994-06-09	0	1	Social Media	2017-08-16 05:54:57+00	2017-08-16 05:54:57+00	1
817	Ng Ling Siew	nglingsiew@gmail.com	1980-02-22	0	1	Word-of-mouth	2017-08-16 06:47:39+00	2017-08-16 06:54:22+00	1
818	Daniel Kwong	teolichin@gmail.com	2011-01-02	0	1	Word-of-mouth	2017-08-16 06:54:00+00	2017-08-16 08:56:52+00	1
819	Tan Shan Zheng	shanzheng.tan@gmail.com	1990-09-24	0	1	Word-of-mouth	2017-08-16 07:15:25+00	2017-08-16 07:15:25+00	1
820	Hans Chua	xiabing@hotmail.com	2010-07-04	0	1	Posters	2017-08-16 07:32:51+00	2017-08-16 07:32:51+00	1
822	Joey Lim	joeeeylimm@gmail.com	1991-12-20	7	1	Word-of-mouth	2017-08-16 08:30:59+00	2017-08-16 08:30:59+00	1
824	Samuel Kwong	shiyang.kwong@gmail.com	2009-12-03	4	1	Word-of-mouth	2017-08-16 08:54:24+00	2017-08-17 00:09:15+00	1
825	Nasita binte nasrul	nasitanasrul@gmail.com	1993-09-09	0	1	Social Media	2017-08-16 09:27:19+00	2017-08-16 09:27:19+00	1
827	Anthony Ho	smileygirla@yahoo.com	1979-12-07	0	1	Roadshows	2017-08-16 09:45:43+00	2017-08-19 04:38:10+00	1
828	Erlinda Bek	erlinda@jayabaru.com.sg	1981-03-10	0	1	Word-of-mouth	2017-08-16 09:53:33+00	2017-08-16 09:53:33+00	1
830	Vicky	limvicky@yahoo.com	1975-09-26	0	1	Social Media	2017-08-16 10:08:06+00	2017-08-16 10:08:06+00	1
831	Lee Jia Min	jiamin.lee@scs71.com	1994-06-03	8	1	Posters	2017-08-16 10:16:31+00	2017-08-16 10:16:31+00	1
836	Donna Tan	donnatanlong@gmail.com	1971-03-30	2	1	Word-of-mouth	2017-08-16 11:53:29+00	2017-08-16 11:53:29+00	1
837	Jhelyn Suan	jhelyn.suan@gmail.com	1984-10-26	7	1	Posters	2017-08-16 11:56:37+00	2017-08-16 11:56:37+00	1
838	Ng Sze Hui	ngszehui96@gmail.com	1996-04-23	0	1	Bus Stop Ads	2017-08-16 12:10:24+00	2017-08-16 12:10:24+00	1
839	Wendy Ang	alm.wendy@gmail.com	1981-05-29	0	1	Social Media	2017-08-16 13:05:02+00	2017-08-16 13:05:02+00	1
840	Carine Liauw	liauwym@gmail.com	1985-11-27	0	1	Social Media	2017-08-16 13:12:52+00	2017-08-16 13:12:52+00	1
844	Wong Jie Hong	lt_por@yahoo.com.sg	2007-10-21	0	1	Social Media	2017-08-16 13:37:31+00	2017-08-16 13:39:50+00	1
846	Owen lin	mikluvjoey@yahoo.com.sg	2012-07-07	0	1	Word-of-mouth	2017-08-16 14:00:01+00	2017-08-16 14:01:21+00	1
852	Sarah	krazy.fireball@gmail.com	1997-06-23	0	1	Social Media	2017-08-16 14:51:11+00	2017-08-16 14:51:11+00	1
853	Kenny Chang Han Lin	kennychl@live.com	1992-08-28	0	1	Social Media	2017-08-16 15:29:05+00	2017-08-16 15:29:05+00	1
855	Tan Yih Liang	yltan7308@yahoo.com.sg	1991-08-16	0	1	PULSE Newsletter	2017-08-16 15:52:16+00	2017-08-16 15:52:16+00	1
856	candice	hornett_hopper@hotmail.com	1987-01-16	0	1	Social Media	2017-08-16 15:58:56+00	2017-08-16 15:58:56+00	1
859	Jerry Yap	Jerry@empower-now.net	1964-01-10	0	1	Word-of-mouth	2017-08-16 16:53:50+00	2017-08-16 16:53:50+00	1
860	Wong Sing Kang	singkang@gmail.com	1977-05-27	0	1	Electronic Direct Mailer	2017-08-16 16:54:47+00	2017-08-16 16:54:47+00	1
862	Adrian Carlo Estira	adriancarlo.94@hotmail.com	1994-03-26	0	1	Social Media	2017-08-16 17:36:25+00	2017-08-16 17:36:25+00	1
864	Ng Sze En	nsm1002008@gmail.com	2008-05-23	0	1	Word-of-mouth	2017-08-16 23:10:01+00	2017-08-16 23:10:01+00	1
867	Ivan lee	viper1@singnet.com.sg	2004-02-12	0	1	Social Media	2017-08-16 23:26:12+00	2017-08-16 23:26:12+00	1
868	See Siew Pin	mezzopianist@yahoo.com	1984-11-29	0	1	Bus Stop Ads	2017-08-16 23:57:15+00	2017-08-16 23:57:15+00	1
869	Praise Yee	praiseyee@gmail.com	1981-10-01	0	1	Word-of-mouth	2017-08-17 00:01:28+00	2017-08-17 00:01:28+00	1
870	Au Yong Shi Ya	auyongshiya@gmail.com	1993-04-12	0	1	Social Media	2017-08-17 00:24:27+00	2017-08-17 00:24:27+00	1
872	Low de jie	patricklow1976@gmail.com	2008-10-10	0	1	Newspapers	2017-08-17 00:46:04+00	2017-08-17 00:46:04+00	1
875	Ericson Tan	hobosaurs@gmail.com	1991-02-10	4	1	Roadshows	2017-08-17 01:16:35+00	2017-08-17 01:16:35+00	1
878	Sophana Chau	sophanachau.1@gmail.com	1976-06-28	0	1	Newspapers	2017-08-17 01:25:17+00	2017-08-17 01:25:17+00	1
881	Dave Chong	shengyuen@gmail.com	1983-07-25	0	1	Word-of-mouth	2017-08-17 01:41:37+00	2017-08-17 01:41:37+00	1
882	Carrie Lin	kitty_carrie_sosi@hotmail.com	1987-07-07	0	1	Social Media	2017-08-17 01:45:03+00	2017-08-17 01:45:03+00	1
884	Tan Lay Koon	tlkkoon@hotmail.com	1985-10-05	0	1	PULSE Newsletter	2017-08-17 01:56:46+00	2017-08-17 01:56:46+00	1
885	Frederick Teo	Fredteo99reg@gmail.com	1982-01-30	0	1	Posters	2017-08-17 01:58:56+00	2017-08-17 01:58:56+00	1
887	Gan Poh Neo	homeinspore@singnet.com.sg	1956-10-21	0	1	Newspapers	2017-08-17 02:15:03+00	2017-08-17 02:15:03+00	1
893	Ryan Loh Zhan Xun	danayph@gmail.com	2005-08-03	2	1	Posters	2017-08-17 02:24:09+00	2017-08-17 02:24:09+00	1
900	Tan Yang Teng	yt.tan.1986@gmail.com	1986-09-22	0	1	Word-of-mouth	2017-08-17 02:59:09+00	2017-08-17 02:59:09+00	1
902	Karen Goh	karengohmm@gmail.com	2017-07-31	0	1	Social Media	2017-08-17 03:08:21+00	2017-08-17 03:08:21+00	1
903	Wan Nur Hanani	hanani_rohman@ices.a-star.edu.sg	1980-09-29	0	1	Electronic Direct Mailer	2017-08-17 03:08:28+00	2017-08-17 03:08:28+00	1
905	Jessica	keatbear@hotmail.com	1979-09-05	0	1	Roadshows	2017-08-17 03:19:34+00	2017-08-17 03:19:34+00	1
906	Devaraj	adithyadevaraj1@outlook.com	1974-08-09	0	1	Posters	2017-08-17 03:28:53+00	2017-08-17 03:57:39+00	1
909	natalin	natalin.neo@hoya.com	1986-04-15	4	1	one-north Apps,PULSE Newsletter,Word-of-mouth	2017-08-17 05:06:05+00	2017-08-17 05:06:05+00	1
910	Anne Goh	anne.goh@hoya.com	1976-04-06	4	1	Roadshows	2017-08-17 05:09:49+00	2017-08-17 05:09:49+00	1
911	leilani Trinka	rawlings@singnet.com.sg	1969-12-05	5	1	Posters	2017-08-17 05:38:46+00	2017-08-17 05:38:46+00	1
912	Joy	joy.shijia@gmail.com	1984-11-04	0	1	Social Media	2017-08-17 05:43:59+00	2017-08-17 05:43:59+00	1
914	Liren	chong.lipren@gmail.com	1984-10-03	0	1	Social Media	2017-08-17 05:45:45+00	2017-08-17 05:45:45+00	1
916	Chua Ci Jie	chua_ci_jie@sics.a-star.edu.sg	1992-07-10	0	1	Electronic Direct Mailer	2017-08-17 05:46:57+00	2017-08-17 05:46:57+00	1
917	Nusrath Fathima	fathima_nusrath@sics.a-star.edu.sg	1993-03-19	0	1	Electronic Direct Mailer	2017-08-17 05:47:24+00	2017-08-17 05:47:24+00	1
918	Nurul Iiman	nurul_iiman@sics.a-star.edu.sg	1991-03-06	0	1	Electronic Direct Mailer	2017-08-17 05:47:25+00	2017-08-17 05:47:25+00	1
920	Reuben Ng	reuben_ng@scei.a-star.edu.sg	1991-04-14	4	1	Electronic Direct Mailer	2017-08-17 05:56:55+00	2017-08-17 05:56:55+00	1
921	Vicky Soh	vicky.soh@dupont.com	1988-09-11	4	1	Posters,one-north Apps	2017-08-17 06:04:33+00	2017-08-17 06:04:33+00	1
923	Ooi Yi Kai	ooiyikai2011@gmail.com	2011-11-21	0	1	Posters	2017-08-17 06:42:21+00	2017-08-17 06:42:21+00	1
924	Ooi Pei Qi	spengyap@gmail.com	2007-04-07	0	1	Posters	2017-08-17 06:43:18+00	2017-08-17 06:43:18+00	1
926	Samantha Ng	smng@etc.a-star-edu.sg	1992-01-09	0	1	Electronic Direct Mailer	2017-08-17 06:56:11+00	2017-08-17 06:56:11+00	1
930	Hannah Chua	kellychua_chan@yahoo.com.sg	2007-11-16	0	1	Posters	2017-08-17 07:00:44+00	2017-08-17 07:00:44+00	1
939	lai sum	laisum1@yahoo.com	1981-03-26	4	1	Posters,Bus Stop Ads,PULSE Newsletter,Electronic Direct Mailer	2017-08-17 07:11:01+00	2017-08-17 07:11:01+00	1
940	Anne Valerie Sanchez	sanchezannevalerie@prahs.com	1980-08-26	4	1	Posters,Word-of-mouth	2017-08-17 07:19:43+00	2017-08-17 07:19:43+00	1
944	Lim Jie Min	l.jiemin96@gmail.com	1996-06-25	0	1	Word-of-mouth	2017-08-17 07:34:09+00	2017-08-17 07:34:09+00	1
948	Josephine See	josephinesee01@gmail.com	1983-01-29	4	1	Bus Stop Ads	2017-08-17 08:03:35+00	2017-08-17 08:03:35+00	1
951	Phong Wai Yee	wai-yee.phong@takeda.com	1975-08-18	4	1	Bus Stop Ads	2017-08-17 08:07:12+00	2017-08-17 08:07:12+00	1
952	Jia Vern Loh	jia-vern.loh@takeda.com	1983-04-12	4	1	Posters	2017-08-17 08:07:55+00	2017-08-17 08:07:55+00	1
955	Agnes Tan	agnestsk@yahoo.com.sg	1971-11-15	0	1	Posters	2017-08-17 08:23:29+00	2017-08-17 08:23:29+00	1
957	Nastaran Okati	nastaran.okati@gmail.com	1996-05-05	0	1	Social Media	2017-08-17 08:52:03+00	2017-08-17 08:52:03+00	1
960	Ngah Narciso Boon Kiat Amos	ngahboonkiat@gmail.com	1997-08-05	8	1	Posters,Word-of-mouth	2017-08-17 09:13:25+00	2017-08-17 09:13:25+00	1
961	james yang	jamesyang1117@yahoo.com.sg	1961-11-17	0	1	Newspapers	2017-08-17 11:10:33+00	2017-08-17 11:10:33+00	1
965	Sara Chek	walk_of_life@live.com	2009-11-28	0	1	Word-of-mouth	2017-08-17 11:53:02+00	2017-08-17 12:01:38+00	1
967	Jonathan Choong	choongyikaijonathan@saintandrewsjunior.moe.edu.sg	2007-08-06	0	1	Word-of-mouth	2017-08-17 12:03:49+00	2017-08-17 12:03:49+00	1
968	eunice Koh	jamietanml@gmail.com	2008-08-18	0	1	Word-of-mouth	2017-08-17 12:06:37+00	2017-08-17 12:08:37+00	1
974	Chloe Chia	cathteo@hotmail.com	2008-04-24	0	1	Posters	2017-08-17 12:45:56+00	2017-08-17 12:51:35+00	1
976	Matthew Tan	tthmatt@gmail.com	1999-03-04	0	1	Word-of-mouth	2017-08-17 13:15:25+00	2017-08-17 13:15:25+00	1
977	Lim Hong Yee	meituan4@yahoo.com.sg	2007-03-11	0	1	Word-of-mouth	2017-08-17 13:17:01+00	2017-08-19 03:40:06+00	1
979	Nicholas	nicholasthong14@hotmail.com	1993-03-14	0	1	Bus Stop Ads	2017-08-17 13:38:56+00	2017-08-17 13:38:56+00	1
980	Zeeden Lim	lawlim02@gmail.com	2006-02-07	0	1	Word-of-mouth	2017-08-17 13:52:44+00	2017-08-17 13:52:44+00	1
983	Kelicia	kelicia.yixuan@gmail.com	1993-07-01	0	1	Posters	2017-08-17 13:55:58+00	2017-08-17 13:55:58+00	1
984	Ernest Toh	conniecutebear@gmail.com	2010-11-20	0	1	Word-of-mouth	2017-08-17 13:56:20+00	2017-08-17 13:56:20+00	1
987	Charis Kwan	lenaachan@gmail.com	2012-11-17	0	1	Word-of-mouth	2017-08-17 14:13:44+00	2017-08-17 14:16:29+00	1
988	Nathaniel Sim	nathanielsim100@gmail.com	2003-09-13	0	1	Posters,Bus Stop Ads,Word-of-mouth	2017-08-17 14:16:12+00	2017-08-17 14:16:12+00	1
994	Oscar Leyden	yleyden@gmail.com	2005-10-06	0	1	Social Media	2017-08-17 14:37:04+00	2017-08-17 16:00:47+00	1
995	Lee Jiun Kang	icoolfox@gmail.com	2008-02-25	0	1	Word-of-mouth	2017-08-17 14:43:24+00	2017-08-17 14:43:24+00	1
996	Calvin Tan	Calvin1688@gmail.com	1972-08-28	0	1	Word-of-mouth	2017-08-17 14:43:39+00	2017-08-17 14:43:39+00	1
999	Chee Kelly	kelly.cjiayi@gmail.com	1997-06-11	0	1	Word-of-mouth	2017-08-17 15:20:36+00	2017-08-17 15:20:36+00	1
1001	Howe	howechungwan@yahoo.com.sg	1979-12-29	0	1	Roadshows	2017-08-17 15:25:45+00	2017-08-17 15:25:45+00	1
1002	Jaime Yeo	cen2jme@yahoo.com	1971-03-26	0	1	Posters	2017-08-17 15:27:31+00	2017-08-17 15:27:31+00	1
1003	Ally goh	allygoh76@gmail.com	1985-08-17	0	1	Word-of-mouth	2017-08-17 15:39:10+00	2017-08-17 15:39:10+00	1
1005	Tracy Hung	tracyhung19@hotmail.com	1994-12-17	0	1	Social Media	2017-08-17 15:51:26+00	2017-08-17 15:51:26+00	1
1006	Regina	syzregina@gmail.com	1994-07-05	0	1	Word-of-mouth	2017-08-17 16:20:06+00	2017-08-17 16:20:06+00	1
1007	Chloe chong	chongjfyq@gmail.com	2010-05-09	0	1	Social Media	2017-08-17 16:24:29+00	2017-08-17 16:26:26+00	1
1009	Liang Yongquan	yongquan.sg@gmail.com	1985-05-07	0	1	Word-of-mouth	2017-08-17 16:47:54+00	2017-08-17 16:47:54+00	1
1010	Liu Je-Lynn	chanls297@gmail.com	2010-08-02	0	1	Social Media	2017-08-17 16:48:00+00	2017-08-17 16:50:26+00	1
1016	Abel Li	able_abel@hotmail.com	1982-08-04	0	1	Newspapers	2017-08-17 22:40:33+00	2017-08-17 22:40:33+00	1
1022	Nitu Agrawal	nitujjw@gmail.com	1981-01-29	0	1	Newspapers	2017-08-17 23:11:40+00	2017-08-17 23:11:40+00	1
1023	Sabrina Goh	sabrina@asiadirectselling.com	2017-08-18	0	1	Newspapers	2017-08-17 23:30:58+00	2017-08-17 23:30:58+00	1
1025	Yvonne	vonne.quest@gmail.com	1981-09-15	0	1	Social Media	2017-08-17 23:49:57+00	2017-08-17 23:49:57+00	1
1029	Zui Lim	kz_lim@yahoo.com	1967-08-03	0	1	Word-of-mouth	2017-08-18 00:21:57+00	2017-08-18 00:21:57+00	1
1030	Ang Lye Teck	lye_teck@yahoo.com	1974-03-20	0	1	Newspapers	2017-08-18 00:22:51+00	2017-08-18 00:22:51+00	1
1031	ANG lye teck	maurice.ang@gmail.com	1974-03-20	0	1	Newspapers	2017-08-18 00:25:41+00	2017-08-18 00:31:08+00	1
1032	Diana Chua	dianachuabh@yahoo.com.sg	1975-06-28	4	1	Posters	2017-08-18 00:38:27+00	2017-08-18 00:38:27+00	1
1033	Tay Kai Yue	huishan07@gmail.com	2012-07-12	1	1	Posters	2017-08-18 00:44:56+00	2017-08-18 00:44:56+00	1
1037	Julian Ng	tgekyen22@gmail.com	2009-08-01	0	1	Newspapers	2017-08-18 01:05:45+00	2017-08-18 01:05:45+00	1
1038	Shiela Margallo	shiela_francisco_margallo@brc.a-star.edu.sg	1982-07-21	0	1	Electronic Direct Mailer	2017-08-18 01:08:15+00	2017-08-18 01:08:15+00	1
1040	Koh Jun Jia	koh_jun_jia@brc.a-star.edu.sg	1986-01-20	4	1	Electronic Direct Mailer	2017-08-18 01:13:25+00	2017-08-18 01:13:25+00	1
1043	Jan Irving Bibay	Jan_Irving@brc.a-star.edu.sg	1985-11-28	4	1	Electronic Direct Mailer	2017-08-18 01:22:24+00	2017-08-18 01:22:24+00	1
1044	waden Chua	bc5713k@gmail.com	2005-06-27	0	1	Newspapers	2017-08-18 01:22:46+00	2017-08-18 01:22:46+00	1
1045	Yang Feng	yangf@ihpc.a-star.edu.sg	1980-04-15	2	1	Posters	2017-08-18 01:24:58+00	2017-08-18 01:24:58+00	1
1046	Melanie Lim	mlim029@e.ntu.edu.sg	1994-06-18	0	1	Social Media	2017-08-18 01:37:56+00	2017-08-18 01:37:56+00	1
1047	Theodore Han	pipurika@live.com	1988-07-20	0	1	Social Media	2017-08-18 01:44:33+00	2017-08-18 01:49:02+00	1
1050	Goh Sok Li	kion.sokli@gmail.com	1983-12-08	7	1	Posters	2017-08-18 01:54:13+00	2017-08-18 01:54:13+00	1
1051	Megha Biyani	m_biyani@hotmail.com	1985-04-27	0	1	Newspapers	2017-08-18 01:58:34+00	2017-08-18 01:58:34+00	1
1052	Aarav Biyani	biyani.megha@gmail.com	2012-04-10	0	1	Newspapers	2017-08-18 02:00:12+00	2017-08-18 02:00:12+00	1
1056	ken lau	kenphang@outlook.com	1969-10-15	2	1	Social Media	2017-08-18 02:04:28+00	2017-08-18 02:04:28+00	1
1060	Chloe Jiang	chloe_jiang@bti.a-star.edu.sg	1987-10-15	4	1	Social Media	2017-08-18 02:06:45+00	2017-08-18 02:06:45+00	1
1061	Lynette	lynettegummybear@gmail.com	1996-11-09	0	1	Newspapers	2017-08-18 02:07:04+00	2017-08-18 02:07:04+00	1
1063	Himanshu Biyani	h_biyani@hotmail.com	1980-05-29	0	1	Newspapers	2017-08-18 02:07:58+00	2017-08-18 02:07:58+00	1
1289	Grace  teng	siewlayteng@yahoo.com	1959-01-15	0	1	Roadshows	2017-08-18 05:27:17+00	2017-08-18 05:27:17+00	1
1064	mariati	mariati@bti.a-star.edu.sg	1981-03-26	1	1	Posters,Bus Stop Ads,Word-of-mouth	2017-08-18 02:09:55+00	2017-08-18 02:09:55+00	1
1069	Jessna Yeo	jessna_yeo@bti.a-star.edu.sg	1980-06-24	4	1	Posters	2017-08-18 02:14:39+00	2017-08-18 02:14:39+00	1
1070	Tan Shan Mei	shanmei.tan91@gmail.com	1991-04-08	4	1	Electronic Direct Mailer	2017-08-18 02:15:21+00	2017-08-18 02:15:21+00	1
1071	Lois	loisquek@gmail.com	1997-10-30	0	1	Word-of-mouth	2017-08-18 02:17:06+00	2017-08-18 02:17:06+00	1
1074	Shirley tan	stpn13@gmail.com	1959-04-11	0	1	Social Media	2017-08-18 02:45:15+00	2017-08-18 02:45:15+00	1
1075	Asher	writetodaphne@yahoo.com	2009-04-10	0	1	Social Media	2017-08-18 02:49:21+00	2017-08-18 02:54:48+00	1
1077	Emily	fenxia@gmail.com	2011-04-27	0	1	Word-of-mouth	2017-08-18 02:52:01+00	2017-08-18 02:55:37+00	1
1079	Fanny	fanatasize@gmail.com	1984-12-06	0	1	Roadshows	2017-08-18 02:58:10+00	2017-08-19 06:32:56+00	1
1084	Christopher Yeow	hewchee@yahoo.ca	1973-01-02	2	1	Posters	2017-08-18 03:00:47+00	2017-08-18 03:00:47+00	1
1085	chen sujin	test@ape.sg	1961-07-30	0	1	Roadshows	2017-08-18 03:01:38+00	2017-08-18 04:17:15+00	1
1087	Jane	cyjane78@gmail.com	1978-12-19	0	1	Social Media	2017-08-18 03:06:06+00	2017-08-18 03:06:07+00	1
1091	Aaron	chia_72@yahoo.com	2008-04-10	0	1	Social Media	2017-08-18 03:09:17+00	2017-08-18 03:09:17+00	1
1092	Wei boon	chuawb@gmail.com	1978-10-10	0	1	Word-of-mouth	2017-08-18 03:09:20+00	2017-08-18 03:09:20+00	1
1097	Ericaaasiew@gmail.com	erica.siew.2014@socsc.smu.edu.sg	1995-06-17	0	1	Word-of-mouth	2017-08-18 03:14:46+00	2017-08-18 03:14:46+00	1
1099	ChengRui	jin.dandan@outlook.com	2017-08-18	0	1	Posters	2017-08-18 03:15:01+00	2017-08-18 03:15:01+00	1
1100	Lim Puay Ying	puayying@gmail.com	1976-07-19	0	1	Roadshows	2017-08-18 03:17:07+00	2017-08-18 03:45:58+00	1
1101	james test live 4	jamestestlive4@mailinator.com	1955-06-15	0	1	Roadshows	2017-08-18 03:19:30+00	2017-08-18 03:19:30+00	1
1105	Linus Low	albertadeline@yahoo.com	2004-08-03	0	1	Roadshows	2017-08-18 03:20:46+00	2017-08-18 03:39:34+00	1
1106	Cecilia Mok	mokyinkheng@hotmail.com	1949-01-05	0	1	Roadshows	2017-08-18 03:23:53+00	2017-08-18 03:23:53+00	1
1109	Karunakar	vasu.karunakar@gmail.com	1973-10-18	0	1	Posters	2017-08-18 03:25:38+00	2017-08-18 03:25:38+00	1
1113	Wenqin	wenqin56@gmail.com	1991-08-31	4	1	Roadshows	2017-08-18 03:27:49+00	2017-08-18 03:27:49+00	1
1114	Leo Mok	mokwengcheon1@hotmail.com	1944-12-02	0	1	Posters	2017-08-18 03:28:04+00	2017-08-18 03:28:04+00	1
1115	Lee Chin Fai	chinflee2@hotmail.com	2004-10-07	0	1	Word-of-mouth	2017-08-18 03:28:53+00	2017-08-18 03:28:53+00	1
1118	RIcky Loh	rickyloh515@gmail.com	1949-04-02	0	1	Roadshows	2017-08-18 03:31:58+00	2017-08-18 03:36:29+00	1
1121	Sandra Gavard-Oundjian	sandra.gavard@gmail.com	2017-08-18	0	1	Roadshows	2017-08-18 03:33:43+00	2017-08-18 03:33:43+00	1
1126	Elizabeth Ong	eosk61@yahoo.com.sg	1961-07-05	0	1	Newspapers	2017-08-18 03:34:39+00	2017-08-18 03:34:39+00	1
1127	Eugene	eugenetyj1995@gmail.com	1983-08-18	0	1	PULSE Newsletter	2017-08-18 03:34:59+00	2017-08-18 03:45:30+00	1
1132	Mae Urquhart	dalmaetian@gmail.com	1975-11-12	0	1	Roadshows	2017-08-18 03:36:07+00	2017-08-18 03:36:07+00	1
1134	Huang zhenhao	zhenhao1234@outlook.com	1994-05-16	0	1	Posters,Bus Stop Ads,PULSE Newsletter,Word-of-mouth	2017-08-18 03:36:24+00	2017-08-18 03:36:24+00	1
1139	Grace	gugengqiong@hotmail.com	1989-05-26	4	1	Roadshows	2017-08-18 03:39:32+00	2017-08-18 03:39:32+00	1
1144	Xin	siyuewu@gmail.com	1977-04-23	4	1	PULSE Newsletter	2017-08-18 03:43:09+00	2017-08-18 03:43:09+00	1
1147	Kenneth	kennethojj@gmail.com	1991-12-04	0	1	Newspapers	2017-08-18 03:43:54+00	2017-08-18 03:43:54+00	1
1151	Lucas Low	prismeg@hotmail.com	2006-08-28	0	1	Roadshows	2017-08-18 03:45:39+00	2017-08-18 03:45:39+00	1
1152	Jack Liang	jack.lcm@gmail.com	1974-12-17	1	1	Bus Stop Ads	2017-08-18 03:46:08+00	2017-08-18 03:46:08+00	1
1153	Irene na	wk_30@yahoo.com	1982-04-30	0	1	Roadshows	2017-08-18 03:46:20+00	2017-08-18 03:46:20+00	1
1154	Sandy Seet	sanchan2121@yahoo.com.sg	1968-07-17	1	1	Roadshows	2017-08-18 03:46:41+00	2017-08-18 03:46:41+00	1
1155	Diana Yap	dyap33@yahoo.com	1970-03-24	1	1	Word-of-mouth	2017-08-18 03:46:49+00	2017-08-18 03:46:49+00	1
1156	Jireh Lim	sharonlim323@gmail.com	2010-02-23	0	1	Roadshows	2017-08-18 03:47:01+00	2017-08-18 03:47:01+00	1
1157	Daphne Loy	buibui_tu@yahoo.com	1975-07-26	2	1	Social Media	2017-08-18 03:47:21+00	2017-08-18 03:47:21+00	1
1158	Aaron	aaron_tjr@hotmail.com	1990-07-27	0	1	Roadshows	2017-08-18 03:48:16+00	2017-08-18 03:48:16+00	1
1161	weelip	weelip@hotmail.com	1980-06-03	0	1	Newspapers	2017-08-18 03:50:12+00	2017-08-18 03:50:12+00	1
1170	Jane Chan	chanjv@gis.a-star.edu.sg	1993-10-21	4	1	Electronic Direct Mailer	2017-08-18 03:55:59+00	2017-08-18 03:55:59+00	1
1175	Lizar Ng	lizar@gmail.com	2017-08-18	0	1	Roadshows	2017-08-18 03:59:44+00	2017-08-18 03:59:44+00	1
1176	Joanna linggajaya	bg_qd@yahoo.com	2012-07-17	0	1	Social Media	2017-08-18 04:00:16+00	2017-08-19 02:58:03+00	1
1180	lim ruay ning	gee_kin@yahoo.com	2009-07-14	0	1	Roadshows	2017-08-18 04:01:30+00	2017-08-18 04:01:30+00	1
1186	tristan ng	ann01jan@hotmail.com	2011-05-30	0	1	Roadshows	2017-08-18 04:02:11+00	2017-08-18 04:14:41+00	1
1188	Lizar Ng	lizar_tham@hotmail.com	2001-01-02	0	1	Word-of-mouth	2017-08-18 04:02:36+00	2017-08-18 04:11:41+00	1
1190	Jamesim Test Paul	jamesim@mailinator.com	1988-02-16	0	1	PULSE Newsletter	2017-08-18 04:03:14+00	2017-08-18 04:04:31+00	1
1194	Neo Aik hing	aikhing78@yahoo.com	1978-03-06	0	1	Newspapers	2017-08-18 04:04:43+00	2017-08-18 04:04:43+00	1
1195	Xiuli	inspirationsss@yahoo.com	1981-12-22	0	1	Newspapers	2017-08-18 04:05:36+00	2017-08-18 04:05:36+00	1
1196	Sayantani Nandi	nandis@imcb.a-star.edu.sg	1988-01-23	4	1	Roadshows	2017-08-18 04:05:50+00	2017-08-18 04:05:50+00	1
1203	Howard	zhenhao1994@gmail.com	1989-08-18	0	1	Roadshows	2017-08-18 04:10:11+00	2017-08-18 04:10:11+00	1
1211	Tina Yeo	tina_yeo@yahoo.com	1970-10-16	0	1	Bus Stop Ads	2017-08-18 04:13:30+00	2017-08-18 04:13:30+00	1
1216	Pauline Yeo	pyhh@hotmail.com	1967-01-14	0	1	Word-of-mouth	2017-08-18 04:16:25+00	2017-08-18 04:16:25+00	1
1219	Elijah Ho	keettle@gmail.com	2007-08-13	0	1	Roadshows	2017-08-18 04:17:03+00	2017-08-18 04:17:03+00	1
1221	Alan Tan	Alantan75@yahoo.com	1975-04-06	0	1	Posters,one-north Apps,PULSE Newsletter	2017-08-18 04:17:18+00	2017-08-18 04:17:18+00	1
1222	james test live 15	jamestest15@mailinator.com	1933-06-15	0	1	Bus Stop Ads	2017-08-18 04:18:37+00	2017-08-18 04:18:37+00	1
1223	Dylan Lim	ethel_lam@yahoo.com	2011-01-12	0	1	Roadshows	2017-08-18 04:18:43+00	2017-08-18 16:58:50+00	1
1224	Paul Nguyen	tandeeissues@icloud.com	1998-02-02	8	1	one-north Apps	2017-08-18 04:19:05+00	2017-08-18 04:19:05+00	1
1225	Shaun loo	sharlene88@yahoo.com	2008-03-07	1	1	Roadshows	2017-08-18 04:20:08+00	2017-08-18 04:20:08+00	1
1226	James test live 16	jamestestlive16@mailinator.com	2012-08-18	0	1	Roadshows	2017-08-18 04:20:37+00	2017-08-18 04:20:37+00	1
1227	Aura Rida Zafira	aura.zafira@gmail.com	2007-06-30	0	1	Word-of-mouth	2017-08-18 04:20:42+00	2017-08-18 04:20:42+00	1
1228	TestmeDaddy	testmedaddy@icloud.com	1988-12-12	0	1	Roadshows	2017-08-18 04:21:24+00	2017-08-18 04:21:24+00	1
1229	Charlene	kyt5585@hotmail.com	1980-06-11	4	1	Roadshows	2017-08-18 04:22:38+00	2017-08-18 04:22:38+00	1
1230	Lyn	admin@gmail.com	2017-08-18	0	1	Roadshows	2017-08-18 04:22:39+00	2017-08-18 04:22:39+00	1
1231	Jemima Chang	diversification8@yahoo.com	2010-09-04	0	1	Roadshows	2017-08-18 04:25:51+00	2017-08-18 15:42:49+00	1
1232	testmebaby	testmebabay@saloniz.com	1988-12-12	1	1	Roadshows	2017-08-18 04:26:02+00	2017-08-18 04:26:02+00	1
1233	Shi Junli	jshi@ibn.a-star.edu.sg	1985-02-02	4	1	Roadshows	2017-08-18 04:26:05+00	2017-08-18 04:26:05+00	1
1234	Merilynlim	merilynfriend@gmail.com	1997-09-29	0	1	Roadshows	2017-08-18 04:26:40+00	2017-08-18 04:26:40+00	1
1235	Nanthakan	leelien2001@yahoo.com.sg	2008-06-04	0	1	Roadshows	2017-08-18 04:27:33+00	2017-08-18 04:27:33+00	1
1236	Wan	wkyam@imcb.a-star.edu.sg	1989-06-09	0	1	Electronic Direct Mailer	2017-08-18 04:28:28+00	2017-08-18 04:28:28+00	1
1237	Caine	caine@ape.com	1982-08-18	0	1	Roadshows	2017-08-18 04:28:46+00	2017-08-18 04:28:46+00	1
1238	Fiona	msteo@student.imcb-astar.edu.sg	1989-03-01	4	1	Electronic Direct Mailer	2017-08-18 04:29:29+00	2017-08-18 04:29:29+00	1
1239	Frank	dragon_sg@yahoo.com	1973-01-05	0	1	Roadshows	2017-08-18 04:31:05+00	2017-08-18 04:31:05+00	1
1240	Hukama linggajaya	hukama@gmail.com	1977-06-21	0	1	Social Media	2017-08-18 04:35:17+00	2017-08-18 04:35:17+00	1
1241	Jessica C	encompassky@gmail.com	1991-01-21	0	1	Electronic Direct Mailer	2017-08-18 04:35:22+00	2017-08-18 04:35:22+00	1
1242	An Yee Low	aylow97@gmail.com	1997-10-29	4	1	Posters	2017-08-18 04:35:56+00	2017-08-18 04:35:56+00	1
1243	Fong alan	fongsf@hotmail.com	1963-08-18	0	1	Roadshows	2017-08-18 04:36:29+00	2017-08-18 04:36:29+00	1
1244	Jurga Mituzaite	jurga.mituzaite@gmail.com	1994-04-22	4	1	Word-of-mouth	2017-08-18 04:36:56+00	2017-08-18 04:36:56+00	1
1245	Kenneth Kong	youmuren616@gmail.com	2013-06-16	0	1	Roadshows	2017-08-18 04:37:53+00	2017-08-18 04:37:53+00	1
1246	Mei wang	wangsville@hotmail.com	1955-03-02	0	1	Newspapers	2017-08-18 04:39:21+00	2017-08-18 04:39:21+00	1
1247	Yu Lin	shufang80@yahoo.com	2013-10-14	0	1	Roadshows	2017-08-18 04:39:41+00	2017-08-18 04:42:04+00	1
1248	Xu Baoru	baoru90@hotmail.com	1990-05-31	4	1	Roadshows	2017-08-18 04:39:53+00	2017-08-18 04:39:53+00	1
1249	Hieu	viethieu2504@gmail.com	1990-04-25	4	1	Roadshows	2017-08-18 04:40:05+00	2017-08-18 04:40:05+00	1
1250	Yeo tiong hian	yeotionghian@gmail.com	1992-09-20	4	1	Roadshows	2017-08-18 04:40:21+00	2017-08-18 04:40:21+00	1
1251	Yiting Watt	yiwatt@gmail.com	1993-09-11	0	1	Word-of-mouth	2017-08-18 04:41:11+00	2017-08-18 04:41:11+00	1
1252	Kennedy Chew	kenchew@acm.org	1962-02-17	2	1	Posters	2017-08-18 04:41:47+00	2017-08-18 04:41:47+00	1
1253	Janice Kara	kararaven@gmail.com	1997-08-03	0	1	Roadshows	2017-08-18 04:42:56+00	2017-08-18 04:42:56+00	1
1254	QH	rimb97@yahoo.com.sg	2014-09-01	0	1	Posters,Bus Stop Ads,one-north Apps,PULSE Newsletter,Electronic Direct Mailer,Word-of-mouth	2017-08-18 04:43:10+00	2017-08-18 04:43:10+00	1
1255	Tan Shu Pei	tan_shu_pei@hotmail.com	1991-12-21	2	1	Roadshows	2017-08-18 04:43:11+00	2017-08-18 04:43:11+00	1
1256	Chia na yu	cherryforest@gmail.com	1983-01-29	0	1	Roadshows	2017-08-18 04:43:28+00	2017-08-18 04:43:28+00	1
1257	Irene	ireneteo11@gmail.com	1970-11-11	6	1	Posters,one-north Apps	2017-08-18 04:45:29+00	2017-08-18 04:45:29+00	1
1258	Darren	taydarren@hotmail.com	1976-03-08	0	1	Social Media	2017-08-18 04:50:15+00	2017-08-18 04:50:15+00	1
1259	Kelvin	deut79@gmail.com	1981-11-12	0	1	Roadshows	2017-08-18 04:51:06+00	2017-08-18 04:51:06+00	1
1260	Zhang Tianyi	alfafa_flame@hotmail.com	1985-09-20	4	1	Roadshows	2017-08-18 04:51:13+00	2017-08-18 04:51:13+00	1
1261	Shinobu	shinobuky@gmail.com	2017-08-18	0	1	Word-of-mouth	2017-08-18 04:51:49+00	2017-08-18 04:51:49+00	1
1262	Gab	gycliu@yahoo.com	1978-03-23	0	1	Posters	2017-08-18 04:57:54+00	2017-08-18 04:57:54+00	1
1263	Nitu	balwaninitu@gmail.com	1983-05-30	4	1	Roadshows	2017-08-18 04:59:06+00	2017-08-18 04:59:06+00	1
1264	Carin	fabricatedlife@gmail.com	1990-03-21	0	1	Word-of-mouth	2017-08-18 04:59:15+00	2017-08-18 04:59:15+00	1
1265	Shandy	shandy7@gmail.com	1983-03-07	7	1	Roadshows	2017-08-18 04:59:54+00	2017-08-18 04:59:54+00	1
1266	Yeow Chia fong	yeow81@yahoo.com	1981-01-15	0	1	Social Media	2017-08-18 05:00:15+00	2017-08-18 05:00:15+00	1
1267	Tay Yue Weng	yueweng@yahoo.com	1976-03-20	7	1	Roadshows	2017-08-18 05:01:02+00	2017-08-18 05:01:02+00	1
1268	Moli	moli_pv@yahoo.com	1981-05-27	4	1	Word-of-mouth	2017-08-18 05:01:26+00	2017-08-18 05:01:26+00	1
1269	Aileena	AILEENALUA@GMAIL.COM	1983-03-08	7	1	Word-of-mouth	2017-08-18 05:01:27+00	2017-08-18 05:01:27+00	1
1270	Princern Tjia	wellytjia@yahoo.com	2005-03-21	0	1	Social Media	2017-08-18 05:06:04+00	2017-08-18 05:06:04+00	1
1271	Francie Tan	francie.tan@merz.sg	1983-05-27	4	1	Word-of-mouth	2017-08-18 05:06:42+00	2017-08-18 05:06:42+00	1
1272	Kelly He Weiyi	kellyhewy@hotmail.com	1994-08-29	0	1	Roadshows	2017-08-18 05:09:26+00	2017-08-18 05:09:26+00	1
1273	Rachel	racctm@gmail.com	1981-02-20	4	1	Posters	2017-08-18 05:09:45+00	2017-08-18 05:09:45+00	1
1274	Emily Ko	emilyko88@hotmail.com	1988-07-08	0	1	Social Media	2017-08-18 05:11:39+00	2017-08-18 05:11:39+00	1
1275	Rex nah	jennychua12@gmail.com	2008-05-29	0	1	Roadshows	2017-08-18 05:13:42+00	2017-08-18 05:13:42+00	1
1276	Jay Ng	soul2hunter@hotmail.com	1987-02-11	0	1	Social Media	2017-08-18 05:14:08+00	2017-08-18 05:14:08+00	1
1277	Helen	helen12208@yahoo.com	1954-08-14	1	1	Roadshows	2017-08-18 05:15:48+00	2017-08-18 05:15:48+00	1
1278	Ramon	ramon2d2@hotmail.com	1990-08-02	2	1	Roadshows	2017-08-18 05:17:11+00	2017-08-18 05:17:11+00	1
1279	Elbert Ang	jkqxzs@gmail.com	1968-07-30	0	1	Roadshows	2017-08-18 05:17:18+00	2017-08-18 05:17:18+00	1
1280	Anh Le Viet	alv@witbe.net	1986-08-18	2	1	Bus Stop Ads	2017-08-18 05:17:23+00	2017-08-18 05:17:23+00	1
1281	Janice Teo	janteo33@gmail.com	1966-08-03	2	1	Bus Stop Ads	2017-08-18 05:17:42+00	2017-08-18 05:17:42+00	1
1282	Timothy loo	leslieloo7@gmail.com	2010-07-17	0	1	Posters	2017-08-18 05:19:24+00	2017-08-18 05:19:24+00	1
1283	Pamela	pamelalokeaifen@gmail.com	1993-07-21	0	1	Roadshows	2017-08-18 05:20:11+00	2017-08-18 05:20:11+00	1
1284	Christine	maxuno3@gmail.com	1983-05-19	0	1	Roadshows	2017-08-18 05:24:08+00	2017-08-18 05:24:08+00	1
1285	Sivakumar	shivva14@yahoo.com	1976-08-14	0	1	Word-of-mouth	2017-08-18 05:24:24+00	2017-08-18 05:24:24+00	1
1286	Cheng Mei Chen	mei_chen_cheng@hotmail.com	1972-10-05	4	1	Roadshows	2017-08-18 05:25:18+00	2017-08-18 05:25:18+00	1
1287	Vincent' Tan	zoechoo@yahoo.com.sg	1977-06-30	4	1	Posters	2017-08-18 05:26:22+00	2017-08-19 03:08:01+00	1
1288	Chan See Kei	onlyckei@gmail.com	1994-08-12	0	1	Social Media	2017-08-18 05:26:41+00	2017-08-18 05:26:41+00	1
1290	Novita	N.kurniati@gmail.com	1980-11-08	0	1	Social Media	2017-08-18 05:27:18+00	2017-08-19 04:32:05+00	1
1291	Bai yunsong	sqliu73@gmail.com	2005-12-16	0	1	Roadshows	2017-08-18 05:27:49+00	2017-08-18 05:27:49+00	1
1292	Rachel	milky_moo94@hotmail.com	1994-05-13	0	1	Posters	2017-08-18 05:28:21+00	2017-08-18 05:28:21+00	1
1293	Cedric ong	ong_cedric@hotmail.com	1972-09-07	4	1	Roadshows	2017-08-18 05:30:09+00	2017-08-18 05:30:09+00	1
1294	Kaufik	kaufik@gmail.com	1978-07-11	0	1	Posters	2017-08-18 05:30:36+00	2017-08-19 04:33:14+00	1
1295	Manjith	manjith.k@gmail.com	1971-01-18	4	1	Roadshows	2017-08-18 05:31:03+00	2017-08-18 05:31:03+00	1
1296	Sylvia	ngsylvia@hotmail.com	2010-12-20	0	1	Roadshows	2017-08-18 05:39:57+00	2017-08-18 05:39:57+00	1
1297	Timothy loo	leslieloo@gmail.com	2010-07-17	0	1	Posters	2017-08-18 05:43:12+00	2017-08-18 05:43:12+00	1
1298	Kym	fishhy17@yahoo.com	1990-07-28	0	1	PULSE Newsletter,Word-of-mouth	2017-08-18 05:44:08+00	2017-08-18 05:44:08+00	1
1299	Eison	weesheung@hotmail.com	2013-02-10	0	1	Newspapers	2017-08-18 05:44:27+00	2017-08-18 05:44:28+00	1
1300	Quek Hong Geok	hgqem.hg@gmail.com	1979-10-25	0	1	Posters	2017-08-18 05:52:54+00	2017-08-18 05:52:54+00	1
1301	Min	minoingc@gmail.com	1979-11-30	2	1	Roadshows	2017-08-18 05:55:13+00	2017-08-18 05:55:13+00	1
1302	Low zhenghui	pfng707@yahoo.com.sg	2008-04-28	0	1	Social Media	2017-08-18 05:58:48+00	2017-08-18 05:58:48+00	1
1303	Low yongcheng	admin@ecoxplore.com.sg	2010-01-19	0	1	Social Media	2017-08-18 06:00:30+00	2017-08-18 06:00:30+00	1
1304	Jayden Chan	chianhm@hotmail.com	2005-10-08	0	1	Social Media	2017-08-18 06:02:42+00	2017-08-18 06:02:42+00	1
1305	Adithi Khandadai	adithikhandadi@gmail.com	1988-05-27	0	1	Word-of-mouth	2017-08-18 06:05:14+00	2017-08-18 06:05:14+00	1
1306	Lilian Chiang	sm_242@yahoo.com.sg	1955-12-10	0	1	Roadshows	2017-08-18 06:05:25+00	2017-08-18 06:05:25+00	1
1307	Seng Tiong Gan	sengtionggan@gmail.com	1967-06-30	0	1	Social Media	2017-08-18 06:05:53+00	2017-08-18 06:05:53+00	1
1308	Yvonne yan	yvonne_ngian@live.com.sg	2017-02-05	2	1	Word-of-mouth	2017-08-18 06:07:21+00	2017-08-18 06:07:21+00	1
1309	Jenny Lim	jennylim8181@yahoo.com.sg	1981-04-02	0	1	Roadshows	2017-08-18 06:08:09+00	2017-08-18 06:08:09+00	1
1310	Irina christova	Christova.Irina@gmail.com	2008-01-10	0	1	Social Media	2017-08-18 06:10:07+00	2017-08-18 06:10:07+00	1
1311	Shannon	shannon@thirtythree.com.sg	1992-11-09	0	1	Roadshows	2017-08-18 06:10:15+00	2017-08-18 06:10:15+00	1
1312	Nix	nixlene@gmail.com	1985-06-22	2	1	Social Media	2017-08-18 06:12:26+00	2017-08-18 06:12:26+00	1
1313	Lu-En	luenwai@gmail.com	1982-11-19	4	1	Posters,Electronic Direct Mailer	2017-08-18 06:12:54+00	2017-08-18 06:12:54+00	1
1314	Marcus	mlim@outlook.sg	2007-03-01	0	1	Newspapers	2017-08-18 06:15:20+00	2017-08-18 06:15:20+00	1
1315	Gerald	chyesiew@hotmail.com	1951-08-22	0	1	Roadshows	2017-08-18 06:15:21+00	2017-08-18 06:15:21+00	1
1316	Karen	karenohaiyo@yahoo.com.sg	1956-02-25	0	1	Newspapers	2017-08-18 06:16:26+00	2017-08-18 06:16:26+00	1
1317	wyndee	wyndeexp@gmail.com	1994-05-10	0	1	Roadshows	2017-08-18 06:17:24+00	2017-08-19 02:43:39+00	1
1318	Ahsim	123ahsim@gmail.com	1952-11-05	0	1	Roadshows	2017-08-18 06:17:45+00	2017-08-18 06:17:45+00	1
1319	Alice ong	alice_ong@immunol.a-star.edu.sg	2017-08-18	4	1	Roadshows	2017-08-18 06:19:13+00	2017-08-18 06:19:13+00	1
1320	Thivanai	thivanai@brc.a-star.edu.sg	1984-06-28	4	1	Electronic Direct Mailer	2017-08-18 06:26:35+00	2017-08-18 06:26:35+00	1
1321	Jasmine Ng	ngjasmine96@gmail.com	1996-02-20	0	1	Roadshows	2017-08-18 06:29:28+00	2017-08-18 06:29:28+00	1
1322	Dionna tan	dionnanat@gmail.com	1995-04-20	0	1	Word-of-mouth	2017-08-18 06:34:17+00	2017-08-18 06:34:17+00	1
1323	Shee shi yun	sheeshiyun@hotmail.com	1996-11-27	0	1	Roadshows	2017-08-18 06:37:14+00	2017-08-18 06:37:14+00	1
1324	JARON HWEE	jaron.hwee@gmail.com	1981-12-18	2	1	Posters	2017-08-18 06:43:21+00	2017-08-18 06:43:21+00	1
1325	Amy tan	tanmee2@yahoo.com.sg	1976-03-02	0	1	Roadshows	2017-08-18 06:46:05+00	2017-08-18 06:46:05+00	1
1326	lol guat kar	guatkark@yahoo.com	1951-07-12	0	1	Roadshows	2017-08-18 06:47:32+00	2017-08-18 06:47:32+00	1
1327	Katarina chlebikova	k.chlebikova409@gmail.com	1991-04-19	0	1	Word-of-mouth	2017-08-18 07:00:38+00	2017-08-18 07:00:38+00	1
1328	Bernard Sim	bernardsim89@gmail.com	1989-05-22	0	1	Social Media	2017-08-18 07:06:11+00	2017-08-18 07:06:11+00	1
1329	Gerald thong	raldswald@gmail.com	1987-05-27	0	1	Word-of-mouth	2017-08-18 07:08:22+00	2017-08-18 07:08:22+00	1
1330	Vicki er	zer0nin3@live.com	1986-01-09	0	1	Word-of-mouth	2017-08-18 07:09:20+00	2017-08-18 07:09:20+00	1
1331	Kelvin Tan	bk_kelvin@yahoo.com	1982-07-25	4	1	Roadshows	2017-08-18 07:14:12+00	2017-08-18 07:14:12+00	1
1332	Chris Ho	hojunhui@yahoo.com.sg	1982-07-28	0	1	Roadshows	2017-08-18 07:17:07+00	2017-08-18 07:17:07+00	1
1333	Lim bee leng	limbl777@gmail.v	2001-12-08	0	1	Newspapers	2017-08-18 07:27:18+00	2017-08-18 07:27:18+00	1
1334	David Wong Zhi Wen	wsliang78@gmail.com	2007-11-10	0	1	Word-of-mouth	2017-08-18 07:30:31+00	2017-08-19 03:16:31+00	1
1335	Tham Fook On	fookon@usa.net	1974-06-29	0	1	Posters	2017-08-18 07:31:47+00	2017-08-18 07:31:47+00	1
1336	Karen	karenng645@gmail.com	1976-08-21	0	1	Roadshows	2017-08-18 07:34:27+00	2017-08-18 07:34:27+00	1
1337	Ryan	admin@ape.com	2006-12-18	0	1	Roadshows	2017-08-18 07:35:41+00	2017-08-19 08:17:09+00	1
1338	Nakees	admin@ade.com	2017-08-18	0	1	Roadshows	2017-08-18 07:36:55+00	2017-08-18 07:37:57+00	1
1339	Law Soon Keat	law_soon_keat@bti.a-star.edu.sg	1978-09-01	4	1	Roadshows	2017-08-18 07:37:56+00	2017-08-18 07:37:56+00	1
1340	Florence  Chua	chuamk36@gmail.com	1962-01-18	0	1	Roadshows	2017-08-18 07:48:35+00	2017-08-18 07:48:35+00	1
1341	Grace Lim	e97357455@gmail.com	1991-03-25	0	1	Social Media	2017-08-18 07:54:06+00	2017-08-18 07:54:06+00	1
1342	Test to James	testtojames@mailinator.com	2016-12-12	1	1	Roadshows	2017-08-18 07:55:53+00	2017-08-18 07:55:53+00	1
1343	Cheryl	cwee2009@gmail.com	1971-05-09	0	1	Roadshows	2017-08-18 08:08:41+00	2017-08-18 08:08:41+00	1
1344	Sharon	sysiow@gmail.com	1981-11-13	0	1	Social Media	2017-08-18 08:09:18+00	2017-08-18 08:09:19+00	1
1345	Christina	yuka_san@yahoo.com.sg	1977-02-19	4	1	Roadshows	2017-08-18 08:09:32+00	2017-08-18 08:09:32+00	1
1346	Damodharasamy Lalithamani	lalithasath@gmail.com	2017-09-01	0	1	Posters,Word-of-mouth	2017-08-18 08:12:11+00	2017-08-18 08:12:11+00	1
1347	Velusamy Sathiakumar	sathiakumarv@gmail.com	2017-07-30	0	1	Posters,Word-of-mouth	2017-08-18 08:14:15+00	2017-08-18 08:14:15+00	1
1348	Velusamy Sathiakumar Ashok Balaji	ashokcoolboy5@gmail.com	2017-10-27	0	1	Posters	2017-08-18 08:16:16+00	2017-08-18 08:16:16+00	1
1349	Noorunnisha	jnoor25@gmail.com	1985-05-03	0	1	Roadshows	2017-08-18 08:16:32+00	2017-08-19 04:07:01+00	1
1350	Evan Ho	patng86@hotmail.com	2007-11-01	0	1	Social Media	2017-08-18 08:22:07+00	2017-08-18 08:28:33+00	1
1351	Carly Leung	caly.leung@gmail.com	2019-08-18	4	1	Roadshows	2017-08-18 08:22:07+00	2017-08-18 08:22:07+00	1
1352	Shadeena umaira	shadeena.umaira@gmail.com	1987-05-12	4	1	Roadshows	2017-08-18 08:24:24+00	2017-08-18 08:24:24+00	1
1353	Naadiya	nnaadiya@hotmail.com	1981-12-16	4	1	Posters	2017-08-18 08:24:37+00	2017-08-18 08:24:37+00	1
1354	ARVA HASIM	arva.hs@gmail.com	1985-01-09	2	1	Word-of-mouth	2017-08-18 08:25:55+00	2017-08-18 08:25:55+00	1
1355	Wee gunk Ngoh pamela	weegn@scei.astar.edu.sg	1965-02-24	0	1	Roadshows	2017-08-18 08:33:05+00	2017-08-18 08:33:05+00	1
1356	Donna Ng	donna_ng@scei.a-star.edu.sg	1972-02-20	4	1	Roadshows	2017-08-18 08:33:33+00	2017-08-18 08:33:33+00	1
1357	Ng Jun wei	junwei42ng@hotmail.com	1995-01-16	0	1	Roadshows	2017-08-18 08:35:18+00	2017-08-18 08:35:18+00	1
1358	Joash ong	brenmae@gmail.com	2005-05-24	0	1	Word-of-mouth	2017-08-18 08:42:00+00	2017-08-18 08:47:37+00	1
1359	Lee Yue Yang	leeyueyang97@gmail.com	1997-11-19	0	1	Roadshows	2017-08-18 08:46:01+00	2017-08-18 08:46:01+00	1
1360	Teo pei yun	teopeiyun@gmail.com	1987-11-14	4	1	Social Media	2017-08-18 08:49:39+00	2017-08-18 08:49:39+00	1
1361	Lynette Sze	szelynette@gmail.com	1992-02-25	4	1	Word-of-mouth	2017-08-18 08:50:01+00	2017-08-18 08:50:01+00	1
1362	Jaedon ong	b@fruitloop.org	2007-12-01	0	1	Word-of-mouth	2017-08-18 08:50:36+00	2017-08-18 09:14:31+00	1
1363	BRYAN	yourdadis@hotmail.com	1993-11-11	0	1	Roadshows	2017-08-18 08:50:58+00	2017-08-18 08:50:58+00	1
1364	Choy Fong Chan	fcchoy@gmail.com	1987-01-08	4	1	Roadshows	2017-08-18 08:51:10+00	2017-08-18 08:51:10+00	1
1365	Lucas Goh	lucas_goh@bti.a-star.edu.au	1984-11-07	4	1	Bus Stop Ads	2017-08-18 08:51:38+00	2017-08-18 08:51:38+00	1
1366	Andy Tan	andytanhm@live.com	1972-01-08	4	1	Electronic Direct Mailer	2017-08-18 08:52:36+00	2017-08-18 08:52:36+00	1
1367	Joey	joeyyyyyo@gmail.com	1997-02-16	0	1	Word-of-mouth	2017-08-18 08:54:22+00	2017-08-18 08:54:22+00	1
1368	Karen	karen645@gmail.com	1976-07-21	0	1	Roadshows	2017-08-18 08:54:39+00	2017-08-18 08:54:39+00	1
1369	Lim Yu Ming	yuming.lim21@gmail.com	1988-02-20	4	1	Roadshows	2017-08-18 08:55:05+00	2017-08-18 08:55:05+00	1
1370	Jeanette	jayxfernandes@gmail.com	1996-11-26	0	1	Roadshows	2017-08-18 08:58:04+00	2017-08-18 08:58:04+00	1
1371	jia hui	jiahuipoh4@gmail.com	1996-02-15	0	1	Roadshows	2017-08-18 08:58:17+00	2017-08-18 08:58:17+00	1
1372	Paul	paul@ape.sg	1973-04-30	0	1	Word-of-mouth	2017-08-18 08:58:42+00	2017-08-18 08:58:42+00	1
1373	Yihan Nee	neeyh91@gmail.com	1991-11-03	0	1	Word-of-mouth	2017-08-18 09:00:02+00	2017-08-18 09:00:02+00	1
1374	Favour goh	gohfavour@gmail.com	1956-06-11	0	1	Roadshows	2017-08-18 09:02:58+00	2017-08-18 09:02:58+00	1
1375	Sally Kwong	sallykwong@live.com	1989-08-14	0	1	Roadshows	2017-08-18 09:02:59+00	2017-08-18 09:02:59+00	1
1376	Cheryl	cheryler92@gmail.com	1992-04-14	0	1	Roadshows	2017-08-18 09:03:12+00	2017-08-18 09:03:12+00	1
1377	Nano	nanoasp@gmail.com	1991-11-16	0	1	Word-of-mouth	2017-08-18 09:03:13+00	2017-08-18 09:03:13+00	1
1378	Yuen Sheng Hao	codenviperfanatics@hotmail.com	1998-11-14	0	1	Word-of-mouth	2017-08-18 09:06:09+00	2017-08-18 09:06:09+00	1
1379	hermione	shd@gmail.com	1984-08-18	0	1	Posters	2017-08-18 09:06:48+00	2017-08-18 09:06:48+00	1
1380	Sebastian Lau	burningrain75@gmail.com	1977-09-23	4	1	Word-of-mouth	2017-08-18 09:06:53+00	2017-08-18 09:06:53+00	1
1381	Alice lim	eureca1@hotmail.com	1979-06-19	4	1	Roadshows	2017-08-18 09:07:09+00	2017-08-18 09:07:09+00	1
1382	Marie Therese	mtherese@hotmail.com	1982-05-08	0	1	Roadshows	2017-08-18 09:07:16+00	2017-08-18 09:07:16+00	1
1383	Kahsuan	kahsuan339@gmail.com	1993-11-25	0	1	Roadshows	2017-08-18 09:07:32+00	2017-08-18 09:07:32+00	1
1384	Adlai	Alabama_97@hotmail.com	1997-08-18	0	1	Roadshows	2017-08-18 09:07:36+00	2017-08-18 09:07:36+00	1
1385	Joash ong	ongskool@gmail.com	2005-05-24	0	1	Word-of-mouth	2017-08-18 09:08:57+00	2017-08-18 09:08:57+00	1
1386	Lucas Lee	lucaskylee@gmail.com	1975-02-24	6	1	PULSE Newsletter	2017-08-18 09:09:03+00	2017-08-18 09:09:03+00	1
1387	Nafisa	fisafig@gmail.com	1975-05-20	5	1	Roadshows	2017-08-18 09:09:43+00	2017-08-18 09:09:43+00	1
1388	Ben	benedictchew@gmail.com	1977-06-13	0	1	Social Media	2017-08-18 09:10:10+00	2017-08-18 09:10:10+00	1
1389	Sofia Lau	kats.luver@gmail.com	1979-11-07	0	1	Roadshows	2017-08-18 09:10:12+00	2017-08-18 09:10:12+00	1
1391	Jonathan	ethyrsol@gmail.com	1992-08-18	0	1	Roadshows	2017-08-18 09:13:17+00	2017-08-18 09:13:17+00	1
1392	Phua Ser Xian	phuasx@gmail.com	1997-08-12	4	1	Electronic Direct Mailer	2017-08-18 09:13:20+00	2017-08-18 09:13:20+00	1
1393	Hwei fen	hfleong@imcb.a-star.edu.sg	1977-06-24	4	1	Roadshows	2017-08-18 09:13:26+00	2017-08-18 09:22:10+00	1
1394	Samuel G	samuelg@bii.a-star.edu.sg	1981-09-30	4	1	Roadshows	2017-08-18 09:13:30+00	2017-08-18 09:13:30+00	1
1395	POH JUN JIE	anson_12@hotmail.com	1993-07-21	4	1	Posters	2017-08-18 09:13:35+00	2017-08-18 09:13:35+00	1
1396	Ryan Chang	ryan98@gmail.com	1998-05-20	4	1	Word-of-mouth	2017-08-18 09:13:41+00	2017-08-18 09:13:41+00	1
1397	Joshua Choo	joshua_choo_teck@hotmail.com	1975-03-25	0	1	Word-of-mouth	2017-08-18 09:14:38+00	2017-08-18 09:14:38+00	1
1398	Ang Chong Han	achonghan@hotmail.com	1993-02-10	0	1	Roadshows	2017-08-18 09:15:16+00	2017-08-18 09:15:17+00	1
1399	Darrian	benedictchew@icloud.com	2006-05-27	0	1	Roadshows	2017-08-18 09:15:37+00	2017-08-18 09:15:37+00	1
1400	Joshua Choo	joshua.choo@dupont.com	1975-03-25	0	1	Word-of-mouth	2017-08-18 09:16:03+00	2017-08-18 09:16:03+00	1
1401	Masagos Moritani	masako.moritani@gmail.com	1976-09-25	0	1	Posters	2017-08-18 09:16:55+00	2017-08-18 09:16:55+00	1
1402	Yoko sekiya	jpn3651niwax@gmail.com	2017-08-18	0	1	Posters	2017-08-18 09:17:34+00	2017-08-18 09:17:34+00	1
1403	Yoshihisa moribata	moribata.y@pg.com	1964-08-06	0	1	Roadshows	2017-08-18 09:17:53+00	2017-08-18 09:17:53+00	1
1404	Cher	tan.c.4@pg.com	1993-04-10	4	1	Posters	2017-08-18 09:18:06+00	2017-08-18 09:18:06+00	1
1405	Elizabeth Teo	ellieeezabeth@gmail.com	2001-09-23	0	1	Roadshows	2017-08-18 09:18:41+00	2017-08-18 09:18:41+00	1
1406	Kat Agres	katagres@gmail.com	1983-09-26	2	1	PULSE Newsletter,Word-of-mouth	2017-08-18 09:18:41+00	2017-08-18 09:18:41+00	1
1407	Keianna Chia	keiannachia@gmail.com	2001-06-17	0	1	Word-of-mouth	2017-08-18 09:19:08+00	2017-08-18 09:19:08+00	1
1408	Dorien	dorie.herremans@gmail.com	1982-07-26	0	1	Word-of-mouth	2017-08-18 09:19:39+00	2017-08-18 09:19:39+00	1
1409	bryan poh	poh.b@pg.com	1980-11-21	4	1	Roadshows	2017-08-18 09:20:55+00	2017-08-18 09:20:55+00	1
1410	Quek Ying Fang	yingfang21-others@yahoo.com.sg	1974-01-21	0	1	Bus Stop Ads	2017-08-18 09:21:38+00	2017-08-18 09:21:38+00	1
1411	Coral Koh	Coralkohreuben@gmail.com	2000-10-24	0	1	Posters	2017-08-18 09:22:35+00	2017-08-18 09:22:35+00	1
1412	Tay Kai yuan	barrytky@gmail.com	1971-02-04	0	1	Posters	2017-08-18 09:24:19+00	2017-08-18 09:24:19+00	1
1413	Samantha Yan	Samantha_116900@hotmail.com	1992-09-25	0	1	Posters,Bus Stop Ads	2017-08-18 09:27:22+00	2017-08-18 09:27:22+00	1
1414	Moses	mosestandiono@gis.a-star.edu.sg	1985-08-23	4	1	Roadshows	2017-08-18 09:27:26+00	2017-08-18 09:27:26+00	1
1415	Elaine Chew	chewgy@gis.a-star.edu.sg	1986-06-09	4	1	Posters	2017-08-18 09:27:42+00	2017-08-18 09:27:42+00	1
1416	Irena	irenathamwy@gmail.com	1992-10-06	0	1	Roadshows	2017-08-18 09:27:57+00	2017-08-18 09:27:57+00	1
1417	Allen	neo_weelun@hotmail.com	1990-06-28	0	1	Word-of-mouth	2017-08-18 09:28:11+00	2017-08-18 09:28:11+00	1
1418	Zai Yang	phua.zaiyang@gmail.com	1983-11-13	4	1	Roadshows	2017-08-18 09:28:26+00	2017-08-18 09:28:26+00	1
1419	Camelia	cameliachng@gmail.com	1966-10-20	0	1	Roadshows	2017-08-18 09:29:03+00	2017-08-18 09:29:03+00	1
1420	Eliza	eliza_hxp@hotmail.com	1996-09-09	4	1	Roadshows	2017-08-18 09:30:04+00	2017-08-18 09:30:04+00	1
1421	David Wu	dtwu01@gmail.com	1963-08-28	2	1	Roadshows	2017-08-18 09:32:03+00	2017-08-18 09:32:03+00	1
1422	Susana kim	susana_kim@bti.a-star.edu.sg	1982-05-24	4	1	Roadshows	2017-08-18 09:32:39+00	2017-08-18 09:32:39+00	1
1423	Shiela	shiela__@hotmail.com	1986-04-03	0	1	Word-of-mouth	2017-08-18 09:33:53+00	2017-08-18 09:33:53+00	1
1424	Ernest Worthing	ernestworthing@gmail.com	2000-08-18	0	1	Roadshows	2017-08-18 09:34:47+00	2017-08-18 09:34:47+00	1
1425	Melissa	michelleleong8899@gmail.com	2000-05-06	0	1	Word-of-mouth	2017-08-18 09:35:19+00	2017-08-18 09:35:19+00	1
1426	Desiree Abdurrachim	Desiree.abdurrachim@gmail.com	1983-10-01	4	1	Posters	2017-08-18 09:38:12+00	2017-08-18 09:38:12+00	1
1427	Jack	jackworthing@gmail.com	2000-08-18	0	1	Roadshows	2017-08-18 09:42:13+00	2017-08-18 09:42:13+00	1
1428	Claudia	ich.jun@gmail.com	1997-07-17	0	1	Roadshows	2017-08-18 09:43:33+00	2017-08-18 09:43:33+00	1
1429	Gerald	geraldgsw@gmail.com	1982-02-13	4	1	Roadshows	2017-08-18 09:45:26+00	2017-08-18 09:45:26+00	1
1430	Edmund	shao_wei1987@hotmail.com	1987-06-14	0	1	Word-of-mouth	2017-08-18 09:51:36+00	2017-08-19 07:48:19+00	1
1431	Pearline Teo	dapearl@gmail.com	2011-11-06	2	1	Word-of-mouth	2017-08-18 09:51:38+00	2017-08-18 09:51:38+00	1
1432	Dhanaraj Kumaravel	dhanaraj_kumaravel@bmsi.a-star.edu.sg	1971-12-22	2	1	Social Media	2017-08-18 09:53:47+00	2017-08-18 09:53:47+00	1
1433	Govindasamy Rajasekaran	govindasamyrajasekaran@hq.astar.com.sg	1966-07-30	0	1	Roadshows	2017-08-18 09:54:58+00	2017-08-18 09:54:58+00	1
1434	Jessica Teo	jhudia@gmail.com	2011-10-26	0	1	Word-of-mouth	2017-08-18 09:55:18+00	2017-08-18 09:55:18+00	1
1435	Jeremy Loh	jeremyjc.loh@gmail.com	2011-10-26	0	1	Word-of-mouth	2017-08-18 09:56:50+00	2017-08-18 09:56:50+00	1
1436	Teo Yong Choon	tosca4444@yahoo.com	1996-04-02	2	1	Word-of-mouth	2017-08-18 09:58:38+00	2017-08-18 09:58:38+00	1
1437	Lee leck luang	pjlyvonne@gmail.com	1996-04-02	2	1	Word-of-mouth	2017-08-18 09:59:34+00	2017-08-18 09:59:34+00	1
1438	Elias	vijay@sportstechnik.com	1980-04-07	0	1	Word-of-mouth	2017-08-18 10:01:42+00	2017-08-18 10:02:48+00	1
1439	Sean xin ying	seahxinying@gmail.com	1990-06-29	4	1	Word-of-mouth	2017-08-18 10:01:47+00	2017-08-18 10:01:47+00	1
1440	Peter bond	peter0bond@gmail.com	1978-08-18	4	1	Roadshows	2017-08-18 10:03:08+00	2017-08-18 10:03:08+00	1
1441	Igor berezovsky	igorb@bii.a-star.edu.sg	1970-01-12	0	1	Roadshows	2017-08-18 10:03:37+00	2017-08-18 10:03:37+00	1
1442	Mara	mara.kozic@gmail.com	1988-09-13	4	1	Roadshows	2017-08-18 10:04:35+00	2017-08-18 10:04:35+00	1
1443	Shawn	elements50@yahoo.com	1976-12-26	0	1	Word-of-mouth	2017-08-18 10:05:10+00	2017-08-18 10:05:10+00	1
1444	Chinh	chinhsutranto@bii.a-star.edu.sg	1982-11-04	0	1	Roadshows	2017-08-18 10:05:33+00	2017-08-18 10:05:33+00	1
1445	Shi han	elena888chen@gmail.com	2010-06-29	0	1	Bus Stop Ads	2017-08-18 10:05:46+00	2017-08-18 10:07:37+00	1
1446	Shilpa Yadahalli	shilpa.yadahalli@gmail.com	1990-01-09	0	1	Roadshows	2017-08-18 10:06:25+00	2017-08-18 10:06:25+00	1
1447	Irfan Lau	irfan.lau@gmail.com	2007-06-07	0	1	Roadshows	2017-08-18 10:27:51+00	2017-08-18 10:27:51+00	1
1448	matthew kao	big_mothball@yahoo.com	2016-02-25	0	1	Roadshows	2017-08-18 10:30:09+00	2017-08-18 10:30:09+00	1
1449	Hana Lau	hana.lau.yh@gmail.com	2009-02-25	0	1	Roadshows	2017-08-18 10:30:29+00	2017-08-18 10:30:29+00	1
1450	Yong Jenn NYNE	ai_muban@yahoo.com	2015-01-17	0	1	Social Media	2017-08-18 10:52:15+00	2017-08-18 10:55:18+00	1
1451	Kuldeep	patilkm@gmail.com	1978-12-21	4	1	Roadshows	2017-08-18 11:36:57+00	2017-08-18 11:36:57+00	1
1452	Samantha	samantha.ng@gmail.com	1987-05-04	0	1	Word-of-mouth	2017-08-18 11:55:46+00	2017-08-18 11:55:46+00	1
1453	Linda Wong	alyplwwf@yahoo.com	1965-04-22	0	1	PULSE Newsletter	2017-08-18 12:30:50+00	2017-08-19 06:08:12+00	1
1454	Aiko	aikolee0050@gmail.com	1994-11-30	0	1	Social Media	2017-08-18 12:52:44+00	2017-08-18 12:52:44+00	1
1455	Taylor Varian Jude	dj.dblxl@gmail.com	1978-02-04	0	1	Posters	2017-08-18 13:12:16+00	2017-08-18 13:12:16+00	1
1456	Nattalya Nico Alvinur	nico_alvinur@yahoo.co.uk	2010-06-10	0	1	Social Media	2017-08-18 13:23:27+00	2017-08-18 13:23:27+00	1
1457	Adeline Poh	a.w.j.poh@durham.ac.uk	1996-10-09	4	1	Posters	2017-08-18 13:25:53+00	2017-08-18 13:25:53+00	1
1458	N. Alvinur	alvinur@yahoo.co.uk	1966-05-24	0	1	Social Media	2017-08-18 13:26:27+00	2017-08-18 13:26:27+00	1
1459	Stephanie Moller	bbjxoslofan@gmail.com	2008-06-09	0	1	Social Media	2017-08-18 13:28:20+00	2017-08-18 13:30:21+00	1
1460	Lovelle	love_3987@yahoo.com.sg	2017-08-19	0	1	Social Media	2017-08-18 13:44:40+00	2017-08-18 13:44:40+00	1
1461	Lucas lee	lucasgeok@gmail.com	2009-02-16	0	1	Bus Stop Ads	2017-08-18 13:45:47+00	2017-08-18 13:45:47+00	1
1462	Ee jia	eejia.tan@gmail.com	1984-02-19	0	1	Word-of-mouth	2017-08-18 13:54:09+00	2017-08-19 03:34:49+00	1
1463	Jocelyn Ang	jocelynang0731@yahoo.com	1980-07-31	0	1	Newspapers	2017-08-18 14:35:04+00	2017-08-18 14:35:04+00	1
1464	Lam Ah Kay	lamahkay@yahoo.com.sg	1947-03-10	0	1	Word-of-mouth	2017-08-18 14:39:25+00	2017-08-18 14:39:25+00	1
1465	Javis Tan	Yeejuchen@gmail.com	2004-10-27	0	1	Word-of-mouth	2017-08-18 14:51:36+00	2017-08-18 14:51:36+00	1
1466	Ernest Tan	zeeying@gmail.com	2011-11-11	0	1	Social Media	2017-08-18 14:52:48+00	2017-08-18 14:52:48+00	1
1467	Eng Theng	tanengtheng@hotmail.com	1979-03-12	0	1	Word-of-mouth	2017-08-18 14:54:38+00	2017-08-18 14:54:38+00	1
1468	Stephanie wong	stephanieanne_wong@yahoo.com	1976-08-07	1	1	Word-of-mouth	2017-08-18 15:14:43+00	2017-08-18 15:14:43+00	1
1469	Tio Zhi Kai	tzk123@live.com.sg	1997-08-30	0	1	one-north Apps,Electronic Direct Mailer	2017-08-18 15:41:19+00	2017-08-18 15:41:19+00	1
1470	Chan Jie Yi, Esther	estherchanjy18@gmail.com	1996-11-18	0	1	Word-of-mouth	2017-08-18 15:54:09+00	2017-08-18 15:54:09+00	1
1471	Kat Li Heng	lihengahhh@gmail.com	1993-11-25	0	1	Word-of-mouth	2017-08-18 15:55:40+00	2017-08-18 15:55:40+00	1
1472	Patricia Aw Yi Wei	patriciaawyiwei@gmai.com	1997-12-06	0	1	Word-of-mouth	2017-08-18 16:03:34+00	2017-08-18 16:03:34+00	1
1473	Jamestest2	testjames2@mailinator.com	2008-08-19	0	1	one-north Apps	2017-08-18 16:50:42+00	2017-08-18 16:50:42+00	1
1474	Jamestest2	testjames3@mailinator.com	2008-08-19	0	1	Roadshows	2017-08-18 16:51:23+00	2017-08-18 16:51:23+00	1
1596	Quek Su Ying	suyingquek@gmail.com	1978-12-21	0	1	Roadshows	2017-08-19 03:27:47+00	2017-08-19 03:27:47+00	1
1475	Testjames3	jamestest3@mailinator.com	2013-08-19	0	1	Roadshows	2017-08-18 16:52:34+00	2017-08-18 16:52:34+00	1
1476	Ronnie	ronnedez@gmail.com	1972-04-19	0	1	Social Media	2017-08-19 00:05:12+00	2017-08-19 00:05:12+00	1
1477	Joshua Chia	joshua_chia@yahoo.com.sg	1976-11-20	0	1	Word-of-mouth	2017-08-19 00:17:04+00	2017-08-19 00:17:05+00	1
1478	Testjames6	jamestest8@mailinator.com	2012-08-19	0	1	Roadshows	2017-08-19 00:41:31+00	2017-08-19 00:41:31+00	1
1479	Sabrina	sabrinaho28@gmail.com	1978-04-10	2	1	Posters	2017-08-19 00:44:30+00	2017-08-19 00:44:30+00	1
1480	patrick png	gaysoon@gmail.com	1953-01-15	0	1	Posters	2017-08-19 00:45:14+00	2017-08-19 00:45:14+00	1
1481	Anastazia Chia	jaime2276@gmail.com	2008-12-06	0	1	Social Media	2017-08-19 00:48:08+00	2017-08-19 00:49:53+00	1
1482	Aniq	lilysamirah79@hotmail.com	2008-12-12	0	1	Roadshows	2017-08-19 00:48:40+00	2017-08-19 03:14:38+00	1
1483	Ignatius Chia	ignatius2701@gmail.com	2004-01-27	0	1	Social Media	2017-08-19 00:49:02+00	2017-08-19 00:49:02+00	1
1484	Lam	yunlei11@yahoo.com	1979-11-06	0	1	Word-of-mouth	2017-08-19 00:51:21+00	2017-08-19 00:51:21+00	1
1485	Cheryl Lum	yokemuilum@yahoo.com	2008-04-28	0	1	Bus Stop Ads	2017-08-19 00:57:20+00	2017-08-19 01:01:10+00	1
1486	Chan Say Moi	ximei_chan@yahoo.com	1974-03-03	0	1	Word-of-mouth	2017-08-19 00:58:02+00	2017-08-19 00:58:02+00	1
1487	Alya Maisarah	amaisarah51@gmail.com	2004-12-09	0	1	Posters,Bus Stop Ads,Word-of-mouth	2017-08-19 01:03:15+00	2017-08-19 01:03:15+00	1
1488	THEODORUS TEDDY	theo035@yahoo.com	1980-05-05	0	1	one-north Apps	2017-08-19 01:27:46+00	2017-08-19 01:27:46+00	1
1489	Yennie kadarusman	yennie0202@yahoo.com	1980-02-02	0	1	one-north Apps	2017-08-19 01:28:57+00	2017-08-19 01:28:57+00	1
1490	Test kim tien	testtien@saloniz.com	2017-08-17	0	1	Bus Stop Ads	2017-08-19 01:35:34+00	2017-08-19 01:35:34+00	1
1491	Reuben Tham	lizarng@gmail.com	2004-04-25	0	1	Roadshows	2017-08-19 01:43:58+00	2017-08-19 01:43:58+00	1
1492	Daniel ng	howardhwng@hotmail.com	2006-04-14	0	1	Posters	2017-08-19 01:46:04+00	2017-08-19 01:48:08+00	1
1493	AMOS Kwek	amoskwek@hotmail.com	1975-12-14	0	1	Posters	2017-08-19 01:47:12+00	2017-08-19 01:49:09+00	1
1494	Ginger Ng	howardhwng@gmail.com	2009-05-20	0	1	Posters	2017-08-19 01:49:21+00	2017-08-19 01:49:21+00	1
1495	Puah Hwee Khee	hkpuah@hotmail.com	1975-10-02	0	1	Posters,Bus Stop Ads	2017-08-19 01:50:03+00	2017-08-19 01:50:03+00	1
1496	Jillian C	sgxplay@gmail.com	1980-01-01	2	1	Posters	2017-08-19 01:50:52+00	2017-08-19 01:52:13+00	1
1497	Florence Ng	florence_79@hotmail.com	1979-06-02	0	1	Word-of-mouth	2017-08-19 01:52:05+00	2017-08-19 01:52:05+00	1
1498	David Ang	torpoly@hotmail.com	1993-02-10	0	1	Roadshows	2017-08-19 02:03:02+00	2017-08-19 02:03:02+00	1
1499	Peter	chubzy_cheese@yahoo.com	1968-04-03	0	1	Roadshows	2017-08-19 02:04:29+00	2017-08-19 02:04:29+00	1
1500	Chan Jing Yi	caroles_1006@hotmail.com	1994-10-06	0	1	Social Media	2017-08-19 02:06:39+00	2017-08-19 02:06:39+00	1
1501	Jie Su	suclean@hotmail.com	1979-04-11	4	1	Roadshows	2017-08-19 02:07:55+00	2017-08-19 02:07:55+00	1
1502	Daniel	daniel.rs.choo@gmail.com	2007-03-23	0	1	Roadshows	2017-08-19 02:08:36+00	2017-08-19 02:08:36+00	1
1503	Cecilia Ling	cecilia_sept@yahoo.com	1982-09-26	4	1	Posters,Electronic Direct Mailer	2017-08-19 02:12:04+00	2017-08-19 02:12:04+00	1
1504	Donna Wong	donnawongsg@gmail.com	1971-06-29	0	1	Newspapers	2017-08-19 02:29:57+00	2017-08-19 02:29:57+00	1
1505	Brandon lim	aleepy@gmail.com	2005-10-28	0	1	Newspapers	2017-08-19 02:32:34+00	2017-08-19 02:32:34+00	1
1506	Jing Yi Chan	caroles1006@gmail.com	1994-10-06	0	1	Social Media	2017-08-19 02:33:45+00	2017-08-19 02:33:45+00	1
1507	Fan Yi	fanyipet@gmail.com	1994-04-14	0	1	Word-of-mouth	2017-08-19 02:36:28+00	2017-08-19 02:36:28+00	1
1508	Matthias kiement liew	mkliew1510@gmail.com	2009-10-15	0	1	Social Media	2017-08-19 02:39:52+00	2017-08-19 02:39:52+00	1
1509	Vanessa	vanessa_kum@yahoo.com	1978-03-18	1	1	Posters	2017-08-19 02:41:11+00	2017-08-19 02:41:11+00	1
1510	MOHAMMAD SUFFIAN BIN MOHAMMAD SAPRI	SUFFIANSAPRI@GMAIL.COM	1990-07-06	0	1	Social Media	2017-08-19 02:41:26+00	2017-08-19 02:41:26+00	1
1511	Patrick	qlfang@yahoo.com	1976-11-02	0	1	Posters	2017-08-19 02:42:59+00	2017-08-19 02:43:00+00	1
1512	Akshay salunkhe	akshayrandom511@gmail.com	2001-11-05	0	1	Roadshows	2017-08-19 02:45:31+00	2017-08-19 02:45:32+00	1
1513	Shafi	shafiblaze23@gmail.com	1995-03-23	0	1	Roadshows	2017-08-19 02:47:23+00	2017-08-19 02:47:23+00	1
1514	Paavana	paavana@happyharsha.com	2009-06-26	0	1	Posters	2017-08-19 02:51:53+00	2017-08-19 02:51:53+00	1
1515	Testjames66	twstjames66@mailinator.com	2012-08-19	0	1	Roadshows	2017-08-19 02:53:07+00	2017-08-19 02:53:07+00	1
1516	Kaoru	oikawakaoru@hotmail.com	1978-01-13	1	1	Roadshows	2017-08-19 02:53:36+00	2017-08-19 03:46:32+00	1
1517	Paul Test	paultest@saloniz.com	2003-08-19	0	1	Newspapers	2017-08-19 02:53:48+00	2017-08-19 02:53:48+00	1
1518	Ng Meng Suan	mengsuanng@gmail.com	1957-02-27	0	1	Roadshows	2017-08-19 02:54:54+00	2017-08-19 02:54:54+00	1
1519	Yuyi	ongyuyi@gmail.com	1984-02-03	0	1	Word-of-mouth	2017-08-19 02:55:49+00	2017-08-19 02:55:49+00	1
1520	Ng Ivy	ngivy6@hotmail.com	1978-09-10	7	1	Roadshows	2017-08-19 02:56:03+00	2017-08-19 02:56:03+00	1
1521	Ziqing Wong	suki_3_wong@hotmail.com	1995-03-11	0	1	Posters,Bus Stop Ads	2017-08-19 02:56:42+00	2017-08-19 02:56:42+00	1
1522	Zacharias Chia Kai Sheng	jenniwongys@gmail.com	2008-10-07	0	1	Word-of-mouth	2017-08-19 02:56:58+00	2017-08-19 02:56:58+00	1
1523	Yu ChengXing	xiongling@gmail.com	2010-05-05	0	1	Roadshows	2017-08-19 02:57:18+00	2017-08-19 02:57:18+00	1
1524	Derek Chung Hao wei	suching.new@gmail.com	2012-12-01	0	1	Posters	2017-08-19 02:57:44+00	2017-08-19 02:57:44+00	1
1525	Zhang xiaoli	xiaoli.zxl@gmail.com	1975-09-12	0	1	Roadshows	2017-08-19 02:57:48+00	2017-08-19 03:56:35+00	1
1526	yang fan	yangfanfenix@gmail.com	1980-04-28	4	1	Word-of-mouth	2017-08-19 02:57:56+00	2017-08-19 02:57:56+00	1
1527	Bandra Paavana	paavana@paavana.com	2009-06-29	0	1	one-north Apps	2017-08-19 02:58:14+00	2017-08-19 02:58:14+00	1
1528	Jeryl Tan	zorchoo@yahoo.com.sg	2011-10-30	0	1	Posters	2017-08-19 02:58:47+00	2017-08-19 02:58:47+00	1
1529	Liam hendriks	sfasseoc@hotmail.com	2012-01-25	0	1	Roadshows	2017-08-19 02:58:51+00	2017-08-19 03:00:29+00	1
1530	eva	xue_yiran@qq.com	1992-01-23	0	1	Word-of-mouth	2017-08-19 02:59:15+00	2017-08-19 02:59:15+00	1
1531	Henry	hgojr00@gmail.com	2017-08-19	7	1	Social Media	2017-08-19 02:59:16+00	2017-08-19 02:59:16+00	1
1532	Yang Yueye	bll771@126.com	2017-08-26	0	1	Social Media	2017-08-19 02:59:17+00	2017-08-19 02:59:17+00	1
1533	Khin Yuupar Htaing	htainghtaing@gmail.com	1987-08-24	7	1	Social Media	2017-08-19 02:59:43+00	2017-08-19 02:59:43+00	1
1534	Bai yunsong	sqliu@ibn.a-star.edu.sg	2005-12-16	0	1	Roadshows	2017-08-19 02:59:45+00	2017-08-19 02:59:45+00	1
1535	Annette lim	nlimm1101@gmail.com	1978-01-11	0	1	Social Media	2017-08-19 03:00:02+00	2017-08-19 03:00:02+00	1
1536	Siek Ming Jun	siekmingjun@hotmail.com	1995-07-28	0	1	Word-of-mouth	2017-08-19 03:00:40+00	2017-08-19 03:00:40+00	1
1537	Conrad	conjesslim@gmail.com	1978-12-05	2	1	Word-of-mouth	2017-08-19 03:00:50+00	2017-08-19 03:00:50+00	1
1538	Waiyen Chan	chanwaiyen9@gmail.com	1992-10-05	0	1	Posters	2017-08-19 03:01:21+00	2017-08-19 03:01:21+00	1
1539	Koh Ah Hiang	ahkoh3883@ymail.com	1964-02-06	7	1	Posters,PULSE Newsletter,Word-of-mouth	2017-08-19 03:02:21+00	2017-08-19 03:02:21+00	1
1540	Chris	yipkwailin@gmail.com.sg	1959-02-02	0	1	Roadshows	2017-08-19 03:02:43+00	2017-08-19 03:02:43+00	1
1541	Win	waterfade@gmail.com	1994-04-13	0	1	Social Media	2017-08-19 03:04:05+00	2017-08-19 03:04:05+00	1
1542	Candice Lim	candy_lim_gal@hotmail.com	1994-02-23	0	1	Word-of-mouth	2017-08-19 03:04:14+00	2017-08-19 03:04:14+00	1
1543	Jack Wong	jackwongkc@yahoo.com	1972-06-07	0	1	Roadshows	2017-08-19 03:05:36+00	2017-08-19 03:05:36+00	1
1544	SX	success8trading@gmail.com	2005-05-19	0	1	Roadshows	2017-08-19 03:06:21+00	2017-08-19 03:06:21+00	1
1545	Yap Mow Khew	nicyap@hotmail.com	1973-04-03	0	1	Word-of-mouth	2017-08-19 03:06:37+00	2017-08-19 03:06:37+00	1
1546	Huiyi	lim.huiyi@dhs.sg	1996-05-18	0	1	Posters	2017-08-19 03:06:55+00	2017-08-19 03:06:55+00	1
1547	Wong Kam Choy	wongkc@scei.a-star.edu.sg	1972-06-07	0	1	Roadshows	2017-08-19 03:07:13+00	2017-08-19 03:07:13+00	1
1548	Ayu	test@ape.com	2016-08-19	0	1	Roadshows	2017-08-19 03:07:56+00	2017-08-19 03:07:56+00	1
1549	Henry Lee Jun	babyboyhenry13@gmail.com	2000-10-13	0	1	Social Media	2017-08-19 03:09:14+00	2017-08-19 03:09:14+00	1
1550	Chun Kiat	chunkyy.lee@gmail.com	1987-05-06	0	1	Word-of-mouth	2017-08-19 03:09:19+00	2017-08-19 03:09:19+00	1
1551	Liew hui sing	liewfamily2012@gmail.com	1976-06-03	0	1	Roadshows	2017-08-19 03:09:51+00	2017-08-19 03:09:51+00	1
1552	Limpeihsien	ms.peihsien@gmail.com	1975-07-03	0	1	Roadshows	2017-08-19 03:10:24+00	2017-08-19 03:10:24+00	1
1553	Kellie Sim	kellie.sim.0101@gmail.com	2001-01-01	0	1	Word-of-mouth	2017-08-19 03:11:55+00	2017-08-19 03:11:55+00	1
1554	Lim kok meng	kmlim@ieee.org	1983-10-13	0	1	Roadshows	2017-08-19 03:12:08+00	2017-08-19 03:12:08+00	1
1555	Allen Michael Bautista Tan	allen.michael.tan@gmail.com	2001-05-03	4	1	Word-of-mouth	2017-08-19 03:12:42+00	2017-08-19 03:12:42+00	1
1556	Jeryl Tan	zoechoo@gmail.com	2011-10-30	0	1	Roadshows	2017-08-19 03:13:19+00	2017-08-19 03:13:19+00	1
1557	Nguyen Duc Huy	chienguyen82@yahoo.com	2011-09-07	2	1	Electronic Direct Mailer	2017-08-19 03:13:26+00	2017-08-19 03:13:26+00	1
1558	Farah Binte Mohd Faudzi	farah.mdfaudzi@gmail.com	2017-08-19	0	1	Word-of-mouth	2017-08-19 03:13:37+00	2017-08-19 03:13:37+00	1
1559	Wong Chuan Kai	wong.chuankai@hotmail.com	1992-12-18	0	1	Word-of-mouth	2017-08-19 03:14:49+00	2017-08-19 03:14:49+00	1
1560	Tan Cheong Huat	anopheles1972@gmail.com	1972-10-11	4	1	Roadshows	2017-08-19 03:14:57+00	2017-08-19 03:14:57+00	1
1561	Mina	minakuro@hotmail.com	2009-09-22	0	1	Social Media	2017-08-19 03:14:59+00	2017-08-19 03:14:59+00	1
1562	Richie	wongmsr@gmail.com	1988-12-29	0	1	Roadshows	2017-08-19 03:15:10+00	2017-08-19 03:15:10+00	1
1563	John Chan	john_chancs@hotmail.com	2017-09-16	0	1	Word-of-mouth	2017-08-19 03:15:14+00	2017-08-19 03:15:14+00	1
1564	Edward Chua	edwardchuajh@gmail.com	1985-10-05	0	1	Social Media	2017-08-19 03:16:42+00	2017-08-19 03:16:42+00	1
1565	Tan Peng Chong	pctan35@gmail.com	1988-07-22	2	1	Posters,Word-of-mouth	2017-08-19 03:17:22+00	2017-08-19 03:17:22+00	1
1566	Geraldine Tan	gerai3@yahoo.com.sg	2017-10-03	0	1	Roadshows	2017-08-19 03:17:59+00	2017-08-19 03:17:59+00	1
1567	Chan Ying yen	zyingz@hotmail.com	1980-01-20	0	1	Social Media	2017-08-19 03:18:00+00	2017-08-19 03:18:00+00	1
1568	Eyan	lim_eyan@yahoo.com.sg	1979-02-11	0	1	Roadshows	2017-08-19 03:18:01+00	2017-08-19 03:18:01+00	1
1569	Huitian	linhuitian@gmail.com	1985-11-21	0	1	Word-of-mouth	2017-08-19 03:18:05+00	2017-08-19 03:18:05+00	1
1570	David chan	Dc.rong@gmail.com	1982-01-20	0	1	Social Media	2017-08-19 03:18:29+00	2017-08-19 03:18:29+00	1
1571	Lee yi hao	oahiyeel@gmail.com	1985-01-07	0	1	Roadshows	2017-08-19 03:18:32+00	2017-08-19 03:18:32+00	1
1572	Sakthis Kumar	sakthis@gmail.com	1977-06-01	0	1	Posters	2017-08-19 03:20:35+00	2017-08-19 03:20:35+00	1
1573	Max	maxgan@hotmail.com	1994-04-12	0	1	Roadshows	2017-08-19 03:20:46+00	2017-08-19 03:20:46+00	1
1574	Kate Quek	qtingying@gmail.com	1990-06-28	0	1	Word-of-mouth	2017-08-19 03:20:51+00	2017-08-19 03:20:51+00	1
1575	Aiden Tan	jennlgp@yahoo.com	2008-07-30	0	1	Bus Stop Ads,one-north Apps	2017-08-19 03:21:46+00	2017-08-19 03:21:46+00	1
1576	Jessica	jess_xie@hotmail.com	1990-01-30	0	1	Roadshows	2017-08-19 03:22:04+00	2017-08-19 03:22:04+00	1
1577	Kevin Tan	caraval07@hotmail.com	1980-05-07	0	1	Social Media	2017-08-19 03:22:12+00	2017-08-19 03:22:12+00	1
1578	Patrick Chia	tricius@gmail.com	1976-07-06	2	1	Roadshows	2017-08-19 03:22:25+00	2017-08-19 03:22:25+00	1
1579	Akshay Regulagedda	akshay.regulagedda@gmail.com	1982-03-19	0	1	one-north Apps	2017-08-19 03:23:05+00	2017-08-19 03:23:05+00	1
1580	Felicia Phua	felamatic@gmail.com	1994-10-17	0	1	Word-of-mouth	2017-08-19 03:23:11+00	2017-08-19 03:23:11+00	1
1581	Ong Wern Er	werner_ong@hotmail.com	1992-07-14	8	1	Posters	2017-08-19 03:23:16+00	2017-08-19 03:23:16+00	1
1582	Tan Jie Ling	tanjieling94@gmail.com	1994-10-18	0	1	Word-of-mouth	2017-08-19 03:23:31+00	2017-08-19 03:23:31+00	1
1583	Hillary Yap	hillary_yap426@hotmail.com	1991-04-26	8	1	Posters	2017-08-19 03:23:36+00	2017-08-19 03:23:36+00	1
1584	Koh Hwee fong	kohhweefong@yahoo.com.sg	1976-02-21	0	1	Roadshows	2017-08-19 03:23:50+00	2017-08-19 03:23:50+00	1
1585	Tony Ooi	hearty_98@yahoo.com	1969-12-30	0	1	Roadshows	2017-08-19 03:24:16+00	2017-08-19 03:24:16+00	1
1586	Yeo Ling Yong	lingyong88@gmail.com	1991-08-08	0	1	one-north Apps	2017-08-19 03:24:24+00	2017-08-19 03:24:24+00	1
1587	NAGARAJAN RATHA	nagarajan1014@hotmail.com	1991-11-02	0	1	Roadshows	2017-08-19 03:24:53+00	2017-08-19 03:24:53+00	1
1588	Tan Choon Huay	sweety92choonhuay@hotmail.com	1992-01-08	0	1	Bus Stop Ads	2017-08-19 03:25:31+00	2017-08-19 03:25:31+00	1
1589	Woan Ling Tang	onezero.tang@gmail.com	1984-12-27	0	1	Word-of-mouth	2017-08-19 03:26:43+00	2017-08-19 03:26:43+00	1
1590	Sebastian Jude Koh	sebastianjudekoh@gmail.com	1992-04-18	0	1	Social Media	2017-08-19 03:26:47+00	2017-08-19 03:26:47+00	1
1591	Shawn lam	shawnlam91@gmail.com	1991-07-10	0	1	Electronic Direct Mailer	2017-08-19 03:26:52+00	2017-08-19 03:26:52+00	1
1592	vic	vcitrocehn@hotmail.com	1989-12-15	0	1	Social Media	2017-08-19 03:27:06+00	2017-08-19 03:27:06+00	1
1593	Sanjeev Gupta	ghane0@gmail.com	1968-10-27	0	1	Word-of-mouth	2017-08-19 03:27:19+00	2017-08-19 04:11:06+00	1
1594	Jasmine	jasmineangjiemin@gmail.com	1989-08-29	0	1	Word-of-mouth	2017-08-19 03:27:23+00	2017-08-19 03:27:23+00	1
1595	Chilukuri ARNAV karthik	ccst74@gmail.com	2017-08-19	0	1	Social Media	2017-08-19 03:27:43+00	2017-08-19 03:27:43+00	1
1597	TeckXian	ungteckxian9@gmail.com	2017-08-19	0	1	Word-of-mouth	2017-08-19 03:28:03+00	2017-08-19 03:28:03+00	1
1598	Jia Li	jiali08@hotmail.com	1991-02-08	0	1	PULSE Newsletter,Word-of-mouth	2017-08-19 03:28:39+00	2017-08-19 03:28:39+00	1
1599	Chen Xiaokang	xiao.kang@live.com.sg	1993-10-05	0	1	Word-of-mouth	2017-08-19 03:29:21+00	2017-08-19 03:29:21+00	1
1600	Gavin Teo	forgaving@gmail.com	1984-09-10	0	1	Word-of-mouth	2017-08-19 03:29:26+00	2017-08-19 03:29:26+00	1
1601	Chow Mun Leong	chowmunleong@yahoo.com.sg	1972-07-30	0	1	Roadshows	2017-08-19 03:29:32+00	2017-08-19 03:29:33+00	1
1602	Liu Daisi	ccliuc@gmail.com	2014-10-14	0	1	Roadshows	2017-08-19 03:29:37+00	2017-08-19 03:29:37+00	1
1603	oke ai fern	steph_7377@yahoo.com.sg	1977-01-22	8	1	Roadshows	2017-08-19 03:30:06+00	2017-08-19 03:30:06+00	1
1604	Reza	shafiblaze@gmail.com	1995-03-23	0	1	Roadshows	2017-08-19 03:30:22+00	2017-08-19 03:30:22+00	1
1605	Ian	iantao95@yahoo.com.sg	1970-06-25	0	1	Social Media	2017-08-19 03:31:07+00	2017-08-19 03:31:07+00	1
1606	Rong En	foorongen@yahoo.com.sg	1994-09-11	0	1	Word-of-mouth	2017-08-19 03:31:21+00	2017-08-19 03:31:21+00	1
1607	Ho Kok Tee	gofish@singnet.com.sg	1974-01-28	2	1	Roadshows	2017-08-19 03:31:50+00	2017-08-19 03:31:50+00	1
1608	Yong Jia Yang	yjiayang8891@gmail.com	1991-08-08	0	1	PULSE Newsletter,Word-of-mouth	2017-08-19 03:31:59+00	2017-08-19 03:31:59+00	1
1609	James Cheang	cheang.james@gmail.com	1992-04-03	0	1	Word-of-mouth	2017-08-19 03:32:29+00	2017-08-19 03:32:29+00	1
1610	Wei hern	songweihern@gmail.com	1989-12-23	0	1	Word-of-mouth	2017-08-19 03:32:37+00	2017-08-19 03:32:37+00	1
1611	simon lee	khy582011@gmail.com	1963-03-28	0	1	Newspapers	2017-08-19 03:33:04+00	2017-08-19 03:34:30+00	1
1612	David Lee	leeyeowchor@gmail.com	1969-08-26	0	1	Social Media	2017-08-19 03:33:17+00	2017-08-19 03:33:17+00	1
1613	John forsyth	toponotcho@hotmail.com	1971-07-16	0	1	Newspapers	2017-08-19 03:33:20+00	2017-08-19 03:33:20+00	1
1614	Wang hai ru	908952162@qq.com	1971-08-19	0	1	Roadshows	2017-08-19 03:33:56+00	2017-08-19 03:33:56+00	1
1615	Chong Shun Xun	shunxun1811@gmail.com	1999-11-18	0	1	Word-of-mouth	2017-08-19 03:34:15+00	2017-08-19 03:34:15+00	1
1616	Nicholas	nicholasmv9@gmail.com	1971-01-08	0	1	Roadshows	2017-08-19 03:34:59+00	2017-08-19 03:34:59+00	1
1617	Kath Lim	kathlim94@gmail.com	1994-07-01	0	1	Word-of-mouth	2017-08-19 03:35:06+00	2017-08-19 03:35:06+00	1
1618	Pravin Nagarajah	watdoisay@gmail.com	1984-03-24	0	1	Word-of-mouth	2017-08-19 03:36:00+00	2017-08-19 03:36:00+00	1
1619	Tung Jia Ray	tungjiaray@2008gmail.com	2008-06-28	0	1	Posters,Bus Stop Ads,Electronic Direct Mailer	2017-08-19 03:36:17+00	2017-08-19 03:36:17+00	1
1620	Tay Kai Feng	cytayaq@yahoo.com	2014-08-01	0	1	Social Media	2017-08-19 03:36:28+00	2017-08-19 03:36:28+00	1
1621	Francesca Yee	francyee@gmail.com	1974-04-01	0	1	Word-of-mouth	2017-08-19 03:36:41+00	2017-08-19 03:36:41+00	1
1622	Siti	leenhayer@gmail.com	1986-10-16	0	1	Social Media	2017-08-19 03:36:42+00	2017-08-19 03:36:42+00	1
1623	Seow Ho yin	eunicemv9@gmail.com	1968-12-03	0	1	Roadshows	2017-08-19 03:38:20+00	2017-08-19 03:38:20+00	1
1624	gaurav saini	thelama13@yahoo.com	1969-08-13	4	1	Posters	2017-08-19 03:38:34+00	2017-08-19 03:38:34+00	1
1625	Felix Forbes Dimjati	Jennyfrans@gmail.com	2008-06-26	0	1	Posters	2017-08-19 03:38:58+00	2017-08-19 03:38:58+00	1
1626	Samantha	heshe614@gmail.com	1992-12-12	0	1	Word-of-mouth	2017-08-19 03:39:54+00	2017-08-19 03:39:54+00	1
1627	Chew Ming yong	jensonchew@gmail.com	1980-03-19	0	1	Roadshows	2017-08-19 03:40:15+00	2017-08-19 03:40:15+00	1
1628	Petrus Eka Dimjati	indrajit.dimyati@gmail.com	1970-12-12	0	1	Posters	2017-08-19 03:40:29+00	2017-08-19 03:40:29+00	1
1629	Wei Shing	leeweishing@hotmail.com	1990-08-15	0	1	Word-of-mouth	2017-08-19 03:41:09+00	2017-08-19 03:41:09+00	1
1630	Jorin	jorinngwt@gmail.com	1994-08-19	0	1	Posters,Word-of-mouth	2017-08-19 03:41:26+00	2017-08-19 03:41:26+00	1
1631	Max Low	sginaus@yahoo.com	1970-07-31	0	1	Roadshows	2017-08-19 03:42:02+00	2017-08-19 03:42:02+00	1
1632	Lim Yee Siang	limyeesiang@gmail.com	1992-05-06	0	1	Word-of-mouth	2017-08-19 03:42:03+00	2017-08-19 03:42:03+00	1
1633	Jessica Kim	jjeounga@gmail.com	2009-08-26	0	1	Word-of-mouth	2017-08-19 03:42:40+00	2017-08-19 03:43:55+00	1
1634	Yong Jian	munyongjian@gmail.com	1990-10-04	0	1	Roadshows	2017-08-19 03:42:46+00	2017-08-19 03:45:08+00	1
1635	Aliif	imaliif95@gmail.com	1995-06-20	0	1	Roadshows	2017-08-19 03:42:57+00	2017-08-19 03:42:57+00	1
1636	Syed Mustaffa	Syed_Mustaffa_Kamaldin_din@ite.edu.sg	1954-12-30	0	1	Social Media	2017-08-19 03:43:01+00	2017-08-19 03:43:01+00	1
1637	Dzahir	dzahir1988@gmail.com	1988-10-28	0	1	Word-of-mouth	2017-08-19 03:43:44+00	2017-08-19 03:43:44+00	1
1638	Daria Fu	dariafu@gmail.com	2017-08-19	0	1	Word-of-mouth	2017-08-19 03:44:23+00	2017-08-19 03:44:23+00	1
1639	Steven sunaryo	me.sunaryo@gmail.com	1989-09-13	0	1	Word-of-mouth	2017-08-19 03:47:00+00	2017-08-19 03:47:00+00	1
1640	Eric Brillett	eric@ekkko.com	1970-01-01	0	1	Roadshows	2017-08-19 03:48:55+00	2017-08-19 08:17:49+00	1
1641	Jon	daze07@singnet.com.sg	1985-08-02	0	1	Roadshows	2017-08-19 03:52:09+00	2017-08-19 03:52:09+00	1
1642	Qi Zhen	ang_qi_zhen@jtc.gov.sg	1989-04-24	0	1	Social Media	2017-08-19 03:53:53+00	2017-08-19 03:53:53+00	1
1643	ko ko linn	kklinn16@gmail.com	1984-07-16	0	1	Word-of-mouth	2017-08-19 03:55:12+00	2017-08-19 03:55:12+00	1
1644	Tricia Ang	cushion.star@gmail.com	1977-09-16	0	1	Electronic Direct Mailer,Word-of-mouth	2017-08-19 03:57:03+00	2017-08-19 03:57:03+00	1
1645	Zhou zhuoheng	zhouzhuoheng@gmail.com	2017-08-19	0	1	Bus Stop Ads	2017-08-19 03:57:25+00	2017-08-19 03:57:25+00	1
1646	Kenneth lim	bladejazz@hotmail.com	1977-10-18	0	1	Word-of-mouth	2017-08-19 03:57:49+00	2017-08-19 03:57:49+00	1
1647	Wilson pang	wilson.fws@gmail.com	1980-03-22	2	1	one-north Apps,Word-of-mouth	2017-08-19 03:58:06+00	2017-08-19 03:58:06+00	1
1648	Derrick Tan	tankahjoon@gmail.com	1977-01-28	0	1	Roadshows	2017-08-19 03:58:45+00	2017-08-19 03:58:45+00	1
1649	Garima	garima.pathania@gmail.com	1977-10-16	0	1	Electronic Direct Mailer	2017-08-19 03:59:47+00	2017-08-19 03:59:47+00	1
1650	Xavier	jpxav15@gmail.com	1965-10-15	7	1	Posters,Word-of-mouth	2017-08-19 04:01:13+00	2017-08-19 04:01:13+00	1
1651	Bryan chai	edmundchai6@hotmail.com	2006-02-20	0	1	Word-of-mouth	2017-08-19 04:01:17+00	2017-08-19 05:24:01+00	1
1652	Bai lili	lili.bai8989@gmail.com	2017-11-17	0	1	Roadshows	2017-08-19 04:01:30+00	2017-08-19 04:01:30+00	1
1653	Sheryl Zeng	sheryl_zeng@hotmail.com	1993-12-17	0	1	Word-of-mouth	2017-08-19 04:03:22+00	2017-08-19 04:03:22+00	1
1654	You zaiqun	yuzaiqun@gmail.com	1970-04-09	0	1	Roadshows	2017-08-19 04:04:00+00	2017-08-19 04:04:00+00	1
1655	Max Chen	liren98@hotmail.com	1988-12-11	0	1	Posters	2017-08-19 04:05:57+00	2017-08-19 04:05:57+00	1
1656	Heng eulian	hengeulian@yahoo.com.sg	1947-03-11	0	1	Roadshows	2017-08-19 04:06:18+00	2017-08-19 04:06:18+00	1
1657	Chin Chew lin	jdcwt@yahoo.com.sg	1975-07-21	0	1	Roadshows	2017-08-19 04:06:46+00	2017-08-19 04:06:46+00	1
1658	Jiang Cheng	kakafansia@hotmail.com	1990-09-05	0	1	Word-of-mouth	2017-08-19 04:07:24+00	2017-08-19 04:07:24+00	1
1659	Melissa	frienz_jyyv@hotmail.com	1994-08-01	0	1	Word-of-mouth	2017-08-19 04:07:28+00	2017-08-19 04:07:28+00	1
1660	Chong Tuck Wen	chongedwin@hotmail.com	1989-02-10	0	1	Word-of-mouth	2017-08-19 04:07:54+00	2017-08-19 04:07:54+00	1
1661	Cheong Weng thye	adcwt@yahoo.com	1967-03-15	0	1	Roadshows	2017-08-19 04:07:54+00	2017-08-19 04:07:54+00	1
1662	Keng tong	wkengtong@yahoo.com	1982-06-25	0	1	Roadshows	2017-08-19 04:08:23+00	2017-08-19 04:08:23+00	1
1663	Elaine khoo	elaineksy@gmail.com	1982-08-18	0	1	Word-of-mouth	2017-08-19 04:08:46+00	2017-08-19 04:08:46+00	1
1664	Jinwei	jinwei1995@gmail.com	1995-01-29	0	1	Roadshows	2017-08-19 04:09:26+00	2017-08-19 04:09:26+00	1
1665	Brian Slattery	slattery_18@hotmail.com	1977-03-02	2	1	Word-of-mouth	2017-08-19 04:10:00+00	2017-08-19 04:10:00+00	1
1666	Lee Pan Liang	leepl555@gmail.com	1994-01-19	0	1	Bus Stop Ads	2017-08-19 04:10:08+00	2017-08-19 04:10:08+00	1
1667	Terrence	c110057@e.ntu.edu.sg	1993-01-14	2	1	Roadshows	2017-08-19 04:10:46+00	2017-08-19 04:10:46+00	1
1668	Wong Shu Xin	sheilawongng@yahoo.com	2006-01-26	0	1	Roadshows	2017-08-19 04:11:35+00	2017-08-19 04:12:38+00	1
1669	Roy Zheng	yor.gnehz@gmail.com	1992-06-11	0	1	Posters,Word-of-mouth	2017-08-19 04:11:49+00	2017-08-19 04:11:49+00	1
1670	Clara Tan	clara.twq@gmail.com	1996-02-20	0	1	Social Media	2017-08-19 04:12:31+00	2017-08-19 04:12:31+00	1
1671	Jens Moller	moller.jens@gmail.com	2017-08-19	4	1	Word-of-mouth	2017-08-19 04:12:32+00	2017-08-19 04:12:32+00	1
1672	Wong Shu Xin	sheilawongng@gmail.com	2006-02-26	0	1	Roadshows	2017-08-19 04:13:27+00	2017-08-19 04:13:27+00	1
1673	Chris  Woldemar	chris.woldemar@seagate.com	1966-07-05	7	1	Word-of-mouth	2017-08-19 04:13:35+00	2017-08-19 04:13:35+00	1
1674	Phoebe	phoebe.kleer@gmail.com	2005-06-21	0	1	Roadshows	2017-08-19 04:14:30+00	2017-08-19 04:14:30+00	1
1675	Hailey ava	ronald.kleer@gmail.com	2007-01-13	0	1	Word-of-mouth	2017-08-19 04:15:05+00	2017-08-19 04:15:05+00	1
1676	Toh Han Pin	tohhanpin@yahoo.com	1977-08-15	4	1	Word-of-mouth	2017-08-19 04:16:03+00	2017-08-19 04:16:03+00	1
1677	David Cheah	donut58@ymail.com	1970-10-05	0	1	Social Media	2017-08-19 04:16:11+00	2017-08-19 04:16:11+00	1
1678	David teo	daveteo@gmail.com	1980-06-09	0	1	Newspapers	2017-08-19 04:16:42+00	2017-08-19 04:16:42+00	1
1679	Kumaravel Thashvin	nalskumae@yahoo.com	2008-03-05	0	1	Roadshows	2017-08-19 04:16:47+00	2017-08-19 04:16:47+00	1
1680	Nalini	nalskumar@yahoo.com	1979-06-17	0	1	Roadshows	2017-08-19 04:17:51+00	2017-08-19 04:17:51+00	1
1681	Lee Jia Ying	dolphinchia06@hotmail.com	1994-02-04	0	1	Word-of-mouth	2017-08-19 04:19:21+00	2017-08-19 04:19:21+00	1
1682	Jane Seah	Seahjane@yahoo.com	1980-10-15	0	1	Word-of-mouth	2017-08-19 04:19:32+00	2017-08-19 04:19:32+00	1
1683	Shermaine	shermaine_wong@jtc.gov.sg	1992-09-25	0	1	Word-of-mouth	2017-08-19 04:19:38+00	2017-08-19 04:19:38+00	1
1684	Sara	murochi23@gmail.com	2017-08-19	0	1	Roadshows	2017-08-19 04:20:49+00	2017-08-19 04:20:49+00	1
1685	Roshan	balaselvanaya@hotmail.com	2016-02-19	0	1	Newspapers	2017-08-19 04:20:56+00	2017-08-19 04:20:56+00	1
1686	siddharth	shiva1973@yahoo.com	2017-08-19	0	1	Roadshows	2017-08-19 04:20:57+00	2017-08-19 04:22:47+00	1
1687	shrruti	manju_vr@ymail.com	2006-05-19	0	1	Social Media	2017-08-19 04:21:28+00	2017-08-19 04:24:09+00	1
1688	Rina Nishimuro	muro24mobile@gmail.com	2011-11-14	0	1	Social Media	2017-08-19 04:22:22+00	2017-08-19 04:22:22+00	1
1689	Cheryl	cherylsqseet@gmail.com	1994-02-11	0	1	Word-of-mouth	2017-08-19 04:22:54+00	2017-08-19 04:22:54+00	1
1690	Tay yoke gee	yg128@hotmail.com	1985-10-13	0	1	Social Media	2017-08-19 04:23:31+00	2017-08-19 04:23:31+00	1
1691	Meng Kiat	mengkiat94@hotmail.com	1994-01-30	0	1	Word-of-mouth	2017-08-19 04:25:05+00	2017-08-19 04:25:05+00	1
1692	Janson. Seow	janson@watsonep.com.sg	2017-06-24	0	1	Roadshows	2017-08-19 04:25:27+00	2017-08-19 04:25:27+00	1
1693	Thao	teck_thuc@yahoo.com	2003-06-23	0	1	Roadshows	2017-08-19 04:25:43+00	2017-08-19 04:25:43+00	1
1694	Priscilla Sim	theresgrieve@gmail.com	1985-02-26	0	1	Posters	2017-08-19 04:27:14+00	2017-08-19 04:27:14+00	1
1695	linus	linushoon@gmail.com	2005-07-05	0	1	Roadshows	2017-08-19 04:28:58+00	2017-08-19 04:28:58+00	1
1696	william tee	williamtee80@hotmail.com	1980-06-21	7	1	Word-of-mouth	2017-08-19 04:31:26+00	2017-08-19 04:31:26+00	1
1697	Arvin Lleva	arvin.0411@gmail.com	1972-04-11	0	1	Word-of-mouth	2017-08-19 04:31:54+00	2017-08-19 04:31:54+00	1
1698	Richard Marquez	richard.T.Marquez@seagate.com	1976-10-29	7	1	Social Media	2017-08-19 04:31:58+00	2017-08-19 04:31:58+00	1
1699	Ng Kang Raye	kangraye.ng@gmail.com	1994-08-30	0	1	Social Media	2017-08-19 04:32:11+00	2017-08-19 04:32:11+00	1
1700	Nathaniel yambao	thaniel_911@yahoo.com	1987-09-11	7	1	Social Media	2017-08-19 04:33:18+00	2017-08-19 04:33:18+00	1
1701	paul Lim	paullim.esq@gmail.com	1988-07-04	2	1	Roadshows	2017-08-19 04:33:39+00	2017-08-19 04:33:39+00	1
1702	Crystal Moh	crystal_mohcj@hotmail.com	1994-04-12	0	1	Word-of-mouth	2017-08-19 04:34:26+00	2017-08-19 04:34:26+00	1
1703	Chu Yiu Tak	chuyiutak@gmail.com	1987-01-01	0	1	Word-of-mouth	2017-08-19 04:34:39+00	2017-08-19 04:34:39+00	1
1704	Ian	sheyen@gmail.com	2011-01-04	0	1	Roadshows	2017-08-19 04:35:31+00	2017-08-19 04:35:31+00	1
1705	Magdalene	fruitips@gmail.com	1988-06-25	0	1	Word-of-mouth	2017-08-19 04:35:31+00	2017-08-19 04:35:31+00	1
1706	Quek wu suan	greennurd@gmail.com	1990-01-06	0	1	Social Media	2017-08-19 04:35:52+00	2017-08-19 04:35:52+00	1
1707	Theo	hukamalinggajaya@lfasia.com	2009-08-25	0	1	Roadshows	2017-08-19 04:36:24+00	2017-08-19 04:36:24+00	1
1708	Roland Ong	tzekwang@gmail.com	1988-11-21	0	1	Word-of-mouth	2017-08-19 04:38:02+00	2017-08-19 04:38:02+00	1
1709	Kiew Su Yun	suyunkiew@gmail.com	1992-06-07	0	1	Word-of-mouth	2017-08-19 04:38:23+00	2017-08-19 04:38:23+00	1
1710	florence wee	smackeu26@hotmail.com	1989-08-26	0	1	Word-of-mouth	2017-08-19 04:39:07+00	2017-08-19 04:39:07+00	1
1711	Anthony Ho	yvonnekong.SQ@yahoo.com	1979-12-07	0	1	Roadshows	2017-08-19 04:39:08+00	2017-08-19 04:39:08+00	1
1712	Sean Foo	seanfss@yahoo.com	1972-09-21	0	1	Bus Stop Ads	2017-08-19 04:39:09+00	2017-08-19 04:39:09+00	1
1713	jessie law	lawszelong@gmail.com	1993-08-10	0	1	Roadshows	2017-08-19 04:43:24+00	2017-08-19 04:43:24+00	1
1714	jessie law	lawszelong@gmail.com	1993-08-10	0	1	Roadshows	2017-08-19 04:43:24+00	2017-08-19 04:43:24+00	1
1715	Daniel Anojan	adanojan1@gmail.com	1994-07-18	0	1	Roadshows	2017-08-19 04:44:30+00	2017-08-19 04:44:30+00	1
1716	NATHAN	mohomedathif@ymail.com	1994-03-28	0	1	Bus Stop Ads,one-north Apps	2017-08-19 04:44:43+00	2017-08-19 09:14:47+00	1
1717	Angeline tang	jeanihtang@gmail.com	1975-10-19	0	1	Social Media	2017-08-19 04:45:19+00	2017-08-19 04:45:19+00	1
1718	Jj liew	jengjiunliew@gmail.com	1973-09-05	0	1	Word-of-mouth	2017-08-19 04:48:53+00	2017-08-19 04:48:53+00	1
1719	Naomi Woldemar	naomi.tuesday@gmail.com	1969-09-14	0	1	Roadshows	2017-08-19 04:49:38+00	2017-08-19 04:49:38+00	1
1720	Ng alice	Wonderland83@gmail.com	1983-06-11	0	1	Roadshows	2017-08-19 04:51:26+00	2017-08-19 04:51:26+00	1
1721	Haiyuan	limhaiyuan16@gmail.com	2000-09-04	0	1	Roadshows	2017-08-19 04:52:25+00	2017-08-19 04:52:25+00	1
1722	Lee Mei yee	khinyuuparhtaing@yahoo.com	1980-03-15	7	1	Social Media	2017-08-19 04:53:34+00	2017-08-19 04:53:34+00	1
1723	Phang kin lap	iohnnyphangkl@gmail.com	1958-09-24	0	1	Roadshows	2017-08-19 04:53:48+00	2017-08-19 04:53:48+00	1
1724	George lam	georgelamkt@gmail.com	1973-12-05	0	1	Social Media	2017-08-19 04:54:02+00	2017-08-19 04:54:02+00	1
1725	Tee chiew fei	khinyuupar.htaing@seagate.com	1981-12-12	7	1	Social Media	2017-08-19 04:54:13+00	2017-08-19 04:54:13+00	1
1726	Ernest	Ernest.ong86@gmail.com	1986-12-02	8	1	Roadshows	2017-08-19 04:54:44+00	2017-08-19 04:54:44+00	1
1727	Mikail Lo	lo.mikail@gmail.com	1985-05-14	7	1	Roadshows	2017-08-19 04:55:29+00	2017-08-19 04:55:29+00	1
1728	Robyn Lee	robynleew@gmail.com	1997-11-23	8	1	Word-of-mouth	2017-08-19 04:56:06+00	2017-08-19 04:56:06+00	1
1729	Kathlyn	katleew@gmail.com	1997-11-23	8	1	Roadshows	2017-08-19 04:56:27+00	2017-08-19 04:56:27+00	1
1730	Michelle	lilmonsterling@gmail.com	1989-06-19	8	1	PULSE Newsletter	2017-08-19 04:57:03+00	2017-08-19 04:57:03+00	1
1731	Malcolm	malcolm.z.chua@gmail.com	1981-04-09	7	1	Word-of-mouth	2017-08-19 04:57:09+00	2017-08-19 04:57:09+00	1
1732	Kevin Teo	teosc@hermes-epitek.com.sg	1971-08-24	0	1	Roadshows	2017-08-19 04:57:14+00	2017-08-19 04:57:14+00	1
1733	gao yu	yugao1147@gmail.com	1989-01-06	0	1	Roadshows	2017-08-19 04:57:16+00	2017-08-19 04:57:16+00	1
1734	sanghamitra	sanghamitra.d@aesculape.com	1982-12-20	0	1	Roadshows	2017-08-19 04:57:30+00	2017-08-19 04:57:30+00	1
1735	Tsaipeiju	tsaipj@singnet.com.sg	1973-12-11	0	1	Roadshows	2017-08-19 04:59:00+00	2017-08-19 04:59:00+00	1
1736	Ng eu khim	leongmichelle@stengg.com	1976-08-14	0	1	Roadshows	2017-08-19 04:59:04+00	2017-08-19 04:59:04+00	1
1737	Chen weiyu	chenweiyu89@gmail.com	1989-11-04	8	1	Posters	2017-08-19 04:59:10+00	2017-08-19 04:59:10+00	1
1738	Peter Tay	taypeter@stengg.com	1973-05-03	8	1	Roadshows	2017-08-19 05:00:15+00	2017-08-19 05:00:15+00	1
1739	Su Bhanti	sbhanti@yahoo.com	1981-08-11	0	1	Roadshows	2017-08-19 05:00:28+00	2017-08-19 05:00:29+00	1
1740	Arthur	arthurleeph07@yahoo.com.sg	1995-07-12	0	1	Word-of-mouth	2017-08-19 05:03:02+00	2017-08-19 05:03:02+00	1
1741	Joseph lau	joseph.ht.lau@seagate.com	1966-07-11	7	1	Roadshows	2017-08-19 05:04:02+00	2017-08-19 05:04:02+00	1
1742	Tan Yan Ru	yanru.yr@gmail.com	1992-07-28	0	1	Social Media	2017-08-19 05:04:47+00	2017-08-19 05:04:47+00	1
1743	Tan juat kheng	tjk5113@gmail.com	1953-09-28	0	1	Roadshows	2017-08-19 05:05:26+00	2017-08-19 05:05:26+00	1
1744	Yu Xia	xyu@simtech.a-star.edu.sg	1980-12-05	0	1	Roadshows	2017-08-19 05:06:16+00	2017-08-19 05:06:16+00	1
1745	Gilbert cher	gilbert25252@hotmail.com	2017-08-19	0	1	Posters,Word-of-mouth	2017-08-19 05:06:56+00	2017-08-19 05:06:56+00	1
1746	Li fuyun	luciusli@gmail.com	1981-09-04	8	1	Social Media	2017-08-19 05:07:35+00	2017-08-19 05:07:35+00	1
1747	Alan Lee	lee_skyhigh@yahoo.com	2015-03-12	0	1	Roadshows	2017-08-19 05:10:54+00	2017-08-19 05:10:54+00	1
1748	wang nan	gaoy0029@ntu.edu.sg	1989-01-06	0	1	Roadshows	2017-08-19 05:12:11+00	2017-08-19 05:12:11+00	1
1749	Zhizhu Zhou	hilarymangostreet@126.com	1990-08-15	0	1	Posters	2017-08-19 05:12:19+00	2017-08-19 05:12:19+00	1
1750	Nina	cheongnina@hotmail.com	1991-07-22	0	1	Electronic Direct Mailer	2017-08-19 05:13:34+00	2017-08-19 05:13:34+00	1
1751	A jay Bachina	ajayb36@gmail.com	1975-06-09	0	1	Word-of-mouth	2017-08-19 05:14:58+00	2017-08-19 05:14:58+00	1
1752	Chen Qing	Chenqing_Lin@hotmail.com	1991-08-19	0	1	Bus Stop Ads,one-north Apps	2017-08-19 05:16:31+00	2017-08-19 05:16:31+00	1
1753	Tan Xin yi	xinyi98@gmail.com	1991-08-29	0	1	Roadshows	2017-08-19 05:17:02+00	2017-08-19 05:17:03+00	1
1754	Minyi Leng	minyileng@126.com	1992-07-03	0	1	Social Media	2017-08-19 05:17:52+00	2017-08-19 05:17:52+00	1
1755	Chen Yizhu	304662068@qq.com	2017-08-19	0	1	Roadshows	2017-08-19 05:18:55+00	2017-08-19 05:18:55+00	1
1756	FHOEBE Chan	fhoebe@gmail.com	1983-07-16	0	1	Roadshows	2017-08-19 05:19:15+00	2017-08-19 05:19:15+00	1
1757	Vivien	viviencky@gmail.com	1988-02-20	0	1	Posters,Word-of-mouth	2017-08-19 05:19:23+00	2017-08-19 05:19:23+00	1
1758	Tan Boon Hui	erictan@cloudz.net	1973-10-02	0	1	Newspapers	2017-08-19 05:19:30+00	2017-08-19 05:19:30+00	1
1759	Sandeep	sandeep.thakkar@gmail.com	1979-09-06	8	1	Bus Stop Ads	2017-08-19 05:19:41+00	2017-08-19 05:19:41+00	1
1760	Gourami dalapati	dalapatig@imre.a-star.edu.sg	1976-11-05	0	1	Roadshows	2017-08-19 05:19:42+00	2017-08-19 05:19:42+00	1
1761	Tan kai zee	pmk@cloudz.net	2005-12-06	0	1	Roadshows	2017-08-19 05:20:04+00	2017-08-19 05:21:58+00	1
1762	Liu Qiu	imaxgreen@hotmail.com	1990-10-10	0	1	Roadshows	2017-08-19 05:20:17+00	2017-08-19 05:20:17+00	1
1763	Eric Chen	ericchhen@163.com	1988-04-26	0	1	Social Media	2017-08-19 05:20:27+00	2017-08-19 05:20:27+00	1
1764	Yong	yongbin88@gmail.com	1988-08-09	0	1	Word-of-mouth	2017-08-19 05:20:31+00	2017-08-19 05:20:32+00	1
1765	Derek Smith	johnnypainter@gmail.com	1974-06-01	4	1	Roadshows	2017-08-19 05:21:05+00	2017-08-19 05:21:05+00	1
1766	Tan Yang Yee	yangyee@cloudz.net	2004-10-03	0	1	Newspapers	2017-08-19 05:21:45+00	2017-08-19 05:21:45+00	1
1767	Andy Tian	andytian77@hotmail.com	2010-03-19	0	1	Word-of-mouth	2017-08-19 05:24:10+00	2017-08-19 05:24:10+00	1
1768	Zoraw	djrxhj@ydgku.com	2000-08-19	0	1	Roadshows	2017-08-19 05:32:03+00	2017-08-19 05:32:03+00	1
1769	hella	477943339@qq.com	1989-08-19	0	1	Electronic Direct Mailer	2017-08-19 05:41:42+00	2017-08-19 05:41:42+00	1
1770	shirly Lim	imrr@foxmail.com	1995-04-19	1	1	Bus Stop Ads,one-north Apps,PULSE Newsletter	2017-08-19 05:43:48+00	2017-08-19 05:43:48+00	1
1771	Amy Tharnpipitchai	amikainsg@gmail.com	1985-10-21	2	1	Word-of-mouth	2017-08-19 05:44:53+00	2017-08-19 05:44:53+00	1
1772	Katie Yong	katie9021@gmail.com	1994-01-25	0	1	Word-of-mouth	2017-08-19 05:47:04+00	2017-08-19 05:47:04+00	1
1773	Cheewai lum	cheewai.lum@gmail.com	1970-03-16	7	1	Social Media	2017-08-19 05:48:53+00	2017-08-19 05:48:53+00	1
1774	Kenny choo	kenny.choo@seagate.com	1980-08-14	7	1	Roadshows	2017-08-19 05:49:17+00	2017-08-19 05:49:17+00	1
1775	TAKAHISA	shiratori.takahisa13@gmail.com	1978-01-13	1	1	Roadshows	2017-08-19 05:53:20+00	2017-08-19 05:53:20+00	1
1776	JONATHAN TSANG	JONTSANG1994@GMAIL.COM	1994-10-26	0	1	Posters,PULSE Newsletter,Word-of-mouth	2017-08-19 05:59:40+00	2017-08-19 05:59:40+00	1
1777	ZORA CHOOI	ZEE-CH@HOTMAIL.COM	1996-06-18	0	1	Posters,Bus Stop Ads,Electronic Direct Mailer,Word-of-mouth	2017-08-19 06:00:44+00	2017-08-19 06:00:44+00	1
1778	LOW YING LIANG	YINGLIANG_@HOTMAIL.COM	1994-01-15	0	1	Posters	2017-08-19 06:01:44+00	2017-08-19 06:01:44+00	1
1779	Charlotte Lim	charlottelimlt@yahoo.com.sg	2002-02-18	0	1	Roadshows	2017-08-19 06:10:08+00	2017-08-19 06:10:08+00	1
1780	THOMAS LOW	TLOWEC@GMAIL.COM	1972-10-13	1	1	Social Media	2017-08-19 06:10:10+00	2017-08-19 06:10:10+00	1
1781	TAN NICHOLAS	NICKOTEEN@HOTMAIL.COM	1969-07-14	0	1	Social Media	2017-08-19 06:12:02+00	2017-08-19 06:12:03+00	1
1782	MAX WONG	chanyuew@yahoo.com	1970-06-24	0	1	Roadshows	2017-08-19 06:14:26+00	2017-08-19 06:14:26+00	1
1783	oliver tan	olivertanhk@gmail.com	1971-01-13	0	1	Word-of-mouth	2017-08-19 06:17:35+00	2017-08-19 06:17:35+00	1
1784	Terence Cheng	Cheng.ck.terence@gmail.com	2010-11-18	7	1	Social Media	2017-08-19 06:19:28+00	2017-08-19 06:19:28+00	1
1785	kee teng min	keetengmin@gmail.com	2002-10-18	0	1	Bus Stop Ads	2017-08-19 06:21:44+00	2017-08-19 06:21:44+00	1
1786	Daniel chng	raz.chng@gmail.com	1976-05-27	0	1	Roadshows	2017-08-19 06:22:42+00	2017-08-19 06:22:42+00	1
1787	Yaw Lai Ping	gailylp@hotmail.com	2017-02-02	4	1	Roadshows	2017-08-19 06:23:30+00	2017-08-19 06:23:30+00	1
1788	Ruben	rubiq007@gmail.com	2016-06-09	7	1	Roadshows	2017-08-19 06:23:40+00	2017-08-19 06:23:40+00	1
1789	Chin Tze Pin	educafe8@yahoo.com	1975-03-31	7	1	Word-of-mouth	2017-08-19 06:23:48+00	2017-08-19 06:23:48+00	1
1790	Fadli	fadlina614@gmail.com	1988-05-07	0	1	Social Media	2017-08-19 06:24:24+00	2017-08-19 06:24:24+00	1
1791	christine saw	chrissaw@singnet.com.sg	1962-10-03	0	1	one-north Apps	2017-08-19 06:24:26+00	2017-08-19 06:24:26+00	1
1792	Fikree	sharpagent15@gmail.com	2017-01-26	0	1	Roadshows	2017-08-19 06:25:16+00	2017-08-19 06:25:16+00	1
1793	Esther Teo	esther_teo@yahoo.com	1974-12-09	0	1	Electronic Direct Mailer	2017-08-19 06:25:53+00	2017-08-19 06:25:54+00	1
1794	Lilai	lilai327@yahoo.com	1957-08-22	0	1	Roadshows	2017-08-19 06:26:06+00	2017-08-19 06:26:06+00	1
1795	Tan Ser min	sermin1994@gmail.com	1994-07-23	0	1	Word-of-mouth	2017-08-19 06:26:21+00	2017-08-19 06:26:21+00	1
1796	Jerome	egmar9@hotmail.com	1986-04-10	0	1	Word-of-mouth	2017-08-19 06:27:45+00	2017-08-19 06:27:45+00	1
1797	Judy Tay	Ryanjudy2013@gmail.com	1951-09-06	0	1	one-north Apps,Word-of-mouth	2017-08-19 06:27:56+00	2017-08-19 06:27:56+00	1
1798	Minwon bae	mebmw1234@gmail.com	2017-06-13	7	1	Roadshows	2017-08-19 06:27:58+00	2017-08-19 06:27:58+00	1
1799	Royston	roykpokiaa@gmail.com	2017-08-19	0	1	Word-of-mouth	2017-08-19 06:28:24+00	2017-08-19 06:28:24+00	1
1800	Khor hwee yin	hushpuppies@gmail.com	1977-10-26	0	1	Bus Stop Ads	2017-08-19 06:30:54+00	2017-08-19 06:30:54+00	1
1801	Vivek	vivekkalyansk@gmail.com	1994-04-03	0	1	Word-of-mouth	2017-08-19 06:31:35+00	2017-08-19 06:31:35+00	1
1802	Lu Zhao an	zhaoan_lu@yahoo.com.sg	2017-08-19	0	1	Roadshows	2017-08-19 06:32:29+00	2017-08-19 06:32:29+00	1
1803	Ong Siong gim	reddevils.sg@hotmail.com	2016-12-16	0	1	Word-of-mouth	2017-08-19 06:33:20+00	2017-08-19 06:33:20+00	1
1804	Andrew Soutar	amsoutar@gmail.com	1971-08-19	0	1	Roadshows	2017-08-19 06:33:35+00	2017-08-19 06:33:35+00	1
1805	Steffi chan	vaness@shimadzu.com.sg	2007-05-02	0	1	Posters	2017-08-19 06:34:18+00	2017-08-19 06:34:18+00	1
1806	Ronnie	jwtew@simtech.a-star.edu.sg	1976-05-31	2	1	Posters	2017-08-19 06:34:19+00	2017-08-19 06:34:19+00	1
1807	Frank Pintor	walter-frank@artc.a-star.edu.sg	2017-08-19	0	1	Word-of-mouth	2017-08-19 06:34:21+00	2017-08-19 06:34:21+00	1
1808	Peggy Tan	peggy.tan@seagate.com	1968-05-12	7	1	Roadshows	2017-08-19 06:34:52+00	2017-08-19 06:34:52+00	1
1809	Eva	madmonkeyeva@gmail.com	1992-07-30	0	1	Word-of-mouth	2017-08-19 06:35:06+00	2017-08-19 06:35:06+00	1
1810	Rebecca	wehc.acceber@gmail.com	2016-04-22	0	1	Roadshows	2017-08-19 06:35:09+00	2017-08-19 06:35:09+00	1
1811	Hataitip Duangrat	plern_1984@hotmail.com	1984-10-27	7	1	Word-of-mouth	2017-08-19 06:35:10+00	2017-08-19 06:35:10+00	1
1812	Lee Li Zhen	leelizhen@hotmail.com	1994-08-03	0	1	one-north Apps	2017-08-19 06:35:21+00	2017-08-19 06:35:21+00	1
1813	Chan Shi Ying	Denisechan92@hotmail.com	1992-02-29	0	1	Word-of-mouth	2017-08-19 06:35:38+00	2017-08-19 06:35:38+00	1
1814	chris MASON	TBAGG1971@HOTMAIL.CO.UK	1971-11-11	0	1	Roadshows	2017-08-19 06:35:40+00	2017-08-19 06:35:40+00	1
1815	Ahmad Iskandar	ahmad.iskandar.86@gmail.com	1986-07-04	0	1	Word-of-mouth	2017-08-19 06:35:52+00	2017-08-19 06:35:52+00	1
1816	Buenaventura	rizaldyb@artc.a-star.edu.sg	1991-12-06	0	1	Roadshows	2017-08-19 06:36:00+00	2017-08-19 06:36:00+00	1
1817	Joel	joelng382@hotmail.com	1994-03-11	0	1	Roadshows	2017-08-19 06:36:18+00	2017-08-19 06:36:18+00	1
1818	arone	arone248@hotmail.com	2017-08-19	5	1	Bus Stop Ads,PULSE Newsletter,Electronic Direct Mailer	2017-08-19 06:36:21+00	2017-08-19 06:36:21+00	1
1819	David Low	drdlow@hotmail.com	1972-10-03	0	1	Roadshows	2017-08-19 06:36:22+00	2017-08-19 06:36:23+00	1
1820	Low jj	jongjiang.low@gmail.com	1990-05-09	0	1	Roadshows	2017-08-19 06:36:23+00	2017-08-19 06:36:23+00	1
1821	Joshua	joshualow188@gmail.com	2002-05-09	0	1	Roadshows	2017-08-19 06:36:35+00	2017-08-19 06:36:35+00	1
1822	JiaYu	jiayu0000000@gmail.com	1989-04-14	0	1	Roadshows	2017-08-19 06:36:36+00	2017-08-19 06:36:36+00	1
1823	Parul	parul.ranna@gmail.com	1982-01-16	0	1	Roadshows	2017-08-19 06:36:39+00	2017-08-19 06:36:39+00	1
1824	Catherine scheffer	cathybroussolle@yahoo.fr	1982-01-25	0	1	Roadshows	2017-08-19 06:36:44+00	2017-08-19 06:36:44+00	1
1825	Lee wai peng	capricornleewp@hotmail.com	1979-12-27	0	1	Word-of-mouth	2017-08-19 06:36:50+00	2017-08-19 06:36:50+00	1
1826	Vincent	vincentpang86@gmail.com	1980-01-01	0	1	Posters	2017-08-19 06:37:08+00	2017-08-19 06:37:08+00	1
1827	Ang	angelineangyj@gmail.com	1987-09-09	0	1	Posters,Bus Stop Ads,Word-of-mouth	2017-08-19 06:37:12+00	2017-08-19 06:37:12+00	1
1828	Teej	jehpin@gmail.com	2007-10-01	0	1	Roadshows	2017-08-19 06:37:32+00	2017-08-19 06:37:32+00	1
1829	Azeez Talha	azeeztalha@gmail.com	1972-12-21	7	1	Word-of-mouth	2017-08-19 06:37:37+00	2017-08-19 06:37:37+00	1
1830	LAURA BALAJADIA	LAURAROXAS@YAHOO.COM	1971-01-23	0	1	Roadshows	2017-08-19 06:37:40+00	2017-08-19 06:37:40+00	1
1831	Matthew King	matthew-king@artc.a-star.edu.sg	1972-09-21	0	1	Roadshows	2017-08-19 06:38:31+00	2017-08-19 06:38:31+00	1
1832	Maria	maria.felice@ntu.edu.sg	1988-10-04	0	1	Word-of-mouth	2017-08-19 06:38:46+00	2017-08-19 06:38:46+00	1
1833	Charlene	charleneness@hotmail.com	1991-08-01	2	1	Word-of-mouth	2017-08-19 06:39:09+00	2017-08-19 06:39:09+00	1
1835	Christopher Lane	kit.lane84@googlemail.com	1984-11-16	0	1	Roadshows	2017-08-19 06:39:19+00	2017-08-19 06:39:19+00	1
1836	Nida	nida.a.janjua@gmail.com	2005-08-09	0	1	Word-of-mouth	2017-08-19 06:39:43+00	2017-08-19 06:39:43+00	1
1837	Hummaira Gul Azeez	hummairagul@gmail.com	1980-05-02	0	1	Word-of-mouth	2017-08-19 06:39:47+00	2017-08-19 06:39:47+00	1
1838	Shunsuke Suge	shunsuke.suge@gmail.com	1974-12-03	2	1	Posters	2017-08-19 06:40:00+00	2017-08-19 06:40:00+00	1
1839	deng lu	denglunea@hotmail.com	1984-08-23	0	1	Roadshows	2017-08-19 06:40:44+00	2017-08-19 06:40:44+00	1
1902	Bruce boey	bruceboey@yahoo.com	1972-05-17	0	1	Word-of-mouth	2017-08-19 09:05:05+00	2017-08-19 09:05:05+00	1
1840	Daanyaal Azeez	daanyaal.azeez@gmail.com	2004-02-09	0	1	Word-of-mouth	2017-08-19 06:40:54+00	2017-08-19 06:40:54+00	1
1841	Dee King	deekingduck@gmail.com	1978-03-12	5	1	Word-of-mouth	2017-08-19 06:41:03+00	2017-08-19 06:41:03+00	1
1842	David Tan	david_tan@jtc.giv.sg	2017-08-19	0	1	Word-of-mouth	2017-08-19 06:41:21+00	2017-08-19 06:41:21+00	1
1843	Tomonori sekiya	tomonori3068@gmail.com	1980-03-06	0	1	Roadshows	2017-08-19 06:41:24+00	2017-08-19 06:41:25+00	1
1844	Tijo	tijotthayil@gmail.com	1981-04-01	0	1	Roadshows	2017-08-19 06:42:26+00	2017-08-19 06:42:26+00	1
1845	Tan Hong Hock	tropical_santa@hotmail.com	1965-12-01	0	1	Newspapers	2017-08-19 06:42:26+00	2017-08-19 06:42:26+00	1
1846	tak	tak@outlook.sg	1987-01-01	0	1	Word-of-mouth	2017-08-19 06:44:27+00	2017-08-19 06:44:27+00	1
1847	Tabithan Ho	tabbiho@gmail.com	1995-11-01	0	1	Word-of-mouth	2017-08-19 06:46:35+00	2017-08-19 06:46:35+00	1
1848	Kenny Phang	crystalpyb@gmail.com	1979-05-18	0	1	Roadshows	2017-08-19 06:46:50+00	2017-08-19 06:50:38+00	1
1849	Dejanira Araiza	dejanira_araiza@artc.a-star.edu.sg	1985-10-28	0	1	Roadshows	2017-08-19 06:47:09+00	2017-08-19 06:47:09+00	1
1850	Ronnie Tan	ronnie36@gmail.com	2017-08-19	0	1	Roadshows	2017-08-19 06:51:13+00	2017-08-19 07:09:01+00	1
1851	Cy	lhoyen@gmail.com	1995-09-18	0	1	Roadshows	2017-08-19 06:57:48+00	2017-08-19 06:57:48+00	1
1852	Ke Lin	keke620@hotmail.com	1978-06-20	2	1	Roadshows	2017-08-19 06:58:29+00	2017-08-19 06:58:29+00	1
1853	Marcus	marcusfgw@gmail.com	1995-05-29	0	1	Roadshows	2017-08-19 06:58:30+00	2017-08-19 06:58:30+00	1
1854	angeline marquez	asf020174@yahoo.com	2009-03-10	0	1	Roadshows	2017-08-19 07:09:10+00	2017-08-19 07:09:10+00	1
1855	Hattie	hattiedong2000@yahoo.com.sg	1976-09-06	0	1	Roadshows	2017-08-19 07:11:38+00	2017-08-19 07:11:38+00	1
1856	Li Rong	rli@etc.a-star.edu.sg	1968-06-29	4	1	Roadshows	2017-08-19 07:12:16+00	2017-08-19 07:12:16+00	1
1857	ong wan ying	wyongaa@gmail.com	1981-05-23	0	1	Social Media	2017-08-19 07:15:47+00	2017-08-19 07:15:47+00	1
1858	Elsa	yuanbiyue@gmai.com	1986-07-16	0	1	Roadshows	2017-08-19 07:15:48+00	2017-08-19 07:15:48+00	1
1859	Wei xiang	weixiangng@outlook.com	1994-02-16	0	1	Roadshows	2017-08-19 07:16:56+00	2017-08-19 07:16:56+00	1
1860	Long	neat.mc.1.11.2@gmail.com	2004-12-28	0	1	Roadshows	2017-08-19 07:19:44+00	2017-08-19 07:19:44+00	1
1861	Crystal	crystal_scy@live.com	1988-09-04	0	1	Roadshows	2017-08-19 07:19:46+00	2017-08-19 07:19:46+00	1
1862	gopu sriram	ramopath@yahoo.com	1979-04-20	0	1	Social Media	2017-08-19 07:23:51+00	2017-08-19 07:23:51+00	1
1863	Naoya Moritani	n0531m@gmail.com	1976-05-31	2	1	Word-of-mouth	2017-08-19 07:31:51+00	2017-08-19 07:31:51+00	1
1864	Steffi chan	steffichan07@hotmail.com	2017-05-02	0	1	Posters	2017-08-19 07:32:45+00	2017-08-19 07:32:45+00	1
1865	Jacy	omglinjacynthe@yahoo.fr	1981-03-14	0	1	Word-of-mouth	2017-08-19 07:37:01+00	2017-08-19 07:37:01+00	1
1866	Jeanette	thepulp11@gmail.com	1975-12-30	0	1	Word-of-mouth	2017-08-19 07:40:33+00	2017-08-19 07:40:33+00	1
1867	Amanda Chia	amanda_chia_jy@hotmail.com	1993-09-04	0	1	Word-of-mouth	2017-08-19 07:58:49+00	2017-08-19 07:58:49+00	1
1868	Lenny	l3n_82@yahoo.com	1982-08-21	0	1	Roadshows	2017-08-19 07:59:30+00	2017-08-19 07:59:31+00	1
1869	JIa fu	ahfufu1@gmail.com	2004-09-05	0	1	Roadshows	2017-08-19 08:04:23+00	2017-08-19 08:04:24+00	1
1870	Tan yee chee	tan_yee_chee@hotmail.com	1985-09-05	0	1	Roadshows	2017-08-19 08:04:27+00	2017-08-19 08:04:48+00	1
1871	Yun De	dedeyun+erp@gmail.com	1995-06-07	0	1	Roadshows	2017-08-19 08:05:52+00	2017-08-19 08:05:52+00	1
1872	Hadthiq Akashah	ashhhwalker@gmail.com	1995-03-16	0	1	Roadshows	2017-08-19 08:11:06+00	2017-08-19 08:11:06+00	1
1873	ignatius foo	andrewntracy@gmail.com	2007-11-06	0	1	Roadshows	2017-08-19 08:11:13+00	2017-08-19 08:11:14+00	1
1874	John	johnnybravo343@hotmail.com	1992-11-30	0	1	Roadshows	2017-08-19 08:11:30+00	2017-08-19 08:11:30+00	1
1875	Jolin	jolinwmq@hotmail.com	1996-07-03	0	1	Roadshows	2017-08-19 08:14:26+00	2017-08-19 08:14:26+00	1
1876	Keat	keatbear@yahoo.com	1982-11-23	1	1	Posters,Word-of-mouth	2017-08-19 08:18:29+00	2017-08-19 08:18:29+00	1
1877	Hui Shan	huishan-1996@hotmail.com	1996-07-07	0	1	Roadshows	2017-08-19 08:19:41+00	2017-08-19 08:19:41+00	1
1878	sahil gupta	gsahil1988@gmail.com	1988-07-07	0	1	Roadshows	2017-08-19 08:19:57+00	2017-08-19 08:19:58+00	1
1879	Joel	scaryboy_97@hotmail.com	1997-11-25	0	1	Roadshows	2017-08-19 08:20:12+00	2017-08-19 08:20:12+00	1
1880	paulami khan	paulami.khan@gmail.com	1986-03-16	0	1	Roadshows	2017-08-19 08:20:53+00	2017-08-19 08:20:53+00	1
1881	Audrey yeo	audyeo1078@gmail.com	1973-08-04	0	1	one-north Apps	2017-08-19 08:23:13+00	2017-08-19 08:23:13+00	1
1882	Emily Tan	emily@toyo-chromium.com.sg	1971-04-28	0	1	Newspapers	2017-08-19 08:29:57+00	2017-08-19 08:29:57+00	1
1883	Tan Chong Yin	chongyin.tan@gmail.com	1971-11-20	0	1	Newspapers	2017-08-19 08:30:56+00	2017-08-19 08:30:56+00	1
1884	Damian	damiantk92@gmail.com	1992-04-08	0	1	Roadshows	2017-08-19 08:34:28+00	2017-08-19 08:34:28+00	1
1885	Geraldine	allsimplyme11@gmail.com	1996-09-14	0	1	Word-of-mouth	2017-08-19 08:35:17+00	2017-08-19 08:35:17+00	1
1886	Angie	tehangie@hotmail.com	1980-11-16	0	1	Roadshows	2017-08-19 08:36:45+00	2017-08-19 08:36:45+00	1
1887	Tan Wei Ling	myinchen@yahoo.com.sg	1982-08-12	0	1	Social Media	2017-08-19 08:40:19+00	2017-08-19 08:40:19+00	1
1888	Agnes	agneshjm@hotmail.com	1997-08-31	0	1	Roadshows	2017-08-19 08:41:55+00	2017-08-19 08:41:55+00	1
1889	Chris Lim	chinesesheng@yahoo.com.sg	1978-10-04	0	1	Social Media	2017-08-19 08:44:10+00	2017-08-19 08:44:10+00	1
1890	Nicole	nicole_soon12@hotmail.com	1997-08-12	0	1	Posters	2017-08-19 08:45:42+00	2017-08-19 08:45:42+00	1
1891	Kiran Annam	kirantv9@gmail.com	1988-10-10	0	1	Roadshows	2017-08-19 08:46:05+00	2017-08-19 08:46:05+00	1
1892	Rica Ngeh	rica_sanmiguel@hotmail.com	1977-10-01	0	1	Posters	2017-08-19 08:47:30+00	2017-08-19 08:47:30+00	1
1893	Foo Siew Lan	sylvia_foo@hotmail.com	1969-07-05	0	1	Newspapers	2017-08-19 08:50:35+00	2017-08-19 08:50:35+00	1
1894	Justin leong	leongjustin@yahoo.com	1978-10-10	0	1	Roadshows	2017-08-19 08:54:50+00	2017-08-19 09:16:57+00	1
1895	Luo kui	kxluo0926@gmail.com	1978-09-26	0	1	Social Media	2017-08-19 08:56:22+00	2017-08-19 08:56:22+00	1
1896	ANN	annpeh@yahoo.com.sg	1974-12-24	0	1	Roadshows	2017-08-19 08:59:58+00	2017-08-19 08:59:58+00	1
1897	Amanda	pure_soulamanda5@hotmail.com	1987-05-05	0	1	Roadshows	2017-08-19 09:00:02+00	2017-08-19 09:00:02+00	1
1898	Isaac Huen	isacki@gmail.com	1987-11-04	4	1	Roadshows	2017-08-19 09:00:23+00	2017-08-19 09:00:23+00	1
1899	Cani zhong	canizhong@hotmail.com	1974-05-27	0	1	Roadshows	2017-08-19 09:02:53+00	2017-08-19 09:02:53+00	1
1900	Fan pingying	sunnifan76@hotmail.com	1976-01-10	0	1	Roadshows	2017-08-19 09:02:53+00	2017-08-19 09:02:54+00	1
1901	Saw Ern Ern	adidasern.0912@gmail.com	1998-09-12	0	1	Roadshows	2017-08-19 09:04:10+00	2017-08-19 09:04:10+00	1
1903	Kristine Lee Yan Xin	yanxinlee@hotmail.com	1997-10-14	0	1	Electronic Direct Mailer	2017-08-19 09:05:36+00	2017-08-19 09:05:36+00	1
1904	Chan Yu Siang	chanyusiang@gmail.com	1996-05-31	0	1	Word-of-mouth	2017-08-19 09:05:37+00	2017-08-19 09:05:37+00	1
1905	Lim Jia Yi	lim.jia.yi.2017@vjc.sg	1999-02-19	0	1	Word-of-mouth	2017-08-19 09:06:04+00	2017-08-19 09:06:04+00	1
1906	Zhao Yu	sgzhaoyu@yahoo.com	2017-03-04	0	1	Roadshows	2017-08-19 09:06:49+00	2017-08-19 09:06:49+00	1
1907	Lee Tzuu Yao	zuyao1988@gmail.com	1988-04-09	0	1	Roadshows	2017-08-19 09:09:24+00	2017-08-19 09:09:24+00	1
1908	Willy Santoso	willy@ekkko.com	1990-02-10	0	1	Roadshows	2017-08-19 09:09:47+00	2017-08-19 09:09:47+00	1
1909	Joey	jjoeyyong@gmail.com	1996-04-13	0	1	Roadshows	2017-08-19 09:10:02+00	2017-08-19 09:10:02+00	1
1910	Joycelyn cheok	joycelyncheok@yahoo.com.sg	1974-03-05	0	1	Word-of-mouth	2017-08-19 09:11:36+00	2017-08-19 09:11:36+00	1
1911	anojan Daniel	adanojan@GMAIL.COM	1988-04-09	0	1	Roadshows	2017-08-19 09:11:56+00	2017-08-19 09:11:56+00	1
1912	siew	annpeh@gmail.com	1974-12-24	0	1	Roadshows	2017-08-19 09:15:27+00	2017-08-19 09:15:27+00	1
1913	Park koung je	maria0320@nate.com	2017-08-19	0	1	Word-of-mouth	2017-08-19 09:15:46+00	2017-08-19 09:15:46+00	1
1914	boey yoong siang	bruce_boey@yahoo.com	1972-05-17	0	1	Word-of-mouth	2017-08-19 09:16:00+00	2017-08-19 09:16:00+00	1
1915	TANG CO	MR.TANGCO@GMAIL.COM	1977-07-27	0	1	Roadshows	2017-08-19 09:16:39+00	2017-08-19 09:16:39+00	1
1916	Cheryl Ong	cheryljoyong@gmail.com	1978-11-09	0	1	Word-of-mouth	2017-08-19 09:17:46+00	2017-08-19 09:17:46+00	1
1917	Jia Songshan	jsongsham@gmail.com	1993-05-14	0	1	Roadshows	2017-08-19 09:18:23+00	2017-08-19 09:18:23+00	1
1918	Clarice	clariceleng95@gmail.com	1995-01-10	0	1	Roadshows	2017-08-19 09:19:52+00	2017-08-19 09:19:52+00	1
1919	EDRIC LEE	LEEKAHHOOI@GMAIL.COM	2008-03-25	0	1	Social Media	2017-08-19 09:20:24+00	2017-08-19 09:20:24+00	1
1920	Chee elynne	elynne_97@hotmail.com	1997-01-10	0	1	Word-of-mouth	2017-08-19 09:21:17+00	2017-08-19 09:21:17+00	1
1921	Sherill	confession.x3@hotmail.com	1997-02-12	0	1	Social Media	2017-08-19 09:21:20+00	2017-08-19 09:21:20+00	1
1922	ping	andrapeh@yahoo.com	1974-12-24	0	1	Roadshows	2017-08-19 09:21:28+00	2017-08-19 09:21:28+00	1
1923	XAVIER SHEN	SHAUNXA@GMAIL.COM	2007-05-29	0	1	Roadshows	2017-08-19 09:21:57+00	2017-08-19 09:22:53+00	1
1924	Bae min huk	jjoy0320@naver.com	2017-08-19	0	1	Word-of-mouth	2017-08-19 09:22:22+00	2017-08-19 09:22:22+00	1
1925	Kenny Lee	vivianyhs@gmail.com	1986-11-19	0	1	Roadshows	2017-08-19 09:23:28+00	2017-08-19 09:24:24+00	1
1926	Sharon	bronto82@yahoo.com	1988-07-03	0	1	Roadshows	2017-08-19 09:24:32+00	2017-08-19 09:24:32+00	1
1927	ENG	ENG_J@YAHOO.COM.SG	1970-01-02	0	1	Bus Stop Ads	2017-08-19 09:25:46+00	2017-08-19 09:25:46+00	1
1928	Angela Tan	angelatan1997@gmail.com	1997-01-03	0	1	Roadshows	2017-08-19 09:26:22+00	2017-08-19 09:26:22+00	1
1929	Milton	miltonlws13@gmail.com	1988-10-26	0	1	Posters,Word-of-mouth	2017-08-19 09:27:14+00	2017-08-19 09:27:14+00	1
1930	Nicole	nicolelimzixuan@gmail.com	1997-02-19	0	1	Roadshows	2017-08-19 09:27:28+00	2017-08-19 09:27:28+00	1
1931	KHO HY	KHWEEY@GMAIL.COM	1978-05-20	0	1	Roadshows	2017-08-19 09:28:43+00	2017-08-19 09:28:43+00	1
1932	Luei Kah Han	kahhanluei@gmail.com	1994-09-24	0	1	Electronic Direct Mailer,Word-of-mouth	2017-08-19 09:32:01+00	2017-08-19 09:32:01+00	1
1933	LOW YEW WOEI	YEWWOEI.LOW@OUTLOOK.COM	1996-10-15	0	1	Bus Stop Ads	2017-08-19 09:33:36+00	2017-08-19 09:33:36+00	1
1934	Jack	jamesspells@gmail.com	2017-10-03	0	1	Social Media	2017-08-19 09:33:42+00	2017-08-19 09:33:42+00	1
1935	RADIANA	RA.DIANA@HOTMAIL.COM	1973-12-30	0	1	Roadshows	2017-08-19 09:36:59+00	2017-08-19 09:36:59+00	1
1936	jia hui	aquariusxavenue@gmail.com	1996-02-15	0	1	Roadshows	2017-08-19 09:38:00+00	2017-08-19 09:38:00+00	1
1937	SAMUEL CHER	samuel_cher@hotmail.com	1993-10-03	0	1	Roadshows	2017-08-19 09:46:16+00	2017-08-19 09:46:16+00	1
1938	Yuan Xin	itsyuanxin@gmail.com	1994-11-01	0	1	Roadshows	2017-08-19 09:49:45+00	2017-08-19 09:49:45+00	1
1939	Kevin Tay	ktbh21@gmail.com	1985-10-11	0	1	Roadshows	2017-08-19 09:50:19+00	2017-08-19 09:50:19+00	1
1940	Mok Chuan Heng	lametistrevolution1992@gmail.com	1992-08-14	0	1	Roadshows	2017-08-19 09:50:56+00	2017-08-19 09:54:16+00	1
1941	Joshua Ng	joshua_ng_hui@hotmail.com	1992-12-12	0	1	Word-of-mouth	2017-08-19 09:52:07+00	2017-08-19 09:52:07+00	1
1942	Wong Woon Yee	sikkim.discovery@gmail.com	1950-09-10	0	1	Newspapers	2017-08-19 09:52:32+00	2017-08-19 09:52:32+00	1
1943	kelly	liveahappyme@gmail.com	1993-11-06	0	1	Social Media	2017-08-19 09:53:41+00	2017-08-19 09:53:41+00	1
1944	tan lim	danielstuition@gmail.com	1992-08-19	0	1	Roadshows	2017-08-19 09:54:09+00	2017-08-19 09:54:09+00	1
1945	Fiona	fiona_hansidi@hotmail.com	1993-07-12	0	1	Word-of-mouth	2017-08-19 09:59:47+00	2017-08-19 09:59:47+00	1
7	Evently Test	eventlytest@mailinator.com	1983-07-21	1	1	one-north Apps	2017-07-21 02:20:57+00	2017-08-19 17:07:50+00	2
1951	Steve Soh	zhongzhengsg@yahoo.com.sg	1981-08-31	0	1	Newspapers	2017-08-20 06:36:48+00	2017-08-20 06:36:48+00	1
1946	Paul Nguyen	paulaan@saloniz.com	1988-12-12	0	1	Bus Stop Ads	2017-08-19 17:12:44+00	2017-08-19 17:13:44+00	2
1947	Shyla Siva	BabyGal08@yahoo.com	2017-07-07	0	1	Word-of-mouth	2017-08-20 02:43:10+00	2017-08-20 02:43:10+00	1
1948	Alex	lex_axy@yahoo.com	2017-08-20	0	1	Social Media	2017-08-20 05:30:26+00	2017-08-20 05:30:26+00	1
1949	Javier	Javierer1994@gmail.com	1994-07-18	0	1	Word-of-mouth	2017-08-20 05:49:04+00	2017-08-20 05:49:04+00	1
1950	Keith Wan	losstp@gmail.com	1994-04-30	0	1	Word-of-mouth	2017-08-20 05:55:30+00	2017-08-20 05:55:30+00	1
\.


--
-- Name: attendee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: evently_user
--

SELECT pg_catalog.setval('attendee_id_seq', 1951, true);


--
-- Data for Name: codes; Type: TABLE DATA; Schema: public; Owner: evently_user
--

COPY codes (id, value, active, fk_event, fk_code, type, created_at, updated_at, image, fk_attendee) FROM stdin;
4	JQC1Fv	t	1	\N	2	2017-07-20 17:20:34+00	2017-07-20 17:20:34+00	\N	4
5	GRtWsW	t	1	\N	2	2017-07-20 18:57:26+00	2017-07-20 18:57:26+00	\N	5
6	K6F9HA	t	1	\N	2	2017-07-20 19:03:15+00	2017-07-20 19:03:15+00	\N	6
7	KAI4up	t	1	\N	2	2017-07-21 02:20:58+00	2017-07-21 02:20:58+00	\N	7
11	MZtvIP	f	1	\N	2	2017-07-21 16:02:30+00	2017-08-04 04:47:46+00	\N	11
12	G9FBiY	f	1	\N	2	2017-07-22 06:20:03+00	2017-08-03 14:31:11+00	\N	12
13	MJuRFO	t	1	\N	2	2017-07-25 08:30:43+00	2017-07-25 08:30:43+00	\N	13
14	rkfwsy	t	1	\N	2	2017-07-25 11:07:04+00	2017-07-25 11:07:04+00	\N	14
15	NEHMt8	t	1	\N	2	2017-07-25 16:32:22+00	2017-07-25 16:32:22+00	\N	15
16	G9F1fW	t	1	\N	2	2017-07-26 01:49:28+00	2017-07-26 01:49:28+00	\N	16
17	zmhRh7	t	1	\N	2	2017-07-26 02:06:04+00	2017-07-26 02:06:04+00	\N	17
18	M7I2iR	t	1	\N	2	2017-07-26 02:59:17+00	2017-07-26 02:59:17+00	\N	18
19	xvi1fg	t	1	\N	2	2017-07-26 08:02:42+00	2017-07-26 08:02:42+00	\N	19
20	AmFZiY	t	1	\N	2	2017-07-26 12:50:39+00	2017-07-26 12:50:39+00	\N	20
21	ExCpuZ	t	1	\N	2	2017-07-26 12:52:42+00	2017-07-26 12:52:42+00	\N	21
22	EPFWhx	t	1	\N	2	2017-07-26 12:55:14+00	2017-07-26 12:55:14+00	\N	22
23	ADfEuO	t	1	\N	2	2017-07-26 12:56:30+00	2017-07-26 12:56:30+00	\N	23
24	AmFEuG	t	1	\N	2	2017-07-26 12:57:32+00	2017-07-26 12:57:32+00	\N	24
25	LYHki5	t	1	\N	2	2017-07-26 12:58:48+00	2017-07-26 12:58:48+00	\N	25
26	JEIqfk	t	1	\N	2	2017-07-26 14:15:23+00	2017-07-26 14:15:23+00	\N	26
27	v8uEiQ	t	1	\N	2	2017-07-27 04:57:30+00	2017-07-27 04:57:30+00	\N	27
28	ADfnFM	t	1	\N	2	2017-07-27 05:43:28+00	2017-07-27 05:43:28+00	\N	28
30	zpfwCw	t	1	\N	2	2017-07-28 04:16:41+00	2017-07-28 04:16:41+00	\N	30
31	GMu2Ip	t	1	\N	2	2017-07-28 05:21:19+00	2017-07-28 05:21:19+00	\N	31
32	DYH5fR	t	1	\N	2	2017-07-28 06:11:56+00	2017-07-28 06:11:56+00	\N	32
33	OgtEIw	t	1	\N	2	2017-07-28 08:40:22+00	2017-07-28 08:40:22+00	\N	33
34	VJIzIr	t	1	\N	2	2017-07-28 11:15:56+00	2017-07-28 11:15:56+00	\N	34
35	BPuPs1	t	1	\N	2	2017-07-28 13:32:44+00	2017-07-28 13:32:44+00	\N	35
36	E0u1sx	t	1	\N	2	2017-07-28 13:34:57+00	2017-07-28 13:34:57+00	\N	36
37	ElhnHB	t	1	\N	2	2017-07-29 15:58:07+00	2017-07-29 15:58:07+00	\N	37
38	xviJh2	t	1	\N	2	2017-07-30 10:42:37+00	2017-07-30 10:42:37+00	\N	38
39	N8Fju8	t	1	\N	2	2017-07-30 10:45:31+00	2017-07-30 10:45:31+00	\N	39
40	Dkf3un	t	1	\N	2	2017-07-30 12:06:58+00	2017-07-30 12:06:58+00	\N	40
41	rkfnC7	t	1	\N	2	2017-07-30 14:28:56+00	2017-07-30 14:28:56+00	\N	41
42	wrCGf9	t	1	\N	2	2017-07-31 04:10:09+00	2017-07-31 04:10:09+00	\N	42
43	r0hws4	t	1	\N	2	2017-07-31 04:11:26+00	2017-07-31 04:11:26+00	\N	43
44	KYHqhQ	t	1	\N	2	2017-07-31 04:12:15+00	2017-07-31 04:12:15+00	\N	44
45	JqiACK	t	1	\N	2	2017-07-31 04:13:16+00	2017-07-31 04:13:16+00	\N	45
46	mZfjfO	t	1	\N	2	2017-07-31 04:14:02+00	2017-07-31 04:14:02+00	\N	46
47	vghEio	t	1	\N	2	2017-07-31 04:14:58+00	2017-07-31 04:14:58+00	\N	47
49	DwIjsA	t	1	\N	2	2017-07-31 04:23:50+00	2017-07-31 04:23:50+00	\N	49
50	OEHEI5	t	1	\N	2	2017-07-31 04:25:10+00	2017-07-31 04:25:10+00	\N	50
51	ymF6sZ	t	1	\N	2	2017-07-31 04:44:50+00	2017-07-31 04:44:50+00	\N	51
52	wkFLhV	t	1	\N	2	2017-07-31 04:45:34+00	2017-07-31 04:45:34+00	\N	52
53	BrtVh7	t	1	\N	2	2017-07-31 04:46:16+00	2017-07-31 04:46:16+00	\N	53
54	wpf0s8	t	1	\N	2	2017-07-31 04:49:12+00	2017-07-31 04:49:12+00	\N	54
55	BNsAHN	t	1	\N	2	2017-07-31 04:49:56+00	2017-07-31 04:49:56+00	\N	55
56	Eqtli4	t	1	\N	2	2017-07-31 04:51:57+00	2017-07-31 04:51:57+00	\N	56
57	znFRhK	t	1	\N	2	2017-07-31 04:52:44+00	2017-07-31 04:52:44+00	\N	57
58	JEI8hy	t	1	\N	2	2017-07-31 04:54:58+00	2017-07-31 04:54:58+00	\N	58
59	N0C9HV	t	1	\N	2	2017-07-31 04:55:41+00	2017-07-31 04:55:41+00	\N	59
60	mZf5hG	t	1	\N	2	2017-07-31 04:56:21+00	2017-07-31 04:56:21+00	\N	60
61	xvi9F8	t	1	\N	2	2017-07-31 04:57:08+00	2017-07-31 04:57:08+00	\N	61
62	KLurtQ	t	1	\N	2	2017-07-31 04:58:14+00	2017-07-31 04:58:14+00	\N	62
63	OEHvuw	t	1	\N	2	2017-07-31 04:58:59+00	2017-07-31 04:58:59+00	\N	63
64	o2fDiz	t	1	\N	2	2017-07-31 04:59:41+00	2017-07-31 04:59:41+00	\N	64
65	K1sMCQ	t	1	\N	2	2017-07-31 05:03:18+00	2017-07-31 05:03:18+00	\N	65
66	DQuoiB	t	1	\N	2	2017-07-31 05:03:58+00	2017-07-31 05:03:58+00	\N	66
67	BPuMF6	t	1	\N	2	2017-07-31 05:04:47+00	2017-07-31 05:04:47+00	\N	67
69	M9F9H1	t	1	\N	2	2017-07-31 05:07:03+00	2017-07-31 05:07:03+00	\N	69
70	M7IRFQ	t	1	\N	2	2017-07-31 05:08:06+00	2017-07-31 05:08:06+00	\N	70
71	pYfzhG	t	1	\N	2	2017-07-31 05:08:52+00	2017-07-31 05:08:52+00	\N	71
72	GZh2I1	t	1	\N	2	2017-07-31 05:15:08+00	2017-07-31 05:15:08+00	\N	72
73	zmhwCo	t	1	\N	2	2017-07-31 05:16:05+00	2017-07-31 05:16:05+00	\N	73
74	NEHEFz	t	1	\N	2	2017-07-31 05:17:06+00	2017-07-31 05:17:06+00	\N	74
75	DRhnFR	t	1	\N	2	2017-07-31 05:17:53+00	2017-07-31 05:17:53+00	\N	75
76	DwIOt5	t	1	\N	2	2017-07-31 05:18:34+00	2017-07-31 05:18:34+00	\N	76
77	K6Frtn	t	1	\N	2	2017-07-31 05:19:57+00	2017-07-31 05:19:57+00	\N	77
78	GMu0Fk	t	1	\N	2	2017-07-31 05:20:42+00	2017-07-31 05:20:42+00	\N	78
79	NYu9Hy	t	1	\N	2	2017-07-31 05:21:21+00	2017-07-31 05:21:21+00	\N	79
80	J8t1Fp	t	1	\N	2	2017-07-31 05:22:47+00	2017-07-31 05:22:47+00	\N	80
81	DYHJCW	t	1	\N	2	2017-07-31 05:24:08+00	2017-07-31 05:24:08+00	\N	81
82	race-eat-play-zvs4uK	t	1	\N	2	2017-07-31 06:13:54+00	2017-07-31 06:13:54+00	\N	87
83	race-eat-play-wpfvix	t	1	\N	2	2017-07-31 06:33:48+00	2017-07-31 06:33:48+00	\N	88
84	race-eat-play-ERfnHx	t	1	\N	2	2017-07-31 07:03:39+00	2017-07-31 07:03:39+00	\N	89
85	race-eat-play-z6t8so	t	1	\N	2	2017-07-31 07:10:28+00	2017-07-31 07:10:28+00	\N	90
86	race-eat-play-r0hws4	t	1	\N	2	2017-07-31 07:11:05+00	2017-07-31 07:11:05+00	\N	91
87	race-eat-play-D0FBhR	t	1	\N	2	2017-07-31 07:14:02+00	2017-07-31 07:14:02+00	\N	92
88	race-eat-play-ExC6tQ	t	1	\N	2	2017-07-31 07:15:33+00	2017-07-31 07:15:33+00	\N	93
89	race-eat-play-JYHgIV	t	1	\N	2	2017-07-31 07:20:12+00	2017-07-31 07:20:12+00	\N	94
90	race-eat-play-B1IVhj	t	1	\N	2	2017-07-31 07:21:05+00	2017-07-31 07:21:05+00	\N	95
91	race-eat-play-P6IZHB	t	1	\N	2	2017-07-31 07:22:41+00	2017-07-31 07:22:41+00	\N	96
92	race-eat-play-K6FZI3	t	1	\N	2	2017-07-31 07:23:27+00	2017-07-31 07:23:27+00	\N	97
93	race-eat-play-MJuvIG	t	1	\N	2	2017-07-31 07:26:17+00	2017-07-31 07:26:17+00	\N	98
94	race-eat-play-A1CEu8	t	1	\N	2	2017-07-31 07:27:04+00	2017-07-31 07:27:04+00	\N	99
95	race-eat-play-GvsqH0	t	1	\N	2	2017-07-31 07:27:44+00	2017-07-31 07:27:44+00	\N	100
96	race-eat-play-B6CVhv	t	1	\N	2	2017-07-31 07:28:27+00	2017-07-31 07:28:27+00	\N	101
97	race-eat-play-wpfGfR	t	1	\N	2	2017-07-31 07:38:50+00	2017-07-31 07:38:50+00	\N	102
98	race-eat-play-vghWh5	t	1	\N	2	2017-07-31 07:38:59+00	2017-07-31 07:38:59+00	\N	103
99	race-eat-play-qjh8fN	t	1	\N	2	2017-07-31 07:43:03+00	2017-07-31 07:43:03+00	\N	104
100	race-eat-play-y8hNhx	t	1	\N	2	2017-07-31 07:43:48+00	2017-07-31 07:43:48+00	\N	105
101	race-eat-play-oYhXhz	t	1	\N	2	2017-07-31 07:44:33+00	2017-07-31 07:44:33+00	\N	106
102	race-eat-play-DkfDIk	t	1	\N	2	2017-07-31 07:45:36+00	2017-07-31 07:45:36+00	\N	107
103	race-eat-play-D8C5f8	t	1	\N	2	2017-07-31 07:46:26+00	2017-07-31 07:46:26+00	\N	108
104	race-eat-play-BrtzIz	t	1	\N	2	2017-07-31 07:47:13+00	2017-07-31 07:47:13+00	\N	109
105	race-eat-play-DYHoil	t	1	\N	2	2017-07-31 07:51:31+00	2017-07-31 07:51:31+00	\N	110
106	race-eat-play-K8t4uQ	t	1	\N	2	2017-07-31 07:55:32+00	2017-07-31 07:55:32+00	\N	111
107	race-eat-play-y8h2CR	t	1	\N	2	2017-07-31 07:56:55+00	2017-07-31 07:56:55+00	\N	112
108	race-eat-play-G8CJhW	t	1	\N	2	2017-07-31 07:59:15+00	2017-07-31 07:59:15+00	\N	113
109	race-eat-play-A1CNf2	t	1	\N	2	2017-07-31 08:00:05+00	2017-07-31 08:00:05+00	\N	114
110	race-eat-play-APirsO	t	1	\N	2	2017-07-31 08:02:11+00	2017-07-31 08:02:11+00	\N	115
111	race-eat-play-APi1t2	t	1	\N	2	2017-07-31 08:03:02+00	2017-07-31 08:03:02+00	\N	116
112	race-eat-play-A8I9h9	t	1	\N	2	2017-07-31 08:03:46+00	2017-07-31 08:03:46+00	\N	117
113	race-eat-play-ANsnF9	t	1	\N	2	2017-07-31 08:04:36+00	2017-07-31 08:04:36+00	\N	118
115	race-eat-play-wjhvi8	t	1	\N	2	2017-07-31 08:08:18+00	2017-07-31 08:08:18+00	\N	120
116	race-eat-play-yPf0FR	t	1	\N	2	2017-07-31 08:30:34+00	2017-07-31 08:30:34+00	\N	121
117	race-eat-play-yri2CQ	t	1	\N	2	2017-07-31 08:32:02+00	2017-07-31 08:32:02+00	\N	122
118	race-eat-play-LJCwCK	t	1	\N	2	2017-07-31 08:32:47+00	2017-07-31 08:32:47+00	\N	123
119	race-eat-play-zKiRhV	t	1	\N	2	2017-07-31 08:33:41+00	2017-07-31 08:33:41+00	\N	124
120	race-eat-play-r8sriz	t	1	\N	2	2017-07-31 08:34:24+00	2017-07-31 08:34:24+00	\N	125
121	race-eat-play-A1CrsY	t	1	\N	2	2017-07-31 08:35:04+00	2017-07-31 08:35:04+00	\N	126
122	race-eat-play-OPuEIW	t	1	\N	2	2017-07-31 08:37:12+00	2017-07-31 08:37:12+00	\N	127
123	race-eat-play-JNuQtk	t	1	\N	2	2017-07-31 08:38:14+00	2017-07-31 08:38:14+00	\N	128
124	race-eat-play-JEIKuL	t	1	\N	2	2017-07-31 08:39:13+00	2017-07-31 08:39:13+00	\N	129
125	race-eat-play-DqtjsB	t	1	\N	2	2017-07-31 08:39:52+00	2017-07-31 08:39:52+00	\N	130
126	race-eat-play-E0uWh4	t	1	\N	2	2017-07-31 08:40:32+00	2017-07-31 08:40:32+00	\N	131
127	race-eat-play-Brt8uW	t	1	\N	2	2017-07-31 08:41:12+00	2017-07-31 08:41:12+00	\N	132
128	race-eat-play-GRtAuY	t	1	\N	2	2017-07-31 08:41:55+00	2017-07-31 08:41:55+00	\N	133
130	race-eat-play-xnsRC8	t	1	\N	2	2017-07-31 08:43:03+00	2017-07-31 08:43:03+00	\N	135
131	race-eat-play-xkfms2	t	1	\N	2	2017-07-31 08:46:25+00	2017-07-31 08:46:25+00	\N	136
132	race-eat-play-x1CJhY	t	1	\N	2	2017-07-31 08:47:53+00	2017-07-31 08:47:53+00	\N	137
133	race-eat-play-y8hJHM	t	1	\N	2	2017-07-31 10:16:25+00	2017-07-31 10:16:25+00	\N	138
134	race-eat-play-mwhjfG	t	1	\N	2	2017-07-31 14:06:15+00	2017-07-31 14:06:15+00	\N	139
135	1-BnF7fv	t	1	\N	2	2017-07-31 18:35:10+00	2017-07-31 18:35:10+00	\N	140
136	1-D0F3uA	t	1	\N	2	2017-07-31 18:35:11+00	2017-07-31 18:35:11+00	\N	141
137	1-r2tri7	t	1	\N	2	2017-07-31 18:35:11+00	2017-07-31 18:35:11+00	\N	142
138	1-A1CZiQ	t	1	\N	2	2017-07-31 18:35:12+00	2017-07-31 18:35:12+00	\N	143
139	1-y9uLuZ	t	1	\N	2	2017-07-31 18:35:12+00	2017-07-31 18:35:12+00	\N	144
140	1-KLuMCn	t	1	\N	2	2017-07-31 18:37:33+00	2017-07-31 18:37:33+00	\N	145
141	1-ExCnHw	t	1	\N	2	2017-08-02 00:54:41+00	2017-08-02 00:54:41+00	\N	146
142	1-J6fyHK	f	1	\N	2	2017-08-02 04:31:06+00	2017-08-03 09:37:46+00	\N	147
143	1-E0u6tB	t	1	\N	2	2017-08-02 04:36:48+00	2017-08-02 04:36:48+00	\N	148
144	1-x6tJhR	t	1	\N	2	2017-08-02 04:37:43+00	2017-08-02 04:37:43+00	\N	149
145	1-QNH3FO	t	1	\N	2	2017-08-02 04:39:23+00	2017-08-02 04:39:23+00	\N	150
146	1-q7sOhX	f	1	\N	2	2017-08-02 10:59:45+00	2017-08-02 11:31:28+00	\N	151
147	1-K6FZI3	t	1	\N	2	2017-08-02 11:13:58+00	2017-08-02 11:13:58+00	\N	152
148	1-E9ipuy	f	1	\N	2	2017-08-02 11:14:42+00	2017-08-02 12:52:48+00	\N	153
149	1-LJClIj	t	1	\N	2	2017-08-02 15:45:45+00	2017-08-02 15:45:45+00	\N	154
150	1-zXC4u4	t	1	\N	2	2017-08-02 15:46:41+00	2017-08-02 15:46:41+00	\N	155
151	1-z7u8sK	t	1	\N	2	2017-08-02 15:47:27+00	2017-08-02 15:47:27+00	\N	156
152	1-G8CJhW	t	1	\N	2	2017-08-02 15:49:09+00	2017-08-02 15:49:09+00	\N	157
153	1-N0CEFy	t	1	\N	2	2017-08-02 15:49:59+00	2017-08-02 15:49:59+00	\N	158
154	1-KAI2fQ	t	1	\N	2	2017-08-02 15:50:42+00	2017-08-02 15:50:42+00	\N	159
155	1-GZhqHY	t	1	\N	2	2017-08-02 15:51:28+00	2017-08-02 15:51:28+00	\N	160
156	1-A1CNf2	t	1	\N	2	2017-08-02 15:52:14+00	2017-08-02 15:52:14+00	\N	161
157	1-MwsvIO	t	1	\N	2	2017-08-02 15:52:59+00	2017-08-02 15:52:59+00	\N	162
158	1-KAI4up	t	1	\N	2	2017-08-02 15:53:48+00	2017-08-02 15:53:48+00	\N	163
159	1-B6C8uN	t	1	\N	2	2017-08-02 15:54:39+00	2017-08-02 15:54:39+00	\N	164
160	1-ADf1tB	t	1	\N	2	2017-08-03 00:36:05+00	2017-08-03 00:36:05+00	\N	165
161	1-E0u0CZ	t	1	\N	2	2017-08-03 04:28:08+00	2017-08-03 04:28:08+00	\N	166
162	1-xnsLiR	t	1	\N	2	2017-08-03 06:17:42+00	2017-08-03 06:17:42+00	\N	167
163	1-N8Fju8	t	1	\N	2	2017-08-03 13:24:43+00	2017-08-03 13:24:43+00	\N	168
164	1-ADfVHQ	t	1	\N	2	2017-08-03 14:19:23+00	2017-08-03 14:19:23+00	\N	169
165	1-wKuviq	t	1	\N	2	2017-08-03 14:20:02+00	2017-08-03 14:20:02+00	\N	170
166	1-xkf1f7	t	1	\N	2	2017-08-03 14:20:50+00	2017-08-03 14:20:50+00	\N	171
167	1-JQCBiK	t	1	\N	2	2017-08-03 14:21:32+00	2017-08-03 14:21:32+00	\N	172
168	1-voi7f5	t	1	\N	2	2017-08-03 14:22:06+00	2017-08-03 14:22:06+00	\N	173
169	1-BNsMFj	t	1	\N	2	2017-08-03 14:23:06+00	2017-08-03 14:23:06+00	\N	174
170	1-KYH4uG	t	1	\N	2	2017-08-03 14:23:46+00	2017-08-03 14:23:46+00	\N	175
172	1-APilCQ	t	1	\N	2	2017-08-03 14:25:20+00	2017-08-03 14:25:20+00	\N	177
173	1-A8IZi8	t	1	\N	2	2017-08-03 14:26:00+00	2017-08-03 14:26:00+00	\N	178
174	1-JPFpsy	t	1	\N	2	2017-08-03 14:26:40+00	2017-08-03 14:26:40+00	\N	179
175	1-KQC4un	t	1	\N	2	2017-08-03 14:27:24+00	2017-08-03 14:27:24+00	\N	180
176	1-DqtjsB	t	1	\N	2	2017-08-03 14:28:06+00	2017-08-03 14:28:06+00	\N	181
177	1-MEHRF1	t	1	\N	2	2017-08-03 14:28:40+00	2017-08-03 14:28:40+00	\N	182
178	1-A6t9hO	t	1	\N	2	2017-08-03 14:29:14+00	2017-08-03 14:29:14+00	\N	183
179	1-ymF7iM	t	1	\N	2	2017-08-03 14:30:19+00	2017-08-03 14:30:19+00	\N	184
180	1-yri2CQ	t	1	\N	2	2017-08-03 14:30:57+00	2017-08-03 14:30:57+00	\N	185
181	1-NEH9H0	t	1	\N	2	2017-08-03 14:31:42+00	2017-08-03 14:31:42+00	\N	186
183	1-K8t9Ho	t	1	\N	2	2017-08-03 14:32:55+00	2017-08-03 14:32:55+00	\N	188
184	1-o2frf6	t	1	\N	2	2017-08-03 14:33:35+00	2017-08-03 14:33:35+00	\N	189
185	1-x6t1fW	t	1	\N	2	2017-08-03 14:34:15+00	2017-08-03 14:34:15+00	\N	190
186	1-z6twCX	t	1	\N	2	2017-08-03 14:35:05+00	2017-08-03 14:35:05+00	\N	191
187	1-LYHmFj	t	1	\N	2	2017-08-03 14:35:49+00	2017-08-03 14:35:49+00	\N	192
188	1-GZhOCW	t	1	\N	2	2017-08-03 14:36:35+00	2017-08-03 14:36:35+00	\N	193
189	1-BPuAHz	t	1	\N	2	2017-08-03 14:37:10+00	2017-08-03 14:37:10+00	\N	194
190	1-znFMfo	t	1	\N	2	2017-08-03 14:37:45+00	2017-08-03 14:37:45+00	\N	195
191	1-wjhAFV	t	1	\N	2	2017-08-03 14:38:26+00	2017-08-03 14:38:26+00	\N	196
192	1-G9FLt0	t	1	\N	2	2017-08-03 14:39:03+00	2017-08-03 14:39:03+00	\N	197
193	1-Dkf3un	t	1	\N	2	2017-08-03 14:39:36+00	2017-08-03 14:39:36+00	\N	198
194	1-zvsRhM	t	1	\N	2	2017-08-03 14:40:31+00	2017-08-03 14:40:31+00	\N	199
195	1-D8COtl	t	1	\N	2	2017-08-03 14:41:06+00	2017-08-03 14:41:06+00	\N	200
196	1-A6tNfB	t	1	\N	2	2017-08-03 14:41:40+00	2017-08-03 14:41:40+00	\N	201
197	1-LYHwCg	t	1	\N	2	2017-08-03 14:44:55+00	2017-08-03 14:44:55+00	\N	202
199	1-Dqt3uk	t	1	\N	2	2017-08-03 14:46:00+00	2017-08-03 14:46:00+00	\N	204
200	1-EPFnHN	t	1	\N	2	2017-08-03 14:46:39+00	2017-08-03 14:46:39+00	\N	205
201	1-DRhDIl	t	1	\N	2	2017-08-03 14:47:19+00	2017-08-03 14:47:19+00	\N	206
202	1-LJCYt5	t	1	\N	2	2017-08-03 14:47:55+00	2017-08-03 14:47:55+00	\N	207
203	1-nZhGh9	t	1	\N	2	2017-08-03 14:48:35+00	2017-08-03 14:48:35+00	\N	208
204	1-JPFACv	t	1	\N	2	2017-08-03 14:49:21+00	2017-08-03 14:49:50+00	\N	209
205	1-v2fytA	t	1	\N	2	2017-08-03 14:50:33+00	2017-08-03 14:50:33+00	\N	210
207	1-rmuAh7	t	1	\N	2	2017-08-03 14:52:04+00	2017-08-03 14:52:04+00	\N	212
208	1-NOtwIy	t	1	\N	2	2017-08-03 14:52:52+00	2017-08-03 14:52:52+00	\N	213
209	1-DRhnFR	t	1	\N	2	2017-08-03 14:53:34+00	2017-08-03 14:53:34+00	\N	214
210	1-JZh1FK	t	1	\N	2	2017-08-03 14:54:13+00	2017-08-03 14:54:13+00	\N	215
211	1-A8INfY	t	1	\N	2	2017-08-03 14:54:49+00	2017-08-03 14:54:49+00	\N	216
212	1-vQtEiX	t	1	\N	2	2017-08-03 14:55:28+00	2017-08-03 14:55:28+00	\N	217
213	1-OPuEIW	t	1	\N	2	2017-08-03 14:56:12+00	2017-08-03 14:56:12+00	\N	218
214	1-zKiOI4	t	1	\N	2	2017-08-03 14:56:48+00	2017-08-03 14:56:48+00	\N	219
215	1-DqtJCl	t	1	\N	2	2017-08-03 14:57:23+00	2017-08-03 14:57:23+00	\N	220
216	1-DYHjsZ	t	1	\N	2	2017-08-03 14:57:54+00	2017-08-03 14:57:54+00	\N	221
217	1-GvsAur	t	1	\N	2	2017-08-03 14:58:30+00	2017-08-03 14:58:30+00	\N	222
218	1-OEH0Fj	t	1	\N	2	2017-08-03 14:59:03+00	2017-08-03 14:59:03+00	\N	223
219	1-JEIACz	t	1	\N	2	2017-08-03 14:59:40+00	2017-08-03 14:59:40+00	\N	224
220	1-JZhgIy	t	1	\N	2	2017-08-03 15:00:23+00	2017-08-03 15:00:23+00	\N	225
221	1-yriytN	t	1	\N	2	2017-08-03 15:01:13+00	2017-08-03 15:01:13+00	\N	226
223	1-ANsEuQ	t	1	\N	2	2017-08-03 15:02:28+00	2017-08-03 15:02:28+00	\N	228
224	1-OEHvuw	t	1	\N	2	2017-08-03 15:03:11+00	2017-08-03 15:03:11+00	\N	229
226	1-N8FPCy	t	1	\N	2	2017-08-03 15:04:31+00	2017-08-03 15:04:31+00	\N	231
227	1-wmiLh8	t	1	\N	2	2017-08-03 15:05:14+00	2017-08-03 15:05:14+00	\N	232
228	1-yXC6sM	t	1	\N	2	2017-08-03 15:05:55+00	2017-08-03 15:05:55+00	\N	233
229	1-E0u1sx	t	1	\N	2	2017-08-03 15:06:34+00	2017-08-03 15:06:34+00	\N	234
230	1-EPFWhx	t	1	\N	2	2017-08-03 15:07:11+00	2017-08-03 15:07:11+00	\N	235
232	1-zmhnHg	t	1	\N	2	2017-08-03 15:08:17+00	2017-08-03 15:08:17+00	\N	237
233	1-APiGI8	t	1	\N	2	2017-08-03 15:09:07+00	2017-08-03 15:09:07+00	\N	238
234	1-J8tKuk	t	1	\N	2	2017-08-03 15:09:46+00	2017-08-03 15:09:46+00	\N	239
235	1-n5f7fN	t	1	\N	2	2017-08-03 15:10:20+00	2017-08-03 15:10:20+00	\N	240
236	1-K6FBFp	t	1	\N	2	2017-08-03 15:11:34+00	2017-08-03 15:11:34+00	\N	241
237	1-mwhjfG	t	1	\N	2	2017-08-03 15:12:10+00	2017-08-03 15:12:10+00	\N	242
238	1-rkfnC7	t	1	\N	2	2017-08-03 15:12:54+00	2017-08-03 15:12:54+00	\N	243
239	1-D1sjs8	t	1	\N	2	2017-08-03 15:13:33+00	2017-08-03 15:13:33+00	\N	244
240	1-NYuEF8	t	1	\N	2	2017-08-03 15:14:08+00	2017-08-03 15:14:08+00	\N	245
241	1-DkfJC8	t	1	\N	2	2017-08-03 15:14:43+00	2017-08-03 15:14:43+00	\N	246
242	1-AmFZiY	t	1	\N	2	2017-08-03 15:15:23+00	2017-08-03 15:15:23+00	\N	247
243	1-yriJHZ	t	1	\N	2	2017-08-03 15:21:30+00	2017-08-03 15:21:30+00	\N	248
244	1-LYHki5	t	1	\N	2	2017-08-04 01:54:54+00	2017-08-04 01:54:54+00	\N	249
245	1-PMHJIB	t	1	\N	2	2017-08-04 01:55:27+00	2017-08-04 01:55:27+00	\N	250
246	1-N8F9Hz	t	1	\N	2	2017-08-04 01:56:01+00	2017-08-04 01:56:01+00	\N	251
247	1-APirsO	t	1	\N	2	2017-08-04 01:56:37+00	2017-08-04 01:56:37+00	\N	252
248	1-EZH1sZ	t	1	\N	2	2017-08-04 01:57:13+00	2017-08-04 01:57:13+00	\N	253
249	1-yPfytP	t	1	\N	2	2017-08-04 01:57:51+00	2017-08-04 01:57:51+00	\N	254
250	1-zpf8sV	t	1	\N	2	2017-08-04 01:58:24+00	2017-08-04 01:58:24+00	\N	255
251	1-OEHZCW	t	1	\N	2	2017-08-04 01:58:56+00	2017-08-04 01:58:56+00	\N	256
252	1-LvuwC1	t	1	\N	2	2017-08-04 01:59:24+00	2017-08-04 01:59:24+00	\N	257
253	1-KYHMCp	t	1	\N	2	2017-08-04 01:59:59+00	2017-08-04 01:59:59+00	\N	258
255	1-G8CLt1	t	1	\N	2	2017-08-04 02:01:03+00	2017-08-04 02:01:03+00	\N	260
256	1-q7s8fQ	t	1	\N	2	2017-08-04 02:01:33+00	2017-08-04 02:01:33+00	\N	261
258	1-oQirfz	t	1	\N	2	2017-08-04 02:02:21+00	2017-08-04 02:02:21+00	\N	263
260	1-EPF3fy	t	1	\N	2	2017-08-04 02:04:05+00	2017-08-04 02:04:05+00	\N	265
261	1-GYHBi1	t	1	\N	2	2017-08-04 02:04:39+00	2017-08-04 02:04:39+00	\N	266
262	1-B8HPsN	t	1	\N	2	2017-08-04 02:05:18+00	2017-08-04 02:05:18+00	\N	267
263	1-E9i6t4	t	1	\N	2	2017-08-04 02:05:48+00	2017-08-04 02:05:48+00	\N	268
264	1-rRi8fj	t	1	\N	2	2017-08-04 02:06:21+00	2017-08-04 02:06:21+00	\N	269
265	1-JqigIp	t	1	\N	2	2017-08-04 02:06:51+00	2017-08-04 02:06:51+00	\N	270
266	1-xlF1fY	t	1	\N	2	2017-08-04 02:07:49+00	2017-08-04 02:07:49+00	\N	271
267	1-LYHQur	t	1	\N	2	2017-08-04 02:08:21+00	2017-08-04 02:08:21+00	\N	272
268	1-O8CwHW	t	1	\N	2	2017-08-04 02:08:53+00	2017-08-04 02:08:53+00	\N	273
269	1-vZCWhQ	t	1	\N	2	2017-08-04 02:09:21+00	2017-08-04 02:09:21+00	\N	274
270	1-z6tmtK	t	1	\N	2	2017-08-04 02:09:54+00	2017-08-04 02:09:54+00	\N	275
271	1-QNHJIQ	t	1	\N	2	2017-08-04 02:10:24+00	2017-08-04 02:10:24+00	\N	276
272	1-D8CJCA	t	1	\N	2	2017-08-04 02:10:55+00	2017-08-04 02:10:55+00	\N	277
273	1-zqIGi4	t	1	\N	2	2017-08-04 02:11:27+00	2017-08-04 02:11:27+00	\N	278
274	1-xvi1fg	t	1	\N	2	2017-08-04 02:11:55+00	2017-08-04 02:11:55+00	\N	279
275	1-v2fLCX	t	1	\N	2	2017-08-04 02:12:27+00	2017-08-04 02:12:27+00	\N	280
277	1-KQCBFG	t	1	\N	2	2017-08-04 02:13:20+00	2017-08-04 02:13:20+00	\N	282
278	1-ElhnHB	t	1	\N	2	2017-08-04 02:14:02+00	2017-08-04 02:14:02+00	\N	283
279	1-AnhrsB	t	1	\N	2	2017-08-04 02:14:54+00	2017-08-04 02:14:54+00	\N	284
280	1-BBf8u7	t	1	\N	2	2017-08-04 02:15:31+00	2017-08-04 02:15:31+00	\N	285
281	1-JYHyHG	t	1	\N	2	2017-08-04 02:16:01+00	2017-08-04 02:16:01+00	\N	286
282	1-r0h2u7	t	1	\N	2	2017-08-04 02:16:34+00	2017-08-04 02:16:34+00	\N	287
283	1-MJuvIG	t	1	\N	2	2017-08-04 02:17:40+00	2017-08-04 02:17:40+00	\N	288
284	1-v8u7fz	t	1	\N	2	2017-08-04 02:18:13+00	2017-08-04 02:18:13+00	\N	289
285	1-z6txF4	t	1	\N	2	2017-08-04 02:18:45+00	2017-08-04 02:18:45+00	\N	290
286	1-M9FRFG	t	1	\N	2	2017-08-04 02:19:50+00	2017-08-04 02:19:50+00	\N	291
288	1-JPF8hK	t	1	\N	2	2017-08-04 02:20:44+00	2017-08-04 02:20:44+00	\N	293
289	1-G9FqH7	t	1	\N	2	2017-08-04 02:21:45+00	2017-08-04 02:21:45+00	\N	294
290	1-KAIDin	t	1	\N	2	2017-08-04 02:22:14+00	2017-08-04 02:22:14+00	\N	295
291	1-p8snfD	t	1	\N	2	2017-08-04 03:12:13+00	2017-08-04 03:12:13+00	\N	296
293	1-J8tACy	t	1	\N	2	2017-08-04 03:54:21+00	2017-08-04 03:54:21+00	\N	298
295	1-KAI8so	t	1	\N	2	2017-08-04 03:58:29+00	2017-08-04 03:58:29+00	\N	300
296	1-P6INCm	t	1	\N	2	2017-08-04 03:59:29+00	2017-08-04 03:59:29+00	\N	301
297	1-xkfRCw	t	1	\N	2	2017-08-04 04:00:03+00	2017-08-04 04:00:03+00	\N	302
298	1-QOFJIG	t	1	\N	2	2017-08-04 04:02:36+00	2017-08-04 04:02:36+00	\N	303
299	1-EPFgFw	t	1	\N	2	2017-08-04 04:03:54+00	2017-08-04 04:03:54+00	\N	304
300	1-GRtAuY	t	1	\N	2	2017-08-04 04:04:03+00	2017-08-04 04:04:03+00	\N	305
302	1-r0hDtz	t	1	\N	2	2017-08-04 04:07:02+00	2017-08-04 04:07:02+00	\N	307
303	1-K1s9Hn	t	1	\N	2	2017-08-04 04:07:43+00	2017-08-04 04:07:43+00	\N	308
305	1-JqiACK	t	1	\N	2	2017-08-04 04:09:17+00	2017-08-04 04:09:17+00	\N	310
306	1-A1CEu8	t	1	\N	2	2017-08-04 04:11:16+00	2017-08-04 04:11:16+00	\N	311
307	1-ElhgFx	t	1	\N	2	2017-08-04 04:11:59+00	2017-08-04 04:11:59+00	\N	312
308	1-B8Hlt6	t	1	\N	2	2017-08-04 04:12:28+00	2017-08-04 04:12:28+00	\N	313
309	1-JEIQtv	t	1	\N	2	2017-08-04 04:13:08+00	2017-08-04 04:13:08+00	\N	314
310	1-JQCKup	t	1	\N	2	2017-08-04 04:14:02+00	2017-08-04 04:14:02+00	\N	315
311	1-DkfnFB	t	1	\N	2	2017-08-04 04:14:22+00	2017-08-04 04:14:22+00	\N	316
312	1-vlsWhA	t	1	\N	2	2017-08-04 04:15:11+00	2017-08-04 04:15:11+00	\N	317
313	1-J8t1Fp	t	1	\N	2	2017-08-04 04:15:38+00	2017-08-04 04:15:38+00	\N	318
314	1-AmFNfM	t	1	\N	2	2017-08-04 04:18:28+00	2017-08-04 04:18:28+00	\N	319
315	1-pZtnfP	t	1	\N	2	2017-08-04 04:18:52+00	2017-08-04 04:18:52+00	\N	320
317	1-M7IRFQ	t	1	\N	2	2017-08-04 04:20:31+00	2017-08-04 04:20:31+00	\N	322
318	1-zvsGiB	t	1	\N	2	2017-08-04 04:20:40+00	2017-08-04 04:20:40+00	\N	323
319	1-A1C9hM	t	1	\N	2	2017-08-04 04:21:18+00	2017-08-04 04:21:18+00	\N	324
322	1-BnF8u6	t	1	\N	2	2017-08-04 04:22:02+00	2017-08-04 04:22:02+00	\N	327
323	1-wmiVCV	t	1	\N	2	2017-08-04 04:22:28+00	2017-08-04 04:22:28+00	\N	328
324	1-LZtlIr	t	1	\N	2	2017-08-04 04:23:04+00	2017-08-04 04:23:04+00	\N	329
325	1-DRhJCB	t	1	\N	2	2017-08-04 04:23:06+00	2017-08-04 04:23:06+00	\N	330
326	1-MJu9HP	t	1	\N	2	2017-08-04 04:23:09+00	2017-08-04 04:23:09+00	\N	331
327	1-z7uGio	t	1	\N	2	2017-08-04 04:24:05+00	2017-08-04 04:24:05+00	\N	332
329	1-qxf8fr	t	1	\N	2	2017-08-04 04:24:34+00	2017-08-04 04:24:34+00	\N	334
330	1-zpf4uB	t	1	\N	2	2017-08-04 04:24:59+00	2017-08-04 04:24:59+00	\N	335
331	1-zKiwCK	t	1	\N	2	2017-08-04 04:25:32+00	2017-08-04 04:25:32+00	\N	336
332	1-GMuBiW	t	1	\N	2	2017-08-04 04:26:02+00	2017-08-04 04:26:02+00	\N	337
333	1-xkfBHv	t	1	\N	2	2017-08-04 04:26:59+00	2017-08-04 04:26:59+00	\N	338
336	1-Bghlt7	t	1	\N	2	2017-08-04 04:30:34+00	2017-08-04 04:30:34+00	\N	341
337	1-ElhkIQ	t	1	\N	2	2017-08-04 04:30:35+00	2017-08-04 04:30:35+00	\N	342
338	1-qYi8fE	t	1	\N	2	2017-08-04 04:31:36+00	2017-08-04 04:31:36+00	\N	343
339	1-vlsEiz	t	1	\N	2	2017-08-04 04:32:21+00	2017-08-04 04:32:21+00	\N	344
340	1-y9u6sQ	t	1	\N	2	2017-08-04 04:32:57+00	2017-08-04 04:32:57+00	\N	345
341	1-BPuRCN	t	1	\N	2	2017-08-04 04:33:32+00	2017-08-04 04:33:32+00	\N	346
343	1-r0hws4	t	1	\N	2	2017-08-04 04:34:06+00	2017-08-04 04:34:06+00	\N	348
345	1-AQHrs8	t	1	\N	2	2017-08-04 04:35:41+00	2017-08-04 04:35:41+00	\N	350
346	1-GZh0Fr	t	1	\N	2	2017-08-04 04:35:43+00	2017-08-04 04:35:43+00	\N	351
347	1-xoI1f8	t	1	\N	2	2017-08-04 04:36:16+00	2017-08-04 04:36:16+00	\N	352
348	1-ExC3f4	t	1	\N	2	2017-08-04 04:36:41+00	2017-08-04 04:36:41+00	\N	353
349	1-ypINhZ	t	1	\N	2	2017-08-04 04:37:05+00	2017-08-04 04:37:05+00	\N	354
350	1-EPFliB	t	1	\N	2	2017-08-04 04:37:18+00	2017-08-04 04:37:18+00	\N	355
351	1-BrtVh7	t	1	\N	2	2017-08-04 04:37:55+00	2017-08-04 04:37:55+00	\N	356
353	1-y8hAIZ	t	1	\N	2	2017-08-04 04:39:17+00	2017-08-04 04:39:17+00	\N	358
354	1-D0FnFW	t	1	\N	2	2017-08-04 04:39:37+00	2017-08-04 04:39:37+00	\N	359
355	1-LvumFK	t	1	\N	2	2017-08-04 04:40:22+00	2017-08-04 04:40:22+00	\N	360
356	1-z7umtg	t	1	\N	2	2017-08-04 04:41:04+00	2017-08-04 04:41:04+00	\N	361
357	1-GvsLtW	t	1	\N	2	2017-08-04 04:41:36+00	2017-08-04 04:41:36+00	\N	362
358	1-OZFEIA	t	1	\N	2	2017-08-04 04:41:38+00	2017-08-04 04:41:38+00	\N	363
359	1-GwI1fY	t	1	\N	2	2017-08-04 04:42:14+00	2017-08-04 04:42:14+00	\N	364
360	1-y8hLuN	t	1	\N	2	2017-08-04 04:42:33+00	2017-08-04 04:42:33+00	\N	365
361	1-p8szhP	t	1	\N	2	2017-08-04 04:42:38+00	2017-08-04 04:42:38+00	\N	366
363	1-GMu0Fk	t	1	\N	2	2017-08-04 04:43:35+00	2017-08-04 04:43:35+00	\N	368
366	1-MZtvIP	t	1	\N	2	2017-08-04 04:44:50+00	2017-08-04 04:44:50+00	\N	371
367	1-KLu4u2	t	1	\N	2	2017-08-04 04:46:04+00	2017-08-04 04:46:04+00	\N	372
368	1-JYHKuv	t	1	\N	2	2017-08-04 04:46:17+00	2017-08-04 04:46:17+00	\N	373
369	1-x6tLiw	t	1	\N	2	2017-08-04 04:49:10+00	2017-08-04 04:49:10+00	\N	374
370	1-ywt6sR	t	1	\N	2	2017-08-04 04:50:28+00	2017-08-04 04:50:28+00	\N	375
371	1-zmhOIX	t	1	\N	2	2017-08-04 04:50:28+00	2017-08-04 04:50:28+00	\N	376
372	1-JQCACO	t	1	\N	2	2017-08-04 04:50:34+00	2017-08-04 04:50:34+00	\N	377
373	1-oQiXh1	t	1	\N	2	2017-08-04 04:51:48+00	2017-08-04 04:51:48+00	\N	378
374	1-x2uQt8	t	1	\N	2	2017-08-04 04:54:19+00	2017-08-04 04:54:19+00	\N	379
376	1-APiZiB	t	1	\N	2	2017-08-04 04:56:11+00	2017-08-04 04:56:11+00	\N	381
377	1-znFRhK	t	1	\N	2	2017-08-04 04:56:52+00	2017-08-04 04:56:52+00	\N	382
380	1-EZHliQ	t	1	\N	2	2017-08-04 04:58:07+00	2017-08-04 04:58:07+00	\N	385
381	1-OJI0FA	t	1	\N	2	2017-08-04 04:58:26+00	2017-08-04 04:58:26+00	\N	386
382	1-OJIEIP	t	1	\N	2	2017-08-04 04:59:44+00	2017-08-04 04:59:44+00	\N	387
383	1-rkfrij	t	1	\N	2	2017-08-04 04:59:45+00	2017-08-04 04:59:45+00	\N	388
384	1-G5iOCr	t	1	\N	2	2017-08-04 05:01:51+00	2017-08-04 05:01:51+00	\N	389
385	1-AMuZiM	t	1	\N	2	2017-08-04 05:02:08+00	2017-08-04 05:02:08+00	\N	390
386	1-G9FBiY	t	1	\N	2	2017-08-04 05:02:15+00	2017-08-04 05:02:15+00	\N	391
387	1-JZhyHk	t	1	\N	2	2017-08-04 05:03:16+00	2017-08-04 05:03:16+00	\N	392
388	1-E9i0Cx	t	1	\N	2	2017-08-04 05:03:43+00	2017-08-04 05:03:43+00	\N	393
389	1-yosLuQ	t	1	\N	2	2017-08-04 05:03:51+00	2017-08-04 05:03:51+00	\N	394
390	1-D8C3uZ	t	1	\N	2	2017-08-04 05:06:09+00	2017-08-04 05:06:09+00	\N	395
391	1-GYHAuQ	t	1	\N	2	2017-08-04 05:06:53+00	2017-08-04 05:06:53+00	\N	396
392	1-w0tRtV	t	1	\N	2	2017-08-04 05:07:01+00	2017-08-04 05:07:01+00	\N	397
393	1-yPfAIM	t	1	\N	2	2017-08-04 05:07:20+00	2017-08-04 05:07:20+00	\N	398
394	1-K6F8s2	t	1	\N	2	2017-08-04 05:08:11+00	2017-08-04 05:08:11+00	\N	399
395	1-EKI1sP	t	1	\N	2	2017-08-04 05:08:30+00	2017-08-04 05:08:30+00	\N	400
397	1-JEI8hy	t	1	\N	2	2017-08-04 05:09:32+00	2017-08-04 05:09:32+00	\N	402
398	1-DQunFA	t	1	\N	2	2017-08-04 05:09:45+00	2017-08-04 05:09:45+00	\N	403
399	1-G9F0Fp	t	1	\N	2	2017-08-04 05:10:47+00	2017-08-04 05:10:47+00	\N	404
400	1-zBH8s4	t	1	\N	2	2017-08-04 05:10:58+00	2017-08-04 05:10:58+00	\N	405
401	1-KYHrto	t	1	\N	2	2017-08-04 05:11:01+00	2017-08-04 05:11:01+00	\N	406
405	1-APiEuM	t	1	\N	2	2017-08-04 05:14:48+00	2017-08-04 05:14:48+00	\N	410
407	1-APiVH9	t	1	\N	2	2017-08-04 05:15:27+00	2017-08-04 05:15:27+00	\N	412
408	1-yrirfx	t	1	\N	2	2017-08-04 05:18:25+00	2017-08-04 05:18:25+00	\N	413
409	1-y8h2CR	t	1	\N	2	2017-08-04 05:19:33+00	2017-08-04 05:19:33+00	\N	414
410	1-GYHWs0	t	1	\N	2	2017-08-04 05:20:00+00	2017-08-04 05:20:00+00	\N	415
411	1-w0tLhK	t	1	\N	2	2017-08-04 05:21:48+00	2017-08-04 05:21:48+00	\N	416
412	1-Eqt6tx	t	1	\N	2	2017-08-04 05:22:31+00	2017-08-04 05:22:31+00	\N	417
413	1-BNsltv	t	1	\N	2	2017-08-04 05:25:16+00	2017-08-04 05:25:16+00	\N	418
414	1-QNH9HG	t	1	\N	2	2017-08-04 05:26:03+00	2017-08-04 05:26:03+00	\N	419
415	1-M7IzuG	t	1	\N	2	2017-08-04 05:26:38+00	2017-08-04 05:26:38+00	\N	420
417	1-B8HDij	t	1	\N	2	2017-08-04 05:26:52+00	2017-08-04 05:26:52+00	\N	422
418	1-M1CRFP	t	1	\N	2	2017-08-04 05:28:10+00	2017-08-04 05:28:10+00	\N	423
419	1-ERfgFy	t	1	\N	2	2017-08-04 05:29:01+00	2017-08-04 05:29:01+00	\N	424
420	1-xviJh2	t	1	\N	2	2017-08-04 05:29:02+00	2017-08-04 05:29:02+00	\N	425
421	1-ymF6sZ	t	1	\N	2	2017-08-04 05:34:01+00	2017-08-04 05:34:01+00	\N	426
422	1-JYHgIV	t	1	\N	2	2017-08-04 05:34:01+00	2017-08-04 05:34:01+00	\N	427
423	1-B6CPsW	t	1	\N	2	2017-08-04 05:34:58+00	2017-08-04 05:34:58+00	\N	428
425	1-DQujsR	t	1	\N	2	2017-08-04 05:36:42+00	2017-08-04 05:36:42+00	\N	430
426	1-LYHXHm	t	1	\N	2	2017-08-04 05:37:25+00	2017-08-04 05:37:25+00	\N	431
427	1-M1CzuR	t	1	\N	2	2017-08-04 05:37:31+00	2017-08-04 05:37:31+00	\N	432
428	1-vlsOsX	t	1	\N	2	2017-08-04 05:37:50+00	2017-08-04 05:37:50+00	\N	433
429	1-zvsxFX	t	1	\N	2	2017-08-04 05:38:46+00	2017-08-04 05:38:46+00	\N	434
430	1-GYH0F7	t	1	\N	2	2017-08-04 05:38:50+00	2017-08-04 05:38:50+00	\N	435
431	1-M7I6tP	t	1	\N	2	2017-08-04 05:40:13+00	2017-08-04 05:40:13+00	\N	436
433	1-PQCZHW	t	1	\N	2	2017-08-04 05:40:20+00	2017-08-04 05:40:20+00	\N	438
434	1-pQinfY	t	1	\N	2	2017-08-04 05:42:45+00	2017-08-04 05:42:45+00	\N	439
435	1-rkf2uz	t	1	\N	2	2017-08-04 05:43:48+00	2017-08-04 05:43:48+00	\N	440
436	1-rRiDt7	t	1	\N	2	2017-08-04 05:44:37+00	2017-08-04 05:44:37+00	\N	441
437	1-LPFYt1	t	1	\N	2	2017-08-04 05:54:10+00	2017-08-04 05:54:10+00	\N	442
439	1-ANsrs2	t	1	\N	2	2017-08-04 05:54:33+00	2017-08-04 05:54:33+00	\N	444
440	1-KYHZIv	t	1	\N	2	2017-08-04 05:54:59+00	2017-08-04 05:54:59+00	\N	445
442	1-E0uWh4	t	1	\N	2	2017-08-04 05:56:54+00	2017-08-04 05:56:54+00	\N	447
443	1-wjhVCq	t	1	\N	2	2017-08-04 05:58:27+00	2017-08-04 05:58:27+00	\N	448
444	1-DqtnFZ	t	1	\N	2	2017-08-04 05:58:35+00	2017-08-04 05:58:35+00	\N	449
445	1-xviLiW	f	1	\N	2	2017-08-04 07:09:22+00	2017-08-04 07:09:26+00	\N	450
448	1-B6CVhv	t	1	\N	2	2017-08-04 15:22:42+00	2017-08-04 15:22:42+00	\N	453
449	1-KYH9H3	t	1	\N	2	2017-08-05 15:22:36+00	2017-08-05 15:22:36+00	\N	454
451	1-x2u1fR	t	1	\N	2	2017-08-05 15:26:39+00	2017-08-05 15:26:39+00	\N	456
453	1-yosrfy	t	1	\N	2	2017-08-06 06:22:26+00	2017-08-06 06:22:26+00	\N	458
454	1-qxf7tX	t	1	\N	2	2017-08-06 07:24:35+00	2017-08-06 07:24:35+00	\N	459
456	1-N0CwIz	t	1	\N	2	2017-08-06 15:30:19+00	2017-08-06 15:30:19+00	\N	461
457	1-KQCrt2	t	1	\N	2	2017-08-06 15:31:31+00	2017-08-06 15:31:31+00	\N	462
459	1-DQu3ul	t	1	\N	2	2017-08-07 14:12:04+00	2017-08-07 14:12:04+00	\N	464
460	1-KOhZI2	t	1	\N	2	2017-08-08 03:35:05+00	2017-08-08 03:35:05+00	\N	465
461	1-MJukCR	t	1	\N	2	2017-08-08 03:52:47+00	2017-08-08 03:52:47+00	\N	466
462	1-M9FzuO	t	1	\N	2	2017-08-08 03:53:46+00	2017-08-08 03:53:46+00	\N	467
463	1-D0FJC5	t	1	\N	2	2017-08-08 04:29:18+00	2017-08-08 04:29:18+00	\N	468
465	1-P6IZHB	t	1	\N	2	2017-08-08 04:32:44+00	2017-08-08 04:32:44+00	\N	470
466	1-K6FMCG	t	1	\N	2	2017-08-08 05:02:42+00	2017-08-08 05:02:42+00	\N	471
467	1-A6tZi2	t	1	\N	2	2017-08-08 05:21:18+00	2017-08-08 05:21:18+00	\N	472
469	1-wjhLhx	t	1	\N	2	2017-08-08 08:05:12+00	2017-08-08 08:05:12+00	\N	474
470	1-DqtOtR	t	1	\N	2	2017-08-08 09:29:18+00	2017-08-08 09:29:18+00	\N	475
471	1-JQCyHL	t	1	\N	2	2017-08-08 09:58:32+00	2017-08-08 09:58:32+00	\N	476
473	1-ADfnFM	t	1	\N	2	2017-08-08 12:37:46+00	2017-08-08 12:37:46+00	\N	478
475	1-y9u7iR	t	1	\N	2	2017-08-08 12:51:54+00	2017-08-08 12:51:54+00	\N	480
476	1-v2fEi5	t	1	\N	2	2017-08-08 13:05:00+00	2017-08-08 13:05:00+00	\N	481
478	1-QAI3FG	t	1	\N	2	2017-08-08 13:14:29+00	2017-08-08 13:14:29+00	\N	483
480	1-vls7fo	t	1	\N	2	2017-08-08 13:25:10+00	2017-08-08 13:25:10+00	\N	485
481	1-yos7iA	t	1	\N	2	2017-08-08 13:25:56+00	2017-08-08 13:25:56+00	\N	486
482	1-vlsytQ	t	1	\N	2	2017-08-08 14:04:55+00	2017-08-08 14:04:55+00	\N	487
483	1-LPFmFg	t	1	\N	2	2017-08-08 14:10:38+00	2017-08-08 14:10:38+00	\N	488
486	1-A6trsM	t	1	\N	2	2017-08-08 14:15:02+00	2017-08-08 14:15:02+00	\N	491
487	1-wVsGf8	t	1	\N	2	2017-08-09 07:04:59+00	2017-08-09 07:04:59+00	\N	492
488	1-D9iMHl	t	1	\N	2	2017-08-09 07:34:55+00	2017-08-09 07:34:55+00	\N	493
489	1-GMuLtY	t	1	\N	2	2017-08-09 07:40:28+00	2017-08-09 07:40:28+00	\N	494
490	1-pghzhY	t	1	\N	2	2017-08-09 10:58:57+00	2017-08-09 10:58:57+00	\N	495
491	1-ExC1sB	t	1	\N	2	2017-08-09 13:03:42+00	2017-08-09 13:03:42+00	\N	496
495	1-G6f0FW	t	1	\N	2	2017-08-10 03:37:08+00	2017-08-10 03:37:08+00	\N	500
497	1-JEIKuL	t	1	\N	2	2017-08-10 07:25:22+00	2017-08-10 07:25:22+00	\N	502
500	1-K6F4uo	t	1	\N	2	2017-08-10 10:53:47+00	2017-08-10 10:53:47+00	\N	505
501	1-GRt0F0	t	1	\N	2	2017-08-10 11:41:25+00	2017-08-10 11:41:25+00	\N	506
502	1-pQizhD	t	1	\N	2	2017-08-10 12:15:16+00	2017-08-10 12:15:16+00	\N	507
506	1-MZt9HO	t	1	\N	2	2017-08-10 13:15:37+00	2017-08-10 13:15:37+00	\N	511
507	1-ANsVH8	t	1	\N	2	2017-08-10 13:52:41+00	2017-08-10 13:52:41+00	\N	512
508	1-N8FwI0	t	1	\N	2	2017-08-10 13:54:53+00	2017-08-10 13:54:53+00	\N	513
509	1-KAI9Hv	t	1	\N	2	2017-08-10 14:57:45+00	2017-08-10 14:57:45+00	\N	514
510	1-EqtnHP	t	1	\N	2	2017-08-10 15:25:43+00	2017-08-10 15:25:43+00	\N	515
511	1-D1soin	t	1	\N	2	2017-08-10 15:41:19+00	2017-08-10 15:41:19+00	\N	516
512	1-Bgh8ur	t	1	\N	2	2017-08-10 15:43:43+00	2017-08-10 15:43:43+00	\N	517
513	1-zmhGiV	t	1	\N	2	2017-08-10 17:52:27+00	2017-08-10 17:52:27+00	\N	518
514	1-LJCXHg	t	1	\N	2	2017-08-10 21:31:31+00	2017-08-10 21:31:31+00	\N	519
515	1-JysKuK	t	1	\N	2	2017-08-11 03:30:38+00	2017-08-11 03:30:38+00	\N	520
516	1-DYHJCW	t	1	\N	2	2017-08-11 03:54:09+00	2017-08-11 03:54:09+00	\N	521
517	1-v2f7f8	t	1	\N	2	2017-08-11 04:26:15+00	2017-08-11 04:26:15+00	\N	522
518	1-y6HrfQ	t	1	\N	2	2017-08-11 09:43:35+00	2017-08-11 09:43:35+00	\N	523
519	1-r0hriy	t	1	\N	2	2017-08-11 10:56:29+00	2017-08-11 10:56:29+00	\N	524
520	1-DYH5fR	t	1	\N	2	2017-08-11 10:58:04+00	2017-08-11 10:58:04+00	\N	525
521	1-NEHMt8	t	1	\N	2	2017-08-11 13:48:57+00	2017-08-11 13:48:57+00	\N	526
522	1-EPFpuP	t	1	\N	2	2017-08-11 13:58:39+00	2017-08-11 13:58:39+00	\N	527
523	1-B1IVhj	t	1	\N	2	2017-08-11 15:27:09+00	2017-08-11 15:27:09+00	\N	528
524	1-B1I7fW	t	1	\N	2	2017-08-11 16:09:52+00	2017-08-11 16:09:52+00	\N	529
526	1-BrtMFN	t	1	\N	2	2017-08-12 00:08:18+00	2017-08-12 00:08:18+00	\N	531
527	1-xnsJhW	t	1	\N	2	2017-08-12 00:25:44+00	2017-08-12 00:25:44+00	\N	532
529	1-zBHGiX	t	1	\N	2	2017-08-12 00:35:56+00	2017-08-12 00:35:56+00	\N	534
530	1-OJIvuW	t	1	\N	2	2017-08-12 01:06:50+00	2017-08-12 01:06:50+00	\N	535
531	1-yosytR	t	1	\N	2	2017-08-12 01:23:11+00	2017-08-12 01:23:11+00	\N	536
532	1-AQHZi9	t	1	\N	2	2017-08-12 02:02:48+00	2017-08-12 02:02:48+00	\N	537
535	1-yriLuR	t	1	\N	2	2017-08-12 05:23:15+00	2017-08-12 05:23:15+00	\N	540
536	1-E8sgFQ	t	1	\N	2	2017-08-12 10:29:50+00	2017-08-12 10:29:50+00	\N	541
537	1-EPF6tZ	t	1	\N	2	2017-08-12 12:27:21+00	2017-08-12 12:27:21+00	\N	542
538	1-OEHwHA	t	1	\N	2	2017-08-12 13:18:29+00	2017-08-12 13:18:29+00	\N	543
539	1-Mws9HR	t	1	\N	2	2017-08-12 13:25:22+00	2017-08-12 13:25:22+00	\N	544
541	1-ADfrsX	t	1	\N	2	2017-08-12 23:51:03+00	2017-08-12 23:51:03+00	\N	546
542	1-JEIqfk	t	1	\N	2	2017-08-13 00:33:48+00	2017-08-13 00:33:48+00	\N	547
543	1-MEHxsR	t	1	\N	2	2017-08-13 00:40:48+00	2017-08-13 00:40:48+00	\N	548
546	1-ADfGIY	t	1	\N	2	2017-08-13 00:44:08+00	2017-08-13 00:44:08+00	\N	551
549	1-G9FJhr	t	1	\N	2	2017-08-13 01:34:22+00	2017-08-13 01:34:22+00	\N	554
550	1-voiAuQ	t	1	\N	2	2017-08-13 01:34:44+00	2017-08-13 01:34:44+00	\N	555
552	1-B1IDiN	t	1	\N	2	2017-08-13 01:42:16+00	2017-08-13 01:42:16+00	\N	557
553	1-xnsxuv	t	1	\N	2	2017-08-13 02:19:13+00	2017-08-13 02:19:13+00	\N	558
554	1-GMuOC0	t	1	\N	2	2017-08-13 02:27:43+00	2017-08-13 02:27:43+00	\N	559
555	1-KQC8sQ	t	1	\N	2	2017-08-13 02:34:51+00	2017-08-13 02:34:51+00	\N	560
560	1-r8sriz	t	1	\N	2	2017-08-13 03:01:08+00	2017-08-13 03:01:08+00	\N	565
561	1-zBHMfK	t	1	\N	2	2017-08-13 03:05:06+00	2017-08-13 03:05:06+00	\N	566
563	1-xvimsR	t	1	\N	2	2017-08-13 03:12:11+00	2017-08-13 03:12:11+00	\N	568
565	1-wrCGf9	t	1	\N	2	2017-08-13 03:34:20+00	2017-08-13 03:34:20+00	\N	570
566	1-N0C9HV	t	1	\N	2	2017-08-13 03:35:55+00	2017-08-13 03:35:55+00	\N	571
568	1-DkfDIk	t	1	\N	2	2017-08-13 04:14:39+00	2017-08-13 04:14:39+00	\N	573
569	1-xGhLi2	t	1	\N	2	2017-08-13 05:19:37+00	2017-08-13 05:19:37+00	\N	574
570	1-v2f2FQ	t	1	\N	2	2017-08-13 05:28:11+00	2017-08-13 05:28:11+00	\N	575
571	1-B6C7fr	t	1	\N	2	2017-08-13 05:53:23+00	2017-08-13 05:53:23+00	\N	576
572	1-y8hNhx	t	1	\N	2	2017-08-13 06:41:49+00	2017-08-13 06:41:49+00	\N	577
574	1-GRtLtr	t	1	\N	2	2017-08-13 06:49:26+00	2017-08-13 06:49:26+00	\N	579
575	1-E8s0CB	t	1	\N	2	2017-08-13 07:13:34+00	2017-08-13 07:13:34+00	\N	580
579	1-qQtOhZ	t	1	\N	2	2017-08-13 12:21:28+00	2017-08-13 12:21:28+00	\N	584
580	1-z7uwC4	t	1	\N	2	2017-08-13 12:24:49+00	2017-08-13 12:24:49+00	\N	585
581	1-OZF0FW	t	1	\N	2	2017-08-13 12:27:29+00	2017-08-13 12:27:29+00	\N	586
582	1-GRtWsW	t	1	\N	2	2017-08-13 12:27:45+00	2017-08-13 12:27:45+00	\N	587
584	1-mZf5hG	t	1	\N	2	2017-08-13 13:02:28+00	2017-08-13 13:02:28+00	\N	589
585	1-BLiRC1	t	1	\N	2	2017-08-13 13:06:50+00	2017-08-13 13:06:50+00	\N	590
587	1-wrCviV	t	1	\N	2	2017-08-13 13:12:45+00	2017-08-13 13:12:45+00	\N	592
591	1-PYFZHm	t	1	\N	2	2017-08-13 13:19:03+00	2017-08-13 13:19:03+00	\N	596
592	1-zvsnH4	t	1	\N	2	2017-08-13 13:37:35+00	2017-08-13 13:37:35+00	\N	597
593	1-xkfms2	t	1	\N	2	2017-08-13 13:42:28+00	2017-08-13 13:42:28+00	\N	598
597	1-wVsLh1	t	1	\N	2	2017-08-13 13:48:05+00	2017-08-13 13:48:05+00	\N	602
599	1-vghWh5	t	1	\N	2	2017-08-13 13:50:13+00	2017-08-13 13:50:13+00	\N	604
600	1-r2t8f4	t	1	\N	2	2017-08-13 13:52:49+00	2017-08-13 13:52:49+00	\N	605
603	1-xGh9Fv	t	1	\N	2	2017-08-13 14:26:17+00	2017-08-13 14:26:17+00	\N	608
604	1-BrtAH6	t	1	\N	2	2017-08-13 14:32:42+00	2017-08-13 14:32:42+00	\N	609
606	1-A8IrsG	t	1	\N	2	2017-08-13 14:55:12+00	2017-08-13 14:55:12+00	\N	611
607	1-z7uRhw	t	1	\N	2	2017-08-13 15:05:58+00	2017-08-13 15:05:58+00	\N	612
608	1-x1Cms8	t	1	\N	2	2017-08-13 16:00:25+00	2017-08-13 16:00:25+00	\N	613
610	1-zpfwCw	t	1	\N	2	2017-08-14 01:08:45+00	2017-08-14 01:08:45+00	\N	615
612	1-JYHBiy	t	1	\N	2	2017-08-14 02:16:34+00	2017-08-14 02:16:34+00	\N	617
614	1-zmh8sM	t	1	\N	2	2017-08-14 02:43:57+00	2017-08-14 02:43:57+00	\N	619
615	1-xkfQtW	t	1	\N	2	2017-08-14 03:00:09+00	2017-08-14 03:00:09+00	\N	620
616	1-D1sOtB	t	1	\N	2	2017-08-14 03:08:54+00	2017-08-14 03:08:54+00	\N	621
618	1-ExCWhy	t	1	\N	2	2017-08-14 03:41:37+00	2017-08-14 03:41:37+00	\N	623
619	1-yri6sA	t	1	\N	2	2017-08-14 04:13:13+00	2017-08-14 04:13:13+00	\N	624
620	1-DQu5fn	t	1	\N	2	2017-08-14 04:22:53+00	2017-08-14 04:22:53+00	\N	625
621	1-BPultW	t	1	\N	2	2017-08-14 04:23:42+00	2017-08-14 04:23:42+00	\N	626
622	1-vghEio	t	1	\N	2	2017-08-14 05:05:16+00	2017-08-14 05:05:16+00	\N	627
625	1-JNugIL	t	1	\N	2	2017-08-14 05:20:40+00	2017-08-14 05:20:40+00	\N	630
626	1-LPFXHj	t	1	\N	2	2017-08-14 05:37:07+00	2017-08-14 05:37:07+00	\N	631
627	1-qjhOhE	t	1	\N	2	2017-08-14 05:45:01+00	2017-08-14 05:45:01+00	\N	632
628	1-N0CPC8	t	1	\N	2	2017-08-14 05:46:41+00	2017-08-14 05:46:41+00	\N	633
629	1-LJCQu1	t	1	\N	2	2017-08-14 06:03:20+00	2017-08-14 06:03:20+00	\N	634
630	1-wEHGfV	t	1	\N	2	2017-08-14 06:04:06+00	2017-08-14 06:04:06+00	\N	635
631	1-DkfMHR	t	1	\N	2	2017-08-14 06:04:20+00	2017-08-14 06:04:20+00	\N	636
635	1-pYfnfJ	t	1	\N	2	2017-08-14 06:41:50+00	2017-08-14 06:41:50+00	\N	640
636	1-A1CrsY	t	1	\N	2	2017-08-14 06:52:37+00	2017-08-14 06:52:37+00	\N	641
637	1-wKu0sV	t	1	\N	2	2017-08-14 07:06:16+00	2017-08-14 07:06:16+00	\N	642
639	1-DQuDIW	t	1	\N	2	2017-08-14 07:16:44+00	2017-08-14 07:16:44+00	\N	644
640	1-M9F9H1	t	1	\N	2	2017-08-14 07:22:22+00	2017-08-14 07:22:22+00	\N	645
644	1-JNuACp	t	1	\N	2	2017-08-14 07:49:24+00	2017-08-14 07:49:24+00	\N	649
645	1-qYi1iX	t	1	\N	2	2017-08-14 07:56:03+00	2017-08-14 07:56:03+00	\N	650
646	1-LAIYtr	t	1	\N	2	2017-08-14 08:04:36+00	2017-08-14 08:04:36+00	\N	651
647	1-x6tQtv	t	1	\N	2	2017-08-14 08:07:09+00	2017-08-14 08:07:09+00	\N	652
650	1-Anh1tO	t	1	\N	2	2017-08-14 08:18:47+00	2017-08-14 08:18:47+00	\N	655
653	1-BBfzIW	t	1	\N	2	2017-08-14 09:05:41+00	2017-08-14 09:05:41+00	\N	658
655	1-zmh4uw	t	1	\N	2	2017-08-14 09:08:20+00	2017-08-14 09:08:20+00	\N	660
656	1-rRiwsz	t	1	\N	2	2017-08-14 09:26:18+00	2017-08-14 09:26:18+00	\N	661
658	1-pghQsP	t	1	\N	2	2017-08-14 09:52:55+00	2017-08-14 09:52:55+00	\N	663
659	1-M1CkCO	t	1	\N	2	2017-08-14 09:55:48+00	2017-08-14 09:55:48+00	\N	664
662	1-GvsqH0	t	1	\N	2	2017-08-14 10:49:12+00	2017-08-14 10:49:12+00	\N	667
666	1-y8hrfk	t	1	\N	2	2017-08-14 11:39:58+00	2017-08-14 11:39:58+00	\N	671
667	1-ywtytQ	t	1	\N	2	2017-08-14 12:40:42+00	2017-08-14 12:40:42+00	\N	672
668	1-LPFwCr	t	1	\N	2	2017-08-14 13:09:55+00	2017-08-14 13:09:55+00	\N	673
671	1-E9igFB	t	1	\N	2	2017-08-14 13:13:08+00	2017-08-14 13:13:08+00	\N	676
672	1-M9FkCP	t	1	\N	2	2017-08-14 13:14:22+00	2017-08-14 13:14:22+00	\N	677
673	1-KYHqhQ	t	1	\N	2	2017-08-14 13:24:11+00	2017-08-14 13:24:11+00	\N	678
674	1-xnsQtY	t	1	\N	2	2017-08-14 13:24:35+00	2017-08-14 13:24:35+00	\N	679
675	1-JysyHp	t	1	\N	2	2017-08-14 13:29:00+00	2017-08-14 13:29:00+00	\N	680
677	1-M7I9HW	t	1	\N	2	2017-08-14 14:08:49+00	2017-08-14 14:08:49+00	\N	682
678	1-zvs8sw	t	1	\N	2	2017-08-14 14:14:47+00	2017-08-14 14:14:47+00	\N	683
680	1-r8sws7	t	1	\N	2	2017-08-14 15:07:09+00	2017-08-14 15:07:09+00	\N	685
681	1-ANs9hB	t	1	\N	2	2017-08-14 15:08:39+00	2017-08-14 15:08:39+00	\N	686
682	1-n5fXi9	t	1	\N	2	2017-08-14 15:09:37+00	2017-08-14 15:09:37+00	\N	687
683	1-rRiAhy	t	1	\N	2	2017-08-14 22:25:14+00	2017-08-14 22:25:14+00	\N	688
685	1-xkf9FY	t	1	\N	2	2017-08-15 00:41:59+00	2017-08-15 00:41:59+00	\N	690
687	1-z6t4ug	t	1	\N	2	2017-08-15 00:57:06+00	2017-08-15 00:57:06+00	\N	692
688	1-zXCMfw	t	1	\N	2	2017-08-15 01:18:47+00	2017-08-15 01:18:47+00	\N	693
689	1-EKI6tp	t	1	\N	2	2017-08-15 01:23:56+00	2017-08-15 01:23:56+00	\N	694
690	1-BghRCv	t	1	\N	2	2017-08-15 01:30:33+00	2017-08-15 01:30:33+00	\N	695
692	1-G6f2IY	t	1	\N	2	2017-08-15 01:32:22+00	2017-08-15 01:32:22+00	\N	697
698	1-JQC1Fv	t	1	\N	2	2017-08-15 02:30:44+00	2017-08-15 02:30:44+00	\N	703
699	1-qjh7tZ	t	1	\N	2	2017-08-15 02:42:01+00	2017-08-15 02:42:01+00	\N	704
700	1-wjhGfQ	t	1	\N	2	2017-08-15 02:45:26+00	2017-08-15 02:45:26+00	\N	705
702	1-ERf0C4	t	1	\N	2	2017-08-15 03:24:10+00	2017-08-15 03:24:10+00	\N	707
704	1-AQH1tG	t	1	\N	2	2017-08-15 03:48:01+00	2017-08-15 03:48:01+00	\N	709
706	1-M7IkC1	t	1	\N	2	2017-08-15 03:58:20+00	2017-08-15 03:58:20+00	\N	711
708	1-ANsGIG	t	1	\N	2	2017-08-15 04:10:35+00	2017-08-15 04:10:35+00	\N	713
711	1-oVsrf1	t	1	\N	2	2017-08-15 05:08:03+00	2017-08-15 05:08:03+00	\N	716
713	1-ywtrfP	t	1	\N	2	2017-08-15 05:56:29+00	2017-08-15 05:56:29+00	\N	718
714	1-E0ugFP	t	1	\N	2	2017-08-15 06:17:52+00	2017-08-15 06:17:52+00	\N	719
718	1-qjh1iQ	t	1	\N	2	2017-08-15 06:44:15+00	2017-08-15 06:44:15+00	\N	723
721	1-GwIBi0	t	1	\N	2	2017-08-15 06:46:18+00	2017-08-15 06:46:18+00	\N	726
728	1-DYHoil	t	1	\N	2	2017-08-15 07:27:33+00	2017-08-15 07:27:33+00	\N	733
729	1-OZFwHj	t	1	\N	2	2017-08-15 08:04:08+00	2017-08-15 08:04:08+00	\N	734
731	1-AmF1t8	t	1	\N	2	2017-08-15 08:06:14+00	2017-08-15 08:06:14+00	\N	736
733	1-BghMF1	t	1	\N	2	2017-08-15 08:09:47+00	2017-08-15 08:09:47+00	\N	738
734	1-q7s1iZ	t	1	\N	2	2017-08-15 08:10:56+00	2017-08-15 08:10:56+00	\N	739
736	1-vgh7fy	t	1	\N	2	2017-08-15 08:31:55+00	2017-08-15 08:31:55+00	\N	741
738	1-v8uWhX	t	1	\N	2	2017-08-15 08:33:51+00	2017-08-15 08:33:51+00	\N	743
739	1-D9ijsn	t	1	\N	2	2017-08-15 09:27:41+00	2017-08-15 09:27:41+00	\N	744
740	1-zpfmtM	t	1	\N	2	2017-08-15 09:39:50+00	2017-08-15 09:39:50+00	\N	745
742	1-E8s1s4	t	1	\N	2	2017-08-15 09:51:00+00	2017-08-15 09:51:00+00	\N	747
743	1-GYHLtk	t	1	\N	2	2017-08-15 10:37:21+00	2017-08-15 10:37:21+00	\N	748
745	1-JYHqfK	t	1	\N	2	2017-08-15 11:16:36+00	2017-08-15 11:16:36+00	\N	750
747	1-AnhnFQ	t	1	\N	2	2017-08-15 11:23:34+00	2017-08-15 11:23:34+00	\N	752
748	1-EKIWhQ	t	1	\N	2	2017-08-15 11:49:23+00	2017-08-15 11:49:23+00	\N	753
750	1-BLiMFW	t	1	\N	2	2017-08-15 11:51:07+00	2017-08-15 11:51:07+00	\N	755
752	1-LZtXHK	t	1	\N	2	2017-08-15 11:53:49+00	2017-08-15 11:53:49+00	\N	757
753	1-G5iqH1	t	1	\N	2	2017-08-15 11:57:33+00	2017-08-15 11:57:33+00	\N	758
755	1-APi9hX	t	1	\N	2	2017-08-15 12:28:14+00	2017-08-15 12:28:14+00	\N	760
757	1-y8hytA	t	1	\N	2	2017-08-15 12:31:58+00	2017-08-15 12:31:58+00	\N	762
759	1-BnFPsj	t	1	\N	2	2017-08-15 12:46:26+00	2017-08-15 12:46:26+00	\N	764
760	1-EZHpup	t	1	\N	2	2017-08-15 12:59:32+00	2017-08-15 12:59:32+00	\N	765
762	1-wVsRtq	t	1	\N	2	2017-08-15 13:33:58+00	2017-08-15 13:33:58+00	\N	767
763	1-voiEiA	t	1	\N	2	2017-08-15 13:46:53+00	2017-08-15 13:46:53+00	\N	768
769	1-OPuwHw	t	1	\N	2	2017-08-15 14:49:06+00	2017-08-15 14:49:06+00	\N	774
771	1-J8tgIv	t	1	\N	2	2017-08-15 14:53:39+00	2017-08-15 14:53:39+00	\N	776
774	1-K8tZIG	t	1	\N	2	2017-08-15 15:00:46+00	2017-08-15 15:00:46+00	\N	779
776	1-w0tGf1	t	1	\N	2	2017-08-15 15:05:24+00	2017-08-15 15:05:24+00	\N	781
777	1-NYu9Hy	t	1	\N	2	2017-08-15 15:10:44+00	2017-08-15 15:10:44+00	\N	782
781	1-EKI3fB	t	1	\N	2	2017-08-16 00:07:31+00	2017-08-16 00:07:31+00	\N	786
782	1-R8IyI0	t	1	\N	2	2017-08-16 00:15:14+00	2017-08-16 00:15:14+00	\N	787
783	1-wrCLhq	t	1	\N	2	2017-08-16 00:18:25+00	2017-08-16 00:18:25+00	\N	788
784	1-wpf0s8	t	1	\N	2	2017-08-16 00:47:17+00	2017-08-16 00:47:17+00	\N	789
787	1-Jqi1Fk	t	1	\N	2	2017-08-16 00:49:27+00	2017-08-16 00:49:27+00	\N	792
789	1-BLiltr	t	1	\N	2	2017-08-16 00:52:40+00	2017-08-16 00:52:40+00	\N	794
790	1-LAIwCj	t	1	\N	2	2017-08-16 01:10:05+00	2017-08-16 01:10:05+00	\N	795
792	1-y8hJHM	t	1	\N	2	2017-08-16 02:08:50+00	2017-08-16 02:08:50+00	\N	797
800	1-BNsDi7	t	1	\N	2	2017-08-16 04:26:34+00	2017-08-16 04:26:34+00	\N	805
801	1-zKixFg	t	1	\N	2	2017-08-16 04:26:39+00	2017-08-16 04:26:39+00	\N	806
802	1-DwI3uW	t	1	\N	2	2017-08-16 04:29:41+00	2017-08-16 04:29:41+00	\N	807
804	1-GwIJh1	t	1	\N	2	2017-08-16 04:32:43+00	2017-08-16 04:34:26+00	\N	809
806	1-yPfNhk	t	1	\N	2	2017-08-16 04:37:40+00	2017-08-16 04:37:40+00	\N	811
807	1-AMuEu9	t	1	\N	2	2017-08-16 05:17:57+00	2017-08-16 05:17:57+00	\N	812
810	1-xGh1fA	t	1	\N	2	2017-08-16 05:54:57+00	2017-08-16 05:54:57+00	\N	815
812	1-G5i0FY	t	1	\N	2	2017-08-16 06:47:39+00	2017-08-16 06:47:39+00	\N	817
813	1-wjhvi8	t	1	\N	2	2017-08-16 06:54:00+00	2017-08-16 06:54:00+00	\N	818
814	1-xnsRC8	t	1	\N	2	2017-08-16 07:15:25+00	2017-08-16 07:15:25+00	\N	819
815	1-wmi0sK	t	1	\N	2	2017-08-16 07:32:51+00	2017-08-16 07:32:51+00	\N	820
817	1-QAIlCO	t	1	\N	2	2017-08-16 08:30:59+00	2017-08-16 08:30:59+00	\N	822
819	1-AmF9hQ	t	1	\N	2	2017-08-16 08:54:24+00	2017-08-16 08:54:24+00	\N	824
820	1-GMu2Ip	t	1	\N	2	2017-08-16 09:27:19+00	2017-08-16 09:27:19+00	\N	825
822	1-KAIqh2	t	1	\N	2	2017-08-16 09:45:43+00	2017-08-16 09:45:43+00	\N	827
823	1-G8COCk	t	1	\N	2	2017-08-16 09:53:33+00	2017-08-16 09:53:33+00	\N	828
825	1-LAIki1	t	1	\N	2	2017-08-16 10:08:06+00	2017-08-16 10:08:06+00	\N	830
826	1-BNsRCW	t	1	\N	2	2017-08-16 10:16:31+00	2017-08-16 10:16:31+00	\N	831
831	1-KZiBFQ	t	1	\N	2	2017-08-16 11:53:29+00	2017-08-16 11:53:29+00	\N	836
832	1-DQuOtk	t	1	\N	2	2017-08-16 11:56:37+00	2017-08-16 11:56:37+00	\N	837
833	1-LZtmF1	t	1	\N	2	2017-08-16 12:10:24+00	2017-08-16 12:10:24+00	\N	838
834	1-qxfXuZ	t	1	\N	2	2017-08-16 13:05:02+00	2017-08-16 13:05:02+00	\N	839
835	1-A6tVHG	t	1	\N	2	2017-08-16 13:12:52+00	2017-08-16 13:12:52+00	\N	840
839	1-zqIMfg	t	1	\N	2	2017-08-16 13:37:31+00	2017-08-16 13:37:31+00	\N	844
841	1-ANsNfX	t	1	\N	2	2017-08-16 14:00:01+00	2017-08-16 14:00:01+00	\N	846
847	1-EPF0Cp	t	1	\N	2	2017-08-16 14:51:11+00	2017-08-16 14:51:11+00	\N	852
848	1-r2tAhz	t	1	\N	2	2017-08-16 15:29:05+00	2017-08-16 15:29:05+00	\N	853
850	1-nri7f9	t	1	\N	2	2017-08-16 15:52:16+00	2017-08-16 15:52:16+00	\N	855
851	1-KAIrtG	t	1	\N	2	2017-08-16 15:58:56+00	2017-08-16 15:58:56+00	\N	856
854	1-RMHyIX	t	1	\N	2	2017-08-16 16:53:50+00	2017-08-16 16:53:50+00	\N	859
855	1-MEH6tO	t	1	\N	2	2017-08-16 16:54:47+00	2017-08-16 16:54:47+00	\N	860
857	1-NOt9H8	t	1	\N	2	2017-08-16 17:36:25+00	2017-08-16 17:36:25+00	\N	862
859	1-Elh0Cy	t	1	\N	2	2017-08-16 23:10:01+00	2017-08-16 23:10:01+00	\N	864
862	1-JEIBip	t	1	\N	2	2017-08-16 23:26:12+00	2017-08-16 23:26:12+00	\N	867
863	1-LvuQu5	t	1	\N	2	2017-08-16 23:57:15+00	2017-08-16 23:57:15+00	\N	868
864	1-AQH9hY	t	1	\N	2	2017-08-17 00:01:28+00	2017-08-17 00:01:28+00	\N	869
865	1-vZC7fX	t	1	\N	2	2017-08-17 00:24:27+00	2017-08-17 00:24:27+00	\N	870
867	1-M7IxsO	t	1	\N	2	2017-08-17 00:46:04+00	2017-08-17 00:46:04+00	\N	872
870	1-nZh7fJ	t	1	\N	2	2017-08-17 01:16:35+00	2017-08-17 01:16:35+00	\N	875
873	1-DQuMH5	t	1	\N	2	2017-08-17 01:25:17+00	2017-08-17 01:25:17+00	\N	878
876	1-N7IjuV	t	1	\N	2	2017-08-17 01:41:37+00	2017-08-17 01:41:37+00	\N	881
877	1-BBfRCr	t	1	\N	2	2017-08-17 01:45:03+00	2017-08-17 01:45:03+00	\N	882
879	1-DYHBhk	t	1	\N	2	2017-08-17 01:56:46+00	2017-08-17 01:56:46+00	\N	884
880	1-M9FvIQ	t	1	\N	2	2017-08-17 01:58:56+00	2017-08-17 01:58:56+00	\N	885
882	1-vghLCQ	t	1	\N	2	2017-08-17 02:15:03+00	2017-08-17 02:15:03+00	\N	887
888	1-QAI9HQ	t	1	\N	2	2017-08-17 02:24:09+00	2017-08-17 02:24:09+00	\N	893
895	1-xkfLig	t	1	\N	2	2017-08-17 02:59:09+00	2017-08-17 02:59:09+00	\N	900
897	1-wpfGfR	t	1	\N	2	2017-08-17 03:08:21+00	2017-08-17 03:08:21+00	\N	902
898	1-K8t4uQ	t	1	\N	2	2017-08-17 03:08:28+00	2017-08-17 03:08:28+00	\N	903
900	1-lYf2fG	t	1	\N	2	2017-08-17 03:19:34+00	2017-08-17 03:19:34+00	\N	905
901	1-zKi4uo	t	1	\N	2	2017-08-17 03:28:53+00	2017-08-17 03:28:53+00	\N	906
904	1-zXCGiK	t	1	\N	2	2017-08-17 05:06:05+00	2017-08-17 05:06:05+00	\N	909
905	1-wmiRt9	t	1	\N	2	2017-08-17 05:09:49+00	2017-08-17 05:09:49+00	\N	910
906	1-BNsVhQ	t	1	\N	2	2017-08-17 05:38:46+00	2017-08-17 05:38:46+00	\N	911
907	1-DQuJCZ	t	1	\N	2	2017-08-17 05:43:59+00	2017-08-17 05:43:59+00	\N	912
909	1-JQCpsk	t	1	\N	2	2017-08-17 05:45:45+00	2017-08-17 05:45:45+00	\N	914
911	1-qYiOhQ	t	1	\N	2	2017-08-17 05:46:57+00	2017-08-17 05:46:57+00	\N	916
912	1-L7sXH1	t	1	\N	2	2017-08-17 05:47:24+00	2017-08-17 05:47:24+00	\N	917
913	1-ywt2CZ	t	1	\N	2	2017-08-17 05:47:25+00	2017-08-17 05:47:25+00	\N	918
915	1-AnhVHY	t	1	\N	2	2017-08-17 05:56:55+00	2017-08-17 05:56:55+00	\N	920
916	1-DYHOtA	t	1	\N	2	2017-08-17 06:04:33+00	2017-08-17 06:04:33+00	\N	921
918	1-B1IPs6	t	1	\N	2	2017-08-17 06:42:21+00	2017-08-17 06:42:21+00	\N	923
919	1-BBfltQ	t	1	\N	2	2017-08-17 06:43:18+00	2017-08-17 06:43:18+00	\N	924
921	1-APinFY	t	1	\N	2	2017-08-17 06:56:11+00	2017-08-17 06:56:11+00	\N	926
925	1-y8h0FQ	t	1	\N	2	2017-08-17 07:00:44+00	2017-08-17 07:00:44+00	\N	930
934	1-M9F6tR	t	1	\N	2	2017-08-17 07:11:01+00	2017-08-17 07:11:01+00	\N	939
935	1-DQuoiB	t	1	\N	2	2017-08-17 07:19:43+00	2017-08-17 07:19:43+00	\N	940
939	1-LAIXHP	t	1	\N	2	2017-08-17 07:34:09+00	2017-08-17 07:34:09+00	\N	944
943	1-yXCNhR	t	1	\N	2	2017-08-17 08:03:35+00	2017-08-17 08:03:35+00	\N	948
946	1-MZtRFR	t	1	\N	2	2017-08-17 08:07:12+00	2017-08-17 08:07:12+00	\N	951
947	1-KQCZIA	t	1	\N	2	2017-08-17 08:07:55+00	2017-08-17 08:07:55+00	\N	952
950	1-vghOsA	t	1	\N	2	2017-08-17 08:23:29+00	2017-08-17 08:23:29+00	\N	955
952	1-LYHYtK	t	1	\N	2	2017-08-17 08:52:03+00	2017-08-17 08:52:03+00	\N	957
955	1-R8IQHX	t	1	\N	2	2017-08-17 09:13:25+00	2017-08-17 09:13:25+00	\N	960
956	1-zvswCg	t	1	\N	2	2017-08-17 11:10:33+00	2017-08-17 11:10:33+00	\N	961
960	1-B6CRC6	t	1	\N	2	2017-08-17 11:53:02+00	2017-08-17 11:53:02+00	\N	965
962	1-ERfnHx	t	1	\N	2	2017-08-17 12:03:49+00	2017-08-17 12:03:49+00	\N	967
963	1-qxf1iE	t	1	\N	2	2017-08-17 12:06:37+00	2017-08-17 12:06:37+00	\N	968
969	1-wVsyuV	t	1	\N	2	2017-08-17 12:45:56+00	2017-08-17 12:45:56+00	\N	974
971	1-OJIwH5	t	1	\N	2	2017-08-17 13:15:25+00	2017-08-17 13:15:25+00	\N	976
972	1-y6H7iZ	t	1	\N	2	2017-08-17 13:17:01+00	2017-08-17 13:17:01+00	\N	977
974	1-K1sZIo	t	1	\N	2	2017-08-17 13:38:56+00	2017-08-17 13:38:56+00	\N	979
975	1-zXC8sg	t	1	\N	2	2017-08-17 13:52:44+00	2017-08-17 13:52:44+00	\N	980
978	1-LYHlIP	t	1	\N	2	2017-08-17 13:55:58+00	2017-08-17 13:55:58+00	\N	983
979	1-zpfxFo	t	1	\N	2	2017-08-17 13:56:20+00	2017-08-17 13:56:20+00	\N	984
982	1-zBHRhg	t	1	\N	2	2017-08-17 14:13:44+00	2017-08-17 14:13:44+00	\N	987
983	1-B8H7f1	t	1	\N	2	2017-08-17 14:16:12+00	2017-08-17 14:16:12+00	\N	988
989	1-zXCRho	t	1	\N	2	2017-08-17 14:37:04+00	2017-08-17 14:37:04+00	\N	994
990	1-mZfjfO	t	1	\N	2	2017-08-17 14:43:24+00	2017-08-17 14:43:24+00	\N	995
991	1-DRhMHk	t	1	\N	2	2017-08-17 14:43:39+00	2017-08-17 14:43:39+00	\N	996
994	1-EZH0Cw	t	1	\N	2	2017-08-17 15:20:36+00	2017-08-17 15:20:36+00	\N	999
996	1-zqIRhX	t	1	\N	2	2017-08-17 15:25:45+00	2017-08-17 15:25:45+00	\N	1001
997	1-znFmt4	t	1	\N	2	2017-08-17 15:27:31+00	2017-08-17 15:27:31+00	\N	1002
998	1-AmFEuG	t	1	\N	2	2017-08-17 15:39:10+00	2017-08-17 15:39:10+00	\N	1003
1000	1-yos6sN	t	1	\N	2	2017-08-17 15:51:26+00	2017-08-17 15:51:26+00	\N	1005
1001	1-wmivi1	t	1	\N	2	2017-08-17 16:20:06+00	2017-08-17 16:20:06+00	\N	1006
1002	1-v2fOso	t	1	\N	2	2017-08-17 16:24:29+00	2017-08-17 16:24:29+00	\N	1007
1004	1-DwI5fk	t	1	\N	2	2017-08-17 16:47:54+00	2017-08-17 16:47:54+00	\N	1009
1005	1-xGhRCY	t	1	\N	2	2017-08-17 16:48:00+00	2017-08-17 16:48:00+00	\N	1010
1011	1-BLiDiQ	t	1	\N	2	2017-08-17 22:40:33+00	2017-08-17 22:40:33+00	\N	1016
1017	1-N7I9Hr	t	1	\N	2	2017-08-17 23:11:40+00	2017-08-17 23:11:40+00	\N	1022
1018	1-ymFNhQ	t	1	\N	2	2017-08-17 23:30:58+00	2017-08-17 23:30:58+00	\N	1023
1020	1-K8tBFn	t	1	\N	2	2017-08-17 23:49:57+00	2017-08-17 23:49:57+00	\N	1025
1024	1-znF8sX	t	1	\N	2	2017-08-18 00:21:57+00	2017-08-18 00:21:57+00	\N	1029
1025	1-APi1t2	t	1	\N	2	2017-08-18 00:22:51+00	2017-08-18 00:22:51+00	\N	1030
1026	1-qxfOhN	t	1	\N	2	2017-08-18 00:25:41+00	2017-08-18 00:25:41+00	\N	1031
1027	1-G8C0FQ	t	1	\N	2	2017-08-18 00:38:27+00	2017-08-18 00:38:27+00	\N	1032
1028	1-D1snFl	t	1	\N	2	2017-08-18 00:44:56+00	2017-08-18 00:44:56+00	\N	1033
1032	1-KAIMCA	t	1	\N	2	2017-08-18 01:05:45+00	2017-08-18 01:05:45+00	\N	1037
1033	1-z7uMfB	t	1	\N	2	2017-08-18 01:08:15+00	2017-08-18 01:08:15+00	\N	1038
1035	1-N8FEFV	t	1	\N	2	2017-08-18 01:13:25+00	2017-08-18 01:13:25+00	\N	1040
1038	1-y9uytM	t	1	\N	2	2017-08-18 01:22:24+00	2017-08-18 01:22:24+00	\N	1043
1039	1-rmu8fz	t	1	\N	2	2017-08-18 01:22:46+00	2017-08-18 01:22:46+00	\N	1044
1040	1-VJIzIr	t	1	\N	2	2017-08-18 01:24:58+00	2017-08-18 01:24:58+00	\N	1045
1041	1-OgtEIw	t	1	\N	2	2017-08-18 01:37:56+00	2017-08-18 01:37:56+00	\N	1046
1042	1-KrfZIQ	t	1	\N	2	2017-08-18 01:44:33+00	2017-08-18 01:44:33+00	\N	1047
1045	1-DwIoiZ	t	1	\N	2	2017-08-18 01:54:13+00	2017-08-18 01:54:13+00	\N	1050
1046	1-J6fgIk	t	1	\N	2	2017-08-18 01:58:34+00	2017-08-18 01:58:34+00	\N	1051
1047	1-LYHNs1	t	1	\N	2	2017-08-18 02:00:12+00	2017-08-18 02:00:12+00	\N	1052
1051	1-JYHACL	t	1	\N	2	2017-08-18 02:04:28+00	2017-08-18 02:04:28+00	\N	1056
1055	1-D1s3uR	t	1	\N	2	2017-08-18 02:06:45+00	2017-08-18 02:06:45+00	\N	1060
1056	1-EqtgFZ	t	1	\N	2	2017-08-18 02:07:04+00	2017-08-18 02:07:04+00	\N	1061
1058	1-G9F1fW	t	1	\N	2	2017-08-18 02:07:58+00	2017-08-18 02:07:58+00	\N	1063
1059	1-N7IMty	t	1	\N	2	2017-08-18 02:09:55+00	2017-08-18 02:09:55+00	\N	1064
1064	1-DwIjsA	t	1	\N	2	2017-08-18 02:14:39+00	2017-08-18 02:14:39+00	\N	1069
1065	1-wjh0s1	t	1	\N	2	2017-08-18 02:15:21+00	2017-08-18 02:15:21+00	\N	1070
1066	1-wpfyuK	t	1	\N	2	2017-08-18 02:17:06+00	2017-08-18 02:17:06+00	\N	1071
1069	1-qxfLsQ	t	1	\N	2	2017-08-18 02:45:15+00	2017-08-18 02:45:15+00	\N	1074
1070	1-BLizIN	t	1	\N	2	2017-08-18 02:49:21+00	2017-08-18 02:49:21+00	\N	1075
1072	1-GwI0FK	t	1	\N	2	2017-08-18 02:52:01+00	2017-08-18 02:52:01+00	\N	1077
1074	1-LAIPh5	t	1	\N	2	2017-08-18 02:58:10+00	2017-08-18 02:58:10+00	\N	1079
1079	1-wkFLhV	t	1	\N	2	2017-08-18 03:00:47+00	2017-08-18 03:00:47+00	\N	1084
1080	1-G8CBir	t	1	\N	2	2017-08-18 03:01:38+00	2017-08-18 03:01:38+00	\N	1085
1082	1-MEHzuP	t	1	\N	2	2017-08-18 03:06:07+00	2017-08-18 03:06:07+00	\N	1087
1086	1-v8uEiQ	t	1	\N	2	2017-08-18 03:09:17+00	2017-08-18 03:09:17+00	\N	1091
1087	1-D8CBhB	t	1	\N	2	2017-08-18 03:09:20+00	2017-08-18 03:09:20+00	\N	1092
1092	1-JQCQty	t	1	\N	2	2017-08-18 03:14:46+00	2017-08-18 03:14:46+00	\N	1097
1094	1-BLiAHj	t	1	\N	2	2017-08-18 03:15:01+00	2017-08-18 03:15:01+00	\N	1099
1095	1-pYf9iY	t	1	\N	2	2017-08-18 03:17:07+00	2017-08-18 03:17:07+00	\N	1100
1096	1-JNuyHv	t	1	\N	2	2017-08-18 03:19:30+00	2017-08-18 03:19:30+00	\N	1101
1100	1-w0t0sq	t	1	\N	2	2017-08-18 03:20:46+00	2017-08-18 03:20:46+00	\N	1105
1101	1-yPf2CN	t	1	\N	2	2017-08-18 03:23:53+00	2017-08-18 03:23:53+00	\N	1106
1104	1-N7IEF0	t	1	\N	2	2017-08-18 03:25:38+00	2017-08-18 03:25:38+00	\N	1109
1108	1-ANsnF9	t	1	\N	2	2017-08-18 03:27:49+00	2017-08-18 03:27:49+00	\N	1113
1109	1-PzuJIW	t	1	\N	2	2017-08-18 03:28:04+00	2017-08-18 03:28:04+00	\N	1114
1110	1-wVs0s9	t	1	\N	2	2017-08-18 03:28:53+00	2017-08-18 03:28:53+00	\N	1115
1113	1-D9iOt8	t	1	\N	2	2017-08-18 03:31:58+00	2017-08-18 03:31:58+00	\N	1118
1116	1-GYHOCp	t	1	\N	2	2017-08-18 03:33:43+00	2017-08-18 03:33:43+00	\N	1121
1121	1-yPf0FR	t	1	\N	2	2017-08-18 03:34:39+00	2017-08-18 03:34:39+00	\N	1126
1122	1-D8Cjsk	t	1	\N	2	2017-08-18 03:34:59+00	2017-08-18 03:34:59+00	\N	1127
1127	1-K6FDiQ	t	1	\N	2	2017-08-18 03:36:07+00	2017-08-18 03:36:07+00	\N	1132
1129	1-G5iAuW	t	1	\N	2	2017-08-18 03:36:24+00	2017-08-18 03:36:24+00	\N	1134
1134	1-xlFLi8	t	1	\N	2	2017-08-18 03:39:32+00	2017-08-18 03:39:32+00	\N	1139
1139	1-w0tvi9	t	1	\N	2	2017-08-18 03:43:09+00	2017-08-18 03:43:09+00	\N	1144
1142	1-AnhlCM	t	1	\N	2	2017-08-18 03:43:54+00	2017-08-18 03:43:54+00	\N	1147
1146	1-BrtPsv	t	1	\N	2	2017-08-18 03:45:39+00	2017-08-18 03:45:39+00	\N	1151
1147	1-D8CMHW	t	1	\N	2	2017-08-18 03:46:08+00	2017-08-18 03:46:08+00	\N	1152
1148	1-zpfGi7	t	1	\N	2	2017-08-18 03:46:20+00	2017-08-18 03:46:20+00	\N	1153
1149	1-LghlI5	t	1	\N	2	2017-08-18 03:46:41+00	2017-08-18 03:46:41+00	\N	1154
1150	1-v2fAuz	t	1	\N	2	2017-08-18 03:46:49+00	2017-08-18 03:46:49+00	\N	1155
1151	1-D0Foik	t	1	\N	2	2017-08-18 03:47:01+00	2017-08-18 03:47:01+00	\N	1156
1152	1-LPFNs5	t	1	\N	2	2017-08-18 03:47:21+00	2017-08-18 03:47:21+00	\N	1157
1153	1-yXC7iQ	t	1	\N	2	2017-08-18 03:48:16+00	2017-08-18 03:48:16+00	\N	1158
1156	1-r8s8fy	t	1	\N	2	2017-08-18 03:50:12+00	2017-08-18 03:50:12+00	\N	1161
1165	1-zvsMfV	t	1	\N	2	2017-08-18 03:55:59+00	2017-08-18 03:55:59+00	\N	1170
1170	1-E8spux	t	1	\N	2	2017-08-18 03:59:44+00	2017-08-18 03:59:44+00	\N	1175
1171	1-KQC9Hp	t	1	\N	2	2017-08-18 04:00:16+00	2017-08-18 04:00:16+00	\N	1176
1175	1-L8ilI1	t	1	\N	2	2017-08-18 04:01:30+00	2017-08-18 04:01:30+00	\N	1180
1181	1-LZtwC5	t	1	\N	2	2017-08-18 04:02:11+00	2017-08-18 04:02:11+00	\N	1186
1183	1-z6tRhB	t	1	\N	2	2017-08-18 04:02:36+00	2017-08-18 04:02:36+00	\N	1188
1185	1-JPFKuO	t	1	\N	2	2017-08-18 04:03:14+00	2017-08-18 04:03:14+00	\N	1190
1189	1-o2fXhV	t	1	\N	2	2017-08-18 04:04:43+00	2017-08-18 04:04:43+00	\N	1194
1190	1-wKuGfK	t	1	\N	2	2017-08-18 04:05:36+00	2017-08-18 04:05:36+00	\N	1195
1191	1-wjhRtK	t	1	\N	2	2017-08-18 04:05:50+00	2017-08-18 04:05:50+00	\N	1196
1198	1-EKI0CN	t	1	\N	2	2017-08-18 04:10:11+00	2017-08-18 04:10:11+00	\N	1203
1206	1-G8CWsY	t	1	\N	2	2017-08-18 04:13:30+00	2017-08-18 04:13:30+00	\N	1211
1211	1-xkfxuR	t	1	\N	2	2017-08-18 04:16:25+00	2017-08-18 04:16:25+00	\N	1216
1214	1-EKIliZ	t	1	\N	2	2017-08-18 04:17:03+00	2017-08-18 04:17:03+00	\N	1219
1216	1-ANsZiO	t	1	\N	2	2017-08-18 04:17:18+00	2017-08-18 04:17:18+00	\N	1221
1217	1-nYHNiv	t	1	\N	2	2017-08-18 04:18:37+00	2017-08-18 04:18:37+00	\N	1222
1218	1-48RCBKFOB	t	1	\N	2	2017-08-18 04:18:43+00	2017-08-18 04:18:43+00	\N	1223
1219	1-gJ3hwCoE	t	1	\N	2	2017-08-18 04:19:05+00	2017-08-18 04:19:05+00	\N	1224
1220	1-mZ3u0fGG	t	1	\N	2	2017-08-18 04:20:08+00	2017-08-18 04:20:08+00	\N	1225
1221	1-GRtvUm	t	1	\N	2	2017-08-18 04:20:37+00	2017-08-18 04:20:37+00	\N	1226
1222	1-B5tJczn	t	1	\N	2	2017-08-18 04:20:42+00	2017-08-18 04:20:42+00	\N	1227
1223	1-7OT0uZ	t	1	\N	2	2017-08-18 04:21:24+00	2017-08-18 04:21:24+00	\N	1228
1224	1-n5zIOs9L	t	1	\N	2	2017-08-18 04:22:38+00	2017-08-18 04:22:38+00	\N	1229
1225	1-ADktpSQ	t	1	\N	2	2017-08-18 04:22:39+00	2017-08-18 04:22:39+00	\N	1230
1226	1-LJCPliBj	t	1	\N	2	2017-08-18 04:25:51+00	2017-08-18 04:25:51+00	\N	1231
1227	1-Rg5fVtG	t	1	\N	2	2017-08-18 04:26:02+00	2017-08-18 04:26:02+00	\N	1232
1228	1-1j6HMPFL0	t	1	\N	2	2017-08-18 04:26:05+00	2017-08-18 04:26:05+00	\N	1233
1229	1-R65fv4U9D	t	1	\N	2	2017-08-18 04:26:40+00	2017-08-18 04:26:40+00	\N	1234
1230	1-DRqSBDi55	t	1	\N	2	2017-08-18 04:27:33+00	2017-08-18 04:27:33+00	\N	1235
1231	1-31rSpyhgW	t	1	\N	2	2017-08-18 04:28:28+00	2017-08-18 04:28:28+00	\N	1236
1232	1-ER6U3RFNv	t	1	\N	2	2017-08-18 04:28:46+00	2017-08-18 04:28:46+00	\N	1237
1233	1-9EIDFoM	t	1	\N	2	2017-08-18 04:29:29+00	2017-08-18 04:29:29+00	\N	1238
1234	1-3lhpAuP	t	1	\N	2	2017-08-18 04:31:05+00	2017-08-18 04:31:05+00	\N	1239
1235	1-3zI7sg0	t	1	\N	2	2017-08-18 04:35:17+00	2017-08-18 04:35:17+00	\N	1240
1236	1-73JFNs8o	t	1	\N	2	2017-08-18 04:35:22+00	2017-08-18 04:35:22+00	\N	1241
1237	1-J6NFqXCVR	t	1	\N	2	2017-08-18 04:35:56+00	2017-08-18 04:35:56+00	\N	1242
1238	1-Z6gC3CzB	t	1	\N	2	2017-08-18 04:36:29+00	2017-08-18 04:36:29+00	\N	1243
1239	1-oYRsgcz7	t	1	\N	2	2017-08-18 04:36:56+00	2017-08-18 04:36:56+00	\N	1244
1240	1-Lg8CRjuBB	t	1	\N	2	2017-08-18 04:37:53+00	2017-08-18 04:37:53+00	\N	1245
1241	1-XlH7c6P	t	1	\N	2	2017-08-18 04:39:21+00	2017-08-18 04:39:21+00	\N	1246
1242	1-zpKtM3F49	t	1	\N	2	2017-08-18 04:39:41+00	2017-08-18 04:39:41+00	\N	1247
1243	1-Bg1cVh6j	t	1	\N	2	2017-08-18 04:39:53+00	2017-08-18 04:39:53+00	\N	1248
1244	1-AESEuo	t	1	\N	2	2017-08-18 04:40:05+00	2017-08-18 04:40:05+00	\N	1249
1245	1-o24HXvtr	t	1	\N	2	2017-08-18 04:40:21+00	2017-08-18 04:40:21+00	\N	1250
1246	1-ZJtMAC2	t	1	\N	2	2017-08-18 04:41:11+00	2017-08-18 04:41:11+00	\N	1251
1247	1-zrIJh4K	t	1	\N	2	2017-08-18 04:41:47+00	2017-08-18 04:41:47+00	\N	1252
1248	1-J6BCqmhZ	t	1	\N	2	2017-08-18 04:42:56+00	2017-08-18 04:42:56+00	\N	1253
1249	1-PzuKAh0r	t	1	\N	2	2017-08-18 04:43:10+00	2017-08-18 04:43:10+00	\N	1254
1250	1-4quB1hO2	t	1	\N	2	2017-08-18 04:43:11+00	2017-08-18 04:43:11+00	\N	1255
1251	1-zpzSoiXK	t	1	\N	2	2017-08-18 04:43:28+00	2017-08-18 04:43:28+00	\N	1256
1252	1-kpFnrTV	t	1	\N	2	2017-08-18 04:45:29+00	2017-08-18 04:45:29+00	\N	1257
1253	1-3qT4HZ	t	1	\N	2	2017-08-18 04:50:15+00	2017-08-18 04:50:15+00	\N	1258
1254	1-G6GivUj	t	1	\N	2	2017-08-18 04:51:06+00	2017-08-18 04:51:06+00	\N	1259
1255	1-AJcOsGj	t	1	\N	2	2017-08-18 04:51:13+00	2017-08-18 04:51:13+00	\N	1260
1256	1-YELt3DS0A	t	1	\N	2	2017-08-18 04:51:49+00	2017-08-18 04:51:49+00	\N	1261
1257	1-LAI3HB8	t	1	\N	2	2017-08-18 04:57:54+00	2017-08-18 04:57:54+00	\N	1262
1258	1-82zIOsnX	t	1	\N	2	2017-08-18 04:59:06+00	2017-08-18 04:59:06+00	\N	1263
1259	1-zpBSyuN	t	1	\N	2	2017-08-18 04:59:15+00	2017-08-18 04:59:15+00	\N	1264
1260	1-kNFnnu2n	t	1	\N	2	2017-08-18 04:59:54+00	2017-08-18 04:59:54+00	\N	1265
1261	1-wpLswfVp	t	1	\N	2	2017-08-18 05:00:15+00	2017-08-18 05:00:15+00	\N	1266
1262	1-68RtvCpp	t	1	\N	2	2017-08-18 05:01:02+00	2017-08-18 05:01:02+00	\N	1267
1263	1-r0Xs8yc7w	t	1	\N	2	2017-08-18 05:01:26+00	2017-08-18 05:01:26+00	\N	1268
1264	1-o2xfXrc1J	t	1	\N	2	2017-08-18 05:01:27+00	2017-08-18 05:01:27+00	\N	1269
1265	1-73jtAQI8w	t	1	\N	2	2017-08-18 05:06:04+00	2017-08-18 05:06:04+00	\N	1270
1266	1-G6f1lUq	t	1	\N	2	2017-08-18 05:06:42+00	2017-08-18 05:06:42+00	\N	1271
1267	1-L9xHRBUj	t	1	\N	2	2017-08-18 05:09:26+00	2017-08-18 05:09:26+00	\N	1272
1268	1-31NTVU3	t	1	\N	2	2017-08-18 05:09:45+00	2017-08-18 05:09:45+00	\N	1273
1269	1-xkVS1Js8	t	1	\N	2	2017-08-18 05:11:39+00	2017-08-18 05:11:39+00	\N	1274
1270	1-oBTroiz2	t	1	\N	2	2017-08-18 05:13:42+00	2017-08-18 05:13:42+00	\N	1275
1271	1-m4fwTK	t	1	\N	2	2017-08-18 05:14:08+00	2017-08-18 05:14:08+00	\N	1276
1272	1-PrTKkuzk	t	1	\N	2	2017-08-18 05:15:48+00	2017-08-18 05:15:48+00	\N	1277
1273	1-KO6iQUK	t	1	\N	2	2017-08-18 05:17:11+00	2017-08-18 05:17:11+00	\N	1278
1274	1-qxGcGUn	t	1	\N	2	2017-08-18 05:17:18+00	2017-08-18 05:17:18+00	\N	1279
1275	1-W69c5fm	t	1	\N	2	2017-08-18 05:17:23+00	2017-08-18 05:17:23+00	\N	1280
1276	1-0RWSGXcwg	t	1	\N	2	2017-08-18 05:17:42+00	2017-08-18 05:17:42+00	\N	1281
1277	1-kRDcqt2W	t	1	\N	2	2017-08-18 05:19:24+00	2017-08-18 05:19:24+00	\N	1282
1278	1-82XsRS7	t	1	\N	2	2017-08-18 05:20:11+00	2017-08-18 05:20:11+00	\N	1283
1279	1-O7Jfp6H0	t	1	\N	2	2017-08-18 05:24:08+00	2017-08-18 05:24:08+00	\N	1284
1280	1-LotkiB9	t	1	\N	2	2017-08-18 05:24:24+00	2017-08-18 05:24:24+00	\N	1285
1281	1-VOkFxDHGY	t	1	\N	2	2017-08-18 05:25:19+00	2017-08-18 05:25:19+00	\N	1286
1282	1-W6Oh5js6A	t	1	\N	2	2017-08-18 05:26:22+00	2017-08-18 05:26:22+00	\N	1287
1283	1-ZMh5Bu3	t	1	\N	2	2017-08-18 05:26:41+00	2017-08-18 05:26:41+00	\N	1288
1284	1-n5rt7MsV	t	1	\N	2	2017-08-18 05:27:17+00	2017-08-18 05:27:17+00	\N	1289
1285	1-0NUGrCwp	t	1	\N	2	2017-08-18 05:27:18+00	2017-08-18 05:27:18+00	\N	1290
1286	1-D1sMHWZ	t	1	\N	2	2017-08-18 05:27:49+00	2017-08-18 05:27:49+00	\N	1291
1287	1-9rwhmzCq	t	1	\N	2	2017-08-18 05:28:21+00	2017-08-18 05:28:21+00	\N	1292
1288	1-Q0i66Cj	t	1	\N	2	2017-08-18 05:30:09+00	2017-08-18 05:30:09+00	\N	1293
1289	1-1wEfpxfGA	t	1	\N	2	2017-08-18 05:30:36+00	2017-08-18 05:30:36+00	\N	1294
1290	1-68wcrgFpX	t	1	\N	2	2017-08-18 05:31:03+00	2017-08-18 05:31:03+00	\N	1295
1291	1-yOtEUD	t	1	\N	2	2017-08-18 05:39:57+00	2017-08-18 05:39:57+00	\N	1296
1292	1-n5RC2Cv	t	1	\N	2	2017-08-18 05:43:12+00	2017-08-18 05:43:12+00	\N	1297
1293	1-BBLtjfz4	t	1	\N	2	2017-08-18 05:44:08+00	2017-08-18 05:44:08+00	\N	1298
1294	1-Elh3khNQ	t	1	\N	2	2017-08-18 05:44:27+00	2017-08-18 05:44:27+00	\N	1299
1295	1-YPfL0i5	t	1	\N	2	2017-08-18 05:52:54+00	2017-08-18 05:52:54+00	\N	1300
1296	1-pY2HBI2	t	1	\N	2	2017-08-18 05:55:13+00	2017-08-18 05:55:13+00	\N	1301
1297	1-GgTJh7k	t	1	\N	2	2017-08-18 05:58:48+00	2017-08-18 05:58:48+00	\N	1302
1298	1-KrLF2rCMQ	t	1	\N	2	2017-08-18 06:00:30+00	2017-08-18 06:00:30+00	\N	1303
1299	1-XXhXZT61	t	1	\N	2	2017-08-18 06:02:42+00	2017-08-18 06:02:42+00	\N	1304
1300	1-P1jhDfr	t	1	\N	2	2017-08-18 06:05:14+00	2017-08-18 06:05:14+00	\N	1305
1301	1-rxcVs7G	t	1	\N	2	2017-08-18 06:05:25+00	2017-08-18 06:05:25+00	\N	1306
1302	1-xgiJQsP	t	1	\N	2	2017-08-18 06:05:53+00	2017-08-18 06:05:53+00	\N	1307
1303	1-lKc29FGx	t	1	\N	2	2017-08-18 06:07:21+00	2017-08-18 06:07:21+00	\N	1308
1304	1-YEBCvu0P	t	1	\N	2	2017-08-18 06:08:09+00	2017-08-18 06:08:09+00	\N	1309
1305	1-mwwuj9IZ	t	1	\N	2	2017-08-18 06:10:07+00	2017-08-18 06:10:07+00	\N	1310
1306	1-kRZtONC2Z	t	1	\N	2	2017-08-18 06:10:15+00	2017-08-18 06:10:15+00	\N	1311
1307	1-ERLUXhNB	t	1	\N	2	2017-08-18 06:12:26+00	2017-08-18 06:12:26+00	\N	1312
1308	1-qvt6cZN	t	1	\N	2	2017-08-18 06:12:54+00	2017-08-18 06:12:54+00	\N	1313
1309	1-5yGimTzA	t	1	\N	2	2017-08-18 06:15:20+00	2017-08-18 06:15:20+00	\N	1314
1310	1-zp0fMwHX7	t	1	\N	2	2017-08-18 06:15:21+00	2017-08-18 06:15:21+00	\N	1315
1311	1-k58SkiP	t	1	\N	2	2017-08-18 06:16:26+00	2017-08-18 06:16:26+00	\N	1316
1312	1-LOUVSBW	t	1	\N	2	2017-08-18 06:17:24+00	2017-08-18 06:17:24+00	\N	1317
1313	1-83tqs1M	t	1	\N	2	2017-08-18 06:17:45+00	2017-08-18 06:17:45+00	\N	1318
1314	1-nwCnTJJ	t	1	\N	2	2017-08-18 06:19:13+00	2017-08-18 06:19:13+00	\N	1319
1315	1-nZZcYIJv	t	1	\N	2	2017-08-18 06:26:35+00	2017-08-18 06:26:35+00	\N	1320
1316	1-Z6Bs5ltzZ	t	1	\N	2	2017-08-18 06:29:28+00	2017-08-18 06:29:28+00	\N	1321
1317	1-ZQf5qhzk	t	1	\N	2	2017-08-18 06:34:17+00	2017-08-18 06:34:17+00	\N	1322
1318	1-YEWuLNID	t	1	\N	2	2017-08-18 06:37:14+00	2017-08-18 06:37:14+00	\N	1323
1319	1-wmiLyiqq	t	1	\N	2	2017-08-18 06:43:21+00	2017-08-18 06:43:21+00	\N	1324
1320	1-ERmIpuM	t	1	\N	2	2017-08-18 06:46:05+00	2017-08-18 06:46:05+00	\N	1325
1321	1-0R8CGwiDL	t	1	\N	2	2017-08-18 06:47:32+00	2017-08-18 06:47:32+00	\N	1326
1322	1-zmXSAIx	t	1	\N	2	2017-08-18 07:00:38+00	2017-08-18 07:00:38+00	\N	1327
1323	1-RJH3fNo	t	1	\N	2	2017-08-18 07:06:11+00	2017-08-18 07:06:11+00	\N	1328
1324	1-67trf3	t	1	\N	2	2017-08-18 07:08:22+00	2017-08-18 07:08:22+00	\N	1329
1325	1-9Qi6uP	t	1	\N	2	2017-08-18 07:09:20+00	2017-08-18 07:09:20+00	\N	1330
1326	1-llU2zCG4	t	1	\N	2	2017-08-18 07:14:12+00	2017-08-18 07:14:12+00	\N	1331
1327	1-KrWh2mIMG	t	1	\N	2	2017-08-18 07:17:07+00	2017-08-18 07:17:07+00	\N	1332
1328	1-KrySBFMx	t	1	\N	2	2017-08-18 07:27:18+00	2017-08-18 07:27:18+00	\N	1333
1329	1-4x1SBZsQ	t	1	\N	2	2017-08-18 07:30:31+00	2017-08-18 07:30:31+00	\N	1334
1330	1-G62I1lUW	t	1	\N	2	2017-08-18 07:31:47+00	2017-08-18 07:31:47+00	\N	1335
1331	1-1wOfMAcLN	t	1	\N	2	2017-08-18 07:34:27+00	2017-08-18 07:34:27+00	\N	1336
1332	1-mQiLcJ	t	1	\N	2	2017-08-18 07:35:41+00	2017-08-18 07:35:41+00	\N	1337
1333	1-QyskDix7	t	1	\N	2	2017-08-18 07:36:55+00	2017-08-18 07:36:55+00	\N	1338
1334	1-o2Wt1u1x	t	1	\N	2	2017-08-18 07:37:56+00	2017-08-18 07:37:56+00	\N	1339
1335	1-yPfrRTZ6	t	1	\N	2	2017-08-18 07:48:35+00	2017-08-18 07:48:35+00	\N	1340
1336	1-Q2uJIxy	t	1	\N	2	2017-08-18 07:54:06+00	2017-08-18 07:54:06+00	\N	1341
1337	1-gptARU3	t	1	\N	2	2017-08-18 07:55:53+00	2017-08-18 07:55:53+00	\N	1342
1338	1-KrWhqDCO	t	1	\N	2	2017-08-18 08:08:41+00	2017-08-18 08:08:41+00	\N	1343
1339	1-lYrH29Fp	t	1	\N	2	2017-08-18 08:09:19+00	2017-08-18 08:09:19+00	\N	1344
1340	1-50fzuzR	t	1	\N	2	2017-08-18 08:09:32+00	2017-08-18 08:09:32+00	\N	1345
1341	1-l7CLTGO	t	1	\N	2	2017-08-18 08:12:11+00	2017-08-18 08:12:11+00	\N	1346
1342	1-yPRtNycMn	t	1	\N	2	2017-08-18 08:14:15+00	2017-08-18 08:14:15+00	\N	1347
1343	1-jltnMhR2	t	1	\N	2	2017-08-18 08:16:16+00	2017-08-18 08:16:16+00	\N	1348
1344	1-Nxkt0fmw	t	1	\N	2	2017-08-18 08:16:32+00	2017-08-18 08:16:32+00	\N	1349
1345	1-nWS7gU94	t	1	\N	2	2017-08-18 08:22:07+00	2017-08-18 08:22:07+00	\N	1350
1346	1-VqUxmUw	t	1	\N	2	2017-08-18 08:22:07+00	2017-08-18 08:22:07+00	\N	1351
1347	1-AD5HNfGZ	t	1	\N	2	2017-08-18 08:24:24+00	2017-08-18 08:24:24+00	\N	1352
1348	1-0R9IYIwn	t	1	\N	2	2017-08-18 08:24:37+00	2017-08-18 08:24:37+00	\N	1353
1349	1-70HA3sW8	t	1	\N	2	2017-08-18 08:25:55+00	2017-08-18 08:25:55+00	\N	1354
1350	1-Jwf5iV7	t	1	\N	2	2017-08-18 08:33:05+00	2017-08-18 08:33:05+00	\N	1355
1351	1-X9IXYUE	t	1	\N	2	2017-08-18 08:33:33+00	2017-08-18 08:33:33+00	\N	1356
1352	1-98rtk8cA	t	1	\N	2	2017-08-18 08:35:18+00	2017-08-18 08:35:18+00	\N	1357
1353	1-820hjOFl	t	1	\N	2	2017-08-18 08:42:00+00	2017-08-18 08:42:00+00	\N	1358
1354	1-4x3SJJfz	t	1	\N	2	2017-08-18 08:46:01+00	2017-08-18 08:46:01+00	\N	1359
1355	1-82OujYInA	t	1	\N	2	2017-08-18 08:49:39+00	2017-08-18 08:49:39+00	\N	1360
1356	1-Evs7FNx	t	1	\N	2	2017-08-18 08:50:01+00	2017-08-18 08:50:01+00	\N	1361
1357	1-qjhliZR	t	1	\N	2	2017-08-18 08:50:36+00	2017-08-18 08:50:36+00	\N	1362
1358	1-j2vtKcx	t	1	\N	2	2017-08-18 08:50:58+00	2017-08-18 08:50:58+00	\N	1363
1359	1-x9T1rI8o	t	1	\N	2	2017-08-18 08:51:10+00	2017-08-18 08:51:10+00	\N	1364
1360	1-44TBEUOL	t	1	\N	2	2017-08-18 08:51:38+00	2017-08-18 08:51:38+00	\N	1365
1361	1-9rQt8To4	t	1	\N	2	2017-08-18 08:52:36+00	2017-08-18 08:52:36+00	\N	1366
1362	1-49FmFZ	t	1	\N	2	2017-08-18 08:54:22+00	2017-08-18 08:54:22+00	\N	1367
1363	1-1wJHZHLo	t	1	\N	2	2017-08-18 08:54:39+00	2017-08-18 08:54:39+00	\N	1368
1364	1-oYAHDi1q	t	1	\N	2	2017-08-18 08:55:05+00	2017-08-18 08:55:05+00	\N	1369
1365	1-VqUguD	t	1	\N	2	2017-08-18 08:58:04+00	2017-08-18 08:58:04+00	\N	1370
1366	1-olHrAfzZ	t	1	\N	2	2017-08-18 08:58:17+00	2017-08-18 08:58:17+00	\N	1371
1367	1-vzuXtr	t	1	\N	2	2017-08-18 08:58:42+00	2017-08-18 08:58:42+00	\N	1372
1368	1-J6QH8gUz	t	1	\N	2	2017-08-18 09:00:02+00	2017-08-18 09:00:02+00	\N	1373
1369	1-mZ1Tj1uD	t	1	\N	2	2017-08-18 09:02:58+00	2017-08-18 09:02:58+00	\N	1374
1370	1-wGFGXf8	t	1	\N	2	2017-08-18 09:02:59+00	2017-08-18 09:02:59+00	\N	1375
1371	1-m5ijLhB	t	1	\N	2	2017-08-18 09:03:12+00	2017-08-18 09:03:12+00	\N	1376
1372	1-Kkt2BfM9	t	1	\N	2	2017-08-18 09:03:13+00	2017-08-18 09:03:13+00	\N	1377
1373	1-91smMTo6	t	1	\N	2	2017-08-18 09:06:09+00	2017-08-18 09:06:09+00	\N	1378
1374	1-31EFpNsN	t	1	\N	2	2017-08-18 09:06:48+00	2017-08-18 09:06:48+00	\N	1379
1375	1-9rNSk3uoo	t	1	\N	2	2017-08-18 09:06:53+00	2017-08-18 09:06:53+00	\N	1380
1376	1-BBWIBiP	t	1	\N	2	2017-08-18 09:07:09+00	2017-08-18 09:07:09+00	\N	1381
1377	1-WXFlh3	t	1	\N	2	2017-08-18 09:07:16+00	2017-08-18 09:07:16+00	\N	1382
1378	1-M8BiLuA	t	1	\N	2	2017-08-18 09:07:32+00	2017-08-18 09:07:32+00	\N	1383
1379	1-o2ECXrc7	t	1	\N	2	2017-08-18 09:07:36+00	2017-08-18 09:07:36+00	\N	1384
1380	1-wvFGAIVo	t	1	\N	2	2017-08-18 09:08:57+00	2017-08-18 09:08:57+00	\N	1385
1381	1-qBhOkfg	t	1	\N	2	2017-08-18 09:09:03+00	2017-08-18 09:09:03+00	\N	1386
1382	1-pY6CzQF8	t	1	\N	2	2017-08-18 09:09:43+00	2017-08-18 09:09:43+00	\N	1387
1383	1-o2XFrMF1B	t	1	\N	2	2017-08-18 09:10:10+00	2017-08-18 09:10:10+00	\N	1388
1384	1-GPc1DFKl	t	1	\N	2	2017-08-18 09:10:12+00	2017-08-18 09:10:12+00	\N	1389
1386	1-GZvhJ1cKL	t	1	\N	2	2017-08-18 09:13:17+00	2017-08-18 09:13:17+00	\N	1391
1387	1-qLcLsL	t	1	\N	2	2017-08-18 09:13:20+00	2017-08-18 09:13:20+00	\N	1392
1388	1-VOWtlMhz4	t	1	\N	2	2017-08-18 09:13:26+00	2017-08-18 09:13:26+00	\N	1393
1389	1-31qCLhg0	t	1	\N	2	2017-08-18 09:13:30+00	2017-08-18 09:13:30+00	\N	1394
1390	1-O7EcpwSA	t	1	\N	2	2017-08-18 09:13:35+00	2017-08-18 09:13:35+00	\N	1395
1391	1-gQSAjTj	t	1	\N	2	2017-08-18 09:13:41+00	2017-08-18 09:13:41+00	\N	1396
1392	1-jRpHAHRW	t	1	\N	2	2017-08-18 09:14:38+00	2017-08-18 09:14:38+00	\N	1397
1393	1-76XURHWk	t	1	\N	2	2017-08-18 09:15:16+00	2017-08-18 09:15:16+00	\N	1398
1394	1-pmHnGFDk	t	1	\N	2	2017-08-18 09:15:37+00	2017-08-18 09:15:37+00	\N	1399
1395	1-31pfpETW	t	1	\N	2	2017-08-18 09:16:03+00	2017-08-18 09:16:03+00	\N	1400
1396	1-PNwc8czJ	t	1	\N	2	2017-08-18 09:16:55+00	2017-08-18 09:16:55+00	\N	1401
1397	1-9rmH5Cok	t	1	\N	2	2017-08-18 09:17:34+00	2017-08-18 09:17:34+00	\N	1402
1398	1-v2RC7VsXW	t	1	\N	2	2017-08-18 09:17:53+00	2017-08-18 09:17:53+00	\N	1403
1399	1-n59fDs9B	t	1	\N	2	2017-08-18 09:18:06+00	2017-08-18 09:18:06+00	\N	1404
1400	1-VORtlMhGK	t	1	\N	2	2017-08-18 09:18:41+00	2017-08-18 09:18:41+00	\N	1405
1401	1-zXCQc4G	t	1	\N	2	2017-08-18 09:18:41+00	2017-08-18 09:18:41+00	\N	1406
1402	1-GjtrUKp	t	1	\N	2	2017-08-18 09:19:08+00	2017-08-18 09:19:08+00	\N	1407
1403	1-Y6hpC0P	t	1	\N	2	2017-08-18 09:19:39+00	2017-08-18 09:19:39+00	\N	1408
1404	1-VLFlPHY	t	1	\N	2	2017-08-18 09:20:55+00	2017-08-18 09:20:55+00	\N	1409
1405	1-Y4U7FA	t	1	\N	2	2017-08-18 09:21:38+00	2017-08-18 09:21:38+00	\N	1410
1406	1-82WCRSq	t	1	\N	2	2017-08-18 09:22:35+00	2017-08-18 09:22:35+00	\N	1411
1407	1-9rkS2uoL	t	1	\N	2	2017-08-18 09:24:19+00	2017-08-18 09:24:19+00	\N	1412
1408	1-JZDsq0sL	t	1	\N	2	2017-08-18 09:27:22+00	2017-08-18 09:27:22+00	\N	1413
1409	1-KOXHLTv2	t	1	\N	2	2017-08-18 09:27:26+00	2017-08-18 09:27:26+00	\N	1414
1410	1-821uNS1K	t	1	\N	2	2017-08-18 09:27:42+00	2017-08-18 09:27:42+00	\N	1415
1411	1-xOfJ1c80	t	1	\N	2	2017-08-18 09:27:57+00	2017-08-18 09:27:57+00	\N	1416
1412	1-RXiv5Fq	t	1	\N	2	2017-08-18 09:28:11+00	2017-08-18 09:28:11+00	\N	1417
1413	1-gJ1UJI1	t	1	\N	2	2017-08-18 09:28:26+00	2017-08-18 09:28:26+00	\N	1418
1414	1-n52fGxS9J	t	1	\N	2	2017-08-18 09:29:03+00	2017-08-18 09:29:03+00	\N	1419
1415	1-rKUOI7A	t	1	\N	2	2017-08-18 09:30:04+00	2017-08-18 09:30:04+00	\N	1420
1416	1-1j9TvhLA	t	1	\N	2	2017-08-18 09:32:03+00	2017-08-18 09:32:03+00	\N	1421
1417	1-y8lsNycy	t	1	\N	2	2017-08-18 09:32:39+00	2017-08-18 09:32:39+00	\N	1422
1418	1-5xsMizP	t	1	\N	2	2017-08-18 09:33:53+00	2017-08-18 09:33:53+00	\N	1423
1419	1-Z64s5WtW	t	1	\N	2	2017-08-18 09:34:47+00	2017-08-18 09:34:47+00	\N	1424
1420	1-33i9Cq9	t	1	\N	2	2017-08-18 09:35:19+00	2017-08-18 09:35:19+00	\N	1425
1421	1-xkpTKUR	t	1	\N	2	2017-08-18 09:38:12+00	2017-08-18 09:38:12+00	\N	1426
1422	1-wp7hlSVL	t	1	\N	2	2017-08-18 09:42:13+00	2017-08-18 09:42:13+00	\N	1427
1423	1-319ipDU2	t	1	\N	2	2017-08-18 09:43:33+00	2017-08-18 09:43:33+00	\N	1428
1424	1-5yLHZwTD	t	1	\N	2	2017-08-18 09:45:26+00	2017-08-18 09:45:26+00	\N	1429
1425	1-lrCoPS1	t	1	\N	2	2017-08-18 09:51:36+00	2017-08-18 09:51:36+00	\N	1430
1426	1-OYnhQhvY	t	1	\N	2	2017-08-18 09:51:38+00	2017-08-18 09:51:38+00	\N	1431
1427	1-9kHk5Hl	t	1	\N	2	2017-08-18 09:53:47+00	2017-08-18 09:53:47+00	\N	1432
1428	1-2kKH7Tk	t	1	\N	2	2017-08-18 09:54:58+00	2017-08-18 09:54:58+00	\N	1433
1429	1-jRrsDSR7	t	1	\N	2	2017-08-18 09:55:18+00	2017-08-18 09:55:18+00	\N	1434
1430	1-R6BtvJF9k	t	1	\N	2	2017-08-18 09:56:50+00	2017-08-18 09:56:50+00	\N	1435
1431	1-E5t3pFNR	t	1	\N	2	2017-08-18 09:58:38+00	2017-08-18 09:58:38+00	\N	1436
1432	1-MEH5vhW	t	1	\N	2	2017-08-18 09:59:34+00	2017-08-18 09:59:34+00	\N	1437
1433	1-rGTA0F7v	t	1	\N	2	2017-08-18 10:01:43+00	2017-08-18 10:01:43+00	\N	1438
1434	1-Z6Gu7i9	t	1	\N	2	2017-08-18 10:01:47+00	2017-08-18 10:01:47+00	\N	1439
1435	1-PGi4JiE	t	1	\N	2	2017-08-18 10:03:08+00	2017-08-18 10:03:08+00	\N	1440
1436	1-5jUZEiV	t	1	\N	2	2017-08-18 10:03:37+00	2017-08-18 10:03:37+00	\N	1441
1437	1-VgfysG3	t	1	\N	2	2017-08-18 10:04:35+00	2017-08-18 10:04:35+00	\N	1442
1438	1-20sjtny	t	1	\N	2	2017-08-18 10:05:10+00	2017-08-18 10:05:10+00	\N	1443
1439	1-2GI0IW	t	1	\N	2	2017-08-18 10:05:33+00	2017-08-18 10:05:33+00	\N	1444
1440	1-YEEi8tGr	t	1	\N	2	2017-08-18 10:05:46+00	2017-08-18 10:05:46+00	\N	1445
1441	1-0Rgskik	t	1	\N	2	2017-08-18 10:06:25+00	2017-08-18 10:06:25+00	\N	1446
1442	1-KoT2qsP	t	1	\N	2	2017-08-18 10:27:51+00	2017-08-18 10:27:51+00	\N	1447
1443	1-31kuPuY	t	1	\N	2	2017-08-18 10:30:09+00	2017-08-18 10:30:09+00	\N	1448
1444	1-BBwf7NTzD	t	1	\N	2	2017-08-18 10:30:29+00	2017-08-18 10:30:29+00	\N	1449
1445	1-qxBs81tZ4	t	1	\N	2	2017-08-18 10:52:15+00	2017-08-18 10:52:15+00	\N	1450
1446	1-P4u1T0W	t	1	\N	2	2017-08-18 11:36:57+00	2017-08-18 11:36:57+00	\N	1451
1447	1-xkYURC7	t	1	\N	2	2017-08-18 11:55:46+00	2017-08-18 11:55:46+00	\N	1452
1448	1-k5RFO1tv	t	1	\N	2	2017-08-18 12:30:50+00	2017-08-18 12:30:50+00	\N	1453
1449	1-xk2FOt8k	t	1	\N	2	2017-08-18 12:52:44+00	2017-08-18 12:52:44+00	\N	1454
1450	1-P7sPF0l	t	1	\N	2	2017-08-18 13:12:16+00	2017-08-18 13:12:16+00	\N	1455
1451	1-R6zF8U9K	t	1	\N	2	2017-08-18 13:23:27+00	2017-08-18 13:23:27+00	\N	1456
1452	1-J6ZsYSo	t	1	\N	2	2017-08-18 13:25:53+00	2017-08-18 13:25:53+00	\N	1457
1453	1-761Imxsw	t	1	\N	2	2017-08-18 13:26:27+00	2017-08-18 13:26:27+00	\N	1458
1454	1-Z6wSMACV	t	1	\N	2	2017-08-18 13:28:20+00	2017-08-18 13:28:20+00	\N	1459
1455	1-rzF8DC6	t	1	\N	2	2017-08-18 13:44:40+00	2017-08-18 13:44:40+00	\N	1460
1456	1-n5WhGmF92	t	1	\N	2	2017-08-18 13:45:47+00	2017-08-18 13:45:47+00	\N	1461
1457	1-Z6WIRtz5	t	1	\N	2	2017-08-18 13:54:09+00	2017-08-18 13:54:09+00	\N	1462
1458	1-QWOI2cx0	t	1	\N	2	2017-08-18 14:35:04+00	2017-08-18 14:35:04+00	\N	1463
1459	1-9rVIknSo2	t	1	\N	2	2017-08-18 14:39:25+00	2017-08-18 14:39:25+00	\N	1464
1460	1-9GUmgsA	t	1	\N	2	2017-08-18 14:51:36+00	2017-08-18 14:51:36+00	\N	1465
1461	1-OgtppiB	t	1	\N	2	2017-08-18 14:52:48+00	2017-08-18 14:52:48+00	\N	1466
1462	1-1wyupkTLj	t	1	\N	2	2017-08-18 14:54:38+00	2017-08-18 14:54:38+00	\N	1467
1463	1-rvuArS7q	t	1	\N	2	2017-08-18 15:14:43+00	2017-08-18 15:14:43+00	\N	1468
1464	1-P1hKMtB	t	1	\N	2	2017-08-18 15:41:19+00	2017-08-18 15:41:19+00	\N	1469
1465	1-NGi0ptmD	t	1	\N	2	2017-08-18 15:54:09+00	2017-08-18 15:54:09+00	\N	1470
1466	1-KrgT2fMY	t	1	\N	2	2017-08-18 15:55:40+00	2017-08-18 15:55:40+00	\N	1471
1467	1-JPF0hVl	t	1	\N	2	2017-08-18 16:03:34+00	2017-08-18 16:03:34+00	\N	1472
1468	1-m6s5jC1	t	1	\N	2	2017-08-18 16:50:42+00	2017-08-18 16:50:42+00	\N	1473
1469	1-xkAf1QCV	t	1	\N	2	2017-08-18 16:51:23+00	2017-08-18 16:51:23+00	\N	1474
1470	1-4xQuBOTO7	t	1	\N	2	2017-08-18 16:52:34+00	2017-08-18 16:52:34+00	\N	1475
1471	1-j2YfnQtM	t	1	\N	2	2017-08-19 00:05:12+00	2017-08-19 00:05:12+00	\N	1476
1472	1-Krf28uV	t	1	\N	2	2017-08-19 00:17:04+00	2017-08-19 00:17:04+00	\N	1477
1473	1-7oSnIg	t	1	\N	2	2017-08-19 00:41:31+00	2017-08-19 00:41:31+00	\N	1478
1474	1-rk5uliy	t	1	\N	2	2017-08-19 00:44:30+00	2017-08-19 00:44:30+00	\N	1479
1475	1-825UyfnE	t	1	\N	2	2017-08-19 00:45:14+00	2017-08-19 00:45:14+00	\N	1480
1476	1-3lQFpztqg	t	1	\N	2	2017-08-19 00:48:08+00	2017-08-19 00:48:08+00	\N	1481
1477	1-pYxI4SPl	t	1	\N	2	2017-08-19 00:48:40+00	2017-08-19 00:48:40+00	\N	1482
1478	1-koFn4U2W	t	1	\N	2	2017-08-19 00:49:02+00	2017-08-19 00:49:02+00	\N	1483
1479	1-rkgTyU5	t	1	\N	2	2017-08-19 00:51:21+00	2017-08-19 00:51:21+00	\N	1484
1480	1-ELS31uV	t	1	\N	2	2017-08-19 00:57:20+00	2017-08-19 00:57:20+00	\N	1485
1481	1-pQinVh2	t	1	\N	2	2017-08-19 00:58:02+00	2017-08-19 00:58:02+00	\N	1486
1482	1-ADDiNruX	t	1	\N	2	2017-08-19 01:03:15+00	2017-08-19 01:03:15+00	\N	1487
1483	1-w5sG3iV8	t	1	\N	2	2017-08-19 01:27:46+00	2017-08-19 01:27:46+00	\N	1488
1484	1-L9yhkiBn	t	1	\N	2	2017-08-19 01:28:57+00	2017-08-19 01:28:57+00	\N	1489
1485	1-LWcRrHy	t	1	\N	2	2017-08-19 01:35:34+00	2017-08-19 01:35:34+00	\N	1490
1486	1-GpFrU7V	t	1	\N	2	2017-08-19 01:43:58+00	2017-08-19 01:43:58+00	\N	1491
1487	1-yWSqcZR	t	1	\N	2	2017-08-19 01:46:04+00	2017-08-19 01:46:04+00	\N	1492
1488	1-31DIpLsG	t	1	\N	2	2017-08-19 01:47:12+00	2017-08-19 01:47:12+00	\N	1493
1489	1-ozh1u1l	t	1	\N	2	2017-08-19 01:49:21+00	2017-08-19 01:49:21+00	\N	1494
1490	1-y8JfrwHZn	t	1	\N	2	2017-08-19 01:50:03+00	2017-08-19 01:50:03+00	\N	1495
1491	1-wnIG8uVZ	t	1	\N	2	2017-08-19 01:50:52+00	2017-08-19 01:50:52+00	\N	1496
1492	1-pY9TAun	t	1	\N	2	2017-08-19 01:52:05+00	2017-08-19 01:52:05+00	\N	1497
1493	1-ZYsMofl	t	1	\N	2	2017-08-19 02:03:02+00	2017-08-19 02:03:02+00	\N	1498
1494	1-4xzFB9HP	t	1	\N	2	2017-08-19 02:04:29+00	2017-08-19 02:04:29+00	\N	1499
1495	1-JrF0hP	t	1	\N	2	2017-08-19 02:06:39+00	2017-08-19 02:06:39+00	\N	1500
1496	1-LnTRNuqg	t	1	\N	2	2017-08-19 02:07:55+00	2017-08-19 02:07:55+00	\N	1501
1497	1-R9uvxIp	t	1	\N	2	2017-08-19 02:08:36+00	2017-08-19 02:08:36+00	\N	1502
1498	1-jRYCn2FWO	t	1	\N	2	2017-08-19 02:12:04+00	2017-08-19 02:12:04+00	\N	1503
1499	1-9rXiziD	t	1	\N	2	2017-08-19 02:29:57+00	2017-08-19 02:29:57+00	\N	1504
1500	1-66mfrZTk	t	1	\N	2	2017-08-19 02:32:34+00	2017-08-19 02:32:34+00	\N	1505
1501	1-2zfRFny	t	1	\N	2	2017-08-19 02:33:45+00	2017-08-19 02:33:45+00	\N	1506
1502	1-R6Ouv8fE	t	1	\N	2	2017-08-19 02:36:28+00	2017-08-19 02:36:28+00	\N	1507
1503	1-Z62U0F8	t	1	\N	2	2017-08-19 02:39:52+00	2017-08-19 02:39:52+00	\N	1508
1504	1-PyhKoIz5	t	1	\N	2	2017-08-19 02:41:11+00	2017-08-19 02:41:11+00	\N	1509
1505	1-5y1UouON	t	1	\N	2	2017-08-19 02:41:26+00	2017-08-19 02:41:26+00	\N	1510
1506	1-BBfYUzK	t	1	\N	2	2017-08-19 02:43:00+00	2017-08-19 02:43:00+00	\N	1511
1507	1-VlTxfA	t	1	\N	2	2017-08-19 02:45:31+00	2017-08-19 02:45:31+00	\N	1512
1508	1-vjFpc0	t	1	\N	2	2017-08-19 02:47:23+00	2017-08-19 02:47:23+00	\N	1513
1509	1-P3C7C9	t	1	\N	2	2017-08-19 02:51:53+00	2017-08-19 02:51:53+00	\N	1514
1510	1-pgguqSPN	t	1	\N	2	2017-08-19 02:53:07+00	2017-08-19 02:53:07+00	\N	1515
1511	1-ZNFNSE	t	1	\N	2	2017-08-19 02:53:36+00	2017-08-19 02:53:36+00	\N	1516
1512	1-1jwtpqILQ	t	1	\N	2	2017-08-19 02:53:48+00	2017-08-19 02:53:48+00	\N	1517
1513	1-4DtnuY	t	1	\N	2	2017-08-19 02:54:54+00	2017-08-19 02:54:54+00	\N	1518
1514	1-0RncVfwm	t	1	\N	2	2017-08-19 02:55:49+00	2017-08-19 02:55:49+00	\N	1519
1515	1-GZwFjh3	t	1	\N	2	2017-08-19 02:56:03+00	2017-08-19 02:56:03+00	\N	1520
1516	1-NKh0Ztmr	t	1	\N	2	2017-08-19 02:56:42+00	2017-08-19 02:56:42+00	\N	1521
1517	1-VOvCvtGQ	t	1	\N	2	2017-08-19 02:56:58+00	2017-08-19 02:56:58+00	\N	1522
1518	1-wEHGRCY	t	1	\N	2	2017-08-19 02:57:18+00	2017-08-19 02:57:18+00	\N	1523
1519	1-o27urphv	t	1	\N	2	2017-08-19 02:57:44+00	2017-08-19 02:57:44+00	\N	1524
1520	1-9wcoh8	t	1	\N	2	2017-08-19 02:57:48+00	2017-08-19 02:57:48+00	\N	1525
1521	1-z2c2Sy	t	1	\N	2	2017-08-19 02:57:56+00	2017-08-19 02:57:56+00	\N	1526
1522	1-V2hl0FGr	t	1	\N	2	2017-08-19 02:58:14+00	2017-08-19 02:58:14+00	\N	1527
1523	1-31Lhp4SgW	t	1	\N	2	2017-08-19 02:58:47+00	2017-08-19 02:58:47+00	\N	1528
1524	1-66BTrBTpr	t	1	\N	2	2017-08-19 02:58:51+00	2017-08-19 02:58:51+00	\N	1529
1525	1-Z6Bs5yiz5	t	1	\N	2	2017-08-19 02:59:15+00	2017-08-19 02:59:15+00	\N	1530
1526	1-AESEuGo	t	1	\N	2	2017-08-19 02:59:16+00	2017-08-19 02:59:16+00	\N	1531
1527	1-3NipXtqq	t	1	\N	2	2017-08-19 02:59:17+00	2017-08-19 02:59:17+00	\N	1532
1528	1-2kXtp6SnL	t	1	\N	2	2017-08-19 02:59:43+00	2017-08-19 02:59:43+00	\N	1533
1529	1-Z6DHQuzN	t	1	\N	2	2017-08-19 02:59:45+00	2017-08-19 02:59:45+00	\N	1534
1530	1-mw2Uj5sg	t	1	\N	2	2017-08-19 03:00:02+00	2017-08-19 03:00:02+00	\N	1535
1531	1-0BC0cDr	t	1	\N	2	2017-08-19 03:00:40+00	2017-08-19 03:00:40+00	\N	1536
1532	1-EROh3vuX	t	1	\N	2	2017-08-19 03:00:50+00	2017-08-19 03:00:50+00	\N	1537
1533	1-kZi5uO	t	1	\N	2	2017-08-19 03:01:21+00	2017-08-19 03:01:21+00	\N	1538
1534	1-mBU55FGQ	t	1	\N	2	2017-08-19 03:02:21+00	2017-08-19 03:02:21+00	\N	1539
1535	1-zpViR4SV	t	1	\N	2	2017-08-19 03:02:43+00	2017-08-19 03:02:43+00	\N	1540
1536	1-O7ltppiM	t	1	\N	2	2017-08-19 03:04:05+00	2017-08-19 03:04:05+00	\N	1541
1537	1-vkC7DHg	t	1	\N	2	2017-08-19 03:04:14+00	2017-08-19 03:04:14+00	\N	1542
1538	1-RAhryc5	t	1	\N	2	2017-08-19 03:05:36+00	2017-08-19 03:05:36+00	\N	1543
1539	1-pgZHnVhPG	t	1	\N	2	2017-08-19 03:06:21+00	2017-08-19 03:06:21+00	\N	1544
1540	1-x8UJDI81	t	1	\N	2	2017-08-19 03:06:37+00	2017-08-19 03:06:37+00	\N	1545
1541	1-G6LfJ0CM	t	1	\N	2	2017-08-19 03:06:55+00	2017-08-19 03:06:55+00	\N	1546
1542	1-qqU8JTg	t	1	\N	2	2017-08-19 03:07:13+00	2017-08-19 03:07:13+00	\N	1547
1543	1-zEuAI4Z	t	1	\N	2	2017-08-19 03:07:56+00	2017-08-19 03:07:56+00	\N	1548
1544	1-zpqTMYcY	t	1	\N	2	2017-08-19 03:09:14+00	2017-08-19 03:09:14+00	\N	1549
1545	1-76AcAot84	t	1	\N	2	2017-08-19 03:09:19+00	2017-08-19 03:09:19+00	\N	1550
1546	1-82pt6GS9	t	1	\N	2	2017-08-19 03:09:51+00	2017-08-19 03:09:51+00	\N	1551
1547	1-YEgH3AcN	t	1	\N	2	2017-08-19 03:10:24+00	2017-08-19 03:10:24+00	\N	1552
1548	1-g2ClmTND	t	1	\N	2	2017-08-19 03:11:55+00	2017-08-19 03:11:55+00	\N	1553
1549	1-PzuBUN	t	1	\N	2	2017-08-19 03:12:08+00	2017-08-19 03:12:08+00	\N	1554
1550	1-XD4InDS6K	t	1	\N	2	2017-08-19 03:12:42+00	2017-08-19 03:12:42+00	\N	1555
1551	1-J6NF2u2	t	1	\N	2	2017-08-19 03:13:19+00	2017-08-19 03:13:19+00	\N	1556
1552	1-kWSDUB	t	1	\N	2	2017-08-19 03:13:26+00	2017-08-19 03:13:26+00	\N	1557
1553	1-R5SrRTNX	t	1	\N	2	2017-08-19 03:13:37+00	2017-08-19 03:13:37+00	\N	1558
1554	1-M8nUqDUw5	t	1	\N	2	2017-08-19 03:14:49+00	2017-08-19 03:14:49+00	\N	1559
1555	1-rLH8juv	t	1	\N	2	2017-08-19 03:14:57+00	2017-08-19 03:14:57+00	\N	1560
1556	1-98QCnHoE	t	1	\N	2	2017-08-19 03:14:59+00	2017-08-19 03:14:59+00	\N	1561
1557	1-kMfOMH2D	t	1	\N	2	2017-08-19 03:15:10+00	2017-08-19 03:15:10+00	\N	1562
1558	1-PNnsqUp	t	1	\N	2	2017-08-19 03:15:14+00	2017-08-19 03:15:14+00	\N	1563
1559	1-AD9UNgFGo	t	1	\N	2	2017-08-19 03:16:42+00	2017-08-19 03:16:42+00	\N	1564
1560	1-gJocABfNg	t	1	\N	2	2017-08-19 03:17:22+00	2017-08-19 03:17:22+00	\N	1565
1561	1-nNS7LCJm	t	1	\N	2	2017-08-19 03:17:59+00	2017-08-19 03:17:59+00	\N	1566
1562	1-kRLSOms2k	t	1	\N	2	2017-08-19 03:18:00+00	2017-08-19 03:18:00+00	\N	1567
1563	1-L97uWFz	t	1	\N	2	2017-08-19 03:18:01+00	2017-08-19 03:18:01+00	\N	1568
1564	1-DRQTkIX	t	1	\N	2	2017-08-19 03:18:05+00	2017-08-19 03:18:05+00	\N	1569
1565	1-4BsB7COR	t	1	\N	2	2017-08-19 03:18:29+00	2017-08-19 03:18:29+00	\N	1570
1566	1-KrySYuvn	t	1	\N	2	2017-08-19 03:18:32+00	2017-08-19 03:18:32+00	\N	1571
1567	1-r09tqF7x	t	1	\N	2	2017-08-19 03:20:35+00	2017-08-19 03:20:35+00	\N	1572
1568	1-xGVTASvg	t	1	\N	2	2017-08-19 03:20:46+00	2017-08-19 03:20:46+00	\N	1573
1569	1-36tEIgN	t	1	\N	2	2017-08-19 03:20:51+00	2017-08-19 03:20:51+00	\N	1574
1570	1-G0i16h7W	t	1	\N	2	2017-08-19 03:21:46+00	2017-08-19 03:21:46+00	\N	1575
1571	1-ZGh5nsK	t	1	\N	2	2017-08-19 03:22:04+00	2017-08-19 03:22:04+00	\N	1576
1572	1-rk3u83f7G	t	1	\N	2	2017-08-19 03:22:12+00	2017-08-19 03:22:12+00	\N	1577
1573	1-gJGFlhV	t	1	\N	2	2017-08-19 03:22:25+00	2017-08-19 03:22:25+00	\N	1578
1574	1-AnAh91CX	t	1	\N	2	2017-08-19 03:23:05+00	2017-08-19 03:23:05+00	\N	1579
1575	1-R6xHJuj	t	1	\N	2	2017-08-19 03:23:11+00	2017-08-19 03:23:11+00	\N	1580
1576	1-gJLtAMtor	t	1	\N	2	2017-08-19 03:23:16+00	2017-08-19 03:23:16+00	\N	1581
1577	1-Qgc4cxq	t	1	\N	2	2017-08-19 03:23:31+00	2017-08-19 03:23:31+00	\N	1582
1578	1-VOzUxrczE	t	1	\N	2	2017-08-19 03:23:36+00	2017-08-19 03:23:36+00	\N	1583
1579	1-n5kc7zFE	t	1	\N	2	2017-08-19 03:23:50+00	2017-08-19 03:23:50+00	\N	1584
1580	1-JosqruY	t	1	\N	2	2017-08-19 03:24:16+00	2017-08-19 03:24:16+00	\N	1585
1581	1-n7UGlux	t	1	\N	2	2017-08-19 03:24:24+00	2017-08-19 03:24:24+00	\N	1586
1582	1-DkmI5nIWX	t	1	\N	2	2017-08-19 03:24:53+00	2017-08-19 03:24:53+00	\N	1587
1583	1-8q6Cj9hk	t	1	\N	2	2017-08-19 03:25:31+00	2017-08-19 03:25:31+00	\N	1588
1584	1-X66FBs6p	t	1	\N	2	2017-08-19 03:26:43+00	2017-08-19 03:26:43+00	\N	1589
1585	1-n9IDs9B	t	1	\N	2	2017-08-19 03:26:47+00	2017-08-19 03:26:47+00	\N	1590
1586	1-YBt3Nh0M	t	1	\N	2	2017-08-19 03:26:52+00	2017-08-19 03:26:52+00	\N	1591
1587	1-82Mcj6tnD	t	1	\N	2	2017-08-19 03:27:06+00	2017-08-19 03:27:06+00	\N	1592
1588	1-M8GtNUw6	t	1	\N	2	2017-08-19 03:27:19+00	2017-08-19 03:27:19+00	\N	1593
1589	1-onhrMF1J	t	1	\N	2	2017-08-19 03:27:23+00	2017-08-19 03:27:23+00	\N	1594
1590	1-P1hKmfzO	t	1	\N	2	2017-08-19 03:27:43+00	2017-08-19 03:27:43+00	\N	1595
1591	1-BBkcV8CzK	t	1	\N	2	2017-08-19 03:27:47+00	2017-08-19 03:27:47+00	\N	1596
1592	1-2qhnhB	t	1	\N	2	2017-08-19 03:28:03+00	2017-08-19 03:28:03+00	\N	1597
1593	1-mZKUVUGm	t	1	\N	2	2017-08-19 03:28:39+00	2017-08-19 03:28:39+00	\N	1598
1594	1-8GIRSnR	t	1	\N	2	2017-08-19 03:29:21+00	2017-08-19 03:29:21+00	\N	1599
1595	1-kREFOlf2x	t	1	\N	2	2017-08-19 03:29:26+00	2017-08-19 03:29:26+00	\N	1600
1596	1-RzsvxIV	t	1	\N	2	2017-08-19 03:29:32+00	2017-08-19 03:29:32+00	\N	1601
1597	1-9r2InHN	t	1	\N	2	2017-08-19 03:29:37+00	2017-08-19 03:29:37+00	\N	1602
1598	1-KRCqDCB	t	1	\N	2	2017-08-19 03:30:06+00	2017-08-19 03:30:06+00	\N	1603
1599	1-EQf31uNn	t	1	\N	2	2017-08-19 03:30:22+00	2017-08-19 03:30:22+00	\N	1604
1600	1-p8snOHg	t	1	\N	2	2017-08-19 03:31:07+00	2017-08-19 03:31:07+00	\N	1605
1601	1-n5mC7ph9j	t	1	\N	2	2017-08-19 03:31:21+00	2017-08-19 03:31:21+00	\N	1606
1602	1-1phRt8	t	1	\N	2	2017-08-19 03:31:50+00	2017-08-19 03:31:50+00	\N	1607
1603	1-PDfqUn	t	1	\N	2	2017-08-19 03:31:59+00	2017-08-19 03:31:59+00	\N	1608
1604	1-0EUGrCwn	t	1	\N	2	2017-08-19 03:32:29+00	2017-08-19 03:32:29+00	\N	1609
1605	1-Mrsqfw8	t	1	\N	2	2017-08-19 03:32:37+00	2017-08-19 03:32:37+00	\N	1610
1606	1-NkoUNwtmq	t	1	\N	2	2017-08-19 03:33:04+00	2017-08-19 03:33:04+00	\N	1611
1607	1-BBBi7vcN	t	1	\N	2	2017-08-19 03:33:17+00	2017-08-19 03:33:17+00	\N	1612
1608	1-QQTk1cPr	t	1	\N	2	2017-08-19 03:33:20+00	2017-08-19 03:33:20+00	\N	1613
1609	1-nPCGqhR	t	1	\N	2	2017-08-19 03:33:56+00	2017-08-19 03:33:56+00	\N	1614
1610	1-6ZuoyIq	t	1	\N	2	2017-08-19 03:34:15+00	2017-08-19 03:34:15+00	\N	1615
1611	1-qxDc8nUK	t	1	\N	2	2017-08-19 03:34:59+00	2017-08-19 03:34:59+00	\N	1616
1612	1-70HAGi8w	t	1	\N	2	2017-08-19 03:35:06+00	2017-08-19 03:35:06+00	\N	1617
1613	1-yPOCrBiZ7	t	1	\N	2	2017-08-19 03:36:00+00	2017-08-19 03:36:00+00	\N	1618
1614	1-3l1tpNsQ	t	1	\N	2	2017-08-19 03:36:17+00	2017-08-19 03:36:17+00	\N	1619
1615	1-wpMiGWIVz	t	1	\N	2	2017-08-19 03:36:28+00	2017-08-19 03:36:28+00	\N	1620
1616	1-qxrF8EfZL	t	1	\N	2	2017-08-19 03:36:41+00	2017-08-19 03:36:41+00	\N	1621
1617	1-RNiMc1	t	1	\N	2	2017-08-19 03:36:42+00	2017-08-19 03:36:42+00	\N	1622
1618	1-AmFNDFO	t	1	\N	2	2017-08-19 03:38:20+00	2017-08-19 03:38:20+00	\N	1623
1619	1-rk2CgUzG	t	1	\N	2	2017-08-19 03:38:34+00	2017-08-19 03:38:34+00	\N	1624
1620	1-X4uph6p	t	1	\N	2	2017-08-19 03:38:58+00	2017-08-19 03:38:58+00	\N	1625
1621	1-LvuvtBD	t	1	\N	2	2017-08-19 03:39:54+00	2017-08-19 03:39:54+00	\N	1626
1622	1-MWcqVhw6	t	1	\N	2	2017-08-19 03:40:15+00	2017-08-19 03:40:15+00	\N	1627
1623	1-r02i87U7E	t	1	\N	2	2017-08-19 03:40:29+00	2017-08-19 03:40:29+00	\N	1628
1624	1-wppiETVn	t	1	\N	2	2017-08-19 03:41:09+00	2017-08-19 03:41:09+00	\N	1629
1625	1-xOfES1	t	1	\N	2	2017-08-19 03:41:26+00	2017-08-19 03:41:26+00	\N	1630
1626	1-wpvIkSVP	t	1	\N	2	2017-08-19 03:42:02+00	2017-08-19 03:42:02+00	\N	1631
1627	1-J66iqLhGv	t	1	\N	2	2017-08-19 03:42:03+00	2017-08-19 03:42:03+00	\N	1632
1628	1-zpqTZC4x	t	1	\N	2	2017-08-19 03:42:40+00	2017-08-19 03:42:40+00	\N	1633
1629	1-1jGIpnFLP	t	1	\N	2	2017-08-19 03:42:46+00	2017-08-19 03:42:46+00	\N	1634
1630	1-Djh5guWx	t	1	\N	2	2017-08-19 03:42:57+00	2017-08-19 03:42:57+00	\N	1635
1631	1-Wkf5PIv	t	1	\N	2	2017-08-19 03:43:01+00	2017-08-19 03:43:01+00	\N	1636
1632	1-nkHQU4	t	1	\N	2	2017-08-19 03:43:44+00	2017-08-19 03:43:44+00	\N	1637
1633	1-xkAf1NIE	t	1	\N	2	2017-08-19 03:44:23+00	2017-08-19 03:44:23+00	\N	1638
1634	1-2kfpys2	t	1	\N	2	2017-08-19 03:47:00+00	2017-08-19 03:47:00+00	\N	1639
1635	1-r00c6H8	t	1	\N	2	2017-08-19 03:48:55+00	2017-08-19 03:48:55+00	\N	1640
1636	1-zmmuxFXK	t	1	\N	2	2017-08-19 03:52:09+00	2017-08-19 03:52:09+00	\N	1641
1637	1-L9fRYC4	t	1	\N	2	2017-08-19 03:53:53+00	2017-08-19 03:53:53+00	\N	1642
1638	1-BPuOIzX	t	1	\N	2	2017-08-19 03:55:12+00	2017-08-19 03:55:12+00	\N	1643
1639	1-ERRizu9	t	1	\N	2	2017-08-19 03:57:03+00	2017-08-19 03:57:03+00	\N	1644
1640	1-qBh8lsN	t	1	\N	2	2017-08-19 03:57:25+00	2017-08-19 03:57:25+00	\N	1645
1641	1-XD3iXzTy	t	1	\N	2	2017-08-19 03:57:49+00	2017-08-19 03:57:49+00	\N	1646
1642	1-O6cpZHr	t	1	\N	2	2017-08-19 03:58:06+00	2017-08-19 03:58:06+00	\N	1647
1643	1-n50s7yiJp	t	1	\N	2	2017-08-19 03:58:45+00	2017-08-19 03:58:45+00	\N	1648
1644	1-ADVFNgFG2	t	1	\N	2	2017-08-19 03:59:47+00	2017-08-19 03:59:47+00	\N	1649
1645	1-lXUPC0	t	1	\N	2	2017-08-19 04:01:13+00	2017-08-19 04:01:13+00	\N	1650
1646	1-wpWF7uV	t	1	\N	2	2017-08-19 04:01:17+00	2017-08-19 04:01:17+00	\N	1651
1647	1-X6xu8c6Z	t	1	\N	2	2017-08-19 04:01:30+00	2017-08-19 04:01:30+00	\N	1652
1648	1-XDAC8cX	t	1	\N	2	2017-08-19 04:03:22+00	2017-08-19 04:03:22+00	\N	1653
1649	1-kRGfOrIK	t	1	\N	2	2017-08-19 04:04:00+00	2017-08-19 04:04:00+00	\N	1654
1650	1-761IA1Hq	t	1	\N	2	2017-08-19 04:05:57+00	2017-08-19 04:05:57+00	\N	1655
1651	1-J6puqXCVW	t	1	\N	2	2017-08-19 04:06:18+00	2017-08-19 04:06:18+00	\N	1656
1652	1-Zju5QFz7	t	1	\N	2	2017-08-19 04:06:46+00	2017-08-19 04:06:46+00	\N	1657
1653	1-G6oT1NuE	t	1	\N	2	2017-08-19 04:07:24+00	2017-08-19 04:07:24+00	\N	1658
1654	1-DxiEcW5	t	1	\N	2	2017-08-19 04:07:28+00	2017-08-19 04:07:28+00	\N	1659
1655	1-E4u3NhNM	t	1	\N	2	2017-08-19 04:07:54+00	2017-08-19 04:07:54+00	\N	1660
1656	1-LqsR2T5	t	1	\N	2	2017-08-19 04:07:54+00	2017-08-19 04:07:54+00	\N	1661
1657	1-9ryFyT7	t	1	\N	2	2017-08-19 04:08:23+00	2017-08-19 04:08:23+00	\N	1662
1658	1-wp6UnIV8	t	1	\N	2	2017-08-19 04:08:46+00	2017-08-19 04:08:46+00	\N	1663
1659	1-BxTnH2	t	1	\N	2	2017-08-19 04:09:26+00	2017-08-19 04:09:26+00	\N	1664
1660	1-QWGS7Txz	t	1	\N	2	2017-08-19 04:10:00+00	2017-08-19 04:10:00+00	\N	1665
1661	1-pmHYUPo	t	1	\N	2	2017-08-19 04:10:08+00	2017-08-19 04:10:08+00	\N	1666
1662	1-gzulluK	t	1	\N	2	2017-08-19 04:10:46+00	2017-08-19 04:10:46+00	\N	1667
1663	1-x9T1lhvg	t	1	\N	2	2017-08-19 04:11:35+00	2017-08-19 04:11:35+00	\N	1668
1664	1-yDurOUMg	t	1	\N	2	2017-08-19 04:11:49+00	2017-08-19 04:11:49+00	\N	1669
1665	1-gJqcAmIo6	t	1	\N	2	2017-08-19 04:12:31+00	2017-08-19 04:12:31+00	\N	1670
1666	1-lYlf25hm	t	1	\N	2	2017-08-19 04:12:32+00	2017-08-19 04:12:32+00	\N	1671
1667	1-vvH77iO	t	1	\N	2	2017-08-19 04:13:27+00	2017-08-19 04:13:27+00	\N	1672
1668	1-ygfNYCZz	t	1	\N	2	2017-08-19 04:13:35+00	2017-08-19 04:13:35+00	\N	1673
1669	1-o8UrOfL	t	1	\N	2	2017-08-19 04:14:30+00	2017-08-19 04:14:30+00	\N	1674
1670	1-GoFZcKv	t	1	\N	2	2017-08-19 04:15:05+00	2017-08-19 04:15:05+00	\N	1675
1671	1-1w9IMLTn	t	1	\N	2	2017-08-19 04:16:03+00	2017-08-19 04:16:03+00	\N	1676
1672	1-rkOFws7R	t	1	\N	2	2017-08-19 04:16:11+00	2017-08-19 04:16:11+00	\N	1677
1673	1-zmhMNh4E	t	1	\N	2	2017-08-19 04:16:42+00	2017-08-19 04:16:42+00	\N	1678
1674	1-ERJfLf7	t	1	\N	2	2017-08-19 04:16:47+00	2017-08-19 04:16:47+00	\N	1679
1675	1-73LtA9fX	t	1	\N	2	2017-08-19 04:17:51+00	2017-08-19 04:17:51+00	\N	1680
1676	1-VmPClMhGO	t	1	\N	2	2017-08-19 04:19:21+00	2017-08-19 04:19:21+00	\N	1681
1677	1-ZXf5Zhzk	t	1	\N	2	2017-08-19 04:19:32+00	2017-08-19 04:19:32+00	\N	1682
1678	1-ryfxT8	t	1	\N	2	2017-08-19 04:19:38+00	2017-08-19 04:19:38+00	\N	1683
1679	1-jR3urFB	t	1	\N	2	2017-08-19 04:20:49+00	2017-08-19 04:20:49+00	\N	1684
1680	1-BBLt74UK	t	1	\N	2	2017-08-19 04:20:56+00	2017-08-19 04:20:56+00	\N	1685
1681	1-08t2ghK	t	1	\N	2	2017-08-19 04:20:57+00	2017-08-19 04:20:57+00	\N	1686
1682	1-xkRSXHZ	t	1	\N	2	2017-08-19 04:21:28+00	2017-08-19 04:21:28+00	\N	1687
1683	1-GgT1jI5	t	1	\N	2	2017-08-19 04:22:22+00	2017-08-19 04:22:22+00	\N	1688
1684	1-YEos2iG	t	1	\N	2	2017-08-19 04:22:54+00	2017-08-19 04:22:54+00	\N	1689
1685	1-vxhxfXw	t	1	\N	2	2017-08-19 04:23:31+00	2017-08-19 04:23:31+00	\N	1690
1686	1-WnOs5YH6Z	t	1	\N	2	2017-08-19 04:25:05+00	2017-08-19 04:25:05+00	\N	1691
1687	1-X4uXzTD	t	1	\N	2	2017-08-19 04:25:27+00	2017-08-19 04:25:27+00	\N	1692
1688	1-4xZsBgu2	t	1	\N	2	2017-08-19 04:25:43+00	2017-08-19 04:25:43+00	\N	1693
1689	1-vvH6Sm	t	1	\N	2	2017-08-19 04:27:14+00	2017-08-19 04:27:14+00	\N	1694
1690	1-REFv8fM	t	1	\N	2	2017-08-19 04:28:58+00	2017-08-19 04:28:58+00	\N	1695
1691	1-y8MhBfZK	t	1	\N	2	2017-08-19 04:31:26+00	2017-08-19 04:31:26+00	\N	1696
1692	1-L9LURBUB	t	1	\N	2	2017-08-19 04:31:54+00	2017-08-19 04:31:54+00	\N	1697
1693	1-G6vujho	t	1	\N	2	2017-08-19 04:31:58+00	2017-08-19 04:31:58+00	\N	1698
1694	1-735TmQTY	t	1	\N	2	2017-08-19 04:32:11+00	2017-08-19 04:32:11+00	\N	1699
1695	1-pggun4UE	t	1	\N	2	2017-08-19 04:33:18+00	2017-08-19 04:33:18+00	\N	1700
1696	1-Y5C3DS1	t	1	\N	2	2017-08-19 04:33:39+00	2017-08-19 04:33:39+00	\N	1701
1697	1-xkjiDSp	t	1	\N	2	2017-08-19 04:34:26+00	2017-08-19 04:34:26+00	\N	1702
1698	1-jVtnOS5	t	1	\N	2	2017-08-19 04:34:39+00	2017-08-19 04:34:39+00	\N	1703
1699	1-OYjfQhJ	t	1	\N	2	2017-08-19 04:35:31+00	2017-08-19 04:35:31+00	\N	1704
1700	1-n5XH7lul	t	1	\N	2	2017-08-19 04:35:31+00	2017-08-19 04:35:31+00	\N	1705
1701	1-VqUxLhGz	t	1	\N	2	2017-08-19 04:35:52+00	2017-08-19 04:35:52+00	\N	1706
1702	1-pY4TGuPm	t	1	\N	2	2017-08-19 04:36:24+00	2017-08-19 04:36:24+00	\N	1707
1703	1-A3CNJhGX	t	1	\N	2	2017-08-19 04:38:02+00	2017-08-19 04:38:02+00	\N	1708
1704	1-ADyiNkum	t	1	\N	2	2017-08-19 04:38:23+00	2017-08-19 04:38:23+00	\N	1709
1705	1-BgguXT5	t	1	\N	2	2017-08-19 04:39:07+00	2017-08-19 04:39:07+00	\N	1710
1706	1-lOQHoLhGM	t	1	\N	2	2017-08-19 04:39:08+00	2017-08-19 04:39:08+00	\N	1711
1707	1-PPTKGuzR	t	1	\N	2	2017-08-19 04:39:09+00	2017-08-19 04:39:09+00	\N	1712
1708	1-G5izfKm	t	1	\N	2	2017-08-19 04:43:24+00	2017-08-19 04:43:24+00	\N	1714
1709	1-BgRf7GIn	t	1	\N	2	2017-08-19 04:43:24+00	2017-08-19 04:43:24+00	\N	1713
1710	1-o27u9H1	t	1	\N	2	2017-08-19 04:44:30+00	2017-08-19 04:44:30+00	\N	1715
1711	1-7OTAGiB	t	1	\N	2	2017-08-19 04:44:43+00	2017-08-19 04:44:43+00	\N	1716
1712	1-nZQs78f90	t	1	\N	2	2017-08-19 04:45:19+00	2017-08-19 04:45:19+00	\N	1717
1713	1-YE7CLzHZ	t	1	\N	2	2017-08-19 04:48:53+00	2017-08-19 04:48:53+00	\N	1718
1714	1-DRPs5vFJ	t	1	\N	2	2017-08-19 04:49:38+00	2017-08-19 04:49:38+00	\N	1719
1715	1-wpBC7uqq	t	1	\N	2	2017-08-19 04:51:26+00	2017-08-19 04:51:26+00	\N	1720
1716	1-xyiJJf8O	t	1	\N	2	2017-08-19 04:52:25+00	2017-08-19 04:52:25+00	\N	1721
1717	1-GgTyf9	t	1	\N	2	2017-08-19 04:53:34+00	2017-08-19 04:53:34+00	\N	1722
1718	1-X6oHXDHz	t	1	\N	2	2017-08-19 04:53:48+00	2017-08-19 04:53:48+00	\N	1723
1719	1-xOfJ1cv0	t	1	\N	2	2017-08-19 04:54:02+00	2017-08-19 04:54:02+00	\N	1724
1720	1-XDxhnGU60	t	1	\N	2	2017-08-19 04:54:13+00	2017-08-19 04:54:13+00	\N	1725
1721	1-xrINh8v	t	1	\N	2	2017-08-19 04:54:44+00	2017-08-19 04:54:44+00	\N	1726
1722	1-OYgCpJFEq	t	1	\N	2	2017-08-19 04:55:29+00	2017-08-19 04:55:29+00	\N	1727
1723	1-mw2UzfL	t	1	\N	2	2017-08-19 04:56:06+00	2017-08-19 04:56:06+00	\N	1728
1724	1-R65fACm	t	1	\N	2	2017-08-19 04:56:27+00	2017-08-19 04:56:27+00	\N	1729
1725	1-lYxu2Zs9q	t	1	\N	2	2017-08-19 04:57:03+00	2017-08-19 04:57:03+00	\N	1730
1726	1-Rg1SvWu9n	t	1	\N	2	2017-08-19 04:57:09+00	2017-08-19 04:57:09+00	\N	1731
1727	1-R6KurhW	t	1	\N	2	2017-08-19 04:57:14+00	2017-08-19 04:57:14+00	\N	1732
1728	1-El6fWBTNG	t	1	\N	2	2017-08-19 04:57:16+00	2017-08-19 04:57:16+00	\N	1733
1729	1-G6kh1NuX	t	1	\N	2	2017-08-19 04:57:30+00	2017-08-19 04:57:30+00	\N	1734
1730	1-yP0srnCV	t	1	\N	2	2017-08-19 04:59:00+00	2017-08-19 04:59:00+00	\N	1735
1731	1-wVsWIVA	t	1	\N	2	2017-08-19 04:59:04+00	2017-08-19 04:59:04+00	\N	1736
1732	1-zQULtD	t	1	\N	2	2017-08-19 04:59:10+00	2017-08-19 04:59:10+00	\N	1737
1733	1-XDrFwU4	t	1	\N	2	2017-08-19 05:00:15+00	2017-08-19 05:00:15+00	\N	1738
1734	1-YEYsLjT0Z	t	1	\N	2	2017-08-19 05:00:28+00	2017-08-19 05:00:28+00	\N	1739
1735	1-Kr0cqZcN	t	1	\N	2	2017-08-19 05:03:02+00	2017-08-19 05:03:02+00	\N	1740
1736	1-wpPfGNSVM	t	1	\N	2	2017-08-19 05:04:03+00	2017-08-19 05:04:03+00	\N	1741
1737	1-0OT2rc7	t	1	\N	2	2017-08-19 05:04:47+00	2017-08-19 05:04:47+00	\N	1742
1738	1-Z6Gumfj	t	1	\N	2	2017-08-19 05:05:26+00	2017-08-19 05:05:26+00	\N	1743
1739	1-QRCkVSn	t	1	\N	2	2017-08-19 05:06:16+00	2017-08-19 05:06:16+00	\N	1744
1740	1-YjS3JF0R	t	1	\N	2	2017-08-19 05:06:56+00	2017-08-19 05:06:56+00	\N	1745
1741	1-7gHqt9	t	1	\N	2	2017-08-19 05:07:35+00	2017-08-19 05:07:35+00	\N	1746
1742	1-kRWUO3hk	t	1	\N	2	2017-08-19 05:10:54+00	2017-08-19 05:10:54+00	\N	1747
1743	1-VmPClXUG8	t	1	\N	2	2017-08-19 05:12:11+00	2017-08-19 05:12:11+00	\N	1748
1744	1-L90cRYCm	t	1	\N	2	2017-08-19 05:12:19+00	2017-08-19 05:12:19+00	\N	1749
1745	1-2rspAf2	t	1	\N	2	2017-08-19 05:13:34+00	2017-08-19 05:13:34+00	\N	1750
1746	1-L9Bh1SY	t	1	\N	2	2017-08-19 05:14:58+00	2017-08-19 05:14:58+00	\N	1751
1747	1-NkZh0Afm0	t	1	\N	2	2017-08-19 05:16:31+00	2017-08-19 05:16:31+00	\N	1752
1748	1-ADPtGI8	t	1	\N	2	2017-08-19 05:17:02+00	2017-08-19 05:17:02+00	\N	1753
1749	1-VJIguGg	t	1	\N	2	2017-08-19 05:17:52+00	2017-08-19 05:17:52+00	\N	1754
1750	1-Nk2FXimG	t	1	\N	2	2017-08-19 05:18:55+00	2017-08-19 05:18:55+00	\N	1755
1751	1-zpktMMi4D	t	1	\N	2	2017-08-19 05:19:15+00	2017-08-19 05:19:15+00	\N	1756
1752	1-1wQc8TLA	t	1	\N	2	2017-08-19 05:19:23+00	2017-08-19 05:19:23+00	\N	1757
1753	1-QwtklHD	t	1	\N	2	2017-08-19 05:19:30+00	2017-08-19 05:19:30+00	\N	1758
1754	1-W6zH5mCX	t	1	\N	2	2017-08-19 05:19:41+00	2017-08-19 05:19:41+00	\N	1759
1755	1-XDLunnup	t	1	\N	2	2017-08-19 05:19:42+00	2017-08-19 05:19:42+00	\N	1760
1756	1-2rsrHq	t	1	\N	2	2017-08-19 05:20:04+00	2017-08-19 05:20:04+00	\N	1761
1757	1-mwETmCGk	t	1	\N	2	2017-08-19 05:20:17+00	2017-08-19 05:20:17+00	\N	1762
1758	1-kBU8c2J	t	1	\N	2	2017-08-19 05:20:27+00	2017-08-19 05:20:27+00	\N	1763
1759	1-yPRtXsV	t	1	\N	2	2017-08-19 05:20:31+00	2017-08-19 05:20:31+00	\N	1764
1760	1-qx2IATXE	t	1	\N	2	2017-08-19 05:21:05+00	2017-08-19 05:21:05+00	\N	1765
1761	1-pgRUnGFW	t	1	\N	2	2017-08-19 05:21:45+00	2017-08-19 05:21:45+00	\N	1766
1762	1-YE2fLEh0j	t	1	\N	2	2017-08-19 05:24:10+00	2017-08-19 05:24:10+00	\N	1767
1763	1-687CPip1	t	1	\N	2	2017-08-19 05:32:03+00	2017-08-19 05:32:03+00	\N	1768
1764	1-P1hKMtzB	t	1	\N	2	2017-08-19 05:41:42+00	2017-08-19 05:41:42+00	\N	1769
1765	1-0Rxuqcwx	t	1	\N	2	2017-08-19 05:43:48+00	2017-08-19 05:43:48+00	\N	1770
1766	1-wp2fGRCD	t	1	\N	2	2017-08-19 05:44:53+00	2017-08-19 05:44:53+00	\N	1771
1767	1-5yECZOfO8	t	1	\N	2	2017-08-19 05:47:04+00	2017-08-19 05:47:04+00	\N	1772
1768	1-7xT9UW8	t	1	\N	2	2017-08-19 05:48:53+00	2017-08-19 05:48:53+00	\N	1773
1769	1-kRPHEF2q	t	1	\N	2	2017-08-19 05:49:17+00	2017-08-19 05:49:17+00	\N	1774
1770	1-8q2tpi1E	t	1	\N	2	2017-08-19 05:53:20+00	2017-08-19 05:53:20+00	\N	1775
1771	1-mGToTOL	t	1	\N	2	2017-08-19 05:59:40+00	2017-08-19 05:59:40+00	\N	1776
1772	1-pOclfN	t	1	\N	2	2017-08-19 06:00:44+00	2017-08-19 06:00:44+00	\N	1777
1773	1-ZES56TE	t	1	\N	2	2017-08-19 06:01:44+00	2017-08-19 06:01:44+00	\N	1778
1774	1-Q5SmUPM	t	1	\N	2	2017-08-19 06:10:08+00	2017-08-19 06:10:08+00	\N	1779
1775	1-9rvUk2Fq	t	1	\N	2	2017-08-19 06:10:10+00	2017-08-19 06:10:10+00	\N	1780
1776	1-ZWF4sX	t	1	\N	2	2017-08-19 06:12:03+00	2017-08-19 06:12:03+00	\N	1781
1777	1-rAC82F76	t	1	\N	2	2017-08-19 06:14:26+00	2017-08-19 06:14:26+00	\N	1782
1778	1-v28c7Ktk	t	1	\N	2	2017-08-19 06:17:35+00	2017-08-19 06:17:35+00	\N	1783
1779	1-MlcqQHA	t	1	\N	2	2017-08-19 06:19:28+00	2017-08-19 06:19:28+00	\N	1784
1780	1-M8kTqfwZ	t	1	\N	2	2017-08-19 06:21:44+00	2017-08-19 06:21:44+00	\N	1785
1781	1-v2WtWLCX8	t	1	\N	2	2017-08-19 06:22:42+00	2017-08-19 06:22:42+00	\N	1786
1782	1-VOlcxEF9	t	1	\N	2	2017-08-19 06:23:30+00	2017-08-19 06:23:30+00	\N	1787
1783	1-ngulsk	t	1	\N	2	2017-08-19 06:23:40+00	2017-08-19 06:23:40+00	\N	1788
1784	1-KOAt2AFMW	t	1	\N	2	2017-08-19 06:23:48+00	2017-08-19 06:23:48+00	\N	1789
1785	1-9jiWTL	t	1	\N	2	2017-08-19 06:24:24+00	2017-08-19 06:24:24+00	\N	1790
1786	1-v2Vc7rTXE	t	1	\N	2	2017-08-19 06:24:26+00	2017-08-19 06:24:26+00	\N	1791
1787	1-6lUrGCpB	t	1	\N	2	2017-08-19 06:25:16+00	2017-08-19 06:25:16+00	\N	1792
1788	1-LgPT1SBJ	t	1	\N	2	2017-08-19 06:25:54+00	2017-08-19 06:25:54+00	\N	1793
1789	1-v2LFxfXW	t	1	\N	2	2017-08-19 06:26:06+00	2017-08-19 06:26:06+00	\N	1794
1790	1-XDgfPT6Q	t	1	\N	2	2017-08-19 06:26:21+00	2017-08-19 06:26:21+00	\N	1795
1791	1-31EFp0tqv	t	1	\N	2	2017-08-19 06:27:45+00	2017-08-19 06:27:45+00	\N	1796
1792	1-lkhWUGq	t	1	\N	2	2017-08-19 06:27:56+00	2017-08-19 06:27:56+00	\N	1797
1793	1-AD7CNWs8G	t	1	\N	2	2017-08-19 06:27:58+00	2017-08-19 06:27:58+00	\N	1798
1794	1-XQt7cVE	t	1	\N	2	2017-08-19 06:28:24+00	2017-08-19 06:28:24+00	\N	1799
1795	1-O7PSp0IvY	t	1	\N	2	2017-08-19 06:30:54+00	2017-08-19 06:30:54+00	\N	1800
1796	1-voioUQp	t	1	\N	2	2017-08-19 06:31:35+00	2017-08-19 06:31:35+00	\N	1801
1797	1-n5OHGKIq	t	1	\N	2	2017-08-19 06:32:29+00	2017-08-19 06:32:29+00	\N	1802
1798	1-q7sGUZG	t	1	\N	2	2017-08-19 06:33:20+00	2017-08-19 06:33:20+00	\N	1803
1799	1-YEyFL9SG9	t	1	\N	2	2017-08-19 06:33:35+00	2017-08-19 06:33:35+00	\N	1804
1800	1-QOF1Txp	t	1	\N	2	2017-08-19 06:34:18+00	2017-08-19 06:34:18+00	\N	1805
1801	1-W68I5AS66	t	1	\N	2	2017-08-19 06:34:19+00	2017-08-19 06:34:19+00	\N	1806
1802	1-o2oCrxszW	t	1	\N	2	2017-08-19 06:34:21+00	2017-08-19 06:34:21+00	\N	1807
1803	1-NkZh3smn	t	1	\N	2	2017-08-19 06:34:52+00	2017-08-19 06:34:52+00	\N	1808
1804	1-51SlH2	t	1	\N	2	2017-08-19 06:35:06+00	2017-08-19 06:35:06+00	\N	1809
1805	1-gJxSAjTNN	t	1	\N	2	2017-08-19 06:35:09+00	2017-08-19 06:35:09+00	\N	1810
1806	1-n5QhGqh9m	t	1	\N	2	2017-08-19 06:35:10+00	2017-08-19 06:35:10+00	\N	1811
1807	1-OYnhpkTEX	t	1	\N	2	2017-08-19 06:35:21+00	2017-08-19 06:35:21+00	\N	1812
1808	1-4xLHBBir	t	1	\N	2	2017-08-19 06:35:38+00	2017-08-19 06:35:38+00	\N	1813
1809	1-KO1U1HM9	t	1	\N	2	2017-08-19 06:35:40+00	2017-08-19 06:35:40+00	\N	1814
1810	1-n5XH70c9Q	t	1	\N	2	2017-08-19 06:35:52+00	2017-08-19 06:35:52+00	\N	1815
1811	1-KOXHgTML	t	1	\N	2	2017-08-19 06:36:00+00	2017-08-19 06:36:00+00	\N	1816
1812	1-OYrC1SEY	t	1	\N	2	2017-08-19 06:36:18+00	2017-08-19 06:36:18+00	\N	1817
1813	1-0R5fG5CB	t	1	\N	2	2017-08-19 06:36:21+00	2017-08-19 06:36:21+00	\N	1818
1814	1-Dk0IQUWw	t	1	\N	2	2017-08-19 06:36:22+00	2017-08-19 06:36:22+00	\N	1819
1815	1-o2Lcr6To	t	1	\N	2	2017-08-19 06:36:23+00	2017-08-19 06:36:23+00	\N	1820
1816	1-2kVFplur	t	1	\N	2	2017-08-19 06:36:35+00	2017-08-19 06:36:35+00	\N	1821
1817	1-Z1i5EIv	t	1	\N	2	2017-08-19 06:36:36+00	2017-08-19 06:36:36+00	\N	1822
1818	1-v2Vc7BiQo	t	1	\N	2	2017-08-19 06:36:39+00	2017-08-19 06:36:39+00	\N	1823
1819	1-jjUphR	t	1	\N	2	2017-08-19 06:36:44+00	2017-08-19 06:36:44+00	\N	1824
1820	1-2ECkptnm	t	1	\N	2	2017-08-19 06:36:50+00	2017-08-19 06:36:50+00	\N	1825
1821	1-31JImRHgP	t	1	\N	2	2017-08-19 06:37:08+00	2017-08-19 06:37:08+00	\N	1826
1822	1-PNvCKfzK	t	1	\N	2	2017-08-19 06:37:12+00	2017-08-19 06:37:12+00	\N	1827
1823	1-58nsPTzV	t	1	\N	2	2017-08-19 06:37:32+00	2017-08-19 06:37:32+00	\N	1828
1824	1-9rGfWTE3	t	1	\N	2	2017-08-19 06:37:37+00	2017-08-19 06:37:37+00	\N	1829
1825	1-L9fROCBp	t	1	\N	2	2017-08-19 06:37:40+00	2017-08-19 06:37:40+00	\N	1830
1826	1-313TmGTgj	t	1	\N	2	2017-08-19 06:38:31+00	2017-08-19 06:38:31+00	\N	1831
1827	1-r0msJh7Y	t	1	\N	2	2017-08-19 06:38:46+00	2017-08-19 06:38:46+00	\N	1832
1828	1-pg9cJuP7	t	1	\N	2	2017-08-19 06:39:09+00	2017-08-19 06:39:09+00	\N	1833
1830	1-L9PIRKiBv	t	1	\N	2	2017-08-19 06:39:19+00	2017-08-19 06:39:19+00	\N	1835
1831	1-5yNH00Uz	t	1	\N	2	2017-08-19 06:39:43+00	2017-08-19 06:39:43+00	\N	1836
1832	1-KO5uphZ	t	1	\N	2	2017-08-19 06:39:47+00	2017-08-19 06:39:47+00	\N	1837
1833	1-GZgI1AcKP	t	1	\N	2	2017-08-19 06:40:00+00	2017-08-19 06:40:00+00	\N	1838
1834	1-gJZulKfD	t	1	\N	2	2017-08-19 06:40:44+00	2017-08-19 06:40:44+00	\N	1839
1835	1-J62IlSVZ	t	1	\N	2	2017-08-19 06:40:54+00	2017-08-19 06:40:54+00	\N	1840
1836	1-lrC7tZ	t	1	\N	2	2017-08-19 06:41:03+00	2017-08-19 06:41:03+00	\N	1841
1837	1-zp3uDH4Q	t	1	\N	2	2017-08-19 06:41:21+00	2017-08-19 06:41:21+00	\N	1842
1838	1-ElOszuE	t	1	\N	2	2017-08-19 06:41:25+00	2017-08-19 06:41:25+00	\N	1843
1839	1-zQUMVs4N	t	1	\N	2	2017-08-19 06:42:26+00	2017-08-19 06:42:26+00	\N	1844
1840	1-J6GtgIn	t	1	\N	2	2017-08-19 06:42:26+00	2017-08-19 06:42:26+00	\N	1845
1841	1-xklI1Zur	t	1	\N	2	2017-08-19 06:44:27+00	2017-08-19 06:44:27+00	\N	1846
1842	1-BBvtKsP	t	1	\N	2	2017-08-19 06:46:35+00	2017-08-19 06:46:35+00	\N	1847
1843	1-31vUmptw	t	1	\N	2	2017-08-19 06:46:50+00	2017-08-19 06:46:50+00	\N	1848
1844	1-1w0TMYtLL	t	1	\N	2	2017-08-19 06:47:09+00	2017-08-19 06:47:09+00	\N	1849
1845	1-R6lC9T9K	t	1	\N	2	2017-08-19 06:51:13+00	2017-08-19 06:51:13+00	\N	1850
1846	1-82LHjBcn1	t	1	\N	2	2017-08-19 06:57:48+00	2017-08-19 06:57:48+00	\N	1851
1847	1-nZOtPc9Y	t	1	\N	2	2017-08-19 06:58:29+00	2017-08-19 06:58:29+00	\N	1852
1848	1-GLSJ1cl	t	1	\N	2	2017-08-19 06:58:30+00	2017-08-19 06:58:30+00	\N	1853
1849	1-1wMtOHLO	t	1	\N	2	2017-08-19 07:09:10+00	2017-08-19 07:09:10+00	\N	1854
1850	1-DkZsBjSWO	t	1	\N	2	2017-08-19 07:11:38+00	2017-08-19 07:11:38+00	\N	1855
1851	1-3VcpjfgB	t	1	\N	2	2017-08-19 07:12:16+00	2017-08-19 07:12:16+00	\N	1856
1852	1-1wlhjfLg	t	1	\N	2	2017-08-19 07:15:47+00	2017-08-19 07:15:47+00	\N	1857
1853	1-OYGtmiD	t	1	\N	2	2017-08-19 07:15:48+00	2017-08-19 07:15:48+00	\N	1858
1854	1-RRTAC9E	t	1	\N	2	2017-08-19 07:16:56+00	2017-08-19 07:16:56+00	\N	1859
1855	1-V5Hx5IzN	t	1	\N	2	2017-08-19 07:19:44+00	2017-08-19 07:19:44+00	\N	1860
1856	1-L3CKfBq	t	1	\N	2	2017-08-19 07:19:46+00	2017-08-19 07:19:46+00	\N	1861
1857	1-o2Ys4t1X	t	1	\N	2	2017-08-19 07:23:51+00	2017-08-19 07:23:51+00	\N	1862
1858	1-qxYtBHo	t	1	\N	2	2017-08-19 07:31:51+00	2017-08-19 07:31:51+00	\N	1863
1859	1-X6rTXVh65	t	1	\N	2	2017-08-19 07:32:45+00	2017-08-19 07:32:45+00	\N	1864
1860	1-KrATq8Fvo	t	1	\N	2	2017-08-19 07:37:01+00	2017-08-19 07:37:01+00	\N	1865
1861	1-48RCB0uOq	t	1	\N	2	2017-08-19 07:40:33+00	2017-08-19 07:40:33+00	\N	1866
1862	1-O78TpgFO	t	1	\N	2	2017-08-19 07:58:49+00	2017-08-19 07:58:49+00	\N	1867
1863	1-X6hXqIz	t	1	\N	2	2017-08-19 07:59:30+00	2017-08-19 07:59:30+00	\N	1868
1864	1-8nU6ysl	t	1	\N	2	2017-08-19 08:04:24+00	2017-08-19 08:04:24+00	\N	1869
1865	1-g52c7Ij	t	1	\N	2	2017-08-19 08:04:27+00	2017-08-19 08:04:27+00	\N	1870
1866	1-xkoTpUm	t	1	\N	2	2017-08-19 08:05:52+00	2017-08-19 08:05:52+00	\N	1871
1867	1-1oTKUL2	t	1	\N	2	2017-08-19 08:11:06+00	2017-08-19 08:11:06+00	\N	1872
1868	1-E6SWgFNn	t	1	\N	2	2017-08-19 08:11:13+00	2017-08-19 08:11:13+00	\N	1873
1869	1-Q10couxw	t	1	\N	2	2017-08-19 08:11:30+00	2017-08-19 08:11:30+00	\N	1874
1870	1-QW5UBsx5	t	1	\N	2	2017-08-19 08:14:26+00	2017-08-19 08:14:26+00	\N	1875
1871	1-Q4u6NIxN	t	1	\N	2	2017-08-19 08:18:29+00	2017-08-19 08:18:29+00	\N	1876
1872	1-pYPHnxCQ	t	1	\N	2	2017-08-19 08:19:41+00	2017-08-19 08:19:41+00	\N	1877
1873	1-zBHPfj	t	1	\N	2	2017-08-19 08:19:57+00	2017-08-19 08:19:57+00	\N	1878
1874	1-YEKC7Fj	t	1	\N	2	2017-08-19 08:20:12+00	2017-08-19 08:20:12+00	\N	1879
1875	1-lYWU3uP	t	1	\N	2	2017-08-19 08:20:53+00	2017-08-19 08:20:53+00	\N	1880
1876	1-n50s4U9k	t	1	\N	2	2017-08-19 08:23:13+00	2017-08-19 08:23:13+00	\N	1881
1877	1-Z6JH5pcP	t	1	\N	2	2017-08-19 08:29:57+00	2017-08-19 08:29:57+00	\N	1882
1878	1-wWuLkFl	t	1	\N	2	2017-08-19 08:30:56+00	2017-08-19 08:30:56+00	\N	1883
1879	1-wpBCGZhQ	t	1	\N	2	2017-08-19 08:34:28+00	2017-08-19 08:34:28+00	\N	1884
1880	1-BNsKsG	t	1	\N	2	2017-08-19 08:35:17+00	2017-08-19 08:35:17+00	\N	1885
1881	1-ERju3pFN1	t	1	\N	2	2017-08-19 08:36:45+00	2017-08-19 08:36:45+00	\N	1886
1882	1-KrOsph6	t	1	\N	2	2017-08-19 08:40:19+00	2017-08-19 08:40:19+00	\N	1887
1883	1-GlsYsKP	t	1	\N	2	2017-08-19 08:41:55+00	2017-08-19 08:41:55+00	\N	1888
1884	1-OY4FpmtEr	t	1	\N	2	2017-08-19 08:44:10+00	2017-08-19 08:44:10+00	\N	1889
1885	1-XJsOu6J	t	1	\N	2	2017-08-19 08:45:42+00	2017-08-19 08:45:42+00	\N	1890
1886	1-5ygHZYhy	t	1	\N	2	2017-08-19 08:46:05+00	2017-08-19 08:46:05+00	\N	1891
1887	1-OYRHkIEM	t	1	\N	2	2017-08-19 08:47:30+00	2017-08-19 08:47:30+00	\N	1892
1888	1-RBfJuk	t	1	\N	2	2017-08-19 08:50:35+00	2017-08-19 08:50:35+00	\N	1893
1889	1-pquzpc1	t	1	\N	2	2017-08-19 08:54:50+00	2017-08-19 08:54:50+00	\N	1894
1890	1-J6Ecq8sGy	t	1	\N	2	2017-08-19 08:56:22+00	2017-08-19 08:56:22+00	\N	1895
1891	1-rOuEfk	t	1	\N	2	2017-08-19 08:59:58+00	2017-08-19 08:59:58+00	\N	1896
1892	1-wppiGKfo	t	1	\N	2	2017-08-19 09:00:02+00	2017-08-19 09:00:02+00	\N	1897
1893	1-Rzsv6IO	t	1	\N	2	2017-08-19 09:00:23+00	2017-08-19 09:00:23+00	\N	1898
1894	1-lDT6IGk	t	1	\N	2	2017-08-19 09:02:53+00	2017-08-19 09:02:53+00	\N	1899
1895	1-yPztr8hZV	t	1	\N	2	2017-08-19 09:02:53+00	2017-08-19 09:02:53+00	\N	1900
1896	1-WrURcl	t	1	\N	2	2017-08-19 09:04:10+00	2017-08-19 09:04:10+00	\N	1901
1897	1-m2HjKhGy	t	1	\N	2	2017-08-19 09:05:05+00	2017-08-19 09:05:05+00	\N	1902
1898	1-r9CKT7N	t	1	\N	2	2017-08-19 09:05:36+00	2017-08-19 09:05:36+00	\N	1903
1899	1-OYlhpOSvv	t	1	\N	2	2017-08-19 09:05:37+00	2017-08-19 09:05:37+00	\N	1904
1900	1-ER9t3ouNN	t	1	\N	2	2017-08-19 09:06:04+00	2017-08-19 09:06:04+00	\N	1905
1901	1-voi7gC0	t	1	\N	2	2017-08-19 09:06:49+00	2017-08-19 09:06:49+00	\N	1906
1902	1-0Ros0cB	t	1	\N	2	2017-08-19 09:09:24+00	2017-08-19 09:09:24+00	\N	1907
1903	1-V6ulLsn	t	1	\N	2	2017-08-19 09:09:47+00	2017-08-19 09:09:47+00	\N	1908
1904	1-5DsZZix	t	1	\N	2	2017-08-19 09:10:02+00	2017-08-19 09:10:02+00	\N	1909
1905	1-rk1tA4s76	t	1	\N	2	2017-08-19 09:11:36+00	2017-08-19 09:11:36+00	\N	1910
1906	1-73DiAAi8J	t	1	\N	2	2017-08-19 09:11:56+00	2017-08-19 09:11:56+00	\N	1911
1907	1-MqTVcm	t	1	\N	2	2017-08-19 09:15:27+00	2017-08-19 09:15:27+00	\N	1912
1908	1-Z61C5Jix	t	1	\N	2	2017-08-19 09:15:46+00	2017-08-19 09:15:46+00	\N	1913
1909	1-R8IvgC9r	t	1	\N	2	2017-08-19 09:16:00+00	2017-08-19 09:16:00+00	\N	1914
1910	1-Z0C5Kfz	t	1	\N	2	2017-08-19 09:16:39+00	2017-08-19 09:16:39+00	\N	1915
1911	1-ADRcvCGv	t	1	\N	2	2017-08-19 09:17:46+00	2017-08-19 09:17:46+00	\N	1916
1912	1-312tpqiD	t	1	\N	2	2017-08-19 09:18:23+00	2017-08-19 09:18:23+00	\N	1917
1913	1-KOZTqLhMG	t	1	\N	2	2017-08-19 09:19:52+00	2017-08-19 09:19:52+00	\N	1918
1914	1-mrFjptO4	t	1	\N	2	2017-08-19 09:20:24+00	2017-08-19 09:20:24+00	\N	1919
1915	1-RZSryc9M	t	1	\N	2	2017-08-19 09:21:17+00	2017-08-19 09:21:17+00	\N	1920
1916	1-B1I7KuzK	t	1	\N	2	2017-08-19 09:21:20+00	2017-08-19 09:21:20+00	\N	1921
1917	1-31kupKuO	t	1	\N	2	2017-08-19 09:21:28+00	2017-08-19 09:21:28+00	\N	1922
1918	1-J60Uq8sA	t	1	\N	2	2017-08-19 09:21:57+00	2017-08-19 09:21:57+00	\N	1923
1919	1-kRyhMC2W	t	1	\N	2	2017-08-19 09:22:22+00	2017-08-19 09:22:22+00	\N	1924
1920	1-j22TnniA	t	1	\N	2	2017-08-19 09:23:28+00	2017-08-19 09:23:28+00	\N	1925
1921	1-yRUr4Sj	t	1	\N	2	2017-08-19 09:24:32+00	2017-08-19 09:24:32+00	\N	1926
1922	1-xLcRC8K	t	1	\N	2	2017-08-19 09:25:46+00	2017-08-19 09:25:46+00	\N	1927
1923	1-AD2F7hG4	t	1	\N	2	2017-08-19 09:26:22+00	2017-08-19 09:26:22+00	\N	1928
1924	1-6BurqIpv	t	1	\N	2	2017-08-19 09:27:14+00	2017-08-19 09:27:14+00	\N	1929
1925	1-qx3uBHm	t	1	\N	2	2017-08-19 09:27:28+00	2017-08-19 09:27:28+00	\N	1930
1926	1-4xmhmFr	t	1	\N	2	2017-08-19 09:28:43+00	2017-08-19 09:28:43+00	\N	1931
1927	1-BB8S79hzv	t	1	\N	2	2017-08-19 09:32:01+00	2017-08-19 09:32:01+00	\N	1932
1928	1-ABSxUGz	t	1	\N	2	2017-08-19 09:33:36+00	2017-08-19 09:33:36+00	\N	1933
1929	1-gJnFAnfz	t	1	\N	2	2017-08-19 09:33:42+00	2017-08-19 09:33:42+00	\N	1934
1930	1-8Zh6ysK	t	1	\N	2	2017-08-19 09:36:59+00	2017-08-19 09:36:59+00	\N	1935
1931	1-rkGc88i7w	t	1	\N	2	2017-08-19 09:38:00+00	2017-08-19 09:38:00+00	\N	1936
1932	1-ElZU0Cww	t	1	\N	2	2017-08-19 09:46:16+00	2017-08-19 09:46:16+00	\N	1937
1933	1-AnMI4fG0	t	1	\N	2	2017-08-19 09:49:45+00	2017-08-19 09:49:45+00	\N	1938
1934	1-PnIKOFzR	t	1	\N	2	2017-08-19 09:50:19+00	2017-08-19 09:50:19+00	\N	1939
1935	1-rkZh8QT9	t	1	\N	2	2017-08-19 09:50:56+00	2017-08-19 09:50:56+00	\N	1940
1936	1-qXtRHZ5	t	1	\N	2	2017-08-19 09:52:07+00	2017-08-19 09:52:07+00	\N	1941
1937	1-4MCZUOK	t	1	\N	2	2017-08-19 09:52:32+00	2017-08-19 09:52:32+00	\N	1942
1938	1-OYZIpLcQ	t	1	\N	2	2017-08-19 09:53:41+00	2017-08-19 09:53:41+00	\N	1943
1939	1-j2AuDSWw	t	1	\N	2	2017-08-19 09:54:09+00	2017-08-19 09:54:09+00	\N	1944
1940	1-O4upAsy	t	1	\N	2	2017-08-19 09:59:47+00	2017-08-19 09:59:47+00	\N	1945
1941	1946-R3Cgt95	t	1	\N	2	2017-08-19 17:12:44+00	2017-08-19 17:12:44+00	\N	1946
1942	1947-4xATXUxx	t	1	\N	2	2017-08-20 02:43:10+00	2017-08-20 02:43:10+00	\N	1947
1943	1948-73VCJI8D	t	1	\N	2	2017-08-20 05:30:26+00	2017-08-20 05:30:26+00	\N	1948
1944	1949-XRCvT6X	t	1	\N	2	2017-08-20 05:49:04+00	2017-08-20 05:49:04+00	\N	1949
1945	1950-5whOUz4	t	1	\N	2	2017-08-20 05:55:30+00	2017-08-20 05:55:30+00	\N	1950
1946	1951-YE1TLQF0W	t	1	\N	2	2017-08-20 06:36:48+00	2017-08-20 06:36:48+00	\N	1951
\.


--
-- Data for Name: codes_activities; Type: TABLE DATA; Schema: public; Owner: evently_user
--

COPY codes_activities (code_id, activity_id, created_at) FROM stdin;
11	2	2017-08-04 04:47:46+00
12	2	2017-08-03 14:31:11+00
142	2	2017-08-03 09:37:46+00
146	2	2017-08-02 11:31:28+00
148	2	2017-08-02 12:52:48+00
445	5	2017-08-04 07:09:26+00
6	6	2017-08-09 05:07:29+00
6	6	2017-08-09 05:07:52+00
6	6	2017-08-09 05:09:08+00
6	6	2017-08-10 02:22:28+00
497	2	2017-08-10 07:25:46+00
711	64	2017-08-15 05:08:40+00
711	64	2017-08-15 05:32:23+00
711	64	2017-08-15 09:00:06+00
711	6	2017-08-15 09:22:01+00
711	6	2017-08-15 09:47:08+00
711	6	2017-08-15 10:31:43+00
711	6	2017-08-15 10:43:39+00
747	6	2017-08-15 11:24:31+00
711	6	2017-08-15 12:43:27+00
711	6	2017-08-15 12:44:24+00
711	2	2017-08-15 13:35:36+00
711	6	2017-08-15 13:54:03+00
711	6	2017-08-15 13:54:21+00
711	6	2017-08-15 13:55:04+00
711	43	2017-08-15 14:30:50+00
5	2	2017-08-16 14:19:37+00
6	2	2017-08-16 15:39:42+00
333	6	2017-08-16 15:44:18+00
333	2	2017-08-16 15:44:51+00
900	43	2017-08-17 07:50:54+00
1056	2	2017-08-18 02:57:34+00
526	65	2017-08-18 02:59:38+00
1056	65	2017-08-18 03:02:07+00
581	65	2017-08-18 03:03:57+00
854	65	2017-08-18 03:04:29+00
854	64	2017-08-18 03:04:44+00
854	66	2017-08-18 03:04:48+00
526	67	2017-08-18 03:05:48+00
1070	68	2017-08-18 03:06:07+00
1072	68	2017-08-18 03:06:13+00
1056	67	2017-08-18 03:06:35+00
1070	67	2017-08-18 03:07:14+00
1082	65	2017-08-18 03:07:15+00
806	65	2017-08-18 03:07:53+00
597	68	2017-08-18 03:08:53+00
854	67	2017-08-18 03:09:00+00
630	65	2017-08-18 03:09:22+00
1087	68	2017-08-18 03:09:30+00
1086	68	2017-08-18 03:09:37+00
963	68	2017-08-18 03:10:14+00
630	64	2017-08-18 03:10:57+00
806	68	2017-08-18 03:11:18+00
582	68	2017-08-18 03:12:54+00
1086	65	2017-08-18 03:13:28+00
581	68	2017-08-18 03:13:44+00
1070	65	2017-08-18 03:14:18+00
919	65	2017-08-18 03:15:37+00
1072	67	2017-08-18 03:18:46+00
925	68	2017-08-18 03:18:59+00
919	68	2017-08-18 03:19:08+00
704	68	2017-08-18 03:19:40+00
1095	65	2017-08-18 03:19:44+00
1095	67	2017-08-18 03:20:29+00
975	65	2017-08-18 03:22:08+00
975	67	2017-08-18 03:22:30+00
1094	67	2017-08-18 03:23:08+00
1094	65	2017-08-18 03:23:22+00
518	67	2017-08-18 03:24:55+00
303	67	2017-08-18 03:25:40+00
509	67	2017-08-18 03:25:56+00
518	68	2017-08-18 03:26:56+00
509	68	2017-08-18 03:27:09+00
303	68	2017-08-18 03:27:20+00
11	70	2017-08-18 03:27:24+00
1100	68	2017-08-18 03:27:33+00
1100	67	2017-08-18 03:27:37+00
1100	65	2017-08-18 03:27:50+00
1100	66	2017-08-18 03:28:01+00
1110	65	2017-08-18 03:32:09+00
1104	64	2017-08-18 03:32:26+00
806	70	2017-08-18 03:32:27+00
1065	64	2017-08-18 03:33:45+00
1116	68	2017-08-18 03:33:53+00
989	68	2017-08-18 03:33:54+00
1065	67	2017-08-18 03:34:08+00
1101	68	2017-08-18 03:34:25+00
1109	68	2017-08-18 03:34:36+00
1121	64	2017-08-18 03:39:09+00
1113	70	2017-08-18 03:39:11+00
1121	67	2017-08-18 03:39:27+00
1074	49	2017-08-18 03:40:24+00
839	67	2017-08-18 03:40:35+00
38	64	2017-08-18 03:43:10+00
38	67	2017-08-18 03:43:20+00
752	67	2017-08-18 03:45:08+00
752	65	2017-08-18 03:45:15+00
1153	68	2017-08-18 03:48:56+00
39	66	2017-08-18 03:49:03+00
777	68	2017-08-18 03:49:16+00
41	67	2017-08-18 03:49:26+00
39	67	2017-08-18 03:49:49+00
1149	56	2017-08-18 03:50:23+00
41	64	2017-08-18 03:50:42+00
1139	65	2017-08-18 03:50:53+00
1139	67	2017-08-18 03:50:59+00
1146	67	2017-08-18 03:51:08+00
1151	67	2017-08-18 03:52:01+00
777	67	2017-08-18 03:52:29+00
1000	68	2017-08-18 03:54:03+00
1001	68	2017-08-18 03:54:11+00
1150	51	2017-08-18 03:55:00+00
592	68	2017-08-18 03:55:06+00
1069	67	2017-08-18 03:55:12+00
1069	64	2017-08-18 03:55:32+00
618	68	2017-08-18 04:02:34+00
1175	67	2017-08-18 04:02:48+00
1181	67	2017-08-18 04:04:26+00
814	67	2017-08-18 04:05:42+00
814	64	2017-08-18 04:05:56+00
1139	70	2017-08-18 04:06:31+00
1183	67	2017-08-18 04:07:29+00
1080	67	2017-08-18 04:09:39+00
1080	65	2017-08-18 04:10:49+00
763	68	2017-08-18 04:11:53+00
1183	65	2017-08-18 04:13:32+00
814	68	2017-08-18 04:19:59+00
1080	68	2017-08-18 04:20:05+00
1002	65	2017-08-18 04:21:20+00
1142	51	2017-08-18 04:22:56+00
1002	67	2017-08-18 04:23:48+00
1151	65	2017-08-18 04:25:08+00
1218	67	2017-08-18 04:29:49+00
1218	67	2017-08-18 04:29:49+00
1218	65	2017-08-18 04:30:27+00
1183	56	2017-08-18 04:32:22+00
864	56	2017-08-18 04:35:14+00
517	67	2017-08-18 04:36:03+00
925	64	2017-08-18 04:40:32+00
1055	64	2017-08-18 04:41:58+00
1055	67	2017-08-18 04:42:11+00
1221	51	2017-08-18 04:42:30+00
919	67	2017-08-18 04:42:37+00
919	64	2017-08-18 04:42:47+00
864	47	2017-08-18 04:43:12+00
1243	59	2017-08-18 04:45:25+00
763	63	2017-08-18 04:46:51+00
1242	65	2017-08-18 04:47:25+00
864	59	2017-08-18 04:49:01+00
1244	63	2017-08-18 04:49:15+00
1183	45	2017-08-18 04:50:35+00
1255	66	2017-08-18 04:52:05+00
763	56	2017-08-18 04:53:57+00
1258	66	2017-08-18 05:00:44+00
1261	66	2017-08-18 05:02:24+00
1263	66	2017-08-18 05:04:53+00
40	48	2017-08-18 05:06:31+00
1069	48	2017-08-18 05:08:05+00
864	48	2017-08-18 05:08:20+00
1095	48	2017-08-18 05:08:45+00
1261	48	2017-08-18 05:09:15+00
969	65	2017-08-18 05:14:30+00
969	67	2017-08-18 05:15:38+00
1272	66	2017-08-18 05:17:54+00
1275	48	2017-08-18 05:19:37+00
1273	48	2017-08-18 05:20:00+00
943	48	2017-08-18 05:24:11+00
1280	66	2017-08-18 05:25:05+00
946	48	2017-08-18 05:25:07+00
518	56	2017-08-18 05:25:25+00
509	56	2017-08-18 05:25:34+00
303	56	2017-08-18 05:25:41+00
947	48	2017-08-18 05:25:48+00
1087	56	2017-08-18 05:26:12+00
518	48	2017-08-18 05:26:31+00
303	48	2017-08-18 05:26:38+00
509	48	2017-08-18 05:26:45+00
1283	56	2017-08-18 05:29:48+00
969	56	2017-08-18 05:30:20+00
1284	48	2017-08-18 05:30:33+00
1039	66	2017-08-18 05:30:41+00
1282	51	2017-08-18 05:30:53+00
969	48	2017-08-18 05:33:36+00
1181	56	2017-08-18 05:35:28+00
626	56	2017-08-18 05:38:16+00
1291	66	2017-08-18 05:40:38+00
1278	56	2017-08-18 05:42:22+00
1257	68	2017-08-18 05:43:26+00
1292	66	2017-08-18 05:44:28+00
1294	68	2017-08-18 05:44:42+00
677	66	2017-08-18 05:46:17+00
1293	66	2017-08-18 05:46:55+00
1266	43	2017-08-18 05:49:42+00
1005	68	2017-08-18 05:51:50+00
1175	68	2017-08-18 05:53:39+00
1218	70	2017-08-18 05:55:23+00
960	66	2017-08-18 05:56:10+00
142	54	2017-08-18 06:07:08+00
1069	46	2017-08-18 06:08:22+00
1095	46	2017-08-18 06:09:06+00
1306	54	2017-08-18 06:10:24+00
515	68	2017-08-18 06:10:25+00
552	46	2017-08-18 06:11:55+00
1305	56	2017-08-18 06:12:02+00
950	68	2017-08-18 06:12:06+00
1307	66	2017-08-18 06:14:02+00
1064	46	2017-08-18 06:14:04+00
1234	68	2017-08-18 06:16:32+00
509	46	2017-08-18 06:17:22+00
448	46	2017-08-18 06:17:30+00
1312	2	2017-08-18 06:17:32+00
1303	46	2017-08-18 06:18:06+00
552	66	2017-08-18 06:18:34+00
518	46	2017-08-18 06:18:38+00
1302	46	2017-08-18 06:19:35+00
939	46	2017-08-18 06:20:17+00
303	46	2017-08-18 06:21:16+00
1301	46	2017-08-18 06:21:54+00
969	46	2017-08-18 06:22:17+00
850	46	2017-08-18 06:23:18+00
1261	46	2017-08-18 06:23:52+00
1251	46	2017-08-18 06:30:17+00
1313	46	2017-08-18 06:33:56+00
1316	46	2017-08-18 06:36:13+00
549	46	2017-08-18 06:36:19+00
1122	46	2017-08-18 06:38:14+00
41	45	2017-08-18 06:44:22+00
1320	46	2017-08-18 06:48:57+00
1321	46	2017-08-18 06:49:38+00
1239	46	2017-08-18 06:53:13+00
969	50	2017-08-18 07:06:05+00
1237	50	2017-08-18 07:06:24+00
1322	50	2017-08-18 07:06:28+00
1239	50	2017-08-18 07:06:32+00
1261	50	2017-08-18 07:10:31+00
1301	50	2017-08-18 07:12:23+00
1069	50	2017-08-18 07:14:13+00
1017	68	2017-08-18 07:44:23+00
1303	50	2017-08-18 07:47:36+00
40	50	2017-08-18 07:47:56+00
1309	68	2017-08-18 07:48:13+00
776	68	2017-08-18 07:51:54+00
996	68	2017-08-18 07:52:58+00
1233	54	2017-08-18 07:54:47+00
38	55	2017-08-18 07:59:53+00
1303	55	2017-08-18 08:02:21+00
39	44	2017-08-18 08:02:44+00
1261	44	2017-08-18 08:02:52+00
1261	55	2017-08-18 08:04:23+00
1280	68	2017-08-18 08:05:20+00
1316	44	2017-08-18 08:08:56+00
1338	44	2017-08-18 08:09:35+00
1339	68	2017-08-18 08:09:55+00
1302	44	2017-08-18 08:10:07+00
833	55	2017-08-18 08:10:39+00
1338	55	2017-08-18 08:11:07+00
1284	55	2017-08-18 08:12:08+00
859	55	2017-08-18 08:14:05+00
1313	55	2017-08-18 08:14:37+00
549	55	2017-08-18 08:15:01+00
552	55	2017-08-18 08:15:22+00
1246	55	2017-08-18 08:15:34+00
1313	60	2017-08-18 08:16:48+00
752	68	2017-08-18 08:16:58+00
1151	68	2017-08-18 08:17:08+00
947	44	2017-08-18 08:18:12+00
1183	60	2017-08-18 08:18:15+00
1326	44	2017-08-18 08:18:21+00
1340	44	2017-08-18 08:18:38+00
833	44	2017-08-18 08:19:08+00
962	44	2017-08-18 08:22:16+00
962	55	2017-08-18 08:24:48+00
97	2	2017-08-18 08:39:36+00
900	51	2017-08-18 08:47:27+00
1301	44	2017-08-18 08:47:31+00
1354	44	2017-08-18 08:47:44+00
934	55	2017-08-18 08:47:56+00
1301	55	2017-08-18 08:49:53+00
1355	55	2017-08-18 08:50:44+00
1356	55	2017-08-18 08:50:57+00
1358	44	2017-08-18 08:51:45+00
1360	55	2017-08-18 08:53:23+00
1359	55	2017-08-18 08:53:33+00
1361	55	2017-08-18 08:53:44+00
1362	44	2017-08-18 08:55:24+00
1355	44	2017-08-18 08:55:40+00
1360	44	2017-08-18 08:55:49+00
934	44	2017-08-18 08:56:18+00
1109	55	2017-08-18 08:56:22+00
1101	55	2017-08-18 08:56:26+00
1361	44	2017-08-18 08:56:34+00
1363	55	2017-08-18 08:56:58+00
1109	44	2017-08-18 08:58:23+00
1101	44	2017-08-18 08:58:27+00
1367	52	2017-08-18 08:59:18+00
1364	63	2017-08-18 08:59:29+00
1353	60	2017-08-18 08:59:59+00
1335	52	2017-08-18 09:00:25+00
1363	52	2017-08-18 09:00:51+00
1351	52	2017-08-18 09:01:08+00
11	52	2017-08-18 09:02:02+00
646	52	2017-08-18 09:02:15+00
1335	60	2017-08-18 09:02:24+00
900	52	2017-08-18 09:02:25+00
1109	52	2017-08-18 09:02:47+00
1101	52	2017-08-18 09:03:06+00
1356	60	2017-08-18 09:03:30+00
934	60	2017-08-18 09:03:35+00
1359	60	2017-08-18 09:03:40+00
1351	51	2017-08-18 09:04:47+00
1355	60	2017-08-18 09:05:08+00
313	60	2017-08-18 09:05:17+00
1360	60	2017-08-18 09:05:21+00
1361	60	2017-08-18 09:05:24+00
1363	60	2017-08-18 09:06:55+00
1375	52	2017-08-18 09:07:18+00
1376	52	2017-08-18 09:07:38+00
1354	52	2017-08-18 09:07:53+00
1374	52	2017-08-18 09:08:02+00
646	60	2017-08-18 09:08:32+00
98	52	2017-08-18 09:08:38+00
1377	52	2017-08-18 09:08:53+00
1378	52	2017-08-18 09:08:56+00
1373	52	2017-08-18 09:09:03+00
1109	60	2017-08-18 09:09:07+00
1101	60	2017-08-18 09:09:13+00
1383	52	2017-08-18 09:10:51+00
1382	60	2017-08-18 09:10:54+00
1365	60	2017-08-18 09:11:04+00
1379	60	2017-08-18 09:11:24+00
1056	60	2017-08-18 09:11:30+00
1353	52	2017-08-18 09:11:32+00
1380	52	2017-08-18 09:12:39+00
1369	52	2017-08-18 09:13:01+00
1376	60	2017-08-18 09:13:02+00
1375	60	2017-08-18 09:13:08+00
1370	60	2017-08-18 09:13:19+00
1365	52	2017-08-18 09:13:32+00
1379	52	2017-08-18 09:13:40+00
98	60	2017-08-18 09:13:41+00
1056	52	2017-08-18 09:14:03+00
1230	60	2017-08-18 09:14:29+00
1357	60	2017-08-18 09:14:38+00
1391	52	2017-08-18 09:14:43+00
1389	52	2017-08-18 09:14:46+00
1387	52	2017-08-18 09:15:08+00
1390	52	2017-08-18 09:15:14+00
1372	52	2017-08-18 09:15:24+00
1356	52	2017-08-18 09:15:47+00
1360	52	2017-08-18 09:15:50+00
1301	60	2017-08-18 09:15:52+00
934	52	2017-08-18 09:15:54+00
1355	52	2017-08-18 09:15:57+00
1383	60	2017-08-18 09:15:58+00
1359	52	2017-08-18 09:16:00+00
1361	52	2017-08-18 09:16:04+00
1394	60	2017-08-18 09:16:14+00
142	52	2017-08-18 09:16:21+00
1358	52	2017-08-18 09:16:28+00
1386	52	2017-08-18 09:16:32+00
1393	52	2017-08-18 09:16:35+00
1301	52	2017-08-18 09:17:12+00
1317	52	2017-08-18 09:17:21+00
1318	52	2017-08-18 09:18:10+00
962	60	2017-08-18 09:18:23+00
833	60	2017-08-18 09:18:27+00
1396	52	2017-08-18 09:18:28+00
1394	52	2017-08-18 09:19:07+00
859	60	2017-08-18 09:19:37+00
1129	52	2017-08-18 09:20:39+00
1122	52	2017-08-18 09:20:56+00
1211	59	2017-08-18 09:21:22+00
1402	45	2017-08-18 09:22:14+00
1388	52	2017-08-18 09:22:37+00
1405	52	2017-08-18 09:23:08+00
1396	60	2017-08-18 09:24:06+00
1405	60	2017-08-18 09:24:36+00
16	52	2017-08-18 09:25:47+00
1398	52	2017-08-18 09:26:17+00
1402	60	2017-08-18 09:26:26+00
1399	60	2017-08-18 09:26:32+00
1400	60	2017-08-18 09:26:35+00
1404	52	2017-08-18 09:26:42+00
16	51	2017-08-18 09:27:03+00
1401	52	2017-08-18 09:27:23+00
1408	52	2017-08-18 09:27:52+00
1411	52	2017-08-18 09:28:12+00
1409	52	2017-08-18 09:28:28+00
1410	52	2017-08-18 09:28:35+00
1413	52	2017-08-18 09:28:45+00
1414	52	2017-08-18 09:29:48+00
1403	52	2017-08-18 09:30:13+00
1415	52	2017-08-18 09:30:31+00
1371	60	2017-08-18 09:30:31+00
1414	60	2017-08-18 09:31:16+00
1397	60	2017-08-18 09:31:39+00
1415	60	2017-08-18 09:32:26+00
1409	60	2017-08-18 09:32:50+00
1416	52	2017-08-18 09:33:00+00
1417	52	2017-08-18 09:33:31+00
1410	60	2017-08-18 09:34:15+00
1310	52	2017-08-18 09:35:09+00
1419	60	2017-08-18 09:36:01+00
1412	51	2017-08-18 09:36:05+00
1412	52	2017-08-18 09:36:08+00
1421	60	2017-08-18 09:40:07+00
1316	52	2017-08-18 09:40:51+00
1420	60	2017-08-18 09:43:26+00
1423	52	2017-08-18 09:43:45+00
1424	52	2017-08-18 09:45:36+00
1418	52	2017-08-18 09:47:51+00
1224	60	2017-08-18 09:56:21+00
1401	60	2017-08-18 09:59:01+00
1424	60	2017-08-18 10:01:43+00
1435	52	2017-08-18 10:04:27+00
1183	70	2017-08-18 10:05:09+00
1436	52	2017-08-18 10:05:11+00
1437	52	2017-08-18 10:05:22+00
1416	60	2017-08-18 10:05:34+00
1438	52	2017-08-18 10:06:01+00
1439	60	2017-08-18 10:06:16+00
1441	52	2017-08-18 10:07:08+00
1473	2	2017-08-19 01:12:34+00
1473	57	2017-08-19 01:14:44+00
1473	6	2017-08-19 01:15:42+00
1515	69	2017-08-19 02:59:00+00
1514	2	2017-08-19 02:59:08+00
1514	6	2017-08-19 02:59:15+00
1526	69	2017-08-19 03:00:18+00
1528	69	2017-08-19 03:00:24+00
1384	67	2017-08-19 03:01:09+00
1442	67	2017-08-19 03:01:21+00
1444	67	2017-08-19 03:01:26+00
1442	65	2017-08-19 03:02:16+00
1444	65	2017-08-19 03:02:20+00
1235	67	2017-08-19 03:03:10+00
1171	67	2017-08-19 03:03:14+00
1267	69	2017-08-19 03:03:42+00
325	69	2017-08-19 03:03:57+00
1246	69	2017-08-19 03:04:12+00
1171	65	2017-08-19 03:04:57+00
1235	65	2017-08-19 03:05:13+00
1235	64	2017-08-19 03:05:20+00
1171	64	2017-08-19 03:05:24+00
1332	65	2017-08-19 03:07:12+00
1282	67	2017-08-19 03:07:12+00
1368	69	2017-08-19 03:07:15+00
1332	67	2017-08-19 03:07:27+00
1523	67	2017-08-19 03:07:47+00
1543	67	2017-08-19 03:08:02+00
1282	65	2017-08-19 03:08:19+00
1522	68	2017-08-19 03:08:47+00
1522	64	2017-08-19 03:08:55+00
1545	69	2017-08-19 03:10:01+00
1542	65	2017-08-19 03:10:19+00
1477	65	2017-08-19 03:12:08+00
1477	67	2017-08-19 03:12:32+00
1538	65	2017-08-19 03:13:11+00
1551	65	2017-08-19 03:13:30+00
1523	65	2017-08-19 03:14:00+00
1551	67	2017-08-19 03:14:17+00
1538	67	2017-08-19 03:14:25+00
1542	67	2017-08-19 03:14:37+00
1512	2	2017-08-19 03:15:44+00
1557	69	2017-08-19 03:15:59+00
1559	69	2017-08-19 03:16:55+00
1503	65	2017-08-19 03:17:15+00
1533	66	2017-08-19 03:17:19+00
1512	6	2017-08-19 03:17:29+00
1503	67	2017-08-19 03:17:46+00
1530	67	2017-08-19 03:17:58+00
1530	65	2017-08-19 03:18:05+00
1546	67	2017-08-19 03:18:20+00
1451	67	2017-08-19 03:19:05+00
1453	67	2017-08-19 03:19:11+00
1453	68	2017-08-19 03:19:19+00
1451	68	2017-08-19 03:19:28+00
1567	65	2017-08-19 03:21:03+00
1567	66	2017-08-19 03:21:07+00
1567	67	2017-08-19 03:21:35+00
1524	67	2017-08-19 03:22:13+00
1329	64	2017-08-19 03:23:25+00
1524	65	2017-08-19 03:24:57+00
1329	65	2017-08-19 03:25:28+00
1152	67	2017-08-19 03:26:52+00
1216	67	2017-08-19 03:26:55+00
1181	65	2017-08-19 03:27:01+00
1329	67	2017-08-19 03:27:47+00
1592	69	2017-08-19 03:28:22+00
1498	47	2017-08-19 03:28:35+00
1507	59	2017-08-19 03:28:35+00
1181	66	2017-08-19 03:29:05+00
461	64	2017-08-19 03:29:55+00
462	64	2017-08-19 03:30:09+00
462	67	2017-08-19 03:30:19+00
461	67	2017-08-19 03:30:24+00
1550	67	2017-08-19 03:31:04+00
1555	67	2017-08-19 03:31:28+00
1555	64	2017-08-19 03:31:38+00
1550	64	2017-08-19 03:31:42+00
792	65	2017-08-19 03:32:34+00
1565	65	2017-08-19 03:32:34+00
1565	67	2017-08-19 03:32:49+00
792	67	2017-08-19 03:32:52+00
1566	69	2017-08-19 03:34:09+00
1443	67	2017-08-19 03:34:49+00
457	67	2017-08-19 03:35:00+00
1380	67	2017-08-19 03:36:03+00
1610	69	2017-08-19 03:36:31+00
1616	67	2017-08-19 03:36:45+00
1556	67	2017-08-19 03:37:45+00
972	67	2017-08-19 03:38:03+00
457	69	2017-08-19 03:38:10+00
1443	69	2017-08-19 03:38:44+00
1547	64	2017-08-19 03:39:52+00
1547	66	2017-08-19 03:39:57+00
1547	67	2017-08-19 03:40:05+00
1504	67	2017-08-19 03:40:56+00
1506	67	2017-08-19 03:41:02+00
1602	67	2017-08-19 03:43:26+00
1345	67	2017-08-19 03:43:47+00
1631	69	2017-08-19 03:43:53+00
1590	67	2017-08-19 03:46:12+00
1590	64	2017-08-19 03:46:21+00
1028	67	2017-08-19 03:47:53+00
1633	69	2017-08-19 03:49:14+00
1596	66	2017-08-19 03:50:17+00
1596	67	2017-08-19 03:50:19+00
1629	43	2017-08-19 03:50:32+00
1597	67	2017-08-19 03:51:03+00
1609	64	2017-08-19 03:53:07+00
1609	67	2017-08-19 03:53:09+00
1520	69	2017-08-19 03:53:46+00
1534	69	2017-08-19 03:55:20+00
1537	69	2017-08-19 03:55:36+00
1497	64	2017-08-19 03:55:57+00
1497	67	2017-08-19 03:56:00+00
1497	66	2017-08-19 03:56:03+00
1494	64	2017-08-19 03:56:08+00
1494	67	2017-08-19 03:56:10+00
1494	66	2017-08-19 03:56:12+00
1518	69	2017-08-19 03:57:24+00
1527	69	2017-08-19 03:57:37+00
1638	69	2017-08-19 03:57:48+00
1641	67	2017-08-19 03:57:56+00
1641	64	2017-08-19 03:58:37+00
1644	64	2017-08-19 03:59:57+00
1644	66	2017-08-19 04:00:01+00
1644	67	2017-08-19 04:00:14+00
1490	64	2017-08-19 04:00:33+00
1573	49	2017-08-19 04:00:40+00
1488	64	2017-08-19 04:00:58+00
1642	43	2017-08-19 04:02:11+00
1539	67	2017-08-19 04:02:34+00
1440	67	2017-08-19 04:02:46+00
1498	59	2017-08-19 04:03:08+00
1647	69	2017-08-19 04:03:45+00
1645	69	2017-08-19 04:03:54+00
1646	69	2017-08-19 04:04:06+00
1649	67	2017-08-19 04:04:07+00
1572	49	2017-08-19 04:06:09+00
1652	64	2017-08-19 04:06:55+00
1652	67	2017-08-19 04:06:58+00
1656	67	2017-08-19 04:07:59+00
1659	67	2017-08-19 04:09:35+00
1661	67	2017-08-19 04:10:19+00
1653	69	2017-08-19 04:10:23+00
1660	69	2017-08-19 04:10:38+00
1663	67	2017-08-19 04:11:44+00
1588	67	2017-08-19 04:12:02+00
1666	67	2017-08-19 04:13:22+00
1666	68	2017-08-19 04:13:30+00
1667	67	2017-08-19 04:13:30+00
721	69	2017-08-19 04:13:51+00
1662	69	2017-08-19 04:14:00+00
1668	69	2017-08-19 04:14:28+00
800	69	2017-08-19 04:16:12+00
690	69	2017-08-19 04:16:22+00
482	68	2017-08-19 04:16:37+00
1674	67	2017-08-19 04:16:51+00
1674	66	2017-08-19 04:16:56+00
1669	66	2017-08-19 04:17:12+00
1670	66	2017-08-19 04:17:19+00
1675	67	2017-08-19 04:17:55+00
1671	67	2017-08-19 04:18:29+00
1677	67	2017-08-19 04:19:37+00
1517	69	2017-08-19 04:21:28+00
1671	66	2017-08-19 04:23:07+00
1677	66	2017-08-19 04:23:11+00
1671	68	2017-08-19 04:23:46+00
1496	66	2017-08-19 04:24:17+00
1685	69	2017-08-19 04:24:20+00
1682	68	2017-08-19 04:24:24+00
1496	67	2017-08-19 04:24:30+00
1680	68	2017-08-19 04:27:14+00
1570	66	2017-08-19 04:27:41+00
1681	68	2017-08-19 04:28:29+00
1285	66	2017-08-19 04:29:15+00
1289	66	2017-08-19 04:29:34+00
1289	67	2017-08-19 04:30:09+00
1285	67	2017-08-19 04:30:14+00
1445	59	2017-08-19 04:30:50+00
1693	69	2017-08-19 04:33:17+00
1695	69	2017-08-19 04:33:25+00
1692	69	2017-08-19 04:33:31+00
1699	67	2017-08-19 04:35:36+00
1702	67	2017-08-19 04:37:03+00
1677	68	2017-08-19 04:37:13+00
822	67	2017-08-19 04:38:16+00
1707	67	2017-08-19 04:39:12+00
1706	67	2017-08-19 04:39:16+00
1480	66	2017-08-19 04:39:34+00
1388	66	2017-08-19 04:40:06+00
1475	68	2017-08-19 04:42:15+00
1388	68	2017-08-19 04:42:25+00
555	68	2017-08-19 04:42:46+00
1445	68	2017-08-19 04:46:49+00
1704	69	2017-08-19 04:47:27+00
1648	69	2017-08-19 04:47:43+00
1655	69	2017-08-19 04:47:48+00
1678	69	2017-08-19 04:48:01+00
461	69	2017-08-19 04:48:16+00
462	69	2017-08-19 04:48:23+00
1684	69	2017-08-19 04:48:32+00
1249	51	2017-08-19 04:48:37+00
972	68	2017-08-19 04:49:37+00
1483	54	2017-08-19 04:50:12+00
1701	69	2017-08-19 04:50:20+00
1703	69	2017-08-19 04:50:25+00
1708	69	2017-08-19 04:50:30+00
680	68	2017-08-19 04:50:56+00
1715	69	2017-08-19 04:52:00+00
1571	69	2017-08-19 04:52:25+00
1716	70	2017-08-19 04:55:12+00
1722	69	2017-08-19 04:57:03+00
1721	69	2017-08-19 04:57:25+00
1639	47	2017-08-19 04:57:32+00
1643	47	2017-08-19 04:57:37+00
1724	69	2017-08-19 04:58:02+00
1727	68	2017-08-19 04:58:03+00
1723	69	2017-08-19 04:58:15+00
1576	69	2017-08-19 04:58:21+00
1730	68	2017-08-19 04:59:07+00
1604	56	2017-08-19 04:59:11+00
1583	64	2017-08-19 04:59:18+00
1731	69	2017-08-19 04:59:21+00
1601	56	2017-08-19 04:59:23+00
1732	69	2017-08-19 04:59:50+00
1604	48	2017-08-19 05:00:25+00
1733	69	2017-08-19 05:00:34+00
1601	48	2017-08-19 05:00:36+00
1129	56	2017-08-19 05:01:12+00
1643	43	2017-08-19 05:02:05+00
1639	43	2017-08-19 05:02:16+00
862	69	2017-08-19 05:02:26+00
550	64	2017-08-19 05:03:16+00
1735	68	2017-08-19 05:04:16+00
1736	69	2017-08-19 05:04:47+00
1011	56	2017-08-19 05:05:50+00
1300	69	2017-08-19 05:05:55+00
84	68	2017-08-19 05:06:43+00
1011	48	2017-08-19 05:06:48+00
1738	64	2017-08-19 05:07:02+00
1483	68	2017-08-19 05:07:41+00
1295	69	2017-08-19 05:07:50+00
997	69	2017-08-19 05:07:59+00
550	48	2017-08-19 05:08:24+00
1525	69	2017-08-19 05:08:26+00
1558	48	2017-08-19 05:09:12+00
550	56	2017-08-19 05:09:57+00
1558	56	2017-08-19 05:10:10+00
1740	69	2017-08-19 05:10:27+00
1171	56	2017-08-19 05:12:18+00
1235	56	2017-08-19 05:12:43+00
1490	56	2017-08-19 05:13:16+00
1488	56	2017-08-19 05:13:23+00
1734	59	2017-08-19 05:13:36+00
1744	69	2017-08-19 05:14:11+00
1743	69	2017-08-19 05:14:20+00
1490	48	2017-08-19 05:15:24+00
1752	48	2017-08-19 05:19:38+00
1752	56	2017-08-19 05:20:28+00
1751	56	2017-08-19 05:20:41+00
1759	48	2017-08-19 05:20:49+00
1751	48	2017-08-19 05:21:10+00
1759	56	2017-08-19 05:22:08+00
1480	56	2017-08-19 05:22:34+00
1760	68	2017-08-19 05:22:35+00
1524	48	2017-08-19 05:23:41+00
760	56	2017-08-19 05:24:08+00
681	56	2017-08-19 05:29:54+00
1752	43	2017-08-19 05:30:42+00
1585	48	2017-08-19 05:31:00+00
1585	56	2017-08-19 05:32:16+00
1455	56	2017-08-19 05:48:38+00
1768	69	2017-08-19 05:49:31+00
1769	69	2017-08-19 05:49:46+00
1511	48	2017-08-19 05:49:51+00
681	48	2017-08-19 05:52:02+00
1455	48	2017-08-19 05:52:39+00
1770	48	2017-08-19 05:55:39+00
637	68	2017-08-19 05:56:05+00
1336	56	2017-08-19 05:56:39+00
680	48	2017-08-19 05:57:55+00
1336	48	2017-08-19 05:58:09+00
1447	69	2017-08-19 05:59:12+00
1771	69	2017-08-19 06:02:51+00
1772	69	2017-08-19 06:03:03+00
1773	69	2017-08-19 06:03:10+00
1759	46	2017-08-19 06:05:55+00
1738	68	2017-08-19 06:06:35+00
1752	46	2017-08-19 06:07:18+00
1604	46	2017-08-19 06:07:33+00
1601	46	2017-08-19 06:07:41+00
1763	68	2017-08-19 06:07:52+00
1289	68	2017-08-19 06:08:16+00
1011	46	2017-08-19 06:08:21+00
1609	59	2017-08-19 06:08:49+00
1524	46	2017-08-19 06:09:43+00
1486	59	2017-08-19 06:10:33+00
1759	51	2017-08-19 06:12:50+00
1756	46	2017-08-19 06:13:14+00
1758	69	2017-08-19 06:13:43+00
1749	69	2017-08-19 06:13:50+00
1516	43	2017-08-19 06:13:59+00
1767	69	2017-08-19 06:14:02+00
1737	69	2017-08-19 06:14:09+00
1775	46	2017-08-19 06:15:38+00
1777	68	2017-08-19 06:15:44+00
1779	69	2017-08-19 06:20:01+00
1321	68	2017-08-19 06:21:03+00
1782	68	2017-08-19 06:23:39+00
1784	69	2017-08-19 06:24:17+00
1783	69	2017-08-19 06:24:28+00
1788	68	2017-08-19 06:26:01+00
1786	68	2017-08-19 06:26:14+00
1780	68	2017-08-19 06:26:18+00
1787	69	2017-08-19 06:26:36+00
1558	46	2017-08-19 06:27:34+00
1793	69	2017-08-19 06:28:47+00
1690	69	2017-08-19 06:32:26+00
865	68	2017-08-19 06:33:38+00
1797	68	2017-08-19 06:33:46+00
1249	69	2017-08-19 06:34:24+00
1801	68	2017-08-19 06:34:25+00
16	69	2017-08-19 06:34:33+00
1802	69	2017-08-19 06:35:05+00
1791	69	2017-08-19 06:35:18+00
1336	46	2017-08-19 06:35:24+00
1805	69	2017-08-19 06:35:25+00
1803	69	2017-08-19 06:35:42+00
1808	69	2017-08-19 06:35:52+00
1806	69	2017-08-19 06:35:59+00
1807	69	2017-08-19 06:36:07+00
1814	69	2017-08-19 06:36:38+00
1811	69	2017-08-19 06:36:45+00
1804	69	2017-08-19 06:36:51+00
1815	69	2017-08-19 06:36:57+00
1792	69	2017-08-19 06:37:04+00
1813	69	2017-08-19 06:37:08+00
1817	69	2017-08-19 06:37:12+00
1810	69	2017-08-19 06:37:20+00
1821	69	2017-08-19 06:37:25+00
1816	69	2017-08-19 06:37:37+00
1822	69	2017-08-19 06:37:40+00
1823	66	2017-08-19 06:37:59+00
1748	69	2017-08-19 06:38:06+00
1694	69	2017-08-19 06:38:11+00
1754	69	2017-08-19 06:38:21+00
1697	69	2017-08-19 06:38:24+00
1686	69	2017-08-19 06:38:28+00
1790	69	2017-08-19 06:38:35+00
1824	69	2017-08-19 06:38:52+00
1823	68	2017-08-19 06:39:00+00
1183	69	2017-08-19 06:39:04+00
1809	69	2017-08-19 06:39:05+00
1825	69	2017-08-19 06:39:26+00
1827	69	2017-08-19 06:40:01+00
1819	69	2017-08-19 06:40:08+00
1826	69	2017-08-19 06:40:33+00
1833	68	2017-08-19 06:40:48+00
1837	69	2017-08-19 06:41:30+00
1835	69	2017-08-19 06:41:35+00
1832	69	2017-08-19 06:41:57+00
1486	69	2017-08-19 06:42:37+00
1840	69	2017-08-19 06:42:53+00
1839	69	2017-08-19 06:43:06+00
16	46	2017-08-19 06:43:24+00
1267	46	2017-08-19 06:43:29+00
325	46	2017-08-19 06:43:38+00
757	68	2017-08-19 06:45:03+00
1838	59	2017-08-19 06:46:03+00
1847	68	2017-08-19 06:58:38+00
1315	68	2017-08-19 06:59:56+00
1246	49	2017-08-19 07:00:59+00
1482	60	2017-08-19 07:04:21+00
1249	43	2017-08-19 07:05:05+00
1474	60	2017-08-19 07:08:47+00
532	68	2017-08-19 07:11:06+00
1851	60	2017-08-19 07:14:04+00
1850	60	2017-08-19 07:14:28+00
1445	47	2017-08-19 07:16:14+00
1843	60	2017-08-19 07:16:36+00
1856	60	2017-08-19 07:20:07+00
1833	60	2017-08-19 07:44:25+00
1858	60	2017-08-19 07:44:32+00
743	47	2017-08-19 07:51:50+00
1046	60	2017-08-19 07:51:57+00
1589	68	2017-08-19 07:56:00+00
1046	68	2017-08-19 07:56:06+00
1712	68	2017-08-19 07:56:19+00
1863	68	2017-08-19 08:00:26+00
1604	55	2017-08-19 08:02:55+00
1601	55	2017-08-19 08:03:08+00
1069	55	2017-08-19 08:03:32+00
1857	68	2017-08-19 08:06:30+00
1864	68	2017-08-19 08:06:39+00
1866	68	2017-08-19 08:06:44+00
1862	55	2017-08-19 08:08:49+00
1285	68	2017-08-19 08:09:01+00
1754	55	2017-08-19 08:11:25+00
1868	68	2017-08-19 08:12:07+00
1859	68	2017-08-19 08:15:14+00
1838	55	2017-08-19 08:15:22+00
1332	66	2017-08-19 08:17:32+00
1761	55	2017-08-19 08:18:25+00
1753	55	2017-08-19 08:18:45+00
1619	43	2017-08-19 08:19:16+00
771	68	2017-08-19 08:19:20+00
1756	55	2017-08-19 08:19:40+00
1501	43	2017-08-19 08:20:38+00
1397	55	2017-08-19 08:21:41+00
1873	55	2017-08-19 08:22:24+00
1875	55	2017-08-19 08:22:46+00
1876	66	2017-08-19 08:23:20+00
1181	68	2017-08-19 08:27:21+00
1877	66	2017-08-19 08:30:08+00
1873	68	2017-08-19 08:30:24+00
1875	68	2017-08-19 08:30:33+00
1878	66	2017-08-19 08:30:59+00
1321	55	2017-08-19 08:34:07+00
1857	60	2017-08-19 08:34:53+00
1881	68	2017-08-19 08:46:32+00
1887	68	2017-08-19 08:48:27+00
1884	43	2017-08-19 08:51:09+00
1882	43	2017-08-19 08:51:45+00
1336	55	2017-08-19 08:53:02+00
1889	68	2017-08-19 08:55:11+00
1890	68	2017-08-19 08:56:48+00
1871	52	2017-08-19 09:01:11+00
1891	52	2017-08-19 09:02:05+00
1892	52	2017-08-19 09:02:16+00
1604	60	2017-08-19 09:02:32+00
1893	52	2017-08-19 09:02:35+00
1601	60	2017-08-19 09:02:36+00
1295	60	2017-08-19 09:02:41+00
1875	60	2017-08-19 09:02:47+00
997	60	2017-08-19 09:02:54+00
1873	52	2017-08-19 09:02:55+00
1891	60	2017-08-19 09:02:57+00
1873	60	2017-08-19 09:03:15+00
1875	52	2017-08-19 09:03:36+00
1532	52	2017-08-19 09:03:46+00
1604	52	2017-08-19 09:04:00+00
1601	52	2017-08-19 09:04:04+00
1894	68	2017-08-19 09:04:48+00
1897	52	2017-08-19 09:05:40+00
1900	52	2017-08-19 09:06:18+00
1896	51	2017-08-19 09:07:57+00
1372	60	2017-08-19 09:08:26+00
1373	60	2017-08-19 09:08:48+00
1881	60	2017-08-19 09:09:10+00
1899	52	2017-08-19 09:09:10+00
1898	52	2017-08-19 09:09:21+00
1859	52	2017-08-19 09:09:38+00
1880	60	2017-08-19 09:10:06+00
1823	52	2017-08-19 09:10:07+00
1879	60	2017-08-19 09:10:12+00
1711	52	2017-08-19 09:10:14+00
1558	52	2017-08-19 09:10:39+00
1904	60	2017-08-19 09:10:43+00
1635	52	2017-08-19 09:10:59+00
1881	52	2017-08-19 09:11:18+00
1902	52	2017-08-19 09:11:21+00
1897	60	2017-08-19 09:11:36+00
1879	52	2017-08-19 09:11:39+00
1481	60	2017-08-19 09:11:43+00
1904	52	2017-08-19 09:11:52+00
550	52	2017-08-19 09:11:54+00
1890	52	2017-08-19 09:12:30+00
1903	52	2017-08-19 09:12:37+00
997	52	2017-08-19 09:12:48+00
1295	52	2017-08-19 09:12:53+00
1906	52	2017-08-19 09:13:37+00
1880	52	2017-08-19 09:13:51+00
1541	52	2017-08-19 09:14:25+00
1332	52	2017-08-19 09:14:47+00
1644	60	2017-08-19 09:15:21+00
1707	52	2017-08-19 09:15:24+00
1876	60	2017-08-19 09:15:29+00
1644	52	2017-08-19 09:15:34+00
1332	60	2017-08-19 09:15:52+00
1907	52	2017-08-19 09:16:02+00
1781	52	2017-08-19 09:16:21+00
1889	52	2017-08-19 09:17:09+00
1710	52	2017-08-19 09:17:19+00
550	60	2017-08-19 09:17:50+00
1558	60	2017-08-19 09:17:54+00
1909	52	2017-08-19 09:18:04+00
1911	52	2017-08-19 09:18:26+00
1910	52	2017-08-19 09:18:57+00
1905	60	2017-08-19 09:19:15+00
1454	60	2017-08-19 09:19:52+00
1878	52	2017-08-19 09:19:52+00
142	60	2017-08-19 09:20:22+00
1889	60	2017-08-19 09:21:25+00
1886	52	2017-08-19 09:24:43+00
1912	52	2017-08-19 09:24:51+00
1921	52	2017-08-19 09:25:01+00
1913	52	2017-08-19 09:25:02+00
1869	52	2017-08-19 09:25:22+00
1920	52	2017-08-19 09:25:31+00
1867	52	2017-08-19 09:25:41+00
1915	52	2017-08-19 09:26:33+00
1916	52	2017-08-19 09:26:44+00
1926	52	2017-08-19 09:29:50+00
1922	52	2017-08-19 09:33:38+00
1929	52	2017-08-19 09:34:12+00
1928	52	2017-08-19 09:35:33+00
1922	55	2017-08-19 09:36:34+00
1917	52	2017-08-19 09:42:33+00
1336	52	2017-08-19 09:43:08+00
1934	52	2017-08-19 09:52:22+00
1939	52	2017-08-19 09:54:26+00
1935	52	2017-08-19 09:54:47+00
1936	52	2017-08-19 09:55:01+00
1938	52	2017-08-19 09:55:10+00
1941	2	2017-08-19 17:12:58.722623+00
1941	2	2017-08-19 17:13:51.927647+00
1941	6	2017-08-19 17:13:58.481688+00
1941	6	2017-08-19 17:14:04.649556+00
\.


--
-- Name: codes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: evently_user
--

SELECT pg_catalog.setval('codes_id_seq', 1946, true);


--
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: evently_user
--

COPY events (id, name, slug, description, price, created_at, updated_at, fk_vendor, image) FROM stdin;
1	Race Eat Play	race-eat-play	Race Eat and Play is under organized by APE	10	2017-07-20 16:29:41+00	2017-08-14 04:06:46+00	1	\N
2	Drones workshop	y8hAIZ	Drones workshop by 65Drones	0	2017-08-14 04:04:58+00	2017-08-14 04:04:58+00	6	phpQUTnD7
3	Robotics Jamming	pYfQsD	-	0	2017-08-14 04:28:58+00	2017-08-14 04:28:58+00	7	php2xUgdA
4	Future Food	PMHoFm	Food street	0	2017-08-14 05:38:53+00	2017-08-14 07:27:10+00	2	phpjRbFPi
5	Race	ExClix	Access to race track and voting	0	2017-08-14 07:06:59+00	2017-08-14 07:26:29+00	5	phpiW4YXF
\.


--
-- Name: events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: evently_user
--

SELECT pg_catalog.setval('events_id_seq', 5, true);


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: evently_user
--

COPY migrations (id, migration, batch) FROM stdin;
1	2017_04_10_000000_create_users_table	1
2	2017_04_10_000001_create_password_resets_table	1
3	2017_04_10_000002_create_social_accounts_table	1
4	2017_04_10_000003_create_roles_table	1
5	2017_04_10_000004_create_users_roles_table	1
6	2017_07_11_145658_create_event_instance	1
7	2017_07_14_142951_create_code	1
8	2017_07_16_124337_create_attendee_table	1
9	2017_07_17_135901_assign_vendor_event	1
10	2017_07_19_211732_assign_code_attendee	1
11	2017_07_20_100427_add_event_slug_index	1
12	2017_07_23_080331_add_event_image	2
13	2017_07_24_023843_create_activity_model	2
14	2017_07_24_030859_add_activity	2
15	2017_08_04_081016_create_attendee_tier	3
16	2017_08_04_085502_migrate_code_attendee	3
17	2017_08_06_052311_migrate_multiple_scan	3
18	2017_08_06_055847_drop_multiple_scanning_schema	3
19	2017_08_06_091635_normalize_codes_table	3
20	2017_08_18_155930_remove_expired_code	4
21	2017_08_23_025958_create_index_for_analytics	5
\.


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: evently_user
--

SELECT pg_catalog.setval('migrations_id_seq', 21, true);


--
-- Data for Name: password_resets; Type: TABLE DATA; Schema: public; Owner: evently_user
--

COPY password_resets (email, token, created_at) FROM stdin;
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: evently_user
--

COPY roles (id, name, weight) FROM stdin;
1	administrator	0
2	authenticated	0
3	Vendor	0
4	Basic	0
5	Gold	0
6	Platinum	0
\.


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: evently_user
--

SELECT pg_catalog.setval('roles_id_seq', 6, true);


--
-- Data for Name: social_accounts; Type: TABLE DATA; Schema: public; Owner: evently_user
--

COPY social_accounts (id, user_id, provider, provider_id, token, avatar, created_at, updated_at) FROM stdin;
\.


--
-- Name: social_accounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: evently_user
--

SELECT pg_catalog.setval('social_accounts_id_seq', 1, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: evently_user
--

COPY users (id, name, email, password, active, confirmation_code, confirmed, remember_token, created_at, updated_at, deleted_at) FROM stdin;
1	Admin	admin@ape.sg	$2y$10$8Pl14fN83RfK7480t4TSH.nTlhpzqhCOAEfReUn1PsOxsMdk0ZTy2	1	fb6c1138-2f6f-49f0-8d9c-5c333aec29ca	t	l3OlfrtAGSEKeCZmWzhNWDP02p1NRJZQK6xqIEaqofAndGZqUX4VWB6Xowkj	2017-07-20 16:29:41+00	2017-07-20 16:29:41+00	\N
2	Vendor	vendor@ape.sg	$2y$10$OrQyUAdIeoZb1HY2bb6ozuqKbRE72MpuWLXYJqy7kIehwDrnTFpae	1	e9682fc9-8204-435d-9e0c-003ee3922762	t	\N	2017-08-02 11:25:13+00	2017-08-02 11:25:13+00	\N
3	Gold Vendor	goldvendor@ape.sg	$2y$10$o00zgBK053wpfm0kLe0zOOZoq45txUgST8HOXsrDxhot6rsRT5rOi	1	47570ca1-42cd-4bcf-9366-7b76224cb668	t	\N	2017-08-03 16:07:27+00	2017-08-03 16:07:27+00	\N
4	VendorEat	VendorEat@ape.sg	$2y$10$CCFhKXmEPhHvRFAtpIvfaexhAHHmt2ykjWAGvYmAWsjkx8xT7MrlW	1	be1d7a67-3925-41ce-ba48-f93d6d75af40	t	cfpTXM200LwwA3ScGEsbVUhbL0Onx3gG1qaG7mWPO22dVhflJOGI0qkLpw45	2017-08-04 06:17:51+00	2017-08-04 06:30:18+00	\N
5	Race Facilitator	jiaqi@ape.sg	$2y$10$mOQor2eN/UwPl4uHu/iwz.m3oRTVJvwqea/J6abHMok3WApoaWdcO	1	c7932b10-ca46-4b79-9959-66c8da19931b	t	ukiUALumJ5xhrWyRvvua979ilOfo2IYKrl5mCZwDqbLEGPLqIbNqI0mz23fc	2017-08-04 06:19:58+00	2017-08-14 07:05:59+00	\N
6	Drones Workshop	pearl@ape.sg	$2y$10$Ran6HqWm9vL3vckV3.5/L.I.Wdc.Ye5aQWeg0BacRHZs7TNwaENS2	1	57d530de-2f02-4fab-93c5-ed27d5c70a13	t	\N	2017-08-12 01:51:02+00	2017-08-12 01:51:02+00	\N
7	Robotics Jamming	wyndee@ape.sg	$2y$10$8SB9dNf3I4Hd4JQpX7/yNes8bpLiQ43XwmKJCWeshDn2HfrB4HE4O	1	b7b22f2f-57c5-4a47-970f-7adc2918358e	t	\N	2017-08-14 04:27:12+00	2017-08-14 04:27:12+00	\N
8	Fix Grill	events@fix.com.sg	$2y$10$darELBvzNjFFIgFQEBjBoOlofuOV2KcmkOl2Z3I19OG.nf5I.5Voa	1	306782fe-a95d-428b-9694-c8effbac5dfc	t	\N	2017-08-14 04:37:06+00	2017-08-14 04:37:06+00	\N
9	Smokeout	smokeoutsg@hotmail.com	$2y$10$GKJSCX8b6/0PBVFB7vq/dOvnKYGLfAOCocG0q3IdGhdTbjXUQtwBe	1	51754b75-36ce-400c-a5fd-76c3d628c7a8	t	\N	2017-08-14 04:37:52+00	2017-08-14 04:37:52+00	\N
10	One Nature	siewnyuk@cdes.com.sg	$2y$10$vLD1QqrRDIpES2j/Dorrzu5kfvtrohKJ7z.dGcaajvA58Pq.U6BvC	1	0a3215c5-51ac-4bcd-aaee-05ff0850ffea	t	\N	2017-08-14 04:39:01+00	2017-08-14 04:39:01+00	\N
11	Veganburg	annlee@veganburg.com	$2y$10$MdJb.3msy3N64.SuxtTLIO3EKHLcyycP/8e1Wh.QCkTrIegxI58Lu	1	0b64c2dd-562e-4d9b-81e8-c7021609140e	t	\N	2017-08-14 04:39:49+00	2017-08-18 04:51:44+00	\N
12	HIC	shannon@thirtythree.com.sg	$2y$10$5Ys8AGjEcKgXq3GAzVdvbOIO1oQpTGNIKyjN79IUlaMvYJANSG8z6	1	ef4a761f-da56-4b06-b836-545acc5ae744	t	\N	2017-08-14 04:41:37+00	2017-08-14 04:41:37+00	\N
13	Archipelago Brewery	Malcom.Davies@apb.com.sg	$2y$10$py0/fqoQZaKyrsEi0y0sr.X/NCWfl1zR0qTNNSqOXY3Zyub52X0hG	1	e1864774-f82e-4014-892e-0587929fab10	t	\N	2017-08-14 04:48:16+00	2017-08-14 07:04:40+00	\N
14	Caffeinated by Coffee Bandits	jessica@coffeebandits.sg	$2y$10$Mu3VhKO1jx787h8cFf/dU.R4fpcQbwPPvtZUbpnAd9toht5YsnzKi	1	355d57fe-093f-4ba1-ae59-8dc6edcc4df4	t	\N	2017-08-14 05:47:11+00	2017-08-14 07:41:26+00	\N
15	Eye Candy by Coffee Bandits	samantha@coffeebandits.sg	$2y$10$8CjeymiYQG.5clkwlFGVIuReKnr3MbBTEzMOg17Qygwqsw1O3VHvS	1	8c9b5ea2-ccfa-43fc-8e82-1804b7bce273	t	\N	2017-08-14 07:45:58+00	2017-08-14 07:45:58+00	\N
16	Back to Basics by Coffee Bandits	cheryl@coffeebandits.sg	$2y$10$JtmlM1AvyQYT4XahdHtTxuraJm4DhY0GVYOAR2hJdsQdR/PCqDO.q	1	930812ce-198a-4b67-b60d-e446f3a4737f	t	\N	2017-08-14 07:49:25+00	2017-08-14 07:49:25+00	\N
17	Local Motion by Coffee Bandits	paul@ape.sg	$2y$10$mPNv6gNaKwa8Xjzegx0h9.WFBu/mJWqmfnQ5avawwro1TFCejvfHe	1	4afaa4bc-9fbb-4330-9b67-d0b7e9a75f4a	t	\N	2017-08-14 07:54:04+00	2017-08-14 07:54:04+00	\N
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: evently_user
--

SELECT pg_catalog.setval('users_id_seq', 17, true);


--
-- Data for Name: users_roles; Type: TABLE DATA; Schema: public; Owner: evently_user
--

COPY users_roles (user_id, role_id) FROM stdin;
1	1
1	2
4	2
5	2
1	3
2	3
3	3
4	3
5	3
6	3
7	3
8	3
9	3
10	3
11	3
12	3
13	3
14	3
15	3
16	3
17	3
2	4
5	4
3	5
4	5
1	6
\.


--
-- Name: idx_16389_primary; Type: CONSTRAINT; Schema: public; Owner: evently_user
--

ALTER TABLE ONLY activities
    ADD CONSTRAINT idx_16389_primary PRIMARY KEY (id);


--
-- Name: idx_16398_primary; Type: CONSTRAINT; Schema: public; Owner: evently_user
--

ALTER TABLE ONLY attendee
    ADD CONSTRAINT idx_16398_primary PRIMARY KEY (id);


--
-- Name: idx_16408_primary; Type: CONSTRAINT; Schema: public; Owner: evently_user
--

ALTER TABLE ONLY codes
    ADD CONSTRAINT idx_16408_primary PRIMARY KEY (id);


--
-- Name: idx_16422_primary; Type: CONSTRAINT; Schema: public; Owner: evently_user
--

ALTER TABLE ONLY events
    ADD CONSTRAINT idx_16422_primary PRIMARY KEY (id);


--
-- Name: idx_16431_primary; Type: CONSTRAINT; Schema: public; Owner: evently_user
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT idx_16431_primary PRIMARY KEY (id);


--
-- Name: idx_16440_primary; Type: CONSTRAINT; Schema: public; Owner: evently_user
--

ALTER TABLE ONLY roles
    ADD CONSTRAINT idx_16440_primary PRIMARY KEY (id);


--
-- Name: idx_16447_primary; Type: CONSTRAINT; Schema: public; Owner: evently_user
--

ALTER TABLE ONLY social_accounts
    ADD CONSTRAINT idx_16447_primary PRIMARY KEY (id);


--
-- Name: idx_16456_primary; Type: CONSTRAINT; Schema: public; Owner: evently_user
--

ALTER TABLE ONLY users
    ADD CONSTRAINT idx_16456_primary PRIMARY KEY (id);


--
-- Name: attendee_name_email_tier_index; Type: INDEX; Schema: public; Owner: evently_user
--

CREATE INDEX attendee_name_email_tier_index ON attendee USING btree (name, email, tier);


--
-- Name: codes_activities_created_at_index; Type: INDEX; Schema: public; Owner: evently_user
--

CREATE INDEX codes_activities_created_at_index ON codes_activities USING btree (created_at);


--
-- Name: idx_16389_activities_fk_event_foreign; Type: INDEX; Schema: public; Owner: evently_user
--

CREATE INDEX idx_16389_activities_fk_event_foreign ON activities USING btree (fk_event);


--
-- Name: idx_16389_activities_fk_vendor_foreign; Type: INDEX; Schema: public; Owner: evently_user
--

CREATE INDEX idx_16389_activities_fk_vendor_foreign ON activities USING btree (fk_vendor);


--
-- Name: idx_16389_activities_name_index; Type: INDEX; Schema: public; Owner: evently_user
--

CREATE INDEX idx_16389_activities_name_index ON activities USING btree (name);


--
-- Name: idx_16389_activities_name_slug_unique; Type: INDEX; Schema: public; Owner: evently_user
--

CREATE UNIQUE INDEX idx_16389_activities_name_slug_unique ON activities USING btree (name, slug);


--
-- Name: idx_16389_activities_price_index; Type: INDEX; Schema: public; Owner: evently_user
--

CREATE INDEX idx_16389_activities_price_index ON activities USING btree (price);


--
-- Name: idx_16389_activities_slug_index; Type: INDEX; Schema: public; Owner: evently_user
--

CREATE INDEX idx_16389_activities_slug_index ON activities USING btree (slug);


--
-- Name: idx_16398_attendee_fk_event_foreign; Type: INDEX; Schema: public; Owner: evently_user
--

CREATE INDEX idx_16398_attendee_fk_event_foreign ON attendee USING btree (fk_event);


--
-- Name: idx_16408_codes_fk_attendee_foreign; Type: INDEX; Schema: public; Owner: evently_user
--

CREATE INDEX idx_16408_codes_fk_attendee_foreign ON codes USING btree (fk_attendee);


--
-- Name: idx_16408_codes_fk_code_foreign; Type: INDEX; Schema: public; Owner: evently_user
--

CREATE INDEX idx_16408_codes_fk_code_foreign ON codes USING btree (fk_code);


--
-- Name: idx_16408_codes_fk_event_foreign; Type: INDEX; Schema: public; Owner: evently_user
--

CREATE INDEX idx_16408_codes_fk_event_foreign ON codes USING btree (fk_event);


--
-- Name: idx_16408_codes_type_active_index; Type: INDEX; Schema: public; Owner: evently_user
--

CREATE INDEX idx_16408_codes_type_active_index ON codes USING btree (type, active);


--
-- Name: idx_16408_codes_value_index; Type: INDEX; Schema: public; Owner: evently_user
--

CREATE INDEX idx_16408_codes_value_index ON codes USING btree (value);


--
-- Name: idx_16408_codes_value_unique; Type: INDEX; Schema: public; Owner: evently_user
--

CREATE UNIQUE INDEX idx_16408_codes_value_unique ON codes USING btree (value);


--
-- Name: idx_16416_foreign_activity; Type: INDEX; Schema: public; Owner: evently_user
--

CREATE INDEX idx_16416_foreign_activity ON codes_activities USING btree (activity_id);


--
-- Name: idx_16416_foreign_code; Type: INDEX; Schema: public; Owner: evently_user
--

CREATE INDEX idx_16416_foreign_code ON codes_activities USING btree (code_id);


--
-- Name: idx_16422_events_fk_vendor_foreign; Type: INDEX; Schema: public; Owner: evently_user
--

CREATE INDEX idx_16422_events_fk_vendor_foreign ON events USING btree (fk_vendor);


--
-- Name: idx_16422_events_name_index; Type: INDEX; Schema: public; Owner: evently_user
--

CREATE INDEX idx_16422_events_name_index ON events USING btree (name);


--
-- Name: idx_16422_events_name_slug_unique; Type: INDEX; Schema: public; Owner: evently_user
--

CREATE UNIQUE INDEX idx_16422_events_name_slug_unique ON events USING btree (name, slug);


--
-- Name: idx_16422_events_price_index; Type: INDEX; Schema: public; Owner: evently_user
--

CREATE INDEX idx_16422_events_price_index ON events USING btree (price);


--
-- Name: idx_16422_events_slug_index; Type: INDEX; Schema: public; Owner: evently_user
--

CREATE INDEX idx_16422_events_slug_index ON events USING btree (slug);


--
-- Name: idx_16435_password_resets_email_index; Type: INDEX; Schema: public; Owner: evently_user
--

CREATE INDEX idx_16435_password_resets_email_index ON password_resets USING btree (email);


--
-- Name: idx_16440_unique_name; Type: INDEX; Schema: public; Owner: evently_user
--

CREATE UNIQUE INDEX idx_16440_unique_name ON roles USING btree (name);


--
-- Name: idx_16447_social_accounts_user_id_provider_provider_id_index; Type: INDEX; Schema: public; Owner: evently_user
--

CREATE INDEX idx_16447_social_accounts_user_id_provider_provider_id_index ON social_accounts USING btree (user_id, provider, provider_id);


--
-- Name: idx_16456_users_email_unique; Type: INDEX; Schema: public; Owner: evently_user
--

CREATE UNIQUE INDEX idx_16456_users_email_unique ON users USING btree (email);


--
-- Name: idx_16465_foreign_role; Type: INDEX; Schema: public; Owner: evently_user
--

CREATE INDEX idx_16465_foreign_role ON users_roles USING btree (role_id);


--
-- Name: idx_16465_users_roles_user_id_role_id_unique; Type: INDEX; Schema: public; Owner: evently_user
--

CREATE UNIQUE INDEX idx_16465_users_roles_user_id_role_id_unique ON users_roles USING btree (user_id, role_id);


--
-- Name: activities_fk_event_foreign; Type: FK CONSTRAINT; Schema: public; Owner: evently_user
--

ALTER TABLE ONLY activities
    ADD CONSTRAINT activities_fk_event_foreign FOREIGN KEY (fk_event) REFERENCES events(id) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- Name: activities_fk_vendor_foreign; Type: FK CONSTRAINT; Schema: public; Owner: evently_user
--

ALTER TABLE ONLY activities
    ADD CONSTRAINT activities_fk_vendor_foreign FOREIGN KEY (fk_vendor) REFERENCES users(id) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- Name: attendee_fk_event_foreign; Type: FK CONSTRAINT; Schema: public; Owner: evently_user
--

ALTER TABLE ONLY attendee
    ADD CONSTRAINT attendee_fk_event_foreign FOREIGN KEY (fk_event) REFERENCES events(id) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- Name: codes_fk_attendee_foreign; Type: FK CONSTRAINT; Schema: public; Owner: evently_user
--

ALTER TABLE ONLY codes
    ADD CONSTRAINT codes_fk_attendee_foreign FOREIGN KEY (fk_attendee) REFERENCES attendee(id) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- Name: codes_fk_code_foreign; Type: FK CONSTRAINT; Schema: public; Owner: evently_user
--

ALTER TABLE ONLY codes
    ADD CONSTRAINT codes_fk_code_foreign FOREIGN KEY (fk_code) REFERENCES codes(id) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- Name: codes_fk_event_foreign; Type: FK CONSTRAINT; Schema: public; Owner: evently_user
--

ALTER TABLE ONLY codes
    ADD CONSTRAINT codes_fk_event_foreign FOREIGN KEY (fk_event) REFERENCES events(id) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- Name: events_fk_vendor_foreign; Type: FK CONSTRAINT; Schema: public; Owner: evently_user
--

ALTER TABLE ONLY events
    ADD CONSTRAINT events_fk_vendor_foreign FOREIGN KEY (fk_vendor) REFERENCES users(id) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- Name: foreign_activity; Type: FK CONSTRAINT; Schema: public; Owner: evently_user
--

ALTER TABLE ONLY codes_activities
    ADD CONSTRAINT foreign_activity FOREIGN KEY (activity_id) REFERENCES activities(id) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- Name: foreign_code; Type: FK CONSTRAINT; Schema: public; Owner: evently_user
--

ALTER TABLE ONLY codes_activities
    ADD CONSTRAINT foreign_code FOREIGN KEY (code_id) REFERENCES codes(id) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- Name: foreign_role; Type: FK CONSTRAINT; Schema: public; Owner: evently_user
--

ALTER TABLE ONLY users_roles
    ADD CONSTRAINT foreign_role FOREIGN KEY (role_id) REFERENCES roles(id) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- Name: foreign_user; Type: FK CONSTRAINT; Schema: public; Owner: evently_user
--

ALTER TABLE ONLY users_roles
    ADD CONSTRAINT foreign_user FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- Name: social_accounts_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: evently_user
--

ALTER TABLE ONLY social_accounts
    ADD CONSTRAINT social_accounts_user_id_foreign FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

