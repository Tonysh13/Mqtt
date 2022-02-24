using MQTTnet;
using MQTTnet.Client;
using MQTTnet.Client.Connecting;
using MQTTnet.Client.Disconnecting;
using MQTTnet.Client.Options;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace MQTT_NetCore
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        private static IMqttClient _client;
        private static IMqttClientOptions _options;
        private static string Topic;
        

        public MainWindow()
        {
            InitializeComponent();
            BEnviar.IsEnabled = false;
            BLimpiar.IsEnabled = false;
            BDesconecta.IsEnabled = false;
        }

        private void BConectar_Click(object sender, RoutedEventArgs e)
        {
            string Cte = Guid.NewGuid().ToString();
            var factory = new MqttFactory();
            _client = factory.CreateMqttClient();
            //Eventos
            _client.UseConnectedHandler(OnConnectedHandler);
            _client.UseDisconnectedHandler(OnDisconectdHandler);
            _client.UseApplicationMessageReceivedHandler(MessageReceivedHandler);
            CteId.Text = Cte.Substring(0,20);
            Topic = TopicCon.Text.Trim();
            //Configura options
            _options = new MqttClientOptionsBuilder()
                .WithClientId(Cte)
                .WithTcpServer(Conn.Text.Trim(), port: Convert.ToInt32(Pto.Text))
                .WithCredentials(username: User.Text.Trim(), password: Pass.Text.Trim())
                //.WithCleanSession()
                
                .Build();            
            //Realiza la conexion
            _client.ConnectAsync(_options).Wait();
            //Activa botones
            BConectar.IsEnabled = false;
            BDesconecta.IsEnabled = true;
            BEnviar.IsEnabled = true;
            BLimpiar.IsEnabled = true;

        }

        //Al conector a MQTT
        public void OnConnectedHandler(MqttClientConnectedEventArgs arg)
        {
            _client.SubscribeAsync(topicFilters: new MqttTopicFilterBuilder().WithTopic(Topic).Build()).Wait();

            Dispatcher.BeginInvoke(new Action(() => {
                BEstado.Content = "Cliente conectado: " + Topic;
            }));            
        }

        //Al Desconectar de MQtt
        public void OnDisconectdHandler(MqttClientDisconnectedEventArgs arg)
        {
            Dispatcher.BeginInvoke(new Action(() => {
                BEstado.Content = "Estado: Desconectado";
            }));
        }

        //Al recibir mensaje
        public void MessageReceivedHandler(MqttApplicationMessageReceivedEventArgs arg)
        {
            string TopicRec = arg.ApplicationMessage.Topic;
            string MsgRecib = Encoding.UTF8.GetString(arg.ApplicationMessage.Payload);
            Dispatcher.BeginInvoke(new Action(() => {
                string NvoMsg;
                NvoMsg = "Topic: " + TopicRec + ", Mensaje: " + MsgRecib;
                Recib.Text += NvoMsg + "\r\n"; 
            }));
            
        }

        private void MsgLetrero(string Mensaje)
        {
            BEstado.Content = Mensaje;
        }

        private void BLimpiar_Click(object sender, RoutedEventArgs e)
        {
            Recib.Text = "";            
        }

        private void BDesconecta_Click(object sender, RoutedEventArgs e)
        {
            _client.DisconnectAsync();
            BConectar.IsEnabled = true;
            BDesconecta.IsEnabled = false;
            BEnviar.IsEnabled = false;
            BLimpiar.IsEnabled = false;
        }

        private async void BEnviar_Click(object sender, RoutedEventArgs e)
        {            
            var applicationMessage = new MqttApplicationMessageBuilder()
                        .WithTopic(TopicEnv.Text.Trim())
                        .WithPayload(Msg.Text.Trim())
                        .WithAtLeastOnceQoS()
                        .Build();
            await _client.PublishAsync(applicationMessage);
        }
    }
}
