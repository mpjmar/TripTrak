CREATE DATABASE planificador_viajes;
USE planificador_viajes;

CREATE TABLE viaje (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100),
  fecha_inicio DATE,
  fecha_fin DATE
);

CREATE TABLE destino (
  id INT AUTO_INCREMENT PRIMARY KEY,
  ciudad VARCHAR(100),
  localidad VARCHAR(100),
  pais VARCHAR(100),
  mapa_destino VARCHAR(255),
  viaje_id INT,
  FOREIGN KEY (viaje_id) REFERENCES viaje(id) 
                          ON DELETE CASCADE
);

CREATE TABLE actividad (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100),
  tipo VARCHAR(100),
  descripcion TEXT,
  duracion INT,
  precio DECIMAL(10, 2),
  localizacion VARCHAR(255),
  mapa_actividad VARCHAR(255),
  fecha DATE,
  hora TIME,
  destino_id INT,
  transporte_id INT,
  FOREIGN KEY (destino_id) REFERENCES destino(id) 
                            ON DELETE CASCADE,
  FOREIGN KEY (transporte_id) REFERENCES transporte(id) 
                            ON DELETE SET NULL
);

CREATE TABLE ruta (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100),
  kilometros DECIMAL(10, 2),
  tiempo_estimado INT,
  descripcion TEXT,
  salida VARCHAR(255),
  llegada VARCHAR(255),
  mapa_salida VARCHAR(255),
  mapa_llegada VARCHAR(255),
  destino_id INT,
  transporte_id INT,
  actividad_id INT,
  FOREIGN KEY (actividad_id) REFERENCES actividad(id) 
                            ON DELETE CASCADE,
  FOREIGN KEY (destino_id) REFERENCES destino(id) 
                            ON DELETE CASCADE,
  FOREIGN KEY (transporte_id) REFERENCES transporte(id) 
                            ON DELETE SET NULL
);

CREATE TABLE visita (
  id INT AUTO_INCREMENT PRIMARY KEY,
  lugar VARCHAR(255),
  descripcion TEXT,
  actividad_id INT,
  FOREIGN KEY (actividad_id) REFERENCES actividad(id) 
                            ON DELETE CASCADE
);

CREATE TABLE excursion (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100),
  descripcion TEXT,
  precio DECIMAL(10, 2),
  actividad_id INT,
  FOREIGN KEY (actividad_id) REFERENCES actividad(id) 
                            ON DELETE CASCADE
);

CREATE TABLE punto_interes (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100),
  descripcion TEXT,
  actividad_id INT,
  FOREIGN KEY (actividad_id) REFERENCES actividad(id) 
                            ON DELETE CASCADE
);

CREATE TABLE alojamiento (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100),
  direccion VARCHAR(255),
  tipo VARCHAR(100),
  precio DECIMAL(10, 2),
  contacto VARCHAR(100),
  destino_id INT,
  FOREIGN KEY (destino_id) REFERENCES destino(id) 
                            ON DELETE CASCADE
);

CREATE TABLE transporte (
  id INT AUTO_INCREMENT PRIMARY KEY,
  tipo VARCHAR(100),
  empresa VARCHAR(100),
  hora_salida TIME,
  hora_llegada TIME,
  duracion INT,
  precio DECIMAL(10, 2),
  destino_id INT,
  FOREIGN KEY (destino_id) REFERENCES destino(id) 
                            ON DELETE CASCADE
);

CREATE TABLE restaurante (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100),
  direccion VARCHAR(255),
  tipo_cocina VARCHAR(100),
  precio DECIMAL(10, 2),
  contacto VARCHAR(100),
  destino_id INT,
  FOREIGN KEY (destino_id) REFERENCES destino(id) 
                            ON DELETE CASCADE
);

CREATE TABLE gasto (
  id INT AUTO_INCREMENT PRIMARY KEY,
  total DECIMAL(10, 2),
  concepto VARCHAR(255),
  viaje_id INT,
  FOREIGN KEY (viaje_id) REFERENCES viaje(id) 
                          ON DELETE CASCADE
);

CREATE TABLE nota (
  id INT AUTO_INCREMENT PRIMARY KEY,
  tema VARCHAR(100),
  contenido TEXT,
  fecha DATE,
  viaje_id INT,
  FOREIGN KEY (viaje_id) REFERENCES viaje(id) 
                          ON DELETE CASCADE
);

CREATE TABLE usuario (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  password VARCHAR(255) NOT NULL
);
