--
-- PostgreSQL database dump
--

-- Dumped from database version 15.4 (Homebrew)
-- Dumped by pg_dump version 15.4 (Homebrew)

DROP DATABASE IF EXISTS "k.sotnikov";
CREATE DATABASE "k.sotnikov" WITH ENCODING='UTF-8';

\c "k.sotnikov";

--
-- Name: awards; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.awards (
    awardid integer NOT NULL,
    showid integer,
    title character varying(255),
    category character varying(255),
    year integer
);


ALTER TABLE public.awards OWNER TO postgres;

--
-- Name: device; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.device (
    deviceid integer NOT NULL,
    userid integer,
    devicetype character varying(50),
    lastused timestamp without time zone
);


ALTER TABLE public.device OWNER TO postgres;

--
-- Name: episode; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.episode (
    episodeid integer NOT NULL,
    episodenumber integer,
    title character varying(255),
    duration integer,
    releasedate date,
    showid integer
);


ALTER TABLE public.episode OWNER TO postgres;

--
-- Name: genre; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.genre (
    genreid integer NOT NULL,
    name character varying(50)
);


ALTER TABLE public.genre OWNER TO postgres;

--
-- Name: profile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.profile (
    profileid integer NOT NULL,
    userid integer,
    name character varying(255),
    preferences character varying(255)
);


ALTER TABLE public.profile OWNER TO postgres;

--
-- Name: ratingreview; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ratingreview (
    ratingreviewid integer NOT NULL,
    showid integer,
    userid integer,
    rating numeric(3,1),
    review text,
    date date,
    CONSTRAINT ratingreview_rating_check CHECK (((rating >= (0)::numeric) AND (rating <= (10)::numeric)))
);


ALTER TABLE public.ratingreview OWNER TO postgres;

--
-- Name: show; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.show (
    showid integer NOT NULL,
    title character varying(255),
    description text,
    poster character varying(255),
    rating numeric(3,1),
    director character varying(255),
    genreid integer,
    cast_ character varying(255)
);


ALTER TABLE public.show OWNER TO postgres;

--
-- Name: subscription; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subscription (
    subscriptionid integer NOT NULL,
    userid integer,
    plan character varying(50),
    billinginfo character varying(255)
);


ALTER TABLE public.subscription OWNER TO postgres;

--
-- Name: user_; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_ (
    userid integer NOT NULL,
    name character varying(255),
    email character varying(255),
    password character varying(255),
    accounttype character varying(50)
);


ALTER TABLE public.user_ OWNER TO postgres;

--
-- Name: watchlist; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.watchlist (
    watchlistid integer NOT NULL,
    userid integer,
    showid integer
);


ALTER TABLE public.watchlist OWNER TO postgres;

--
-- Data for Name: awards; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.awards (awardid, showid, title, category, year) FROM stdin;
1	1	Emmy Award	Outstanding Drama Series	2013
2	1	Saturn Award	Best Actor in a Television Series	2012
3	2	MTV Movie & TV Award	Best Ensemble Cast	2016
4	2	Screen Actors Guild Award	Outstanding Performance by a Female Actor in a Drama Series	2017
5	3	Golden Globe Award	Best Television Series – Drama	2015
6	3	Hugo Award	Best Dramatic Presentation, Long Form	2012
7	4	Primetime Emmy Award	Outstanding Supporting Actor in a Drama Series	2015
8	4	Critics Choice Television Award	Best Drama Series	2016
9	5	BAFTA TV Award	Best Supporting Actor	2014
10	5	Peoples Choice Award	Favorite TV Drama	2015
11	6	Satellite Award	Best Genre Series	2018
12	6	Producers Guild of America Award	Norman Felton Award for Outstanding Producer of Episodic Television, Drama	2016
13	7	Teen Choice Award	Choice TV Actress: Fantasy/Sci-Fi	2019
14	7	Art Directors Guild Award	Excellence in Production Design for a One-Hour Contemporary Single-Camera Television Series	2018
15	8	Cinema Audio Society Award	Outstanding Achievement in Sound Mixing for Television Series – One Hour	2014
\.


