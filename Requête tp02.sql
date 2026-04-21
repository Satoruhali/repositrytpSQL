-- apprenant: WASSIM_HALITIM
-- equipe: A|B|C|solo
-- seed-w13: 2026-04-20


CREATE DATABASE bibliotheque_w12
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

USE bibliotheque_w12_rattrapage;

CREATE TABLE auteurs (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  nom VARCHAR(120) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE utilisateurs (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  nom VARCHAR(120) NOT NULL,
  email VARCHAR(255) NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT uq_utilisateurs_email UNIQUE (email)
);

CREATE TABLE livres (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  titre VARCHAR(255) NOT NULL,
  genre VARCHAR(80) NOT NULL,
  annee_publication SMALLINT UNSIGNED NOT NULL,
  auteur_id INT UNSIGNED NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_livres_auteur
    FOREIGN KEY (auteur_id) REFERENCES auteurs (id)
);

CREATE TABLE emprunts (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  user_id INT UNSIGNED NOT NULL,
  livre_id INT UNSIGNED NOT NULL,
  date_emprunt DATE NOT NULL,
  date_retour DATE NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_emprunts_user FOREIGN KEY (user_id) REFERENCES utilisateurs (id),
  CONSTRAINT fk_emprunts_livre FOREIGN KEY (livre_id) REFERENCES livres (id)
);

INSERT INTO auteurs (nom) VALUES
  ('Hugo'),
  ('Camus'),
  ('Verne'),
  ('Asimov'),
  ('Le Guin');

INSERT INTO utilisateurs (nom, email) VALUES
  ('Dupont', 'jean.dupont@example.com'),
  ('Martin', 'marie.martin@example.com'),
  ('Durand', 'paul.durand@example.com'),
  ('Bernard', 'sophie.bernard@example.com'),
  ('Rousseau', 'lucie.rousseau@example.com');

INSERT INTO livres (titre, genre, annee_publication, auteur_id) VALUES
  ('Les Misérables', 'Roman', 1862, 1),
  ('L''Étranger', 'Roman', 1942, 2),
  ('La Peste', 'Roman', 1947, 2),
  ('La Chute', 'Roman', 1956, 2),
  ('Voyage au centre de la Terre', 'Roman', 1864, 3),
  ('Vingt mille lieues sous les mers', 'Science-fiction', 1870, 3),
  ('De la Terre à la Lune', 'Science-fiction', 1865, 3),
  ('Fondation', 'Science-fiction', 1951, 4),
  ('Les Robots', 'Science-fiction', 1951, 4),
  ('La Main gauche de la nuit', 'Science-fiction', 1969, 5),
  ('Les Contemplations', 'Poésie', 1856, 1),
  ('L''Homme révolté', 'Essai', 1951, 2),
  ('Une vie', 'Roman', 2020, NULL),
  ('Sans titre', 'Roman', 2021, NULL),
  ('Les Feuilles d''automne', 'Poésie', 1831, 1);


INSERT INTO emprunts (id, user_id, livre_id, date_emprunt, date_retour) VALUES
  (1, 1, 1, '2024-01-15', NULL),
  (2, 1, 2, '2024-02-01', '2024-02-20'),
  (3, 1, 3, '2024-03-01', '2024-03-10'),
  (4, 2, 4, '2024-01-20', NULL),
  (5, 2, 5, '2024-04-01', '2024-04-15'),
  (6, 3, 6, '2024-02-10', '2024-02-28'),
  (7, 3, 7, '2024-05-01', NULL),
  (8, 4, 8, '2024-03-15', '2024-04-01'),
  (9, 4, 9, '2024-04-10', NULL),
  (10, 2, 10, '2024-06-01', '2024-06-15'),
  (11, 1, 11, '2024-07-01', '2024-07-15'),
  (12, 3, 12, '2024-08-01', NULL);


SELECT l.titre , a.nom AS auteur 
FROM livres l
INNER JOIN auteurs a ON l.auteur_id = a.id ;

SELECT l.titre , a.nom AS auteur
 FROM livres l 
 LEFT JOIN auteurs a ON l.auteur_id = a.id;
 
 SELECT  l.titre , a.nom AS auteur
 FROM livres l 
LEFT JOIN auteurs a ON l.auteur_id = a.id 
 WHERE a.id IS NOT NULL ;
 
 
SELECT u.nom AS utilisateur,
 l.titre AS livre ,
  e.date_emprunt , e.date_retour 
FROM emprunts e
INNER JOIN  utilisateurs u ON  e.user_id = u.id
INNER JOIN  livres l ON e.livre_id = l.id; 
 
 SELECT l.titre , l.genre 
 FROM livres l 
 LEFT JOIN emprunts e ON l.id = e.livre_id
 WHERE e.id IS NULL ;
 
  
