package mario.MarioStates;

import mario.Mario;
import mario.MarioState;

public class TanookiMario implements MarioState {
    private Mario mario;

    public TanookiMario(Mario mario) {
        this.mario = mario;
    }

    public void takeMushroom() {
        System.out.println("Nada acontece. Mario já é TanookiMario.");
    }

    public void takeFireFlower() {
        System.out.println("Mario virou Mario de Fogo!");
        mario.setState(new FireMario(mario));
    }

    public void takeTanookiLeaf() {
        System.out.println("Nada acontece. Mario já é TanookiMario.");
    }

    public void takeDamage() {
        System.out.println("Mario virou Super Mario.");
        mario.setState(new SuperMario(mario));
    }
}
