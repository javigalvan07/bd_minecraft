DROP DATABASE IF EXISTS bd_minecraft;
CREATE DATABASE bd_minecraft;
USE bd_minecraft;

CREATE TABLE servidores (
id_servidor INT NOT NULL,
nombre VARCHAR(15) NOT NULL,
direccion_ip VARCHAR(20) NOT NULL,
ubicacion VARCHAR(15) NOT NULL,
n_max_jugadores INT NOT NULL,
PRIMARY KEY (id_servidor)
);

CREATE TABLE jugadores (
id_jugador INT NOT NULL,
nombre VARCHAR(15) NOT NULL,
nivel VARCHAR(15) NOT NULL,
conectado BOOLEAN NOT NULL,
id_servidor INT NOT NULL,
PRIMARY KEY (id_jugador)
);

CREATE TABLE inventario (
id_inventario INT NOT NULL,
capacidad VARCHAR(30) NOT NULL,
id_jugador INT NOT NULL,
PRIMARY KEY (id_inventario)
);

CREATE TABLE objetos (
id_objeto INT NOT NULL,
nombre VARCHAR(30) NOT NULL,
durabilidad INT NOT NULL,
tipo VARCHAR(15) NOT NULL,
id_inventario INT NOT NULL,
PRIMARY KEY (id_objeto)
);

CREATE TABLE mundos (
id_mundo INT NOT NULL,
nombre VARCHAR(30) NOT NULL,
semilla INT NOT NULL,
nivel_dificultad VARCHAR(15) NOT NULL,
tipo VARCHAR(30) NOT NULL,
PRIMARY KEY (id_mundo)
);

CREATE TABLE tipo_mundo (
id_mundo INT NOT NULL,
tipo_mundo VARCHAR(15) NOT NULL,
PRIMARY KEY (id_mundo)
);

CREATE TABLE mobs (
id_mob INT NOT NULL,
nombre VARCHAR(15) NOT NULL,
vida INT NOT NULL,
comportamiento VARCHAR(15) NOT NULL,
tipo VARCHAR(15) NOT NULL,
PRIMARY KEY (id_mob)
);

CREATE TABLE biomas (
id_bioma INT NOT NULL,
nombre VARCHAR(30) NOT NULL,
tipo VARCHAR(15) NOT NULL,
PRIMARY KEY (id_bioma)
);

CREATE TABLE tipo_bioma (
id_bioma INT NOT NULL,
tipo_bioma VARCHAR(15) NOT NULL,
PRIMARY KEY (id_bioma)
);

CREATE TABLE bloques (
id_bloque INT NOT NULL,
dureza INT NOT NULL,
herramienta VARCHAR(15) NOT NULL,
tipo VARCHAR(15) NOT NULL,
PRIMARY KEY (id_bloque)
);

CREATE TABLE jugadores_mundos (
id_jugador INT NOT NULL,
id_mundo INT NOT NULL,
PRIMARY KEY (id_jugador, id_mundo)
);

CREATE TABLE mundos_mobs (
id_mundo INT NOT NULL,
id_mob INT NOT NULL,
PRIMARY KEY (id_mundo, id_mob)
);

CREATE TABLE mundos_biomas (
id_mundo INT NOT NULL,
id_bioma INT NOT NULL,
PRIMARY KEY (id_mundo, id_bioma)
);

CREATE TABLE mundos_bloques (
id_mundo INT NOT NULL,
id_bloque INT NOT NULL,
PRIMARY KEY (id_mundo, id_bloque)
);

ALTER TABLE jugadores
ADD CONSTRAINT fk_servidor1 FOREIGN KEY (id_servidor) REFERENCES servidores (id_servidor);

ALTER TABLE inventario
ADD CONSTRAINT fk_jugador1 FOREIGN KEY (id_jugador) REFERENCES jugadores (id_jugador);

ALTER TABLE objetos
ADD CONSTRAINT fk_inventario1 FOREIGN KEY (id_inventario) REFERENCES inventario (id_inventario);

ALTER TABLE jugadores_mundos
ADD CONSTRAINT fk_jugador2 FOREIGN KEY (id_jugador) REFERENCES jugadores (id_jugador),
ADD CONSTRAINT fk_mundo1 FOREIGN KEY (id_mundo) REFERENCES mundos (id_mundo);

ALTER TABLE mundos_mobs
ADD CONSTRAINT fk_mundo2 FOREIGN KEY (id_mundo) REFERENCES mundos (id_mundo),
ADD CONSTRAINT fk_mob1 FOREIGN KEY (id_mob) REFERENCES mobs (id_mob);

ALTER TABLE mundos_biomas
ADD CONSTRAINT fk_mundo3 FOREIGN KEY (id_mundo) REFERENCES mundos (id_mundo),
ADD CONSTRAINT fk_bioma1 FOREIGN KEY (id_bioma) REFERENCES biomas (id_bioma);

