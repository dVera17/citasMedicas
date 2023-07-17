import getConn from "../db/database.js";

const getAllUsersAlphabe = (req, res) => {
    try {
        const conn = getConn();
        conn.query(`SELECT * FROM usuario ORDER BY usu_nombre ASC`, (err, data, fields) => {
            if(err) console.log(err);
            res.json(data);
        });
    } catch (error) {
        resizeBy.status(500).send(error);
    }
}

export const methodsUsers = {
    getAllUsersAlphabe
}