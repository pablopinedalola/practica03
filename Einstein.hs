-- Profesor: Manuel Soto Romero
-- Ayudante: Diego Méndez Medina
-- Ayudante: José Alejandro Pérez Marquez
-- Laboratorio: Erick Daniel Arroyo Martínez
-- Laboratorio: Erik Rangel Limón

module Einstein where

import SAT.MiniSat
import Data.Map.Lazy (toList)

-- | Tipo de dato que usaremos para representar el color.
data Color = Rojo
           | Verde
           | Blanco 
           | Amarillo
           | Azul deriving (Show, Eq, Ord)

colores :: [Color]
colores = [Rojo, Verde, Blanco, Amarillo, Azul]

-- | Tipo de dato que usaremos para representar la nacionalidad.
data Nacionalidad = Britanico
                  | Sueco
                  | Danes
                  | Noruego
                  | Aleman deriving (Show, Eq, Ord)

nacionalidades :: [Nacionalidad]
nacionalidades = [Britanico, Sueco, Danes, Noruego, Aleman]

-- | Tipo de dato que usaremos para representar la bebida.
data Bebida = Té
            | Café
            | Leche
            | Cerveza
            | Agua deriving (Show, Eq, Ord)

bebidas :: [Bebida]
bebidas = [Té, Café, Leche, Cerveza, Agua]

-- | Tipo de dato que usaremos para representar los cigarros.
data Cigarro = PallMall
             | Dunhill
             | Blends
             | Bluemaster
             | Prince deriving (Show, Eq, Ord)

cigarros :: [Cigarro]
cigarros = [PallMall, Dunhill, Blends, Bluemaster, Prince]

-- | Tipo de dato que usaremos para representar las mascotas.
data Mascota = Perro
             | Pajaro
             | Gato
             | Caballo
             | Pez deriving (Show, Eq, Ord)

mascotas :: [Mascota]
mascotas = [Perro, Pajaro, Gato, Caballo, Pez]

-- | Tipo de dato que usaremos para denotar una propiedad que cumple una casa.
data Propiedad = Color Color
               | Nacionalidad Nacionalidad
               | Bebida Bebida
               | Cigarro Cigarro
               | Mascota Mascota deriving (Show, Eq, Ord)

casas :: [Int]
casas = [1..5]

----------------------
-- RESTRICCIONES GENERALES
----------------------

casaTieneUnaPropiedad :: (a -> Propiedad) -> [a] -> Int -> Formula (Int, Propiedad)
casaTieneUnaPropiedad f valores n = ExactlyOne [Var (n, f v) | v <- valores]

cadaCasaTieneUnaPropiedad :: (a -> Propiedad) -> [a] -> Formula (Int, Propiedad)
cadaCasaTieneUnaPropiedad f valores = All [casaTieneUnaPropiedad f valores n | n <- casas]

cadaPropiedadEsUnica :: (a -> Propiedad) -> [a] -> Formula (Int, Propiedad)
cadaPropiedadEsUnica f valores = All [ExactlyOne [Var (n, f v) | n <- casas] | v <- valores]

-- Colores
casaColor :: Int -> Formula (Int, Propiedad)
casaColor = casaTieneUnaPropiedad Color colores

tienenColor :: Formula (Int, Propiedad)
tienenColor = cadaCasaTieneUnaPropiedad Color colores

colorUnico :: Formula (Int, Propiedad)
colorUnico = cadaPropiedadEsUnica Color colores

-- Nacionalidad
casaNacionalidad :: Int -> Formula (Int, Propiedad)
casaNacionalidad = casaTieneUnaPropiedad Nacionalidad nacionalidades

tieneNacionalidad :: Formula (Int, Propiedad)
tieneNacionalidad = cadaCasaTieneUnaPropiedad Nacionalidad nacionalidades

nacionalidadUnica :: Formula (Int, Propiedad)
nacionalidadUnica = cadaPropiedadEsUnica Nacionalidad nacionalidades

