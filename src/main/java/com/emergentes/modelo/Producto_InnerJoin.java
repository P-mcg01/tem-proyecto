package com.emergentes.modelo;

public class Producto_InnerJoin {
  private int producto_id;
  private String nombre_prod;
  private int precio;
  private int stock;
  private String marca;
  private String categoria;

  public Producto_InnerJoin() {
    this.producto_id = 0;
    this.nombre_prod = "";
    this.precio = 0;
    this.stock = 0;
    this.marca = "";
    this.categoria = "";
  }

  public int getProducto_id() {
    return producto_id;
  }

  public void setProducto_id(int producto_id) {
    this.producto_id = producto_id;
  }

  public String getNombre_prod() {
    return nombre_prod;
  }

  public void setNombre_prod(String nombre_prod) {
    this.nombre_prod = nombre_prod;
  }

  public int getPrecio() {
    return precio;
  }

  public void setPrecio(int precio) {
    this.precio = precio;
  }

  public int getStock() {
    return stock;
  }

  public void setStock(int stock) {
    this.stock = stock;
  }

  public String getMarca() {
    return marca;
  }

  public void setMarca(String marca) {
    this.marca = marca;
  }

  public String getCategoria() {
    return categoria;
  }

  public void setCategoria(String categoria) {
    this.categoria = categoria;
  }
}
