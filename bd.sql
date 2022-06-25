--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-0ubuntu0.20.04.1)

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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: inkafarma
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO inkafarma;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: inkafarma
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO inkafarma;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inkafarma
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: inkafarma
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO inkafarma;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: inkafarma
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO inkafarma;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inkafarma
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: inkafarma
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO inkafarma;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: inkafarma
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO inkafarma;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inkafarma
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: authtoken_token; Type: TABLE; Schema: public; Owner: inkafarma
--

CREATE TABLE public.authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.authtoken_token OWNER TO inkafarma;

--
-- Name: client_direction; Type: TABLE; Schema: public; Owner: inkafarma
--

CREATE TABLE public.client_direction (
    id bigint NOT NULL,
    detail character varying(750) NOT NULL,
    reference character varying(1250) NOT NULL,
    type smallint NOT NULL,
    client_id bigint NOT NULL,
    CONSTRAINT client_direction_type_check CHECK ((type >= 0))
);


ALTER TABLE public.client_direction OWNER TO inkafarma;

--
-- Name: client_direction_id_seq; Type: SEQUENCE; Schema: public; Owner: inkafarma
--

CREATE SEQUENCE public.client_direction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.client_direction_id_seq OWNER TO inkafarma;

--
-- Name: client_direction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inkafarma
--

ALTER SEQUENCE public.client_direction_id_seq OWNED BY public.client_direction.id;


--
-- Name: client_order; Type: TABLE; Schema: public; Owner: inkafarma
--

CREATE TABLE public.client_order (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    status smallint NOT NULL,
    delivered_at timestamp with time zone,
    payed boolean NOT NULL,
    payment_card smallint NOT NULL,
    amount numeric(6,2) NOT NULL,
    req_bill boolean NOT NULL,
    client_id bigint NOT NULL,
    direction_id bigint NOT NULL,
    payment_method_id bigint NOT NULL,
    CONSTRAINT client_order_payment_card_check CHECK ((payment_card >= 0)),
    CONSTRAINT client_order_status_check CHECK ((status >= 0))
);


ALTER TABLE public.client_order OWNER TO inkafarma;

--
-- Name: client_order_id_seq; Type: SEQUENCE; Schema: public; Owner: inkafarma
--

CREATE SEQUENCE public.client_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.client_order_id_seq OWNER TO inkafarma;

--
-- Name: client_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inkafarma
--

ALTER SEQUENCE public.client_order_id_seq OWNED BY public.client_order.id;


--
-- Name: client_orderdetail; Type: TABLE; Schema: public; Owner: inkafarma
--

CREATE TABLE public.client_orderdetail (
    id bigint NOT NULL,
    qty smallint NOT NULL,
    sale_price numeric(6,2) NOT NULL,
    order_id bigint NOT NULL,
    product_id bigint NOT NULL,
    CONSTRAINT client_orderdetail_qty_check CHECK ((qty >= 0))
);


ALTER TABLE public.client_orderdetail OWNER TO inkafarma;

--
-- Name: client_orderdetail_id_seq; Type: SEQUENCE; Schema: public; Owner: inkafarma
--

CREATE SEQUENCE public.client_orderdetail_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.client_orderdetail_id_seq OWNER TO inkafarma;

--
-- Name: client_orderdetail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inkafarma
--

ALTER SEQUENCE public.client_orderdetail_id_seq OWNED BY public.client_orderdetail.id;


--
-- Name: client_orderstatus; Type: TABLE; Schema: public; Owner: inkafarma
--

CREATE TABLE public.client_orderstatus (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    status smallint NOT NULL,
    order_id bigint NOT NULL,
    CONSTRAINT client_orderstatus_status_check CHECK ((status >= 0))
);


ALTER TABLE public.client_orderstatus OWNER TO inkafarma;

--
-- Name: client_orderstatus_id_seq; Type: SEQUENCE; Schema: public; Owner: inkafarma
--

CREATE SEQUENCE public.client_orderstatus_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.client_orderstatus_id_seq OWNER TO inkafarma;

--
-- Name: client_orderstatus_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inkafarma
--

ALTER SEQUENCE public.client_orderstatus_id_seq OWNED BY public.client_orderstatus.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: inkafarma
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id bigint NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO inkafarma;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: inkafarma
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO inkafarma;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inkafarma
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: inkafarma
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO inkafarma;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: inkafarma
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO inkafarma;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inkafarma
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: inkafarma
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO inkafarma;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: inkafarma
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO inkafarma;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inkafarma
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: inkafarma
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO inkafarma;

--
-- Name: internal_category; Type: TABLE; Schema: public; Owner: inkafarma
--

CREATE TABLE public.internal_category (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    name character varying(500) NOT NULL,
    description text NOT NULL,
    is_active boolean NOT NULL,
    created_by_id bigint NOT NULL,
    upper_id bigint
);


