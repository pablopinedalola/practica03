<<<<<<< HEAD
=======
# practica03
Repositorio de practica03 de Lógica Computacional

>>>>>>> a11082084a9d162ebcbeb94c6a5ea2ac4e35f6b0
# Práctica 03: Solucionadores SAT

## Integrantes del equipo
- Gónzales Cerón Romario
- Pineda Cantú Pablo
- Galván Cordoba Federico

## Funciones implementadas y explicación rápida

- **`data Color` / `data Nacionalidad` / `data Bebida` / `data Cigarro` / `data Mascota`**  
  Se usan para representar cada una de las propiedades que tienen las casas. Son tipos enumerados con 5 valores cada uno, uno por casa.

- **`data Propiedad`**  
  Sirve para agrupar todas las propiedades en un solo tipo que pueda ser usado en fórmulas lógicas.

---

### Colores

- **`casaColor n`**  
  Dice que la casa `n` debe tener exactamente un color de los cinco disponibles.

- **`tienenColor`**  
  Se asegura que todas las casas (1 a 5) tengan algún color asignado.

- **`soloColor c`**  
  Verifica que un color en particular (ej. Rojo) aparezca solo en una casa.

- **`colorUnico`**  
  Aplica `soloColor` a todos los colores, asegurando que todos sean únicos.

---

### Nacionalidad

- **`casaNacionalidad n`**  
  Lo mismo que `casaColor`, pero con nacionalidades.

- **`tieneNacionalidad`**  
  Asegura que cada casa tenga una nacionalidad.

- **`soloNacionalidad`**  
  Revisa que una nacionalidad aparezca solo una vez.

- **`nacionalidadUnica`**  
  Aplica lo anterior a todas las nacionalidades.

---

### Bebidas

- **`casaBebida n`**  
  Igual que las anteriores, pero con bebidas.

- **`tienenBebida`**  
  Todas las casas tienen bebida.

- **`soloBebida`**  
  Una bebida aparece solo una vez.

- **`bebidaUnica`**  
  Asegura que todas las bebidas sean únicas.

---

### Cigarros

- **`casaCigarro n`**  
  Define los cigarros por casa.

- **`tienenCigarro`**  
  Todas las casas fuman algo diferente.

- **`soloCigarro`**  
  Un cigarro específico solo se fuma en una casa.

- **`cigarroUnico`**  
  Cada marca se fuma solo en una casa.

---

### Mascotas

- **`casaMascota n`**  
  Asigna una mascota única por casa.

- **`tienenMascota`**  
  Todas las casas tienen mascota.

- **`soloMascota`**  
  Una mascota solo en una casa.

- **`mascotaUnica`**  
  Aplica la restricción de unicidad para todas las mascotas.

---

### Pistas del acertijo

- **`uno` a `quince`**  
  Estas funciones representan las 15 pistas que vienen en el enunciado. Se usan operadores lógicos para decir cosas como "el británico vive en la casa roja" o "el que fuma Blends vive junto al que tiene gato".

---

### Fórmula principal y solución

- **`acertijo`**  
  Junta todas las restricciones generales y las pistas en una sola fórmula con `All [...]`.

- **`solucion`**  
  Ejecuta el solucionador SAT y filtra los pares verdaderos para mostrar qué propiedad tiene cada casa.
<<<<<<< HEAD


=======
>>>>>>> a11082084a9d162ebcbeb94c6a5ea2ac4e35f6b0
