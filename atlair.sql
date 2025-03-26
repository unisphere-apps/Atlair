-- Table des annonces
CREATE TABLE atl_annonces (
    annonce_id INT AUTO_INCREMENT PRIMARY KEY,
    conducteur_id INT,
    depart VARCHAR(100),
    destination VARCHAR(100),
    date_heure DATETIME,
    places_disponibles INT,
    prix FLOAT,
    statut ENUM('ouverte', 'fermée', 'annulée') DEFAULT 'ouverte',
    FOREIGN KEY (conducteur_id) REFERENCES user(id_user)
);

-- Table des réservations
CREATE TABLE atl_reservations (
    reservation_id INT AUTO_INCREMENT PRIMARY KEY,
    annonce_id INT,
    passager_id INT,
    statut ENUM('en attente', 'confirmée', 'annulée') DEFAULT 'en attente',
    date_reservation DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (annonce_id) REFERENCES atl_annonces(annonce_id),
    FOREIGN KEY (passager_id) REFERENCES user(id_user)
);

-- Table des passagers par annonce
CREATE TABLE atl_passagers_par_annonce (
    id INT AUTO_INCREMENT PRIMARY KEY,
    annonce_id INT,
    passager_id INT,
    FOREIGN KEY (annonce_id) REFERENCES atl_annonces(annonce_id),
    FOREIGN KEY (passager_id) REFERENCES user(id_user)
);

-- Table des trajets (historique)
CREATE TABLE atl_trajets (
    trajet_id INT AUTO_INCREMENT PRIMARY KEY,
    annonce_id INT,
    conducteur_id INT,
    passager_id INT,
    date_effective DATETIME,
    FOREIGN KEY (annonce_id) REFERENCES atl_annonces(annonce_id),
    FOREIGN KEY (conducteur_id) REFERENCES user(id_user),
    FOREIGN KEY (passager_id) REFERENCES user(id_user)
);

-- Table des évaluations
CREATE TABLE atl_evaluations (
    evaluation_id INT AUTO_INCREMENT PRIMARY KEY,
    conducteur_id INT,
    auteur_id INT,
    note INT CHECK (note >= 1 AND note <= 5),
    commentaire TEXT,
    date_evaluation DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (conducteur_id) REFERENCES user(id_user),
    FOREIGN KEY (auteur_id) REFERENCES user(id_user)
);
