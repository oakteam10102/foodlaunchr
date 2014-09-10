--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

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
-- Name: active_admin_comments; Type: TABLE; Schema: public; Owner: dtjsjejwmcngmd; Tablespace: 
--

CREATE TABLE active_admin_comments (
    id integer NOT NULL,
    resource_id character varying(255) NOT NULL,
    resource_type character varying(255) NOT NULL,
    author_id integer,
    author_type character varying(255),
    body text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    namespace character varying(255)
);


ALTER TABLE public.active_admin_comments OWNER TO dtjsjejwmcngmd;

--
-- Name: active_admin_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: dtjsjejwmcngmd
--

CREATE SEQUENCE active_admin_comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.active_admin_comments_id_seq OWNER TO dtjsjejwmcngmd;

--
-- Name: active_admin_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dtjsjejwmcngmd
--

ALTER SEQUENCE active_admin_comments_id_seq OWNED BY active_admin_comments.id;


--
-- Name: admin_users; Type: TABLE; Schema: public; Owner: dtjsjejwmcngmd; Tablespace: 
--

CREATE TABLE admin_users (
    id integer NOT NULL,
    email character varying(255) DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying(255) DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying(255),
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying(255),
    last_sign_in_ip character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.admin_users OWNER TO dtjsjejwmcngmd;

--
-- Name: admin_users_id_seq; Type: SEQUENCE; Schema: public; Owner: dtjsjejwmcngmd
--

CREATE SEQUENCE admin_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_users_id_seq OWNER TO dtjsjejwmcngmd;

--
-- Name: admin_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dtjsjejwmcngmd
--

ALTER SEQUENCE admin_users_id_seq OWNED BY admin_users.id;


--
-- Name: delayed_jobs; Type: TABLE; Schema: public; Owner: dtjsjejwmcngmd; Tablespace: 
--

CREATE TABLE delayed_jobs (
    id integer NOT NULL,
    priority integer DEFAULT 0,
    attempts integer DEFAULT 0,
    handler text,
    last_error text,
    run_at timestamp without time zone,
    locked_at timestamp without time zone,
    failed_at timestamp without time zone,
    locked_by character varying(255),
    queue character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.delayed_jobs OWNER TO dtjsjejwmcngmd;

--
-- Name: delayed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: dtjsjejwmcngmd
--

CREATE SEQUENCE delayed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.delayed_jobs_id_seq OWNER TO dtjsjejwmcngmd;

--
-- Name: delayed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dtjsjejwmcngmd
--

ALTER SEQUENCE delayed_jobs_id_seq OWNED BY delayed_jobs.id;


--
-- Name: ip_addresses; Type: TABLE; Schema: public; Owner: dtjsjejwmcngmd; Tablespace: 
--

CREATE TABLE ip_addresses (
    id integer NOT NULL,
    address character varying(255),
    count integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.ip_addresses OWNER TO dtjsjejwmcngmd;

--
-- Name: ip_addresses_id_seq; Type: SEQUENCE; Schema: public; Owner: dtjsjejwmcngmd
--

CREATE SEQUENCE ip_addresses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ip_addresses_id_seq OWNER TO dtjsjejwmcngmd;

--
-- Name: ip_addresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dtjsjejwmcngmd
--

ALTER SEQUENCE ip_addresses_id_seq OWNED BY ip_addresses.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: dtjsjejwmcngmd; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO dtjsjejwmcngmd;

--
-- Name: users; Type: TABLE; Schema: public; Owner: dtjsjejwmcngmd; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying(255),
    referral_code character varying(255),
    referrer_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.users OWNER TO dtjsjejwmcngmd;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: dtjsjejwmcngmd
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO dtjsjejwmcngmd;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dtjsjejwmcngmd
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dtjsjejwmcngmd
--

ALTER TABLE ONLY active_admin_comments ALTER COLUMN id SET DEFAULT nextval('active_admin_comments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dtjsjejwmcngmd
--

ALTER TABLE ONLY admin_users ALTER COLUMN id SET DEFAULT nextval('admin_users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dtjsjejwmcngmd
--

ALTER TABLE ONLY delayed_jobs ALTER COLUMN id SET DEFAULT nextval('delayed_jobs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dtjsjejwmcngmd
--

ALTER TABLE ONLY ip_addresses ALTER COLUMN id SET DEFAULT nextval('ip_addresses_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dtjsjejwmcngmd
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: active_admin_comments; Type: TABLE DATA; Schema: public; Owner: dtjsjejwmcngmd
--

COPY active_admin_comments (id, resource_id, resource_type, author_id, author_type, body, created_at, updated_at, namespace) FROM stdin;
\.


--
-- Name: active_admin_comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dtjsjejwmcngmd
--

SELECT pg_catalog.setval('active_admin_comments_id_seq', 1, false);


--
-- Data for Name: admin_users; Type: TABLE DATA; Schema: public; Owner: dtjsjejwmcngmd
--

COPY admin_users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at) FROM stdin;
\.


--
-- Name: admin_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dtjsjejwmcngmd
--

SELECT pg_catalog.setval('admin_users_id_seq', 1, false);


--
-- Data for Name: delayed_jobs; Type: TABLE DATA; Schema: public; Owner: dtjsjejwmcngmd
--

COPY delayed_jobs (id, priority, attempts, handler, last_error, run_at, locked_at, failed_at, locked_by, queue, created_at, updated_at) FROM stdin;
1	0	0	--- !ruby/object:Delayed::PerformableMailer\nobject: !ruby/class 'UserMailer'\nmethod_name: :signup_email\nargs:\n- !ruby/ActiveRecord:User\n  attributes:\n    id: '1'\n    email: melon@gmail.com\n    referral_code: dc723c6fe7\n    referrer_id: \n    created_at: 2014-08-11 14:56:23.516574358 Z\n    updated_at: 2014-08-11 14:56:23.516574358 Z\n	\N	2014-08-11 14:56:23.639533	\N	\N	\N	\N	2014-08-11 14:56:23.640408	2014-08-11 14:56:23.640408
2	0	0	--- !ruby/object:Delayed::PerformableMailer\nobject: !ruby/class 'UserMailer'\nmethod_name: :signup_email\nargs:\n- !ruby/ActiveRecord:User\n  attributes:\n    id: '2'\n    email: James@curelead.com\n    referral_code: f278ff17f0\n    referrer_id: 1\n    created_at: 2014-08-11 14:57:20.164768547 Z\n    updated_at: 2014-08-11 14:57:20.164768547 Z\n	\N	2014-08-11 14:57:20.217824	\N	\N	\N	\N	2014-08-11 14:57:20.218616	2014-08-11 14:57:20.218616
3	0	0	--- !ruby/object:Delayed::PerformableMailer\nobject: !ruby/class 'UserMailer'\nmethod_name: :signup_email\nargs:\n- !ruby/ActiveRecord:User\n  attributes:\n    id: '3'\n    email: james@curelead.com\n    referral_code: 71dd6d0c2e\n    referrer_id: \n    created_at: 2014-08-11 18:03:30.375324390 Z\n    updated_at: 2014-08-11 18:03:30.375324390 Z\n	\N	2014-08-11 18:03:30.492217	\N	\N	\N	\N	2014-08-11 18:03:30.492932	2014-08-11 18:03:30.492932
4	0	0	--- !ruby/object:Delayed::PerformableMailer\nobject: !ruby/class 'UserMailer'\nmethod_name: :signup_email\nargs:\n- !ruby/ActiveRecord:User\n  attributes:\n    id: '4'\n    email: John@curelead.com\n    referral_code: 34a80aecdc\n    referrer_id: 3\n    created_at: 2014-08-11 18:21:35.060138104 Z\n    updated_at: 2014-08-11 18:21:35.060138104 Z\n	\N	2014-08-11 18:21:35.09563	\N	\N	\N	\N	2014-08-11 18:21:35.096217	2014-08-11 18:21:35.096217
5	0	0	--- !ruby/object:Delayed::PerformableMailer\nobject: !ruby/class 'UserMailer'\nmethod_name: :signup_email\nargs:\n- !ruby/ActiveRecord:User\n  attributes:\n    id: '5'\n    email: John@bijouxjungle.com\n    referral_code: 5a1435c61d\n    referrer_id: \n    created_at: 2014-08-11 19:39:40.916788256 Z\n    updated_at: 2014-08-11 19:39:40.916788256 Z\n	\N	2014-08-11 19:39:40.965904	\N	\N	\N	\N	2014-08-11 19:39:40.967028	2014-08-11 19:39:40.967028
6	0	0	--- !ruby/object:Delayed::PerformableMailer\nobject: !ruby/class 'UserMailer'\nmethod_name: :signup_email\nargs:\n- !ruby/ActiveRecord:User\n  attributes:\n    id: '6'\n    email: jameszhang852@gmail.com\n    referral_code: 4e9959e6d6\n    referrer_id: \n    created_at: 2014-08-13 01:06:49.369719478 Z\n    updated_at: 2014-08-13 01:06:49.369719478 Z\n	\N	2014-08-13 01:06:49.465095	\N	\N	\N	\N	2014-08-13 01:06:49.465868	2014-08-13 01:06:49.465868
7	0	0	--- !ruby/object:Delayed::PerformableMailer\nobject: !ruby/class 'UserMailer'\nmethod_name: :signup_email\nargs:\n- !ruby/ActiveRecord:User\n  attributes:\n    id: '7'\n    email: Rebeccawyiu@yahoo.com\n    referral_code: 759d7dffa2\n    referrer_id: 6\n    created_at: 2014-08-13 01:40:16.267524918 Z\n    updated_at: 2014-08-13 01:40:16.267524918 Z\n	\N	2014-08-13 01:40:16.280765	\N	\N	\N	\N	2014-08-13 01:40:16.281054	2014-08-13 01:40:16.281054
8	0	0	--- !ruby/object:Delayed::PerformableMailer\nobject: !ruby/class 'UserMailer'\nmethod_name: :signup_email\nargs:\n- !ruby/ActiveRecord:User\n  attributes:\n    id: '8'\n    email: 31lawrencelee@gmail.com\n    referral_code: 93e81c308c\n    referrer_id: 6\n    created_at: 2014-08-13 02:00:32.432364881 Z\n    updated_at: 2014-08-13 02:00:32.432364881 Z\n	\N	2014-08-13 02:00:32.438474	\N	\N	\N	\N	2014-08-13 02:00:32.438729	2014-08-13 02:00:32.438729
9	0	0	--- !ruby/object:Delayed::PerformableMailer\nobject: !ruby/class 'UserMailer'\nmethod_name: :signup_email\nargs:\n- !ruby/ActiveRecord:User\n  attributes:\n    id: '9'\n    email: Jennyhu326@gmail.com\n    referral_code: d9a51b0637\n    referrer_id: 6\n    created_at: 2014-08-13 03:20:09.727709237 Z\n    updated_at: 2014-08-13 03:20:09.727709237 Z\n	\N	2014-08-13 03:20:09.801733	\N	\N	\N	\N	2014-08-13 03:20:09.802326	2014-08-13 03:20:09.802326
10	0	0	--- !ruby/object:Delayed::PerformableMailer\nobject: !ruby/class 'UserMailer'\nmethod_name: :signup_email\nargs:\n- !ruby/ActiveRecord:User\n  attributes:\n    id: '10'\n    email: Toastnbutter@gmail.com\n    referral_code: 7d1da5db64\n    referrer_id: 6\n    created_at: 2014-08-13 04:51:41.458545294 Z\n    updated_at: 2014-08-13 04:51:41.458545294 Z\n	\N	2014-08-13 04:51:41.464582	\N	\N	\N	\N	2014-08-13 04:51:41.464876	2014-08-13 04:51:41.464876
11	0	0	--- !ruby/object:Delayed::PerformableMailer\nobject: !ruby/class 'UserMailer'\nmethod_name: :signup_email\nargs:\n- !ruby/ActiveRecord:User\n  attributes:\n    id: '11'\n    email: alicezane8@gmail.com\n    referral_code: 978ee2e6f8\n    referrer_id: \n    created_at: 2014-08-13 22:18:02.091882794 Z\n    updated_at: 2014-08-13 22:18:02.091882794 Z\n	\N	2014-08-13 22:18:02.191126	\N	\N	\N	\N	2014-08-13 22:18:02.191875	2014-08-13 22:18:02.191875
12	0	0	--- !ruby/object:Delayed::PerformableMailer\nobject: !ruby/class 'UserMailer'\nmethod_name: :signup_email\nargs:\n- !ruby/ActiveRecord:User\n  attributes:\n    id: '12'\n    email: sarah_18hms@hotmail.co.uk\n    referral_code: f5853385bc\n    referrer_id: 6\n    created_at: 2014-08-14 00:49:43.458840754 Z\n    updated_at: 2014-08-14 00:49:43.458840754 Z\n	\N	2014-08-14 00:49:43.491146	\N	\N	\N	\N	2014-08-14 00:49:43.491861	2014-08-14 00:49:43.491861
13	0	0	--- !ruby/object:Delayed::PerformableMailer\nobject: !ruby/class 'UserMailer'\nmethod_name: :signup_email\nargs:\n- !ruby/ActiveRecord:User\n  attributes:\n    id: '13'\n    email: fabienma@outlook.com\n    referral_code: d98f78a0ce\n    referrer_id: 8\n    created_at: 2014-08-14 10:31:46.120190673 Z\n    updated_at: 2014-08-14 10:31:46.120190673 Z\n	\N	2014-08-14 10:31:46.216514	\N	\N	\N	\N	2014-08-14 10:31:46.217257	2014-08-14 10:31:46.217257
14	0	0	--- !ruby/object:Delayed::PerformableMailer\nobject: !ruby/class 'UserMailer'\nmethod_name: :signup_email\nargs:\n- !ruby/ActiveRecord:User\n  attributes:\n    id: '14'\n    email: terriku_@hotmail.com\n    referral_code: ccfe269af7\n    referrer_id: 6\n    created_at: 2014-08-15 15:08:46.983890835 Z\n    updated_at: 2014-08-15 15:08:46.983890835 Z\n	\N	2014-08-15 15:08:47.017038	\N	\N	\N	\N	2014-08-15 15:08:47.017845	2014-08-15 15:08:47.017845
15	0	0	--- !ruby/object:Delayed::PerformableMailer\nobject: !ruby/class 'UserMailer'\nmethod_name: :signup_email\nargs:\n- !ruby/ActiveRecord:User\n  attributes:\n    id: '15'\n    email: gelatinfishes@gmail.com\n    referral_code: 961bd75e75\n    referrer_id: 14\n    created_at: 2014-08-19 16:41:29.048187092 Z\n    updated_at: 2014-08-19 16:41:29.048187092 Z\n	\N	2014-08-19 16:41:29.081751	\N	\N	\N	\N	2014-08-19 16:41:29.082386	2014-08-19 16:41:29.082386
16	0	0	--- !ruby/object:Delayed::PerformableMailer\nobject: !ruby/class 'UserMailer'\nmethod_name: :signup_email\nargs:\n- !ruby/ActiveRecord:User\n  attributes:\n    id: '16'\n    email: Alicezane8@gmail.com\n    referral_code: aaf0c35fc8\n    referrer_id: \n    created_at: 2014-08-20 06:35:42.291683343 Z\n    updated_at: 2014-08-20 06:35:42.291683343 Z\n	\N	2014-08-20 06:35:42.319715	\N	\N	\N	\N	2014-08-20 06:35:42.320411	2014-08-20 06:35:42.320411
\.


--
-- Name: delayed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dtjsjejwmcngmd
--

SELECT pg_catalog.setval('delayed_jobs_id_seq', 16, true);


--
-- Data for Name: ip_addresses; Type: TABLE DATA; Schema: public; Owner: dtjsjejwmcngmd
--

COPY ip_addresses (id, address, count, created_at, updated_at) FROM stdin;
1	184.75.34.11	3	2014-08-11 14:56:23.417733	2014-08-11 18:03:30.284277
2	70.208.73.146	2	2014-08-11 18:21:35.004094	2014-08-11 19:39:40.878485
3	98.14.204.139	1	2014-08-13 01:06:49.314541	2014-08-13 01:06:49.340231
4	172.248.39.11	1	2014-08-13 01:40:16.230282	2014-08-13 01:40:16.239003
5	203.169.34.3	1	2014-08-13 02:00:32.399921	2014-08-13 02:00:32.411076
6	209.122.112.22	1	2014-08-13 03:20:09.676002	2014-08-13 03:20:09.694563
7	124.217.139.11	1	2014-08-13 04:51:41.325936	2014-08-13 04:51:41.342637
8	72.69.39.168	1	2014-08-13 22:18:02.022419	2014-08-13 22:18:02.060395
9	41.78.195.6	1	2014-08-14 00:49:43.402856	2014-08-14 00:49:43.424988
10	216.131.75.207	1	2014-08-14 10:31:46.066106	2014-08-14 10:31:46.084701
11	173.75.228.199	1	2014-08-15 15:08:46.934051	2014-08-15 15:08:46.950839
12	196.37.129.166	1	2014-08-19 16:41:29.00131	2014-08-19 16:41:29.015912
13	70.210.228.81	1	2014-08-20 06:35:42.250939	2014-08-20 06:35:42.265937
\.


--
-- Name: ip_addresses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dtjsjejwmcngmd
--

SELECT pg_catalog.setval('ip_addresses_id_seq', 13, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: dtjsjejwmcngmd
--

COPY schema_migrations (version) FROM stdin;
20130312045541
20130127063936
20130127063940
20130227185712
20130127063939
20130126215239
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: dtjsjejwmcngmd
--

COPY users (id, email, referral_code, referrer_id, created_at, updated_at) FROM stdin;
1	melon@gmail.com	dc723c6fe7	\N	2014-08-11 14:56:23.516574	2014-08-11 14:56:23.516574
2	James@curelead.com	f278ff17f0	1	2014-08-11 14:57:20.164768	2014-08-11 14:57:20.164768
3	james@curelead.com	71dd6d0c2e	\N	2014-08-11 18:03:30.375324	2014-08-11 18:03:30.375324
4	John@curelead.com	34a80aecdc	3	2014-08-11 18:21:35.060138	2014-08-11 18:21:35.060138
5	John@bijouxjungle.com	5a1435c61d	\N	2014-08-11 19:39:40.916788	2014-08-11 19:39:40.916788
6	jameszhang852@gmail.com	4e9959e6d6	\N	2014-08-13 01:06:49.369719	2014-08-13 01:06:49.369719
7	Rebeccawyiu@yahoo.com	759d7dffa2	6	2014-08-13 01:40:16.267524	2014-08-13 01:40:16.267524
8	31lawrencelee@gmail.com	93e81c308c	6	2014-08-13 02:00:32.432364	2014-08-13 02:00:32.432364
9	Jennyhu326@gmail.com	d9a51b0637	6	2014-08-13 03:20:09.727709	2014-08-13 03:20:09.727709
10	Toastnbutter@gmail.com	7d1da5db64	6	2014-08-13 04:51:41.458545	2014-08-13 04:51:41.458545
11	alicezane8@gmail.com	978ee2e6f8	\N	2014-08-13 22:18:02.091882	2014-08-13 22:18:02.091882
12	sarah_18hms@hotmail.co.uk	f5853385bc	6	2014-08-14 00:49:43.45884	2014-08-14 00:49:43.45884
13	fabienma@outlook.com	d98f78a0ce	8	2014-08-14 10:31:46.12019	2014-08-14 10:31:46.12019
14	terriku_@hotmail.com	ccfe269af7	6	2014-08-15 15:08:46.98389	2014-08-15 15:08:46.98389
15	gelatinfishes@gmail.com	961bd75e75	14	2014-08-19 16:41:29.048187	2014-08-19 16:41:29.048187
16	Alicezane8@gmail.com	aaf0c35fc8	\N	2014-08-20 06:35:42.291683	2014-08-20 06:35:42.291683
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dtjsjejwmcngmd
--

SELECT pg_catalog.setval('users_id_seq', 16, true);


--
-- Name: active_admin_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: dtjsjejwmcngmd; Tablespace: 
--

ALTER TABLE ONLY active_admin_comments
    ADD CONSTRAINT active_admin_comments_pkey PRIMARY KEY (id);


--
-- Name: admin_users_pkey; Type: CONSTRAINT; Schema: public; Owner: dtjsjejwmcngmd; Tablespace: 
--

ALTER TABLE ONLY admin_users
    ADD CONSTRAINT admin_users_pkey PRIMARY KEY (id);


--
-- Name: delayed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: dtjsjejwmcngmd; Tablespace: 
--

ALTER TABLE ONLY delayed_jobs
    ADD CONSTRAINT delayed_jobs_pkey PRIMARY KEY (id);


--
-- Name: ip_addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: dtjsjejwmcngmd; Tablespace: 
--

ALTER TABLE ONLY ip_addresses
    ADD CONSTRAINT ip_addresses_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: dtjsjejwmcngmd; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: delayed_jobs_priority; Type: INDEX; Schema: public; Owner: dtjsjejwmcngmd; Tablespace: 
--

CREATE INDEX delayed_jobs_priority ON delayed_jobs USING btree (priority, run_at);


--
-- Name: index_active_admin_comments_on_author_type_and_author_id; Type: INDEX; Schema: public; Owner: dtjsjejwmcngmd; Tablespace: 
--

CREATE INDEX index_active_admin_comments_on_author_type_and_author_id ON active_admin_comments USING btree (author_type, author_id);


--
-- Name: index_active_admin_comments_on_namespace; Type: INDEX; Schema: public; Owner: dtjsjejwmcngmd; Tablespace: 
--

CREATE INDEX index_active_admin_comments_on_namespace ON active_admin_comments USING btree (namespace);


--
-- Name: index_admin_notes_on_resource_type_and_resource_id; Type: INDEX; Schema: public; Owner: dtjsjejwmcngmd; Tablespace: 
--

CREATE INDEX index_admin_notes_on_resource_type_and_resource_id ON active_admin_comments USING btree (resource_type, resource_id);


--
-- Name: index_admin_users_on_email; Type: INDEX; Schema: public; Owner: dtjsjejwmcngmd; Tablespace: 
--

CREATE UNIQUE INDEX index_admin_users_on_email ON admin_users USING btree (email);


--
-- Name: index_admin_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: dtjsjejwmcngmd; Tablespace: 
--

CREATE UNIQUE INDEX index_admin_users_on_reset_password_token ON admin_users USING btree (reset_password_token);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: dtjsjejwmcngmd; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- PostgreSQL database dump complete
--

