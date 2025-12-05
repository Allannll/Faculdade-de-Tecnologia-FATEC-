import { MigrationInterface, QueryRunner } from "typeorm";

export class UpdatePlantDateColumns1764342605369 implements MigrationInterface {
    name = 'UpdatePlantDateColumns1764342605369'

    public async up(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`ALTER TABLE "plant" ALTER COLUMN "nome_cientifico" DROP NOT NULL`);
        await queryRunner.query(`ALTER TABLE "plant" ALTER COLUMN "familia" DROP NOT NULL`);
        await queryRunner.query(`ALTER TABLE "plant" ALTER COLUMN "origem" DROP NOT NULL`);
        await queryRunner.query(`ALTER TABLE "plant" ALTER COLUMN "imagem_url" DROP NOT NULL`);
        await queryRunner.query(`ALTER TABLE "plant" ALTER COLUMN "descricao" DROP NOT NULL`);
        await queryRunner.query(`ALTER TABLE "plant" DROP COLUMN "criado_em"`);
        await queryRunner.query(`ALTER TABLE "plant" ADD "criado_em" TIMESTAMP NOT NULL DEFAULT now()`);
        await queryRunner.query(`ALTER TABLE "plant" DROP COLUMN "atualizado_em"`);
        await queryRunner.query(`ALTER TABLE "plant" ADD "atualizado_em" TIMESTAMP NOT NULL DEFAULT now()`);
    }

    public async down(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`ALTER TABLE "plant" DROP COLUMN "atualizado_em"`);
        await queryRunner.query(`ALTER TABLE "plant" ADD "atualizado_em" character varying NOT NULL`);
        await queryRunner.query(`ALTER TABLE "plant" DROP COLUMN "criado_em"`);
        await queryRunner.query(`ALTER TABLE "plant" ADD "criado_em" character varying NOT NULL`);
        await queryRunner.query(`ALTER TABLE "plant" ALTER COLUMN "descricao" SET NOT NULL`);
        await queryRunner.query(`ALTER TABLE "plant" ALTER COLUMN "imagem_url" SET NOT NULL`);
        await queryRunner.query(`ALTER TABLE "plant" ALTER COLUMN "origem" SET NOT NULL`);
        await queryRunner.query(`ALTER TABLE "plant" ALTER COLUMN "familia" SET NOT NULL`);
        await queryRunner.query(`ALTER TABLE "plant" ALTER COLUMN "nome_cientifico" SET NOT NULL`);
    }

}
