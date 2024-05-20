use BDAcademico
go

-- Procedimientos almacenados para TAlumno
if OBJECT_ID('spListarAlumno') is not null
	drop proc spListarAlumno
go
create proc spListarAlumno
as
begin
	select * from TAlumno
end
go

exec spListarAlumno
go

-- Procediimiento almacenado para agregar Alumno
if OBJECT_ID('spAgregarAlumno') is not null
	drop proc spAgregarAlumno
go
create proc spAgregarAlumno
@CodAlumno char(5),
@APaterno varchar(50),
@AMaterno varchar(50),
@Nombres varchar(50),
@CodUsuario varchar(50),
@Contrasena varchar(50),
@CodEscuela char(3)
as
begin
	-- CodAlumno no se duplique
	if not exists(select CodAlumno from TAlumno where CodAlumno = @CodAlumno)
		-- Usuario no existe en TUsuario
		if not exists(select CodUsuario from TUsuario where CodUsuario=@CodUsuario)
			-- CodCarrera debe existir en la tabla TCarrera
			if exists(select CodEscuela from TEscuela where CodEscuela = @CodEscuela)
				begin
					begin tran tranAgregar 
					begin try
						insert into TUsuario values(@CodUsuario,ENCRYPTBYPASSPHRASE('miFraseDeContrase�a', @Contrasena))
						insert into TAlumno values(@CodAlumno,@APaterno,@AMaterno,@Nombres,@CodUsuario,@CodEscuela)
						commit tran tranAgregar
						select CodError = 0, Mensaje = 'Alumno insertado correctamente'
					end try
					begin catch
						rollback tran tranAgregar
						select CodError = 1, Mensaje = 'Error: No se ejecuto la transaccion'
					end catch
				end
			else select CodError = 1, Mensaje = 'Error: CodEscuela no existe en TEscuela'
		else select CodError = 1, Mensaje = 'Error: Usuario ya asignado en TUsuario'
	else select CodError = 1, Mensaje = 'Error: Codigo de Alumno duplicado en la TAlumno'
end
go

exec spAgregarAlumno 'A0031','Juarez','Maquera','Rosa','juarezm@gmail.com','1234','C01'
go

-- Procedimiento almacenado para eliminar un alumno
if OBJECT_ID('spEliminarAlumno') is not null
	drop proc spEliminarAlumno
go
create proc spEliminarAlumno
@CodAlumno char(5)
as
begin
	-- Verificar que el CodAlumno existe en la tabla Alumno
	if exists (select CodAlumno from TAlumno where CodAlumno=@CodAlumno)
	begin
	    declare @CodUsuario varchar(50)
		set @CodUsuario = (select CodUsuario from TAlumno where CodAlumno = @CodAlumno)
		if exists (select CodUsuario from TUsuario where CodUsuario = @CodUsuario)
		begin
			begin tran tranEliminar
				begin try
					delete from TNota where CodAlumno = @CodAlumno
					delete from TAlumno where CodAlumno = @CodAlumno
					delete from TUsuario where CodUsuario = @CodUsuario
					commit tran tranEliminar
					select CodError = 0, Mensaje = 'Alumno eliminado correctamente'
				end try
				begin catch
					rollback tran tranEliminar
					select CodError = 1, Mensaje = 'Error: No se ejecuto la transaccion'
				end catch
			end			
		else select CodError = 1, Mensaje = 'Error: No existe CodUsuario en la TUsuario'		
	end
	else select CodError = 1, Mensaje = 'Error: CodAlumo no existe en la TAlumno'
end
go

exec spEliminarAlumno 'A0031'
go


if OBJECT_ID('spActualizarAlumno') is not null
    drop proc spActualizarAlumno
go
create proc spActualizarAlumno
@CodAlumno char(5),
@APaterno varchar(50),
@AMaterno varchar(50),
@Nombres varchar(50),
@CodUsuario varchar(50),
@Contrasena varchar(50),
@CodEscuela char(3)
as
begin
    -- Verificar que el CodAlumno existe en la tabla Alumno
    if exists (select CodAlumno from TAlumno where CodAlumno = @CodAlumno)
    begin
        if exists (select CodEscuela from TEscuela where CodEscuela = @CodEscuela)
        begin
            begin tran tranActualizar
            begin try
                update TUsuario set Contrasena = ENCRYPTBYPASSPHRASE('miFraseDeContraseña', @Contrasena) where CodUsuario = @CodUsuario
                update TAlumno set APaterno = @APaterno, AMaterno = @AMaterno, Nombres = @Nombres, CodEscuela = @CodEscuela where CodAlumno = @CodAlumno
                commit tran tranActualizar
                select CodError = 0, Mensaje = 'Alumno actualizado correctamente'
            end try
            begin catch
                rollback tran tranActualizar
                select CodError = 1, Mensaje = 'Error: No se ejecuto la transaccion'
            end catch
        end
        else
            select CodError = 1, Mensaje = 'Error: CodEscuela no existe en TEscuela'
    end
    else
        select CodError = 1, Mensaje = 'Error: CodAlumno no existe en la TAlumno'
end
go

if OBJECT_ID('spBuscarAlumno') is not null
    drop proc spBuscarAlumno
go
create proc spBuscarAlumno
@CodAlumno char(5)
as
begin
    if exists (select CodAlumno from TAlumno where CodAlumno = @CodAlumno)
	begin
		select * from TAlumno where CodAlumno = @CodAlumno
		select CodError = 0, Mensaje = 'Alumno encontrado'
	end
	else 
		select CodError = 1, Mensaje = 'Error: Codigo de Alumno no existe'
