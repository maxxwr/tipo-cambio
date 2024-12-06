package mapix_jwt.Tcambio.Controller;
import mapix_jwt.Tcambio.Model.TipoCambio;
import mapix_jwt.Tcambio.Service.TipoCambioService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TipoCambioController {

    @Autowired
    private TipoCambioService tipoCambioService;

    @GetMapping("/tipo-cambio")
    public ResponseEntity<TipoCambio> obtenerTipoCambio(@RequestParam("fecha") String fecha) {
        TipoCambio tipoCambio = tipoCambioService.obtenerTipoCambio(fecha);

        if (tipoCambio != null) {
            return new ResponseEntity<>(tipoCambio, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND); 
        }
    }
}
