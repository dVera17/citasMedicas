import { Router } from "express";
import { methodsCitas } from "../controllers/citas.controllers.js";

const router = Router();

router.get('/', methodsCitas.getAllCitationAlphabe);

export default router;