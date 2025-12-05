import Plant from "../../models/plant.model";
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

import PlantWithTypeormController from "../../controllers/plantWithTypeorm.controller";

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

describe('Plant controller', () => {
    afterEach(() => {
        jest.clearAllMocks();
    });

    describe('getPlants', () => {
        it('deveria retornar a lista de pacientes', async() => {
            //                {id: 1, code: "123", name: "Eduardo"}, 
            const mockPlants: Plant[] = [
                {
        id: 1,
        nome_comum: 'bulba',
        nome_cientifico: 'bubassauro',
        familia: 'pokemon',
        origem: 'kento',
        tipo: 'planta',
        ambiente: 'familiar',
        rega: '3x',
        toxico: true,
        imagem_url: 'none',
        descricao: 'poggers',
        criado_em: new Date('2025-12-15'), 
        atualizado_em: new Date('2025-12-17')
    },
                
{
        id: 2,
        nome_comum: '',
        nome_cientifico: 'bubassaura',
        familia: 'pokemon',
        origem: 'kento',
        tipo: 'planta',
        ambiente: 'familiar',
        rega: '3x',
        toxico: true,
        imagem_url: 'none',
        descricao: 'poggers',
        criado_em: new Date('2025-12-15'), 
        atualizado_em: new Date('2025-12-17')
    }
            ];

            mockRepository.find.mockResolvedValue(mockPlants);

            const {req, res} = mockRequestResponse();

            await PlantWithTypeormController.getPlants(req as Request, res as Response);


            expect(mockRepository.find).toHaveBeenCalledTimes(1);
            expect(res.status).toHaveBeenCalledWith(200);
            expect(res.json).toHaveBeenCalledWith(mockPlants);

        });
    });

    describe('deletePlant', () => {
        it('deveria deletar um paciente', async() => {
            mockRepository.delete.mockResolvedValue({affected: 1});

            const {req, res} = mockRequestResponse({params: {id: '1'}});

            await PlantWithTypeormController.deletePlant(req as Request, res as Response);

            expect(mockRepository.delete).toHaveBeenCalledTimes(1);
            expect(res.sendStatus).toHaveBeenCalledWith(204);
        });

        it('deveria deletar um paciente que nao existe', async() => {
            mockRepository.delete.mockResolvedValue({affected: null});

            const {req, res} = mockRequestResponse({params: {id: '1'}});

            await PlantWithTypeormController.deletePlant(req as Request, res as Response);

            expect(mockRepository.delete).toHaveBeenCalledTimes(1);
            expect(res.sendStatus).toHaveBeenCalledWith(404);
        });
    });
});


