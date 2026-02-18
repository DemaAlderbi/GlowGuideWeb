package model;

public class Routine {

    private int routineId;
    private int userId;
    private String routineName;

    public Routine() {}

    public Routine(int routineId, int userId, String routineName) {
        this.routineId = routineId;
        this.userId = userId;
        this.routineName = routineName;
    }

    public int getRoutineId() {
        return routineId;
    }

    public void setRoutineId(int routineId) {
        this.routineId = routineId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getRoutineName() {
        return routineName;
    }

    public void setRoutineName(String routineName) {
        this.routineName = routineName;
    }
}