ALTER TABLE mundos_bloques
ADD CONSTRAINT fk_mundo4 FOREIGN KEY (id_mundo) REFERENCES mundos (id_mundo),
ADD CONSTRAINT fk_bloque1 FOREIGN KEY (id_bloque) REFERENCES bloques (id_bloque);

ALTER TABLE tipo_mundo
ADD CONSTRAINT fk_mundo5 FOREIGN KEY (id_mundo) REFERENCES mundos (id_mundo);

ALTER TABLE tipo_bioma
ADD CONSTRAINT fk_bioma2 FOREIGN KEY (id_bioma) REFERENCES biomas (id_bioma);

INSERT INTO servidores (id_servidor, nombre, direccion_ip, ubicacion, n_max_jugadores) VALUES
(1, 'Servidor1', '192.168.1.1', 'España', 50),
(2, 'Servidor2', '192.168.1.2', 'Estados Unidos', 100),
(3, 'Servidor3', '192.168.1.3', 'Francia', 75),
(4, 'Servidor4', '192.168.1.4', 'Reino Unido', 80),
(5, 'Servidor5', '192.168.1.5', 'Australia', 60);

INSERT INTO jugadores (id_jugador, nombre, nivel, conectado, id_servidor) VALUES
(1, 'Marc Cardona', 'Nivel 10', true, 1),
(2, 'Jonthan Viera', 'Nivel 5', false, 2),
(3, 'Pedri González', 'Nivel 3', true, 3),
(4, 'Alberto Moleiro', 'Nivel 8', false, 4),
(5, 'Pejiño', 'Nivel 12', true, 5);

INSERT INTO inventario (id_inventario, capacidad, id_jugador) VALUES
(1, '100 espacios', 1),
(2, '50 espacios', 2),
(3, '75 espacios', 3),
(4, '80 espacios', 4),
(5, '60 espacios', 5);

INSERT INTO objetos (id_objeto, nombre, durabilidad, tipo, id_inventario) VALUES
(1, 'Espada de diamante', 200, 'Arma', 1),
(2, 'Pico de Hierro', 250, 'Herramienta', 2),
(3, 'Hacha de Madera', 300, 'Herramienta', 3),
(4, 'Pala de Piedra', 150, 'Herramienta', 4),
(5, 'Arco de Oro', 180, 'Arma', 5);

INSERT INTO mundos (id_mundo, nombre, semilla, nivel_dificultad, tipo) VALUES
(1, 'Mundo Predeterminado', 1234, 'Dificil', 'Mundo Normal'),
(2, 'Mundo de Cuevas', 5678, 'Normal', 'Mundo Ampliado'),
(3, 'Mundo de Islas', 9101, 'Facil', 'Mundo Hardcore'),
(4, 'Mundo de Nieve', 1121, 'Dificil', 'Mundo Superplano'),
(5, 'Mundo de Islas', 3141, 'Normal', 'Mundo Ampliado');

INSERT INTO tipo_mundo (id_mundo, tipo_mundo) VALUES
(1, 'Creativo'),
(2, 'Supervivencia'),
(3, 'Aventura'),
(4, 'Supervivencia'),
(5, 'Creativo');

INSERT INTO mobs (id_mob, nombre, vida, tipo, comportamiento) VALUES
(1, 'Creeper', 20, 'Agresivo', 'Explosivo'),
(2, 'Zombie', 20, 'Agresivo', 'No muerto'),
(3, 'Esqueleto', 20, 'Agresivo', 'No muerto'),
(4, 'Enderman', 40, 'Neutral', 'Teletransporte'),
(5, 'Araña', 16, 'Agresivo', 'Veneno');

INSERT INTO biomas (id_bioma, nombre, tipo) VALUES
(1, 'Bosque', 'Templado'),
(2, 'Desierto', 'Cálido'),
(3, 'Océano', 'Húmedo'),
(4, 'Tundra', 'Frio'),
(5, 'Jungla', 'Tropical');

INSERT INTO tipo_bioma (id_bioma, tipo_bioma) VALUES
(1, 'Bosque'),
(2, 'Desierto'),
(3, 'Oceánico'),
(4, 'Frío'),
(5, 'Tropical');

INSERT INTO bloques (id_bloque, dureza, herramienta, tipo) VALUES
(1, 3, 'Pico', 'Oro'),
(2, 5, 'Pico', 'Diamante'),
(3, 0, 'Manos', 'Planta'),
(4, 3, 'Pico', 'Oro'),
(5, 2, 'Hacha', 'Madera');

INSERT INTO jugadores_mundos (id_jugador, id_mundo) VALUES
(1, 1),
(2, 3),
(3, 5),
(4, 4),
(5, 2);

INSERT INTO mundos_mobs (id_mundo, id_mob) VALUES
(1, 5),
(1, 4),
(2, 3),
(3, 2),
(3, 1);

INSERT INTO mundos_biomas (id_mundo, id_bioma) VALUES
(1, 3),
(1, 2),
(2, 1),
(3, 5),
(3, 4);

INSERT INTO mundos_bloques (id_mundo, id_bloque) VALUES
(1, 2),
(1, 1),
(2, 3),
(3, 4),
(3, 5);