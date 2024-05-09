using Microsoft.Maui.Controls;
using MovilAPP1.Services;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace MovilAPP1
{
    public partial class Menu_Inventario : ContentPage
    {
        private readonly WyvernService _wyvernService;

        public Menu_Inventario()
        {
            InitializeComponent();
            _wyvernService = new WyvernService("https://6637fe834253a866a24c8fc8.mockapi.io/prueba");
            CargarDatos();
        }

        private async void CargarDatos()
        {
            try
            {
                var wyverns = await _wyvernService.GetWyvernsAsync();

                if (wyverns != null && wyverns.Count > 0)
                {
                    var stackLayout = new StackLayout();

                    foreach (var wyvern in wyverns)
                    {
                        var wyvernStackLayout = CrearWyvernStackLayout(wyvern);
                        stackLayout.Children.Add(CrearFrame(wyvernStackLayout));
                    }

                    Content = new ScrollView { Content = stackLayout };
                }
                else
                {
                    Content = new Label
                    {
                        Text = "No se encontraron Wyverns",
                        HorizontalOptions = LayoutOptions.CenterAndExpand,
                        VerticalOptions = LayoutOptions.CenterAndExpand
                    };
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error al cargar los datos: {ex.Message}");
            }
        }

        private StackLayout CrearWyvernStackLayout(Wyvern wyvern)
        {
            string nombreTipoWyvern = ObtenerNombreTipoWyvern(wyvern.Tipo_WyvernId);

            var nombreLabel = new Label { Text = $"Nombre: {wyvern.Nombre}", FontAttributes = FontAttributes.Bold, FontSize = 16 };
            var elementoLabel = new Label { Text = $"Elemento: {wyvern.Elemento}", FontSize = 16 };
            var tipoWyvernLabel = new Label { Text = $"Tipo de Wyvern: {nombreTipoWyvern}", FontSize = 16 };

            var tapGestureRecognizer = new TapGestureRecognizer();
            tapGestureRecognizer.Tapped += async (sender, e) => await MostrarDetalles(wyvern);
            var frameContent = new StackLayout
            {
                Children =
                {
                    nombreLabel,
                    elementoLabel,
                    tipoWyvernLabel
                }
            };
            frameContent.GestureRecognizers.Add(tapGestureRecognizer);

            return frameContent;
        }

        private async Task MostrarDetalles(Wyvern wyvern)
        {
            await DisplayAlert("Detalles del Wyvern", $"Nombre: {wyvern.Nombre}\nElemento: {wyvern.Elemento}\nTipo de Wyvern: {ObtenerNombreTipoWyvern(wyvern.Tipo_WyvernId)}", "OK");
        }

        private Frame CrearFrame(StackLayout content)
        {
            return new Frame
            {
                Content = content,
                Margin = new Thickness(10),
                Padding = new Thickness(10),
                BackgroundColor = Color.FromHex("#ffffff"),
                CornerRadius = 10,
                HasShadow = true,
                WidthRequest = App.Current.MainPage.Width// Ajuste del ancho al 80% de la pantalla
            };
        }

        private string ObtenerNombreTipoWyvern(string idTipoWyvern)
        {
            var tiposDeWyvern = new[]
            {
                new { Nombre = "Wyvern de Colmillos", Id = "1" },
                new { Nombre = "Wyvern Bruto", Id = "2" },
                new { Nombre = "Wyvern Pajaro", Id = "3" },
                new { Nombre = "Wyvern Volador", Id = "4" },
                new { Nombre = "Leviathan", Id = "5" }
            };

            foreach (var tipo in tiposDeWyvern)
            {
                if (tipo.Id == idTipoWyvern)
                {
                    return tipo.Nombre;
                }
            }

            return "Desconocido"; // Manejar este caso según tu lógica
        }
    }
}
