# ft_server
## Оглавление

__1. Цель проекта__ 💡

__2. Запуск__ 🔨

---

### Цель проекта 💡

Необходимо создать веб-сервер __Nginx__, который способен запустить веб-сайт на __WordPress__ и синхронизировать с веб-интерфейсом __phphNyAdmin__ для администрирования СУБД __MySQL__. Этот сервер будет работать только в одном контейнере Docker под управлением Debian Buster.

### Запуск 🔨
___Сборка:___

	$> docker build -t ft_server .
___Запуск проекта:___

	$> docker run --name aname -it -p 80:80 -p 443:443 name

Утилиты: [phpMyAdmin](https://www.phpmyadmin.net/), [docker](https://ru.wikipedia.org/wiki/Docker), [wordpress](https://en.wikipedia.org/wiki/WordPress), [SSL](https://ru.wikipedia.org/wiki/SSL), [Nginx](https://www.nginx.com/?m=0&_bt=569759796873&_bk=&_bm=&_bn=g&_bg=131542195176&gclid=EAIaIQobChMIi7qHjtiQ9gIVjuSzCh3uxw91EAAYASAAEgLwE_D_BwE), [Dockerfile](https://dker.ru/docs/docker-engine/engine-reference/dockerfile-reference/);
