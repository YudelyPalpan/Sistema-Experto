package com.guis.lenguajesSE.controllers;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.guis.lenguajesSE.constants.ViewConstants;
import com.guis.lenguajesSE.model.Cuestionario;
import com.guis.lenguajesSE.services.Procesamiento;

@Controller
@RequestMapping("/se")
public class FormularioController {
	
	
	private static final Log LOG = LogFactory.getLog(FormularioController.class);
	
	@Autowired
	@Qualifier("procesamientoComponent")
	private Procesamiento procesamiento;
	
	@GetMapping("")
	public String showFormulario(Model model) {
		model.addAttribute("cuestionario", new Cuestionario());
		return ViewConstants.FORMULARIO;
	}
	
	@PostMapping("/evaluacion")
	public String showEvaluacion(
			Model model,
			@ModelAttribute(name="cuestionario") Cuestionario cuestionario
			) {
			LOG.info("El cuestionario es: " + cuestionario);
			
			List<String> lenguajes = procesamiento.getRespuestas(cuestionario);
			
			model.addAttribute("lenguajes", lenguajes );
			
		return "respuesta";
	}
}
