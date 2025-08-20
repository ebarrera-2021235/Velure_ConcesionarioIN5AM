package modelo;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UsuarioDAO {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int resp;

    public Usuario validar(String username, String contrasenia) {
        Usuario user = new Usuario();
        String sql = "select * from Usuarios where userName = ? and contrasenia = ?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, contrasenia);
            rs = ps.executeQuery();
            while (rs.next()) {
                user.setCodigoUsuario(rs.getInt("codigoUsuario"));
                user.setUserName(rs.getString("userName"));
                user.setNombresUsuario(rs.getString("nombresUsuario"));
                user.setContrasenia(rs.getString("contrasenia"));
                user.setImagen(rs.getString("imagen"));
                user.setCodigoEmpleado(rs.getInt("codigoEmpleado"));
                user.setCorreoUsuario(rs.getString("correoUsuario"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }

    public int agregar(Usuario user) {
        // Grabar Empleado
        String estadoEmpleado = "1"; // dato quemado
        String sqlEmpleado = "insert into Empleados "
                + "(nombresEmpleado, DPIEmpleado, estado, telefonoEmpleado, correoEmpleado) "
                + "values(?, ?, ?, ?, ?)";

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sqlEmpleado);
            ps.setString(1, user.getNombresUsuario());
            ps.setString(2, user.getDPIEmpleado());
            ps.setString(3, estadoEmpleado);
            ps.setString(4, user.getTelefonoEmpleado());
            ps.setString(5, user.getCorreoUsuario());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Recuperar ID del Empleado
        String sqlIdEmpleado = "select codigoEmpleado from Empleados where correoEmpleado = ?";
        int codEmpleado = 0; // se inicializa para asegurarme que no guarde el último valor
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sqlIdEmpleado);
            ps.setString(1, user.getCorreoUsuario());
            rs = ps.executeQuery();
            while (rs.next()) {
                codEmpleado = (rs.getInt("codigoEmpleado"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        String imageUser = "";
        switch (user.getUserName()) {
            case "egomez":
                imageUser = "data:image/jpeg;base64,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";
                user.setImagen(imageUser);
                break;
            case "ebarrera":
                imageUser="data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAYEBQYFBAYGBQYHBwYIChAKCgkJChQODwwQFxQYGBcUFhYaHSUfGhsjHBYWICwgIyYnKSopGR8tMC0oMCUoKSj/2wBDAQcHBwoIChMKChMoGhYaKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCj/wAARCABAADkDASIAAhEBAxEB/8QAGwAAAQUBAQAAAAAAAAAAAAAABAIDBQYHCAH/xAA4EAACAQMBBQQHBwQDAAAAAAABAgMABBEFBhIhMUEjcYGxExQiM1FhoQcVUlNicpIkJTKRwdHw/8QAGQEAAgMBAAAAAAAAAAAAAAAAAQQAAgUD/8QAHhEAAgICAwEBAAAAAAAAAAAAAAECEQMEEiFBQiL/2gAMAwEAAhEDEQA/AOgpMmVgHZQAOAxTZ3vzX+n/AFS5D2z+HlTE8qxQySOcIilifkKudhq+vYbG3ae8vUt4V5vKyqB4mqtc/aVspbvuSbR2+9+kFvJawPazaDW9uto50tVlaKMkRW4Hsxr0OfieZNRFxsRtAiMz2zuF6Bw2R3VRzS6bIoyfaR1jpOs2er2/rGl6jDdw9WiZWx3/AA8aM35fzT/EVxlsptJqOyG0K3Vo0sTod2WGVSBIvVWH/sV1xsvrMW0Gz9jqtuhSO6jD7h5qeRHgQaKdlSYgkkMyq77wOeGAKCx86JhOLhPHyoLfNFAZKyHtX8PKgNYQzaRfRgHeeCRRj9po5/fSeHlQGtI8ml3KxMyuV5qcHHX6UG6VnRK3RiWwSW+iaRGJVf0snaMVjLkA8s4q4y3Nv6gbpWcxnlhPaz3UEuz9tf2ASb0g9GAAqyMoGO7nypF1Yf29Y0dvQpJu8+J4VmSl6akFSopW2OmQatbzTRW5W6UbyvLEVyBxIzWyfZrb+rbBaHHu7v8ATK2P3En/AJqkroFtYWkghXcEgIYBiQc5+J+daBsbaG00SNMFVJyqnoMAcP8AVM4JfKFNiH16TUXv08fKo/FSCe/j8fKgMGmxIln99J4eVeEcK9f3snePKkSOEUlulQuUzX4WsNQkMKhY5xvL0GeoqtTzS75UW0AkY594ePz5VKbSavJqWpmxxuJbyMCQMe1gY49eBqKe7vVypkhULwOU4ms/KlHI0aWtNuCbRK6PE99fW9vNu53t5gOI3RxNaEoAACgADgAOlZAt7c6ZcQXduS8xkVTxxkMwB+lazbXCzLjIDjmKY1kuDaFNp/umOoO2j7z5UJu0bGO2j7z5GmNz5/SmELDt1N6KaQAceB491Bs7Sn2jnqBRd7bSySyFFyGAwcj4UMtlOMHdw2PxCukaSKS5WVXWtLJ1F7lRhZQCT8GHD6jFRUtnKzDKnOfhV9Njcs5DojRkf45FCz6NO0qmIKq9csOApPPr3LlEc19ilxkVXTdHae9iaUdlE4c5644j61Y36t8DUj93TLHuxKF4fiFI+7bgrhimB+sU3ghHFGrFNicssroXpk0j3UaM28vHnz5UVimrK39XuUeV4lUZz2gpfrEH50X8xUklfQI3XZ//2Q==";
                user.setImagen(imageUser);
                break;
                
//            case "jbolanos":
//                break;
//                
//            case "lcastro":
//                break;
//                
//            case "jcortez":
//                break;
//                
//            case "atun":
//                break;
//                
//            case "ecatalan":
//                break;
                
            case "jmendez":
                imageUser = "data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/4gHYSUNDX1BST0ZJTEUAAQEAAAHIAAAAAAQwAABtbn"
                        + "RyUkdCIFhZWiAH4AABAAEAAAAAAABhY3NwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAQAA9tYAAQAAAADTLQAAAAAAA"
                        + "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAlkZXNjAAAA8AAAACRyWFlaAAABFAAAABRn"
                        + "WFlaAAABKAAAABRiWFlaAAABPAAAABR3dHB0AAABUAAAABRyVFJDAAABZAAAAChnVFJDAAABZAAAAChiVFJDAAABZAAAACh"
                        + "jcHJ0AAABjAAAADxtbHVjAAAAAAAAAAEAAAAMZW5VUwAAAAgAAAAcAHMAUgBHAEJYWVogAAAAAAAAb6IAADj1AAADkFhZWi"
                        + "AAAAAAAABimQAAt4UAABjaWFlaIAAAAAAAACSgAAAPhAAAts9YWVogAAAAAAAA9tYAAQAAAADTLXBhcmEAAAAAAAQAAAACZ"
                        + "mYAAPKnAAANWQAAE9AAAApbAAAAAAAAAABtbHVjAAAAAAAAAAEAAAAMZW5VUwAAACAAAAAcAEcAbwBvAGcAbABlACAASQBu"
                        + "AGMALgAgADIAMAAxADb/2wBDAAMCAgICAgMCAgIDAwMDBAYEBAQEBAgGBgUGCQgKCgkICQkKDA8MCgsOCwkJDRENDg8QEBE"
                        + "QCgwSExIQEw8QEBD/2wBDAQMDAwQDBAgEBAgQCwkLEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBA"
                        + "QEBAQEBAQEBD/wAARCABSACsDASIAAhEBAxEB/8QAGwAAAgMBAQEAAAAAAAAAAAAABgcEBQgAAwL/xAAzEAACAQMDAwIFAgQ"
                        + "HAAAAAAABAgMEBREABiEHEjETQRQiUWFxCDJCYpGhFRYjJVNygf/EABoBAAIDAQEAAAAAAAAAAAAAAAMFAQQGAgD/xAApEQA"
                        + "BBAEDAgUFAQAAAAAAAAABAAIDEQQSITFBYQUTUYHwcaGxwdEi/9oADAMBAAIRAxEAPwDQFg2Bb6hkK03eGwRx7aqerVq2NT2"
                        + "iO3iqp6uqt0iVVdSUsqyTRxBicMoPylu0gA4ydCtz3Xu+52+uq90X1LFZKWB6mSltxMY9FQSweX97YweMgcjjWGerX6jpLxd"
                        + "RFs+mW10EEoalj7AsjKPEkrg5Zy3ODwvtzzpZnXmwHHhFXW59L32TbDcMKYZExuuAP6ti9Qt7Xu+UskqPRbHsOO4STT5qplzj"
                        + "tMnCp5/avP30kd+PY7XQW9bBfO2suknqLcGHeexD5PePDHA5xkZxpB0fWHfd2jkiqdyyVEKBZXWaUt8wzghmOcjnx9cYOjHZm"
                        + "/6y/wBaPjIqO4iP06WanmYKRGW/dGyjDAZyQVB++pyXSvFnf56KMNsINA1+/fff6qt3xPW14iuFxtsKVNuZ4pKunBEU8ec4K+V"
                        + "YNnHsQcZ1ULTrKqyxjKuAw/8Ada66cdHukN9qqy99Rt60doslEjIlHNVoZqlmQ5CRHLsoGDnxnAHjWaOo+5emFh3tdrRsiy36a"
                        + "x0swSilraiNZpU7FJchUwAxJIHspGec6JjatFPKBlBuu2cJwfqC6wQXLpPW0G3zV0VdVypSzLMhVhGwLMqlchgQvOPGOcaUnQ7"
                        + "9L1N1FpF3NuuvkSGUKYokXgr9c/TRH1e2lvCr24WqI1lonuNIZJki7UiyGiUn6DMgyfv+NFN63fdtgbdk2js+/UNHBaUFPU3CP"
                        + "05B3ouGjVyewyZ8he5h4xnSuWSUxARmiTuU8w4YPPc+cW1o2CPU/S10zsVvyTRQsgD/ABEgUkY8cnx99AO4+jfT6kvH+bumt6t"
                        + "rTUkbJX0lHMsqmNhhpUTkB0/cR4IB8EaopLl1A3ps+W0VFnv17rK6nmrqScVMUUKQU5T12ljOHcgOCEXlh4+mjzpn0PvdAEG5ob"
                        + "E9uij74GpC7NVB1z87IyqUIP0PGPzqs1zof9vd+7TSaKLJAjhZ3uqo9Pm6kUPRDqLuuyU9JcaGileumWnpgCY5FDP2qSGz5UFuD"
                        + "40cT/osvtNJ8O9lr5CiqO4wU8vGBgdxGTgcaq+lFbt7p/YLHJW75q9sVNNXVcFFW1tf6kFe7VTiARxyllbMZwQuMDHPIOtMp1F3"
                        + "6V/3K6UZqQSHNPSqiHBwCAxJHGM8+c441dhh80kuJrofm/zlKHZsmCdMYF9RV/Tt79+Etty7Inm2nX7f26sF7grLfMKihrFKsyl"
                        + "T2xpKgBWQsAV7hjK/fSF2fs3Y+0olmW0Xa90n+pMqSygvR1auwqYxESg9N3+dceO5lIxg61JW7Bjue5zuakuV6t8zY7VSchXT+E"
                        + "MoOM85POhTqT02sNJaqmstVe8t4D/FVEPqA+pnPqyYwMMSc8+cYA1XmZKIiG8el/j+KzhTwCYa+fWvz090nK7c+62uEO+bNtOlt"
                        + "VJaoJKClhq6lTL2SMrySsseVQYiRVGTyTk40NVV1guFoprheOpccVZVSsGsNurAII1Zj2AxBu4fzDx74Gvav2im4qWo7q6ql9SQ"
                        + "5pGqCIC2AAxXIyRj34Gva17UsO17bULe66w1FUYTFT0NFTgMhPv3Y+Zzxzz+dKnSjTtytcGR+UbR7aunuwurGyrZWb0p5Grdo1M"
                        + "j0VTCHIhknAz3IjLlQsaFQPDDP20vb11Hsn+LVaJuO/VIilaL1TTMS5Q9pOWdT7e4Gi/oruWps18udkqKVqq0z0gFbLFNGGpZkz"
                        + "2HtYgtkFl+UHHBOk7vLaO8twbpud4q98WygepqGZaWOncrDGOETJ5YhAoLHycn30/ZhungYQaICwcuaIZ5LbqBNrUl1623C7Sz0V"
                        + "v7aCOCVonRG+Yjyrd/kgqQeMfT20s9xXrd13uMtwmr6TbtqpFliaurMVFVUogyxhpl4UZZMPJxiZG7WGcUEdS193U0e24pRC8TN"
                        + "Ms4xJBEgDBpAQOQWKYwOWUaFeoNVPR7fgFHdLrVRLTLBVTVxGX7HJUcE4VS2Bycn+wIoJckh3RXWZOPgseSAXjZoqxfqem3e7+6"
                        + "LYJLduKijutBUzlJAUkcSBZCykjMnbgdxGGOBj5uONDgs0FlvaVhndzMxGZZC5Ax7Z0stv7tu20alZqaXvhnAEsTg9j4+uPH2Yc6"
                        + "atkmoN9wpX0s/p+iQJadmHfGfz7j76oZ2E/GcXDdpTPwzxGPNaGO2ePv3Cl7fv8ABFeboy06TR09YoY9uWRvTQk/jBIP40UzVWx6"
                        + "uVqiojhWSQ5YNFzn+mqOKyU1j3NV/CHEVwhSY93u+O1j+ONfE1VAJGUrFkcfNjI+2tNhPLsdh7BZTOb5eTI3uVa1t6sduT4Hbljg"
                        + "oFMaRTumfUmjTPZ3OSS3JLE55JGc4Ghiue2zkQ1lG81NIxeRYz8r/wDZffQZPum70Uhlu3pTx+89OP2flfYfjjU03+CqpBUUNYrI"
                        + "3iVee0/fR2NDAGhVHP1Gyoe49n2Wipp62w1kkTnMsMLnuRlP8Cnzx4wc6CrXdq613OkuVrqlpJHbsJmfsiLf8bseBkZxn6HRWb3H"
                        + "6zW27Rjsf5lI9j9VOhy6pDappBNClVQVQKyqwyrofqPqP7a85gcKPC4bIWHU3YhMzdvU6wyLS3lq34B4ratMYWw0qTknjAz3AckuP"
                        + "lxznUCn3DFXQR1j57pVDHB41naoMdqq2NOEkK+R/Lnx/Txoxt262koYXkR+7twezwcca4jYImhjeAupJ3TvL38lF7uzAdzE585OoM"
                        + "CJT3r06dREsgyyoO0MfvjzrtdooQ3LtygfAI3usmAfoM6hqzSWWQSEsARjPONdrtSoKAKlEMncUXOCM41KLNH8kbFVHgA4A12u0PqoC//Z";
                
                user.setImagen(imageUser);
                break;
                
            case "agarcia":
                imageUser = "data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDABALDA4MChAODQ4SERATGCgaGBYWGDEj"
                        + "JR0oOjM9PDkzODdASFxOQERXRTc4UG1RV19iZ2hnPk1xeXBkeFxlZ2P/2wBDARESEhgVGC8aGi9jQjhCY2NjY2NjY2N"
                        + "jY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2P/wAARCABAAEgDASIAAhEBAxEB/8QAGwAAAQU"
                        + "BAQAAAAAAAAAAAAAABQACAwQGAQf/xAAzEAACAQMCAwUGBQUAAAAAAAABAgMABBEFIRITMQZBUZPRFCIjQlRhcYGRoeEy"
                        + "RLHB8f/EABgBAAMBAQAAAAAAAAAAAAAAAAACAwEE/8QAGxEAAwADAQEAAAAAAAAAAAAAAAECAxExEiH/2gAMAwEAAhEDEQA"
                        + "/ANYbO1+lg8pfSuG0tB/bQeUvpUuSa5ilNITaWv0sHlr6VVvJNLsYy9yltGAM4KLk/gMVD2j1NtM0/jixzZG4FJ+XY5NYW3sb"
                        + "zUpDInE2T70sjZz60Gpb4HYu1OnNc8L2EIjJ2IjGR+1HtOutK1LiFtFAxTcgxAH/ABQJezditsFZTzcbuCQc/ahBS77P6nHcAl"
                        + "ouL+odGHeDSqk/g7hpbPQhaWv00Hlr6V32O1+mg8tfSuwyCWJJB0ZQRT81ohF7Ha/TQeWvpSqXNKgB1LNLNcJrTDLdr7Y3N7YK7"
                        + "ERkOMDx2roWOG2VOF+WowFhBzVvU8+3s+e4Dc92NsfvShlT5jjx6VJ19OiI0ijaEm4LRNPwHbgmbI/Kq19LLcI8UnJIYcJiz7w+4o"
                        + "rcNLwq1usbZPznAH6VVCe0cUs8ARlbYf7o9Le9DOXrRoLeTIMXCRywBnuO1TZqKPAUYxv4U/NUOYdmlTM0qDCQmmk1zNUr3U7ayBE"
                        + "jcT9yL1/itAff26TQO5yHRSQQfDegcEqydKEa7rNzdIV5vKjzkRocfr410SOh5kbYzvip5JL4a6gxNC27pGZPEcZB/Kh8t49rHJzOJ"
                        + "VG/CxzTDrEiJhhuKCahfSXdwqt7qZGc0spv4UukkbvTtctLyOMM3IlYD4b+P2PfRISoVyG2zivOIJOO4X5QrAhsj8tjWtbUFVAqOSyj"
                        + "chapb8nLK2HOIUqBx3ILEmUCQffelSq0N5Gdqb64gSKCJiiSAlmHU4PSs1zWwSx3rQ9oNQ0u704hb23eRGDKA4J8DWXae3yMTIR3+9Vp"
                        + "Jsu6VZi8nkmlTMcQwoI6t/FWpoSvEB0FSaXf2MNkqtdQqxJJBapH1LTc4a6h/ENmkyS3wtipT0FyIMEneqJtuZIc/wDKLTSWDj4V7Co8G"
                        + "cVXuJrOKHhjuonZiSSrdB3URLXQyWnwom2eVAqOFjzjJ6n70Tt57iL3FlLINsMMiqa3kCKMSxnA6E0o72EE8UydfHup9J9I7a4W+aysAzM"
                        + "3gM9KVVlvoTj4sYY7kk9BSo8yG2f/2Q==";
                
                user.setImagen(imageUser);
                break;
                
//            case "wespinoza":
//                break;
//                
//            case "emuxtay":
//                break;
                
            //usuario extra    
//            case "rgomez":
//                imageUser = "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEAAAABACAQAAAAAYLlVAAAABGdBTUEA"
//                        + "ALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAEcklEQVR42"
//                        + "u3Ze4hV1R4H8M8+83DO1Xttxjs5xq009FrONW5FBdnjH6UyhKIpS3sLpUQUhUUvekIPi/7SwuwlPSCl6Gk"
//                        + "FihUlZVloGig2aWZqFNSUZ8aZOavzx2ITh/FMnvYxoj7fP/fas3/stdaetdZRtSZjTXZaKZON06RKuaruOd"
//                        + "xVlljmRUtLedEyS12tXY7aO9gdtigKZSna5h6j1VRiig/jwwfOGqfKqZHEdN8IMT02eNXCUl7xmW4hZocL5"
//                        + "NTENDvjQwpeM90ojaBBmw4v+Tle3eVMsjfe2viAbeYYqlzeLF/FFp85QsbqLYh/fIvT7c2pvoytFmmQqRN9"
//                        + "Jwi6XKSSGboEwXdOkal5glIs1qiSRo/Glg9LZKbVJ4LgeycZzCTfxwnZKjOT4otd7h8GM9Ty2FmTZGa6vvha"
//                        + "GdydgqDPeTIzJ/brbfvU+obs/xl12xcN2RWwB3AgBtcE+Da7ArbpAf9RZzB1jgE9OmVmvK2CYKPRBjPGRkGw1"
//                        + "fjs3kCn1WCssw3mDGPBpzpl6MI4ETc4QiWHWx8n4RUyNdJ7glK8UGEo/tuS2GqVA2WsI34Ni553mIEc6hn98"
//                        + "St4vsw1ekB/uvCaqQVSzc71Ybza7yGNZK/Fk2kJPVa5XYdTSjnbLd5TSB//rBFqZIT5dgtpeu0upVdIU/CIV"
//                        + "jWUd5l1Bl4XF31utryaO9TNVumSlqHoJx+4zRj7TbOTXGeBhaUsMNfJWvz1JIbIlzJEzn6V167DtRZ608pS3"
//                        + "rLIXOc4Ul6N5Rxmttfs0CuUpc9Or5ttnJwaOdgtNukXKqTfF243WuYadVij6NezvluXb0vp0l12Za3zNcrQc"
//                        + "Hf5UYjZY72nXWuyExxZygkmu8Zi6/QIMV3u0ywjzRboSz+1b7nYQXLK5bSZ6U27085YpEUG8h5M+32DSwxTy"
//                        + "TAzrU1LmJ/FvLhcIfbsqyZgcOO9HMdEtyv9Tv+zOV0Jtfmt2tKV0RcmUr0k3RV/ZIx9McaqeOd8OVX7r05B8"
//                        + "KOzDKTJBO2aDOSMOG86jVO1C+Pwe1keUnXaTHG9ZbaX8oYbTDFKHaSaYjcUzVGlxMNxNM8iavB/F3vMOnG6x"
//                        + "RRs8IRLHK2BaEYs/ymJqjRZEY9bjiKaaqf+Ch/iXaYSHR2PdVZoUpVhcS+w3sjyrXeago3p8Vz5Fn5k3KS87"
//                        + "5/Vbc3qNIBue4iGAKldZpjmbm/YAWgl2qMb1KurroAE5YYrt8sKt5rmRn0gZ5/Uy6Z9nx2KBpZkeVxfsDdD5"
//                        + "YAs30Ci3A/2pkU9+IlUyL4LdgNWe0UCZoGi4wCbsh8DgdQWBXlsd69eHOJdh5Aq2FTbn2w2+xoca6KBfGVzb"
//                        + "QvY5h1wkOs1o9xq22tbQL/n/ADOMU+rUDZEn9afZQEJyr3tcQE5l3rOVPVEwZOWo1yiSgdYqauUlQ6AVKslQ"
//                        + "kyPPiFmqdYK91ehXrvjS2lXD6RGWVy2N+r1rFEV7s/cv8z1pRCz1U2G288SE8zzsTXuN1HiD5FoMULib39mv"
//                        + "wDLkTujpN2KnwAAAABJRU5ErkJggg==";
//                
//                user.setImagen(imageUser);
                
//                break;
                

            default:
                imageUser = "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEAAAABACAQAAAAAYLlVAAAABGdBTUEA"
                        + "ALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAEcklEQVR42"
                        + "u3Ze4hV1R4H8M8+83DO1Xttxjs5xq009FrONW5FBdnjH6UyhKIpS3sLpUQUhUUvekIPi/7SwuwlPSCl6Gk"
                        + "FihUlZVloGig2aWZqFNSUZ8aZOavzx2ITh/FMnvYxoj7fP/fas3/stdaetdZRtSZjTXZaKZON06RKuaruOd"
                        + "xVlljmRUtLedEyS12tXY7aO9gdtigKZSna5h6j1VRiig/jwwfOGqfKqZHEdN8IMT02eNXCUl7xmW4hZocL5"
                        + "NTENDvjQwpeM90ojaBBmw4v+Tle3eVMsjfe2viAbeYYqlzeLF/FFp85QsbqLYh/fIvT7c2pvoytFmmQqRN9"
                        + "Jwi6XKSSGboEwXdOkal5glIs1qiSRo/Glg9LZKbVJ4LgeycZzCTfxwnZKjOT4otd7h8GM9Ty2FmTZGa6vvha"
                        + "GdydgqDPeTIzJ/brbfvU+obs/xl12xcN2RWwB3AgBtcE+Da7ArbpAf9RZzB1jgE9OmVmvK2CYKPRBjPGRkGw1"
                        + "fjs3kCn1WCssw3mDGPBpzpl6MI4ETc4QiWHWx8n4RUyNdJ7glK8UGEo/tuS2GqVA2WsI34Ni553mIEc6hn98"
                        + "St4vsw1ekB/uvCaqQVSzc71Ybza7yGNZK/Fk2kJPVa5XYdTSjnbLd5TSB//rBFqZIT5dgtpeu0upVdIU/CIV"
                        + "jWUd5l1Bl4XF31utryaO9TNVumSlqHoJx+4zRj7TbOTXGeBhaUsMNfJWvz1JIbIlzJEzn6V167DtRZ608pS3"
                        + "rLIXOc4Ul6N5Rxmttfs0CuUpc9Or5ttnJwaOdgtNukXKqTfF243WuYadVij6NezvluXb0vp0l12Za3zNcrQc"
                        + "Hf5UYjZY72nXWuyExxZygkmu8Zi6/QIMV3u0ywjzRboSz+1b7nYQXLK5bSZ6U27085YpEUG8h5M+32DSwxTy"
                        + "TAzrU1LmJ/FvLhcIfbsqyZgcOO9HMdEtyv9Tv+zOV0Jtfmt2tKV0RcmUr0k3RV/ZIx9McaqeOd8OVX7r05B8"
                        + "KOzDKTJBO2aDOSMOG86jVO1C+Pwe1keUnXaTHG9ZbaX8oYbTDFKHaSaYjcUzVGlxMNxNM8iavB/F3vMOnG6x"
                        + "RRs8IRLHK2BaEYs/ymJqjRZEY9bjiKaaqf+Ch/iXaYSHR2PdVZoUpVhcS+w3sjyrXeago3p8Vz5Fn5k3KS87"
                        + "5/Vbc3qNIBue4iGAKldZpjmbm/YAWgl2qMb1KurroAE5YYrt8sKt5rmRn0gZ5/Uy6Z9nx2KBpZkeVxfsDdD5"
                        + "YAs30Ci3A/2pkU9+IlUyL4LdgNWe0UCZoGi4wCbsh8DgdQWBXlsd69eHOJdh5Aq2FTbn2w2+xoca6KBfGVzb"
                        + "QvY5h1wkOs1o9xq22tbQL/n/ADOMU+rUDZEn9afZQEJyr3tcQE5l3rOVPVEwZOWo1yiSgdYqauUlQ6AVKslQ"
                        + "kyPPiFmqdYK91ehXrvjS2lXD6RGWVy2N+r1rFEV7s/cv8z1pRCz1U2G288SE8zzsTXuN1HiD5FoMULib39mv"
                        + "wDLkTujpN2KnwAAAABJRU5ErkJggg==";
                
                user.setImagen(imageUser);
                break;
        }

        // Grabar el usuario
        String sql = "insert into usuarios (nombresUsuario, userName, contrasenia, correoUsuario, codigoEmpleado,imagen) values (?, ?, ?, ?, ?, ?)";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, user.getNombresUsuario());
            ps.setString(2, user.getUserName());
            ps.setString(3, user.getContrasenia());
            ps.setString(4, user.getCorreoUsuario());
            ps.setInt(5, codEmpleado);
            ps.setString(6, user.getImagen());
            return ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        //Asignar imagen

        return resp; // indica la linea que se agregara
    }

    //Asignar imagen
    //existe un usuario con ese nombre
    public boolean existeUsuario(String userName) {
        String sql = "select count(*) from usuarios where userName = ?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, userName);
            rs = ps.executeQuery();

            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    //un empleado ya tiene un usuario
    public boolean tieneUsuario(int codigoEmpleado) {
        String sql = "select count(*) from usuarios where codigoEmpleado = ?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, codigoEmpleado);
            rs = ps.executeQuery();

            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
