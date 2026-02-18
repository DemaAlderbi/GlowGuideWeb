package model;

public class RoutineItem {

    private int itemId;
    private int routineId;
    private int productId;
    private int stepOrder;

    public RoutineItem() {}

    public RoutineItem(int routineId, int productId, int stepOrder) {
        this.routineId = routineId;
        this.productId = productId;
        this.stepOrder = stepOrder;
    }

    public int getItemId() {
        return itemId;
    }

    public void setItemId(int itemId) {
        this.itemId = itemId;
    }

    public int getRoutineId() {
        return routineId;
    }

    public void setRoutineId(int routineId) {
        this.routineId = routineId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getStepOrder() {
        return stepOrder;
    }

    public void setStepOrder(int stepOrder) {
        this.stepOrder = stepOrder;
    }
}
