# Script by James Brotosky
#!/bin/sh 
echo 'Which file would you like to overwrite?'
OPTIONS=("Access Log"
        "Error Log"
        "Custom File")


select opt in "${OPTIONS[@]}"


do
        case $opt in
                "Access Log")
                file=/root/*/access_log


                maximumsize=5
                fsize=$(wc -c  $file | awk '{print $1}' );


                if (( "$fsize" >= "$maximumsize" )) ; then
                        echo 'File is ' $fsize 'bytes, which is greater than 10 GB'
                        read -p "Would like to overwrite the Access Log? [Y/n] " CONT
        
                                if [ "$CONT" = "y" ]; then 
                                cat /dev/null > $file
        
                                elif [ "$CONT" = "Y" ]; then
                                cat /dev/null > $file
                                
                                elif [ "$CONT" = "n" ]; then
                                break
                        
                                else exit
        
                        fi
   
                else
                        echo 'Access Log is not over 10 GB'        
        fi
break
;;
                "Error Log")
                file=/root/*/error_log
                maximumsize=5
                fsize=$(wc -c $file | awk '{print $1}' );
                
                if (( "$fsize" >= "$maximumsize" )) ; then
                        echo 'File is ' $fsize 'bytes, which is greater than 10GB'
                        read -p "Would like to overwrite the Error Log? [Y/n] " CONT


                                if [ "$CONT" = "y" ] ; then
                                cat /dev/null > $file
                                
                                elif [ "$CONT" = "Y" ] ; then
                                cat /dev/null > $file


                                else exit
        
                        fi
                else
                echo 'Error Log is not over 10 GB'


        fi
break
;;


                "Custom File")
                echo 'Please input the full path of the file you wish to overwrite'
                read file
                maximumsize=5
                fsize=$(wc -c $file | awk '{print $1}' );


                if (( "$fsize" >= "$maximumsize" )) ; then
                        echo 'File is ' $fsize 'bytes, which is greater than 10GB'
                        read -p "Would like to overwrite the "\"$file"\" ? [Y/n] " CONT
                
                                if [ "$CONT" = "y" ] ; then
                                cat /dev/null > $file
                        
                                elif [ "$CONT" = "Y" ] ; then
                                cat /dev/null > $file


                                else exit


                        fi
                else
                echo $file 'is not over 10 GB'
        fi
break
;;
                *)
                echo 'Invaild Option'
;;
esac
done
exit
