package time;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 * Clase que obtiene la fecha y hora actuales con un formato en específico.
 * @author jesus.zepeda@unah.hn, jose.inestroza@unah.edu.hn
 * @version 0.1.0
 * @since 2024/12/04
 * @date 2024/12/04
 */
public class TimeAndDate {

	public static String getCurrentDate() {
		
		LocalDateTime time = LocalDateTime.now();
		DateTimeFormatter format = DateTimeFormatter.ofPattern("YYYYMMddhhmmssSSS");
		
		System.out.println(time.format(format));
		
		return time.format(format);
	}
}