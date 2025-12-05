import User from "../../models/user.model";
import { Response, Request } from "express";


const mockRepository = {
    find: jest.fn(),
    findOneBy: jest.fn(),
    create: jest.fn(),
    save: jest.fn()
}

jest.mock('../../datasource', () => ({
    AppDataSource: {
            getRepository: jest.fn(() => mockRepository)
        }
}));

import userWithTypeormController from "../../controllers/userWithTypeorm.controller";

const mockRequestResponse = (reqOverrides: Partial<Request> = {}) => {
    const req: Partial<Request> = {
        params: {},
        body: {},
        ...reqOverrides
    }

    const res: Partial<Response> = {
        status: jest.fn(() => res as Response),
        json: jest.fn(),
        sendStatus: jest.fn()
    }

    return { req: req as Request, res: res as Response};
};

describe('User With TypeORM Controller', () => {
    afterEach(() => {
        jest.clearAllMocks();
    });

    describe('getUsers', () => {
        it('should return a list of users', async () => {
            const mockUsers: User[] = [
                new User("nome1", "email1", "senha1",new Date('2025-12-17'), "nivel_acesso1"),
                new User("nome2", "email2", "senha2",new Date('2025-12-17'), "nivel_acesso2")
            ];
            mockRepository.find.mockResolvedValue(mockUsers);

            const { req, res } = mockRequestResponse();
            await userWithTypeormController.getUsers(req, res);

            expect(mockRepository.find).toHaveBeenCalledTimes(1);
            expect(res.status).toHaveBeenCalledWith(200);
            expect(res.json).toHaveBeenCalledWith(mockUsers);
        });
    });

    describe('getUserByUsername', () => {
        it('should return a user when found', async () => {
            const mockUser = new User("User.nome", "User.email", "User.senha", new Date('2025-12-17'),"User.nivel_acesso");
            mockRepository.findOneBy.mockResolvedValue(mockUser);

            const { req, res } = mockRequestResponse({ params: { username: 'testuser' } });
            await userWithTypeormController.getUserByUsername(req, res);

            expect(mockRepository.findOneBy).toHaveBeenCalledWith({ "nome": "testuser" });
            expect(res.status).toHaveBeenCalledWith(200);
            expect(res.json).toHaveBeenCalledWith(mockUser);
        });

        it('should return 404 when user is not found', async () => {
            mockRepository.findOneBy.mockResolvedValue(null);

            const { req, res } = mockRequestResponse({ params: { username: 'nonexistent' } });
            await userWithTypeormController.getUserByUsername(req, res);

            expect(res.sendStatus).toHaveBeenCalledWith(404);
        });
    });

    describe('createUser', () => {
        it('should create and return a new user', async () => {
   //         const newUser = new User("nome", "email", "senha", "data_criacao", "nivel_acesso");
            const newUser = { nome: 'newuser', email: 'newemail', senha: 'newpassword', nivel_acesso: 'newnivel_acesso'  };
            const savedUser = { id: 1, ...newUser };
            mockRepository.create.mockReturnValue(newUser as User);
            mockRepository.save.mockResolvedValue(savedUser);

            const { req, res } = mockRequestResponse({ body: newUser });
            await userWithTypeormController.createUser(req, res);

            expect(mockRepository.create).toHaveBeenCalledWith(newUser);
            expect(mockRepository.save).toHaveBeenCalledWith(newUser);
            expect(res.status).toHaveBeenCalledWith(201);
            expect(res.json).toHaveBeenCalledWith(savedUser);
        });
    });
});
