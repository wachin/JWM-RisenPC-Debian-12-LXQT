#!/bin/bash

#	│▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒│
#	│Proyecto Resucitar PC de bajos recursos con iceWM        │
#	│                  RisenPC JWM                            │
#	│  script por Washington Indacochea Delgado (Wachín)      │
#	│       E-Mail: wachin.id@gmail.com en Ecuador            │
#	│   http://facilitarelsoftwarelibre.blogspot.com/         │
#	│     Licencia Pública General de GNU version 2           │    
#	│  En español: http://es.tldp.org/Otros/gples/gples.html  │
#	│  en inglés: https://www.gnu.org/licenses/gpl-2.0.html   │
#	│▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒│

# Proyecto Resucitar PC de bajos recursos con JWM


# INSTRUCCIONES: 
# Los siguientes comandos lanzarán las aplicaciones necesarias para 
# que una PC tenga lo mejor posible en funcionalidad con bajos recursos
# Nota: No se olvide de este signo "&" al final de cada comando para 
# lanzar las aplicaciones, porque si usted va a añadir alguna aplicación
# y se olvida de ponerlo se cortarán las demás ordenes y no 
# se lanzarán las demás aplicaciones, ojo.


#	│▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒│
#	│       IMPORTANTES NUNCA SE DEBEN DESACTIVAR:       │
#	│▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒│

sleep 2 &
# Requerido para dar algo de tiempo a la barra de tareas de jwm para
# iniciar antes que el resto

# Iniciar el Sistema de Sonido PulseAudio
pulseaudio --start &

# Internet
nm-applet &

# Teclado virtual 
xvkbd &

nm-applet &
# (Se inicia minimizado en la barra de tareas como un icono)
# Para administrar las redes disponibles de internet
 
pnmixer &
# Es el icono de volumen, dele clic derecho en "Preferences" y en la pestaña "Beavior" 
# en "Volume Control Command" verifique que esté "pavucontrol" si no está escríbalo.
# Visto en "IceWM install and setup guide"
# http://forums.fedoraforum.org/showthread.php?t=282433

#xscreensaver -no-splash &
# (Queda funcionando en segundo plano, no se ve)
# Este es necesario para que si dejas la PC sin usar después se apague
# bloquee solita, y luego para entrar debes poner tu contraseña
# Para que funcione debes tener instalado xscreensaver, y luego 
# ponerlo en el archivo claro que para eso hay que configurarlo, 
# el comando es /usr/bin/xscreensaver-demo el cual lo he añadido
# al "menu" como un elemento para que con el comando 
# "xscreensaver-command -lock &" 
# manualmente lo puedas activar para entender mas de esto revisa 
# el archivo menu que va incluido en este manual
# Visto en "IceWM Guide" https://celettu.wordpress.com/icewm-guide/


#solaar &
# Logitech Unifying Receiver, administrador de periféricos para Linux
# yo tengo un teclado externo Logitech k400 y es necesario para mi instalar este paquete
# y que esté activo e iconizado, para configurarlo a mi teclado según necesite
# yo lo uso para invertir la tecla Fn
# https://unix.stackexchange.com/questions/41647/switch-fn-key-state

#hp-systray -x &
# Si alguien usa una impresora HP este comando hará que se iconice HPLIP pues tendrá que instalarlo
# el comando es: sudo apt-get install hplip-gui
# de allí deberá configurar su impresora

#system-config-printer-applet  &
# Applet de cola de impresión
# Este progrma viene por defecto configurado al inicio de los sistema operativos Ubuntu, por eso
# debe estar en el arranque automático. Lo puede revisar ustedes mismos en:
# /etc/xdg/autostart/print-applet.desktop
# Glosario
# Applet = Componente de software pequeño que se ejecuta bajo el control de una aplicación más grande que lo contiene.

numlockx on &
# Este programa activa la tecla de números en los teclados externos
# Si tienes una laptop con teclado numerico es imprescindible 
# Visto en "Como configurar el gestor de ventanas IceWM como un campeón"
# http://www.taringa.net/post/linux/19258241/Como-configurar-el-gestor-de-ventanas-IceWM-como-un-campeon.html