-- Bebidas
casaBebida :: Int -> Formula (Int, Propiedad)
casaBebida = casaTieneUnaPropiedad Bebida bebidas

tienenBebida :: Formula (Int, Propiedad)
tienenBebida = cadaCasaTieneUnaPropiedad Bebida bebidas

bebidaUnica :: Formula (Int, Propiedad)
bebidaUnica = cadaPropiedadEsUnica Bebida bebidas

-- Cigarros
casaCigarro :: Int -> Formula (Int, Propiedad)
casaCigarro = casaTieneUnaPropiedad Cigarro cigarros

tienenCigarro :: Formula (Int, Propiedad)
tienenCigarro = cadaCasaTieneUnaPropiedad Cigarro cigarros

cigarroUnico :: Formula (Int, Propiedad)
cigarroUnico = cadaPropiedadEsUnica Cigarro cigarros

-- Mascotas
casaMascota :: Int -> Formula (Int, Propiedad)
casaMascota = casaTieneUnaPropiedad Mascota mascotas

tienenMascota :: Formula (Int, Propiedad)
tienenMascota = cadaCasaTieneUnaPropiedad Mascota mascotas

mascotaUnica :: Formula (Int, Propiedad)
mascotaUnica = cadaPropiedadEsUnica Mascota mascotas

----------------------
-- PISTAS
----------------------

uno = Some [Var (i, Nacionalidad Britanico) :<->: Var (i, Color Rojo) | i <- casas]
dos = Some [Var (i, Nacionalidad Sueco) :<->: Var (i, Mascota Perro) | i <- casas]
tres = Some [Var (i, Nacionalidad Danes) :<->: Var (i, Bebida Té) | i <- casas]
cuatro = Var (1, Nacionalidad Noruego)
cinco = Some [Var (i, Nacionalidad Aleman) :<->: Var (i, Cigarro Prince) | i <- casas]
seis = Some [Var (i, Color Verde) :&&: Var (i+1, Color Blanco) | i <- [1..4]]
siete = Some [Var (i, Color Verde) :<->: Var (i, Bebida Café) | i <- casas]
ocho = Some [Var (i, Cigarro PallMall) :<->: Var (i, Mascota Pajaro) | i <- casas]
nueve = Some [Var (i, Color Amarillo) :<->: Var (i, Cigarro Dunhill) | i <- casas]
diez = Var (3, Bebida Leche)
once = Some [Var (i, Cigarro Blends) :<->: (Var (i-1, Mascota Gato) :||: Var (i+1, Mascota Gato)) | i <- [2..4]]
doce = Some [Var (i, Mascota Caballo) :<->: (Var (i-1, Cigarro Dunhill) :||: Var (i+1, Cigarro Dunhill)) | i <- [2..4]]
trece = Some [Var (i, Cigarro Bluemaster) :<->: Var (i, Bebida Cerveza) | i <- casas]
catorce = Some [Var (i, Cigarro Blends) :<->: (Var (i-1, Bebida Agua) :||: Var (i+1, Bebida Agua)) | i <- [2..4]]
quince = Some [Var (i, Nacionalidad Noruego) :<->: (Var (i-1, Color Azul) :||: Var (i+1, Color Azul)) | i <- [2..4]]

----------------------
-- Fórmula global
----------------------

acertijo :: Formula (Int, Propiedad)
acertijo = All
  [ tienenColor, colorUnico
  , tieneNacionalidad, nacionalidadUnica
  , tienenBebida, bebidaUnica
  , tienenCigarro, cigarroUnico
  , tienenMascota, mascotaUnica
  , uno, dos, tres, cuatro, cinco
  , seis, siete, ocho, nueve, diez
  , once, doce, trece, catorce, quince
  ]

solucion :: Maybe [(Int, Propiedad)]
solucion = map fst . filter snd . toList <$> solve acertijo