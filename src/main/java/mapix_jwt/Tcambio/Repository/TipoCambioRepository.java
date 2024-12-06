package mapix_jwt.Tcambio.Repository;
import mapix_jwt.Tcambio.Model.TipoCambio;
import org.springframework.data.jpa.repository.JpaRepository;
import java.time.LocalDate;
import java.util.Optional;

public interface TipoCambioRepository extends JpaRepository<TipoCambio, LocalDate> {
    Optional<TipoCambio> findByFecha(LocalDate fecha);
}
