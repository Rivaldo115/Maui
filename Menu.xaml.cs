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

            // Inicializaci�n de MenuOptions con tus opciones de men�
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
            // Navegar a la p�gina 
            Navigation.PushAsync(new MainPage());
        }

        private void OnMenuItemSelected(object sender, SelectionChangedEventArgs e)
        {
            var selectedOption = e.CurrentSelection.FirstOrDefault() as MenuOption;
            selectedOption?.OnClickCommand.Execute(null);
        }

        // Evento para la opci�n "Monstruopedia" del men�
        private void OnMonstruopediaClicked(object obj)
        {
            // Mostrar mensaje de depuraci�n
            Console.WriteLine("Monstruopedia clickeado");

            // Navegar a la p�gina Menu_Inventario
            Navigation.PushAsync(new Menu_Inventario());
        }

        // L�gica para la opci�n "Crear Wyvern"
        private void OnCrearWyvernClicked(object obj)
        {
            // Hacer la navegaci�n a la p�gina Menu_Crear
            Navigation.PushAsync(new Menu_Crear());
        }

        // L�gica para la opci�n "Editar Wyvern"
        private void OnEditarWyvernClicked(object obj)
        {
            // Navegar a la p�gina 
            Navigation.PushAsync(new Menu_Editar());
        }

        // L�gica para la opci�n "Eliminar Wyvern"
        private void OnEliminarWyvernClicked(object obj)
        {
            // Navegar a la p�gina 
            Navigation.PushAsync(new Menu_Eliminar());
        }

        // M�todo para manejar el evento Tapped de las tarjetas
        private void OnCardTapped(object sender, EventArgs e)
        {
            var selectedOption = (sender as Frame)?.BindingContext as MenuOption;
            selectedOption?.OnClickCommand.Execute(null);
        }
    }
}