--
-- Data for Name: device; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.device (deviceid, userid, devicetype, lastused) FROM stdin;
1	1	Smart TV	2022-01-15 18:30:00
2	1	Tablet	2022-01-20 14:45:00
3	2	Laptop	2022-02-20 21:45:00
4	2	Smartphone	2022-03-10 08:15:00
5	3	Tablet	2022-03-25 14:15:00
6	3	Smart TV	2022-04-05 20:00:00
7	4	Desktop Computer	2022-05-12 16:30:00
8	4	Laptop	2022-05-18 22:10:00
9	5	Smartphone	2022-06-02 12:45:00
10	5	Smart TV	2022-06-15 19:20:00
11	6	Tablet	2022-07-01 10:00:00
12	6	Smartphone	2022-07-08 15:30:00
13	7	Laptop	2022-08-03 18:45:00
14	7	Smart TV	2022-08-15 21:00:00
15	8	Desktop Computer	2022-09-01 14:20:00
\.


--
-- Data for Name: episode; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.episode (episodeid, episodenumber, title, duration, releasedate, showid) FROM stdin;
1	1	Wolferton Splash	60	2016-11-04	1
2	2	Hyde Park Corner	55	2016-11-04	1
3	1	The National Anthem	50	2011-12-04	2
4	2	Fifteen Million Merits	48	2011-12-11	2
5	1	Chapter One: The Vanishing of Will Byers	50	2016-07-15	3
6	2	Chapter Two: The Weirdo on Maple Street	48	2016-07-15	3
7	1	Pilot	60	2008-01-20	4
8	2	Cat in the Bag...	55	2008-01-27	4
9	1	Chapter 1: The Mandalorian	40	2019-11-12	5
10	2	Chapter 2: The Child	38	2019-11-15	5
11	1	Episode 1	30	2016-09-21	6
12	2	Episode 2	28	2016-09-28	6
13	1	The End Beginning	60	2019-12-20	7
14	2	Four Marks	56	2019-12-20	7
15	1	Pilot	22	1994-09-22	8
\.


--
-- Data for Name: genre; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.genre (genreid, name) FROM stdin;
1	Historical
2	Sci-Fi
3	Fantasy
4	Drama
5	Action
6	Comedy
7	Adventure
8	Romance
9	Mystery
10	Thriller
11	Sitcom
12	Crime
13	Biography
14	Animation
15	Psychological
\.


--
-- Data for Name: profile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.profile (profileid, userid, name, preferences) FROM stdin;
1	1	Alice Profile	Drama, Romance
2	2	Bob Profile	Action, Comedy
3	3	Charlie Profile	Mystery, Fantasy
4	4	David Profile	Sci-Fi, Adventure
5	5	Emma Profile	Romantic Comedy, Drama
6	6	Frank Profile	Thriller, Horror
7	7	Grace Profile	Comedy, Mystery
8	8	Henry Profile	Action, Adventure
9	9	Ivy Profile	Fantasy, Romance
10	10	Jack Profile	Drama, Thriller
11	11	Kelly Profile	Romantic Comedy, Mystery
12	12	Leo Profile	Action, Sci-Fi
13	13	Mia Profile	Drama, Romance
14	14	Nathan Profile	Comedy, Horror
15	15	Olivia Profile	Mystery, Thriller
\.


--
-- Data for Name: ratingreview; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ratingreview (ratingreviewid, showid, userid, rating, review, date) FROM stdin;
1	1	1	8.8	Fantastic portrayal of historical events.	2023-01-05
2	2	2	9.0	Mind-bending stories about the impact of technology on society.	2023-02-12
3	3	3	8.7	Great mix of nostalgia and supernatural mystery.	2023-03-20
4	4	4	9.5	One of the best character transformations in TV history.	2023-04-15
5	5	5	8.6	Captivating storyline and amazing visuals in the Star Wars universe.	2023-05-20
6	6	6	8.4	Hilarious and heartfelt exploration of modern life.	2023-06-25
7	7	7	8.7	Compelling fantasy series with excellent world-building.	2023-07-10
8	8	8	9.0	Timeless comedy with a memorable ensemble cast.	2023-08-15
9	9	9	9.2	Smart and thrilling adaptation of classic detective stories.	2023-09-20
10	10	10	8.5	Intriguing concept and philosophical exploration.	2023-10-25
11	11	11	8.9	Hilarious workplace comedy with memorable characters.	2023-11-30
12	12	12	9.1	Intense and stylish gangster drama set in post-World War I Birmingham.	2023-12-05
13	13	13	8.8	Compelling portrayal of the rise and fall of Pablo Escobar.	2023-12-20
14	14	14	8.7	Classic animated sitcom with timeless humor.	2023-12-25
15	15	15	8.6	Riveting exploration of criminal psychology in the late 1970s.	2023-12-30
\.


