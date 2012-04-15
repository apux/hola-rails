# encoding: UTF-8
require 'test_helper'          

class InflectionsTest < ActiveSupport::TestCase
  test "debe pluralizar nombres terminados en vocal" do
    assert_equal "silla".pluralize, 'sillas'
  end

  test "debe pluralizar nombres terminados en n, r, l, y d" do
    assert_equal "sillon".pluralize, 'sillones'
    assert_equal "doctor".pluralize, 'doctores'
    assert_equal "hospital".pluralize, 'hospitales'
    assert_equal "universidad".pluralize, 'universidades'
  end

  test "debe pluralizar nombres compuestos de dos y tres palabras terminadas en vocal" do
    assert_equal "silla_grande".pluralize, 'sillas_grandes'
    assert_equal "silla_blanca_grande".pluralize, 'sillas_blancas_grandes'
  end

  test "debe pluralizar nombres compuestos de dos y tres palabras terminadas en n, r, l, t o d" do
    assert_equal "sillon_pan".pluralize, 'sillones_panes'
    assert_equal "doctor_dolor".pluralize, 'doctores_dolores'
    assert_equal "hospital_normal".pluralize, 'hospitales_normales'
    assert_equal "universidad_bondad".pluralize, 'universidades_bondades'

    assert_equal "sillon_pan_camion".pluralize, 'sillones_panes_camiones'
    assert_equal "doctor_dolor_sabor".pluralize, 'doctores_dolores_sabores'
    assert_equal "hospital_normal_oficial".pluralize, 'hospitales_normales_oficiales'
    assert_equal "universidad_bondad_verdad".pluralize, 'universidades_bondades_verdades'
  end

  test "debe pluralizar nombres compuestos de dos palabras, la primera terminada en vocal y la segunda en n, r, l, t o d" do
    assert_equal "nombre_camion".pluralize, 'nombres_camiones'
    assert_equal "nombre_doctor".pluralize, 'nombres_doctores'
    assert_equal "nombre_hospital".pluralize, 'nombres_hospitales'
    assert_equal "nombre_universidad".pluralize, 'nombres_universidades'
  end
  
  test "debe plularizar nombres compuestos de dos palabras, la primera terminada en n, r, l, t o d, y la segunda terminada en vocal" do
    assert_equal "camion_nombre".pluralize, 'camiones_nombres'
    assert_equal "doctor_nombre".pluralize, 'doctores_nombres'
    assert_equal "hospital_nombre".pluralize, 'hospitales_nombres'
    assert_equal "universidad_nombre".pluralize, 'universidades_nombres'
  end

  test "debe pluralizar nombres compuestos de dos palabras combinadas terminadas en n, r, l, o d" do
    assert_equal "camion_doctor".pluralize, 'camiones_doctores'
    assert_equal "camion_hospital".pluralize, 'camiones_hospitales'
    assert_equal "camion_universidad".pluralize, 'camiones_universidades'
    assert_equal "doctor_camion".pluralize, 'doctores_camiones'
    assert_equal "doctor_hospital".pluralize, 'doctores_hospitales'
    assert_equal "doctor_universidad".pluralize, 'doctores_universidades'
    assert_equal "hospital_camion".pluralize, 'hospitales_camiones'
    assert_equal "hospital_doctor".pluralize, 'hospitales_doctores'
    assert_equal "hospital_universidad".pluralize, 'hospitales_universidades'
    assert_equal "universidad_camion".pluralize, 'universidades_camiones'
    assert_equal "universidad_doctor".pluralize, 'universidades_doctores'
    assert_equal "universidad_hospital".pluralize, 'universidades_hospitales'
  end

  test 'debe pluralizar nombres compuestos de 3 o más palabras combinadas tenerminadas en vocales, n, r, l, o d' do
    assert_equal "camion_doctor_hospital".pluralize, 'camiones_doctores_hospitales'
    assert_equal "doctor_hospital_grande".pluralize, 'doctores_hospitales_grandes'
    assert_equal "universidad_grande_importante_funcionalidad".pluralize, 'universidades_grandes_importantes_funcionalidades'
  end
end
