# 1 Instal.lació SGBD Postgresql en entorn virtual

1. Instal.lació d’un sgbd Postgresql en un entorn virtual Ubuntu Server 18.04.03

2. Aneu a la pàgina: https://www.ubuntu.com/download/server i descarregeu la darrera versió LTS de Server.

![Descarrega](/img/descarrega_us.PNG)
3. A partir d’una instal.lació mínima, feu la instal.lació dels paquets necessaris per poder funcionar ( paquet LAMP).

4. Per facilitar la feina i fer més intuitiu i visual el sistema, instal.leu i configureu un escriptori gràfic. Es recomana utilitzar XFCE ( el més lleuger i menys ocupa).

>La comanda d'instal·lacio de l'interficie es aquesta:
 
*sudo apt-get install xfce4 xfce4-goodies*
>Pero jo he preferit instal·lar l'escriptori per defecte d'ubuntu, per a fer mes amena la practica amb la comanda seguent.

*sudo apt-get install ubuntu-desktop*

![inteficie](/img/interf_graf.png)

>I per a iniciar l'escritori s'escriura la comanda seguent:

*startx*

5. Es recomana així mateix instal.lar els programes Synaptic ( gestió de paquets) i geany( editor de text).

>Instalació synaptic:

*sudo apt install synaptic -y*

![synaptic](/img/install_synaptic.PNG)
>Instalació geany:

*sudo add-apt-repository ppa:geany-dev/ppa*
*sudo apt update*
*sudo apt install geany geany-plugin-\* -y*

![REPOSITORI](/img/repositori_geany.PNG)
![GEANY](/img/install_geany.PNG)
# 2 Configuració sistema

Per motius de seguretat i exemple de bones pràctiques, es crearan tres usuaris diferents en
el sistema i en el SGBD ( però com detallem no tindran els mateixos permisos en un lloc que en
l’altre).

1. AdministradorSistema : tindrà els permisos de root en el sistema ( en particular instal.lar programas, accedir carpetes del sistema, crear usuaris...), però en el SGBD serà un usuari «normal».

>Ho fare amb la comanda:

*sudo useradd -u 0 -o -g 0 AdministradorSistema*

>I per donarli una contrasenya:

*sudo passwd AdministradorSistema*

![ADSIS](/img/usuari_adsis.PNG)

2. AdministradorBD: en el sistema tendrà permisos de usuari normal i en la base de Dades «superuser»: podra crear bases de dades, crear taules i crear usuaris/roles.

>Aquest i el seguent l'he creat per interficie grafica

![ADB](/img/usuari_aDB.PNG)

3. Usuari: No tindrà permisos especials ni en el sistema ni en el SGBD, però podra accedir a tots dos.

![USUARI](/img/usuari_PELAO.PNG)

# 3 Configuració SGBD Postgresql

Per defecte el SGBD Posgresql crea un usuari postgres al sistema, una base de dades postgres i un usuari del gestor postgres. Per accedir a una base de dades s’utilitza la funció psql base_de_dades. Això és una mica complicat i hem de procedir a configurar-lo i personalitzar-lo.

1. Per accedir per primer cop al SGBD haurieu d’entrar com usuari postgres utilitzant la instrucció: sudo -i -u postgres, i un cop estem com usuari postgres fem psql per connectarnos a la base de dades.

2. Crear almenys una base de dades nova.

>Amb la comanda:

*create database (nom de la base de dades)*

![CREATE](/img/CREATEDB.PNG)

3. Afegir almenys una base de dades. Podeu anar http://pgfoundry.org/projects/dbsamples/ i descarregar la bases de dades de prova ( pagila). Trobareu un zip amb un fitxer sql, schema i altre data.

![PAGLA](/img/DESCARREGA_PAGLA.PNG)

4. Configurar els permisos i roles segons la descripció feta en l’apartat 2.

>Amb la comanda:

*create user --interactive (NOM USUARI)*

![USUARISDB](/img/USUARISdb.PNG)

>Amb l'anterior comanda creem l'usuari i ens demana si volem que sigui administrador o no, pertant al "AdiministradorDB" se li posara que si i als altres dos que no com es veu a la seguent imatge

>I seguidament s'els haura de donar contrassenya, perque si no no se pot accedir a aquestos usuaris amb la comanda:

*ALTER USER (NOM USUARI) WITH ENCRYPTED PASSWORD '(CONTRASSENYA)'*

![UDBC](/img/USUARISdb_contrassenya.PNG)

5. Instal.lar i configurar el programa phppgadmin: que ens donara accés via web al nostre gestor

>Jo, com ja savia que s'havia d'instal·lar, ja l'he instal·lat al instalar el postgres, pero si no l'agues instalat hauria d'executar la seguent comanda:

*sudo apt install phppgadmin*

![PHPPG](/img/instalacio_postgres.PNG)
>Seguidament, s'haura d'anar al fitxer de configuracio d'aquest:

*sudo gedit /etc/phppgadmin/phpgadmin.conf*

> I modifcar el contingut de la seguent foma, haurem de comentar l'etiqueta aixi '# Require local' i seguidament escriure  'Require all granted' i ens quedare de la seguent forma:

![PHPPG1](/img/conf_phphpg-1.PNG)
>I tambe haurm d'editar la confguracio de l'arxiu situat a:

*sudo gedit /etc/phppgadmin/config.inc.php*

>En aquest h'aurem de cercar la seguent linia i canviar 'true' per 'false':

*$conf['extra_login_security'] = true;*

![PHPPG2](/img/conf_phphpg-2.PNG)

>Seguidament s'haura de reiniciar el servidor de postgres i el de apache2 amb les seguents comandes:

*systemctl restart postgresql
systemctl restart apache2*

![PHPPG3](/img/conf_phphpg-3.PNG)

>I seguidament, ja podrema anar al navegador i posar la seguent capçalera i accedir a les bases de dades de postgres:

![PHPPG4](/img/conf_phphpg-4.PNG)
![PHPPG5](/img/conf_phphpg-5.PNG)
# 4 Utilització bàsica Postgresql

Per acavar seria desitjable tindre nocions bàsiques sobre la utilització del terminal i
del nostre SGBD.

1. Cerqueu en internet i proveu les instruccions més usuals en consola del SGBD.( Ex: \dt, \du, exit...)

2. Executeu algunes instruccions sql en el terminal del SGBD. ( les instruccions SQL acaven en ;)

3. Crear un fitxer sql, utilitzant per exemple geany, i carregar-lo des de consola utilitzant la instrucció \i script1.sql ( vigileu el path). Podeu utilitzar com referència els fitxers de la base de dades pagila descarregada en activitats anteriors

4. Expliqueu alguns paràmetres de psql i el que fa realment ( sistema)
