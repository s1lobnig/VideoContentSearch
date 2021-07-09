--
-- PostgreSQL database dump
--

-- Dumped from database version 12.1
-- Dumped by pg_dump version 12.1

-- Started on 2021-07-09 15:17:17

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
-- TOC entry 204 (class 1259 OID 23886)
-- Name: concept; Type: TABLE; Schema: public; Owner: videouser
--

CREATE TABLE public.concept (
    id integer NOT NULL,
    name character varying(255)
);


ALTER TABLE public.concept OWNER TO videouser;

--
-- TOC entry 205 (class 1259 OID 23906)
-- Name: concept_id_seq; Type: SEQUENCE; Schema: public; Owner: videouser
--

ALTER TABLE public.concept ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.concept_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 203 (class 1259 OID 23876)
-- Name: keyframe; Type: TABLE; Schema: public; Owner: videouser
--

CREATE TABLE public.keyframe (
    id integer NOT NULL,
    videoid integer NOT NULL,
    path character varying NOT NULL
);


ALTER TABLE public.keyframe OWNER TO videouser;

--
-- TOC entry 206 (class 1259 OID 23908)
-- Name: keyframe_id_seq; Type: SEQUENCE; Schema: public; Owner: videouser
--

ALTER TABLE public.keyframe ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.keyframe_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 209 (class 1259 OID 23933)
-- Name: keyframeconcept; Type: TABLE; Schema: public; Owner: videouser
--

CREATE TABLE public.keyframeconcept (
    id integer NOT NULL,
    keyframeid integer NOT NULL,
    conceptid integer NOT NULL,
    confidence double precision NOT NULL
);


ALTER TABLE public.keyframeconcept OWNER TO videouser;

--
-- TOC entry 208 (class 1259 OID 23931)
-- Name: keyframeconcept_id_seq; Type: SEQUENCE; Schema: public; Owner: videouser
--

ALTER TABLE public.keyframeconcept ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.keyframeconcept_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 202 (class 1259 OID 23866)
-- Name: video; Type: TABLE; Schema: public; Owner: videouser
--

CREATE TABLE public.video (
    id integer NOT NULL,
    path character varying(255) NOT NULL
);


ALTER TABLE public.video OWNER TO videouser;

--
-- TOC entry 207 (class 1259 OID 23912)
-- Name: video_id_seq; Type: SEQUENCE; Schema: public; Owner: videouser
--

ALTER TABLE public.video ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.video_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 2845 (class 0 OID 23886)
-- Dependencies: 204
-- Data for Name: concept; Type: TABLE DATA; Schema: public; Owner: videouser
--

COPY public.concept (id, name) FROM stdin;
1	person
2	cat
3	dog
4	fish
5	child
6	car
\.


--
-- TOC entry 2844 (class 0 OID 23876)
-- Dependencies: 203
-- Data for Name: keyframe; Type: TABLE DATA; Schema: public; Owner: videouser
--

COPY public.keyframe (id, videoid, path) FROM stdin;
1	0	C:\\Users\\selen\\OneDrive\\Desktop\\keyframes\\keyframe1.png
2	0	C:\\Users\\selen\\OneDrive\\Desktop\\keyframes\\keyframe2.png
3	0	C:\\Users\\selen\\OneDrive\\Desktop\\keyframes\\keyframe3.png
4	0	C:\\Users\\selen\\OneDrive\\Desktop\\keyframes\\keyframe4.png
5	0	C:\\Users\\selen\\OneDrive\\Desktop\\keyframes\\keyframe5.png
6	0	C:\\Users\\selen\\OneDrive\\Desktop\\keyframes\\keyframe6.png
7	0	C:\\Users\\selen\\OneDrive\\Desktop\\keyframes\\keyframe7.png
8	0	C:\\Users\\selen\\OneDrive\\Desktop\\keyframes\\keyframe8.png
9	0	C:\\Users\\selen\\OneDrive\\Desktop\\keyframes\\keyframe9.png
10	0	path
11	0	path
12	1	path
13	1	path
14	1	path
15	1	path
16	1	path
17	1	path
18	1	path
19	1	path
20	1	path
21	2	path
22	2	path
23	3	path
24	3	path
25	3	path
26	3	path
27	3	path
28	3	path
29	3	path
30	3	path
31	3	path
32	3	path
33	3	path
34	3	path
35	3	path
36	4	path
37	5	path
38	5	path
39	5	path
40	5	path
41	5	path
42	5	path
43	5	path
44	5	path
45	5	path
46	5	path
47	5	path
48	5	path
49	6	path
50	6	path
51	6	path
52	6	path
53	6	path
54	6	path
55	7	path
56	7	path
57	8	path
58	8	path
59	8	path
60	8	path
61	8	path
62	8	path
63	8	path
64	8	path
65	8	path
66	8	path
67	8	path
68	8	path
69	8	path
70	8	path
71	8	path
72	8	path
73	8	path
74	8	path
75	8	path
76	8	path
77	8	path
78	8	path
79	8	path
80	8	path
\.


--
-- TOC entry 2850 (class 0 OID 23933)
-- Dependencies: 209
-- Data for Name: keyframeconcept; Type: TABLE DATA; Schema: public; Owner: videouser
--

COPY public.keyframeconcept (id, keyframeid, conceptid, confidence) FROM stdin;
1	1	1	0.7
2	2	1	0.4
3	3	1	0.9
4	4	3	0.1
5	5	3	0.3
6	6	3	0.8
7	7	2	0.95
8	8	5	0.75
9	9	5	0.35
10	10	5	0.3
\.


