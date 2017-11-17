package com.guis.lenguajesSE.model;

public class Cuestionario {
	
	private String tipoSistema;
	private String plataforma;
	private String paradigma;
	private String bd;
	private String interfaz;
	private String desarrolladores;
	private String exp;
	
	public Cuestionario () { }

	public String getTipoSistema() {
		return tipoSistema;
	}

	public void setTipoSistema(String tipoSistema) {
		this.tipoSistema = tipoSistema;
	}

	public String getPlataforma() {
		return plataforma;
	}

	public void setPlataforma(String plataforma) {
		this.plataforma = plataforma;
	}

	public String getParadigma() {
		return paradigma;
	}

	public void setParadigma(String paradigma) {
		this.paradigma = paradigma;
	}

	public String getBd() {
		return bd;
	}

	public void setBd(String bd) {
		this.bd = bd;
	}

	public String getInterfaz() {
		return interfaz;
	}

	public void setInterfaz(String interfaz) {
		this.interfaz = interfaz;
	}

	

	public String getDesarrolladores() {
		return desarrolladores;
	}

	public void setDesarrolladores(String desarrolladores) {
		this.desarrolladores = desarrolladores;
	}

	public String getExp() {
		return exp;
	}

	public void setExp(String exp) {
		this.exp = exp;
	}

	@Override
	public String toString() {
		return "Cuestionario [tipoSistema=" + tipoSistema + ", plataforma=" + plataforma + ", paradigma=" + paradigma
				+ ", bd=" + bd + ", interfaz=" + interfaz + ", desarrallodores=" + desarrolladores + ", exp=" + exp
				+ "]";
	}
	
	
}
