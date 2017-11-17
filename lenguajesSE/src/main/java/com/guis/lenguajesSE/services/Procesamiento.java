package com.guis.lenguajesSE.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

import com.guis.lenguajesSE.model.Cuestionario;

import net.sf.clipsrules.jni.Environment;
import net.sf.clipsrules.jni.FactAddressValue;
import net.sf.clipsrules.jni.MultifieldValue;

@Component("procesamientoComponent")

public class Procesamiento {
	
	private static final Environment CLIPSENV = new Environment();
	
	public List<String> getRespuestas(Cuestionario cuestionario) {
		List<String> lenguajes = new ArrayList<>();
		
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
		
		CLIPSENV.load("lenguajes.CLP");
		
		CLIPSENV.eval(assert1);
		
		CLIPSENV.run();
		
		MultifieldValue value = (MultifieldValue) CLIPSENV.eval("(find-all-facts ((?r respuesta)) TRUE)");
		
		try {
			
			for (int i = 0; i < value.size(); i++) {
				String lenguaje = ((FactAddressValue) value.get(i)).getFactSlot("nombre").toString();
				lenguajes.add(lenguaje.replaceAll("\"", ""));
			}
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		CLIPSENV.reset();
		CLIPSENV.clear();
		
		return lenguajes;
	}
}
