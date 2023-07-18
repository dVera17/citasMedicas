import { Router } from "express";
import { methodsDoctors } from "../controllers/medicos.controllers.js";
const router = Router();

router.get('/:specialty', methodsDoctors.getAllDoctorBySpecialty);

export default router;