#!/bin/bash

function table {  #функция для обработки файлов
 for file in "$1"/*  #цикл для перебора файлов
  do
  this_file="${file##*/}" #выделение имени файла из абсолютного пути
  if [ -d "$file" ] #проверка - является ли файл директорией
  then
   table "$file" #рекурсивный вызов функции для вложенной директории
  else
   name="${this_file%.[^.]*}" #выделение имени файла
   extension="${this_file##*.}" #выделение расширения файла
   data_of_change=$(date +%Y-%m-%d -r "$file" 2>/dev/null)  #дата последнего изменения
   if [[ -z "$name" && -n "$extension" ]]; then          #проверка для файлов без имени
    name=".$extension"
    extension=""
   fi
   size=$(wc -c 2>/dev/null <"$file" | awk '{print $1}' ) #получение размера файла в байтах
   let "size = "$size"  /1024"                            #в килобайтах
   duration_sec=$(ffmpeg -i $file 2>&1 | grep Duration | awk '{print $2}') # получение длины видео
   filepath="${file%/*}"                                                   #получение пути к файлу
   echo -e "$name \t $extension \t $data_of_change \t $size "kB"  \t $filepath \t $duration_sec"  >> result.xls #дозапись строки вывода в файл
   fi
  done
}
rm "$HOME/result.xls"                                 #удаление предыдущего результата
IFS=$'\t'
echo "Enter the name of the directory"                #запрос директории для перебора
read div                                              #считывание данных из командной строки
if [ -d "$div" ]; then                                #проверка на верность пути
  table "$div"                                        # вызов функции для обработки файлов в директории
else
  echo "Error 000"                                    #сообщеие об ошибке
fi
echo "The end"
