using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Text.Json;
using System.Threading.Tasks;

namespace MovilAPP1.Services
{
    public class TipoWyvernService
    {
        protected readonly HttpClient _httpClient;
        protected string ApiUrl { get; }

        public TipoWyvernService(string apiUrl)
        {
            _httpClient = new HttpClient();
            ApiUrl = apiUrl;
        }

        // Método para enviar un nuevo tipo de wyvern a la API
        public async Task<HttpResponseMessage> PostTipoWyvernAsync(HttpContent content)
        {
            return await _httpClient.PostAsync(ApiUrl + "/Tipo_Wyvern", content);
        }

        // Método para actualizar un tipo de wyvern existente en la API
        public async Task<HttpResponseMessage> PutTipoWyvernAsync(string id, HttpContent content)
        {
            var url = $"{ApiUrl}/Tipo_Wyvern/{id}";
            return await _httpClient.PutAsync(url, content);
        }

        // Método para buscar tipos de wyverns por nombre
        public async Task<List<TipoWyvern>> BuscarTiposWyvernPorNombreAsync(string nombre)
        {
            var url = $"{ApiUrl}/Tipo_Wyvern?nombre={nombre}";
            var response = await _httpClient.GetAsync(url);
            return await DeserializeResponse<List<TipoWyvern>>(response);
        }

        // Método para buscar un tipo de wyvern por su ID
        public async Task<TipoWyvern> BuscarTipoWyvernPorIdAsync(string id)
        {
            var url = $"{ApiUrl}/Tipo_Wyvern/{id}";
            var response = await _httpClient.GetAsync(url);
            return await DeserializeResponse<TipoWyvern>(response);
        }

        // Método para eliminar un tipo de wyvern existente en la API
        public async Task<HttpResponseMessage> EliminarTipoWyvernAsync(string id)
        {
            var url = $"{ApiUrl}/Tipo_Wyvern/{id}";
            return await _httpClient.DeleteAsync(url);
        }

        // Método para procesar la respuesta de la API y deserializar los datos
        private async Task<T> DeserializeResponse<T>(HttpResponseMessage response)
        {
            if (response.IsSuccessStatusCode)
            {
                var content = await response.Content.ReadAsStringAsync();
                return JsonSerializer.Deserialize<T>(content);
            }
            else
            {
                throw new HttpRequestException($"Error al obtener el objeto. Código de estado: {response.StatusCode}");
            }
        }

        // Método para obtener todos los tipos de wyverns de la API
        public async Task<List<TipoWyvern>> GetTiposWyvernAsync()
        {
            var response = await _httpClient.GetAsync(ApiUrl + "/Tipo_Wyvern");
            return await DeserializeResponse<List<TipoWyvern>>(response);
        }
    }

    public class TipoWyvern
    {
        public string Nombre { get; set; }
        public string Id { get; set; }
    }
}
