import express from 'express';
import cors from 'cors';
import authRoutes from './routes/auth.routes.js';
import exerciseRoutes from './routes/exercise.routes.js';

const app = express();

app.use(cors());
app.use(express.json());

// Main API routes
app.use('/api/auth', authRoutes);
app.use('/api/exercises', exerciseRoutes);

// Error handling middleware
app.use((err, req, res, next) => {
    console.error(err.stack);
    res.status(500).json({ message: 'Something went wrong!' });
});

export default app;
