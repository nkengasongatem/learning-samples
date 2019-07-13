package app;

/**
 *
 * @author nkengasong
 */
public enum Title {
    MR("Mr."), MS("Ms."), MRS("Mrs."), MISS("Miss.");
    private final String label;
 
    private Title(String label) {
        this.label = label;
    }
 
    public String getLabel() {
        return label;
    }
}
