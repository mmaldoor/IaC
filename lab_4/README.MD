# lab 4

## oppgave 2 (motd)

First make a file motd.pp <br> <br>
   #motd.pp

    node default {

    class {'motd':
            content => epp('motd/motd.epp',),
        }

    }