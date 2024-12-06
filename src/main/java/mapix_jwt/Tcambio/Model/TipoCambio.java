package mapix_jwt.Tcambio.Model;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import java.time.LocalDate;

@Entity
public class TipoCambio {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private LocalDate fecha;
    private Double compra;
    private Double venta;
    private transient Double paralelo;
    public TipoCambio() {}
    public TipoCambio(LocalDate fecha, Double compra, Double venta) {
        this.fecha = fecha;
        this.compra = compra;
        this.venta = venta;
    }
    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }
    public LocalDate getFecha() {
        return fecha;
    }
    public void setFecha(LocalDate fecha) {
        this.fecha = fecha;
    }
    public Double getCompra() {
        return compra;
    }
    public void setCompra(Double compra) {
        this.compra = compra;
    }
    public Double getVenta() {
        return venta;
    }
    public void setVenta(Double venta) {
        this.venta = venta;
    }
    public Double getParalelo() {
        return paralelo;
    }
    public void setParalelo(Double paralelo) {
        this.paralelo = paralelo;
    }
}