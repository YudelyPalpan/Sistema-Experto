package com.guis.lenguajesSE.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

import com.guis.lenguajesSE.model.Cuestionario;

import net.sf.clipsrules.jni.Environment;
import net.sf.clipsrules.jni.FactAddressValue;
import net.sf.clipsrules.jni.MultifieldValue;

@Component("procesamientoComponent")
/**
 * <p>
 * Clase que procesa un objeto Cuestionario que representa el formulario de preguntas
 * y obtiene una lista de repuestas para el problema de clasificar Lenguajes de Programación
 * </p> 
 * @author guis
 *
 */
public class Procesamiento {
	
	// Variable estatica que crea el ambiente de CLIPS en Java
	private static final Environment CLIPSENV = new Environment();
	
	/**
	 * Metodo que devueve una lista de Lenguajes de Programación inferidos
	 * a traves de las respuestas de un cuestionario.
	 * @param cuestionario
	 * @return
	 * Lista de Lenguajes respuesta
	 */
	public List<String> getRespuestas(Cuestionario cuestionario) {
		
		List<String> lenguajes = new ArrayList<>();
		
		
		
		// Transformación del objeto cuestionario a un ASSERT de CLIPS
		String assert1 = "(assert "
				+ "(cap-equipo (cantMiembros "+ cuestionario.getDesarrolladores() +") "
				+ "(exp " + cuestionario.getExp() +"))"
				+ "(lenguajes "
					+ "(plataforma " + cuestionario.getPlataforma() + ") "
					+ "(paradigma \"" + cuestionario.getParadigma() + "\") "
					+ "(area-aplicacion " + cuestionario.getTipoSistema() +") "
					+ "(uso-BD " + cuestionario.getBd() + ") "
					+ "(calidad-interfaz " + cuestionario.getInterfaz() + ")"
				+ "))";
		
		// Cargamos el script de CLIPS
		CLIPSENV.load("lenguajes.CLP");
		
		CLIPSENV.eval("(set-strategy lex)");
		
		// Evaluamos el la expresión
		CLIPSENV.eval(assert1);
		
		// Corremos las reglas
		CLIPSENV.run();
		
		// Recogemos los hechos que coincidan con el template respuesta
		MultifieldValue value = (MultifieldValue) CLIPSENV.eval("(find-all-facts ((?r r-final)) TRUE)");
		
		try {
			// Iteramos la respuesta
			for (int i = 0; i < value.size(); i++) {
				String lenguaje = ((FactAddressValue) value.get(i)).getFactSlot("nombre").toString();
				lenguajes.add(lenguaje.replaceAll("\"", ""));
			}
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		// Reseteamos y limpiamos el ambiente
		CLIPSENV.reset();
		CLIPSENV.clear();
		
		return lenguajes;
	}
}
