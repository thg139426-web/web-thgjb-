/* Contenedor del texto tipo logo */
.thgjb-logo-text {
    display: inline-block;
    background-color: #d32f2f; /* El fondo rojo */
    color: white;
    font-family: sans-serif;
    font-weight: 900;
    font-size: 2rem;
    padding: 10px 20px;
    transform: skewX(-10deg); /* La inclinación de las letras */
    position: relative;
    border: 2px solid #000;
    text-shadow: 2px 2px 0px rgba(0,0,0,0.5); /* Sombra para profundidad */
    margin: 20px 0;
}

/* El efecto de la "punta" o rayo del logo */
.thgjb-logo-text::after {
    content: "";
    position: absolute;
    bottom: -10px;
    left: 20px;
    border-left: 10px solid transparent;
    border-right: 10px solid transparent;
    border-top: 10px solid #d32f2f; /* Mismo rojo que el fondo */
}

