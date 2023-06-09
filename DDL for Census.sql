-- This script was generated by the ERD tool in pgAdmin 4.
-- Please log an issue at https://redmine.postgresql.org/projects/pgadmin4/issues/new if you find any bugs, including reproduction steps.
BEGIN;


CREATE TABLE IF NOT EXISTS public.housing
(
    id_housing numeric NOT NULL,
    code character varying(2) COLLATE pg_catalog."default" NOT NULL,
    occupients numeric NOT NULL,
    amount numeric NOT NULL,
    CONSTRAINT pk_housing PRIMARY KEY (id_housing)
);

CREATE TABLE IF NOT EXISTS public.states
(
    code character varying(2) COLLATE pg_catalog."default" NOT NULL,
    state character varying(40) COLLATE pg_catalog."default" NOT NULL,
    population numeric NOT NULL,
    CONSTRAINT states_pkey PRIMARY KEY (code)
);

CREATE TABLE IF NOT EXISTS public.age
(
    id_age numeric NOT NULL,
    code character varying(2) COLLATE pg_catalog."default" NOT NULL,
    age_min numeric NOT NULL,
    age_max numeric NOT NULL,
    population numeric NOT NULL,
    CONSTRAINT pk_age PRIMARY KEY (id_age)
);

CREATE TABLE IF NOT EXISTS public.profiles
(
    id_profile numeric NOT NULL,
    code character varying(2) COLLATE pg_catalog."default" NOT NULL,
    fk_age numeric NOT NULL,
    fk_housing numeric NOT NULL,
    fk_marital numeric NOT NULL,
    fk_sex numeric NOT NULL,
    fk_income numeric NOT NULL,
    CONSTRAINT profiles_pkey PRIMARY KEY (id_profile)
);

CREATE TABLE IF NOT EXISTS public.income
(
    id_income numeric NOT NULL,
    code character varying(2) COLLATE pg_catalog."default" NOT NULL,
    income_min numeric NOT NULL,
    income_max numeric NOT NULL,
    population numeric NOT NULL,
    CONSTRAINT income_pkey PRIMARY KEY (id_income)
);

CREATE TABLE IF NOT EXISTS public.marital
(
    id_marital numeric NOT NULL,
    code character varying(2) COLLATE pg_catalog."default" NOT NULL,
    status character varying(30) COLLATE pg_catalog."default" NOT NULL,
    population numeric NOT NULL,
    CONSTRAINT marital_pkey PRIMARY KEY (id_marital)
);

CREATE TABLE IF NOT EXISTS public.sex
(
    id_sex numeric NOT NULL,
    code character varying(2) COLLATE pg_catalog."default" NOT NULL,
    category character varying(30) COLLATE pg_catalog."default" NOT NULL,
    population numeric NOT NULL,
    CONSTRAINT sex_pkey PRIMARY KEY (id_sex)
);

CREATE TABLE IF NOT EXISTS public.seguros
(
    id_variante numeric NOT NULL,
    id_profile numeric NOT NULL,
    code character varying(2) COLLATE pg_catalog."default" NOT NULL,
    "StandardComponentId" character varying COLLATE pg_catalog."default",
    "PlanId" character varying COLLATE pg_catalog."default",
    "Age" numeric,
    "Rate" double precision,
    "Rate_category" character varying COLLATE pg_catalog."default",
    "Income_monthly" double precision,
    income_anualy double precision,
    "IssuerMarketPlaceMarketingName" character varying COLLATE pg_catalog."default",
    "MarketCoverage" character varying COLLATE pg_catalog."default",
    "PlanType" character varying COLLATE pg_catalog."default",
    "MetalLevel" character varying COLLATE pg_catalog."default",
    "QHPNonQHPTypeId" character varying COLLATE pg_catalog."default",
    "IsNoticeRequiredForPregnancy" character varying COLLATE pg_catalog."default",
    "IsReferralRequiredForSpecialist" character varying COLLATE pg_catalog."default",
    "ChildOnlyOffering" character varying COLLATE pg_catalog."default",
    "DiseaseManagementProgramsOffered" character varying COLLATE pg_catalog."default",
    "PlanExpirationDate" character varying COLLATE pg_catalog."default",
    "OutOfCountryCoverage" character varying COLLATE pg_catalog."default",
    "SBCHavingaBabyDeductible" character varying COLLATE pg_catalog."default",
    "SBCHavingDiabetesDeductible" character varying COLLATE pg_catalog."default",
    "SBCHavingSimplefractureDeductible" character varying COLLATE pg_catalog."default",
    "BeginPrimaryCareCostSharingAfterNumberOfVisits" character varying COLLATE pg_catalog."default",
    "MaximumUnderageDependent" character varying COLLATE pg_catalog."default",
    "DependentMaximumAgRule" character varying COLLATE pg_catalog."default",
    "EssecialsBenfits" character varying COLLATE pg_catalog."default",
    "NoEssecialsBenefits" character varying COLLATE pg_catalog."default",
    CONSTRAINT seguros_pkey PRIMARY KEY (id_variante)
);

ALTER TABLE IF EXISTS public.housing
    ADD CONSTRAINT fk_states_housing FOREIGN KEY (code)
    REFERENCES public.states (code) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.age
    ADD CONSTRAINT fk_state_age FOREIGN KEY (code)
    REFERENCES public.states (code) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.profiles
    ADD CONSTRAINT fk_profile_age FOREIGN KEY (fk_age)
    REFERENCES public.age (id_age) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.profiles
    ADD CONSTRAINT fk_profile_housing FOREIGN KEY (fk_housing)
    REFERENCES public.housing (id_housing) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.profiles
    ADD CONSTRAINT fk_profile_income FOREIGN KEY (fk_income)
    REFERENCES public.income (id_income) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.profiles
    ADD CONSTRAINT fk_profile_marital FOREIGN KEY (fk_marital)
    REFERENCES public.marital (id_marital) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.profiles
    ADD CONSTRAINT fk_profile_sex FOREIGN KEY (fk_sex)
    REFERENCES public.sex (id_sex) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.profiles
    ADD CONSTRAINT fk_state_profile FOREIGN KEY (code)
    REFERENCES public.states (code) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.income
    ADD CONSTRAINT fk_states_income FOREIGN KEY (code)
    REFERENCES public.states (code) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.marital
    ADD CONSTRAINT fk_states_marital FOREIGN KEY (code)
    REFERENCES public.states (code) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.sex
    ADD CONSTRAINT fk_states_sex FOREIGN KEY (code)
    REFERENCES public.states (code) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.seguros
    ADD CONSTRAINT df_seguros_profiles FOREIGN KEY (id_profile)
    REFERENCES public.profiles (id_profile) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.seguros
    ADD CONSTRAINT fk_state_seguros FOREIGN KEY (code)
    REFERENCES public.states (code) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;

END;