import { Router } from "express";
import { methodsUsers } from '../controllers/pacientes.controllers.js'
const router = Router();

router.get('/', methodsUsers.getAllUsersAlphabe);
router.get('/proxima_cita/:id_user', methodsUsers.findNextCitation);
router.get('/cita/doctor/:id_medico', methodsUsers.findPatientsCommonDoctor)

export default router;