--
-- Data for Name: show; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.show (showid, title, description, poster, rating, director, genreid, cast_) FROM stdin;
1	The Crown	Chronicles the reign of Queen Elizabeth II.	the_crown.jpg	8.7	Peter Morgan	1	Claire Foy, Matt Smith
2	Black Mirror	Anthology series exploring the dark side of technology.	black_mirror.jpg	8.8	Charlie Brooker	2	Various
3	Stranger Things	A group of kids encounter supernatural forces in a small town.	stranger_things.jpg	8.9	The Duffer Brothers	3	Millie Bobby Brown, Finn Wolfhard
4	Breaking Bad	A high school chemistry teacher turned methamphetamine producer.	breaking_bad.jpg	9.5	Vince Gilligan	4	Bryan Cranston, Aaron Paul
5	The Mandalorian	Follows the adventures of a lone bounty hunter in the Star Wars universe.	mandalorian.jpg	8.6	Jon Favreau	5	Pedro Pascal
6	Fleabag	A comedic exploration of modern womanhood in London.	fleabag.jpg	8.4	Phoebe Waller-Bridge	6	Phoebe Waller-Bridge, Sian Clifford
7	The Witcher	Based on the book series, follows Geralt of Rivia in a world of magic and monsters.	witcher.jpg	8.7	Lauren Schmidt Hissrich	7	Henry Cavill, Anya Chalotra
8	Friends	A group of friends navigate life and love in New York City.	friends.jpg	8.9	David Crane, Marta Kauffman	8	Jennifer Aniston, Courteney Cox
9	Sherlock	Modern adaptation of Arthur Conan Doyles classic detective stories.	sherlock.jpg	9.1	Mark Gatiss, Steven Moffat	9	Benedict Cumberbatch, Martin Freeman
10	Westworld	An amusement park for rich vacationers, the park is looked after by robotic hosts.	westworld.jpg	8.6	Jonathan Nolan, Lisa Joy	10	Evan Rachel Wood, Thandie Newton
11	The Office	Mockumentary-style sitcom about office life.	the_office.jpg	8.5	Greg Daniels	11	Steve Carell, Rainn Wilson
12	Peaky Blinders	A gangster family epic set in Birmingham, England.	peaky_blinders.jpg	8.8	Steven Knight	12	Cillian Murphy, Paul Anderson
13	Narcos	Chronicles the rise and fall of the infamous drug lord Pablo Escobar.	narcos.jpg	8.7	Chris Brancato	13	Wagner Moura, Boyd Holbrook
14	The Simpsons	A satirical portrayal of a middle-class American family.	simpsons.jpg	8.7	Matt Groening	14	Dan Castellaneta, Julie Kavner
15	Mindhunter	Two FBI agents study and profile serial killers in the late 1970s.	mindhunter.jpg	8.6	Joe Penhall	15	Jonathan Groff, Holt McCallany
\.


--
-- Data for Name: subscription; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.subscription (subscriptionid, userid, plan, billinginfo) FROM stdin;
1	1	Premium	Credit Card ending in 5678
2	2	Free	\N
3	3	Premium	PayPal: charlie.brown@email.com
4	4	Free	\N
5	5	Premium	Credit Card ending in 4321
6	6	Free	\N
7	7	Premium	Credit Card ending in 8765
8	8	Free	\N
9	9	Premium	Credit Card ending in 9876
10	10	Free	\N
11	11	Premium	PayPal: kelly.harris@email.com
12	12	Free	\N
13	13	Premium	Credit Card ending in 3456
14	14	Free	\N
15	15	Premium	Credit Card ending in 2109
\.


