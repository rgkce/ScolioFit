import express from 'express';
import {
  getAllExercises,
  getExerciseById,
  toggleFavorite,
  getFavorites,
  getDailyRoutine
} from '../controllers/exercise.controller.js';
import { authMiddleware } from '../middleware/auth.middleware.js';

const router = express.Router();

router.use(authMiddleware);

router.get('/', getAllExercises);
router.get('/favorites', getFavorites);
router.get('/daily-routine', getDailyRoutine);
router.get('/:id', getExerciseById);
router.post('/favorites', toggleFavorite);

export default router;
