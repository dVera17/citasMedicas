import getConn from "../db/database.js";

const getAllCitationAlphabe = (req, res) => {
    try {
        const conn = getConn();
        conn.query(`SELECT * FROM cita ORDER BY cit_fecha ASC;`, (err, data, fields) => {
            if(err) console.log(err);
            res.send(data);
        });
    } catch (error) {
        res.status(500).send(error);
    }
}

export const methodsCitas = {
    getAllCitationAlphabe
}