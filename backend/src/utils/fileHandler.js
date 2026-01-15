import fs from 'fs/promises';
import path from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const DATA_PATH = path.join(__dirname, '../../data');

export const readData = async (filename) => {
  try {
    const filePath = path.join(DATA_PATH, `${filename}.json`);
    const data = await fs.readFile(filePath, 'utf8');
    return JSON.parse(data);
  } catch (error) {
    if (error.code === 'ENOENT') {
      return [];
    }
    throw error;
  }
};

export const writeData = async (filename, data) => {
  const filePath = path.join(DATA_PATH, `${filename}.json`);
  await fs.writeFile(filePath, JSON.stringify(data, null, 2), 'utf8');
};
