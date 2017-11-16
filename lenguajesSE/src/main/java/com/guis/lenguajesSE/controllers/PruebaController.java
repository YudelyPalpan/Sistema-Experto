package com.guis.lenguajesSE.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import net.sf.clipsrules.jni.Environment;
import net.sf.clipsrules.jni.FactAddressValue;
import net.sf.clipsrules.jni.MultifieldValue;


@Controller
@RequestMapping("/prueba")
public class PruebaController {
	
	@GetMapping("/p1")
	public String prueba1(Model model) {
		Environment clipsEnv = new Environment();
		clipsEnv.load("pruebaReglas.CLP");
		clipsEnv.eval("(assert (color (nombre azul)))");
		clipsEnv.run();
		
		MultifieldValue value = (MultifieldValue) clipsEnv.eval("(find-all-facts ((?c color)) TRUE)");
		String color = "";
		try {
			color = ((FactAddressValue) value.get(1)).getFactSlot("nombre").toString();
		} catch (Exception e) {
			System.out.println(e);
		}
		
		clipsEnv.reset();
		model.addAttribute("mensaje", color);
		return "prueba";
	}
	
	@PostMapping("/form")
	public String form(@RequestParam(name="mensajito") String mensajito) {
		System.out.println(mensajito);
		return "redirect:/prueba/p1";
	}
	
}