end
go




-- Login de usuario
if OBJECT_ID('spLogin') is not null
	drop proc spLogin
go
create proc spLogin
@CodUsuario varchar(50),@Contrasena varchar(50)
as
begin
	if exists (select CodUsuario from TUsuario where CodUsuario = @CodUsuario and CONVERT(varchar(50),DECRYPTBYPASSPHRASE('miFraseDeContrase�a', Contrasena))=@Contrasena)
	begin
		if exists (select CodUsuario from TDocente where CodUsuario = @CodUsuario)
			select CodError = 0, Mensaje = 'Docente'
		else if exists (select CodUsuario from TAlumno where CodUsuario = @CodUsuario)
			select CodError = 0, Mensaje = 'Alumno'
		else 
			select CodError = 1, Mensaje = 'Error: Usuario no tiene privilegio de docente ni alumno, consulte al administrador'
	end
	else 
		select CodError = 1, Mensaje = 'Error: Usuario y / o contrase�as incorrectas'
end
go

exec spLogin 'cuellar@hotmail.com','1234'
go

--------------------------------------------------------------------------------------------

if OBJECT_ID('spListarDocente') is not null
	drop proc spListarDocente
go
create proc spListarDocente
as
begin
	select * from TDocente
end
go



if OBJECT_ID('spAgregarDocente') is not null
	drop proc spAgregarDocente
go
create proc spAgregarDocente
@CodDocente char(3),
@APaterno varchar(50),
@AMaterno varchar(50),
@Nombres varchar(50),
@CodUsuario varchar(50),
@Contrasena varchar(50)
as
begin
	-- CodDocente no se duplique
	if not exists(select CodDocente from TDocente where CodDocente = @CodDocente)
		-- Usuario no existe en TUsuario
		if not exists(select CodUsuario from TUsuario where CodUsuario=@CodUsuario)
			begin
				begin tran tranAgregar 
				begin try
					insert into TUsuario values(@CodUsuario,ENCRYPTBYPASSPHRASE('miFraseDeContraseña', @Contrasena))
					insert into TDocente values(@CodDocente,@APaterno,@AMaterno,@Nombres,@CodUsuario)
					commit tran tranAgregar
					select CodError = 0, Mensaje = 'Docente insertado correctamente'
				end try
				begin catch
					rollback tran tranAgregar
					select CodError = 1, Mensaje = 'Error: No se ejecutó la transacción'
				end catch
			end
		else select CodError = 1, Mensaje = 'Error: Usuario ya asignado en TUsuario'
	else select CodError = 1, Mensaje = 'Error: Código de Docente duplicado en TDocente'
end
go


if OBJECT_ID('spEliminarDocente') is not null
	drop proc spEliminarDocente
go
create proc spEliminarDocente
@CodDocente char(3)
as
begin
	-- Verificar que el CodDocente existe en la tabla Docente
	if exists (select CodDocente from TDocente where CodDocente=@CodDocente)
	begin
	    declare @CodUsuario varchar(50)
		set @CodUsuario = (select CodUsuario from TDocente where CodDocente = @CodDocente)
		if exists (select CodUsuario from TUsuario where CodUsuario = @CodUsuario)
		begin
			begin tran tranEliminar
				begin try
					delete from TCarga where CodDocente = @CodDocente
					delete from TDocente where CodDocente = @CodDocente
					delete from TUsuario where CodUsuario = @CodUsuario
					commit tran tranEliminar
					select CodError = 0, Mensaje = 'Docente eliminado correctamente'
				end try
				begin catch
					rollback tran tranEliminar
					select CodError = 1, Mensaje = 'Error: No se ejecutó la transacción'
				end catch
			end			
		else select CodError = 1, Mensaje = 'Error: No existe CodUsuario en la TUsuario'		
	end
	else select CodError = 1, Mensaje = 'Error: CodDocente no existe en la TDocente'
end
go

if OBJECT_ID('spActualizarDocente') is not null
    drop proc spActualizarDocente
go
create proc spActualizarDocente
@CodDocente char(3),
@APaterno varchar(50),
@AMaterno varchar(50),
@Nombres varchar(50),
@CodUsuario varchar(50),
@Contrasena varchar(50)
as
begin
    if exists (select CodDocente from TDocente where CodDocente = @CodDocente)
    begin
        begin tran tranActualizar
        begin try
            update TDocente
            set APaterno = @APaterno,
                AMaterno = @AMaterno,
                Nombres = @Nombres
            where CodDocente = @CodDocente
            
            update TUsuario
            set Contrasena = ENCRYPTBYPASSPHRASE('miFraseDeContraseña', @Contrasena)
            where CodUsuario = @CodUsuario
            
            commit tran tranActualizar
            select CodError = 0, Mensaje = 'Docente actualizado correctamente'
        end try
        begin catch
            rollback tran tranActualizar
            select CodError = 1, Mensaje = 'Error: No se ejecuto la transaccion'
        end catch
		end
    else 
        select CodError = 1, Mensaje = 'Error: Codigo de Docente no existe'
end
go

if OBJECT_ID('spBuscarDocente') is not null
    drop proc spBuscarDocente
go
create proc spBuscarDocente
@CodDocente char(3)
as
begin
    if exists (select CodDocente from TDocente where CodDocente = @CodDocente)
    begin
        select * from TDocente where CodDocente = @CodDocente
		select CodError = 0, Mensaje = 'Docente encontrado'
    end
    else 
        select CodError = 1, Mensaje = 'Error: Codigo de Docente no existe'
end
go

