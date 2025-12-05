import User from '../../models/user.model';
import { hash } from 'bcrypt';

jest.mock('bcrypt', () => ({
    hash: jest.fn(),
}));

describe('User model', () => {
    beforeEach(() => {
        (hash as jest.Mock).mockClear();
    });

    it('should create a user instance', () => {
        const user = new User('testuser','', 'password123',new Date('2025-12-17'), '');

        expect(user.nome).toBe('testuser');
        expect(user.senha).toBe('password123');
        expect(user.id).toBeUndefined();
    });

    it('should hash the password on hashPassword call', async () => {
        const plainPassword = 'password123';
        const hashedPassword = 'hashedPassword';
        (hash as jest.Mock).mockResolvedValue(hashedPassword);

        const user = new User('testuser','', plainPassword,new Date('2025-12-17'),'');
        await user.hashPassword();

        expect(hash).toHaveBeenCalledWith(plainPassword, 10);
        expect(user.senha).toBe(hashedPassword);
    });
});
