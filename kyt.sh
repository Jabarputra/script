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
BZh91AY&SY�  ��� }���ޮ����    P�� �e�	"L���O�S�O�?D�=OSMQ��C���z��F��L��&������F�FL�a �$I�j��"zCC��z�OH 4   �&������F�FL�a �$�&�Ri�e�hz�   �� $n��9<1a�����٣"���xz=�W_~��d���Y��G��H'b����7��T�1���>Y��iI	�~�΍���4o\S�¾{h�x���21wҌx�iij�uM/���-sLWS��r���'߿>T�p�4=�.����<޺�i4)Z3qc2c�95ZS�JX����!�t��;5*�[m�gL��ح��?~�>ʛ�u�0����-R&3�O��U��e��K��/#�:0%D�!��{�
��ä�ѡ���E�G^�E��r	M
��������X�O.�n]�9�R�G]z��26�
z?� 8��,1ww)�Q?�d�ܲ�F��s`�ȵ���~���;q�0����_��	�ۥSY)Hs��32bK䢵������'��\�P��b_��<�sͱ�yw�"��҈���%a��Ծ��e�c#�3qt�Xl��e��2�|�e�O��x��P�^�VPz�e�0�Qv����Ť��\ɏ
�O<Wt�����0߲�����d矴��T�n0P�1#�ȗ�|��T�X�pg@�B��yV�\�vW�fa�&�FM��-S�,��Ѫ��tA~���A��h������2Ы��=أ��'8��5T�h�-P�G����)0j�ġ7����4UʡyȂ{G�@-�my���F���|��Q�ȺS�O/�����s3 d���5W�J��Υrsz������E���1 :A�&E�'V3Bye_,�ܘ+Ee���
�
A��kZ�υC{����W�+�S)�a�v¡I�"�%8��d�팙,��Alm W���#0�o"RiA&5F��cP�)� p�`�$^��ϔ��Z�-�@��G��JM_��@�N�Z,�Ŋ��AaN��Tu	���$��K�!%:�rE8P��