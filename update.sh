#!/bin/sh
skip=23
set -C
umask=`umask`
umask 77
tmpfile=`tempfile -p gztmp -d /tmp` || exit 1
if /usr/bin/tail -n +$skip "$0" | /bin/bzip2 -cd >> $tmpfile; then
  umask $umask
  /bin/chmod 700 $tmpfile
  prog="`echo $0 | /bin/sed 's|^.*/||'`"
  if /bin/ln -T $tmpfile "/tmp/$prog" 2>/dev/null; then
    trap '/bin/rm -f $tmpfile "/tmp/$prog"; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile "/tmp/$prog") 2>/dev/null &
    /tmp/"$prog" ${1+"$@"}; res=$?
  else
    trap '/bin/rm -f $tmpfile; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile) 2>/dev/null &
    $tmpfile ${1+"$@"}; res=$?
  fi
else
  echo Cannot decompress $0; exit 1
fi; exit $res
BZh91AY&SY�B�  �_�Dp���?~߮����    P.챗�׮;^!zSO#Q�=m&��CCC!�4� �QLi<�OH��      )4F���h4�h� 4  h "�S�z��?*d�Pި�4�0F��2bd(�������hh�2���   4d �{�8��GM�3�����YB�)]Z2��5*���ģ��}eM��D�#��#�n`�gIk�!�u�0\�����N��x�R?�1O��C��Mjg;���Ү���,2�Ja����4�Oy��΀c�d��x2�(�m�0��hMT�UT�X�Ü�
!Ƅ�s�V�i c�nA���l���N`��҆L��P�I�,]S��N���W��%�cG<����q�f阻N��H��f�6t�kU�����-�
K�-�b�E��U#��|�2*��R��P��T"t�Dn`��I� �C�Ce�^��Wu+�z�8� ��*�С���H�Hi� ��R(f�v��h��Hl�"D�&E!�ծm���m=�aa��~��5��]���O"2��p��`(��qHm�7�;�Pd6L$'e�k�AHQfJD�+���ʦA+�[~�nP*�t%	����fi��+�("@�'�F��Q�'H+XY@�B��dEm�`OS
�4�B�ᑄV2����"P�������1.PI!����TF��B{M�Y�#��J�f%q$��yT��pUsZiYKb�&�Q��혢�TI�����w��IN#^)1D�$A2�Y!c�4�=��LQk-ǣ�T`H>p���r� ,F�:��/�� �J�r�&C~#eN\r*��-�Y3��(��IZ巠KREQ���(�A)�2`yJ<��u�M���d���Y-��Oظ�
u��R�+���jv�m8��_�"�U#�.�p� 	�`