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
