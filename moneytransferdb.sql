SET SEARCH_PATH TO moneytransfer;

CREATE TABLE moneytransfer.user (
                id INTEGER NOT NULL,
                firstname VARCHAR(70) NOT NULL,
                lastname VARCHAR(50) NOT NULL,
                email VARCHAR(50) NOT NULL,
                password VARCHAR(100) NOT NULL,
                balance DOUBLE PRECISION NOT NULL,
                CONSTRAINT user_pk PRIMARY KEY (id)
);


CREATE TABLE moneytransfer.connection (
                main_user INTEGER NOT NULL,
                connected_user INTEGER NOT NULL
);


CREATE TABLE moneytransfer.transaction (
                transaction_id INTEGER NOT NULL,
                amount DOUBLE PRECISION NOT NULL,
                description VARCHAR(300),
                sender INTEGER NOT NULL,
                beneficiary INTEGER NOT NULL,
                CONSTRAINT transaction_pk PRIMARY KEY (transaction_id)
);

ALTER DEFAULT PRIVILEGES IN SCHEMA moneytransfer GRANT ALL ON TABLES TO admin_moneytransfer;

ALTER TABLE moneytransfer.transaction ADD CONSTRAINT user_transaction_fk
FOREIGN KEY (sender)
REFERENCES moneytransfer.user (id)
ON DELETE CASCADE
ON UPDATE CASCADE
NOT DEFERRABLE;

ALTER TABLE moneytransfer.transaction ADD CONSTRAINT user_transaction_fk1
FOREIGN KEY (beneficiary)
REFERENCES moneytransfer.user (id)
ON DELETE CASCADE
ON UPDATE CASCADE
NOT DEFERRABLE;

ALTER TABLE moneytransfer.connection ADD CONSTRAINT user_connection_fk
FOREIGN KEY (main_user)
REFERENCES moneytransfer.user (id)
ON DELETE CASCADE
ON UPDATE CASCADE
NOT DEFERRABLE;

ALTER TABLE moneytransfer.connection ADD CONSTRAINT user_connection_fk1
FOREIGN KEY (connected_user)
REFERENCES moneytransfer.user (id)
ON DELETE CASCADE
ON UPDATE CASCADE
NOT DEFERRABLE;


INSERT INTO moneytransfer.user VALUES
   (1, 'Marc','Dossou','mdossou@gmail.com',md5('pass1'),0.0),
   (2, 'Franck','Finagnon','ffinagnon@outlook.com',md5('pass2'),0.0),
   (3, 'Iris','Beaudelaire','ibeaudelaire@yahoo.com',md5('pass3'),0.0),
   (4, 'Paul','Bio','pbio@gmail.com',md5('pass4'),0.0),
   (5, 'Hossou','Hessou','hhessou@live.com',md5('pass5'),0.0);

INSERT INTO moneytransfer.transaction VALUES
   (1, 2000, 'Transfert au compte Marc', 1, 1),
   (2, 200, 'Paiement à Paul', 1, 4),
   (3, 500, 'Transfert au compte Paul', 4, 4),
   (4, 1200, 'Transfert au Hossou', 5,5),
   (5, 300, 'Paiement à Iris', 5, 3); 
