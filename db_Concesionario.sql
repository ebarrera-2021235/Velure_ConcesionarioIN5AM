Drop database if exists DBConcesionarioIN5AM;
Create database DBConcesionarioIN5AM;
Use DBConcesionarioIN5AM;

Create table Clientes(
	codigoCliente int not null auto_increment,
    nombresCliente varchar(50) not null,
    DPICliente varchar(50) not null,
    direccionCliente varchar(50) not null,
    estado varchar(1) not null,
    telefonoCliente varchar(8) not null,
    correoCliente varchar(25) not null,
    primary key PK_codigoCliente (codigoCliente)
);

Create table Empleados(
	codigoEmpleado int not null auto_increment,
    nombresEmpleado varchar(50) not null,
    DPIEmpleado varchar(25) not null,
    estado varchar(1) not null,
    telefonoEmpleado varchar(8) not null,
    correoEmpleado varchar(25) not null,
    primary key PK_codigoEmpleado (codigoEmpleado)
);

Create table Usuarios(
	codigoUsuario int not null auto_increment,
    nombresUsuario varchar(50) not null,
    userName varchar(25) not null,
    contrasenia varchar(25) not null,
    correoUsuario varchar(50) not null,
    codigoEmpleado int not null,
    primary key PK_codigoUsuario(codigoUsuario),
    constraint FK_Usuarios_Empleado foreign key (codigoEmpleado)
		references Empleados (codigoEmpleado)
);

Create table Proveedores(
	codigoProveedor int not null auto_increment,
    nombreProveedor varchar(50) not null,
    telefonoProveedor varchar(8) not null,
    direccionProveedor varchar(250) not null,
    correoProveedor varchar(25) not null,
    primary key PK_codigoProveedor (codigoProveedor)
);


Create table Vehiculos(
	codigoVehiculo int not null auto_increment,
    modelo varchar(100) not null,
    descripcion varchar(200) not null,
    marca varchar(50) not null,
    color varchar(50) not null,
    stock int not null,
    precio decimal(8,2) not null,
    anio varchar(10) not null,
    codigoProveedor int not null,
    primary key PK_codigoVehiculo (codigoVehiculo),
    Constraint FK_Vehiculos_Proveedores foreign key (codigoProveedor)
		references Proveedores(codigoProveedor)
);

Create table Seguros(
	codigoSeguro int not null auto_increment,
    tipoCobertura ENUM(
		'Básica', 
        'Limitada', 
        'Amplia', 
        'Riesgo y franquicia',
        'Riesgo sin franquicia') not null,
	descripcion varchar(250) not null,
    fechaInicio date not null,
    fechaFin date not null,
    costo decimal(8,2) not null,
    codigoVehiculo int not null,
    primary key PK_codigoSeguro (codigoSeguro),
    Constraint FK_Seguros_Vehiculos foreign key (codigoVehiculo)
		references Vehiculos(codigoVehiculo)
);

Create table Servicios(
	codigoServicio int not null auto_increment,
    nombreServicio varchar(100) not null,
    descripcion varchar(250) not null,
    tipo varchar(100) not null,
    fechaServicio date not null,
    codigoVehiculo int not null,
    primary key PK_codigoServicio (codigoServicio),
    constraint FK_Servicios_Vehiculos foreign key (codigoVehiculo)
		references Vehiculos (codigoVehiculo)
);

Create table Compras(
	codigoCompra int not null auto_increment,
    fecha date not null,
    total decimal(8,2) not null,
    descripcion varchar(200) not null,
    estado enum('Activo', 'Inactivo') not null,
    codigoEmpleado int not null,
    primary key PK_codigoCompra (codigoCompra),
    constraint FK_Compras_Empleados foreign key (codigoEmpleado)
		references Empleados(codigoEmpleado)
);

Create table DetalleCompra(
	codigoDetalleCompra int not null auto_increment,
    precioUnitario decimal(8,2) not null,
    cantidad int not null,
    codigoVehiculo int not null,
    codigoCompra int not null,
    primary key PK_codigoDetalleCompra(codigoDetalleCompra),
    constraint FK_Detallecompra_Vehiculos foreign key (codigoVehiculo)
		references Vehiculos(codigoVehiculo),
	constraint FK_DetalleCompra_Compras foreign key (codigoCompra)
		references Compras(codigoCompra)
);

Create table Ventas(
	codigoVenta int not null auto_increment,
    fecha date not null,
    total decimal(8,2) not null,
    descripcion varchar(250) not null,
    tipoDePago enum('Efectivo', 'Tarjeta', 'Transferencia') not null,
    codigoCliente int not null,
    codigoEmpleado int not null,
    primary key PK_codigoVenta (codigoVenta),
	constraint FK_Ventas_Clientes foreign key (codigoCliente)
		references Clientes(codigoCliente),
	constraint FK_Ventas_Empleados foreign key (codigoEmpleado)
		references Empleados(codigoEmpleado)
);

Create table DetalleVenta(
	codigoDetalleVenta int not null auto_increment,
    cantidad int not null,
    precioVenta decimal(8,2) not null,
    codigoVehiculo int not null ,
    codigoVenta int not null,
    primary key PK_codigoDetalleVenta (codigoDetalleVenta),
    constraint FK_DetalleVenta_Vehiculos foreign key (codigoVehiculo)
		references Vehiculos(codigoVehiculo),
	constraint FK_DetalleVenta_Ventas foreign key (codigoVenta)
		references Ventas (codigoVenta)
);


