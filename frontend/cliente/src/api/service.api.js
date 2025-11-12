
import axios from "axios";
import { API_URL } from "../apiConfig"; // 👈 sube una carpeta, luego apiConfig

export default axios.create({
  baseURL: API_URL,
});
