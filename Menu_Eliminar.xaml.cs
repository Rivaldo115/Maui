using Microsoft.Maui.Controls;
using MovilAPP1.Services;
using System;
using System.Threading.Tasks;

namespace MovilAPP1
{
    public partial class Menu_Eliminar : ContentPage
    {
        private readonly WyvernService _wyvernService;

        public Menu_Eliminar()
        {
            InitializeComponent();
            _wyvernService = new WyvernService("https://6637fe834253a866a24c8fc8.mockapi.io/prueba");
        }

        private async void BuscarClicked(object sender, EventArgs e)
        {
            try
            {
                string nombre = nombreEntry.Text.Trim();

                if (!string.IsNullOrEmpty(nombre))
                {
                    var wyverns = await _wyvernService.BuscarWyvernsPorNombreAsync(nombre);

                    if (wyverns != null && wyverns.Count > 0)
                    {
                        MostrarDatosWyvern(wyverns[0]);
                    }
                    else
                    {
                        await DisplayAlert("Error", "No se encontró ningún wyvern con el nombre especificado.", "Aceptar");
                    }
                }
                else
                {
                    await DisplayAlert("Error", "Debe especificar un nombre para buscar.", "Aceptar");
                }
            }
            catch (Exception ex)
            {
                await DisplayAlert("Error", $"Ocurrió un error al buscar el wyvern: {ex.Message}", "Aceptar");
            }
        }

        private async void EliminarClicked(object sender, EventArgs e)
        {
            try
            {
                string id = idEntry.Text.Trim();

                bool confirmarEliminacion = await DisplayAlert("Confirmar", "¿Estás seguro de que quieres eliminar este wyvern?", "Sí", "No");

                if (confirmarEliminacion)
                {
                    var wyvern = await _wyvernService.BuscarWyvernPorIdAsync(id);

                    if (wyvern != null && wyvern.Tipo_WyvernId != null)
                    {
                        string tipoWyvernId = wyvern.Tipo_WyvernId;

                        var response = await _wyvernService.EliminarWyvernAsync(tipoWyvernId, id);

                        if (response.IsSuccessStatusCode)
                        {
                            await DisplayAlert("Éxito", "Se eliminó el wyvern correctamente.", "Aceptar");
                            LimpiarFormulario();
                        }
                        else
                        {
                            await DisplayAlert("Error", $"Ocurrió un error al eliminar el wyvern. Código de estado: {response.StatusCode}", "Aceptar");
                        }
                    }
                    else
                    {
                        await DisplayAlert("Error", "No se pudo obtener el tipo de wyvern asociado al wyvern.", "Aceptar");
                    }
                }
            }
            catch (Exception ex)
            {
                await DisplayAlert("Error", $"Ocurrió un error al eliminar el wyvern: {ex.Message}", "Aceptar");
            }
        }

        private void MostrarDatosWyvern(Wyvern wyvern)
        {
            idEntry.Text = wyvern.id;
            nombreEntry.Text = wyvern.Nombre;
            elementoEntry.Text = wyvern.Elemento;
            tipoWyvernIdEntry.Text = wyvern.Tipo_WyvernId;

            idEntry.IsEnabled = false;
            nombreEntry.IsEnabled = false;
            elementoEntry.IsEnabled = false;
            tipoWyvernIdEntry.IsEnabled = false;

            idEntry.TextColor = Microsoft.Maui.Graphics.Colors.Black;
            nombreEntry.TextColor = Microsoft.Maui.Graphics.Colors.Black;
            elementoEntry.TextColor = Microsoft.Maui.Graphics.Colors.Black;
            tipoWyvernIdEntry.TextColor = Microsoft.Maui.Graphics.Colors.Black;
        }

        private void LimpiarFormulario()
        {
            idEntry.Text = string.Empty;
            nombreEntry.Text = string.Empty;
            elementoEntry.Text = string.Empty;
            tipoWyvernIdEntry.Text = string.Empty;
        }
    }
}