--
-- TOC entry 2843 (class 0 OID 23866)
-- Dependencies: 202
-- Data for Name: video; Type: TABLE DATA; Schema: public; Owner: videouser
--

COPY public.video (id, path) FROM stdin;
0	C:\\Users\\selen\\OneDrive - Alpen-Adria Universität Klagenfurt\\UNI\\8.Semester\\Multimedia Systems\\Project\\videos\\00492
1	C:\\Users\\selen\\OneDrive - Alpen-Adria Universität Klagenfurt\\UNI\\8.Semester\\Multimedia Systems\\Project\\videos\\01729
2	C:\\Users\\selen\\OneDrive - Alpen-Adria Universität Klagenfurt\\UNI\\8.Semester\\Multimedia Systems\\Project\\videos\\01736
3	C:\\Users\\selen\\OneDrive - Alpen-Adria Universität Klagenfurt\\UNI\\8.Semester\\Multimedia Systems\\Project\\videos\\03847
4	C:\\Users\\selen\\OneDrive - Alpen-Adria Universität Klagenfurt\\UNI\\8.Semester\\Multimedia Systems\\Project\\videos\\05814
5	C:\\Users\\selen\\OneDrive - Alpen-Adria Universität Klagenfurt\\UNI\\8.Semester\\Multimedia Systems\\Project\\videos\\05979
6	C:\\Users\\selen\\OneDrive - Alpen-Adria Universität Klagenfurt\\UNI\\8.Semester\\Multimedia Systems\\Project\\videos\\06385
7	C:\\Users\\selen\\OneDrive - Alpen-Adria Universität Klagenfurt\\UNI\\8.Semester\\Multimedia Systems\\Project\\videos\\07031
8	C:\\Users\\selen\\OneDrive - Alpen-Adria Universität Klagenfurt\\UNI\\8.Semester\\Multimedia Systems\\Project\\videos\\07037
9	C:\\Users\\selen\\OneDrive - Alpen-Adria Universität Klagenfurt\\UNI\\8.Semester\\Multimedia Systems\\Project\\videos\\07187
\.


--
-- TOC entry 2856 (class 0 OID 0)
-- Dependencies: 205
-- Name: concept_id_seq; Type: SEQUENCE SET; Schema: public; Owner: videouser
--

SELECT pg_catalog.setval('public.concept_id_seq', 6, true);


--
-- TOC entry 2857 (class 0 OID 0)
-- Dependencies: 206
-- Name: keyframe_id_seq; Type: SEQUENCE SET; Schema: public; Owner: videouser
--

SELECT pg_catalog.setval('public.keyframe_id_seq', 80, true);


--
-- TOC entry 2858 (class 0 OID 0)
-- Dependencies: 208
-- Name: keyframeconcept_id_seq; Type: SEQUENCE SET; Schema: public; Owner: videouser
--

SELECT pg_catalog.setval('public.keyframeconcept_id_seq', 10, true);


--
-- TOC entry 2859 (class 0 OID 0)
-- Dependencies: 207
-- Name: video_id_seq; Type: SEQUENCE SET; Schema: public; Owner: videouser
--

SELECT pg_catalog.setval('public.video_id_seq', 1, false);


--
-- TOC entry 2711 (class 2606 OID 23890)
-- Name: concept concept_pkey; Type: CONSTRAINT; Schema: public; Owner: videouser
--

ALTER TABLE ONLY public.concept
    ADD CONSTRAINT concept_pkey PRIMARY KEY (id);


--
-- TOC entry 2709 (class 2606 OID 23880)
-- Name: keyframe keyframe_pkey; Type: CONSTRAINT; Schema: public; Owner: videouser
--

ALTER TABLE ONLY public.keyframe
    ADD CONSTRAINT keyframe_pkey PRIMARY KEY (id);


--
-- TOC entry 2713 (class 2606 OID 23937)
-- Name: keyframeconcept keyframeconcept_pkey; Type: CONSTRAINT; Schema: public; Owner: videouser
--

ALTER TABLE ONLY public.keyframeconcept
    ADD CONSTRAINT keyframeconcept_pkey PRIMARY KEY (id);


--
-- TOC entry 2707 (class 2606 OID 23870)
-- Name: video video_pkey; Type: CONSTRAINT; Schema: public; Owner: videouser
--

ALTER TABLE ONLY public.video
    ADD CONSTRAINT video_pkey PRIMARY KEY (id);


--
-- TOC entry 2716 (class 2606 OID 23943)
-- Name: keyframeconcept conceptid_fk; Type: FK CONSTRAINT; Schema: public; Owner: videouser
--

ALTER TABLE ONLY public.keyframeconcept
    ADD CONSTRAINT conceptid_fk FOREIGN KEY (conceptid) REFERENCES public.concept(id);


--
-- TOC entry 2715 (class 2606 OID 23938)
-- Name: keyframeconcept keyframeid_fk; Type: FK CONSTRAINT; Schema: public; Owner: videouser
--

ALTER TABLE ONLY public.keyframeconcept
    ADD CONSTRAINT keyframeid_fk FOREIGN KEY (keyframeid) REFERENCES public.keyframe(id);


--
-- TOC entry 2714 (class 2606 OID 23881)
-- Name: keyframe videoid; Type: FK CONSTRAINT; Schema: public; Owner: videouser
--

ALTER TABLE ONLY public.keyframe
    ADD CONSTRAINT videoid FOREIGN KEY (videoid) REFERENCES public.video(id);


-- Completed on 2021-07-09 15:17:17

--
-- PostgreSQL database dump complete
--

