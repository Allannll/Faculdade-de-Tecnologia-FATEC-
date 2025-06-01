package mario;

public class Mario {
    private MarioState currentState;
    private boolean isAlive = true;

    public Mario() {
        this.currentState = new TinyMario(this);
    }

    public void setState(MarioState state) {
        this.currentState = state;
        if (state == null) {
            System.out.println("Game Over!");
        }
    }

    public boolean isAlive() {
        return isAlive;
    }

    public void revive() {
        this.currentState = new TinyMario(this);
        this.isAlive = true;
        System.out.println("Mario reviveu!");
    }

    public void die() {
        System.out.println("Mario morreu!");
        isAlive = false;
    }

    public String getStateName() {
        return isAlive ? currentState.getClass().getSimpleName() : "Morto";
    }

    public void takeMushroom() {
        if (currentState != null) currentState.takeMushroom();
    }

    public void takeFireFlower() {
        if (currentState != null) currentState.takeFireFlower();
    }

    public void takeSuperFeather() {
        if (currentState != null) currentState.takeSuperFeather();
    }

    public void takeDamage() {
        if (currentState != null) currentState.takeDamage();
    }
}
