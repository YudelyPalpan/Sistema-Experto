package com.guis.lenguajesSE.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.guis.lenguajesSE.constants.ViewConstants;

@Controller
@RequestMapping("/se")
public class FormularioController {
	
	@GetMapping("")
	public String showFormulario() {
		return ViewConstants.FORMULARIO;
	}
}