ALTER TABLE public.internal_category OWNER TO inkafarma;

--
-- Name: internal_category_id_seq; Type: SEQUENCE; Schema: public; Owner: inkafarma
--

CREATE SEQUENCE public.internal_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.internal_category_id_seq OWNER TO inkafarma;

--
-- Name: internal_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inkafarma
--

ALTER SEQUENCE public.internal_category_id_seq OWNED BY public.internal_category.id;


--
-- Name: internal_paymentmethod; Type: TABLE; Schema: public; Owner: inkafarma
--

CREATE TABLE public.internal_paymentmethod (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    code character varying(4) NOT NULL,
    name character varying(250) NOT NULL,
    image character varying(100) NOT NULL,
    created_by_id bigint NOT NULL
);


ALTER TABLE public.internal_paymentmethod OWNER TO inkafarma;

--
-- Name: internal_paymentmethod_id_seq; Type: SEQUENCE; Schema: public; Owner: inkafarma
--

CREATE SEQUENCE public.internal_paymentmethod_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.internal_paymentmethod_id_seq OWNER TO inkafarma;

--
-- Name: internal_paymentmethod_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inkafarma
--

ALTER SEQUENCE public.internal_paymentmethod_id_seq OWNED BY public.internal_paymentmethod.id;


--
-- Name: internal_product; Type: TABLE; Schema: public; Owner: inkafarma
--

CREATE TABLE public.internal_product (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    name character varying(250) NOT NULL,
    shrot_description character varying(1250) NOT NULL,
    description text NOT NULL,
    contraindications text NOT NULL,
    observations text NOT NULL,
    image character varying(100) NOT NULL,
    stock integer NOT NULL,
    price numeric(6,2) NOT NULL,
    offer_price numeric(6,2) NOT NULL,
    oh_price numeric(6,2) NOT NULL,
    category_id bigint NOT NULL,
    created_by_id bigint NOT NULL,
    CONSTRAINT internal_product_stock_check CHECK ((stock >= 0))
);


ALTER TABLE public.internal_product OWNER TO inkafarma;

--
-- Name: internal_product_id_seq; Type: SEQUENCE; Schema: public; Owner: inkafarma
--

CREATE SEQUENCE public.internal_product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.internal_product_id_seq OWNER TO inkafarma;

--
-- Name: internal_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inkafarma
--

ALTER SEQUENCE public.internal_product_id_seq OWNED BY public.internal_product.id;


--
-- Name: login_user; Type: TABLE; Schema: public; Owner: inkafarma
--

CREATE TABLE public.login_user (
    id bigint NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    email character varying(254) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    second_last_name character varying(150) NOT NULL,
    doc_type smallint NOT NULL,
    doc_number character varying(15) NOT NULL,
    birthdate date,
    rol smallint NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    is_active boolean NOT NULL,
    CONSTRAINT login_user_doc_type_check CHECK ((doc_type >= 0)),
    CONSTRAINT login_user_rol_check CHECK ((rol >= 0))
);


ALTER TABLE public.login_user OWNER TO inkafarma;

--
-- Name: login_user_id_seq; Type: SEQUENCE; Schema: public; Owner: inkafarma
--

CREATE SEQUENCE public.login_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.login_user_id_seq OWNER TO inkafarma;

--
-- Name: login_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inkafarma
--

ALTER SEQUENCE public.login_user_id_seq OWNED BY public.login_user.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: inkafarma
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: inkafarma
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: inkafarma
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: client_direction id; Type: DEFAULT; Schema: public; Owner: inkafarma
--

ALTER TABLE ONLY public.client_direction ALTER COLUMN id SET DEFAULT nextval('public.client_direction_id_seq'::regclass);


--
-- Name: client_order id; Type: DEFAULT; Schema: public; Owner: inkafarma
--

ALTER TABLE ONLY public.client_order ALTER COLUMN id SET DEFAULT nextval('public.client_order_id_seq'::regclass);


--
-- Name: client_orderdetail id; Type: DEFAULT; Schema: public; Owner: inkafarma
--

ALTER TABLE ONLY public.client_orderdetail ALTER COLUMN id SET DEFAULT nextval('public.client_orderdetail_id_seq'::regclass);


--
-- Name: client_orderstatus id; Type: DEFAULT; Schema: public; Owner: inkafarma
--

