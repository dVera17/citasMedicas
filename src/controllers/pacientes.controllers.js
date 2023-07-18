import getConn from "../db/database.js";

const getAllUsersAlphabe = (req, res) => {
    try {
        const conn = getConn();
        conn.query(`SELECT * FROM usuario ORDER BY usu_nombre ASC`, (err, data, fields) => {
            if(err) console.log(err);
            res.json(data);
        });
    } catch (error) {
        res.status(500).send(error);
    }
}

const findNextCitation = (req, res) => {
    try {
        const conn = getConn();
        const { id_user } = req.params;
        conn.query(`SELECT u.usu_id, u.usu_nombre, u.usu_segdo_nombre, u.usu_primer_apellido_usuar, (SELECT c.cit_fecha FROM cita c ORDER BY c.cit_fecha ASC LIMIT 1) as "Proxima cita" FROM usuario u JOIN cita c ON u.usu_id = c.cit_datosUsuario JOIN estado_cita ec ON c.cit_estadoCita = ec.estcita_id WHERE u.usu_id = ${id_user} AND ec.estcita_nombre = "Programada";`, (err, data, fields) => {
            if(err) console.log(err);
            res.send(data);
        });
    } catch (error) {
        res.status(500).send(error);
    }
}

const findPatientsCommonDoctor = (req, res) => {
    try {
        const conn = getConn();
        const { id_medico } = req.params;
        conn.query(`SELECT u.usu_id, u.usu_nombre, u.usu_primer_apellido_usuar, u.usu_email FROM usuario u JOIN cita c ON u.usu_id =c.cit_datosUsuario JOIN medico m ON c.cit_medico = m.med_nroMatriculaProsional WHERE m.med_nroMatriculaProsional = ${id_medico};`, (err, data, fields) => {
            if(err) console.log(err);
            res.send(data);
        });
    } catch (error) {
        res.status(500).send(error)
    }
}

export const methodsUsers = {
    getAllUsersAlphabe,
    findNextCitation,
    findPatientsCommonDoctor
}