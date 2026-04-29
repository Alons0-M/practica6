package com.uma.example.springuma.integration;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.condition.DisabledIfEnvironmentVariable;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.web.servlet.MockMvc;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.uma.example.springuma.integration.base.AbstractIntegration;
import com.uma.example.springuma.model.Medico;

public class MedicoControllerMockMvcIT extends AbstractIntegration {

    @Autowired
    private MockMvc mockMvc;

    @Autowired
    private ObjectMapper objectMapper;

    private Medico medico;

    @Test
    public void testCRUDEmpleado() throws Exception {
        Medico medico = new Medico();
        medico.setDni("12345678A");
        medico.setNombre("Dr. House");
        medico.setEspecialidad("Diagnóstico");

        // 1. Crear Médico
        mockMvc.perform(post("/medico")
                        .contentType("application/json")
                        .content(objectMapper.writeValueAsString(medico)))
                .andExpect(status().isCreated());

        // 2. Get por ID
        mockMvc.perform(get("/medico/1"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.nombre").value("Dr. House"));

        // 3. Actualizar
        medico.setId(1L);
        medico.setNombre("Dr. Gregory House");
        mockMvc.perform(put("/medico")
                        .contentType("application/json")
                        .content(objectMapper.writeValueAsString(medico)))
                .andExpect(status().isNoContent());

        // 4. Eliminar
        mockMvc.perform(delete("/medico/1"))
                .andExpect(status().isOk());
    }
}