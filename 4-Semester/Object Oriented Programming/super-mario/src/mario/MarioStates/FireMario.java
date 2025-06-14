package mario.MarioStates;

import mario.Mario;
import mario.MarioState;

public class FireMario implements MarioState {
    private Mario mario;

    public FireMario(Mario mario) {
        this.mario = mario;
    }

    public void takeMushroom() {
        System.out.println("Nada acontece. Mario já está com poder.");
    }

    public void takeFireFlower() {
        System.out.println("Nada acontece. Mario já está com Flor de Fogo.");
    }

    public void takeTanookiLeaf() {
        System.out.println("Mario virou Mario Tanuki!");
        mario.setState(new TanookiMario(mario));
    }

    public void takeDamage() {
        System.out.println("Mario virou Super Mario.");
        mario.setState(new SuperMario(mario));
    }
}
