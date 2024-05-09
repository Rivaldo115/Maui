using Microsoft.Maui.Controls;
using MovilAPP1.Services;
using System;
using System.Text.Json;
using System.Threading.Tasks;

namespace MovilAPP1
{
    public partial class Menu_Editar : ContentPage
    {
        private readonly WyvernService _wyvernService;
        private readonly TipoWyvernService _tipoWyvernService;

        public Menu_Editar()
        {
            InitializeComponent();
            _wyvernService = new WyvernService("https://6637fe834253a866a24c8fc8.mockapi.io/prueba");
            _tipoWyvernService = new TipoWyvernService("https://6637fe834253a866a24c8fc8.mockapi.io/prueba");
        }

        protected override async void OnAppearing()
        {
            base.OnAppearing();
            await CargarTiposWyvern();
        }

        private async Task CargarTiposWyvern()
        {
            try
            {
                var tiposWyvern = await _tipoWyvernService.GetTiposWyvernAsync();
                tipoWyvernPicker.ItemsSource = tiposWyvern;
                tipoWyvernPicker.ItemDisplayBinding = new Binding("Nombre");
            }
            catch (Exception ex)
            {
                await DisplayAlert("Error", $"Ocurrió un error al cargar los tipos de wyvern: {ex.Message}", "Aceptar");
            }
        }

private async void TipoWyvernPicker_SelectedIndexChanged(object sender, EventArgs e)
{
    var picker = (Picker)sender;
    var tipoWyvernSeleccionado = (TipoWyvern)picker.SelectedItem;

    if (tipoWyvernSeleccionado != null)
    {
        ((Wyvern)BindingContext).Tipo_WyvernId = tipoWyvernSeleccionado.Id;
    }
    else
    {
        ((Wyvern)BindingContext).Tipo_WyvernId = null;
    }
}

        private TipoWyvern ObtenerTipoWyvernPorNombre(string nombreTipo)
        {
            foreach (TipoWyvern tipoWyvern in tipoWyvernPicker.ItemsSource)
            {
                if (tipoWyvern.Nombre == nombreTipo)
                {
                    return tipoWyvern;
                }
            }
            return null;
        }



        private async void BuscarClicked(object sender, EventArgs e)
        {
            try
            {
                string nombre = nombreEntry.Text.Trim();

                if (string.IsNullOrEmpty(nombre))
                {
                    await DisplayAlert("Error", "Debe especificar al menos un nombre para buscar.", "Aceptar");
                    return;
                }

                // Depuración: Imprimir el nombre utilizado para la búsqueda
                Console.WriteLine($"Nombre de búsqueda: {nombre}");

                // Depuración: Imprimir la URL utilizada para la búsqueda
                Console.WriteLine($"URL de búsqueda: {_wyvernService.ApiUrl}/Wyverns?Nombre={nombre}");

                var wyverns = await _wyvernService.BuscarWyvernsPorNombreAsync(nombre);



                if (wyverns != null && wyverns.Count > 0)
                {
                    MostrarDatosWyvern(wyverns[0]);
                    nombreEntry.Text = wyverns[0].Nombre;
                    nombreEntry.Unfocus();
                }
                else
                {
                    await DisplayAlert("Error", "No se encontró ningún wyvern con el nombre especificado.", "Aceptar");
                }
            }
            catch (Exception ex)
            {
                await DisplayAlert("Error", $"Ocurrió un error al buscar el wyvern: {ex.Message}", "Aceptar");
            }
        }

        private async void MostrarDatosWyvern(Wyvern wyvern)
        {
            idEntry.Text = wyvern.id;
            elementoEntry.Text = wyvern.Elemento;
            tipoWyvernPicker.SelectedItem = ObtenerTipoWyvernSeleccionado(wyvern.Tipo_WyvernId);

            idEntry.IsEnabled = false;
            idEntry.TextColor = Colors.Black;
        }

        private TipoWyvern ObtenerTipoWyvernSeleccionado(string tipoWyvernId)
        {
            foreach (TipoWyvern tipoWyvern in tipoWyvernPicker.ItemsSource)
            {
                if (tipoWyvern.Id == tipoWyvernId)
                {
                    return tipoWyvern;
                }
            }
            return null;
        }

        private async void ActualizarClicked(object sender, EventArgs e)
        {
            try
            {
                string id = idEntry.Text;
                var tipoWyvernId = tipoWyvernPicker.SelectedIndex + 1;


                // Depuración: Imprimir información de depuración antes de actualizar el Wyvern
                Console.WriteLine($"ID del Wyvern: {id}");
                Console.WriteLine($"Tipo de Wyvern seleccionado: {tipoWyvernId}");

                var wyvern = new Wyvern
                {
                    Nombre = nombreEntry.Text,
                    Elemento = elementoEntry.Text,
                    id = id,
                    Tipo_WyvernId = tipoWyvernId.ToString()
                };

                // Depuración: Imprimir el objeto Wyvern que se enviará para la actualización
                Console.WriteLine("Objeto Wyvern a actualizar:");
                Console.WriteLine(JsonSerializer.Serialize(wyvern));

                var jsonWyvern = JsonSerializer.Serialize(wyvern);
                var content = new StringContent(jsonWyvern, System.Text.Encoding.UTF8, "application/json");
                var response = await _wyvernService.PutWyvernAsync(id, content);

                // Depuración: Imprimir el código de estado de la respuesta
                Console.WriteLine($"Código de estado de la respuesta: {response.StatusCode}");

                if (response.IsSuccessStatusCode)
                {
                    await DisplayAlert("Éxito", "Se actualizó el wyvern correctamente.", "Aceptar");
                    LimpiarFormulario();
                }
                else
                {
                    await DisplayAlert("Error", $"Ocurrió un error al actualizar el wyvern. Código de estado: {response.StatusCode}", "Aceptar");
                }
            }
            catch (Exception ex)
            {
                await DisplayAlert("Error", $"Ocurrió un error al actualizar el wyvern: {ex.Message}", "Aceptar");
            }
        }


        private void LimpiarFormulario()
        {
            idEntry.Text = string.Empty;
            nombreEntry.Text = string.Empty;
            elementoEntry.Text = string.Empty;
            tipoWyvernPicker.SelectedItem = null;
        }
    }
}