--
-- Data for Name: user_; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_ (userid, name, email, password, accounttype) FROM stdin;
1	Alice Johnson	alice.johnson@email.com	pass123	Free
2	Bob Smith	bob.smith@email.com	securepass	Premium
3	Charlie Brown	charlie.brown@email.com	letmein	Free
4	David Miller	david.miller@email.com	mypassword	Premium
5	Emma Davis	emma.davis@email.com	password123	Free
6	Frank White	frank.white@email.com	secretword	Premium
7	Grace Taylor	grace.taylor@email.com	myp@ss	Free
8	Henry Turner	henry.turner@email.com	letmeinnow	Premium
9	Ivy Clark	ivy.clark@email.com	qwerty123	Free
10	Jack Robinson	jack.robinson@email.com	p@ssword	Premium
11	Kelly Harris	kelly.harris@email.com	mypassword	Free
12	Leo Garcia	leo.garcia@email.com	securepass	Premium
13	Mia Lee	mia.lee@email.com	letmein	Free
14	Nathan Wilson	nathan.wilson@email.com	password123	Premium
15	Olivia Moore	olivia.moore@email.com	secretword	Free
\.


--
-- Data for Name: watchlist; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.watchlist (watchlistid, userid, showid) FROM stdin;
1	1	4
2	2	6
3	3	8
4	4	10
5	5	12
6	6	14
7	7	1
8	8	3
9	9	5
10	10	7
11	11	9
12	12	11
13	13	13
14	14	15
15	15	2
\.


--
-- Name: awards awards_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_pkey PRIMARY KEY (awardid);


--
-- Name: device device_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.device
    ADD CONSTRAINT device_pkey PRIMARY KEY (deviceid);


--
-- Name: episode episode_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.episode
    ADD CONSTRAINT episode_pkey PRIMARY KEY (episodeid);


--
-- Name: genre genre_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genre
    ADD CONSTRAINT genre_pkey PRIMARY KEY (genreid);


--
-- Name: profile profile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profile
    ADD CONSTRAINT profile_pkey PRIMARY KEY (profileid);


--
-- Name: ratingreview ratingreview_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ratingreview
    ADD CONSTRAINT ratingreview_pkey PRIMARY KEY (ratingreviewid);


--
-- Name: show show_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.show
    ADD CONSTRAINT show_pkey PRIMARY KEY (showid);


--
-- Name: subscription subscription_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscription
    ADD CONSTRAINT subscription_pkey PRIMARY KEY (subscriptionid);


--
-- Name: user_ user__pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_
    ADD CONSTRAINT user__pkey PRIMARY KEY (userid);


--
-- Name: watchlist watchlist_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.watchlist
    ADD CONSTRAINT watchlist_pkey PRIMARY KEY (watchlistid);


--
-- Name: awards awards_showid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_showid_fkey FOREIGN KEY (showid) REFERENCES public.show(showid);


--
-- Name: device device_userid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.device
    ADD CONSTRAINT device_userid_fkey FOREIGN KEY (userid) REFERENCES public.user_(userid);


--
-- Name: episode episode_showid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.episode
    ADD CONSTRAINT episode_showid_fkey FOREIGN KEY (showid) REFERENCES public.show(showid);


--
-- Name: profile profile_userid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profile
    ADD CONSTRAINT profile_userid_fkey FOREIGN KEY (userid) REFERENCES public.user_(userid);


--
-- Name: ratingreview ratingreview_showid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ratingreview
    ADD CONSTRAINT ratingreview_showid_fkey FOREIGN KEY (showid) REFERENCES public.show(showid);


--
-- Name: ratingreview ratingreview_userid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ratingreview
    ADD CONSTRAINT ratingreview_userid_fkey FOREIGN KEY (userid) REFERENCES public.user_(userid);


--
-- Name: show show_genreid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.show
    ADD CONSTRAINT show_genreid_fkey FOREIGN KEY (genreid) REFERENCES public.genre(genreid);


--
-- Name: subscription subscription_userid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscription
    ADD CONSTRAINT subscription_userid_fkey FOREIGN KEY (userid) REFERENCES public.user_(userid);


--
-- Name: watchlist watchlist_showid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.watchlist
    ADD CONSTRAINT watchlist_showid_fkey FOREIGN KEY (showid) REFERENCES public.show(showid);


--
-- Name: watchlist watchlist_userid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.watchlist
    ADD CONSTRAINT watchlist_userid_fkey FOREIGN KEY (userid) REFERENCES public.user_(userid);


--
-- PostgreSQL database dump complete
--

