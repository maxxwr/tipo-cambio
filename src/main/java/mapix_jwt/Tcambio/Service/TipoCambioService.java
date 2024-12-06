package mapix_jwt.Tcambio.Service;
import mapix_jwt.Tcambio.Model.TipoCambio;
import mapix_jwt.Tcambio.Repository.TipoCambioRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Optional;

@Service
public class TipoCambioService {

    @Autowired
    private TipoCambioRepository tipoCambioRepository;

    private static final String URL = "https://www.sunat.gob.pe/a/txt/tipoCambio.txt";
    private static final DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");

    public TipoCambio obtenerTipoCambio(String fechaStr) {
        LocalDate fecha = LocalDate.parse(fechaStr, formatter);
        Optional<TipoCambio> tipoCambioOpt = tipoCambioRepository.findByFecha(fecha);

        if (tipoCambioOpt.isPresent()) {
            TipoCambio tipoCambio = tipoCambioOpt.get();
            double paralelo = tipoCambio.getCompra() - 0.05;
            tipoCambio.setParalelo(redondear(paralelo, 3));
            return tipoCambio;
        } else {
            RestTemplate restTemplate = new RestTemplate();
            String response = restTemplate.getForObject(URL, String.class);

            if (response != null) {
                System.out.println("Respuesta del servicio: " + response);
                String[] lines = response.split("\n");
                for (String line : lines) {
                    System.out.println("Línea: " + line);

                    String[] datos = line.split("\\|");
                    if (datos.length >= 3) {
                        try {
                            LocalDate fechaResponse = LocalDate.parse(datos[0], formatter);

                            if (fechaResponse.equals(fecha)) {
                                TipoCambio nuevoTipoCambio = new TipoCambio(fechaResponse, Double.parseDouble(datos[1]), Double.parseDouble(datos[2]));
                                double paralelo = nuevoTipoCambio.getCompra() - 0.05;
                                nuevoTipoCambio.setParalelo(redondear(paralelo, 3));
                                tipoCambioRepository.save(nuevoTipoCambio);
                                return nuevoTipoCambio;
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }
                }
            } else {
                return null; 
            }
        }

        return null; 
    }

    private double redondear(double valor, int decimales) {
        BigDecimal bd = new BigDecimal(Double.toString(valor));
        bd = bd.setScale(decimales, RoundingMode.HALF_UP);
        return bd.doubleValue();
    }
}
