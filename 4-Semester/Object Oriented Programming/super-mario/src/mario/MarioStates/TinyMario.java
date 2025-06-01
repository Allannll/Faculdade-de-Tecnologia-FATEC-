package mario;

public class TinyMario implements MarioState {
    private Mario mario;

    public TinyMario(Mario mario) {
        this.mario = mario;
    }

    public void takeMushroom() {
        System.out.println("Mario virou Super Mario!");
        mario.setState(new SuperMario(mario));
    }

    public void takeFireFlower() {
        System.out.println("Mario virou Mario de Fogo!");
        mario.setState(new FireMario(mario));
    }

    public void takeSuperFeather() {
        System.out.println("Mario virou Mario Tanuki!");
        mario.setState(new TanookiMario(mario));
    }

    public void takeDamage() {
        mario.die(); //Set the dead status
    }

}
