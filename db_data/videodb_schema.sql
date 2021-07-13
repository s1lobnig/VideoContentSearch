--
-- PostgreSQL database dump
--

-- Dumped from database version 12.1
-- Dumped by pg_dump version 12.1

-- Started on 2021-07-13 16:57:08

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

--
-- TOC entry 2853 (class 1262 OID 23865)
-- Name: videodb; Type: DATABASE; Schema: -; Owner: videouser
--

CREATE DATABASE videodb WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'German_Germany.1252' LC_CTYPE = 'German_Germany.1252';


ALTER DATABASE videodb OWNER TO videouser;

\connect videodb

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
-- TOC entry 208 (class 1259 OID 23997)
-- Name: conceptk; Type: TABLE; Schema: public; Owner: videouser
--

CREATE TABLE public.conceptk (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.conceptk OWNER TO videouser;

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
-- TOC entry 204 (class 1259 OID 23908)
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
-- TOC entry 207 (class 1259 OID 23933)
-- Name: keyframeconcept; Type: TABLE; Schema: public; Owner: videouser
--

CREATE TABLE public.keyframeconcept (
    id integer NOT NULL,
    keyframeid integer NOT NULL,
    conceptid integer NOT NULL,
    confidence double precision NOT NULL,
    CONSTRAINT conceptkey CHECK (((conceptid > 0) AND (conceptid <= 1000)))
);


ALTER TABLE public.keyframeconcept OWNER TO videouser;

--
-- TOC entry 206 (class 1259 OID 23931)
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
-- TOC entry 205 (class 1259 OID 23912)
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
-- TOC entry 2847 (class 0 OID 23997)
-- Dependencies: 208
-- Data for Name: conceptk; Type: TABLE DATA; Schema: public; Owner: videouser
--

INSERT INTO public.conceptk (id, name) VALUES (1, 'tench');
INSERT INTO public.conceptk (id, name) VALUES (1, 'tinca tinca');
INSERT INTO public.conceptk (id, name) VALUES (2, 'goldfish');
INSERT INTO public.conceptk (id, name) VALUES (2, 'carassius auratus');
INSERT INTO public.conceptk (id, name) VALUES (3, 'great white shark');
INSERT INTO public.conceptk (id, name) VALUES (3, 'white shark');
INSERT INTO public.conceptk (id, name) VALUES (3, 'man-eater');
INSERT INTO public.conceptk (id, name) VALUES (3, 'man-eating shark');
INSERT INTO public.conceptk (id, name) VALUES (3, 'carcharodon carcharias');
INSERT INTO public.conceptk (id, name) VALUES (4, 'tiger shark');
INSERT INTO public.conceptk (id, name) VALUES (4, 'galeocerdo cuvieri');
INSERT INTO public.conceptk (id, name) VALUES (5, 'hammerhead');
INSERT INTO public.conceptk (id, name) VALUES (5, 'hammerhead shark');
INSERT INTO public.conceptk (id, name) VALUES (6, 'electric ray');
INSERT INTO public.conceptk (id, name) VALUES (6, 'crampfish');
INSERT INTO public.conceptk (id, name) VALUES (6, 'numbfish');
INSERT INTO public.conceptk (id, name) VALUES (6, 'torpedo');
INSERT INTO public.conceptk (id, name) VALUES (7, 'stingray');
INSERT INTO public.conceptk (id, name) VALUES (8, 'cock');
INSERT INTO public.conceptk (id, name) VALUES (9, 'hen');
INSERT INTO public.conceptk (id, name) VALUES (10, 'ostrich');
INSERT INTO public.conceptk (id, name) VALUES (10, 'struthio camelus');
INSERT INTO public.conceptk (id, name) VALUES (11, 'brambling');
INSERT INTO public.conceptk (id, name) VALUES (11, 'fringilla montifringilla');
INSERT INTO public.conceptk (id, name) VALUES (12, 'goldfinch');
INSERT INTO public.conceptk (id, name) VALUES (12, 'carduelis carduelis');
INSERT INTO public.conceptk (id, name) VALUES (13, 'house finch');
INSERT INTO public.conceptk (id, name) VALUES (13, 'linnet');
INSERT INTO public.conceptk (id, name) VALUES (13, 'carpodacus mexicanus');
INSERT INTO public.conceptk (id, name) VALUES (14, 'junco');
INSERT INTO public.conceptk (id, name) VALUES (14, 'snowbird');
INSERT INTO public.conceptk (id, name) VALUES (15, 'indigo bunting');
INSERT INTO public.conceptk (id, name) VALUES (15, 'indigo finch');
INSERT INTO public.conceptk (id, name) VALUES (15, 'indigo bird');
INSERT INTO public.conceptk (id, name) VALUES (15, 'passerina cyanea');
INSERT INTO public.conceptk (id, name) VALUES (16, 'robin');
INSERT INTO public.conceptk (id, name) VALUES (16, 'american robin');
INSERT INTO public.conceptk (id, name) VALUES (16, 'turdus migratorius');
INSERT INTO public.conceptk (id, name) VALUES (17, 'bulbul');
INSERT INTO public.conceptk (id, name) VALUES (18, 'jay');
INSERT INTO public.conceptk (id, name) VALUES (19, 'magpie');
INSERT INTO public.conceptk (id, name) VALUES (20, 'chickadee');
INSERT INTO public.conceptk (id, name) VALUES (21, 'water ouzel');
INSERT INTO public.conceptk (id, name) VALUES (21, 'dipper');
INSERT INTO public.conceptk (id, name) VALUES (22, 'kite');
INSERT INTO public.conceptk (id, name) VALUES (23, 'bald eagle');
INSERT INTO public.conceptk (id, name) VALUES (23, 'american eagle');
INSERT INTO public.conceptk (id, name) VALUES (23, 'haliaeetus leucocephalus');
INSERT INTO public.conceptk (id, name) VALUES (24, 'vulture');
INSERT INTO public.conceptk (id, name) VALUES (25, 'great grey owl');
INSERT INTO public.conceptk (id, name) VALUES (25, 'great gray owl');
INSERT INTO public.conceptk (id, name) VALUES (25, 'strix nebulosa');
INSERT INTO public.conceptk (id, name) VALUES (26, 'european fire salamander');
INSERT INTO public.conceptk (id, name) VALUES (26, 'salamandra salamandra');
INSERT INTO public.conceptk (id, name) VALUES (27, 'common newt');
INSERT INTO public.conceptk (id, name) VALUES (27, 'triturus vulgaris');
INSERT INTO public.conceptk (id, name) VALUES (28, 'eft');
INSERT INTO public.conceptk (id, name) VALUES (29, 'spotted salamander');
INSERT INTO public.conceptk (id, name) VALUES (29, 'ambystoma maculatum');
INSERT INTO public.conceptk (id, name) VALUES (30, 'axolotl');
INSERT INTO public.conceptk (id, name) VALUES (30, 'mud puppy');
INSERT INTO public.conceptk (id, name) VALUES (30, 'ambystoma mexicanum');
INSERT INTO public.conceptk (id, name) VALUES (31, 'bullfrog');
INSERT INTO public.conceptk (id, name) VALUES (31, 'rana catesbeiana');
INSERT INTO public.conceptk (id, name) VALUES (32, 'tree frog');
INSERT INTO public.conceptk (id, name) VALUES (32, 'tree-frog');
INSERT INTO public.conceptk (id, name) VALUES (33, 'tailed frog');
INSERT INTO public.conceptk (id, name) VALUES (33, 'bell toad');
INSERT INTO public.conceptk (id, name) VALUES (33, 'ribbed toad');
INSERT INTO public.conceptk (id, name) VALUES (33, 'tailed toad');
INSERT INTO public.conceptk (id, name) VALUES (33, 'ascaphus trui');
INSERT INTO public.conceptk (id, name) VALUES (34, 'loggerhead');
INSERT INTO public.conceptk (id, name) VALUES (34, 'loggerhead turtle');
INSERT INTO public.conceptk (id, name) VALUES (34, 'caretta caretta');
INSERT INTO public.conceptk (id, name) VALUES (35, 'leatherback turtle');
INSERT INTO public.conceptk (id, name) VALUES (35, 'leatherback');
INSERT INTO public.conceptk (id, name) VALUES (35, 'leathery turtle');
INSERT INTO public.conceptk (id, name) VALUES (35, 'dermochelys coriacea');
INSERT INTO public.conceptk (id, name) VALUES (36, 'mud turtle');
INSERT INTO public.conceptk (id, name) VALUES (37, 'terrapin');
INSERT INTO public.conceptk (id, name) VALUES (38, 'box turtle');
INSERT INTO public.conceptk (id, name) VALUES (38, 'box tortoise');
INSERT INTO public.conceptk (id, name) VALUES (39, 'banded gecko');
INSERT INTO public.conceptk (id, name) VALUES (40, 'common iguana');
INSERT INTO public.conceptk (id, name) VALUES (40, 'iguana');
INSERT INTO public.conceptk (id, name) VALUES (40, 'iguana iguana');
INSERT INTO public.conceptk (id, name) VALUES (41, 'american chameleon');
INSERT INTO public.conceptk (id, name) VALUES (41, 'anole');
INSERT INTO public.conceptk (id, name) VALUES (41, 'anolis carolinensis');
INSERT INTO public.conceptk (id, name) VALUES (42, 'whiptail');
INSERT INTO public.conceptk (id, name) VALUES (42, 'whiptail lizard');
INSERT INTO public.conceptk (id, name) VALUES (43, 'agama');
INSERT INTO public.conceptk (id, name) VALUES (44, 'frilled lizard');
INSERT INTO public.conceptk (id, name) VALUES (44, 'chlamydosaurus kingi');
INSERT INTO public.conceptk (id, name) VALUES (45, 'alligator lizard');
INSERT INTO public.conceptk (id, name) VALUES (46, 'gila monster');
INSERT INTO public.conceptk (id, name) VALUES (46, 'heloderma suspectum');
INSERT INTO public.conceptk (id, name) VALUES (47, 'green lizard');
INSERT INTO public.conceptk (id, name) VALUES (47, 'lacerta viridis');
INSERT INTO public.conceptk (id, name) VALUES (48, 'african chameleon');
INSERT INTO public.conceptk (id, name) VALUES (48, 'chamaeleo chamaeleon');
INSERT INTO public.conceptk (id, name) VALUES (49, 'komodo dragon');
INSERT INTO public.conceptk (id, name) VALUES (49, 'komodo lizard');
INSERT INTO public.conceptk (id, name) VALUES (49, 'dragon lizard');
INSERT INTO public.conceptk (id, name) VALUES (49, 'giant lizard');
INSERT INTO public.conceptk (id, name) VALUES (49, 'varanus komodoensis');
INSERT INTO public.conceptk (id, name) VALUES (50, 'african crocodile');
INSERT INTO public.conceptk (id, name) VALUES (50, 'nile crocodile');
INSERT INTO public.conceptk (id, name) VALUES (50, 'crocodylus niloticus');
INSERT INTO public.conceptk (id, name) VALUES (51, 'american alligator');
INSERT INTO public.conceptk (id, name) VALUES (51, 'alligator mississipiensis');
INSERT INTO public.conceptk (id, name) VALUES (52, 'triceratops');
INSERT INTO public.conceptk (id, name) VALUES (53, 'thunder snake');
INSERT INTO public.conceptk (id, name) VALUES (53, 'worm snake');
INSERT INTO public.conceptk (id, name) VALUES (53, 'carphophis amoenus');
INSERT INTO public.conceptk (id, name) VALUES (54, 'ringneck snake');
INSERT INTO public.conceptk (id, name) VALUES (54, 'ring-necked snake');
INSERT INTO public.conceptk (id, name) VALUES (54, 'ring snake');
INSERT INTO public.conceptk (id, name) VALUES (55, 'hognose snake');
INSERT INTO public.conceptk (id, name) VALUES (55, 'puff adder');
INSERT INTO public.conceptk (id, name) VALUES (55, 'sand viper');
INSERT INTO public.conceptk (id, name) VALUES (56, 'green snake');
INSERT INTO public.conceptk (id, name) VALUES (56, 'grass snake');
INSERT INTO public.conceptk (id, name) VALUES (57, 'king snake');
INSERT INTO public.conceptk (id, name) VALUES (57, 'kingsnake');
INSERT INTO public.conceptk (id, name) VALUES (58, 'garter snake');
INSERT INTO public.conceptk (id, name) VALUES (59, 'water snake');
INSERT INTO public.conceptk (id, name) VALUES (60, 'vine snake');
INSERT INTO public.conceptk (id, name) VALUES (61, 'night snake');
INSERT INTO public.conceptk (id, name) VALUES (61, 'hypsiglena torquata');
INSERT INTO public.conceptk (id, name) VALUES (62, 'boa constrictor');
INSERT INTO public.conceptk (id, name) VALUES (62, 'constrictor constrictor');
INSERT INTO public.conceptk (id, name) VALUES (63, 'rock python');
INSERT INTO public.conceptk (id, name) VALUES (63, 'rock snake');
INSERT INTO public.conceptk (id, name) VALUES (63, 'python sebae');
INSERT INTO public.conceptk (id, name) VALUES (64, 'indian cobra');
INSERT INTO public.conceptk (id, name) VALUES (64, 'naja naja');
INSERT INTO public.conceptk (id, name) VALUES (65, 'green mamba');
INSERT INTO public.conceptk (id, name) VALUES (66, 'sea snake');
INSERT INTO public.conceptk (id, name) VALUES (67, 'horned viper');
INSERT INTO public.conceptk (id, name) VALUES (67, 'cerastes');
INSERT INTO public.conceptk (id, name) VALUES (67, 'horned asp');
INSERT INTO public.conceptk (id, name) VALUES (67, 'cerastes cornutus');
INSERT INTO public.conceptk (id, name) VALUES (68, 'diamondback');
INSERT INTO public.conceptk (id, name) VALUES (68, 'diamondback rattlesnake');
INSERT INTO public.conceptk (id, name) VALUES (68, 'crotalus adamanteus');
INSERT INTO public.conceptk (id, name) VALUES (69, 'sidewinder');
INSERT INTO public.conceptk (id, name) VALUES (69, 'horned rattlesnake');
INSERT INTO public.conceptk (id, name) VALUES (69, 'crotalus cerastes');
INSERT INTO public.conceptk (id, name) VALUES (70, 'trilobite');
INSERT INTO public.conceptk (id, name) VALUES (71, 'harvestman');
INSERT INTO public.conceptk (id, name) VALUES (71, 'daddy longlegs');
INSERT INTO public.conceptk (id, name) VALUES (71, 'phalangium opilio');
INSERT INTO public.conceptk (id, name) VALUES (72, 'scorpion');
INSERT INTO public.conceptk (id, name) VALUES (73, 'black and gold garden spider');
INSERT INTO public.conceptk (id, name) VALUES (73, 'argiope aurantia');
INSERT INTO public.conceptk (id, name) VALUES (74, 'barn spider');
INSERT INTO public.conceptk (id, name) VALUES (74, 'araneus cavaticus');
INSERT INTO public.conceptk (id, name) VALUES (75, 'garden spider');
INSERT INTO public.conceptk (id, name) VALUES (75, 'aranea diademata');
INSERT INTO public.conceptk (id, name) VALUES (76, 'black widow');
INSERT INTO public.conceptk (id, name) VALUES (76, 'latrodectus mactans');
INSERT INTO public.conceptk (id, name) VALUES (77, 'tarantula');
INSERT INTO public.conceptk (id, name) VALUES (78, 'wolf spider');
INSERT INTO public.conceptk (id, name) VALUES (78, 'hunting spider');
INSERT INTO public.conceptk (id, name) VALUES (79, 'tick');
INSERT INTO public.conceptk (id, name) VALUES (80, 'centipede');
INSERT INTO public.conceptk (id, name) VALUES (81, 'black grouse');
INSERT INTO public.conceptk (id, name) VALUES (82, 'ptarmigan');
INSERT INTO public.conceptk (id, name) VALUES (83, 'ruffed grouse');
INSERT INTO public.conceptk (id, name) VALUES (83, 'bonasa umbellus');
INSERT INTO public.conceptk (id, name) VALUES (84, 'prairie chicken');
INSERT INTO public.conceptk (id, name) VALUES (84, 'prairie grouse');
INSERT INTO public.conceptk (id, name) VALUES (84, 'prairie fowl');
INSERT INTO public.conceptk (id, name) VALUES (85, 'peacock');
INSERT INTO public.conceptk (id, name) VALUES (86, 'quail');
INSERT INTO public.conceptk (id, name) VALUES (87, 'partridge');
INSERT INTO public.conceptk (id, name) VALUES (88, 'african grey');
INSERT INTO public.conceptk (id, name) VALUES (88, 'african gray');
INSERT INTO public.conceptk (id, name) VALUES (88, 'psittacus erithacus');
INSERT INTO public.conceptk (id, name) VALUES (89, 'macaw');
INSERT INTO public.conceptk (id, name) VALUES (90, 'sulphur-crested cockatoo');
INSERT INTO public.conceptk (id, name) VALUES (90, 'kakatoe galerita');
INSERT INTO public.conceptk (id, name) VALUES (90, 'cacatua galerita');
INSERT INTO public.conceptk (id, name) VALUES (91, 'lorikeet');
INSERT INTO public.conceptk (id, name) VALUES (92, 'coucal');
INSERT INTO public.conceptk (id, name) VALUES (93, 'bee eater');
INSERT INTO public.conceptk (id, name) VALUES (94, 'hornbill');
INSERT INTO public.conceptk (id, name) VALUES (95, 'hummingbird');
INSERT INTO public.conceptk (id, name) VALUES (96, 'jacamar');
INSERT INTO public.conceptk (id, name) VALUES (97, 'toucan');
INSERT INTO public.conceptk (id, name) VALUES (98, 'drake');
INSERT INTO public.conceptk (id, name) VALUES (99, 'red-breasted merganser');
INSERT INTO public.conceptk (id, name) VALUES (99, 'mergus serrator');
INSERT INTO public.conceptk (id, name) VALUES (100, 'goose');
INSERT INTO public.conceptk (id, name) VALUES (101, 'black swan');
INSERT INTO public.conceptk (id, name) VALUES (101, 'cygnus atratus');
INSERT INTO public.conceptk (id, name) VALUES (102, 'tusker');
INSERT INTO public.conceptk (id, name) VALUES (103, 'echidna');
INSERT INTO public.conceptk (id, name) VALUES (103, 'spiny anteater');
INSERT INTO public.conceptk (id, name) VALUES (103, 'anteater');
INSERT INTO public.conceptk (id, name) VALUES (104, 'platypus');
INSERT INTO public.conceptk (id, name) VALUES (104, 'duckbill');
INSERT INTO public.conceptk (id, name) VALUES (104, 'duckbilled platypus');
INSERT INTO public.conceptk (id, name) VALUES (104, 'duck-billed platypus');
INSERT INTO public.conceptk (id, name) VALUES (104, 'ornithorhynchus anatinus');
INSERT INTO public.conceptk (id, name) VALUES (105, 'wallaby');
INSERT INTO public.conceptk (id, name) VALUES (105, 'brush kangaroo');
INSERT INTO public.conceptk (id, name) VALUES (106, 'koala');
INSERT INTO public.conceptk (id, name) VALUES (106, 'koala bear');
INSERT INTO public.conceptk (id, name) VALUES (106, 'kangaroo bear');
INSERT INTO public.conceptk (id, name) VALUES (106, 'native bear');
INSERT INTO public.conceptk (id, name) VALUES (106, 'phascolarctos cinereus');
INSERT INTO public.conceptk (id, name) VALUES (107, 'wombat');
INSERT INTO public.conceptk (id, name) VALUES (108, 'jellyfish');
INSERT INTO public.conceptk (id, name) VALUES (109, 'sea anemone');
INSERT INTO public.conceptk (id, name) VALUES (109, 'anemone');
INSERT INTO public.conceptk (id, name) VALUES (110, 'brain coral');
INSERT INTO public.conceptk (id, name) VALUES (111, 'flatworm');
INSERT INTO public.conceptk (id, name) VALUES (111, 'platyhelminth');
INSERT INTO public.conceptk (id, name) VALUES (112, 'nematode');
INSERT INTO public.conceptk (id, name) VALUES (112, 'nematode worm');
INSERT INTO public.conceptk (id, name) VALUES (112, 'roundworm');
INSERT INTO public.conceptk (id, name) VALUES (113, 'conch');
INSERT INTO public.conceptk (id, name) VALUES (114, 'snail');
INSERT INTO public.conceptk (id, name) VALUES (115, 'slug');
INSERT INTO public.conceptk (id, name) VALUES (116, 'sea slug');
INSERT INTO public.conceptk (id, name) VALUES (116, 'nudibranch');
INSERT INTO public.conceptk (id, name) VALUES (117, 'chiton');
INSERT INTO public.conceptk (id, name) VALUES (117, 'coat-of-mail shell');
INSERT INTO public.conceptk (id, name) VALUES (117, 'sea cradle');
INSERT INTO public.conceptk (id, name) VALUES (117, 'polyplacophore');
INSERT INTO public.conceptk (id, name) VALUES (118, 'chambered nautilus');
INSERT INTO public.conceptk (id, name) VALUES (118, 'pearly nautilus');
INSERT INTO public.conceptk (id, name) VALUES (118, 'nautilus');
INSERT INTO public.conceptk (id, name) VALUES (119, 'dungeness crab');
INSERT INTO public.conceptk (id, name) VALUES (119, 'cancer magister');
INSERT INTO public.conceptk (id, name) VALUES (120, 'rock crab');
INSERT INTO public.conceptk (id, name) VALUES (120, 'cancer irroratus');
INSERT INTO public.conceptk (id, name) VALUES (121, 'fiddler crab');
INSERT INTO public.conceptk (id, name) VALUES (122, 'king crab');
INSERT INTO public.conceptk (id, name) VALUES (122, 'alaska crab');
INSERT INTO public.conceptk (id, name) VALUES (122, 'alaskan king crab');
INSERT INTO public.conceptk (id, name) VALUES (122, 'alaska king crab');
INSERT INTO public.conceptk (id, name) VALUES (122, 'paralithodes camtschatica');
INSERT INTO public.conceptk (id, name) VALUES (123, 'american lobster');
INSERT INTO public.conceptk (id, name) VALUES (123, 'northern lobster');
INSERT INTO public.conceptk (id, name) VALUES (123, 'maine lobster');
INSERT INTO public.conceptk (id, name) VALUES (123, 'homarus americanus');
INSERT INTO public.conceptk (id, name) VALUES (124, 'spiny lobster');
INSERT INTO public.conceptk (id, name) VALUES (124, 'langouste');
INSERT INTO public.conceptk (id, name) VALUES (124, 'rock lobster');
INSERT INTO public.conceptk (id, name) VALUES (124, 'crawfish');
INSERT INTO public.conceptk (id, name) VALUES (124, 'sea crawfish');
INSERT INTO public.conceptk (id, name) VALUES (125, 'crayfish');
INSERT INTO public.conceptk (id, name) VALUES (125, 'crawdad');
INSERT INTO public.conceptk (id, name) VALUES (125, 'crawdaddy');
INSERT INTO public.conceptk (id, name) VALUES (126, 'hermit crab');
INSERT INTO public.conceptk (id, name) VALUES (127, 'isopod');
INSERT INTO public.conceptk (id, name) VALUES (128, 'white stork');
INSERT INTO public.conceptk (id, name) VALUES (128, 'ciconia ciconia');
INSERT INTO public.conceptk (id, name) VALUES (129, 'black stork');
INSERT INTO public.conceptk (id, name) VALUES (129, 'ciconia nigra');
INSERT INTO public.conceptk (id, name) VALUES (130, 'spoonbill');
INSERT INTO public.conceptk (id, name) VALUES (131, 'flamingo');
INSERT INTO public.conceptk (id, name) VALUES (132, 'little blue heron');
INSERT INTO public.conceptk (id, name) VALUES (132, 'egretta caerulea');
INSERT INTO public.conceptk (id, name) VALUES (133, 'american egret');
INSERT INTO public.conceptk (id, name) VALUES (133, 'great white heron');
INSERT INTO public.conceptk (id, name) VALUES (133, 'egretta albus');
INSERT INTO public.conceptk (id, name) VALUES (134, 'bittern');
INSERT INTO public.conceptk (id, name) VALUES (135, 'crane');
INSERT INTO public.conceptk (id, name) VALUES (136, 'limpkin');
INSERT INTO public.conceptk (id, name) VALUES (136, 'aramus pictus');
INSERT INTO public.conceptk (id, name) VALUES (137, 'european gallinule');
INSERT INTO public.conceptk (id, name) VALUES (137, 'porphyrio porphyrio');
INSERT INTO public.conceptk (id, name) VALUES (138, 'american coot');
INSERT INTO public.conceptk (id, name) VALUES (138, 'marsh hen');
INSERT INTO public.conceptk (id, name) VALUES (138, 'mud hen');
INSERT INTO public.conceptk (id, name) VALUES (138, 'water hen');
INSERT INTO public.conceptk (id, name) VALUES (138, 'fulica americana');
INSERT INTO public.conceptk (id, name) VALUES (139, 'bustard');
INSERT INTO public.conceptk (id, name) VALUES (140, 'ruddy turnstone');
INSERT INTO public.conceptk (id, name) VALUES (140, 'arenaria interpres');
INSERT INTO public.conceptk (id, name) VALUES (141, 'red-backed sandpiper');
INSERT INTO public.conceptk (id, name) VALUES (141, 'dunlin');
INSERT INTO public.conceptk (id, name) VALUES (141, 'erolia alpina');
INSERT INTO public.conceptk (id, name) VALUES (142, 'redshank');
INSERT INTO public.conceptk (id, name) VALUES (142, 'tringa totanus');
INSERT INTO public.conceptk (id, name) VALUES (143, 'dowitcher');
INSERT INTO public.conceptk (id, name) VALUES (144, 'oystercatcher');
INSERT INTO public.conceptk (id, name) VALUES (144, 'oyster catcher');
INSERT INTO public.conceptk (id, name) VALUES (145, 'pelican');
INSERT INTO public.conceptk (id, name) VALUES (146, 'king penguin');
INSERT INTO public.conceptk (id, name) VALUES (146, 'aptenodytes patagonica');
INSERT INTO public.conceptk (id, name) VALUES (147, 'albatross');
INSERT INTO public.conceptk (id, name) VALUES (147, 'mollymawk');
INSERT INTO public.conceptk (id, name) VALUES (148, 'grey whale');
INSERT INTO public.conceptk (id, name) VALUES (148, 'gray whale');
INSERT INTO public.conceptk (id, name) VALUES (148, 'devilfish');
INSERT INTO public.conceptk (id, name) VALUES (148, 'eschrichtius gibbosus');
INSERT INTO public.conceptk (id, name) VALUES (148, 'eschrichtius robustus');
INSERT INTO public.conceptk (id, name) VALUES (149, 'killer whale');
INSERT INTO public.conceptk (id, name) VALUES (149, 'killer');
INSERT INTO public.conceptk (id, name) VALUES (149, 'orca');
INSERT INTO public.conceptk (id, name) VALUES (149, 'grampus');
INSERT INTO public.conceptk (id, name) VALUES (149, 'sea wolf');
INSERT INTO public.conceptk (id, name) VALUES (149, 'orcinus orca');
INSERT INTO public.conceptk (id, name) VALUES (150, 'dugong');
INSERT INTO public.conceptk (id, name) VALUES (150, 'dugong dugon');
INSERT INTO public.conceptk (id, name) VALUES (151, 'sea lion');
INSERT INTO public.conceptk (id, name) VALUES (152, 'chihuahua');
INSERT INTO public.conceptk (id, name) VALUES (153, 'japanese spaniel');
INSERT INTO public.conceptk (id, name) VALUES (154, 'maltese dog');
INSERT INTO public.conceptk (id, name) VALUES (154, 'maltese terrier');
INSERT INTO public.conceptk (id, name) VALUES (154, 'maltese');
INSERT INTO public.conceptk (id, name) VALUES (155, 'pekinese');
INSERT INTO public.conceptk (id, name) VALUES (155, 'pekingese');
INSERT INTO public.conceptk (id, name) VALUES (155, 'peke');
INSERT INTO public.conceptk (id, name) VALUES (156, 'shih-tzu');
INSERT INTO public.conceptk (id, name) VALUES (157, 'blenheim spaniel');
INSERT INTO public.conceptk (id, name) VALUES (158, 'papillon');
INSERT INTO public.conceptk (id, name) VALUES (159, 'toy terrier');
INSERT INTO public.conceptk (id, name) VALUES (160, 'rhodesian ridgeback');
INSERT INTO public.conceptk (id, name) VALUES (161, 'afghan hound');
INSERT INTO public.conceptk (id, name) VALUES (161, 'afghan');
INSERT INTO public.conceptk (id, name) VALUES (162, 'basset');
INSERT INTO public.conceptk (id, name) VALUES (162, 'basset hound');
INSERT INTO public.conceptk (id, name) VALUES (163, 'beagle');
INSERT INTO public.conceptk (id, name) VALUES (164, 'bloodhound');
INSERT INTO public.conceptk (id, name) VALUES (164, 'sleuthhound');
INSERT INTO public.conceptk (id, name) VALUES (165, 'bluetick');
INSERT INTO public.conceptk (id, name) VALUES (166, 'black-and-tan coonhound');
INSERT INTO public.conceptk (id, name) VALUES (167, 'walker hound');
INSERT INTO public.conceptk (id, name) VALUES (167, 'walker foxhound');
INSERT INTO public.conceptk (id, name) VALUES (168, 'english foxhound');
INSERT INTO public.conceptk (id, name) VALUES (169, 'redbone');
INSERT INTO public.conceptk (id, name) VALUES (170, 'borzoi');
INSERT INTO public.conceptk (id, name) VALUES (170, 'russian wolfhound');
INSERT INTO public.conceptk (id, name) VALUES (171, 'irish wolfhound');
INSERT INTO public.conceptk (id, name) VALUES (172, 'italian greyhound');
INSERT INTO public.conceptk (id, name) VALUES (173, 'whippet');
INSERT INTO public.conceptk (id, name) VALUES (174, 'ibizan hound');
INSERT INTO public.conceptk (id, name) VALUES (174, 'ibizan podenco');
INSERT INTO public.conceptk (id, name) VALUES (175, 'norwegian elkhound');
INSERT INTO public.conceptk (id, name) VALUES (175, 'elkhound');
INSERT INTO public.conceptk (id, name) VALUES (176, 'otterhound');
INSERT INTO public.conceptk (id, name) VALUES (176, 'otter hound');
INSERT INTO public.conceptk (id, name) VALUES (177, 'saluki');
INSERT INTO public.conceptk (id, name) VALUES (177, 'gazelle hound');
INSERT INTO public.conceptk (id, name) VALUES (178, 'scottish deerhound');
INSERT INTO public.conceptk (id, name) VALUES (178, 'deerhound');
INSERT INTO public.conceptk (id, name) VALUES (179, 'weimaraner');
INSERT INTO public.conceptk (id, name) VALUES (180, 'staffordshire bullterrier');
INSERT INTO public.conceptk (id, name) VALUES (180, 'staffordshire bull terrier');
INSERT INTO public.conceptk (id, name) VALUES (181, 'american staffordshire terrier');
INSERT INTO public.conceptk (id, name) VALUES (181, 'staffordshire terrier');
INSERT INTO public.conceptk (id, name) VALUES (181, 'american pit bull terrier');
INSERT INTO public.conceptk (id, name) VALUES (181, 'pit bull terrier');
INSERT INTO public.conceptk (id, name) VALUES (182, 'bedlington terrier');
INSERT INTO public.conceptk (id, name) VALUES (183, 'border terrier');
INSERT INTO public.conceptk (id, name) VALUES (184, 'kerry blue terrier');
INSERT INTO public.conceptk (id, name) VALUES (185, 'irish terrier');
INSERT INTO public.conceptk (id, name) VALUES (186, 'norfolk terrier');
INSERT INTO public.conceptk (id, name) VALUES (187, 'norwich terrier');
INSERT INTO public.conceptk (id, name) VALUES (188, 'yorkshire terrier');
INSERT INTO public.conceptk (id, name) VALUES (189, 'wire-haired fox terrier');
INSERT INTO public.conceptk (id, name) VALUES (190, 'lakeland terrier');
INSERT INTO public.conceptk (id, name) VALUES (191, 'sealyham terrier');
INSERT INTO public.conceptk (id, name) VALUES (191, 'sealyham');
INSERT INTO public.conceptk (id, name) VALUES (192, 'airedale');
INSERT INTO public.conceptk (id, name) VALUES (192, 'airedale terrier');
INSERT INTO public.conceptk (id, name) VALUES (193, 'cairn');
INSERT INTO public.conceptk (id, name) VALUES (193, 'cairn terrier');
INSERT INTO public.conceptk (id, name) VALUES (194, 'australian terrier');
INSERT INTO public.conceptk (id, name) VALUES (195, 'dandie dinmont');
INSERT INTO public.conceptk (id, name) VALUES (195, 'dandie dinmont terrier');
INSERT INTO public.conceptk (id, name) VALUES (196, 'boston bull');
INSERT INTO public.conceptk (id, name) VALUES (196, 'boston terrier');
INSERT INTO public.conceptk (id, name) VALUES (197, 'miniature schnauzer');
INSERT INTO public.conceptk (id, name) VALUES (198, 'giant schnauzer');
INSERT INTO public.conceptk (id, name) VALUES (199, 'standard schnauzer');
INSERT INTO public.conceptk (id, name) VALUES (200, 'scotch terrier');
INSERT INTO public.conceptk (id, name) VALUES (200, 'scottish terrier');
INSERT INTO public.conceptk (id, name) VALUES (200, 'scottie');
INSERT INTO public.conceptk (id, name) VALUES (201, 'tibetan terrier');
INSERT INTO public.conceptk (id, name) VALUES (201, 'chrysanthemum dog');
INSERT INTO public.conceptk (id, name) VALUES (202, 'silky terrier');
INSERT INTO public.conceptk (id, name) VALUES (202, 'sydney silky');
INSERT INTO public.conceptk (id, name) VALUES (203, 'soft-coated wheaten terrier');
INSERT INTO public.conceptk (id, name) VALUES (204, 'west highland white terrier');
INSERT INTO public.conceptk (id, name) VALUES (205, 'lhasa');
INSERT INTO public.conceptk (id, name) VALUES (205, 'lhasa apso');
INSERT INTO public.conceptk (id, name) VALUES (206, 'flat-coated retriever');
INSERT INTO public.conceptk (id, name) VALUES (207, 'curly-coated retriever');
INSERT INTO public.conceptk (id, name) VALUES (208, 'golden retriever');
INSERT INTO public.conceptk (id, name) VALUES (209, 'labrador retriever');
INSERT INTO public.conceptk (id, name) VALUES (210, 'chesapeake bay retriever');
INSERT INTO public.conceptk (id, name) VALUES (211, 'german short-haired pointer');
INSERT INTO public.conceptk (id, name) VALUES (212, 'vizsla');
INSERT INTO public.conceptk (id, name) VALUES (212, 'hungarian pointer');
INSERT INTO public.conceptk (id, name) VALUES (213, 'english setter');
INSERT INTO public.conceptk (id, name) VALUES (214, 'irish setter');
INSERT INTO public.conceptk (id, name) VALUES (214, 'red setter');
INSERT INTO public.conceptk (id, name) VALUES (215, 'gordon setter');
INSERT INTO public.conceptk (id, name) VALUES (216, 'brittany spaniel');
INSERT INTO public.conceptk (id, name) VALUES (217, 'clumber');
INSERT INTO public.conceptk (id, name) VALUES (217, 'clumber spaniel');
INSERT INTO public.conceptk (id, name) VALUES (218, 'english springer');
INSERT INTO public.conceptk (id, name) VALUES (218, 'english springer spaniel');
INSERT INTO public.conceptk (id, name) VALUES (219, 'welsh springer spaniel');
INSERT INTO public.conceptk (id, name) VALUES (220, 'cocker spaniel');
INSERT INTO public.conceptk (id, name) VALUES (220, 'english cocker spaniel');
INSERT INTO public.conceptk (id, name) VALUES (220, 'cocker');
INSERT INTO public.conceptk (id, name) VALUES (221, 'sussex spaniel');
INSERT INTO public.conceptk (id, name) VALUES (222, 'irish water spaniel');
INSERT INTO public.conceptk (id, name) VALUES (223, 'kuvasz');
INSERT INTO public.conceptk (id, name) VALUES (224, 'schipperke');
INSERT INTO public.conceptk (id, name) VALUES (225, 'groenendael');
INSERT INTO public.conceptk (id, name) VALUES (226, 'malinois');
INSERT INTO public.conceptk (id, name) VALUES (227, 'briard');
INSERT INTO public.conceptk (id, name) VALUES (228, 'kelpie');
INSERT INTO public.conceptk (id, name) VALUES (229, 'komondor');
INSERT INTO public.conceptk (id, name) VALUES (230, 'old english sheepdog');
INSERT INTO public.conceptk (id, name) VALUES (230, 'bobtail');
INSERT INTO public.conceptk (id, name) VALUES (231, 'shetland sheepdog');
INSERT INTO public.conceptk (id, name) VALUES (231, 'shetland sheep dog');
INSERT INTO public.conceptk (id, name) VALUES (231, 'shetland');
INSERT INTO public.conceptk (id, name) VALUES (232, 'collie');
INSERT INTO public.conceptk (id, name) VALUES (233, 'border collie');
INSERT INTO public.conceptk (id, name) VALUES (234, 'bouvier des flandres');
INSERT INTO public.conceptk (id, name) VALUES (234, 'bouviers des flandres');
INSERT INTO public.conceptk (id, name) VALUES (235, 'rottweiler');
INSERT INTO public.conceptk (id, name) VALUES (236, 'german shepherd');
INSERT INTO public.conceptk (id, name) VALUES (236, 'german shepherd dog');
INSERT INTO public.conceptk (id, name) VALUES (236, 'german police dog');
INSERT INTO public.conceptk (id, name) VALUES (236, 'alsatian');
INSERT INTO public.conceptk (id, name) VALUES (237, 'doberman');
INSERT INTO public.conceptk (id, name) VALUES (237, 'doberman pinscher');
INSERT INTO public.conceptk (id, name) VALUES (238, 'miniature pinscher');
INSERT INTO public.conceptk (id, name) VALUES (239, 'greater swiss mountain dog');
INSERT INTO public.conceptk (id, name) VALUES (240, 'bernese mountain dog');
INSERT INTO public.conceptk (id, name) VALUES (241, 'appenzeller');
INSERT INTO public.conceptk (id, name) VALUES (242, 'entlebucher');
INSERT INTO public.conceptk (id, name) VALUES (243, 'boxer');
INSERT INTO public.conceptk (id, name) VALUES (244, 'bull mastiff');
INSERT INTO public.conceptk (id, name) VALUES (245, 'tibetan mastiff');
INSERT INTO public.conceptk (id, name) VALUES (246, 'french bulldog');
INSERT INTO public.conceptk (id, name) VALUES (247, 'great dane');
INSERT INTO public.conceptk (id, name) VALUES (248, 'saint bernard');
INSERT INTO public.conceptk (id, name) VALUES (248, 'st bernard');
INSERT INTO public.conceptk (id, name) VALUES (249, 'eskimo dog');
INSERT INTO public.conceptk (id, name) VALUES (249, 'husky');
INSERT INTO public.conceptk (id, name) VALUES (250, 'malamute');
INSERT INTO public.conceptk (id, name) VALUES (250, 'malemute');
INSERT INTO public.conceptk (id, name) VALUES (250, 'alaskan malamute');
INSERT INTO public.conceptk (id, name) VALUES (251, 'siberian husky');
INSERT INTO public.conceptk (id, name) VALUES (252, 'dalmatian');
INSERT INTO public.conceptk (id, name) VALUES (252, 'coach dog');
INSERT INTO public.conceptk (id, name) VALUES (252, 'carriage dog');
INSERT INTO public.conceptk (id, name) VALUES (253, 'affenpinscher');
INSERT INTO public.conceptk (id, name) VALUES (253, 'monkey pinscher');
INSERT INTO public.conceptk (id, name) VALUES (253, 'monkey dog');
INSERT INTO public.conceptk (id, name) VALUES (254, 'basenji');
INSERT INTO public.conceptk (id, name) VALUES (255, 'pug');
INSERT INTO public.conceptk (id, name) VALUES (255, 'pug-dog');
INSERT INTO public.conceptk (id, name) VALUES (256, 'leonberg');
INSERT INTO public.conceptk (id, name) VALUES (257, 'newfoundland');
INSERT INTO public.conceptk (id, name) VALUES (257, 'newfoundland dog');
INSERT INTO public.conceptk (id, name) VALUES (258, 'great pyrenees');
INSERT INTO public.conceptk (id, name) VALUES (259, 'samoyed');
INSERT INTO public.conceptk (id, name) VALUES (259, 'samoyede');
INSERT INTO public.conceptk (id, name) VALUES (260, 'pomeranian');
INSERT INTO public.conceptk (id, name) VALUES (261, 'chow');
INSERT INTO public.conceptk (id, name) VALUES (261, 'chow chow');
INSERT INTO public.conceptk (id, name) VALUES (262, 'keeshond');
INSERT INTO public.conceptk (id, name) VALUES (263, 'brabancon griffon');
INSERT INTO public.conceptk (id, name) VALUES (264, 'pembroke');
INSERT INTO public.conceptk (id, name) VALUES (264, 'pembroke welsh corgi');
INSERT INTO public.conceptk (id, name) VALUES (265, 'cardigan welsh corgi');
INSERT INTO public.conceptk (id, name) VALUES (266, 'toy poodle');
INSERT INTO public.conceptk (id, name) VALUES (267, 'miniature poodle');
INSERT INTO public.conceptk (id, name) VALUES (268, 'standard poodle');
INSERT INTO public.conceptk (id, name) VALUES (269, 'mexican hairless');
INSERT INTO public.conceptk (id, name) VALUES (270, 'timber wolf');
INSERT INTO public.conceptk (id, name) VALUES (270, 'grey wolf');
INSERT INTO public.conceptk (id, name) VALUES (270, 'gray wolf');
INSERT INTO public.conceptk (id, name) VALUES (270, 'canis lupus');
INSERT INTO public.conceptk (id, name) VALUES (271, 'white wolf');
INSERT INTO public.conceptk (id, name) VALUES (271, 'arctic wolf');
INSERT INTO public.conceptk (id, name) VALUES (271, 'canis lupus tundrarum');
INSERT INTO public.conceptk (id, name) VALUES (272, 'red wolf');
INSERT INTO public.conceptk (id, name) VALUES (272, 'maned wolf');
INSERT INTO public.conceptk (id, name) VALUES (272, 'canis rufus');
INSERT INTO public.conceptk (id, name) VALUES (272, 'canis niger');
INSERT INTO public.conceptk (id, name) VALUES (273, 'coyote');
INSERT INTO public.conceptk (id, name) VALUES (273, 'prairie wolf');
INSERT INTO public.conceptk (id, name) VALUES (273, 'brush wolf');
INSERT INTO public.conceptk (id, name) VALUES (273, 'canis latrans');
INSERT INTO public.conceptk (id, name) VALUES (274, 'dingo');
INSERT INTO public.conceptk (id, name) VALUES (274, 'warrigal');
INSERT INTO public.conceptk (id, name) VALUES (274, 'warragal');
INSERT INTO public.conceptk (id, name) VALUES (274, 'canis dingo');
INSERT INTO public.conceptk (id, name) VALUES (275, 'dhole');
INSERT INTO public.conceptk (id, name) VALUES (275, 'cuon alpinus');
INSERT INTO public.conceptk (id, name) VALUES (276, 'african hunting dog');
INSERT INTO public.conceptk (id, name) VALUES (276, 'hyena dog');
INSERT INTO public.conceptk (id, name) VALUES (276, 'cape hunting dog');
INSERT INTO public.conceptk (id, name) VALUES (276, 'lycaon pictus');
INSERT INTO public.conceptk (id, name) VALUES (277, 'hyena');
INSERT INTO public.conceptk (id, name) VALUES (277, 'hyaena');
INSERT INTO public.conceptk (id, name) VALUES (278, 'red fox');
INSERT INTO public.conceptk (id, name) VALUES (278, 'vulpes vulpes');
INSERT INTO public.conceptk (id, name) VALUES (279, 'kit fox');
INSERT INTO public.conceptk (id, name) VALUES (279, 'vulpes macrotis');
INSERT INTO public.conceptk (id, name) VALUES (280, 'arctic fox');
INSERT INTO public.conceptk (id, name) VALUES (280, 'white fox');
INSERT INTO public.conceptk (id, name) VALUES (280, 'alopex lagopus');
INSERT INTO public.conceptk (id, name) VALUES (281, 'grey fox');
INSERT INTO public.conceptk (id, name) VALUES (281, 'gray fox');
INSERT INTO public.conceptk (id, name) VALUES (281, 'urocyon cinereoargenteus');
INSERT INTO public.conceptk (id, name) VALUES (282, 'tabby');
INSERT INTO public.conceptk (id, name) VALUES (282, 'tabby cat');
INSERT INTO public.conceptk (id, name) VALUES (283, 'tiger cat');
INSERT INTO public.conceptk (id, name) VALUES (284, 'persian cat');
INSERT INTO public.conceptk (id, name) VALUES (285, 'siamese cat');
INSERT INTO public.conceptk (id, name) VALUES (285, 'siamese');
INSERT INTO public.conceptk (id, name) VALUES (286, 'egyptian cat');
INSERT INTO public.conceptk (id, name) VALUES (287, 'cougar');
INSERT INTO public.conceptk (id, name) VALUES (287, 'puma');
INSERT INTO public.conceptk (id, name) VALUES (287, 'mountain lion');
INSERT INTO public.conceptk (id, name) VALUES (287, 'painter');
INSERT INTO public.conceptk (id, name) VALUES (287, 'felis concolor');
INSERT INTO public.conceptk (id, name) VALUES (288, 'lynx');
INSERT INTO public.conceptk (id, name) VALUES (288, 'catamount');
INSERT INTO public.conceptk (id, name) VALUES (289, 'leopard');
INSERT INTO public.conceptk (id, name) VALUES (289, 'panthera pardus');
INSERT INTO public.conceptk (id, name) VALUES (290, 'snow leopard');
INSERT INTO public.conceptk (id, name) VALUES (290, 'ounce');
INSERT INTO public.conceptk (id, name) VALUES (290, 'panthera uncia');
INSERT INTO public.conceptk (id, name) VALUES (291, 'jaguar');
INSERT INTO public.conceptk (id, name) VALUES (291, 'panther');
INSERT INTO public.conceptk (id, name) VALUES (291, 'panthera onca');
INSERT INTO public.conceptk (id, name) VALUES (291, 'felis onca');
INSERT INTO public.conceptk (id, name) VALUES (292, 'lion');
INSERT INTO public.conceptk (id, name) VALUES (292, 'king of beasts');
INSERT INTO public.conceptk (id, name) VALUES (292, 'panthera leo');
INSERT INTO public.conceptk (id, name) VALUES (293, 'tiger');
INSERT INTO public.conceptk (id, name) VALUES (293, 'panthera tigris');
INSERT INTO public.conceptk (id, name) VALUES (294, 'cheetah');
INSERT INTO public.conceptk (id, name) VALUES (294, 'chetah');
INSERT INTO public.conceptk (id, name) VALUES (294, 'acinonyx jubatus');
INSERT INTO public.conceptk (id, name) VALUES (295, 'brown bear');
INSERT INTO public.conceptk (id, name) VALUES (295, 'bruin');
INSERT INTO public.conceptk (id, name) VALUES (295, 'ursus arctos');
INSERT INTO public.conceptk (id, name) VALUES (296, 'american black bear');
INSERT INTO public.conceptk (id, name) VALUES (296, 'black bear');
INSERT INTO public.conceptk (id, name) VALUES (296, 'ursus americanus');
INSERT INTO public.conceptk (id, name) VALUES (296, 'euarctos americanus');
INSERT INTO public.conceptk (id, name) VALUES (297, 'ice bear');
INSERT INTO public.conceptk (id, name) VALUES (297, 'polar bear');
INSERT INTO public.conceptk (id, name) VALUES (297, 'ursus maritimus');
INSERT INTO public.conceptk (id, name) VALUES (297, 'thalarctos maritimus');
INSERT INTO public.conceptk (id, name) VALUES (298, 'sloth bear');
INSERT INTO public.conceptk (id, name) VALUES (298, 'melursus ursinus');
INSERT INTO public.conceptk (id, name) VALUES (298, 'ursus ursinus');
INSERT INTO public.conceptk (id, name) VALUES (299, 'mongoose');
INSERT INTO public.conceptk (id, name) VALUES (300, 'meerkat');
INSERT INTO public.conceptk (id, name) VALUES (300, 'mierkat');
INSERT INTO public.conceptk (id, name) VALUES (301, 'tiger beetle');
INSERT INTO public.conceptk (id, name) VALUES (302, 'ladybug');
INSERT INTO public.conceptk (id, name) VALUES (302, 'ladybeetle');
INSERT INTO public.conceptk (id, name) VALUES (302, 'lady beetle');
INSERT INTO public.conceptk (id, name) VALUES (302, 'ladybird');
INSERT INTO public.conceptk (id, name) VALUES (302, 'ladybird beetle');
INSERT INTO public.conceptk (id, name) VALUES (303, 'ground beetle');
INSERT INTO public.conceptk (id, name) VALUES (303, 'carabid beetle');
INSERT INTO public.conceptk (id, name) VALUES (304, 'long-horned beetle');
INSERT INTO public.conceptk (id, name) VALUES (304, 'longicorn');
INSERT INTO public.conceptk (id, name) VALUES (304, 'longicorn beetle');
INSERT INTO public.conceptk (id, name) VALUES (305, 'leaf beetle');
INSERT INTO public.conceptk (id, name) VALUES (305, 'chrysomelid');
INSERT INTO public.conceptk (id, name) VALUES (306, 'dung beetle');
INSERT INTO public.conceptk (id, name) VALUES (307, 'rhinoceros beetle');
INSERT INTO public.conceptk (id, name) VALUES (308, 'weevil');
INSERT INTO public.conceptk (id, name) VALUES (309, 'fly');
INSERT INTO public.conceptk (id, name) VALUES (310, 'bee');
INSERT INTO public.conceptk (id, name) VALUES (311, 'ant');
INSERT INTO public.conceptk (id, name) VALUES (311, 'emmet');
INSERT INTO public.conceptk (id, name) VALUES (311, 'pismire');
INSERT INTO public.conceptk (id, name) VALUES (312, 'grasshopper');
INSERT INTO public.conceptk (id, name) VALUES (312, 'hopper');
INSERT INTO public.conceptk (id, name) VALUES (313, 'cricket');
INSERT INTO public.conceptk (id, name) VALUES (314, 'walking stick');
INSERT INTO public.conceptk (id, name) VALUES (314, 'walkingstick');
INSERT INTO public.conceptk (id, name) VALUES (314, 'stick insect');
INSERT INTO public.conceptk (id, name) VALUES (315, 'cockroach');
INSERT INTO public.conceptk (id, name) VALUES (315, 'roach');
INSERT INTO public.conceptk (id, name) VALUES (316, 'mantis');
INSERT INTO public.conceptk (id, name) VALUES (316, 'mantid');
INSERT INTO public.conceptk (id, name) VALUES (317, 'cicada');
INSERT INTO public.conceptk (id, name) VALUES (317, 'cicala');
INSERT INTO public.conceptk (id, name) VALUES (318, 'leafhopper');
INSERT INTO public.conceptk (id, name) VALUES (319, 'lacewing');
INSERT INTO public.conceptk (id, name) VALUES (319, 'lacewing fly');
INSERT INTO public.conceptk (id, name) VALUES (320, 'dragonfly');
INSERT INTO public.conceptk (id, name) VALUES (320, 'darning needle');
INSERT INTO public.conceptk (id, name) VALUES (320, 'devil''s darning needle');
INSERT INTO public.conceptk (id, name) VALUES (320, 'sewing needle');
INSERT INTO public.conceptk (id, name) VALUES (320, 'snake feeder');
INSERT INTO public.conceptk (id, name) VALUES (320, 'snake doctor');
INSERT INTO public.conceptk (id, name) VALUES (320, 'mosquito hawk');
INSERT INTO public.conceptk (id, name) VALUES (320, 'skeeter hawk');
INSERT INTO public.conceptk (id, name) VALUES (321, 'damselfly');
INSERT INTO public.conceptk (id, name) VALUES (322, 'admiral');
INSERT INTO public.conceptk (id, name) VALUES (323, 'ringlet');
INSERT INTO public.conceptk (id, name) VALUES (323, 'ringlet butterfly');
INSERT INTO public.conceptk (id, name) VALUES (324, 'monarch');
INSERT INTO public.conceptk (id, name) VALUES (324, 'monarch butterfly');
INSERT INTO public.conceptk (id, name) VALUES (324, 'milkweed butterfly');
INSERT INTO public.conceptk (id, name) VALUES (324, 'danaus plexippus');
INSERT INTO public.conceptk (id, name) VALUES (325, 'cabbage butterfly');
INSERT INTO public.conceptk (id, name) VALUES (326, 'sulphur butterfly');
INSERT INTO public.conceptk (id, name) VALUES (326, 'sulfur butterfly');
INSERT INTO public.conceptk (id, name) VALUES (327, 'lycaenid');
INSERT INTO public.conceptk (id, name) VALUES (327, 'lycaenid butterfly');
INSERT INTO public.conceptk (id, name) VALUES (328, 'starfish');
INSERT INTO public.conceptk (id, name) VALUES (328, 'sea star');
INSERT INTO public.conceptk (id, name) VALUES (329, 'sea urchin');
INSERT INTO public.conceptk (id, name) VALUES (330, 'sea cucumber');
INSERT INTO public.conceptk (id, name) VALUES (330, 'holothurian');
INSERT INTO public.conceptk (id, name) VALUES (331, 'wood rabbit');
INSERT INTO public.conceptk (id, name) VALUES (331, 'cottontail');
INSERT INTO public.conceptk (id, name) VALUES (331, 'cottontail rabbit');
INSERT INTO public.conceptk (id, name) VALUES (332, 'hare');
INSERT INTO public.conceptk (id, name) VALUES (333, 'angora');
INSERT INTO public.conceptk (id, name) VALUES (333, 'angora rabbit');
INSERT INTO public.conceptk (id, name) VALUES (334, 'hamster');
INSERT INTO public.conceptk (id, name) VALUES (335, 'porcupine');
INSERT INTO public.conceptk (id, name) VALUES (335, 'hedgehog');
INSERT INTO public.conceptk (id, name) VALUES (336, 'fox squirrel');
INSERT INTO public.conceptk (id, name) VALUES (336, 'eastern fox squirrel');
INSERT INTO public.conceptk (id, name) VALUES (336, 'sciurus niger');
INSERT INTO public.conceptk (id, name) VALUES (337, 'marmot');
INSERT INTO public.conceptk (id, name) VALUES (338, 'beaver');
INSERT INTO public.conceptk (id, name) VALUES (339, 'guinea pig');
INSERT INTO public.conceptk (id, name) VALUES (339, 'cavia cobaya');
INSERT INTO public.conceptk (id, name) VALUES (340, 'sorrel');
INSERT INTO public.conceptk (id, name) VALUES (341, 'zebra');
INSERT INTO public.conceptk (id, name) VALUES (342, 'hog');
INSERT INTO public.conceptk (id, name) VALUES (342, 'pig');
INSERT INTO public.conceptk (id, name) VALUES (342, 'grunter');
INSERT INTO public.conceptk (id, name) VALUES (342, 'squealer');
INSERT INTO public.conceptk (id, name) VALUES (343, 'wild boar');
INSERT INTO public.conceptk (id, name) VALUES (343, 'boar');
INSERT INTO public.conceptk (id, name) VALUES (343, 'sus scrofa');
INSERT INTO public.conceptk (id, name) VALUES (344, 'warthog');
INSERT INTO public.conceptk (id, name) VALUES (345, 'hippopotamus');
INSERT INTO public.conceptk (id, name) VALUES (345, 'hippo');
INSERT INTO public.conceptk (id, name) VALUES (345, 'river horse');
INSERT INTO public.conceptk (id, name) VALUES (345, 'hippopotamus amphibius');
INSERT INTO public.conceptk (id, name) VALUES (346, 'ox');
INSERT INTO public.conceptk (id, name) VALUES (347, 'water buffalo');
INSERT INTO public.conceptk (id, name) VALUES (347, 'water ox');
INSERT INTO public.conceptk (id, name) VALUES (347, 'asiatic buffalo');
INSERT INTO public.conceptk (id, name) VALUES (347, 'bubalus bubalis');
INSERT INTO public.conceptk (id, name) VALUES (348, 'bison');
INSERT INTO public.conceptk (id, name) VALUES (349, 'ram');
INSERT INTO public.conceptk (id, name) VALUES (349, 'tup');
INSERT INTO public.conceptk (id, name) VALUES (350, 'bighorn');
INSERT INTO public.conceptk (id, name) VALUES (350, 'bighorn sheep');
INSERT INTO public.conceptk (id, name) VALUES (350, 'cimarron');
INSERT INTO public.conceptk (id, name) VALUES (350, 'rocky mountain bighorn');
INSERT INTO public.conceptk (id, name) VALUES (350, 'rocky mountain sheep');
INSERT INTO public.conceptk (id, name) VALUES (350, 'ovis canadensis');
INSERT INTO public.conceptk (id, name) VALUES (351, 'ibex');
INSERT INTO public.conceptk (id, name) VALUES (351, 'capra ibex');
INSERT INTO public.conceptk (id, name) VALUES (352, 'hartebeest');
INSERT INTO public.conceptk (id, name) VALUES (353, 'impala');
INSERT INTO public.conceptk (id, name) VALUES (353, 'aepyceros melampus');
INSERT INTO public.conceptk (id, name) VALUES (354, 'gazelle');
INSERT INTO public.conceptk (id, name) VALUES (355, 'arabian camel');
INSERT INTO public.conceptk (id, name) VALUES (355, 'dromedary');
INSERT INTO public.conceptk (id, name) VALUES (355, 'camelus dromedarius');
INSERT INTO public.conceptk (id, name) VALUES (356, 'llama');
INSERT INTO public.conceptk (id, name) VALUES (357, 'weasel');
INSERT INTO public.conceptk (id, name) VALUES (358, 'mink');
INSERT INTO public.conceptk (id, name) VALUES (359, 'polecat');
INSERT INTO public.conceptk (id, name) VALUES (359, 'fitch');
INSERT INTO public.conceptk (id, name) VALUES (359, 'foulmart');
INSERT INTO public.conceptk (id, name) VALUES (359, 'foumart');
INSERT INTO public.conceptk (id, name) VALUES (359, 'mustela putorius');
INSERT INTO public.conceptk (id, name) VALUES (360, 'black-footed ferret');
INSERT INTO public.conceptk (id, name) VALUES (360, 'ferret');
INSERT INTO public.conceptk (id, name) VALUES (360, 'mustela nigripes');
INSERT INTO public.conceptk (id, name) VALUES (361, 'otter');
INSERT INTO public.conceptk (id, name) VALUES (362, 'skunk');
INSERT INTO public.conceptk (id, name) VALUES (362, 'wood pussy');
INSERT INTO public.conceptk (id, name) VALUES (363, 'badger');
INSERT INTO public.conceptk (id, name) VALUES (364, 'armadillo');
INSERT INTO public.conceptk (id, name) VALUES (365, 'three-toed sloth');
INSERT INTO public.conceptk (id, name) VALUES (365, 'ai');
INSERT INTO public.conceptk (id, name) VALUES (365, 'bradypus tridactylus');
INSERT INTO public.conceptk (id, name) VALUES (366, 'orangutan');
INSERT INTO public.conceptk (id, name) VALUES (366, 'orang');
INSERT INTO public.conceptk (id, name) VALUES (366, 'orangutang');
INSERT INTO public.conceptk (id, name) VALUES (366, 'pongo pygmaeus');
INSERT INTO public.conceptk (id, name) VALUES (367, 'gorilla');
INSERT INTO public.conceptk (id, name) VALUES (367, 'gorilla gorilla');
INSERT INTO public.conceptk (id, name) VALUES (368, 'chimpanzee');
INSERT INTO public.conceptk (id, name) VALUES (368, 'chimp');
INSERT INTO public.conceptk (id, name) VALUES (368, 'pan troglodytes');
INSERT INTO public.conceptk (id, name) VALUES (369, 'gibbon');
INSERT INTO public.conceptk (id, name) VALUES (369, 'hylobates lar');
INSERT INTO public.conceptk (id, name) VALUES (370, 'siamang');
INSERT INTO public.conceptk (id, name) VALUES (370, 'hylobates syndactylus');
INSERT INTO public.conceptk (id, name) VALUES (370, 'symphalangus syndactylus');
INSERT INTO public.conceptk (id, name) VALUES (371, 'guenon');
INSERT INTO public.conceptk (id, name) VALUES (371, 'guenon monkey');
INSERT INTO public.conceptk (id, name) VALUES (372, 'patas');
INSERT INTO public.conceptk (id, name) VALUES (372, 'hussar monkey');
INSERT INTO public.conceptk (id, name) VALUES (372, 'erythrocebus patas');
INSERT INTO public.conceptk (id, name) VALUES (373, 'baboon');
INSERT INTO public.conceptk (id, name) VALUES (374, 'macaque');
INSERT INTO public.conceptk (id, name) VALUES (375, 'langur');
INSERT INTO public.conceptk (id, name) VALUES (376, 'colobus');
INSERT INTO public.conceptk (id, name) VALUES (376, 'colobus monkey');
INSERT INTO public.conceptk (id, name) VALUES (377, 'proboscis monkey');
INSERT INTO public.conceptk (id, name) VALUES (377, 'nasalis larvatus');
INSERT INTO public.conceptk (id, name) VALUES (378, 'marmoset');
INSERT INTO public.conceptk (id, name) VALUES (379, 'capuchin');
INSERT INTO public.conceptk (id, name) VALUES (379, 'ringtail');
INSERT INTO public.conceptk (id, name) VALUES (379, 'cebus capucinus');
INSERT INTO public.conceptk (id, name) VALUES (380, 'howler monkey');
INSERT INTO public.conceptk (id, name) VALUES (380, 'howler');
INSERT INTO public.conceptk (id, name) VALUES (381, 'titi');
INSERT INTO public.conceptk (id, name) VALUES (381, 'titi monkey');
INSERT INTO public.conceptk (id, name) VALUES (382, 'spider monkey');
INSERT INTO public.conceptk (id, name) VALUES (382, 'ateles geoffroyi');
INSERT INTO public.conceptk (id, name) VALUES (383, 'squirrel monkey');
INSERT INTO public.conceptk (id, name) VALUES (383, 'saimiri sciureus');
INSERT INTO public.conceptk (id, name) VALUES (384, 'madagascar cat');
INSERT INTO public.conceptk (id, name) VALUES (384, 'ring-tailed lemur');
INSERT INTO public.conceptk (id, name) VALUES (384, 'lemur catta');
INSERT INTO public.conceptk (id, name) VALUES (385, 'indri');
INSERT INTO public.conceptk (id, name) VALUES (385, 'indris');
INSERT INTO public.conceptk (id, name) VALUES (385, 'indri indri');
INSERT INTO public.conceptk (id, name) VALUES (385, 'indri brevicaudatus');
INSERT INTO public.conceptk (id, name) VALUES (386, 'indian elephant');
INSERT INTO public.conceptk (id, name) VALUES (386, 'elephas maximus');
INSERT INTO public.conceptk (id, name) VALUES (387, 'african elephant');
INSERT INTO public.conceptk (id, name) VALUES (387, 'loxodonta africana');
INSERT INTO public.conceptk (id, name) VALUES (388, 'lesser panda');
INSERT INTO public.conceptk (id, name) VALUES (388, 'red panda');
INSERT INTO public.conceptk (id, name) VALUES (388, 'bear cat');
INSERT INTO public.conceptk (id, name) VALUES (388, 'cat bear');
INSERT INTO public.conceptk (id, name) VALUES (388, 'ailurus fulgens');
INSERT INTO public.conceptk (id, name) VALUES (389, 'giant panda');
INSERT INTO public.conceptk (id, name) VALUES (389, 'panda');
INSERT INTO public.conceptk (id, name) VALUES (389, 'panda bear');
INSERT INTO public.conceptk (id, name) VALUES (389, 'coon bear');
INSERT INTO public.conceptk (id, name) VALUES (389, 'ailuropoda melanoleuca');
INSERT INTO public.conceptk (id, name) VALUES (390, 'barracouta');
INSERT INTO public.conceptk (id, name) VALUES (390, 'snoek');
INSERT INTO public.conceptk (id, name) VALUES (391, 'eel');
INSERT INTO public.conceptk (id, name) VALUES (392, 'coho');
INSERT INTO public.conceptk (id, name) VALUES (392, 'cohoe');
INSERT INTO public.conceptk (id, name) VALUES (392, 'coho salmon');
INSERT INTO public.conceptk (id, name) VALUES (392, 'blue jack');
INSERT INTO public.conceptk (id, name) VALUES (392, 'silver salmon');
INSERT INTO public.conceptk (id, name) VALUES (392, 'oncorhynchus kisutch');
INSERT INTO public.conceptk (id, name) VALUES (393, 'rock beauty');
INSERT INTO public.conceptk (id, name) VALUES (393, 'holocanthus tricolor');
INSERT INTO public.conceptk (id, name) VALUES (394, 'anemone fish');
INSERT INTO public.conceptk (id, name) VALUES (395, 'sturgeon');
INSERT INTO public.conceptk (id, name) VALUES (396, 'gar');
INSERT INTO public.conceptk (id, name) VALUES (396, 'garfish');
INSERT INTO public.conceptk (id, name) VALUES (396, 'garpike');
INSERT INTO public.conceptk (id, name) VALUES (396, 'billfish');
INSERT INTO public.conceptk (id, name) VALUES (396, 'lepisosteus osseus');
INSERT INTO public.conceptk (id, name) VALUES (397, 'lionfish');
INSERT INTO public.conceptk (id, name) VALUES (398, 'puffer');
INSERT INTO public.conceptk (id, name) VALUES (398, 'pufferfish');
INSERT INTO public.conceptk (id, name) VALUES (398, 'blowfish');
INSERT INTO public.conceptk (id, name) VALUES (398, 'globefish');
INSERT INTO public.conceptk (id, name) VALUES (399, 'abacus');
INSERT INTO public.conceptk (id, name) VALUES (400, 'abaya');
INSERT INTO public.conceptk (id, name) VALUES (401, 'academic gown');
INSERT INTO public.conceptk (id, name) VALUES (401, 'academic robe');
INSERT INTO public.conceptk (id, name) VALUES (401, 'judge''s robe');
INSERT INTO public.conceptk (id, name) VALUES (402, 'accordion');
INSERT INTO public.conceptk (id, name) VALUES (402, 'piano accordion');
INSERT INTO public.conceptk (id, name) VALUES (402, 'squeeze box');
INSERT INTO public.conceptk (id, name) VALUES (403, 'acoustic guitar');
INSERT INTO public.conceptk (id, name) VALUES (404, 'aircraft carrier');
INSERT INTO public.conceptk (id, name) VALUES (404, 'carrier');
INSERT INTO public.conceptk (id, name) VALUES (404, 'flattop');
INSERT INTO public.conceptk (id, name) VALUES (404, 'attack aircraft carrier');
INSERT INTO public.conceptk (id, name) VALUES (405, 'airliner');
INSERT INTO public.conceptk (id, name) VALUES (406, 'airship');
INSERT INTO public.conceptk (id, name) VALUES (406, 'dirigible');
INSERT INTO public.conceptk (id, name) VALUES (407, 'altar');
INSERT INTO public.conceptk (id, name) VALUES (408, 'ambulance');
INSERT INTO public.conceptk (id, name) VALUES (409, 'amphibian');
INSERT INTO public.conceptk (id, name) VALUES (409, 'amphibious vehicle');
INSERT INTO public.conceptk (id, name) VALUES (410, 'analog clock');
INSERT INTO public.conceptk (id, name) VALUES (411, 'apiary');
INSERT INTO public.conceptk (id, name) VALUES (411, 'bee house');
INSERT INTO public.conceptk (id, name) VALUES (412, 'apron');
INSERT INTO public.conceptk (id, name) VALUES (413, 'ashcan');
INSERT INTO public.conceptk (id, name) VALUES (413, 'trash can');
INSERT INTO public.conceptk (id, name) VALUES (413, 'garbage can');
INSERT INTO public.conceptk (id, name) VALUES (413, 'wastebin');
INSERT INTO public.conceptk (id, name) VALUES (413, 'ash bin');
INSERT INTO public.conceptk (id, name) VALUES (413, 'ash-bin');
INSERT INTO public.conceptk (id, name) VALUES (413, 'ashbin');
INSERT INTO public.conceptk (id, name) VALUES (413, 'dustbin');
INSERT INTO public.conceptk (id, name) VALUES (413, 'trash barrel');
INSERT INTO public.conceptk (id, name) VALUES (413, 'trash bin');
INSERT INTO public.conceptk (id, name) VALUES (414, 'assault rifle');
INSERT INTO public.conceptk (id, name) VALUES (414, 'assault gun');
INSERT INTO public.conceptk (id, name) VALUES (415, 'backpack');
INSERT INTO public.conceptk (id, name) VALUES (415, 'back pack');
INSERT INTO public.conceptk (id, name) VALUES (415, 'knapsack');
INSERT INTO public.conceptk (id, name) VALUES (415, 'packsack');
INSERT INTO public.conceptk (id, name) VALUES (415, 'rucksack');
INSERT INTO public.conceptk (id, name) VALUES (415, 'haversack');
INSERT INTO public.conceptk (id, name) VALUES (416, 'bakery');
INSERT INTO public.conceptk (id, name) VALUES (416, 'bakeshop');
INSERT INTO public.conceptk (id, name) VALUES (416, 'bakehouse');
INSERT INTO public.conceptk (id, name) VALUES (417, 'balance beam');
INSERT INTO public.conceptk (id, name) VALUES (417, 'beam');
INSERT INTO public.conceptk (id, name) VALUES (418, 'balloon');
INSERT INTO public.conceptk (id, name) VALUES (419, 'ballpoint');
INSERT INTO public.conceptk (id, name) VALUES (419, 'ballpoint pen');
INSERT INTO public.conceptk (id, name) VALUES (419, 'ballpen');
INSERT INTO public.conceptk (id, name) VALUES (419, 'biro');
INSERT INTO public.conceptk (id, name) VALUES (420, 'band aid');
INSERT INTO public.conceptk (id, name) VALUES (421, 'banjo');
INSERT INTO public.conceptk (id, name) VALUES (422, 'bannister');
INSERT INTO public.conceptk (id, name) VALUES (422, 'banister');
INSERT INTO public.conceptk (id, name) VALUES (422, 'balustrade');
INSERT INTO public.conceptk (id, name) VALUES (422, 'balusters');
INSERT INTO public.conceptk (id, name) VALUES (422, 'handrail');
INSERT INTO public.conceptk (id, name) VALUES (423, 'barbell');
INSERT INTO public.conceptk (id, name) VALUES (424, 'barber chair');
INSERT INTO public.conceptk (id, name) VALUES (425, 'barbershop');
INSERT INTO public.conceptk (id, name) VALUES (426, 'barn');
INSERT INTO public.conceptk (id, name) VALUES (427, 'barometer');
INSERT INTO public.conceptk (id, name) VALUES (428, 'barrel');
INSERT INTO public.conceptk (id, name) VALUES (428, 'cask');
INSERT INTO public.conceptk (id, name) VALUES (429, 'barrow');
INSERT INTO public.conceptk (id, name) VALUES (429, 'garden cart');
INSERT INTO public.conceptk (id, name) VALUES (429, 'lawn cart');
INSERT INTO public.conceptk (id, name) VALUES (429, 'wheelbarrow');
INSERT INTO public.conceptk (id, name) VALUES (430, 'baseball');
INSERT INTO public.conceptk (id, name) VALUES (431, 'basketball');
INSERT INTO public.conceptk (id, name) VALUES (432, 'bassinet');
INSERT INTO public.conceptk (id, name) VALUES (433, 'bassoon');
INSERT INTO public.conceptk (id, name) VALUES (434, 'bathing cap');
INSERT INTO public.conceptk (id, name) VALUES (434, 'swimming cap');
INSERT INTO public.conceptk (id, name) VALUES (435, 'bath towel');
INSERT INTO public.conceptk (id, name) VALUES (436, 'bathtub');
INSERT INTO public.conceptk (id, name) VALUES (436, 'bathing tub');
INSERT INTO public.conceptk (id, name) VALUES (436, 'bath');
INSERT INTO public.conceptk (id, name) VALUES (437, 'beach wagon');
INSERT INTO public.conceptk (id, name) VALUES (437, 'station wagon');
INSERT INTO public.conceptk (id, name) VALUES (437, 'wagon');
INSERT INTO public.conceptk (id, name) VALUES (437, 'estate car');
INSERT INTO public.conceptk (id, name) VALUES (437, 'beach waggon');
INSERT INTO public.conceptk (id, name) VALUES (437, 'station waggon');
INSERT INTO public.conceptk (id, name) VALUES (437, 'waggon');
INSERT INTO public.conceptk (id, name) VALUES (438, 'beacon');
INSERT INTO public.conceptk (id, name) VALUES (438, 'lighthouse');
INSERT INTO public.conceptk (id, name) VALUES (438, 'beacon light');
INSERT INTO public.conceptk (id, name) VALUES (438, 'pharos');
INSERT INTO public.conceptk (id, name) VALUES (439, 'beaker');
INSERT INTO public.conceptk (id, name) VALUES (440, 'bearskin');
INSERT INTO public.conceptk (id, name) VALUES (440, 'busby');
INSERT INTO public.conceptk (id, name) VALUES (440, 'shako');
INSERT INTO public.conceptk (id, name) VALUES (441, 'beer bottle');
INSERT INTO public.conceptk (id, name) VALUES (442, 'beer glass');
INSERT INTO public.conceptk (id, name) VALUES (443, 'bell cote');
INSERT INTO public.conceptk (id, name) VALUES (443, 'bell cot');
INSERT INTO public.conceptk (id, name) VALUES (444, 'bib');
INSERT INTO public.conceptk (id, name) VALUES (445, 'bicycle-built-for-two');
INSERT INTO public.conceptk (id, name) VALUES (445, 'tandem bicycle');
INSERT INTO public.conceptk (id, name) VALUES (445, 'tandem');
INSERT INTO public.conceptk (id, name) VALUES (446, 'bikini');
INSERT INTO public.conceptk (id, name) VALUES (446, 'two-piece');
INSERT INTO public.conceptk (id, name) VALUES (447, 'binder');
INSERT INTO public.conceptk (id, name) VALUES (447, 'ring-binder');
INSERT INTO public.conceptk (id, name) VALUES (448, 'binoculars');
INSERT INTO public.conceptk (id, name) VALUES (448, 'field glasses');
INSERT INTO public.conceptk (id, name) VALUES (448, 'opera glasses');
INSERT INTO public.conceptk (id, name) VALUES (449, 'birdhouse');
INSERT INTO public.conceptk (id, name) VALUES (450, 'boathouse');
INSERT INTO public.conceptk (id, name) VALUES (451, 'bobsled');
INSERT INTO public.conceptk (id, name) VALUES (451, 'bobsleigh');
INSERT INTO public.conceptk (id, name) VALUES (451, 'bob');
INSERT INTO public.conceptk (id, name) VALUES (452, 'bolo tie');
INSERT INTO public.conceptk (id, name) VALUES (452, 'bolo');
INSERT INTO public.conceptk (id, name) VALUES (452, 'bola tie');
INSERT INTO public.conceptk (id, name) VALUES (452, 'bola');
INSERT INTO public.conceptk (id, name) VALUES (453, 'bonnet');
INSERT INTO public.conceptk (id, name) VALUES (453, 'poke bonnet');
INSERT INTO public.conceptk (id, name) VALUES (454, 'bookcase');
INSERT INTO public.conceptk (id, name) VALUES (455, 'bookshop');
INSERT INTO public.conceptk (id, name) VALUES (455, 'bookstore');
INSERT INTO public.conceptk (id, name) VALUES (455, 'bookstall');
INSERT INTO public.conceptk (id, name) VALUES (456, 'bottlecap');
INSERT INTO public.conceptk (id, name) VALUES (457, 'bow');
INSERT INTO public.conceptk (id, name) VALUES (458, 'bow tie');
INSERT INTO public.conceptk (id, name) VALUES (458, 'bow-tie');
INSERT INTO public.conceptk (id, name) VALUES (458, 'bowtie');
INSERT INTO public.conceptk (id, name) VALUES (459, 'brass');
INSERT INTO public.conceptk (id, name) VALUES (459, 'memorial tablet');
INSERT INTO public.conceptk (id, name) VALUES (459, 'plaque');
INSERT INTO public.conceptk (id, name) VALUES (460, 'brassiere');
INSERT INTO public.conceptk (id, name) VALUES (460, 'bra');
INSERT INTO public.conceptk (id, name) VALUES (460, 'bandeau');
INSERT INTO public.conceptk (id, name) VALUES (461, 'breakwater');
INSERT INTO public.conceptk (id, name) VALUES (461, 'groin');
INSERT INTO public.conceptk (id, name) VALUES (461, 'groyne');
INSERT INTO public.conceptk (id, name) VALUES (461, 'mole');
INSERT INTO public.conceptk (id, name) VALUES (461, 'bulwark');
INSERT INTO public.conceptk (id, name) VALUES (461, 'seawall');
INSERT INTO public.conceptk (id, name) VALUES (461, 'jetty');
INSERT INTO public.conceptk (id, name) VALUES (462, 'breastplate');
INSERT INTO public.conceptk (id, name) VALUES (462, 'aegis');
INSERT INTO public.conceptk (id, name) VALUES (462, 'egis');
INSERT INTO public.conceptk (id, name) VALUES (463, 'broom');
INSERT INTO public.conceptk (id, name) VALUES (464, 'bucket');
INSERT INTO public.conceptk (id, name) VALUES (464, 'pail');
INSERT INTO public.conceptk (id, name) VALUES (465, 'buckle');
INSERT INTO public.conceptk (id, name) VALUES (466, 'bulletproof vest');
INSERT INTO public.conceptk (id, name) VALUES (467, 'bullet train');
INSERT INTO public.conceptk (id, name) VALUES (467, 'bullet');
INSERT INTO public.conceptk (id, name) VALUES (468, 'butcher shop');
INSERT INTO public.conceptk (id, name) VALUES (468, 'meat market');
INSERT INTO public.conceptk (id, name) VALUES (469, 'cab');
INSERT INTO public.conceptk (id, name) VALUES (469, 'hack');
INSERT INTO public.conceptk (id, name) VALUES (469, 'taxi');
INSERT INTO public.conceptk (id, name) VALUES (469, 'taxicab');
INSERT INTO public.conceptk (id, name) VALUES (470, 'caldron');
INSERT INTO public.conceptk (id, name) VALUES (470, 'cauldron');
INSERT INTO public.conceptk (id, name) VALUES (471, 'candle');
INSERT INTO public.conceptk (id, name) VALUES (471, 'taper');
INSERT INTO public.conceptk (id, name) VALUES (471, 'wax light');
INSERT INTO public.conceptk (id, name) VALUES (472, 'cannon');
INSERT INTO public.conceptk (id, name) VALUES (473, 'canoe');
INSERT INTO public.conceptk (id, name) VALUES (474, 'can opener');
INSERT INTO public.conceptk (id, name) VALUES (474, 'tin opener');
INSERT INTO public.conceptk (id, name) VALUES (475, 'cardigan');
INSERT INTO public.conceptk (id, name) VALUES (476, 'car mirror');
INSERT INTO public.conceptk (id, name) VALUES (477, 'carousel');
INSERT INTO public.conceptk (id, name) VALUES (477, 'carrousel');
INSERT INTO public.conceptk (id, name) VALUES (477, 'merry-go-round');
INSERT INTO public.conceptk (id, name) VALUES (477, 'roundabout');
INSERT INTO public.conceptk (id, name) VALUES (477, 'whirligig');
INSERT INTO public.conceptk (id, name) VALUES (478, 'carpenter''s kit');
INSERT INTO public.conceptk (id, name) VALUES (478, 'tool kit');
INSERT INTO public.conceptk (id, name) VALUES (479, 'carton');
INSERT INTO public.conceptk (id, name) VALUES (480, 'car wheel');
INSERT INTO public.conceptk (id, name) VALUES (481, 'cash machine');
INSERT INTO public.conceptk (id, name) VALUES (481, 'cash dispenser');
INSERT INTO public.conceptk (id, name) VALUES (481, 'automated teller machine');
INSERT INTO public.conceptk (id, name) VALUES (481, 'automatic teller machine');
INSERT INTO public.conceptk (id, name) VALUES (481, 'automated teller');
INSERT INTO public.conceptk (id, name) VALUES (481, 'automatic teller');
INSERT INTO public.conceptk (id, name) VALUES (481, 'atm');
INSERT INTO public.conceptk (id, name) VALUES (482, 'cassette');
INSERT INTO public.conceptk (id, name) VALUES (483, 'cassette player');
INSERT INTO public.conceptk (id, name) VALUES (484, 'castle');
INSERT INTO public.conceptk (id, name) VALUES (485, 'catamaran');
INSERT INTO public.conceptk (id, name) VALUES (486, 'cd player');
INSERT INTO public.conceptk (id, name) VALUES (487, 'cello');
INSERT INTO public.conceptk (id, name) VALUES (487, 'violoncello');
INSERT INTO public.conceptk (id, name) VALUES (488, 'cellular telephone');
INSERT INTO public.conceptk (id, name) VALUES (488, 'cellular phone');
INSERT INTO public.conceptk (id, name) VALUES (488, 'cellphone');
INSERT INTO public.conceptk (id, name) VALUES (488, 'cell');
INSERT INTO public.conceptk (id, name) VALUES (488, 'mobile phone');
INSERT INTO public.conceptk (id, name) VALUES (489, 'chain');
INSERT INTO public.conceptk (id, name) VALUES (490, 'chainlink fence');
INSERT INTO public.conceptk (id, name) VALUES (491, 'chain mail');
INSERT INTO public.conceptk (id, name) VALUES (491, 'ring mail');
INSERT INTO public.conceptk (id, name) VALUES (491, 'mail');
INSERT INTO public.conceptk (id, name) VALUES (491, 'chain armor');
INSERT INTO public.conceptk (id, name) VALUES (491, 'chain armour');
INSERT INTO public.conceptk (id, name) VALUES (491, 'ring armor');
INSERT INTO public.conceptk (id, name) VALUES (491, 'ring armour');
INSERT INTO public.conceptk (id, name) VALUES (492, 'chain saw');
INSERT INTO public.conceptk (id, name) VALUES (492, 'chainsaw');
INSERT INTO public.conceptk (id, name) VALUES (493, 'chest');
INSERT INTO public.conceptk (id, name) VALUES (494, 'chiffonier');
INSERT INTO public.conceptk (id, name) VALUES (494, 'commode');
INSERT INTO public.conceptk (id, name) VALUES (495, 'chime');
INSERT INTO public.conceptk (id, name) VALUES (495, 'bell');
INSERT INTO public.conceptk (id, name) VALUES (496, 'china cabinet');
INSERT INTO public.conceptk (id, name) VALUES (496, 'china closet');
INSERT INTO public.conceptk (id, name) VALUES (497, 'christmas stocking');
INSERT INTO public.conceptk (id, name) VALUES (498, 'church');
INSERT INTO public.conceptk (id, name) VALUES (498, 'church building');
INSERT INTO public.conceptk (id, name) VALUES (499, 'cinema');
INSERT INTO public.conceptk (id, name) VALUES (499, 'movie theater');
INSERT INTO public.conceptk (id, name) VALUES (499, 'movie theatre');
INSERT INTO public.conceptk (id, name) VALUES (499, 'movie house');
INSERT INTO public.conceptk (id, name) VALUES (499, 'picture palace');
INSERT INTO public.conceptk (id, name) VALUES (500, 'cleaver');
INSERT INTO public.conceptk (id, name) VALUES (500, 'meat cleaver');
INSERT INTO public.conceptk (id, name) VALUES (500, 'chopper');
INSERT INTO public.conceptk (id, name) VALUES (501, 'cliff dwelling');
INSERT INTO public.conceptk (id, name) VALUES (502, 'cloak');
INSERT INTO public.conceptk (id, name) VALUES (503, 'clog');
INSERT INTO public.conceptk (id, name) VALUES (503, 'geta');
INSERT INTO public.conceptk (id, name) VALUES (503, 'patten');
INSERT INTO public.conceptk (id, name) VALUES (503, 'sabot');
INSERT INTO public.conceptk (id, name) VALUES (504, 'cocktail shaker');
INSERT INTO public.conceptk (id, name) VALUES (505, 'coffee mug');
INSERT INTO public.conceptk (id, name) VALUES (506, 'coffeepot');
INSERT INTO public.conceptk (id, name) VALUES (507, 'coil');
INSERT INTO public.conceptk (id, name) VALUES (507, 'spiral');
INSERT INTO public.conceptk (id, name) VALUES (507, 'volute');
INSERT INTO public.conceptk (id, name) VALUES (507, 'whorl');
INSERT INTO public.conceptk (id, name) VALUES (507, 'helix');
INSERT INTO public.conceptk (id, name) VALUES (508, 'combination lock');
INSERT INTO public.conceptk (id, name) VALUES (509, 'computer keyboard');
INSERT INTO public.conceptk (id, name) VALUES (509, 'keypad');
INSERT INTO public.conceptk (id, name) VALUES (510, 'confectionery');
INSERT INTO public.conceptk (id, name) VALUES (510, 'confectionary');
INSERT INTO public.conceptk (id, name) VALUES (510, 'candy store');
INSERT INTO public.conceptk (id, name) VALUES (511, 'container ship');
INSERT INTO public.conceptk (id, name) VALUES (511, 'containership');
INSERT INTO public.conceptk (id, name) VALUES (511, 'container vessel');
INSERT INTO public.conceptk (id, name) VALUES (512, 'convertible');
INSERT INTO public.conceptk (id, name) VALUES (513, 'corkscrew');
INSERT INTO public.conceptk (id, name) VALUES (513, 'bottle screw');
INSERT INTO public.conceptk (id, name) VALUES (514, 'cornet');
INSERT INTO public.conceptk (id, name) VALUES (514, 'horn');
INSERT INTO public.conceptk (id, name) VALUES (514, 'trumpet');
INSERT INTO public.conceptk (id, name) VALUES (514, 'trump');
INSERT INTO public.conceptk (id, name) VALUES (515, 'cowboy boot');
INSERT INTO public.conceptk (id, name) VALUES (516, 'cowboy hat');
INSERT INTO public.conceptk (id, name) VALUES (516, 'ten-gallon hat');
INSERT INTO public.conceptk (id, name) VALUES (517, 'cradle');
INSERT INTO public.conceptk (id, name) VALUES (518, 'crane2');
INSERT INTO public.conceptk (id, name) VALUES (519, 'crash helmet');
INSERT INTO public.conceptk (id, name) VALUES (520, 'crate');
INSERT INTO public.conceptk (id, name) VALUES (521, 'crib');
INSERT INTO public.conceptk (id, name) VALUES (521, 'cot');
INSERT INTO public.conceptk (id, name) VALUES (522, 'crock pot');
INSERT INTO public.conceptk (id, name) VALUES (523, 'croquet ball');
INSERT INTO public.conceptk (id, name) VALUES (524, 'crutch');
INSERT INTO public.conceptk (id, name) VALUES (525, 'cuirass');
INSERT INTO public.conceptk (id, name) VALUES (526, 'dam');
INSERT INTO public.conceptk (id, name) VALUES (526, 'dike');
INSERT INTO public.conceptk (id, name) VALUES (526, 'dyke');
INSERT INTO public.conceptk (id, name) VALUES (527, 'desk');
INSERT INTO public.conceptk (id, name) VALUES (528, 'desktop computer');
INSERT INTO public.conceptk (id, name) VALUES (529, 'dial telephone');
INSERT INTO public.conceptk (id, name) VALUES (529, 'dial phone');
INSERT INTO public.conceptk (id, name) VALUES (530, 'diaper');
INSERT INTO public.conceptk (id, name) VALUES (530, 'nappy');
INSERT INTO public.conceptk (id, name) VALUES (530, 'napkin');
INSERT INTO public.conceptk (id, name) VALUES (531, 'digital clock');
INSERT INTO public.conceptk (id, name) VALUES (532, 'digital watch');
INSERT INTO public.conceptk (id, name) VALUES (533, 'dining table');
INSERT INTO public.conceptk (id, name) VALUES (533, 'board');
INSERT INTO public.conceptk (id, name) VALUES (534, 'dishrag');
INSERT INTO public.conceptk (id, name) VALUES (534, 'dishcloth');
INSERT INTO public.conceptk (id, name) VALUES (535, 'dishwasher');
INSERT INTO public.conceptk (id, name) VALUES (535, 'dish washer');
INSERT INTO public.conceptk (id, name) VALUES (535, 'dishwashing machine');
INSERT INTO public.conceptk (id, name) VALUES (536, 'disk brake');
INSERT INTO public.conceptk (id, name) VALUES (536, 'disc brake');
INSERT INTO public.conceptk (id, name) VALUES (537, 'dock');
INSERT INTO public.conceptk (id, name) VALUES (537, 'dockage');
INSERT INTO public.conceptk (id, name) VALUES (537, 'docking facility');
INSERT INTO public.conceptk (id, name) VALUES (538, 'dogsled');
INSERT INTO public.conceptk (id, name) VALUES (538, 'dog sled');
INSERT INTO public.conceptk (id, name) VALUES (538, 'dog sleigh');
INSERT INTO public.conceptk (id, name) VALUES (539, 'dome');
INSERT INTO public.conceptk (id, name) VALUES (540, 'doormat');
INSERT INTO public.conceptk (id, name) VALUES (540, 'welcome mat');
INSERT INTO public.conceptk (id, name) VALUES (541, 'drilling platform');
INSERT INTO public.conceptk (id, name) VALUES (541, 'offshore rig');
INSERT INTO public.conceptk (id, name) VALUES (542, 'drum');
INSERT INTO public.conceptk (id, name) VALUES (542, 'membranophone');
INSERT INTO public.conceptk (id, name) VALUES (542, 'tympan');
INSERT INTO public.conceptk (id, name) VALUES (543, 'drumstick');
INSERT INTO public.conceptk (id, name) VALUES (544, 'dumbbell');
INSERT INTO public.conceptk (id, name) VALUES (545, 'dutch oven');
INSERT INTO public.conceptk (id, name) VALUES (546, 'electric fan');
INSERT INTO public.conceptk (id, name) VALUES (546, 'blower');
INSERT INTO public.conceptk (id, name) VALUES (547, 'electric guitar');
INSERT INTO public.conceptk (id, name) VALUES (548, 'electric locomotive');
INSERT INTO public.conceptk (id, name) VALUES (549, 'entertainment center');
INSERT INTO public.conceptk (id, name) VALUES (550, 'envelope');
INSERT INTO public.conceptk (id, name) VALUES (551, 'espresso maker');
INSERT INTO public.conceptk (id, name) VALUES (552, 'face powder');
INSERT INTO public.conceptk (id, name) VALUES (553, 'feather boa');
INSERT INTO public.conceptk (id, name) VALUES (553, 'boa');
INSERT INTO public.conceptk (id, name) VALUES (554, 'file');
INSERT INTO public.conceptk (id, name) VALUES (554, 'file cabinet');
INSERT INTO public.conceptk (id, name) VALUES (554, 'filing cabinet');
INSERT INTO public.conceptk (id, name) VALUES (555, 'fireboat');
INSERT INTO public.conceptk (id, name) VALUES (556, 'fire engine');
INSERT INTO public.conceptk (id, name) VALUES (556, 'fire truck');
INSERT INTO public.conceptk (id, name) VALUES (557, 'fire screen');
INSERT INTO public.conceptk (id, name) VALUES (557, 'fireguard');
INSERT INTO public.conceptk (id, name) VALUES (558, 'flagpole');
INSERT INTO public.conceptk (id, name) VALUES (558, 'flagstaff');
INSERT INTO public.conceptk (id, name) VALUES (559, 'flute');
INSERT INTO public.conceptk (id, name) VALUES (559, 'transverse flute');
INSERT INTO public.conceptk (id, name) VALUES (560, 'folding chair');
INSERT INTO public.conceptk (id, name) VALUES (561, 'football helmet');
INSERT INTO public.conceptk (id, name) VALUES (562, 'forklift');
INSERT INTO public.conceptk (id, name) VALUES (563, 'fountain');
INSERT INTO public.conceptk (id, name) VALUES (564, 'fountain pen');
INSERT INTO public.conceptk (id, name) VALUES (565, 'four-poster');
INSERT INTO public.conceptk (id, name) VALUES (566, 'freight car');
INSERT INTO public.conceptk (id, name) VALUES (567, 'french horn');
INSERT INTO public.conceptk (id, name) VALUES (568, 'frying pan');
INSERT INTO public.conceptk (id, name) VALUES (568, 'frypan');
INSERT INTO public.conceptk (id, name) VALUES (568, 'skillet');
INSERT INTO public.conceptk (id, name) VALUES (569, 'fur coat');
INSERT INTO public.conceptk (id, name) VALUES (570, 'garbage truck');
INSERT INTO public.conceptk (id, name) VALUES (570, 'dustcart');
INSERT INTO public.conceptk (id, name) VALUES (571, 'gasmask');
INSERT INTO public.conceptk (id, name) VALUES (571, 'respirator');
INSERT INTO public.conceptk (id, name) VALUES (571, 'gas helmet');
INSERT INTO public.conceptk (id, name) VALUES (572, 'gas pump');
INSERT INTO public.conceptk (id, name) VALUES (572, 'gasoline pump');
INSERT INTO public.conceptk (id, name) VALUES (572, 'petrol pump');
INSERT INTO public.conceptk (id, name) VALUES (572, 'island dispenser');
INSERT INTO public.conceptk (id, name) VALUES (573, 'goblet');
INSERT INTO public.conceptk (id, name) VALUES (574, 'go-kart');
INSERT INTO public.conceptk (id, name) VALUES (575, 'golf ball');
INSERT INTO public.conceptk (id, name) VALUES (576, 'golfcart');
INSERT INTO public.conceptk (id, name) VALUES (576, 'golf cart');
INSERT INTO public.conceptk (id, name) VALUES (577, 'gondola');
INSERT INTO public.conceptk (id, name) VALUES (578, 'gong');
INSERT INTO public.conceptk (id, name) VALUES (578, 'tam-tam');
INSERT INTO public.conceptk (id, name) VALUES (579, 'gown');
INSERT INTO public.conceptk (id, name) VALUES (580, 'grand piano');
INSERT INTO public.conceptk (id, name) VALUES (580, 'grand');
INSERT INTO public.conceptk (id, name) VALUES (581, 'greenhouse');
INSERT INTO public.conceptk (id, name) VALUES (581, 'nursery');
INSERT INTO public.conceptk (id, name) VALUES (581, 'glasshouse');
INSERT INTO public.conceptk (id, name) VALUES (582, 'grille');
INSERT INTO public.conceptk (id, name) VALUES (582, 'radiator grille');
INSERT INTO public.conceptk (id, name) VALUES (583, 'grocery store');
INSERT INTO public.conceptk (id, name) VALUES (583, 'grocery');
INSERT INTO public.conceptk (id, name) VALUES (583, 'food market');
INSERT INTO public.conceptk (id, name) VALUES (583, 'market');
INSERT INTO public.conceptk (id, name) VALUES (584, 'guillotine');
INSERT INTO public.conceptk (id, name) VALUES (585, 'hair slide');
INSERT INTO public.conceptk (id, name) VALUES (586, 'hair spray');
INSERT INTO public.conceptk (id, name) VALUES (587, 'half track');
INSERT INTO public.conceptk (id, name) VALUES (588, 'hammer');
INSERT INTO public.conceptk (id, name) VALUES (589, 'hamper');
INSERT INTO public.conceptk (id, name) VALUES (590, 'hand blower');
INSERT INTO public.conceptk (id, name) VALUES (590, 'blow dryer');
INSERT INTO public.conceptk (id, name) VALUES (590, 'blow drier');
INSERT INTO public.conceptk (id, name) VALUES (590, 'hair dryer');
INSERT INTO public.conceptk (id, name) VALUES (590, 'hair drier');
INSERT INTO public.conceptk (id, name) VALUES (591, 'hand-held computer');
INSERT INTO public.conceptk (id, name) VALUES (591, 'hand-held microcomputer');
INSERT INTO public.conceptk (id, name) VALUES (592, 'handkerchief');
INSERT INTO public.conceptk (id, name) VALUES (592, 'hankie');
INSERT INTO public.conceptk (id, name) VALUES (592, 'hanky');
INSERT INTO public.conceptk (id, name) VALUES (592, 'hankey');
INSERT INTO public.conceptk (id, name) VALUES (593, 'hard disc');
INSERT INTO public.conceptk (id, name) VALUES (593, 'hard disk');
INSERT INTO public.conceptk (id, name) VALUES (593, 'fixed disk');
INSERT INTO public.conceptk (id, name) VALUES (594, 'harmonica');
INSERT INTO public.conceptk (id, name) VALUES (594, 'mouth organ');
INSERT INTO public.conceptk (id, name) VALUES (594, 'mouth harp');
INSERT INTO public.conceptk (id, name) VALUES (595, 'harp');
INSERT INTO public.conceptk (id, name) VALUES (596, 'harvester');
INSERT INTO public.conceptk (id, name) VALUES (596, 'reaper');
INSERT INTO public.conceptk (id, name) VALUES (597, 'hatchet');
INSERT INTO public.conceptk (id, name) VALUES (598, 'holster');
INSERT INTO public.conceptk (id, name) VALUES (599, 'home theater');
INSERT INTO public.conceptk (id, name) VALUES (599, 'home theatre');
INSERT INTO public.conceptk (id, name) VALUES (600, 'honeycomb');
INSERT INTO public.conceptk (id, name) VALUES (601, 'hook');
INSERT INTO public.conceptk (id, name) VALUES (601, 'claw');
INSERT INTO public.conceptk (id, name) VALUES (602, 'hoopskirt');
INSERT INTO public.conceptk (id, name) VALUES (602, 'crinoline');
INSERT INTO public.conceptk (id, name) VALUES (603, 'horizontal bar');
INSERT INTO public.conceptk (id, name) VALUES (603, 'high bar');
INSERT INTO public.conceptk (id, name) VALUES (604, 'horse cart');
INSERT INTO public.conceptk (id, name) VALUES (604, 'horse-cart');
INSERT INTO public.conceptk (id, name) VALUES (605, 'hourglass');
INSERT INTO public.conceptk (id, name) VALUES (606, 'ipod');
INSERT INTO public.conceptk (id, name) VALUES (607, 'iron');
INSERT INTO public.conceptk (id, name) VALUES (607, 'smoothing iron');
INSERT INTO public.conceptk (id, name) VALUES (608, 'jack-o''-lantern');
INSERT INTO public.conceptk (id, name) VALUES (609, 'jean');
INSERT INTO public.conceptk (id, name) VALUES (609, 'blue jean');
INSERT INTO public.conceptk (id, name) VALUES (609, 'denim');
INSERT INTO public.conceptk (id, name) VALUES (610, 'jeep');
INSERT INTO public.conceptk (id, name) VALUES (610, 'landrover');
INSERT INTO public.conceptk (id, name) VALUES (611, 'jersey');
INSERT INTO public.conceptk (id, name) VALUES (611, 't-shirt');
INSERT INTO public.conceptk (id, name) VALUES (611, 'tee shirt');
INSERT INTO public.conceptk (id, name) VALUES (612, 'jigsaw puzzle');
INSERT INTO public.conceptk (id, name) VALUES (613, 'jinrikisha');
INSERT INTO public.conceptk (id, name) VALUES (613, 'ricksha');
INSERT INTO public.conceptk (id, name) VALUES (613, 'rickshaw');
INSERT INTO public.conceptk (id, name) VALUES (614, 'joystick');
INSERT INTO public.conceptk (id, name) VALUES (615, 'kimono');
INSERT INTO public.conceptk (id, name) VALUES (616, 'knee pad');
INSERT INTO public.conceptk (id, name) VALUES (617, 'knot');
INSERT INTO public.conceptk (id, name) VALUES (618, 'lab coat');
INSERT INTO public.conceptk (id, name) VALUES (618, 'laboratory coat');
INSERT INTO public.conceptk (id, name) VALUES (619, 'ladle');
INSERT INTO public.conceptk (id, name) VALUES (620, 'lampshade');
INSERT INTO public.conceptk (id, name) VALUES (620, 'lamp shade');
INSERT INTO public.conceptk (id, name) VALUES (621, 'laptop');
INSERT INTO public.conceptk (id, name) VALUES (621, 'laptop computer');
INSERT INTO public.conceptk (id, name) VALUES (622, 'lawn mower');
INSERT INTO public.conceptk (id, name) VALUES (622, 'mower');
INSERT INTO public.conceptk (id, name) VALUES (623, 'lens cap');
INSERT INTO public.conceptk (id, name) VALUES (623, 'lens cover');
INSERT INTO public.conceptk (id, name) VALUES (624, 'letter opener');
INSERT INTO public.conceptk (id, name) VALUES (624, 'paper knife');
INSERT INTO public.conceptk (id, name) VALUES (624, 'paperknife');
INSERT INTO public.conceptk (id, name) VALUES (625, 'library');
INSERT INTO public.conceptk (id, name) VALUES (626, 'lifeboat');
INSERT INTO public.conceptk (id, name) VALUES (627, 'lighter');
INSERT INTO public.conceptk (id, name) VALUES (627, 'light');
INSERT INTO public.conceptk (id, name) VALUES (627, 'igniter');
INSERT INTO public.conceptk (id, name) VALUES (627, 'ignitor');
INSERT INTO public.conceptk (id, name) VALUES (628, 'limousine');
INSERT INTO public.conceptk (id, name) VALUES (628, 'limo');
INSERT INTO public.conceptk (id, name) VALUES (629, 'liner');
INSERT INTO public.conceptk (id, name) VALUES (629, 'ocean liner');
INSERT INTO public.conceptk (id, name) VALUES (630, 'lipstick');
INSERT INTO public.conceptk (id, name) VALUES (630, 'lip rouge');
INSERT INTO public.conceptk (id, name) VALUES (631, 'loafer');
INSERT INTO public.conceptk (id, name) VALUES (632, 'lotion');
INSERT INTO public.conceptk (id, name) VALUES (633, 'loudspeaker');
INSERT INTO public.conceptk (id, name) VALUES (633, 'speaker');
INSERT INTO public.conceptk (id, name) VALUES (633, 'speaker unit');
INSERT INTO public.conceptk (id, name) VALUES (633, 'loudspeaker system');
INSERT INTO public.conceptk (id, name) VALUES (633, 'speaker system');
INSERT INTO public.conceptk (id, name) VALUES (634, 'loupe');
INSERT INTO public.conceptk (id, name) VALUES (634, 'jeweler''s loupe');
INSERT INTO public.conceptk (id, name) VALUES (635, 'lumbermill');
INSERT INTO public.conceptk (id, name) VALUES (635, 'sawmill');
INSERT INTO public.conceptk (id, name) VALUES (636, 'magnetic compass');
INSERT INTO public.conceptk (id, name) VALUES (637, 'mailbag');
INSERT INTO public.conceptk (id, name) VALUES (637, 'postbag');
INSERT INTO public.conceptk (id, name) VALUES (638, 'mailbox');
INSERT INTO public.conceptk (id, name) VALUES (638, 'letter box');
INSERT INTO public.conceptk (id, name) VALUES (639, 'maillot');
INSERT INTO public.conceptk (id, name) VALUES (640, 'tank suit');
INSERT INTO public.conceptk (id, name) VALUES (641, 'manhole cover');
INSERT INTO public.conceptk (id, name) VALUES (642, 'maraca');
INSERT INTO public.conceptk (id, name) VALUES (643, 'marimba');
INSERT INTO public.conceptk (id, name) VALUES (643, 'xylophone');
INSERT INTO public.conceptk (id, name) VALUES (644, 'mask');
INSERT INTO public.conceptk (id, name) VALUES (645, 'matchstick');
INSERT INTO public.conceptk (id, name) VALUES (646, 'maypole');
INSERT INTO public.conceptk (id, name) VALUES (647, 'maze');
INSERT INTO public.conceptk (id, name) VALUES (647, 'labyrinth');
INSERT INTO public.conceptk (id, name) VALUES (648, 'measuring cup');
INSERT INTO public.conceptk (id, name) VALUES (649, 'medicine chest');
INSERT INTO public.conceptk (id, name) VALUES (649, 'medicine cabinet');
INSERT INTO public.conceptk (id, name) VALUES (650, 'megalith');
INSERT INTO public.conceptk (id, name) VALUES (650, 'megalithic structure');
INSERT INTO public.conceptk (id, name) VALUES (651, 'microphone');
INSERT INTO public.conceptk (id, name) VALUES (651, 'mike');
INSERT INTO public.conceptk (id, name) VALUES (652, 'microwave');
INSERT INTO public.conceptk (id, name) VALUES (652, 'microwave oven');
INSERT INTO public.conceptk (id, name) VALUES (653, 'military uniform');
INSERT INTO public.conceptk (id, name) VALUES (654, 'milk can');
INSERT INTO public.conceptk (id, name) VALUES (655, 'minibus');
INSERT INTO public.conceptk (id, name) VALUES (656, 'miniskirt');
INSERT INTO public.conceptk (id, name) VALUES (656, 'mini');
INSERT INTO public.conceptk (id, name) VALUES (657, 'minivan');
INSERT INTO public.conceptk (id, name) VALUES (658, 'missile');
INSERT INTO public.conceptk (id, name) VALUES (659, 'mitten');
INSERT INTO public.conceptk (id, name) VALUES (660, 'mixing bowl');
INSERT INTO public.conceptk (id, name) VALUES (661, 'mobile home');
INSERT INTO public.conceptk (id, name) VALUES (661, 'manufactured home');
INSERT INTO public.conceptk (id, name) VALUES (662, 'model t');
INSERT INTO public.conceptk (id, name) VALUES (663, 'modem');
INSERT INTO public.conceptk (id, name) VALUES (664, 'monastery');
INSERT INTO public.conceptk (id, name) VALUES (665, 'monitor');
INSERT INTO public.conceptk (id, name) VALUES (666, 'moped');
INSERT INTO public.conceptk (id, name) VALUES (667, 'mortar');
INSERT INTO public.conceptk (id, name) VALUES (668, 'mortarboard');
INSERT INTO public.conceptk (id, name) VALUES (669, 'mosque');
INSERT INTO public.conceptk (id, name) VALUES (670, 'mosquito net');
INSERT INTO public.conceptk (id, name) VALUES (671, 'motor scooter');
INSERT INTO public.conceptk (id, name) VALUES (671, 'scooter');
INSERT INTO public.conceptk (id, name) VALUES (672, 'mountain bike');
INSERT INTO public.conceptk (id, name) VALUES (672, 'all-terrain bike');
INSERT INTO public.conceptk (id, name) VALUES (672, 'off-roader');
INSERT INTO public.conceptk (id, name) VALUES (673, 'mountain tent');
INSERT INTO public.conceptk (id, name) VALUES (674, 'mouse');
INSERT INTO public.conceptk (id, name) VALUES (674, 'computer mouse');
INSERT INTO public.conceptk (id, name) VALUES (675, 'mousetrap');
INSERT INTO public.conceptk (id, name) VALUES (676, 'moving van');
INSERT INTO public.conceptk (id, name) VALUES (677, 'muzzle');
INSERT INTO public.conceptk (id, name) VALUES (678, 'nail');
INSERT INTO public.conceptk (id, name) VALUES (679, 'neck brace');
INSERT INTO public.conceptk (id, name) VALUES (680, 'necklace');
INSERT INTO public.conceptk (id, name) VALUES (681, 'nipple');
INSERT INTO public.conceptk (id, name) VALUES (682, 'notebook');
INSERT INTO public.conceptk (id, name) VALUES (682, 'notebook computer');
INSERT INTO public.conceptk (id, name) VALUES (683, 'obelisk');
INSERT INTO public.conceptk (id, name) VALUES (684, 'oboe');
INSERT INTO public.conceptk (id, name) VALUES (684, 'hautboy');
INSERT INTO public.conceptk (id, name) VALUES (684, 'hautbois');
INSERT INTO public.conceptk (id, name) VALUES (685, 'ocarina');
INSERT INTO public.conceptk (id, name) VALUES (685, 'sweet potato');
INSERT INTO public.conceptk (id, name) VALUES (686, 'odometer');
INSERT INTO public.conceptk (id, name) VALUES (686, 'hodometer');
INSERT INTO public.conceptk (id, name) VALUES (686, 'mileometer');
INSERT INTO public.conceptk (id, name) VALUES (686, 'milometer');
INSERT INTO public.conceptk (id, name) VALUES (687, 'oil filter');
INSERT INTO public.conceptk (id, name) VALUES (688, 'organ');
INSERT INTO public.conceptk (id, name) VALUES (688, 'pipe organ');
INSERT INTO public.conceptk (id, name) VALUES (689, 'oscilloscope');
INSERT INTO public.conceptk (id, name) VALUES (689, 'scope');
INSERT INTO public.conceptk (id, name) VALUES (689, 'cathode-ray oscilloscope');
INSERT INTO public.conceptk (id, name) VALUES (689, 'cro');
INSERT INTO public.conceptk (id, name) VALUES (690, 'overskirt');
INSERT INTO public.conceptk (id, name) VALUES (691, 'oxcart');
INSERT INTO public.conceptk (id, name) VALUES (692, 'oxygen mask');
INSERT INTO public.conceptk (id, name) VALUES (693, 'packet');
INSERT INTO public.conceptk (id, name) VALUES (694, 'paddle');
INSERT INTO public.conceptk (id, name) VALUES (694, 'boat paddle');
INSERT INTO public.conceptk (id, name) VALUES (695, 'paddlewheel');
INSERT INTO public.conceptk (id, name) VALUES (695, 'paddle wheel');
INSERT INTO public.conceptk (id, name) VALUES (696, 'padlock');
INSERT INTO public.conceptk (id, name) VALUES (697, 'paintbrush');
INSERT INTO public.conceptk (id, name) VALUES (698, 'pajama');
INSERT INTO public.conceptk (id, name) VALUES (698, 'pyjama');
INSERT INTO public.conceptk (id, name) VALUES (698, 'pj''s');
INSERT INTO public.conceptk (id, name) VALUES (698, 'jammies');
INSERT INTO public.conceptk (id, name) VALUES (699, 'palace');
INSERT INTO public.conceptk (id, name) VALUES (700, 'panpipe');
INSERT INTO public.conceptk (id, name) VALUES (700, 'pandean pipe');
INSERT INTO public.conceptk (id, name) VALUES (700, 'syrinx');
INSERT INTO public.conceptk (id, name) VALUES (701, 'paper towel');
INSERT INTO public.conceptk (id, name) VALUES (702, 'parachute');
INSERT INTO public.conceptk (id, name) VALUES (702, 'chute');
INSERT INTO public.conceptk (id, name) VALUES (703, 'parallel bars');
INSERT INTO public.conceptk (id, name) VALUES (703, 'bars');
INSERT INTO public.conceptk (id, name) VALUES (704, 'park bench');
INSERT INTO public.conceptk (id, name) VALUES (705, 'parking meter');
INSERT INTO public.conceptk (id, name) VALUES (706, 'passenger car');
INSERT INTO public.conceptk (id, name) VALUES (706, 'coach');
INSERT INTO public.conceptk (id, name) VALUES (706, 'carriage');
INSERT INTO public.conceptk (id, name) VALUES (707, 'patio');
INSERT INTO public.conceptk (id, name) VALUES (707, 'terrace');
INSERT INTO public.conceptk (id, name) VALUES (708, 'pay-phone');
INSERT INTO public.conceptk (id, name) VALUES (708, 'pay-station');
INSERT INTO public.conceptk (id, name) VALUES (709, 'pedestal');
INSERT INTO public.conceptk (id, name) VALUES (709, 'plinth');
INSERT INTO public.conceptk (id, name) VALUES (709, 'footstall');
INSERT INTO public.conceptk (id, name) VALUES (710, 'pencil box');
INSERT INTO public.conceptk (id, name) VALUES (710, 'pencil case');
INSERT INTO public.conceptk (id, name) VALUES (711, 'pencil sharpener');
INSERT INTO public.conceptk (id, name) VALUES (712, 'perfume');
INSERT INTO public.conceptk (id, name) VALUES (712, 'essence');
INSERT INTO public.conceptk (id, name) VALUES (713, 'petri dish');
INSERT INTO public.conceptk (id, name) VALUES (714, 'photocopier');
INSERT INTO public.conceptk (id, name) VALUES (715, 'pick');
INSERT INTO public.conceptk (id, name) VALUES (715, 'plectrum');
INSERT INTO public.conceptk (id, name) VALUES (715, 'plectron');
INSERT INTO public.conceptk (id, name) VALUES (716, 'pickelhaube');
INSERT INTO public.conceptk (id, name) VALUES (717, 'picket fence');
INSERT INTO public.conceptk (id, name) VALUES (717, 'paling');
INSERT INTO public.conceptk (id, name) VALUES (718, 'pickup');
INSERT INTO public.conceptk (id, name) VALUES (718, 'pickup truck');
INSERT INTO public.conceptk (id, name) VALUES (719, 'pier');
INSERT INTO public.conceptk (id, name) VALUES (720, 'piggy bank');
INSERT INTO public.conceptk (id, name) VALUES (720, 'penny bank');
INSERT INTO public.conceptk (id, name) VALUES (721, 'pill bottle');
INSERT INTO public.conceptk (id, name) VALUES (722, 'pillow');
INSERT INTO public.conceptk (id, name) VALUES (723, 'ping-pong ball');
INSERT INTO public.conceptk (id, name) VALUES (724, 'pinwheel');
INSERT INTO public.conceptk (id, name) VALUES (725, 'pirate');
INSERT INTO public.conceptk (id, name) VALUES (725, 'pirate ship');
INSERT INTO public.conceptk (id, name) VALUES (726, 'pitcher');
INSERT INTO public.conceptk (id, name) VALUES (726, 'ewer');
INSERT INTO public.conceptk (id, name) VALUES (727, 'plane');
INSERT INTO public.conceptk (id, name) VALUES (727, 'carpenter''s plane');
INSERT INTO public.conceptk (id, name) VALUES (727, 'woodworking plane');
INSERT INTO public.conceptk (id, name) VALUES (728, 'planetarium');
INSERT INTO public.conceptk (id, name) VALUES (729, 'plastic bag');
INSERT INTO public.conceptk (id, name) VALUES (730, 'plate rack');
INSERT INTO public.conceptk (id, name) VALUES (731, 'plow');
INSERT INTO public.conceptk (id, name) VALUES (731, 'plough');
INSERT INTO public.conceptk (id, name) VALUES (732, 'plunger');
INSERT INTO public.conceptk (id, name) VALUES (732, 'plumber''s helper');
INSERT INTO public.conceptk (id, name) VALUES (733, 'polaroid camera');
INSERT INTO public.conceptk (id, name) VALUES (733, 'polaroid land camera');
INSERT INTO public.conceptk (id, name) VALUES (734, 'pole');
INSERT INTO public.conceptk (id, name) VALUES (735, 'police van');
INSERT INTO public.conceptk (id, name) VALUES (735, 'police wagon');
INSERT INTO public.conceptk (id, name) VALUES (735, 'paddy wagon');
INSERT INTO public.conceptk (id, name) VALUES (735, 'patrol wagon');
INSERT INTO public.conceptk (id, name) VALUES (735, 'black maria');
INSERT INTO public.conceptk (id, name) VALUES (736, 'poncho');
INSERT INTO public.conceptk (id, name) VALUES (737, 'pool table');
INSERT INTO public.conceptk (id, name) VALUES (737, 'billiard table');
INSERT INTO public.conceptk (id, name) VALUES (737, 'snooker table');
INSERT INTO public.conceptk (id, name) VALUES (738, 'pop bottle');
INSERT INTO public.conceptk (id, name) VALUES (738, 'soda bottle');
INSERT INTO public.conceptk (id, name) VALUES (739, 'pot');
INSERT INTO public.conceptk (id, name) VALUES (739, 'flowerpot');
INSERT INTO public.conceptk (id, name) VALUES (740, 'potter''s wheel');
INSERT INTO public.conceptk (id, name) VALUES (741, 'power drill');
INSERT INTO public.conceptk (id, name) VALUES (742, 'prayer rug');
INSERT INTO public.conceptk (id, name) VALUES (742, 'prayer mat');
INSERT INTO public.conceptk (id, name) VALUES (743, 'printer');
INSERT INTO public.conceptk (id, name) VALUES (744, 'prison');
INSERT INTO public.conceptk (id, name) VALUES (744, 'prison house');
INSERT INTO public.conceptk (id, name) VALUES (745, 'projectile');
INSERT INTO public.conceptk (id, name) VALUES (746, 'projector');
INSERT INTO public.conceptk (id, name) VALUES (747, 'puck');
INSERT INTO public.conceptk (id, name) VALUES (747, 'hockey puck');
INSERT INTO public.conceptk (id, name) VALUES (748, 'punching bag');
INSERT INTO public.conceptk (id, name) VALUES (748, 'punch bag');
INSERT INTO public.conceptk (id, name) VALUES (748, 'punching ball');
INSERT INTO public.conceptk (id, name) VALUES (748, 'punchball');
INSERT INTO public.conceptk (id, name) VALUES (749, 'purse');
INSERT INTO public.conceptk (id, name) VALUES (750, 'quill');
INSERT INTO public.conceptk (id, name) VALUES (750, 'quill pen');
INSERT INTO public.conceptk (id, name) VALUES (751, 'quilt');
INSERT INTO public.conceptk (id, name) VALUES (751, 'comforter');
INSERT INTO public.conceptk (id, name) VALUES (751, 'comfort');
INSERT INTO public.conceptk (id, name) VALUES (751, 'puff');
INSERT INTO public.conceptk (id, name) VALUES (752, 'racer');
INSERT INTO public.conceptk (id, name) VALUES (752, 'race car');
INSERT INTO public.conceptk (id, name) VALUES (752, 'racing car');
INSERT INTO public.conceptk (id, name) VALUES (753, 'racket');
INSERT INTO public.conceptk (id, name) VALUES (753, 'racquet');
INSERT INTO public.conceptk (id, name) VALUES (754, 'radiator');
INSERT INTO public.conceptk (id, name) VALUES (755, 'radio');
INSERT INTO public.conceptk (id, name) VALUES (755, 'wireless');
INSERT INTO public.conceptk (id, name) VALUES (756, 'radio telescope');
INSERT INTO public.conceptk (id, name) VALUES (756, 'radio reflector');
INSERT INTO public.conceptk (id, name) VALUES (757, 'rain barrel');
INSERT INTO public.conceptk (id, name) VALUES (758, 'recreational vehicle');
INSERT INTO public.conceptk (id, name) VALUES (758, 'rv');
INSERT INTO public.conceptk (id, name) VALUES (758, 'r.v.');
INSERT INTO public.conceptk (id, name) VALUES (759, 'reel');
INSERT INTO public.conceptk (id, name) VALUES (760, 'reflex camera');
INSERT INTO public.conceptk (id, name) VALUES (761, 'refrigerator');
INSERT INTO public.conceptk (id, name) VALUES (761, 'icebox');
INSERT INTO public.conceptk (id, name) VALUES (762, 'remote control');
INSERT INTO public.conceptk (id, name) VALUES (762, 'remote');
INSERT INTO public.conceptk (id, name) VALUES (763, 'restaurant');
INSERT INTO public.conceptk (id, name) VALUES (763, 'eating house');
INSERT INTO public.conceptk (id, name) VALUES (763, 'eating place');
INSERT INTO public.conceptk (id, name) VALUES (763, 'eatery');
INSERT INTO public.conceptk (id, name) VALUES (764, 'revolver');
INSERT INTO public.conceptk (id, name) VALUES (764, 'six-gun');
INSERT INTO public.conceptk (id, name) VALUES (764, 'six-shooter');
INSERT INTO public.conceptk (id, name) VALUES (765, 'rifle');
INSERT INTO public.conceptk (id, name) VALUES (766, 'rocking chair');
INSERT INTO public.conceptk (id, name) VALUES (766, 'rocker');
INSERT INTO public.conceptk (id, name) VALUES (767, 'rotisserie');
INSERT INTO public.conceptk (id, name) VALUES (768, 'rubber eraser');
INSERT INTO public.conceptk (id, name) VALUES (768, 'rubber');
INSERT INTO public.conceptk (id, name) VALUES (768, 'pencil eraser');
INSERT INTO public.conceptk (id, name) VALUES (769, 'rugby ball');
INSERT INTO public.conceptk (id, name) VALUES (770, 'rule');
INSERT INTO public.conceptk (id, name) VALUES (770, 'ruler');
INSERT INTO public.conceptk (id, name) VALUES (771, 'running shoe');
INSERT INTO public.conceptk (id, name) VALUES (772, 'safe');
INSERT INTO public.conceptk (id, name) VALUES (773, 'safety pin');
INSERT INTO public.conceptk (id, name) VALUES (774, 'saltshaker');
INSERT INTO public.conceptk (id, name) VALUES (774, 'salt shaker');
INSERT INTO public.conceptk (id, name) VALUES (775, 'sandal');
INSERT INTO public.conceptk (id, name) VALUES (776, 'sarong');
INSERT INTO public.conceptk (id, name) VALUES (777, 'sax');
INSERT INTO public.conceptk (id, name) VALUES (777, 'saxophone');
INSERT INTO public.conceptk (id, name) VALUES (778, 'scabbard');
INSERT INTO public.conceptk (id, name) VALUES (779, 'scale');
INSERT INTO public.conceptk (id, name) VALUES (779, 'weighing machine');
INSERT INTO public.conceptk (id, name) VALUES (780, 'school bus');
INSERT INTO public.conceptk (id, name) VALUES (781, 'schooner');
INSERT INTO public.conceptk (id, name) VALUES (782, 'scoreboard');
INSERT INTO public.conceptk (id, name) VALUES (783, 'screen');
INSERT INTO public.conceptk (id, name) VALUES (783, 'crt screen');
INSERT INTO public.conceptk (id, name) VALUES (784, 'screw');
INSERT INTO public.conceptk (id, name) VALUES (785, 'screwdriver');
INSERT INTO public.conceptk (id, name) VALUES (786, 'seat belt');
INSERT INTO public.conceptk (id, name) VALUES (786, 'seatbelt');
INSERT INTO public.conceptk (id, name) VALUES (787, 'sewing machine');
INSERT INTO public.conceptk (id, name) VALUES (788, 'shield');
INSERT INTO public.conceptk (id, name) VALUES (788, 'buckler');
INSERT INTO public.conceptk (id, name) VALUES (789, 'shoe shop');
INSERT INTO public.conceptk (id, name) VALUES (789, 'shoe-shop');
INSERT INTO public.conceptk (id, name) VALUES (789, 'shoe store');
INSERT INTO public.conceptk (id, name) VALUES (790, 'shoji');
INSERT INTO public.conceptk (id, name) VALUES (791, 'shopping basket');
INSERT INTO public.conceptk (id, name) VALUES (792, 'shopping cart');
INSERT INTO public.conceptk (id, name) VALUES (793, 'shovel');
INSERT INTO public.conceptk (id, name) VALUES (794, 'shower cap');
INSERT INTO public.conceptk (id, name) VALUES (795, 'shower curtain');
INSERT INTO public.conceptk (id, name) VALUES (796, 'ski');
INSERT INTO public.conceptk (id, name) VALUES (797, 'ski mask');
INSERT INTO public.conceptk (id, name) VALUES (798, 'sleeping bag');
INSERT INTO public.conceptk (id, name) VALUES (799, 'slide rule');
INSERT INTO public.conceptk (id, name) VALUES (799, 'slipstick');
INSERT INTO public.conceptk (id, name) VALUES (800, 'sliding door');
INSERT INTO public.conceptk (id, name) VALUES (801, 'slot');
INSERT INTO public.conceptk (id, name) VALUES (801, 'one-armed bandit');
INSERT INTO public.conceptk (id, name) VALUES (802, 'snorkel');
INSERT INTO public.conceptk (id, name) VALUES (803, 'snowmobile');
INSERT INTO public.conceptk (id, name) VALUES (804, 'snowplow');
INSERT INTO public.conceptk (id, name) VALUES (804, 'snowplough');
INSERT INTO public.conceptk (id, name) VALUES (805, 'soap dispenser');
INSERT INTO public.conceptk (id, name) VALUES (806, 'soccer ball');
INSERT INTO public.conceptk (id, name) VALUES (807, 'sock');
INSERT INTO public.conceptk (id, name) VALUES (808, 'solar dish');
INSERT INTO public.conceptk (id, name) VALUES (808, 'solar collector');
INSERT INTO public.conceptk (id, name) VALUES (808, 'solar furnace');
INSERT INTO public.conceptk (id, name) VALUES (809, 'sombrero');
INSERT INTO public.conceptk (id, name) VALUES (810, 'soup bowl');
INSERT INTO public.conceptk (id, name) VALUES (811, 'space bar');
INSERT INTO public.conceptk (id, name) VALUES (812, 'space heater');
INSERT INTO public.conceptk (id, name) VALUES (813, 'space shuttle');
INSERT INTO public.conceptk (id, name) VALUES (814, 'spatula');
INSERT INTO public.conceptk (id, name) VALUES (815, 'speedboat');
INSERT INTO public.conceptk (id, name) VALUES (816, 'spider web');
INSERT INTO public.conceptk (id, name) VALUES (816, 'spider''s web');
INSERT INTO public.conceptk (id, name) VALUES (817, 'spindle');
INSERT INTO public.conceptk (id, name) VALUES (818, 'sports car');
INSERT INTO public.conceptk (id, name) VALUES (818, 'sport car');
INSERT INTO public.conceptk (id, name) VALUES (819, 'spotlight');
INSERT INTO public.conceptk (id, name) VALUES (819, 'spot');
INSERT INTO public.conceptk (id, name) VALUES (820, 'stage');
INSERT INTO public.conceptk (id, name) VALUES (821, 'steam locomotive');
INSERT INTO public.conceptk (id, name) VALUES (822, 'steel arch bridge');
INSERT INTO public.conceptk (id, name) VALUES (823, 'steel drum');
INSERT INTO public.conceptk (id, name) VALUES (824, 'stethoscope');
INSERT INTO public.conceptk (id, name) VALUES (825, 'stole');
INSERT INTO public.conceptk (id, name) VALUES (826, 'stone wall');
INSERT INTO public.conceptk (id, name) VALUES (827, 'stopwatch');
INSERT INTO public.conceptk (id, name) VALUES (827, 'stop watch');
INSERT INTO public.conceptk (id, name) VALUES (828, 'stove');
INSERT INTO public.conceptk (id, name) VALUES (829, 'strainer');
INSERT INTO public.conceptk (id, name) VALUES (830, 'streetcar');
INSERT INTO public.conceptk (id, name) VALUES (830, 'tram');
INSERT INTO public.conceptk (id, name) VALUES (830, 'tramcar');
INSERT INTO public.conceptk (id, name) VALUES (830, 'trolley');
INSERT INTO public.conceptk (id, name) VALUES (830, 'trolley car');
INSERT INTO public.conceptk (id, name) VALUES (831, 'stretcher');
INSERT INTO public.conceptk (id, name) VALUES (832, 'studio couch');
INSERT INTO public.conceptk (id, name) VALUES (832, 'day bed');
INSERT INTO public.conceptk (id, name) VALUES (833, 'stupa');
INSERT INTO public.conceptk (id, name) VALUES (833, 'tope');
INSERT INTO public.conceptk (id, name) VALUES (834, 'submarine');
INSERT INTO public.conceptk (id, name) VALUES (834, 'pigboat');
INSERT INTO public.conceptk (id, name) VALUES (834, 'sub');
INSERT INTO public.conceptk (id, name) VALUES (834, 'u-boat');
INSERT INTO public.conceptk (id, name) VALUES (835, 'suit');
INSERT INTO public.conceptk (id, name) VALUES (835, 'suit of clothes');
INSERT INTO public.conceptk (id, name) VALUES (836, 'sundial');
INSERT INTO public.conceptk (id, name) VALUES (837, 'sunglass');
INSERT INTO public.conceptk (id, name) VALUES (838, 'sunglasses');
INSERT INTO public.conceptk (id, name) VALUES (838, 'dark glasses');
INSERT INTO public.conceptk (id, name) VALUES (838, 'shades');
INSERT INTO public.conceptk (id, name) VALUES (839, 'sunscreen');
INSERT INTO public.conceptk (id, name) VALUES (839, 'sunblock');
INSERT INTO public.conceptk (id, name) VALUES (839, 'sun blocker');
INSERT INTO public.conceptk (id, name) VALUES (840, 'suspension bridge');
INSERT INTO public.conceptk (id, name) VALUES (841, 'swab');
INSERT INTO public.conceptk (id, name) VALUES (841, 'swob');
INSERT INTO public.conceptk (id, name) VALUES (841, 'mop');
INSERT INTO public.conceptk (id, name) VALUES (842, 'sweatshirt');
INSERT INTO public.conceptk (id, name) VALUES (843, 'swimming trunks');
INSERT INTO public.conceptk (id, name) VALUES (843, 'bathing trunks');
INSERT INTO public.conceptk (id, name) VALUES (844, 'swing');
INSERT INTO public.conceptk (id, name) VALUES (845, 'switch');
INSERT INTO public.conceptk (id, name) VALUES (845, 'electric switch');
INSERT INTO public.conceptk (id, name) VALUES (845, 'electrical switch');
INSERT INTO public.conceptk (id, name) VALUES (846, 'syringe');
INSERT INTO public.conceptk (id, name) VALUES (847, 'table lamp');
INSERT INTO public.conceptk (id, name) VALUES (848, 'tank');
INSERT INTO public.conceptk (id, name) VALUES (848, 'army tank');
INSERT INTO public.conceptk (id, name) VALUES (848, 'armored combat vehicle');
INSERT INTO public.conceptk (id, name) VALUES (848, 'armoured combat vehicle');
INSERT INTO public.conceptk (id, name) VALUES (849, 'tape player');
INSERT INTO public.conceptk (id, name) VALUES (850, 'teapot');
INSERT INTO public.conceptk (id, name) VALUES (851, 'teddy');
INSERT INTO public.conceptk (id, name) VALUES (851, 'teddy bear');
INSERT INTO public.conceptk (id, name) VALUES (852, 'television');
INSERT INTO public.conceptk (id, name) VALUES (852, 'television system');
INSERT INTO public.conceptk (id, name) VALUES (853, 'tennis ball');
INSERT INTO public.conceptk (id, name) VALUES (854, 'thatch');
INSERT INTO public.conceptk (id, name) VALUES (854, 'thatched roof');
INSERT INTO public.conceptk (id, name) VALUES (855, 'theater curtain');
INSERT INTO public.conceptk (id, name) VALUES (855, 'theatre curtain');
INSERT INTO public.conceptk (id, name) VALUES (856, 'thimble');
INSERT INTO public.conceptk (id, name) VALUES (857, 'thresher');
INSERT INTO public.conceptk (id, name) VALUES (857, 'thrasher');
INSERT INTO public.conceptk (id, name) VALUES (857, 'threshing machine');
INSERT INTO public.conceptk (id, name) VALUES (858, 'throne');
INSERT INTO public.conceptk (id, name) VALUES (859, 'tile roof');
INSERT INTO public.conceptk (id, name) VALUES (860, 'toaster');
INSERT INTO public.conceptk (id, name) VALUES (861, 'tobacco shop');
INSERT INTO public.conceptk (id, name) VALUES (861, 'tobacconist shop');
INSERT INTO public.conceptk (id, name) VALUES (861, 'tobacconist');
INSERT INTO public.conceptk (id, name) VALUES (862, 'toilet seat');
INSERT INTO public.conceptk (id, name) VALUES (863, 'torch');
INSERT INTO public.conceptk (id, name) VALUES (864, 'totem pole');
INSERT INTO public.conceptk (id, name) VALUES (865, 'tow truck');
INSERT INTO public.conceptk (id, name) VALUES (865, 'tow car');
INSERT INTO public.conceptk (id, name) VALUES (865, 'wrecker');
INSERT INTO public.conceptk (id, name) VALUES (866, 'toyshop');
INSERT INTO public.conceptk (id, name) VALUES (867, 'tractor');
INSERT INTO public.conceptk (id, name) VALUES (868, 'trailer truck');
INSERT INTO public.conceptk (id, name) VALUES (868, 'tractor trailer');
INSERT INTO public.conceptk (id, name) VALUES (868, 'trucking rig');
INSERT INTO public.conceptk (id, name) VALUES (868, 'rig');
INSERT INTO public.conceptk (id, name) VALUES (868, 'articulated lorry');
INSERT INTO public.conceptk (id, name) VALUES (868, 'semi');
INSERT INTO public.conceptk (id, name) VALUES (869, 'tray');
INSERT INTO public.conceptk (id, name) VALUES (870, 'trench coat');
INSERT INTO public.conceptk (id, name) VALUES (871, 'tricycle');
INSERT INTO public.conceptk (id, name) VALUES (871, 'trike');
INSERT INTO public.conceptk (id, name) VALUES (871, 'velocipede');
INSERT INTO public.conceptk (id, name) VALUES (872, 'trimaran');
INSERT INTO public.conceptk (id, name) VALUES (873, 'tripod');
INSERT INTO public.conceptk (id, name) VALUES (874, 'triumphal arch');
INSERT INTO public.conceptk (id, name) VALUES (875, 'trolleybus');
INSERT INTO public.conceptk (id, name) VALUES (875, 'trolley coach');
INSERT INTO public.conceptk (id, name) VALUES (875, 'trackless trolley');
INSERT INTO public.conceptk (id, name) VALUES (876, 'trombone');
INSERT INTO public.conceptk (id, name) VALUES (877, 'tub');
INSERT INTO public.conceptk (id, name) VALUES (877, 'vat');
INSERT INTO public.conceptk (id, name) VALUES (878, 'turnstile');
INSERT INTO public.conceptk (id, name) VALUES (879, 'typewriter keyboard');
INSERT INTO public.conceptk (id, name) VALUES (880, 'umbrella');
INSERT INTO public.conceptk (id, name) VALUES (881, 'unicycle');
INSERT INTO public.conceptk (id, name) VALUES (881, 'monocycle');
INSERT INTO public.conceptk (id, name) VALUES (882, 'upright');
INSERT INTO public.conceptk (id, name) VALUES (882, 'upright piano');
INSERT INTO public.conceptk (id, name) VALUES (883, 'vacuum');
INSERT INTO public.conceptk (id, name) VALUES (883, 'vacuum cleaner');
INSERT INTO public.conceptk (id, name) VALUES (884, 'vase');
INSERT INTO public.conceptk (id, name) VALUES (885, 'vault');
INSERT INTO public.conceptk (id, name) VALUES (886, 'velvet');
INSERT INTO public.conceptk (id, name) VALUES (887, 'vending machine');
INSERT INTO public.conceptk (id, name) VALUES (888, 'vestment');
INSERT INTO public.conceptk (id, name) VALUES (889, 'viaduct');
INSERT INTO public.conceptk (id, name) VALUES (890, 'violin');
INSERT INTO public.conceptk (id, name) VALUES (890, 'fiddle');
INSERT INTO public.conceptk (id, name) VALUES (891, 'volleyball');
INSERT INTO public.conceptk (id, name) VALUES (892, 'waffle iron');
INSERT INTO public.conceptk (id, name) VALUES (893, 'wall clock');
INSERT INTO public.conceptk (id, name) VALUES (894, 'wallet');
INSERT INTO public.conceptk (id, name) VALUES (894, 'billfold');
INSERT INTO public.conceptk (id, name) VALUES (894, 'notecase');
INSERT INTO public.conceptk (id, name) VALUES (894, 'pocketbook');
INSERT INTO public.conceptk (id, name) VALUES (895, 'wardrobe');
INSERT INTO public.conceptk (id, name) VALUES (895, 'closet');
INSERT INTO public.conceptk (id, name) VALUES (895, 'press');
INSERT INTO public.conceptk (id, name) VALUES (896, 'warplane');
INSERT INTO public.conceptk (id, name) VALUES (896, 'military plane');
INSERT INTO public.conceptk (id, name) VALUES (897, 'washbasin');
INSERT INTO public.conceptk (id, name) VALUES (897, 'handbasin');
INSERT INTO public.conceptk (id, name) VALUES (897, 'washbowl');
INSERT INTO public.conceptk (id, name) VALUES (897, 'lavabo');
INSERT INTO public.conceptk (id, name) VALUES (897, 'wash-hand basin');
INSERT INTO public.conceptk (id, name) VALUES (898, 'washer');
INSERT INTO public.conceptk (id, name) VALUES (898, 'automatic washer');
INSERT INTO public.conceptk (id, name) VALUES (898, 'washing machine');
INSERT INTO public.conceptk (id, name) VALUES (899, 'water bottle');
INSERT INTO public.conceptk (id, name) VALUES (900, 'water jug');
INSERT INTO public.conceptk (id, name) VALUES (901, 'water tower');
INSERT INTO public.conceptk (id, name) VALUES (902, 'whiskey jug');
INSERT INTO public.conceptk (id, name) VALUES (903, 'whistle');
INSERT INTO public.conceptk (id, name) VALUES (904, 'wig');
INSERT INTO public.conceptk (id, name) VALUES (905, 'window screen');
INSERT INTO public.conceptk (id, name) VALUES (906, 'window shade');
INSERT INTO public.conceptk (id, name) VALUES (907, 'windsor tie');
INSERT INTO public.conceptk (id, name) VALUES (908, 'wine bottle');
INSERT INTO public.conceptk (id, name) VALUES (909, 'wing');
INSERT INTO public.conceptk (id, name) VALUES (910, 'wok');
INSERT INTO public.conceptk (id, name) VALUES (911, 'wooden spoon');
INSERT INTO public.conceptk (id, name) VALUES (912, 'wool');
INSERT INTO public.conceptk (id, name) VALUES (912, 'woolen');
INSERT INTO public.conceptk (id, name) VALUES (912, 'woollen');
INSERT INTO public.conceptk (id, name) VALUES (913, 'worm fence');
INSERT INTO public.conceptk (id, name) VALUES (913, 'snake fence');
INSERT INTO public.conceptk (id, name) VALUES (913, 'snake-rail fence');
INSERT INTO public.conceptk (id, name) VALUES (913, 'virginia fence');
INSERT INTO public.conceptk (id, name) VALUES (914, 'wreck');
INSERT INTO public.conceptk (id, name) VALUES (915, 'yawl');
INSERT INTO public.conceptk (id, name) VALUES (916, 'yurt');
INSERT INTO public.conceptk (id, name) VALUES (917, 'web site');
INSERT INTO public.conceptk (id, name) VALUES (917, 'website');
INSERT INTO public.conceptk (id, name) VALUES (917, 'internet site');
INSERT INTO public.conceptk (id, name) VALUES (917, 'site');
INSERT INTO public.conceptk (id, name) VALUES (918, 'comic book');
INSERT INTO public.conceptk (id, name) VALUES (919, 'crossword puzzle');
INSERT INTO public.conceptk (id, name) VALUES (919, 'crossword');
INSERT INTO public.conceptk (id, name) VALUES (920, 'street sign');
INSERT INTO public.conceptk (id, name) VALUES (921, 'traffic light');
INSERT INTO public.conceptk (id, name) VALUES (921, 'traffic signal');
INSERT INTO public.conceptk (id, name) VALUES (921, 'stoplight');
INSERT INTO public.conceptk (id, name) VALUES (922, 'book jacket');
INSERT INTO public.conceptk (id, name) VALUES (922, 'dust cover');
INSERT INTO public.conceptk (id, name) VALUES (922, 'dust jacket');
INSERT INTO public.conceptk (id, name) VALUES (922, 'dust wrapper');
INSERT INTO public.conceptk (id, name) VALUES (923, 'menu');
INSERT INTO public.conceptk (id, name) VALUES (924, 'plate');
INSERT INTO public.conceptk (id, name) VALUES (925, 'guacamole');
INSERT INTO public.conceptk (id, name) VALUES (926, 'consomme');
INSERT INTO public.conceptk (id, name) VALUES (927, 'hot pot');
INSERT INTO public.conceptk (id, name) VALUES (927, 'hotpot');
INSERT INTO public.conceptk (id, name) VALUES (928, 'trifle');
INSERT INTO public.conceptk (id, name) VALUES (929, 'ice cream');
INSERT INTO public.conceptk (id, name) VALUES (929, 'icecream');
INSERT INTO public.conceptk (id, name) VALUES (930, 'ice lolly');
INSERT INTO public.conceptk (id, name) VALUES (930, 'lolly');
INSERT INTO public.conceptk (id, name) VALUES (930, 'lollipop');
INSERT INTO public.conceptk (id, name) VALUES (930, 'popsicle');
INSERT INTO public.conceptk (id, name) VALUES (931, 'french loaf');
INSERT INTO public.conceptk (id, name) VALUES (932, 'bagel');
INSERT INTO public.conceptk (id, name) VALUES (932, 'beigel');
INSERT INTO public.conceptk (id, name) VALUES (933, 'pretzel');
INSERT INTO public.conceptk (id, name) VALUES (934, 'cheeseburger');
INSERT INTO public.conceptk (id, name) VALUES (935, 'hotdog');
INSERT INTO public.conceptk (id, name) VALUES (935, 'hot dog');
INSERT INTO public.conceptk (id, name) VALUES (935, 'red hot');
INSERT INTO public.conceptk (id, name) VALUES (936, 'mashed potato');
INSERT INTO public.conceptk (id, name) VALUES (937, 'head cabbage');
INSERT INTO public.conceptk (id, name) VALUES (938, 'broccoli');
INSERT INTO public.conceptk (id, name) VALUES (939, 'cauliflower');
INSERT INTO public.conceptk (id, name) VALUES (940, 'zucchini');
INSERT INTO public.conceptk (id, name) VALUES (940, 'courgette');
INSERT INTO public.conceptk (id, name) VALUES (941, 'spaghetti squash');
INSERT INTO public.conceptk (id, name) VALUES (942, 'acorn squash');
INSERT INTO public.conceptk (id, name) VALUES (943, 'butternut squash');
INSERT INTO public.conceptk (id, name) VALUES (944, 'cucumber');
INSERT INTO public.conceptk (id, name) VALUES (944, 'cuke');
INSERT INTO public.conceptk (id, name) VALUES (945, 'artichoke');
INSERT INTO public.conceptk (id, name) VALUES (945, 'globe artichoke');
INSERT INTO public.conceptk (id, name) VALUES (946, 'bell pepper');
INSERT INTO public.conceptk (id, name) VALUES (947, 'cardoon');
INSERT INTO public.conceptk (id, name) VALUES (948, 'mushroom');
INSERT INTO public.conceptk (id, name) VALUES (949, 'granny smith');
INSERT INTO public.conceptk (id, name) VALUES (950, 'strawberry');
INSERT INTO public.conceptk (id, name) VALUES (951, 'orange');
INSERT INTO public.conceptk (id, name) VALUES (952, 'lemon');
INSERT INTO public.conceptk (id, name) VALUES (953, 'fig');
INSERT INTO public.conceptk (id, name) VALUES (954, 'pineapple');
INSERT INTO public.conceptk (id, name) VALUES (954, 'ananas');
INSERT INTO public.conceptk (id, name) VALUES (955, 'banana');
INSERT INTO public.conceptk (id, name) VALUES (956, 'jackfruit');
INSERT INTO public.conceptk (id, name) VALUES (956, 'jak');
INSERT INTO public.conceptk (id, name) VALUES (956, 'jack');
INSERT INTO public.conceptk (id, name) VALUES (957, 'custard apple');
INSERT INTO public.conceptk (id, name) VALUES (958, 'pomegranate');
INSERT INTO public.conceptk (id, name) VALUES (959, 'hay');
INSERT INTO public.conceptk (id, name) VALUES (960, 'carbonara');
INSERT INTO public.conceptk (id, name) VALUES (961, 'chocolate sauce');
INSERT INTO public.conceptk (id, name) VALUES (961, 'chocolate syrup');
INSERT INTO public.conceptk (id, name) VALUES (962, 'dough');
INSERT INTO public.conceptk (id, name) VALUES (963, 'meat loaf');
INSERT INTO public.conceptk (id, name) VALUES (963, 'meatloaf');
INSERT INTO public.conceptk (id, name) VALUES (964, 'pizza');
INSERT INTO public.conceptk (id, name) VALUES (964, 'pizza pie');
INSERT INTO public.conceptk (id, name) VALUES (965, 'potpie');
INSERT INTO public.conceptk (id, name) VALUES (966, 'burrito');
INSERT INTO public.conceptk (id, name) VALUES (967, 'red wine');
INSERT INTO public.conceptk (id, name) VALUES (968, 'espresso');
INSERT INTO public.conceptk (id, name) VALUES (969, 'cup');
INSERT INTO public.conceptk (id, name) VALUES (970, 'eggnog');
INSERT INTO public.conceptk (id, name) VALUES (971, 'alp');
INSERT INTO public.conceptk (id, name) VALUES (972, 'bubble');
INSERT INTO public.conceptk (id, name) VALUES (973, 'cliff');
INSERT INTO public.conceptk (id, name) VALUES (973, 'drop');
INSERT INTO public.conceptk (id, name) VALUES (973, 'drop-off');
INSERT INTO public.conceptk (id, name) VALUES (974, 'coral reef');
INSERT INTO public.conceptk (id, name) VALUES (975, 'geyser');
INSERT INTO public.conceptk (id, name) VALUES (976, 'lakeside');
INSERT INTO public.conceptk (id, name) VALUES (976, 'lakeshore');
INSERT INTO public.conceptk (id, name) VALUES (977, 'promontory');
INSERT INTO public.conceptk (id, name) VALUES (977, 'headland');
INSERT INTO public.conceptk (id, name) VALUES (977, 'head');
INSERT INTO public.conceptk (id, name) VALUES (977, 'foreland');
INSERT INTO public.conceptk (id, name) VALUES (978, 'sandbar');
INSERT INTO public.conceptk (id, name) VALUES (978, 'sand bar');
INSERT INTO public.conceptk (id, name) VALUES (979, 'seashore');
INSERT INTO public.conceptk (id, name) VALUES (979, 'coast');
INSERT INTO public.conceptk (id, name) VALUES (979, 'seacoast');
INSERT INTO public.conceptk (id, name) VALUES (979, 'sea-coast');
INSERT INTO public.conceptk (id, name) VALUES (980, 'valley');
INSERT INTO public.conceptk (id, name) VALUES (980, 'vale');
INSERT INTO public.conceptk (id, name) VALUES (981, 'volcano');
INSERT INTO public.conceptk (id, name) VALUES (982, 'ballplayer');
INSERT INTO public.conceptk (id, name) VALUES (982, 'baseball player');
INSERT INTO public.conceptk (id, name) VALUES (983, 'groom');
INSERT INTO public.conceptk (id, name) VALUES (983, 'bridegroom');
INSERT INTO public.conceptk (id, name) VALUES (984, 'scuba diver');
INSERT INTO public.conceptk (id, name) VALUES (985, 'rapeseed');
INSERT INTO public.conceptk (id, name) VALUES (986, 'daisy');
INSERT INTO public.conceptk (id, name) VALUES (987, 'yellow lady''s slipper');
INSERT INTO public.conceptk (id, name) VALUES (987, 'yellow lady-slipper');
INSERT INTO public.conceptk (id, name) VALUES (987, 'cypripedium calceolus');
INSERT INTO public.conceptk (id, name) VALUES (987, 'cypripedium parviflorum');
INSERT INTO public.conceptk (id, name) VALUES (988, 'corn');
INSERT INTO public.conceptk (id, name) VALUES (989, 'acorn');
INSERT INTO public.conceptk (id, name) VALUES (990, 'hip');
INSERT INTO public.conceptk (id, name) VALUES (990, 'rose hip');
INSERT INTO public.conceptk (id, name) VALUES (990, 'rosehip');
INSERT INTO public.conceptk (id, name) VALUES (991, 'buckeye');
INSERT INTO public.conceptk (id, name) VALUES (991, 'horse chestnut');
INSERT INTO public.conceptk (id, name) VALUES (991, 'conker');
INSERT INTO public.conceptk (id, name) VALUES (992, 'coral fungus');
INSERT INTO public.conceptk (id, name) VALUES (993, 'agaric');
INSERT INTO public.conceptk (id, name) VALUES (994, 'gyromitra');
INSERT INTO public.conceptk (id, name) VALUES (995, 'stinkhorn');
INSERT INTO public.conceptk (id, name) VALUES (995, 'carrion fungus');
INSERT INTO public.conceptk (id, name) VALUES (996, 'earthstar');
INSERT INTO public.conceptk (id, name) VALUES (997, 'hen-of-the-woods');
INSERT INTO public.conceptk (id, name) VALUES (997, 'hen of the woods');
INSERT INTO public.conceptk (id, name) VALUES (997, 'polyporus frondosus');
INSERT INTO public.conceptk (id, name) VALUES (997, 'grifola frondosa');
INSERT INTO public.conceptk (id, name) VALUES (998, 'bolete');
INSERT INTO public.conceptk (id, name) VALUES (999, 'ear');
INSERT INTO public.conceptk (id, name) VALUES (999, 'spike');
INSERT INTO public.conceptk (id, name) VALUES (999, 'capitulum');
INSERT INTO public.conceptk (id, name) VALUES (1000, 'toilet tissue');
INSERT INTO public.conceptk (id, name) VALUES (1000, 'toilet paper');
INSERT INTO public.conceptk (id, name) VALUES (1000, 'bathroom tissue');


--
-- TOC entry 2842 (class 0 OID 23876)
-- Dependencies: 203
-- Data for Name: keyframe; Type: TABLE DATA; Schema: public; Owner: videouser
--



--
-- TOC entry 2846 (class 0 OID 23933)
-- Dependencies: 207
-- Data for Name: keyframeconcept; Type: TABLE DATA; Schema: public; Owner: videouser
--



--
-- TOC entry 2841 (class 0 OID 23866)
-- Dependencies: 202
-- Data for Name: video; Type: TABLE DATA; Schema: public; Owner: videouser
--



--
-- TOC entry 2854 (class 0 OID 0)
-- Dependencies: 204
-- Name: keyframe_id_seq; Type: SEQUENCE SET; Schema: public; Owner: videouser
--

SELECT pg_catalog.setval('public.keyframe_id_seq', 1, false);


--
-- TOC entry 2855 (class 0 OID 0)
-- Dependencies: 206
-- Name: keyframeconcept_id_seq; Type: SEQUENCE SET; Schema: public; Owner: videouser
--

SELECT pg_catalog.setval('public.keyframeconcept_id_seq', 1, false);


--
-- TOC entry 2856 (class 0 OID 0)
-- Dependencies: 205
-- Name: video_id_seq; Type: SEQUENCE SET; Schema: public; Owner: videouser
--

SELECT pg_catalog.setval('public.video_id_seq', 1, false);


--
-- TOC entry 2712 (class 2606 OID 24001)
-- Name: conceptk conceptk_pkey; Type: CONSTRAINT; Schema: public; Owner: videouser
--

ALTER TABLE ONLY public.conceptk
    ADD CONSTRAINT conceptk_pkey PRIMARY KEY (name);


--
-- TOC entry 2708 (class 2606 OID 23880)
-- Name: keyframe keyframe_pkey; Type: CONSTRAINT; Schema: public; Owner: videouser
--

ALTER TABLE ONLY public.keyframe
    ADD CONSTRAINT keyframe_pkey PRIMARY KEY (id);


--
-- TOC entry 2710 (class 2606 OID 23937)
-- Name: keyframeconcept keyframeconcept_pkey; Type: CONSTRAINT; Schema: public; Owner: videouser
--

ALTER TABLE ONLY public.keyframeconcept
    ADD CONSTRAINT keyframeconcept_pkey PRIMARY KEY (id);


--
-- TOC entry 2706 (class 2606 OID 23870)
-- Name: video video_pkey; Type: CONSTRAINT; Schema: public; Owner: videouser
--

ALTER TABLE ONLY public.video
    ADD CONSTRAINT video_pkey PRIMARY KEY (id);


--
-- TOC entry 2714 (class 2606 OID 23938)
-- Name: keyframeconcept keyframeid_fk; Type: FK CONSTRAINT; Schema: public; Owner: videouser
--

ALTER TABLE ONLY public.keyframeconcept
    ADD CONSTRAINT keyframeid_fk FOREIGN KEY (keyframeid) REFERENCES public.keyframe(id);


--
-- TOC entry 2713 (class 2606 OID 23881)
-- Name: keyframe videoid; Type: FK CONSTRAINT; Schema: public; Owner: videouser
--

ALTER TABLE ONLY public.keyframe
    ADD CONSTRAINT videoid FOREIGN KEY (videoid) REFERENCES public.video(id);


-- Completed on 2021-07-13 16:57:09

--
-- PostgreSQL database dump complete
--