# Iniciar lxqt-policykit (autenticación LXQT) para programas que necesitan aumentar los permisos, como synaptic, Discover, Muon, etc
# Este paquete lo busqué en synaptic con la palabra clave "Policykit",
/usr/bin/lxqt-policykit-agent &


# Habilitar notificaciones del Sistema con el paquete lxqt-notificationd
lxqt-notificationd &


#update-notifier  &
# Informa cuando hay actualizaciones para el sistema operativo

# Habilitar notificaciones del Sistema con el paquete xfce4-notifyd (ponerlo al final del archivo porque sino usas Systemd no funciona
# y no te dejará funcionar los demás programas después de este porque no usa &)
# Comando encontrado en synapic en /etc/xdg/autostart/xfce4-notifyd.desktop
# en MX Linux 23 KDE el cual es de 64 bit. Si desee usar esto en un Linux de 32 bit deber ver en el 
# archvio: xfce4-notifyd.desktop la línea y copiarla y usarla
#sh -c "systemctl --user start xfce4-notifyd.service 2>/dev/null || exec /usr/lib/x86_64-linux-gnu/xfce4/notifyd/xfce4-notifyd" &

# Icono del volumen (con clic derecho se abre pavucontrol):
volumeicon &

# Gestor de los Wallpapaer
#nitrogen --restore &

# Un programa personal:
python3 /home/wachin/Dev/xsct_gui/xsct_gui.py &

# xinput-plus 🖱️ Ajusta la velocidad del mouse/touchpad en Linux
python3 /home/wachin/Dev/xinput-plus/xinput-plus.py &


setxkbmap -layout es &
# (Queda funcionando en segundo plano, no se ve)
# Para que siempre se cargue al inicio mi distribución de teclado,
# en mi caso Español Latinoamericano "latam". Es recomendable 
# que usted revise mi pagina por si tiene otro idioma u
# otra distribución
# Vea: "Cambiar la distribución del teclado con setxkbmap 
# (desde terminal) en Ubuntu" 
# http://facilitarelsoftwarelibre.blogspot.com/2016/07/cambiar-la-distribucion-del-teclado-con.html
# Para ver toda la lista de los idiomas y su respectiva sintaxis:
# ponga en la terminal este comando:
# gedit /usr/share/X11/xkb/rules/evdev.lst
# allí más abajo usted verá esto(sólo pongo una pequeña parte):
#! layout
#  us              English (US)
#  af              Afghani
#  ara             Arabic
#  al              Albanian
#  am              Armenian
#  latam           Latinoamericano


#	│▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒│
#	│       IMPORTANTES PERO SE PUEDEN DESACTIVAR:       │
#	│▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒│

orage &
# (Se inicia minimizado en la barra de tareas como un icono)
# Sirve para ver la fecha, es un calendario también (se carga 
# iconizado y abierto por defecto. Si quiere hacer para que se
# cargue iconizado haga así, Cuando se cargue le da clic derecho
# al icono, clic preferencias, clic pestaña "Ventana del calendario", 
# marcar en "Inicio de calendario": "ocultar"

xfce4-notes &
# (Se inicia minimizado en la barra de tareas como un icono)
# Para tomar notas rapidas, imprescindible, 

dolphin &
# Exelente administrador de archivos

#pcmanfm --desktop &
# Este es necesario para cargar el wallpaper del escritorio
# y los iconos de escritorio, pero si usted es como yo nunca usas nada
# del escritorio tranquilamente lo puedes desactivar 

#blueman-applet &
# Si tu laptop tiene Bluetooth debes activarlo
# mi laptop Dell Inspiron 1750 no tiene por eso no lo activo. Aunque,
# si le pusiera un Bluetooh externo deberé de hacerlo
# Visto en "Como configurar el gestor de ventanas IceWM como un campeón" 
# http://www.taringa.net/post/linux/19258241/Como-configurar-el-gestor-de-ventanas-IceWM-como-un-campeon.html

