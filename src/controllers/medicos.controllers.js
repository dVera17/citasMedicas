import getConn from "../db/database.js";

const getAllDoctorBySpecialty = (req, res) => {
    try {
        const conn = getConn();
        const { specialty } = req.params;
        conn.query(`SELECT m.med_nombreCompleto FROM medico m JOIN especialidad e ON m.med_especialidad = e.esp_id WHERE UPPER(e.esp_nombre) LIKE '%${specialty}%';`,(err, data, fields) => {
            if(err) console.log(err);
            res.send(data);
        });
    } catch (error) {
        res.status(500).send(error);   
    }
}

export const methodsDoctors = {
    getAllDoctorBySpecialty
}