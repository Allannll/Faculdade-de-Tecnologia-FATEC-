package mario.MarioStates;

import mario.Mario;
import mario.MarioState;

public class SuperMario implements MarioState {
    private Mario mario;

    public SuperMario(Mario mario) {
        this.mario = mario;
    }

    public void takeMushroom() {
        System.out.println("Nada acontece. Mario já é Super.");
    }

    public void takeFireFlower() {
        System.out.println("Mario virou Mario de Fogo!");
        mario.setState(new FireMario(mario));
    }

    public void takeTanookiLeaf() {
        System.out.println("Mario virou Mario Tanuki!");
        mario.setState(new TanookiMario(mario));
    }

    public void takeDamage() {
        System.out.println("Mario voltou a ser Pequeno.");
        mario.setState(new TinyMario(mario));
    }
}
