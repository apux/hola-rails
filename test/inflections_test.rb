# encoding: UTF-8
require 'test_helper'          

class InflectionsTest < ActiveSupport::TestCase

  #########################################################
  # Sección que prueba las conversiones al plural
  #########################################################

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

  test "debe pluralizar nombres compuestos de dos y tres palabras terminadas en n, r, l o d" do
    assert_equal "sillon_pan".pluralize, 'sillones_panes'
    assert_equal "doctor_dolor".pluralize, 'doctores_dolores'
    assert_equal "hospital_normal".pluralize, 'hospitales_normales'
    assert_equal "universidad_bondad".pluralize, 'universidades_bondades'

    assert_equal "sillon_pan_camion".pluralize, 'sillones_panes_camiones'
    assert_equal "doctor_dolor_sabor".pluralize, 'doctores_dolores_sabores'
    assert_equal "hospital_normal_oficial".pluralize, 'hospitales_normales_oficiales'
    assert_equal "universidad_bondad_verdad".pluralize, 'universidades_bondades_verdades'
  end

  test "debe pluralizar nombres compuestos de dos palabras, la primera terminada en vocal y la segunda en n, r, l o d" do
    assert_equal "nombre_camion".pluralize, 'nombres_camiones'
    assert_equal "nombre_doctor".pluralize, 'nombres_doctores'
    assert_equal "nombre_hospital".pluralize, 'nombres_hospitales'
    assert_equal "nombre_universidad".pluralize, 'nombres_universidades'
  end
  
  test "debe plularizar nombres compuestos de dos palabras, la primera terminada en n, r, l o d, y la segunda terminada en vocal" do
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

  test 'debe pluralizar casos especiales' do
    assert_equal 'pais'.pluralize, 'paises'
    assert_equal 'maiz'.pluralize, 'maices'
    #assert_equal 'hermano_de_sangre'.pluralize, 'hermanos_de_sangre'
    #assert_equal 'calificacion_matematicas'.pluralize, 'calificaciones_matematicas'
  end

  test 'no debe pluralizar palabras que ya estén en plural' do
    assert_equal 'camiones'.pluralize, 'camiones'
    assert_equal 'camiones_grandes'.pluralize, 'camiones_grandes'
    assert_equal 'universidades_hospitales_doctores'.pluralize, 'universidades_hospitales_doctores'
    assert_equal 'paises'.pluralize, 'paises'
  end

  #########################################################
  # Sección que prueba las conversiones al plural
  #########################################################

  test "debe singularizar nombres terminados en vocal seguido de una s" do
    assert_equal "sillas".singularize, 'silla'
  end

  test "debe singularizar nombres terminados en nes, res, les, y des" do
    assert_equal "sillones".singularize, 'sillon'
    assert_equal "doctores".singularize, 'doctor'
    assert_equal "hospitales".singularize, 'hospital'
    assert_equal "universidades".singularize, 'universidad'
  end

  test "debe singularizar nombres compuestos de dos y tres palabras terminadas en vocal seguido de una s" do
    assert_equal "sillas_grandes".singularize, 'silla_grande'
    assert_equal "sillas_blancas_grandes".singularize, 'silla_blanca_grande'
  end

  test "debe singularizar nombres compuestos de dos y tres palabras terminadas en nes, res, les o des" do
    assert_equal "sillones_panes".singularize, 'sillon_pan'
    assert_equal "doctores_dolores".singularize, 'doctor_dolor'
    assert_equal "hospitales_normales".singularize, 'hospital_normal'
    assert_equal "universidades_bondades".singularize, 'universidad_bondad'

    assert_equal "sillones_panes_camiones".singularize, 'sillon_pan_camion'
    assert_equal "doctores_dolores_sabores".singularize, 'doctor_dolor_sabor'
    assert_equal "hospitales_normales_oficiales".singularize, 'hospital_normal_oficial'
    assert_equal "universidades_bondades_verdades".singularize, 'universidad_bondad_verdad'
  end

  test "debe singularizar nombres compuestos de dos palabras, la primera terminada en vocal + s y la segunda en nes, res, les o  des" do
    assert_equal "nombres_camiones".singularize, 'nombre_camion'
    assert_equal "nombres_doctores".singularize, 'nombre_doctor'
    assert_equal "nombres_hospitales".singularize, 'nombre_hospital'
    assert_equal "nombres_universidades".singularize, 'nombre_universidad'
  end
  
  test "debe singularizar nombres compuestos de dos palabras, la primera terminada en nes, res, les o des, y la segunda terminada en vocal + s" do
    assert_equal "camiones_nombres".singularize, 'camion_nombre'
    assert_equal "doctores_nombres".singularize, 'doctor_nombre'
    assert_equal "hospitales_nombres".singularize, 'hospital_nombre'
    assert_equal "universidades_nombres".singularize, 'universidad_nombre'
  end

  test "debe singularizar nombres compuestos de dos palabras combinadas terminadas en n, r, l, o d" do
    assert_equal "camiones_doctores".singularize, 'camion_doctor'
    assert_equal "camiones_hospitales".singularize, 'camion_hospital'
    assert_equal "camiones_universidades".singularize, 'camion_universidad'
    assert_equal "doctores_camion".singularize, 'doctor_camion'
    assert_equal "doctores_hospitales".singularize, 'doctor_hospital'
    assert_equal "doctores_universidades".singularize, 'doctor_universidad'
    assert_equal "hospitales_camion".singularize, 'hospital_camion'
    assert_equal "hospitales_doctores".singularize, 'hospital_doctor'
    assert_equal "hospitales_universidades".singularize, 'hospital_universidad'
    assert_equal "universidades_camiones".singularize, 'universidad_camion'
    assert_equal "universidades_doctores".singularize, 'universidad_doctor'
    assert_equal "universidades_hospitales".singularize, 'universidad_hospital'
  end

  test 'debe singularizar casos especiales' do
    assert_equal 'paises'.singularize, 'pais'
    assert_equal 'maices'.singularize, 'maiz'
    #assert_equal 'hermanos_de_sangre'.singularize, 'hermano_de_sangre'
    #assert_equal 'calificaciones_matematicas'.singularize, 'calificacion_matematicas'
  end

  test 'no debe singularizar palabras que ya estén en singular' do
    assert_equal 'camion'.singularize, 'camion'
    assert_equal 'camion_grande'.singularize, 'camion_grande'
    assert_equal 'universidad_hospital_doctor'.singularize, 'universidad_hospital_doctor'
    assert_equal 'pais'.singularize, 'pais'
    assert_equal 'pais_grande'.singularize, 'pais_grande'
  end

end
