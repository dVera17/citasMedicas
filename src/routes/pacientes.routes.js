import { Router } from "express";
import { methodsUsers } from '../controllers/pacientes.controllers.js'
const router = Router();

router.get('/', methodsUsers.getAllUsersAlphabe);
router.get('/proxima_cita/:id_user', methodsUsers.findNextCitation);

export default router;