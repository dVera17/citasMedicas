import express from 'express';
import routesPaciente from './routes/pacientes.routes.js';
import routesCitas from './routes/citas.routes.js';
const app = express();
app.set('port', 5010);

app.use('/pacientes_ordenados', routesPaciente);
app.use('/citas_fecha', routesCitas);

export default app;