   M S B A M L   `   `   `  ����G  CMQTT_NetCore, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null+clr-namespace:MQTT_NetCoreMQTT_NetCore  5   	       MQTT_NetCore.MainWindow   5   	   W SPresentationCore, Version=5.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=5.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=5.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=5.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=5.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   ,localclr-namespace:MQTT_NetCore     5   	     � Title$
  MQTT��5   	   $	��587��6   $	��568��6#    � WindowStartupLocation$ CenterScreen=�6/    � Icon$ 	/Mqtt.png��6T   .��5	      � $��	0,0,10,12q�6    � ColumnDefinitions 5
   
   �� 5      .+�5   
   �� $��ConnectionString:��6   $
��Left=�6,   $��	19,55,0,0q�6G   $	��Top=�6Z   �� 5   
   $��	ClientId:��6   $
��Left=�6$   $��	19,86,0,0q�6?   $	��Top=�6R   �� 5   
   $��Puerto:��6   $
��Left=�6"   $��
296,86,0,0q�6=   $	��Top=�6Q   �� 5   
   $��
User Name:��6   $
��Left=�6%   $��
19,117,0,0q�6@   $	��Top=�6T   �� 5   
   $��Pass:��6   $
��Left=�6    $��237,117,0,0q�6;   $	��Top=�6P   �� 5   
   -   5         ��Name$
 Conn��5      $
��Left=�6    $��
141,59,0,0q�6;   $��	localhost��6O    �� TextWrapping$
 Wrap=�6`   $	��Top=�6t   $	��271��6�   �� 5   
   -   5        $ CteId��5      $
��Left=�6!   $��	95,90,0,0q�6<   $
 Wrap=�6O   $	��Top=�6c   $	��186��6{   �� 5   
   -   5        $	 Pto��5      $
��Left=�6   $��
355,90,0,0q�6:   $
��1883��6N   $
 Wrap=�6Z   $	��Top=�6n   $��61��6�   �� 5   
   -   5        $
 User��5      $
��Left=�6    $��103,121,0,0q�6;   $��mqadmin��6P   $
 Wrap=�6_   $	��Top=�6s   $	��120��6�   �� 5   
   -   5        $
 Pass��5      $
��Left=�6    $��277,121,0,0q�6;   $��mqadminpassword��6P   $
 Wrap=�6g   $	��Top=�6{   $	��139��6�   �� 5   
   $��Cliente MQTT��6   $
��Left=�6'   $��
218,10,0,0q�6B   $	��Top=�6V   $��18(�6n   $
��Bold"�6|   �� 5   
   $��Topic:��6   $
��Left=�6!   $��
19,152,0,0q�6<   $	��Top=�6P   �� 5   
   -   5        $ TopicCon��5      $
��Left=�6$   $��
85,156,0,0q�6?   $��telemetria/1/50/lecturas��6S   $
 Wrap=�6s   $	��Top=�6�   $	��229��6�   �� 5   
   -   5         ��Name$ 	BConectar��5      $��Conectar��6$   $
��Left=�67   $��
450,59,0,0q�6R   $	��Top=�6f   $��26��6~   $��79��6�   6�   �� 5   
   $��Enviar Mensaje:��6   $
��Left=�6*   $��
19,200,0,0q�6E   $	��Top=�6Y   $
��Bold"�6q   �� 5   
   $��Topic:��6   $
��Left=�6!   $��
19,231,0,0q�6<   $	��Top=�6P   �� 5   
   -   5        $ TopicEnv��5      $
��Left=�6$   $��
76,235,0,0q�6?   $��telemetria/1/50/comandos��6S   $
 Wrap=�6s   $	��Top=�6�   $	��238��6�   �� 5   
   $��Mensaje:��6   $
��Left=�6#   $��
18,266,0,0q�6>   $	��Top=�6R   �� 5   
   -	   5        $	 Msg��5      $
��Left=�6   $��
82,270,0,0q�6:   $
 Wrap=�6N   $	��Top=�6b   $	��346��6z   �� 5    
   -
   5        $ BEnviar��5       $��Enviar��6"   $
��Left=�63   $��450,224,0,0q�6N   $	��Top=�6c    J� RenderTransformOrigin$ -0.205,-0.248&�6{   $��79��6�   $��26��6�   6�   �� 5!   
   -   5        $ BLimpiar��5!      $��Limpiar��6#   $
��Left=�65   $��450,262,0,0q�6P   $	��Top=�6e   $��26��6}   $��79��6�   6�   �� 5"   
   $��Mensaje Recibido:��6   $
��Left=�6,   $��
19,315,0,0q�6G   $	��Top=�6[   $
��Bold"�6s   �� 5#   
   -   5        $ Recib��5#      $
��Left=�6!   $	��143��6<   $��
28,360,0,0q�6I   $
 Wrap=�6]   $	��Top=�6q   $	��480��6�    �� AcceptsReturn$
 True��6�   $
��True��6�   �� 5$   
   -   5        	 ��Name$	 BEstado��5$      $��Estado: Desconectado��6!   $
��Left=�6@   $��
18,508,0,0q�6[   $	��Top=�6o   $	��530��6�   �� 5%   
   -   5        $ BDesconecta��5%      $��Desconectar��6&   $
��Left=�6<   $��450,117,0,0q�6W   $	��Top=�6l   $��26��6�   $��79��6�   6�   5'      5(      