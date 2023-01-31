# Principes
On ne peut pas compter sur le MD5 des fournisseurs ou des services versants. Car ceux-ci sont pratiquement pas comparables. Ainsi par exemple, pour le cas du projet de carthothèque, les aspects suivants empêchent la comparaison:
- les checksum et le fichiers qui les listes ont été fait sous Windows -> niveaux du chemin relatif des fichiers est séparés par des backslash alors que nous avons des forwardslash
- les caractères alphabetiques de l'output du MD5 sont en majucules dans un cas et en minucules dans l'autre
- le point de départ du chemin relatif des fichiers est implicite dans le fichier fournisseur alors qu'il indiqué explicitement dans notre cas (.\\)

Tous ces points pourraient être corrigé par script. Mais comme au final, le MD5 n'est pas le meilleur algorithme, mieux vaut les refaire en lançant le calcul sur le support de versement avant toute copie pour générer nous même ces checksums.
Note: l'algorithme qui devrait être privilégié est crc32

### Fichier livré par le fournisseur

    1487777C991ECE172AF055833FA82C63  PDF\MCBA_cartotheque_A.pdf
    8E50DBED2D62193A1BD51A4E1B96DC93  PDF\MCBA_cartotheque_B.pdf

### Fichier générés par nos soins

    1487777c991ece172af055833fa82c63  ./PDF/MCBA_cartotheque_A.pdf
    8e50dbed2d62193a1bd51a4e1b96dc93  ./PDF/MCBA_cartotheque_B.pdf

# var
target relative path to files: ./* ou ./FILES_FOLDER/*

# Pseudocode
   
1. extract MD5 and store output // see https://askubuntu.com/questions/662339/sort-files-alphabetically-before-processing

    find . -type f -print0 | sort -z | xargs -r0 md5sum > checklist.chk
