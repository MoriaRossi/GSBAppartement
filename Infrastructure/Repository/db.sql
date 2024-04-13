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
    id SERIAL PRIMARY KEY,
    libelle VARCHAR(25) NOT NULL
);

CREATE TABLE appartement (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    type_appart VARCHAR(50) NOT NULL,
    nbr_chambre INTEGER NOT NULL,
    colocation BOOLEAN NOT NULL,
    prix_loc DECIMAL(10,2) NOT NULL,
    prix_charge DECIMAL(10,2) NOT NULL,
    adresse VARCHAR(75) UNIQUE NOT NULL,
    ville VARCHAR(25),
    code_postal VARCHAR(7),
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

CREATE TABLE colocation (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    id_appartement UUID NOT NULL REFERENCES appartement(id),
    id_locataire UUID NOT NULL REFERENCES locataire(id)
);


INSERT INTO arrondissement (libelle) VALUES ('Le-Plateau Mont-Royal');
INSERT INTO arrondissement (libelle) VALUES ('Rosemont–La Petite-Patrie');
INSERT INTO arrondissement (libelle) VALUES ('Ville-Marie');
INSERT INTO arrondissement (libelle) VALUES ('Villeray–Saint-Michel');
INSERT INTO arrondissement (libelle) VALUES ('Hochelaga-Maisonneuve');

INSERT INTO personne (prenom, nom, adresse, ville, code_postal, tel) VALUES ('Jean', 'Dupont', '123 rue Saint-Denis', 'Montigny', '78000', '0606060606');
INSERT INTO personne (prenom, nom, adresse, ville, code_postal, tel) VALUES ('Marie', 'Lefebvre', '456 rue Sherbrooke', 'Paris', '75000', '0707070707');
INSERT INTO personne (prenom, nom, adresse, ville, code_postal, tel) VALUES ('Pierre', 'Martin', '789 rue Sherbrooke', 'Paris', '75000', '0808080808');

INSERT INTO proprietaire (id_personne) VALUES ((SELECT id FROM personne WHERE nom = 'Dupont'));
INSERT INTO proprietaire (id_personne) VALUES ((SELECT id FROM personne WHERE nom = 'Martin'));

INSERT INTO appartement (type_appart, nbr_chambre,colocation, prix_loc, prix_charge, adresse, ville, code_postal, etage, avec_ascenseur, avec_preavis, date_libre, id_proprietaire, id_arrondissement)
VALUES (
    'Studio',
    1,
    true,
    750,
    50,
    '123 rue Saint-Denis',
    'Montréal',
    '78000',
    '2',
    true,
    true,
    '2023-03-01',
    (SELECT id FROM proprietaire WHERE id_personne = (SELECT id FROM personne WHERE nom = 'Dupont')),
    (SELECT id FROM arrondissement WHERE id = '1')
);


INSERT INTO appartement (type_appart, nbr_chambre, colocation, prix_loc, prix_charge, adresse, ville, code_postal, etage, avec_ascenseur, avec_preavis, date_libre, id_proprietaire, id_arrondissement)
VALUES (
    '5 1/2',
    3,
    true,
    1800,
    100,
    '1234 rue Saint-Laurent',
    'Montréal',
    'H2X 2S5',
    '4',
    true,
    true,
    '2023-05-01',
    (SELECT id FROM proprietaire WHERE id_personne = (SELECT id FROM personne WHERE nom = 'Dupont')),
    (SELECT id FROM arrondissement WHERE id = '2')
);

INSERT INTO appartement (type_appart, nbr_chambre, colocation, prix_loc, prix_charge, adresse, ville, code_postal, etage, avec_ascenseur, avec_preavis, date_libre, id_proprietaire, id_arrondissement)
VALUES (
    '4 1/2',
    2,
    false,
    1500,
    80,
    '5678 rue Saint-Denis',
    'Montréal',
    'H2S 2R1',
    '2',
    false,
    true,
    '2023-04-15',
    (SELECT id FROM proprietaire WHERE id_personne = (SELECT id FROM personne WHERE nom = 'Martin')),
    (SELECT id FROM arrondissement WHERE id = '2')
);

INSERT INTO appartement (type_appart, nbr_chambre, colocation, prix_loc, prix_charge, adresse, ville, code_postal, etage, avec_ascenseur, avec_preavis, date_libre, id_proprietaire, id_arrondissement)
VALUES (
    '3 1/2',
    1,
    true,
    1200,
    70,
    '9101 avenue du Parc',
    'Montréal',
    'H2N 1Y5',
    '1',
    false,
    false,
    '2023-03-15',
    (SELECT id FROM proprietaire WHERE id_personne = (SELECT id FROM personne WHERE nom = 'Dupont')),
    (SELECT id FROM arrondissement WHERE id = '3')
);

INSERT INTO appartement (type_appart, nbr_chambre, colocation, prix_loc, prix_charge, adresse, ville, code_postal, etage, avec_ascenseur, avec_preavis, date_libre, id_proprietaire, id_arrondissement)
VALUES (
    '2 1/2',
    0,
    false,
    800,
    50,
    '3333 rue Ontario',
    'Montréal',
    'H2K 1X1',
    '3',
    true,
    false,
    '2023-02-01',
    (SELECT id FROM proprietaire WHERE id_personne = (SELECT id FROM personne WHERE nom = 'Martin')),
    (SELECT id FROM arrondissement WHERE id = '4')
);
