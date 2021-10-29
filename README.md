# MoviEZ
TMDB App for movies

MoviEZ por Felipe Rivera

*Folders:* 

Scenes -> Contienen las escenas principales de la app.
Views -> Contienen las vistas que conforman una escena para la app.
         Custom -> vistas de estilo custom 
         Cast -> Vistas para la visualización del cast 
         Movie -> Vistas para la visualización de las películas
         UIKit -> vistas pertenecientes al UIKit
Models -> Modelos en los cuales se va a decodificar las json response.
Publishers -> Clases encargadas de obtener los datos que se piensan publicar en el UI.
Resources -> Archivo de strings localizable y json de pruebas. 
Network -> Contiene el http engine para hacer peticiones, información de la API y los protocolos de web service.
            Loaders -> Clases que utilizan el http engine para hacer el fetch de los datos,    también son las encargadas de crear correctamente las url utilizando los endpoint correspondientes 
Utils -> Tiene formateadores para fechas y horas. 

*Clases en cada folder* 

Folder Scenes: 
MoviEZApp -> Punto de entrada para la ejecución de la app.
ContentView -> Punto de carga de la configuración inicial del UI. 
HomeView -> Punto en donde se organiza la forma de la presentación de las escenas principales de la app. 
MoviesView -> Escena que se encarga de la presentación de las películas. 
SearchView -> Escena que se encarga de la búsqueda online de películas. 

*Folder Views:
*Folder Custom:
  LoadingView -> Presenta una animación cuando se está cargando datos.
*Folder Cast:
 CastCardView -> Crea la forma en la que se va a presentar la información de cada    miembro del cast. 
 CastCarouselView -> Presenta diferentes CastCardView en forma de carrusel.
*Folder Movie: 
 MoviePosterView -> Crea la forma en la que se va a presentar la publicación de cada  película.
 MovieDetailsView -> Crea la forma en la que se va a presentar los detalles de cada pelicula.
MovieSearchView -> Crea la forma en la que se va a presentar el buscador de peliculas online.
 MoviePosterCarouselView -> Presenta diferentes MoviePosterView en forma de carrusel.
*Folder UIKit:
 ActivityIndicatorView -> Forma gráfica de la animación de cargando.
 SafariView ->     Forma de presentar los videos a través del browser.
 SearchBarView -> Creación y configuración de la barra de búsqueda. 
*Folder Models:
 Movie -> Modelo de los datos que se quieren decodificar y presentar de una película. 
 Videos -> Modelo de los datos que se quieren decodificar y presentar de un video. 
 Credits -> Modelo de los datos que se quieren decodificar y presentar del equipo que participó en la película. 

*Folder Publishers:
 ImagePublisher -> Clase encargada de obtener imágenes por URL y guardarlas en cache. También se encarga del correcto retorno de las imágenes. 
 MovieListPublisher -> Clase encargada de traer los datos de las películas dependiendo de la categoría seleccionada.
 MovieDetailsPublisher -> Clase encargada de obtener la información detallada de una película dependiendo de su id. 
 MovieSearchPublisher -> Clase encargada de buscar y traer las películas según una query.

*Folder Resoruces:
Localizable -> localizable para traducción en inglés y español. 

*Folder Network:
 API -> Información básica sobre la API
 MovieWS -> Procolo el cual indica los métodos necesarios para obtener información sobre las películas. 
VideosWS -> Procolo el cual indica los métodos necesarios para obtener información sobre los videos. 
CredisWS ->  Procolo el cual indica los métodos necesarios para obtener información sobre los créditos. 
HTTPEngine -> Protocolo encargado de soportar los llamados https en toda la app. 
NetworkError -> Manejo de errores. 

*Folder Loaders: 
 CreditsLoader -> Se encarga de utilizar el HTTPEngine y crear correctamente los url y los endpoint para conseguir la información sobre los créditos de una película. 
VideosLoader -> Se encarga de utilizar el HTTPEngine y crear correctamente los url y los endpoint para conseguir la información sobre los videos de una película. 
MoviesLoader -> Se encarga de utilizar el HTTPEngine y crear correctamente los url y los endpoint para conseguir la información sobre las peliculas. 

*Folder Utils:
 Formatters -> Formateadores para fechas y horas. 








*Preguntas* 
*¿En qué consiste el principio de responsabilidad única? ¿Cuál es su propósito?
Es el primer principio SOLID el cual busca que cada clase tenga una sola responsabilidad y solo deba cambiar con respecto a esa responsabilidad, busca mantener un bajo acoplamiento dentro del software.


*Qué características tiene, según su opinión, un “buen” código o código limpio

Técnicas que facilitan la lectura y escritura del código, también facilitan la revisión y el mantenimiento del mismo. 

Técnica de los nombres correctos con respecto a la funcionalidad.
Técnicas de funciones, modelos, clases pequeñas. 
DRY
Comentar solo lo necesario. 
Test limpios. 
