# Epidemiología vegetal
# Ejercicio 8
# Dr. Ezequiel López
# Dr. Byron González
# http://cete.fausac.gt
# Este material es una traducción libre con base en el texto  
# Ecology and Epidemiology in R: Disease Progress Over Time
# https://www.apsnet.org/edcenter/disimpactmngmnt/topc/EcologyAndEpidemiologyInR/DiseaseProgress/Pages/default.aspx

## Modelando la población de mosca blanca a lo largo del tiempo

## Cargue los datos como vectores numéricos

weeksAfterPlantingM <-
  c(4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16);

WFForCassavaM <-
  c(4, 7, 14, 33, 28, 39, 24, 14, 6, 10, 8, 7, 4);

WFForCassavaAndMaizeM <-
  c(3, 4, 6, 13, 8, 12, 7, 3, 3, 4, 3, 3, 4);

WFForCassavaAndCowpeaM <-
  c(2, 4, 5, 6, 8, 10, 16, 4, 4, 6, 4, 4, 3);

WFForCassavaAndMaizeAndCowpeaM <-
  c(2, 3, 7, 6, 8, 13, 10, 4, 4, 9, 8, 7, 6);

## Establecer valores predeterminados para dibujar una gráfica

default_type = 'o';
default_pch = 22;
default_xlim = c(4, 17);
default_ylim = c(0, 45);
default_xlab = 'Semanas después de la plantación';
default_ylab = 'Número de adultos de moscas blancas';
default_color1 = 'orange';
default_color2 = 'blue';
default_color3 = 'green';
default_color4 = 'black';
default_lty_for_actual_data = 1;
default_lty_for_fitted_data = 2;
default_lwd_for_actual_data = 2;
default_lwd_for_fitted_data = 1;

## Gráfica de la población de insectos contra semanas después de la plantación

# Gráfica de la población de insectos para yuca en monocultivo


plot(
  weeksAfterPlantingM, WFForCassavaM,
  type = default_type,
  pch = default_pch,
  lwd = default_lwd_for_actual_data,
  xlim = default_xlim,
  ylim = default_ylim,
  xlab = default_xlab,
  ylab = default_ylab,
  col = default_color1
);

title(
  main=
    'Número promedio de adultos de mosca blanca en las hojas de yuca'
);

# Gráfico de población de insectos para yuca intercalada con maíz

lines(
  weeksAfterPlantingM, WFForCassavaAndMaizeM,
  type = default_type,
  lwd = default_lwd_for_actual_data,
  col = default_color2
);

# Gráfico de población de insectos de mosca blanca para yuca intercalada con # caupí 

lines(
  weeksAfterPlantingM, WFForCassavaAndCowpeaM,
  type = default_type,
  col = default_color3,
  lwd = default_lwd_for_actual_data
);

# Gráfica de poblaciones de insectos para yuca intercalada
#    con maíz y cupí

lines(
  weeksAfterPlantingM,
  WFForCassavaAndMaizeAndCowpeaM,
  type = default_type,
  col = default_color4,
  lwd = default_lwd_for_actual_data
);

## Agregue la leyenda al gráfico

legend(
  'topright',
  c(
    'Yuca',
    'Yuca+maíz',
    'Yuca+cupí',
    'Yuca+maíz+cupí'
  ),
  pch = 22,
  lty = 1,
  col = c(
    'orange',
    
    'blue',
    'green',
    'black'
  ),
  title = 'Tipo cultivo',
  inset = 0.05
)