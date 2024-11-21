package programLibraries.api;

public class Validator {

    public static boolean isEmail(String value) {
        return value.matches("^[\\w.%+-]+@[\\w.-]+\\.[a-zA-Z]{2,}$");
    }

    public static String clear(String value) {
        if (value == null) {
            return "";
        }

        value = value.replaceAll("\\b(?i)(select|drop|insert|delete|update|where|table|from)\\b|['\";\\-]", "");
        value = value.replaceAll("<[^>]*>|[`\":;]+", "");

        return value;
    }
}