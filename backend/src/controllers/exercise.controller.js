import { readData, writeData } from '../utils/fileHandler.js';

export const getAllExercises = async (req, res) => {
  try {
    const exercises = await readData('exercises');
    const favorites = await readData('favorites');
    const userId = req.user.id;

    const userFavorites = favorites
      .filter(f => f.userId === userId)
      .map(f => f.exerciseId);

    const exercisesWithFav = exercises.map(ex => ({
      ...ex,
      isFavorite: userFavorites.includes(ex.id)
    }));

    res.json(exercisesWithFav);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

export const getExerciseById = async (req, res) => {
  try {
    const { id } = req.params;
    const exercises = await readData('exercises');
    const exercise = exercises.find(ex => ex.id === id);

    if (!exercise) {
      return res.status(404).json({ message: 'Exercise not found' });
    }

    const favorites = await readData('favorites');
    const userId = req.user.id;
    exercise.isFavorite = favorites.some(f => f.userId === userId && f.exerciseId === id);

    res.json(exercise);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

export const toggleFavorite = async (req, res) => {
  try {
    const { exerciseId } = req.body;
    const userId = req.user.id;
    let favorites = await readData('favorites');

    const index = favorites.findIndex(f => f.userId === userId && f.exerciseId === exerciseId);

    if (index > -1) {
      favorites.splice(index, 1);
      await writeData('favorites', favorites);
      res.json({ message: 'Removed from favorites', isFavorite: false });
    } else {
      favorites.push({ userId, exerciseId });
      await writeData('favorites', favorites);
      res.json({ message: 'Added to favorites', isFavorite: true });
    }
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

export const getFavorites = async (req, res) => {
  try {
    const userId = req.user.id;
    const favorites = await readData('favorites');
    const exercises = await readData('exercises');

    const userFavoriteIds = favorites
      .filter(f => f.userId === userId)
      .map(f => f.exerciseId);

    const favoriteExercises = exercises
      .filter(ex => userFavoriteIds.includes(ex.id))
      .map(ex => ({ ...ex, isFavorite: true }));

    res.json(favoriteExercises);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

export const getDailyRoutine = async (req, res) => {
  try {
    const userId = req.user.id;
    const exercises = await readData('exercises');
    const favorites = await readData('favorites');

    const userFavoriteIds = favorites
      .filter(f => f.userId === userId)
      .map(f => f.exerciseId);

    // Shuffling logic
    const shuffled = [...exercises].sort(() => 0.5 - Math.random());

    // Pick 4 unique exercises
    const routine = shuffled.slice(0, 4).map(ex => ({
      ...ex,
      isFavorite: userFavoriteIds.includes(ex.id)
    }));

    res.json(routine);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};
