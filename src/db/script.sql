CREATE DATABASE citasmedicas;

USE citasmedicas;

CREATE TABLE tipo_documento(
    tipdoc_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    tipdoc_nombre VARCHAR(20) NOT NULL,
    tipdoc_abreviatura VARCHAR(20) NOT NULL
);

CREATE TABLE genero(
    gen_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    gen_nombre VARCHAR(20) NOT NULL,
    gen_abreviatura VARCHAR(20) NOT NULL
);

CREATE TABLE acudiente(
    acu_codigo INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    acu_nombreCompleto VARCHAR(100) NOT NULL,
    acu_telefono VARCHAR(100) NOT NULL,
    acu_direccion VARCHAR(200) DEFAULT NULL
);

CREATE TABLE estado_cita(
    estcita_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    estcita_nombre VARCHAR(20) NOT NULL
);

CREATE TABLE especialidad(
    esp_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    esp_nombre VARCHAR(20) NOT NULL
);

CREATE TABLE consultorio(
    cons_codigo INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    cons_nombre VARCHAR(50) NOT NULL
);

CREATE TABLE medico(
    med_nroMatriculaProsional INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    med_nombreCompleto VARCHAR(100) NOT NULL,
    med_consultorio INT NOT NULL,
    med_especialidad INT NOT NULL,
    Foreign Key (med_consultorio) REFERENCES consultorio(cons_codigo),
    Foreign Key (med_especialidad) REFERENCES especialidad(esp_id)
);

CREATE TABLE usuario(
    usu_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    usu_nombre VARCHAR(50) NOT NULL,
    usu_segdo_nombre VARCHAR(45),
    usu_primer_apellido_usuar VARCHAR(50) NOT NULL,
    usu_segdo_apellido_usuar VARCHAR(50) NOT NULL,
    usu_telefono VARCHAR(50) NOT NULL,
    usu_direccion VARCHAR(100) NOT NULL,
    usu_email VARCHAR(100),
    usu_tipodoc INT NOT NULL,
    usu_genero INT NOT NULL,
    usu_acudiente INT NOT NULL,
    Foreign Key (usu_tipodoc) REFERENCES tipo_documento(tipdoc_id),
    Foreign Key (usu_genero) REFERENCES genero(gen_id),
    Foreign Key (usu_acudiente) REFERENCES acudiente(acu_codigo)
);

CREATE TABLE cita(
    cit_codigo INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    cit_fecha DATE NOT NULL,
    cit_estadoCita INT NOT NULL,
    cit_medico INT NOT NULL,
    cit_datosUsuario INT NOT NULL,
    Foreign Key (cit_estadoCita) REFERENCES estado_cita(estcita_id),
    Foreign Key (cit_medico) REFERENCES medico(med_nroMatriculaProsional),
    Foreign Key (cit_datosUsuario) REFERENCES usuario(usu_id)
);

INSERT INTO tipo_documento (tipdoc_nombre, tipdoc_abreviatura) VALUES
('Cedula', 'CC'),
('extranjeria', 'CE'),
('Pasaporte', 'PA'),
('Tarjeta identidad', 'TI'),
('Registro civil', 'RC');

INSERT INTO genero (gen_nombre, gen_abreviatura) VALUES
('Masculino', 'M'),
('Femenino', 'F');

INSERT INTO acudiente (acu_nombreCompleto, acu_telefono, acu_direccion) VALUES
('Juan Perez', '3105551212', 'Calle 123 # 45-67'),
('Maria Garcia', '3204445656', 'Carrera 56 # 78-90'),
('Pedro Hernandez', '3006667878', 'Diagonal 100 # 200-300'),
('Sofia Rodriguez', '3118889999', 'Avenida 68 # 89-100'),
('Carlos Gomez', '3120001111', 'Calle 200 # 300-400'),
('Laura Ramirez', '3131112222', 'Carrera 300 # 400-500'),
('Luis Fernandez', '3142223333', 'Diagonal 500 # 600-700');

INSERT INTO consultorio (cons_nombre) VALUES
('Consultorio 1'),
('Consultorio 2'),
('Consultorio 3'),
('Consultorio 4'),
('Consultorio 5');

INSERT INTO especialidad (esp_nombre) VALUES
('Pediatría'),
('Dermatología'),
('Oftalmología'),
('Otorrinolaringología');

INSERT INTO estado_cita (estcita_nombre) VALUES
('Programada'),
('Atendida'),
('Cancelada');

INSERT INTO medico (med_nombreCompleto, med_consultorio, med_especialidad) VALUES
('Juan Perez', 1, 1),
('Maria Garcia', 2, 2),
('Pedro Hernandez', 3, 3),
('Sofia Rodriguez', 4, 4),
('Carlos Gomez', 5, 1),
('Laura Ramirez', 1, 1),
('Luis Fernandez', 2, 2),
('Daniela Perez', 3, 3),
('Mariana Garcia', 4, 4),
('Sebastian Hernandez', 5, 1);

INSERT INTO usuario (usu_nombre, usu_segdo_nombre, usu_primer_apellido_usuar, usu_segdo_apellido_usuar, usu_telefono, usu_direccion, usu_email, usu_tipodoc, usu_genero, usu_acudiente) VALUES
('Juan', 'Pérez', 'López', 'García', '3105551212', 'Calle 123 # 45-67', 'juan.perez@gmail.com', 1, 1, 1),
('María', 'Rodríguez', 'Hernández', 'Martínez', '3204445656', 'Carrera 56 # 78-90', 'maria.rodriguez@gmail.com', 2, 2, 2),
('Pedro', 'Sánchez', 'Suárez', 'Quintero', '3006667878', 'Diagonal 100 # 200-300', 'pedro.sanchez@gmail.com', 3, 1, 3),
('Sofía', 'Torres', 'Acosta', 'Muñoz', '3118889999', 'Avenida 68 # 89-100', 'sofia.torres@gmail.com', 4, 2, 4),
('Carlos', 'Guerrero', 'Valencia', 'Castaño', '3120001111', 'Calle 200 # 300-400', 'carlos.guerrero@gmail.com', 1, 1, 1),
('Laura', 'Moreno', 'Díaz', 'Pinzón', '3131112222', 'Carrera 300 # 400-500', 'laura.moreno@gmail.com', 2, 2, 2),
('Luis', 'Flórez', 'Durán', 'Restrepo', '3142223333', 'Diagonal 500 # 600-700', 'luis.flórez@gmail.com', 3, 1, 3),
('Daniela', 'Pacheco', 'Gómez', 'Gómez', '3153334444', 'Avenida 789 # 890-900', 'daniela.pacheco@gmail.com', 4, 2, 4),
('María José', 'Restrepo', 'Hernández', 'Sánchez', '3164445555', 'Calle 900 # 1000-1111', 'maria.jose.restrepo@gmail.com', 1, 1, 1),
('Sofía Andrea', 'Gutiérrez', 'Gutiérrez', 'Gutiérrez', '3175556666', 'Carrera 1000 # 1111-1212', 'sofia.andrea.gutiérrez@gmail.com', 2, 2, 2);

INSERT INTO cita (cit_fecha, cit_estadoCita, cit_medico, cit_datosUsuario) VALUES
('2023-03-08', 1, 1, 1),
('2023-03-15', 2, 2, 2),
('2023-03-22', 3, 3, 3),
('2023-03-29', 1, 4, 4),
('2023-04-05', 2, 5, 5);