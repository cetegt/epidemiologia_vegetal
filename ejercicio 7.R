# Epidemiología vegetal
# Ejercicio 7
# Dr. Ezequiel López
# Dr. Byron González
# http://cete.fausac.gt
# Este material es una traducción libre con base en el texto  
# Ecology and Epidemiology in R: Disease Progress Over Time
# https://www.apsnet.org/edcenter/disimpactmngmnt/topc/EcologyAndEpidemiologyInR/DiseaseProgress/Pages/default.aspx

## Comparación de las curvas para el progreso de la enfermedad bajo monocultivo y cultivo intercalado usando R
## Cargue los datos como un objeto tipo vector numérico

weeksAfterPlantingM <- c(  4,  6,  8, 10, 12, 14, 16,
                           18, 20, 22, 24, 26, 28);

diseaseIncidenceForCassavaM <- c(0.04, 0.11, 0.18, 0.32, 0.53,
                                 0.64, 0.70, 0.73, 0.75, 0.77,
                                 0.78, 0.79, 0.79);

diseaseIncidenceForCassavaAndMaizeM <-
  c(0.03, 0.10, 0.17, 0.27, 0.36,
    0.43, 0.47, 0.50, 0.51, 0.60,
    0.60, 0.61, 0.61);

diseaseIncidenceForCassavaAndCowpeaM <-
  c(0.03, 0.09, 0.17, 0.27, 0.35,
    0.42, 0.43, 0.43, 0.44, 0.55,
    0.56, 0.5700, 0.57);

diseaseIncidenceForCassavaAndMaizeAndCowpeaM <-
  c(0.0200, 0.08, 0.16, 0.27, 0.35,
    0.41, 0.41, 0.42, 0.42, 0.52,
    0.53, 0.54, 0.55);

## Establezca los valores predeterminados para dibujar una gráfica

default_type = 'o';
default_pch = 22;
default_xlim = c(4, 28);
default_ylim = c(0, 1);
default_xlab = 'Semanas después de la plantación';
default_ylab = 'Incidencia de la enfermedad (%)';
default_color1 = 'orange';
default_color2 = 'blue';
default_color3 = 'green';
default_color4 = 'black';
default_lty_for_actual_data = 1;
default_lty_for_fitted_data = 2;
default_lwd_for_actual_data = 2;
default_lwd_for_fitted_data = 1;

## Grafique la incidencia de la enfermedad (y) contra las semanas después de ## la plantación

# Grafique la incidencia de la enfermedad para la yuca en monocultivo

plot(
  weeksAfterPlantingM, diseaseIncidenceForCassavaM,
  type = default_type,
  pch = default_pch,
  lwd = default_lwd_for_actual_data,
  xlim = default_xlim,
  ylim = default_ylim,
  xlab = default_xlab,
  ylab = default_ylab,
  col = default_color1 
);
title(main = 'Progreso de la enfermedad del mosaico en yuca');

## Dibuje una curva ajustada dado un modelo monomolecular
# Nota: el intercepto y la pendiente ya han sido dados
#    estimadas por Fondong et al. (2002)

esti_intercept = -0.21; 
esti_slope = 0.08;
temp = esti_intercept + esti_slope * weeksAfterPlantingM;
yM = (exp(temp) - 1) / exp(temp);
lines(
  weeksAfterPlantingM, yM,
  col = default_color1,
  lwd = default_lwd_for_fitted_data,
  lty = default_lty_for_fitted_data);

# Grafique la incidencia de la enfermedad para yuca intercalada con maíz

lines(
  weeksAfterPlantingM,
  diseaseIncidenceForCassavaAndMaizeM,
  type = default_type,
  lwd = default_lwd_for_actual_data,
  col = default_color2
);

# Dibuje una curva ajustada dado el modelo monomolecular

esti_intercept = -0.19; 
esti_slope = 0.05;
temp = esti_intercept + esti_slope * weeksAfterPlantingM;
yM = (exp(temp) - 1) / exp(temp);
lines(
  weeksAfterPlantingM, yM,
  col = default_color2,
  lwd = default_lwd_for_fitted_data,
  lty = default_lty_for_fitted_data
);

# Grafique la incidencia de la enfermedad para yuca intercalada con caupí

lines(
  weeksAfterPlantingM,
  diseaseIncidenceForCassavaAndCowpeaM,
  type = default_type,
  col = default_color3,
  lwd = default_lwd_for_actual_data
);

# Dibuje una curva ajustada dado el modelo monomolecular

esti_intercept = -0.15; 
esti_slope = 0.05;
temp = esti_intercept + esti_slope * weeksAfterPlantingM;
yM = (exp(temp) - 1) / exp(temp);
lines(
  weeksAfterPlantingM, yM,
  col = default_color3,
  lwd = default_lwd_for_fitted_data,
  lty = default_lty_for_fitted_data
);

# Grafique la incidencia de la enfermedad para la yuca intercalada
#    con maíz y caupí

lines(
  weeksAfterPlantingM,
  diseaseIncidenceForCassavaAndMaizeAndCowpeaM,
  type = default_type,
  col = default_color4,
  lwd = default_lwd_for_actual_data
);

# Dibuje una curva ajustada dado el modelo monomolecular

esti_intercept = -0.19; 
esti_slope = 0.04;
temp = esti_intercept + esti_slope * weeksAfterPlantingM;
yM = (exp(temp) - 1) / exp(temp);
lines(
  weeksAfterPlantingM, yM,
  col = default_color4,
  lwd = default_lwd_for_fitted_data,
  lty = default_lty_for_fitted_data
);

## Agregue una leyenda al gráfico

legend(
  'topleft',
  c(
    'Yuca',
    'Yuca+maíz',
    'Yuca+caupí',
    'Yuca+maíz+caupí'
  ),
  pch = c(22),
  lty = 1,
  col = c('orange','blue','green','black'),
  title = 'Tipo de cultivo',
  inset = 0.01
)
