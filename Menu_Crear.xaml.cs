using Microsoft.Maui.Controls;
using MovilAPP1.Services;
using System;
using System.Net.Http;
using System.Text.Json;
using System.Threading.Tasks;

namespace MovilAPP1
{
    public partial class Menu_Crear : ContentPage
    {
        private readonly WyvernService _wyvernService;
        private readonly TipoWyvernService _tipoWyvernService;

        public Menu_Crear()
        {
            InitializeComponent();


            // Proporcionar la URL base de la API al crear una instancia de WyvernService y TipoWyvernService
            _wyvernService = new WyvernService("https://6637fe834253a866a24c8fc8.mockapi.io/prueba");
            _tipoWyvernService = new TipoWyvernService("https://6637fe834253a866a24c8fc8.mockapi.io/prueba");

            // Cargar los tipos de wyvern al inicializar la página
            CargarTiposWyvern();
        }

        // Método para cargar los tipos de wyvern
        private async Task CargarTiposWyvern()
        {
            try
            {
                // Obtener los tipos de wyvern desde el servicio
                var tiposWyvern = await _tipoWyvernService.GetTiposWyvernAsync();

                // Asignar los tipos de wyvern al Picker
                tipoWyvernPicker.ItemsSource = tiposWyvern;
                tipoWyvernPicker.ItemDisplayBinding = new Binding("Nombre");
            }
            catch (Exception ex)
            {
                // Manejar cualquier excepción al cargar los tipos de wyvern
                await DisplayAlert("Error", $"Ocurrió un error al cargar los tipos de wyvern: {ex.Message}", "Aceptar");
            }
        }

        // Método para guardar un wyvern
        private async void GuardarClicked(object sender, EventArgs e)
        {
            try
            {
                var nuevoWyvern = new Wyvern
                {
                    Nombre = nombreEntry.Text,
                    Elemento = elementoEntry.Text,
                    Tipo_WyvernId = ObtenerIdTipoWyvern(tipoWyvernPicker.SelectedItem.ToString())
                };

                // Imprimir la URL y los datos de la solicitud antes de enviarla
                Console.WriteLine("URL de la solicitud POST:");
                Console.WriteLine(_wyvernService.ApiUrl);
                Console.WriteLine("Datos de la solicitud POST:");
                Console.WriteLine(JsonSerializer.Serialize(nuevoWyvern));

                await GuardarWyvernAsync(nuevoWyvern);

                // Limpiar el formulario después de crear el wyvern
                LimpiarFormulario();
            }
            catch (Exception ex)
            {
                await DisplayAlert("Error", $"Ocurrió un error al guardar el wyvern: {ex.Message}", "Aceptar");
            }
        }

        // Método para obtener el ID del tipo de wyvern
        private string ObtenerIdTipoWyvern(string nombreTipo)
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
                if (tipo.Nombre == nombreTipo)
                {
                    return tipo.Id;
                }
            }

            return null; // Manejar este caso según tu lógica
        }

        // Método para guardar un wyvern en la API
        private async Task GuardarWyvernAsync(Wyvern nuevoWyvern)
        {
            try
            {
                // Serializar el nuevo wyvern a formato JSON
                var jsonNuevoWyvern = JsonSerializer.Serialize(nuevoWyvern);

                // Crear el contenido del mensaje HTTP
                var contenido = new StringContent(jsonNuevoWyvern, System.Text.Encoding.UTF8, "application/json");

                // Enviar la solicitud POST a la API
                using (var response = await _wyvernService.PostWyvernAsync(contenido))
                {
                    // Verificar si la solicitud fue exitosa
                    if (response.IsSuccessStatusCode)
                    {
                        // Mostrar un mensaje de éxito
                        await DisplayAlert("Éxito", "Se ha creado el wyvern correctamente.", "Aceptar");
                    }
                    else
                    {
                        // Mostrar un mensaje de error con la respuesta del servidor
                        var errorMessage = await response.Content.ReadAsStringAsync();
                        await DisplayAlert("Error", $"Ocurrió un error al crear el wyvern. Código de estado: {response.StatusCode}. Mensaje: {errorMessage}", "Aceptar");
                    }
                }
            }
            catch (Exception ex)
            {
                // Manejar cualquier excepción y mostrar un mensaje de error
                await DisplayAlert("Error", $"Ocurrió un error al crear el wyvern: {ex.Message}", "Aceptar");
            }
        }

        // Método para limpiar el formulario después de crear el wyvern
        private void LimpiarFormulario()
        {
            nombreEntry.Text = string.Empty;
            elementoEntry.Text = string.Empty;
            tipoWyvernPicker.SelectedIndex = 0;
        }

    }
}
