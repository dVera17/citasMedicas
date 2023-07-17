import { Router } from "express";
import { methodsUsers } from '../controllers/pacientes.controllers.js'
const router = Router();

router.use('/', methodsUsers.getAllUsersAlphabe);

export default router;