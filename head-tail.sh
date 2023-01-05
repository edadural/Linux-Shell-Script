#/bin/bash!

FILE=`zenity --file-selection --title="Select a File"`


case $? in
	0)
		ilk_secim=$(zenity --forms --title="Satir secim" \
			--text="Ilk satir numarasini giriniz." \
			--separator="," \
			--add-entry="Ilk satir")
		
		son_secim=$(zenity --forms --title="Satir secim" \
			--text="Son satir numarasini giriniz." \
			--separator="," \
			--add-entry="Son satir")
		
		aralik=$(expr $son_secim - $ilk_secim)

		head -n$son_secim $FILE | tail -n$aralik
		
		zenity	--info \
			--text="Sonuc terminalde yazilmistir.";;

	1)
                echo "No file selected.";;
	-1)
                echo "An unexpected error has occurred.";;
esac
