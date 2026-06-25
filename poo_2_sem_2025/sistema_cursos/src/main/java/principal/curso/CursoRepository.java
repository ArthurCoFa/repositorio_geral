package principal.curso;

import org.springframework.data.jpa.repository.JpaRepository;

// Interface para utilizar métodos CRUD
public interface CursoRepository extends JpaRepository<Curso, Long> {

}
