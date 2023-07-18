import express from 'express';
import routesPaciente from './routes/pacientes.routes.js';
import routesCitas from './routes/citas.routes.js';
import routesDoctors from './routes/medicos.routes.js';
const app = express();
app.set('port', 5010);

app.use('/pacientes_ordenados', routesPaciente);
app.use('/citas_fecha', routesCitas);
app.use('/medicos', routesDoctors);

export default app;