ALTER TABLE ONLY public.client_orderstatus ALTER COLUMN id SET DEFAULT nextval('public.client_orderstatus_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: inkafarma
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: inkafarma
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: inkafarma
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: internal_category id; Type: DEFAULT; Schema: public; Owner: inkafarma
--

ALTER TABLE ONLY public.internal_category ALTER COLUMN id SET DEFAULT nextval('public.internal_category_id_seq'::regclass);


--
-- Name: internal_paymentmethod id; Type: DEFAULT; Schema: public; Owner: inkafarma
--

ALTER TABLE ONLY public.internal_paymentmethod ALTER COLUMN id SET DEFAULT nextval('public.internal_paymentmethod_id_seq'::regclass);


--
-- Name: internal_product id; Type: DEFAULT; Schema: public; Owner: inkafarma
--

ALTER TABLE ONLY public.internal_product ALTER COLUMN id SET DEFAULT nextval('public.internal_product_id_seq'::regclass);


--
-- Name: login_user id; Type: DEFAULT; Schema: public; Owner: inkafarma
--

ALTER TABLE ONLY public.login_user ALTER COLUMN id SET DEFAULT nextval('public.login_user_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: inkafarma
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: inkafarma
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: inkafarma
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add session	5	add_session
18	Can change session	5	change_session
19	Can delete session	5	delete_session
20	Can view session	5	view_session
21	Can add user	6	add_user
22	Can change user	6	change_user
23	Can delete user	6	delete_user
24	Can view user	6	view_user
25	Can add Token	7	add_token
26	Can change Token	7	change_token
27	Can delete Token	7	delete_token
28	Can view Token	7	view_token
29	Can add token	8	add_tokenproxy
30	Can change token	8	change_tokenproxy
31	Can delete token	8	delete_tokenproxy
32	Can view token	8	view_tokenproxy
33	Can add order detail	9	add_orderdetail
34	Can change order detail	9	change_orderdetail
35	Can delete order detail	9	delete_orderdetail
36	Can view order detail	9	view_orderdetail
37	Can add order	10	add_order
38	Can change order	10	change_order
39	Can delete order	10	delete_order
40	Can view order	10	view_order
41	Can add order status	11	add_orderstatus
42	Can change order status	11	change_orderstatus
43	Can delete order status	11	delete_orderstatus
44	Can view order status	11	view_orderstatus
45	Can add payment method	12	add_paymentmethod
46	Can change payment method	12	change_paymentmethod
47	Can delete payment method	12	delete_paymentmethod
48	Can view payment method	12	view_paymentmethod
49	Can add category	13	add_category
50	Can change category	13	change_category
51	Can delete category	13	delete_category
52	Can view category	13	view_category
53	Can add direction	14	add_direction
54	Can change direction	14	change_direction
55	Can delete direction	14	delete_direction
56	Can view direction	14	view_direction
57	Can add product	15	add_product
58	Can change product	15	change_product
59	Can delete product	15	delete_product
60	Can view product	15	view_product
61	Can add direction	16	add_direction
62	Can change direction	16	change_direction
63	Can delete direction	16	delete_direction
64	Can view direction	16	view_direction
\.


--
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: public; Owner: inkafarma
--

COPY public.authtoken_token (key, created, user_id) FROM stdin;
8f1f0b59dc29d2ad3acbc0b3c796e73c353a4b0b	2022-02-12 21:34:54.743075-05	2
\.


--
-- Data for Name: client_direction; Type: TABLE DATA; Schema: public; Owner: inkafarma
--

COPY public.client_direction (id, detail, reference, type, client_id) FROM stdin;
1	Prueba	prueba	1	2
\.


--
-- Data for Name: client_order; Type: TABLE DATA; Schema: public; Owner: inkafarma
--

COPY public.client_order (id, created_at, status, delivered_at, payed, payment_card, amount, req_bill, client_id, direction_id, payment_method_id) FROM stdin;
1	2022-03-02 18:10:37.131404-05	1	2022-03-01 18:10:17-05	t	4569	55.99	f	2	1	3
\.


--
-- Data for Name: client_orderdetail; Type: TABLE DATA; Schema: public; Owner: inkafarma
--

COPY public.client_orderdetail (id, qty, sale_price, order_id, product_id) FROM stdin;
\.


--
-- Data for Name: client_orderstatus; Type: TABLE DATA; Schema: public; Owner: inkafarma
--

COPY public.client_orderstatus (id, created_at, status, order_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: inkafarma
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2022-02-12 21:00:10.58408-05	2	jochoa@inkafarma.com.pe	2	[]	6	3
2	2022-02-12 21:00:46.373373-05	2	jochoa@inkafarma.com.pe	2	[{"changed": {"fields": ["Last name", "Second last name", "Birthdate", "Doc number", "Rol"]}}]	6	3
3	2022-02-14 13:58:30.236965-05	1	1 | Mamá y Bebé	1	[{"added": {}}]	13	3
4	2022-02-14 13:59:25.857296-05	2	2 | Cuidado Personal	1	[{"added": {}}]	13	3
5	2022-02-14 14:00:01.745284-05	3	3 | Pañales para Bebé	1	[{"added": {}}]	13	3
6	2022-02-14 14:00:34.721874-05	4	4 | Toallitas Húmedas	1	[{"added": {}}]	13	3
7	2022-02-14 14:01:24.383387-05	5	5 | Pañales Talla S	1	[{"added": {}}]	13	3
8	2022-02-14 14:01:43.436413-05	6	6 | Pañales Talla M	1	[{"added": {}}]	13	3
9	2022-02-14 14:02:11.338266-05	7	7 | Pañales Talla L	1	[{"added": {}}]	13	3
10	2022-02-14 14:08:10.969548-05	8	8 | Cuidado de la piel	1	[{"added": {}}]	13	3
11	2022-02-14 14:09:08.006511-05	9	9 | Cremas para la piel	1	[{"added": {}}]	13	3
12	2022-02-14 14:09:40.27585-05	10	10 | Protección Solar	1	[{"added": {}}]	13	3
13	2022-02-14 14:52:03.280022-05	1	Product object (1)	1	[{"added": {}}]	15	3
14	2022-02-14 14:53:11.593444-05	1	Product object (1)	2	[{"changed": {"fields": ["Image"]}}]	15	3
15	2022-03-02 14:05:48.780438-05	1	PaymentMethod object (1)	1	[{"added": {}}]	12	3
16	2022-03-02 18:02:35.997103-05	2	jochoa@inkafarma.com.pe	2	[{"changed": {"fields": ["Rol"]}}]	6	3
17	2022-03-02 18:02:45.23951-05	2	jochoa@inkafarma.com.pe	2	[{"changed": {"fields": ["Rol"]}}]	6	3
18	2022-03-02 18:10:06.715362-05	1	Direction object (1)	1	[{"added": {}}]	16	3
19	2022-03-02 18:10:37.133863-05	1	Order object (1)	1	[{"added": {}}]	10	3
20	2022-03-02 19:23:48.418197-05	1	Order object (1)	2	[{"changed": {"fields": ["Payed", "Payment card"]}}]	10	3
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: inkafarma
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	login	user
7	authtoken	token
8	authtoken	tokenproxy
9	client	orderdetail
10	client	order
11	client	orderstatus
12	internal	paymentmethod
13	internal	category
14	internal	direction
15	internal	product
16	client	direction
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: inkafarma
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	login	0001_initial	2022-02-12 20:34:03.397424-05
2	contenttypes	0001_initial	2022-02-12 20:34:03.419782-05
3	admin	0001_initial	2022-02-12 20:34:03.466451-05
4	admin	0002_logentry_remove_auto_add	2022-02-12 20:34:03.472642-05
5	admin	0003_logentry_add_action_flag_choices	2022-02-12 20:34:03.49073-05
6	contenttypes	0002_remove_content_type_name	2022-02-12 20:34:03.502757-05
7	auth	0001_initial	2022-02-12 20:34:03.59072-05
8	auth	0002_alter_permission_name_max_length	2022-02-12 20:34:03.598386-05
9	auth	0003_alter_user_email_max_length	2022-02-12 20:34:03.605109-05
10	auth	0004_alter_user_username_opts	2022-02-12 20:34:03.612131-05
11	auth	0005_alter_user_last_login_null	2022-02-12 20:34:03.619331-05
12	auth	0006_require_contenttypes_0002	2022-02-12 20:34:03.624183-05
13	auth	0007_alter_validators_add_error_messages	2022-02-12 20:34:03.6309-05
14	auth	0008_alter_user_username_max_length	2022-02-12 20:34:03.638701-05
15	auth	0009_alter_user_last_name_max_length	2022-02-12 20:34:03.645941-05
16	auth	0010_alter_group_name_max_length	2022-02-12 20:34:03.655761-05
17	auth	0011_update_proxy_permissions	2022-02-12 20:34:03.66383-05
18	auth	0012_alter_user_first_name_max_length	2022-02-12 20:34:03.670984-05
19	sessions	0001_initial	2022-02-12 20:34:03.705476-05
20	login	0002_alter_user_doc_type	2022-02-12 20:40:39.792023-05
21	login	0003_rename_joined_user_date_joined	2022-02-12 20:57:29.569323-05
22	authtoken	0001_initial	2022-02-12 21:08:41.554493-05
23	authtoken	0002_auto_20160226_1747	2022-02-12 21:08:41.567983-05
24	authtoken	0003_tokenproxy	2022-02-12 21:08:41.573909-05
25	internal	0001_initial	2022-02-14 13:40:49.622811-05
26	client	0001_initial	2022-02-14 13:40:49.720873-05
27	internal	0002_alter_category_name_alter_category_upper_and_more	2022-02-16 21:42:10.60526-05
28	client	0002_direction_alter_order_direction	2022-03-02 18:09:43.329123-05
29	internal	0003_delete_direction	2022-03-02 18:09:43.339479-05
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: inkafarma
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
fovvxzvlb7bo3bxswc5vl8mufd3qhz1n	.eJxVjDsOwyAQBe9CHSG-ZkmZ3mdACwvBSYQlY1dR7h5bcpG0b2bemwXc1hq2npcwEbsyzS6_W8T0zO0A9MB2n3ma27pMkR8KP2nn40z5dTvdv4OKve61HIohm7xGcEIqMGATCgWiSJAuu4GcMt6Q0xQJgIS3sUQr0KJOu8E-X762Nx8:1nJ3uh:__zcDD6ci7ba9tgzcFu7VzE6FbTtdxEdp_UrljfUqpU	2022-02-26 20:42:55.798553-05
5vhnhnqkvtcq3tqxwd46q4t6vmjtxlsa	.eJxVjDsOwyAQBe9CHSG-ZkmZ3mdACwvBSYQlY1dR7h5bcpG0b2bemwXc1hq2npcwEbsyzS6_W8T0zO0A9MB2n3ma27pMkR8KP2nn40z5dTvdv4OKve61HIohm7xGcEIqMGATCgWiSJAuu4GcMt6Q0xQJgIS3sUQr0KJOu8E-X762Nx8:1nPUGl:wcAv9KlsTqb7NvaWeLJdQqEyiaZ1ndhUpzLWB3DOmZE	2022-03-16 14:04:15.798853-05
\.


--
-- Data for Name: internal_category; Type: TABLE DATA; Schema: public; Owner: inkafarma
--

COPY public.internal_category (id, created_at, name, description, is_active, created_by_id, upper_id) FROM stdin;
1	2022-02-14 13:58:30.234802-05	Mamá y Bebé	Bienvenido al Mundo Infantil\r\n\r\nDescubre y aprovecha los precios más bajos para el cuidado de tu bebé. Todas las semanas tenemos promociones únicas en pañales, fórmulas lácteas, toallas húmedas, vitaminas, accesorios y mucho más.	t	2	\N
2	2022-02-14 13:59:25.856423-05	Cuidado Personal	Todo lo que tú necesitas	t	2	\N
3	2022-02-14 14:00:01.74449-05	Pañales para Bebé	Limpio y seco	t	2	1
4	2022-02-14 14:00:34.721162-05	Toallitas Húmedas	Limpio y hermoso	t	2	1
5	2022-02-14 14:01:24.382676-05	Pañales Talla S	Para los más pequeños del hogar	t	2	3
6	2022-02-14 14:01:43.435704-05	Pañales Talla M	Engreidos de la casa	t	2	3
7	2022-02-14 14:02:11.33754-05	Pañales Talla L	Para quienes ya quieren dar sus primeros pasos	t	2	3
8	2022-02-14 14:08:10.968596-05	Cuidado de la piel	Piel sana y suave	t	2	2
9	2022-02-14 14:09:08.005799-05	Cremas para la piel	Todo tipo de cremas para cuidar y embellecer tu piel	t	2	8
10	2022-02-14 14:09:40.275197-05	Protección Solar	Protégete de los rayos de sol que dañan tu piel	t	2	8
12	2022-03-02 01:14:40.289494-05	Hombre	Productos orientados para hombres	t	2	2
11	2022-03-02 01:13:10.250718-05	Mujer	Productos para la mujer	t	2	2
15	2022-03-02 12:29:26.961916-05	Cat de prueba	ninguna	t	2	\N
16	2022-03-02 12:33:01.176843-05	Cat test	ewgwehgwrh	t	2	\N
\.


--
-- Data for Name: internal_paymentmethod; Type: TABLE DATA; Schema: public; Owner: inkafarma
--

COPY public.internal_paymentmethod (id, created_at, code, name, image, created_by_id) FROM stdin;
3	2022-03-02 15:44:22.403823-05	OHMC	oh! Mastercard	static/images/payment_methods/oh-MC.jpg	2
4	2022-03-02 15:44:46.842465-05	OHVS	oh! Visa Ejemplo	static/images/payment_methods/oh-visa.jpg	2
5	2022-03-02 20:47:05.326786-05	VS	TARJETA VISA	static/images/payment_methods/visa.jpg	2
\.


--
-- Data for Name: internal_product; Type: TABLE DATA; Schema: public; Owner: inkafarma
--

COPY public.internal_product (id, created_at, name, shrot_description, description, contraindications, observations, image, stock, price, offer_price, oh_price, category_id, created_by_id) FROM stdin;
1	2022-02-14 14:52:03.277585-05	Toallas Húmedas Huggies One&Done - Bolsa 184 UN	Pañitos húmedos para bebés con pepino y té verde	Fibras naturales\r\nBolsa de 184 unidades\r\nNSOC72745-16 CO\r\n\r\nHuggies pañales, toallitas húmedas, calzoncitos entrenadores y más para el cuidado de tu bebé. Los productos Huggies fueron especialmente desarrollados para brindarte calidad, higiene y confianza. Disfruta todas las etapas de crecimiento infantil junto a tu bebé, con los productos para el cuidado infantil con Huggies.\r\n\r\nEl mejor cuidado con las Toallitas Húmedas Huggies One & Done\r\nLas Toallitas Húmedas Huggies están diseñadas para el mejor cuidado de tu bebé. Contiene una fórmula con extracto de pepino y té verde, que generan una sensación de frescura. Hecha a base de fibras naturales, suaves como el algodón. Las toallitas húmedas Huggies son hipoalergénicas y no contienen alcohol.	Ninguna.	Mantener fuera del alcance de los niños.	static/images/products/005893L.jpg	100	29.50	28.50	28.00	4	2
\.


--
-- Data for Name: login_user; Type: TABLE DATA; Schema: public; Owner: inkafarma
--

COPY public.login_user (id, password, last_login, email, first_name, last_name, second_last_name, doc_type, doc_number, birthdate, rol, date_joined, is_active) FROM stdin;
3	pbkdf2_sha256$320000$BmJU6bsC6wqP9Gvk9F50HF$rMgs+uS/voY1JBmCfblR4YuBewdVo9MdGhuQ3GZqda8=	2022-03-02 14:04:15.792396-05	admin@inkafarma.com.pe	admin			1		\N	1	2022-02-12 20:42:48.23561-05	t
2	pbkdf2_sha256$320000$SMTjOBDOcqadxSzZRuzeZn$WJ67h1Fl2DSWbJND9lIKjf1KCQ2xPzRt3cTpTVSgE1E=	\N	jochoa@inkafarma.com.pe	jhonatan	ochoa	celis	1	85858585	1996-01-01	1	2022-02-12 20:40:57.517719-05	t
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inkafarma
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inkafarma
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inkafarma
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 64, true);


--
-- Name: client_direction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inkafarma
--

SELECT pg_catalog.setval('public.client_direction_id_seq', 1, true);


--
-- Name: client_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inkafarma
--

SELECT pg_catalog.setval('public.client_order_id_seq', 1, true);


--
-- Name: client_orderdetail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inkafarma
--

SELECT pg_catalog.setval('public.client_orderdetail_id_seq', 1, false);


--
-- Name: client_orderstatus_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inkafarma
--

SELECT pg_catalog.setval('public.client_orderstatus_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inkafarma
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 20, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inkafarma
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 16, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inkafarma
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 29, true);


--
-- Name: internal_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inkafarma
--

SELECT pg_catalog.setval('public.internal_category_id_seq', 17, true);


--
-- Name: internal_paymentmethod_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inkafarma
--

SELECT pg_catalog.setval('public.internal_paymentmethod_id_seq', 5, true);


--
-- Name: internal_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inkafarma
--

SELECT pg_catalog.setval('public.internal_product_id_seq', 1, true);


--
-- Name: login_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inkafarma
--

SELECT pg_catalog.setval('public.login_user_id_seq', 3, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: inkafarma
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: inkafarma
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: inkafarma
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: inkafarma
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: inkafarma
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: inkafarma
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: authtoken_token authtoken_token_pkey; Type: CONSTRAINT; Schema: public; Owner: inkafarma
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);


--
-- Name: authtoken_token authtoken_token_user_id_key; Type: CONSTRAINT; Schema: public; Owner: inkafarma
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);


--
-- Name: client_direction client_direction_pkey; Type: CONSTRAINT; Schema: public; Owner: inkafarma
--

ALTER TABLE ONLY public.client_direction
    ADD CONSTRAINT client_direction_pkey PRIMARY KEY (id);


--
-- Name: client_order client_order_pkey; Type: CONSTRAINT; Schema: public; Owner: inkafarma
--

ALTER TABLE ONLY public.client_order
    ADD CONSTRAINT client_order_pkey PRIMARY KEY (id);


--
-- Name: client_orderdetail client_orderdetail_pkey; Type: CONSTRAINT; Schema: public; Owner: inkafarma
--

ALTER TABLE ONLY public.client_orderdetail
    ADD CONSTRAINT client_orderdetail_pkey PRIMARY KEY (id);


--
-- Name: client_orderstatus client_orderstatus_pkey; Type: CONSTRAINT; Schema: public; Owner: inkafarma
--

ALTER TABLE ONLY public.client_orderstatus
    ADD CONSTRAINT client_orderstatus_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: inkafarma
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: inkafarma
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: inkafarma
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: inkafarma
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: inkafarma
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: internal_category internal_category_pkey; Type: CONSTRAINT; Schema: public; Owner: inkafarma
--

ALTER TABLE ONLY public.internal_category
    ADD CONSTRAINT internal_category_pkey PRIMARY KEY (id);


--
-- Name: internal_paymentmethod internal_paymentmethod_code_key; Type: CONSTRAINT; Schema: public; Owner: inkafarma
--

ALTER TABLE ONLY public.internal_paymentmethod
    ADD CONSTRAINT internal_paymentmethod_code_key UNIQUE (code);


--
-- Name: internal_paymentmethod internal_paymentmethod_pkey; Type: CONSTRAINT; Schema: public; Owner: inkafarma
--

ALTER TABLE ONLY public.internal_paymentmethod
    ADD CONSTRAINT internal_paymentmethod_pkey PRIMARY KEY (id);


--
-- Name: internal_product internal_product_pkey; Type: CONSTRAINT; Schema: public; Owner: inkafarma
--

ALTER TABLE ONLY public.internal_product
    ADD CONSTRAINT internal_product_pkey PRIMARY KEY (id);


--
-- Name: login_user login_user_email_key; Type: CONSTRAINT; Schema: public; Owner: inkafarma
--

ALTER TABLE ONLY public.login_user
    ADD CONSTRAINT login_user_email_key UNIQUE (email);


--
-- Name: login_user login_user_pkey; Type: CONSTRAINT; Schema: public; Owner: inkafarma
--

ALTER TABLE ONLY public.login_user
    ADD CONSTRAINT login_user_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: inkafarma
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: inkafarma
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: inkafarma
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: inkafarma
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: authtoken_token_key_10f0b77e_like; Type: INDEX; Schema: public; Owner: inkafarma
--

CREATE INDEX authtoken_token_key_10f0b77e_like ON public.authtoken_token USING btree (key varchar_pattern_ops);


--
-- Name: client_direction_client_id_352e7aba; Type: INDEX; Schema: public; Owner: inkafarma
--

CREATE INDEX client_direction_client_id_352e7aba ON public.client_direction USING btree (client_id);


--
-- Name: client_order_client_id_27ca4f5f; Type: INDEX; Schema: public; Owner: inkafarma
--

CREATE INDEX client_order_client_id_27ca4f5f ON public.client_order USING btree (client_id);


--
-- Name: client_order_direction_id_aad1146f; Type: INDEX; Schema: public; Owner: inkafarma
--

CREATE INDEX client_order_direction_id_aad1146f ON public.client_order USING btree (direction_id);


--
-- Name: client_order_payment_method_id_f7b465ef; Type: INDEX; Schema: public; Owner: inkafarma
--

CREATE INDEX client_order_payment_method_id_f7b465ef ON public.client_order USING btree (payment_method_id);


--
-- Name: client_orderdetail_order_id_14c4d227; Type: INDEX; Schema: public; Owner: inkafarma
--

CREATE INDEX client_orderdetail_order_id_14c4d227 ON public.client_orderdetail USING btree (order_id);


--
-- Name: client_orderdetail_product_id_97cbd64e; Type: INDEX; Schema: public; Owner: inkafarma
--

CREATE INDEX client_orderdetail_product_id_97cbd64e ON public.client_orderdetail USING btree (product_id);


--
-- Name: client_orderstatus_order_id_39130849; Type: INDEX; Schema: public; Owner: inkafarma
--

CREATE INDEX client_orderstatus_order_id_39130849 ON public.client_orderstatus USING btree (order_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: inkafarma
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: inkafarma
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: inkafarma
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: inkafarma
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: internal_category_created_by_id_16958abf; Type: INDEX; Schema: public; Owner: inkafarma
--

CREATE INDEX internal_category_created_by_id_16958abf ON public.internal_category USING btree (created_by_id);


--
-- Name: internal_category_upper_id_b381411f; Type: INDEX; Schema: public; Owner: inkafarma
--

CREATE INDEX internal_category_upper_id_b381411f ON public.internal_category USING btree (upper_id);


--
-- Name: internal_paymentmethod_code_4e8d4d9d_like; Type: INDEX; Schema: public; Owner: inkafarma
--

CREATE INDEX internal_paymentmethod_code_4e8d4d9d_like ON public.internal_paymentmethod USING btree (code varchar_pattern_ops);


--
-- Name: internal_paymentmethod_created_by_id_2a918e9e; Type: INDEX; Schema: public; Owner: inkafarma
--

CREATE INDEX internal_paymentmethod_created_by_id_2a918e9e ON public.internal_paymentmethod USING btree (created_by_id);


--
-- Name: internal_product_category_id_906fb2c4; Type: INDEX; Schema: public; Owner: inkafarma
--

CREATE INDEX internal_product_category_id_906fb2c4 ON public.internal_product USING btree (category_id);


--
-- Name: internal_product_created_by_id_21983223; Type: INDEX; Schema: public; Owner: inkafarma
--

CREATE INDEX internal_product_created_by_id_21983223 ON public.internal_product USING btree (created_by_id);


--
-- Name: login_user_email_a5f3da64_like; Type: INDEX; Schema: public; Owner: inkafarma
--

CREATE INDEX login_user_email_a5f3da64_like ON public.login_user USING btree (email varchar_pattern_ops);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: inkafarma
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: inkafarma
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: inkafarma
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authtoken_token authtoken_token_user_id_35299eff_fk_login_user_id; Type: FK CONSTRAINT; Schema: public; Owner: inkafarma
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_35299eff_fk_login_user_id FOREIGN KEY (user_id) REFERENCES public.login_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: client_direction client_direction_client_id_352e7aba_fk_login_user_id; Type: FK CONSTRAINT; Schema: public; Owner: inkafarma
--

ALTER TABLE ONLY public.client_direction
    ADD CONSTRAINT client_direction_client_id_352e7aba_fk_login_user_id FOREIGN KEY (client_id) REFERENCES public.login_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: client_order client_order_client_id_27ca4f5f_fk_login_user_id; Type: FK CONSTRAINT; Schema: public; Owner: inkafarma
--

ALTER TABLE ONLY public.client_order
    ADD CONSTRAINT client_order_client_id_27ca4f5f_fk_login_user_id FOREIGN KEY (client_id) REFERENCES public.login_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: client_order client_order_direction_id_aad1146f_fk_client_direction_id; Type: FK CONSTRAINT; Schema: public; Owner: inkafarma
--

ALTER TABLE ONLY public.client_order
    ADD CONSTRAINT client_order_direction_id_aad1146f_fk_client_direction_id FOREIGN KEY (direction_id) REFERENCES public.client_direction(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: client_order client_order_payment_method_id_f7b465ef_fk_internal_; Type: FK CONSTRAINT; Schema: public; Owner: inkafarma
--

ALTER TABLE ONLY public.client_order
    ADD CONSTRAINT client_order_payment_method_id_f7b465ef_fk_internal_ FOREIGN KEY (payment_method_id) REFERENCES public.internal_paymentmethod(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: client_orderdetail client_orderdetail_order_id_14c4d227_fk_client_order_id; Type: FK CONSTRAINT; Schema: public; Owner: inkafarma
--

ALTER TABLE ONLY public.client_orderdetail
    ADD CONSTRAINT client_orderdetail_order_id_14c4d227_fk_client_order_id FOREIGN KEY (order_id) REFERENCES public.client_order(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: client_orderdetail client_orderdetail_product_id_97cbd64e_fk_internal_product_id; Type: FK CONSTRAINT; Schema: public; Owner: inkafarma
--

ALTER TABLE ONLY public.client_orderdetail
    ADD CONSTRAINT client_orderdetail_product_id_97cbd64e_fk_internal_product_id FOREIGN KEY (product_id) REFERENCES public.internal_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: client_orderstatus client_orderstatus_order_id_39130849_fk_client_order_id; Type: FK CONSTRAINT; Schema: public; Owner: inkafarma
--

ALTER TABLE ONLY public.client_orderstatus
    ADD CONSTRAINT client_orderstatus_order_id_39130849_fk_client_order_id FOREIGN KEY (order_id) REFERENCES public.client_order(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: inkafarma
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_login_user_id; Type: FK CONSTRAINT; Schema: public; Owner: inkafarma
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_login_user_id FOREIGN KEY (user_id) REFERENCES public.login_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: internal_category internal_category_created_by_id_16958abf_fk_login_user_id; Type: FK CONSTRAINT; Schema: public; Owner: inkafarma
--

ALTER TABLE ONLY public.internal_category
    ADD CONSTRAINT internal_category_created_by_id_16958abf_fk_login_user_id FOREIGN KEY (created_by_id) REFERENCES public.login_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: internal_category internal_category_upper_id_b381411f_fk_internal_category_id; Type: FK CONSTRAINT; Schema: public; Owner: inkafarma
--

ALTER TABLE ONLY public.internal_category
    ADD CONSTRAINT internal_category_upper_id_b381411f_fk_internal_category_id FOREIGN KEY (upper_id) REFERENCES public.internal_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: internal_paymentmethod internal_paymentmethod_created_by_id_2a918e9e_fk_login_user_id; Type: FK CONSTRAINT; Schema: public; Owner: inkafarma
--

ALTER TABLE ONLY public.internal_paymentmethod
    ADD CONSTRAINT internal_paymentmethod_created_by_id_2a918e9e_fk_login_user_id FOREIGN KEY (created_by_id) REFERENCES public.login_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: internal_product internal_product_category_id_906fb2c4_fk_internal_category_id; Type: FK CONSTRAINT; Schema: public; Owner: inkafarma
--

ALTER TABLE ONLY public.internal_product
    ADD CONSTRAINT internal_product_category_id_906fb2c4_fk_internal_category_id FOREIGN KEY (category_id) REFERENCES public.internal_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: internal_product internal_product_created_by_id_21983223_fk_login_user_id; Type: FK CONSTRAINT; Schema: public; Owner: inkafarma
--

ALTER TABLE ONLY public.internal_product
    ADD CONSTRAINT internal_product_created_by_id_21983223_fk_login_user_id FOREIGN KEY (created_by_id) REFERENCES public.login_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

