#!/bin/bash
clear
# Initialise the Title Art
file1="../art/titleart.ben"
while IFS= read -r line
do
    echo "$line"
done <"$file1"
echo

#Setting up the room...
sleep 1
echo "Vous parcourez un chemin qui monte en direction du nord.."
echo "Au sommet de cette petite colline vous découvrez un magestueux chêne"
echo "trônant au centre d'une clairière lumineuse. La forêt à cet endroit"
echo "forme un cercle tout autour..."
echo
echo "Un Astroport fait de vitres, de planches et de chevrons"
echo "est posé là. Eclairé par les rayons du soleil."
echo
# Here we're going to check to see if the lever - the only logic we are using in this game - is on or off.
leverstate=`cat ../logic/leverlogic.ben`
            if [ "$leverstate" = "on" ]; then
                echo "Une porte sur la façade est entrouverte. Vous devriez entrer..."
            else
                echo "Vous en faites le tour..."
                echo "Aucune entrée n'est visible."
            fi

echo
echo "Pas d'autre chemin praticable que celui d'où vous venez."
echo
echo "Que voulez-vous faire ?"

# Now lets capture this room's actions. Note that here, the actions change depending on whether or not
# the lever is on or off. If it's on, you go elsewhere. If it's off, you don't.
while true; do
    read -p "> " nsewuh
    case $nsewuh in
        n ) echo "Vous vous aventurez dans la forêt plus au nord. Sans boussole, vous allez vous vous perdez rapidement... "
            exit ;;
        s ) ./mainroom.sh
            exit ;;
        e ) echo "Vous arrivez le long d'une corniche qui surplombe un ruisseau qui coule dans le fond de la ravine. Impossible de passer" ;;
        w ) echo "Vous voilà face à un Jardin luxuriant. Une cloture électrique en délimite et empêche l'accès." ;;
        h )  echo "Vous apercevez à l'interieur une video en cours de projection..."
                sleep 2
              xdg-open "https://www.youtube.com/embed/Yk-WRXKysXM"
            ;;
        u ) leverstate=`cat ../logic/leverlogic.ben`
            if [ "$leverstate" = "on" ]; then
                ./kroo.sh
                exit
            else
                echo "Vous essayez de trouver une ouverture... Impossible d'entrer."
            fi
            ;;
        * ) echo "Je suis désolé, je ne vous comprends pas. Les commandes sont : n, e, s, w, u et h..";;
    esac
done

esac
exit
