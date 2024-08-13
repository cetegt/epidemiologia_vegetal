# Epidemiología vegetal
# Ejercicio 9
# Dr. Ezequiel López
# Dr. Byron González
# http://cete.fausac.gt
# Este material es una traducción libre con base en el texto  
# Ecology and Epidemiology in R: Disease Progress Over Time
# https://www.apsnet.org/edcenter/disimpactmngmnt/topc/EcologyAndEpidemiologyInR/DiseaseProgress/Pages/default.aspx

# Efecto del cultivo intercalado en la severidad de la enfermedad

## Cargar los datos en formato de vector numérico

weeksAfterPlantingM <-
  c(4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28);

diseaseSevForCassavaM <-
  c(2.0, 3.0, 3.9, 3.6, 4.1, 4.4, 4.5,
    3.7, 3.3, 2.7, 2.3, 2.7, 2.8);

diseaseSevForCassavaAndMaizeM <-
  c(2.3, 2.6, 3.7, 3.3, 3.7, 4.0, 4.5,
    3.6, 3.3, 2.8, 2.3, 2.7, 2.7);

diseaseSevForCassavaAndCowpeaM <-
  c(1.9, 2.6, 3.3, 3.2, 3.4, 3.6, 4.5,
    3.9, 3.8, 3.1, 2.6, 2.8, 2.7);

diseaseSevForCassavaAndMaizeAndCowpeaM <-
  c(2.5, 2.6, 3.2, 3.2, 2.8, 3.6, 4.5,
    3.9, 3.9, 3.4, 2.7, 2.7, 2.7);

## Set default values for drawing a plot

default_type = 'o';
default_pch = 22;
default_xlim = c(4, 33);
default_ylim = c(1.0, 5);
default_xlab = 'Semanas después de la siembra';
default_ylab = 'Severidad de la enfermedad';
default_color1 = 'orange';
default_color2 = 'blue';
default_color3 = 'green';
default_color4 = 'black';
default_lty_for_actual_data = 1;
default_lty_for_fitted_data = 2;
default_lwd_for_actual_data = 2;
default_lwd_for_fitted_data = 1;

## Gráfico de la severidad de la enfermedad (y) contra semanas después de la ## siembra

# Gráfico de severidad de la enfermedad para yuca en monocultivo

plot(
  weeksAfterPlantingM, diseaseSevForCassavaM,
  type = default_type,
  pch = default_pch,
  lwd = default_lwd_for_actual_data,
  xlim = default_xlim,
  ylim = default_ylim,
  xlab = default_xlab,
  ylab = default_ylab,
  col = default_color1
);
title(main = 'Severidad de los síntomas de la enfermedad');

# Gráfico de la severidad de la enfermedad para yuca intercalada 
#    con maíz

lines(
  weeksAfterPlantingM,
  diseaseSevForCassavaAndMaizeM,
  type = default_type,
  lwd = default_lwd_for_actual_data,
  col = default_color2
);

# Gráfico de la severidad de la enfermedad para yuca intercalada
#    con caupí

lines(
  weeksAfterPlantingM,
  diseaseSevForCassavaAndCowpeaM,
  type = default_type,
  col = default_color3,
  lwd = default_lwd_for_actual_data
);

# Gráfico de la severidad de la enfermedad para yuca intercalada
#    con maíz y caupí

lines(
  weeksAfterPlantingM,
  diseaseSevForCassavaAndMaizeAndCowpeaM,
  type = default_type,
  col = default_color4,
  lwd = default_lwd_for_actual_data
);

## Agregue leyenda al gráfico

legend(
  'bottomright',
  c(
    'Yuca',
    'Yuca+maíz',
    'Yuca+caupí',
    'Yuca+maíz+caupí'
  ),
  pch = 22,
  lty = 1,
  col = c(
    'orange',
    'blue',
    'green',
    'black'
  ),
  title = 'Tipo de cultivo',
  inset = 0.05
)