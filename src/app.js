import express from 'express';
import routesPaciente from './routes/pacientes.routes.js';
const app = express();
app.set('port', 5010);

app.use('/pacientes_ordenados', routesPaciente);

export default app;