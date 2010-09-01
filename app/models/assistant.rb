class Assistant < ActiveRecord::Base
  belongs_to :course
  attr_accessible :fname, :lname, :email, :studentid, :course_id, :career, :payed, :semester
  validates_presence_of :fname, :lname, :email, :course_id
  validates_format_of :studentid, :with => /\A\d{6,7}\Z/, :message => "debe de ser de 6 o 7 dígitos"
  validates_format_of    :email,
                         :with => %r{\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z}i,
                         :message => "debe de parecer una direccion de email"
  
  HUMANIZED_COLUMNS = {
	  :fname => "Nombre(s)",
	  :lname => "Apellido",
	  :email => "Email",
	  :studentid => "Matricula",
	  :course_id => "Curso",
	  :career => "Carrera",
	  :payed => "Pagado",
	  :semester => "Semestre"
  }

  def self.human_attribute_name(attribute)
	  HUMANIZED_COLUMNS[attribute.to_sym] || super
  end
  
  SEMESTRE = [
    ["1er Semestre", "1"],
    ["2o Semestre", "2"],
    ["3o Semestre", "3"],
    ["4o Semestre", "4"],
    ["5o Semestre", "5"],
    ["6o Semestre", "6"],
    ["7o Semestre", "7"],
    ["8o Semestre", "8"],
    ["9o Semestre", "9"]
  ]
  
  CARRERA = [
    # Displayed         stored in db
    ["ARQ - Arquitecto", "ARQ"],
    ["CPF - Licenciado en Contaduría Pública y Finanzas", "CPF"],
    ["IA - Ingeniero Agronomo" , "IA" ],
    ["IAB - Ingeniero en Agrobiotecnologia" , "IAB" ],
    ["IBT - Ingeniero en Biotecnologia", "IBT"],
    ["IC - Ingeniero Civil","IC"],
    ["IDS - Ingeniero en Desarrollo Sustentable","IDS"],
    ["IEC - Ingeniero en Electronica y Comunicaciones", "IEC"],
    ["IFI - Ingeniero Fisico Industrial", "IFI"],
    ["IIA - Ingeniero en Industrias Alimentarias" , "IIA" ],
    ["IIS - Ingeniero Industrial y de Sistemas", "IIS"],
    ["IMA - Ingeniero Mecanico Administrador", "IMA"],
    ["IMD - Ingeniero Biomedico", "IMD"],
    ["IME - Ingeniero Mecanico Electricista", "IME"],
    ["IMI - Ingeniero en Producción Musical", "IMI"],
    ["IMT - Ingeniero en Mecatronica", "IMT"],
    ["INT - Ingeniero en Negocios y Tecnologias de Informacion", "INT"],
    ["IQA - Ingeniero Quimico Administrador", "IQA"],
    ["IQS - Ingeniero Quimico y de Sistemas", "IQS"],
    ["ISC - Ingeniero en Sistemas Computacionales", "ISC"],
    ["ISD - Ingeniero en Sistemas Digitales y Robotica", "ISD"],
    ["ISE - Ingeniero en Sistemas Electrónicos", "ISE"],
    ["ISI - Ingeniero en Sistemas de Información", "ISI"],
    ["ITC - Ingeniero en Tecnologias Computacionales", "ITC"],
    ["ITE - Ingeniero en Tecnologias Electronicas", "ITE"],
    ["ITIC - Ingeniero en Tecnologias de Informacion y Comunicaciones", "ITIC"],
    ["ITM - Ingeniero en Telecomunicacion y Microelectronica", "ITM"],
    ["LAD - Licenciado en Animacion y Arte Digital", "LAD"],
    ["LAE - Licenciado en Administracion de Empresas", "LAE"],
    ["LAF - Licenciado en Administracion Financiera", "LAF"],
    ["LAN - Licenciado en Agronegocios  Internacionales", "LAN"],
    ["LAS - Licenciado en Administracion de Sistemas de Salud", "LAS"],
    ["LBC - Licenciado en Biocencias", "LBC"],
    ["LCC - Licenciado en Ciencias de la Comunicación", "LCC"],
    ["LCDM - Licenciado en Comunicación y Medios Digitales", "LCDM"],
    ["LCE - Licenciado en Ciencias de la Enfermeria", "LCE"],
    ["LCQ - Licenciado en Ciencias Quimicas", "LCQ"],
    ["LDF - Licenciado en Derecho y Finanzas", "LDF"],
    ["LDI - Licenciado en Diseno Industrial", "LDI"],
    ["LEC - Licenciado en Economia", "LEC"],
    ["LED - Licenciado en Derecho", "LED"],
    ["LEM - Licenciado en Mercadotecnia", "LEM"],
    ["LHS - Licenciado en Humanidades y Ciencias Sociales", "LHS"],
    ["LIN - Licenciado en Negocios Internacionales", "LIN"],
    ["LLE - Licenciado en Lengua y Literatura Hispanicas", "LLE"],
    ["LMI - Licenciado en Periodismo y Medios de Informacion", "LMI"],
    ["LNB - Licenciado en Nutricion y Bienestar Integral", "LNB"],
    ["LPL - Licenciado en Ciencia Politica", "LPL"],
    ["LPO - Licenciado en Psicología Organizacional", "LPO"],
    ["LRI - Licenciado en Relaciones Internacionales", "LRI"],
    ["LSC - Licenciado en Sistemas de Computación Administrativa", "LSC"],
    ["LATI - Licenciado en Administración de Tecnologías de Información", "LATI"],
    ["MC - Médico Cirujano", "MC"],
    ["MO - Médico Cirujano Odontólogo", "MO"]
  ]
end
