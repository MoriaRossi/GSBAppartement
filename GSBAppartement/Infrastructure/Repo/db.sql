CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE personne (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    prenom VARCHAR(35) NOT NULL,
    nom VARCHAR(35) NOT NULL,
    adresse VARCHAR(75) UNIQUE NOT NULL,
    ville VARCHAR(25),
    code_postal VARCHAR(5),
    tel VARCHAR(11)
);

CREATE TABLE client (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    id_personne UUID NOT NULL UNIQUE REFERENCES personne(id)
);

CREATE TABLE proprietaire (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    id_personne UUID NOT NULL UNIQUE REFERENCES personne(id)
);

CREATE TABLE arrondissement (
    id INTEGER SERIAL PRIMARY KEY,
    libelle VARCHAR(25) NOT NULL
);

CREATE TABLE appartement (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    type_appart VARCHAR(50) NOT NULL,
    prix_loc DECIMAL(10,2) NOT NULL,
    prix_charge DECIMAL(10,2) NOT NULL,
    adresse VARCHAR(75) UNIQUE NOT NULL,
    ville VARCHAR(25),
    code_postal VARCHAR(5),
    etage VARCHAR(2),
    avec_ascenseur BOOLEAN NOT NULL,
    avec_preavis BOOLEAN NOT NULL,
    date_libre DATE,
    id_proprietaire UUID NOT NULL REFERENCES proprietaire(id),
    id_arrondissement INTEGER NOT NULL REFERENCES arrondissement(id)
);


CREATE TABLE locataire (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    id_personne UUID NOT NULL UNIQUE REFERENCES personne(id),
    rib VARCHAR(34) NOT NULL,
    id_appartement UUID REFERENCES appartement(id)
);

CREATE TABLE demande (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    id_client UUID NOT NULL REFERENCES client(id),
    id_appartement UUID UNIQUE NOT NULL REFERENCES appartement(id)
);