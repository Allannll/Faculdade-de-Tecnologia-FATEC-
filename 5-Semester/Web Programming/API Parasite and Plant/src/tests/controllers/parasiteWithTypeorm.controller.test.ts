import Parasite from "../../models/parasite.model";
import { Response, Request } from "express";

const mockRepository = {
    find: jest.fn(),
    delete: jest.fn()
}

jest.mock('../../datasource', () => ({
    AppDataSource: {
            getRepository: jest.fn(() => mockRepository)
        }
}));

import ParasiteWithTypeormController from "../../controllers/parasiteWithTypeorm.controller";

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

describe('Parasite controller', () => {
    afterEach(() => {
        jest.clearAllMocks();
    });

    describe('getParasites', () => {
        it('deveria retornar a lista de pacientes', async() => {
            //                {id: 1, code: "123", name: "Eduardo"}, 
            const mockParasites: Parasite[] = [
                {
        id: 1,
        nome_comum: 'lumbriga',
        nome_cientifico: 'lumbrigus longuns',
        tipo: '2',
        plantas_afetadas: '5',
        sintomas: 'branquiamento',
        tratamento: 'veneno',
        imagem_url: 'string',
        descricao: 'Lombriga longa do cerrado',
        criado_em: new Date('2025-12-17'),
        atualizado_em: new Date('2025-12-17')
    },
                
{
        id: 2,
        nome_comum: 'cupim',
        nome_cientifico: 'cupim duro',
        tipo: '1',
        plantas_afetadas: '9',
        sintomas: 'destruição de raizes',
        tratamento: 'veneno tipo 4',
        imagem_url: 'https://www.freeimages.com/pt/premium-clipart/nasty-termite-4548353',
        descricao: 'Lombriga longa do cerrado',
        criado_em: new Date('2025-12-17'),
        atualizado_em: new Date('2025-12-17')
    }
            ];

            mockRepository.find.mockResolvedValue(mockParasites);

            const {req, res} = mockRequestResponse();

            await ParasiteWithTypeormController.getParasites(req as Request, res as Response);


            expect(mockRepository.find).toHaveBeenCalledTimes(1);
            expect(res.status).toHaveBeenCalledWith(200);
            expect(res.json).toHaveBeenCalledWith(mockParasites);

        });
    });

    describe('deleteParasite', () => {
        it('deveria deletar um paciente', async() => {
            mockRepository.delete.mockResolvedValue({affected: 1});

            const {req, res} = mockRequestResponse({params: {id: '1'}});

            await ParasiteWithTypeormController.deleteParasite(req as Request, res as Response);

            expect(mockRepository.delete).toHaveBeenCalledTimes(1);
            expect(res.sendStatus).toHaveBeenCalledWith(204);
        });

        it('deveria deletar um paciente que nao existe', async() => {
            mockRepository.delete.mockResolvedValue({affected: null});

            const {req, res} = mockRequestResponse({params: {id: '1'}});

            await ParasiteWithTypeormController.deleteParasite(req as Request, res as Response);

            expect(mockRepository.delete).toHaveBeenCalledTimes(1);
            expect(res.sendStatus).toHaveBeenCalledWith(404);
        });
    });
});


