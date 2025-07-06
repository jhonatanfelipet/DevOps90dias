import { useEffect, useState } from 'react';

const styles = {
  container: {
    fontFamily: "'Segoe UI', Tahoma, Geneva, Verdana, sans-serif",
    background: 'linear-gradient(135deg, #fceabb, #f8b500)',
    minHeight: '100vh',
    color: '#3a3a3a',
    display: 'flex',
    flexDirection: 'column',
    justifyContent: 'center',
    alignItems: 'center',
    padding: '2rem',
    textAlign: 'center',
  },
  title: {
    fontSize: '3rem',
    fontWeight: '700',
    marginBottom: '0.5rem',
    color: '#2c1503',
    textShadow: '2px 2px 4px rgba(0,0,0,0.2)',
  },
  subtitle: {
    fontSize: '1.5rem',
    marginBottom: '2rem',
    fontStyle: 'italic',
    color: '#5a3e1b',
  },
  image: {
    width: '250px',
    borderRadius: '15px',
    boxShadow: '0 8px 15px rgba(0,0,0,0.3)',
    marginBottom: '2rem',
    transition: 'transform 0.3s ease',
  },
  messageBox: {
    backgroundColor: 'rgba(255,255,255,0.8)',
    padding: '1.5rem 2rem',
    borderRadius: '15px',
    boxShadow: '0 4px 10px rgba(0,0,0,0.15)',
    maxWidth: '450px',
    fontSize: '1.25rem',
    color: '#2c1503',
    marginBottom: '2rem',
  },
  button: {
    backgroundColor: '#f8b500',
    border: 'none',
    padding: '0.75rem 2rem',
    borderRadius: '30px',
    fontWeight: '600',
    cursor: 'pointer',
    color: '#fff',
    fontSize: '1rem',
    boxShadow: '0 4px 10px rgba(248,181,0,0.5)',
    transition: 'background-color 0.3s ease',
  },
  buttonHover: {
    backgroundColor: '#e09e00',
  }
};

function App() {
  const [message, setMessage] = useState('');
  const [btnHover, setBtnHover] = useState(false);

  // Mensaje que sale tras cargar la app
  useEffect(() => {
    setTimeout(() => {
      setMessage('¡Gracias por apoyarme siempre, cielito! 💖');
    }, 1000);
  }, []);

  return (
    <div style={styles.container}>
      <h1 style={styles.title}>Frontend React + Docker</h1>
      <h2 style={styles.subtitle}>Una dedicatoria muy especial</h2>
      
      <img
        style={{...styles.image, transform: btnHover ? 'scale(1.05)' : 'scale(1)'}}
        src="https://images.unsplash.com/photo-1506744038136-46273834b3fb?auto=format&fit=crop&w=250&q=80"
        alt="Imagen especial"
        onMouseEnter={() => setBtnHover(true)}
        onMouseLeave={() => setBtnHover(false)}
      />

      <div style={styles.messageBox}>
        {message || 'Cargando mensaje...'}
      </div>

      <button
        style={btnHover ? {...styles.button, ...styles.buttonHover} : styles.button}
        onMouseEnter={() => setBtnHover(true)}
        onMouseLeave={() => setBtnHover(false)}
        onClick={() => alert('¡Te amo cada vez más y más! Estoy muy orgulloso de ti 🌟')}
      >
        Presiona aquí 💌
      </button>
    </div>
  );
}

export default App;
