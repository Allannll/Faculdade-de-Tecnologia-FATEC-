import { MigrationInterface, QueryRunner } from "typeorm";

export class UpdateParasitesAndUser1764344334872 implements MigrationInterface {
    name = 'UpdateParasitesAndUser1764344334872'

    public async up(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`ALTER TABLE "user" DROP COLUMN "data_criacao"`);
        await queryRunner.query(`ALTER TABLE "user" ADD "data_criacao" TIMESTAMP NOT NULL DEFAULT now()`);
        await queryRunner.query(`ALTER TABLE "parasite" DROP COLUMN "criado_em"`);
        await queryRunner.query(`ALTER TABLE "parasite" ADD "criado_em" TIMESTAMP NOT NULL DEFAULT now()`);
        await queryRunner.query(`ALTER TABLE "parasite" DROP COLUMN "atualizado_em"`);
        await queryRunner.query(`ALTER TABLE "parasite" ADD "atualizado_em" TIMESTAMP NOT NULL DEFAULT now()`);
    }

    public async down(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`ALTER TABLE "parasite" DROP COLUMN "atualizado_em"`);
        await queryRunner.query(`ALTER TABLE "parasite" ADD "atualizado_em" character varying NOT NULL`);
        await queryRunner.query(`ALTER TABLE "parasite" DROP COLUMN "criado_em"`);
        await queryRunner.query(`ALTER TABLE "parasite" ADD "criado_em" character varying NOT NULL`);
        await queryRunner.query(`ALTER TABLE "user" DROP COLUMN "data_criacao"`);
        await queryRunner.query(`ALTER TABLE "user" ADD "data_criacao" character varying NOT NULL`);
    }

}
