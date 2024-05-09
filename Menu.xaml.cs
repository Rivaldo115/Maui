using Microsoft.Maui.Controls;
using MovilAPP1.Models;
using System;
using System.Collections.ObjectModel;
using System.Linq;

namespace MovilAPP1
{
    public partial class Menu : ContentPage
    {
        public ObservableCollection<MenuOption> MenuOptions { get; set; }

        public Menu()
        {
            InitializeComponent();

            // Inicialización de MenuOptions con tus opciones de menú
            MenuOptions = new ObservableCollection<MenuOption>
            {
                new MenuOption { IconPath = "Icons/book.svg", Title = "Monstruopedia", Description = "Muestra una lista de wyverns disponibles", OnClickCommand = new Command(OnMonstruopediaClicked) },
                new MenuOption { IconPath = "Icons/swords.png", Title = "Crear Wyvern", Description = "Permite crear una nuevo wyvern", OnClickCommand = new Command(OnCrearWyvernClicked) },
                new MenuOption { IconPath = "Icons/edit.svg", Title = "Editar Wyvern", Description = "Permite editar wyverns existentes", OnClickCommand = new Command(OnEditarWyvernClicked) },
                new MenuOption { IconPath = "Icons/delete.svg", Title = "Eliminar Wyvern", Description = "Permite eliminar wyverns de la mosntrupedia", OnClickCommand = new Command(OnEliminarWyvernClicked) }
            };
            BindingContext = this;
        }

        private void OnLogoutClicked(object sender, EventArgs e)
        {
            // Navegar a la página 
            Navigation.PushAsync(new MainPage());
        }

        private void OnMenuItemSelected(object sender, SelectionChangedEventArgs e)
        {
            var selectedOption = e.CurrentSelection.FirstOrDefault() as MenuOption;
            selectedOption?.OnClickCommand.Execute(null);
        }

        // Evento para la opción "Monstruopedia" del menú
        private void OnMonstruopediaClicked(object obj)
        {
            // Mostrar mensaje de depuración
            Console.WriteLine("Monstruopedia clickeado");

            // Navegar a la página Menu_Inventario
            Navigation.PushAsync(new Menu_Inventario());
        }

        // Lógica para la opción "Crear Wyvern"
        private void OnCrearWyvernClicked(object obj)
        {
            // Hacer la navegación a la página Menu_Crear
            Navigation.PushAsync(new Menu_Crear());
        }

        // Lógica para la opción "Editar Wyvern"
        private void OnEditarWyvernClicked(object obj)
        {
            // Navegar a la página 
            Navigation.PushAsync(new Menu_Editar());
        }

        // Lógica para la opción "Eliminar Wyvern"
        private void OnEliminarWyvernClicked(object obj)
        {
            // Navegar a la página 
            Navigation.PushAsync(new Menu_Eliminar());
        }

        // Método para manejar el evento Tapped de las tarjetas
        private void OnCardTapped(object sender, EventArgs e)
        {
            var selectedOption = (sender as Frame)?.BindingContext as MenuOption;
            selectedOption?.OnClickCommand.Execute(null);
        }
    }
}