#mate-power-manager &
# (opcional) Es un Power Manager applet (administrador de poder),
# te mostrará el estado de la batería de la laptop, el estado de la
# batería de tu teclado externo (si lo tienes), y otros estados, depende
# del o los dispositivos conectados
# Visto en "Why should I use IceWM?" 
# https://help.ubuntu.com/community/IceWM



#	│▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒│
#	│          Programas del usuario (OPCIONALES):       │
#	│▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒│
#
# Los siguientes programas yo los uso y quiero que se carguen cuando 
# enciendo la PC, usted puede poner los que usted usa aquí

#sleep 2; dropbox start -i &
# Dropbox sirve para sincronizar tus archivos atravéz de computadoras y la web. 
# Lo instalé con "sudo apt-get install nautilus-dropbox"

#dolphin4 ~/ ~/Dropbox/UbuntuManuales/ ~/ ~/Dropbox/ &
# Es un administrador de archivos completo, muy bueno, lo uso
# porque como con mucha frecuencia trabajo con fotos y en la vista
# previa se ven grandes las imágenes y así puedo apreciar mejor,
# para mi es el mejor que hay para quienes venimos de Windows.
# Nota: Las cuatro rutas son para que se abran cuatro pestañas que yo tengo
# Más información sobre dolphin4 en
# https://facilitarelsoftwarelibre.blogspot.com/search/label/Dolphin4

#nautilus --no-desktop &
# Es un administrador de archivos bastante completo, tiene de bueno
# que tiene la integración con Dropbox instalando el paquete:
# sudo apt-get install nautilus-dropbox

thunar &

#caja &
# Es un administrador de archivos bastante completo, tiene de bueno
# que tiene la integración con Dropbox instalando el paquete:
# sudo apt-get install caja-dropbox
# claro que de ser ese el caso usted debería desinstalar nautilus-dropbox
# esto si usara Dropbox

#chromium-browser &
# Navegador Web. Debes tener instalado chromium-browser

#/usr/lib/chromium-browser/chromium-browser --type=service  &
# Servicio de Chromium Web Browser.- Es necesario si usted utiliza Google Cloud Print, por 
# defecto lo dejo habilitado. Si usted no utliza Chromium y usa Google Chrome no pasa nada
# si está habilitado pues no se iniciaría ya que no existiría

#google-chrome-stable &
# Navegador Web. Sólo disponible para 64 bits

firefox &
# Navegador Web.

goldendict &
# El Diccionario, todos los días lo uso en algún momento 
# (se lo puede configurar para que se cargue iconizado)
# https://facilitarelsoftwarelibre.blogspot.com/2016/03/goldendict-el-mejor-diccionario-offline.html
# https://facilitarelsoftwarelibre.blogspot.com/2016/05/diccionario-espanol-clave-para.html

#gedit &
# Editor de Textos, es muy bonito pero ocupa casi el doble de memoria que pluma

pluma &
# Editor de Textos, fork de gedit, no consume tanta memoria

konsole &
#xfce4-terminal &
# La terminal


#indicator-kdeconnect &
# para lanzar KDE Connect Indicator (lo uso para compartir archivos
# entre mi celular con Android 6.0.1 y UbuntuStudio 16.04)
# http://www.webupd8.org/2017/04/new-kde-connect-indicator-ubuntu-linux.html
# Nota: Para que se vea el icono debe estar abierto en tu celular
# el programa KDE Connect sino no se cargará el icono

#alarm-clock-applet --hidden &
# (opcional) Tiene un temporizador y un despertador, para mi es el mejor.
# Yo uso este programa para cuando estoy en la PC y dejo algo cocinando
# Nota: Vi como iniciaba minimizado el programa viendo en la ayuda
# en la terminal poniendo 
# alarm-clock-applet --help
# allí hay varios comandos

ksnip

#sleep 7; shutter --min_at_startup &
# Para tomar captura de pantallas, este es el comando para que se
# cargue iconizado y no ocupe espacio 
# instalado desde PPA
# http://shutter-project.org/downloads/
# lo desactivo porque este programas está teniendo inconvenientes
# si se inicia desde el inicio

# Dios les bendiga


