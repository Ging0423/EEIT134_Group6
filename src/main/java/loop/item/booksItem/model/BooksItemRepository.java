package loop.item.booksItem.model;

import org.springframework.data.jpa.repository.JpaRepository;

public interface BooksItemRepository extends JpaRepository<BooksItemBean, Integer> {

<<<<<<< Updated upstream
=======
	void update(BooksItemBean booksItemBean);

>>>>>>> Stashed changes
}
