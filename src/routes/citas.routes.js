import { Router } from "express";
import { methodsCitas } from "../controllers/citas.controllers.js";

const router = Router();

router.use('/', methodsCitas.getAllCitationAlphabe);

export default router;