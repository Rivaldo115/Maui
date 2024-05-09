using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Text.Json;
using System.Threading.Tasks;

namespace MovilAPP1.Services
{
    public class WyvernService
    {
        private readonly HttpClient _httpClient;
        public string ApiUrl { get; }

        public WyvernService(string apiUrl)
        {
            _httpClient = new HttpClient();
            ApiUrl = apiUrl;
        }

        public async Task<HttpResponseMessage> PostWyvernAsync(HttpContent content)
        {
            var url = $"{ApiUrl}/Wyverns";
            return await _httpClient.PostAsync(url, content);
        }


        public async Task<HttpResponseMessage> PutWyvernAsync(string id, HttpContent content)
        {
            var url = $"{ApiUrl}/Wyverns/{id}";
            return await _httpClient.PutAsync(url, content);

        }

        public async Task<List<Wyvern>> BuscarWyvernsPorNombreAsync(string nombre)
        {
            var url = $"{ApiUrl}/Wyverns?Nombre={nombre}";
            var response = await _httpClient.GetAsync(url);
            return await DeserializeResponse<List<Wyvern>>(response);
        }

        public async Task<Wyvern> BuscarWyvernPorIdAsync(string id)
        {
            var url = $"{ApiUrl}/Wyverns/{id}";
            var response = await _httpClient.GetAsync(url);
            return await DeserializeResponse<Wyvern>(response);
        }

        public async Task<HttpResponseMessage> EliminarWyvernAsync(string tipoWyvernId, string wyvernId)
        {
            var url = $"{ApiUrl}/Tipo_Wyvern/{tipoWyvernId}/Wyverns/{wyvernId}";
            return await _httpClient.DeleteAsync(url);
        }

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

        public async Task<List<Wyvern>> GetWyvernsAsync()
        {
            var response = await _httpClient.GetAsync($"{ApiUrl}/Wyverns");
            return await DeserializeResponse<List<Wyvern>>(response);
        }
    }

    public class Wyvern
    {
        public string Nombre { get; set; }
        public string Elemento { get; set; }
        public string id { get; set; }
        public string Tipo_WyvernId { get; set; }
    }
}
