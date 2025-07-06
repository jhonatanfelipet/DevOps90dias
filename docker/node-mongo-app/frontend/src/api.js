export async function getApiMessage() {
  const apiUrl = import.meta.env.VITE_API_URL;

  try {
    const res = await fetch(apiUrl);
    const data = await res.text();
    return data;
  } catch (err) {
    console.error('Error de conexión:', err);
    return 'Error al conectar con el backend';
  }
}
