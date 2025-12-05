import { MigrationInterface, QueryRunner } from "typeorm";

export class InitialMigration1764210078263 implements MigrationInterface {
    name = 'InitialMigration1764210078263'

    public async up(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`CREATE TABLE "user" ("id" SERIAL NOT NULL, "nome" character varying NOT NULL, "email" character varying NOT NULL, "senha" character varying NOT NULL, "data_criacao" character varying NOT NULL, "nivel_acesso" character varying NOT NULL, CONSTRAINT "PK_cace4a159ff9f2512dd42373760" PRIMARY KEY ("id"))`);
        await queryRunner.query(`CREATE TABLE "parasite" ("id" SERIAL NOT NULL, "nome_comum" character varying NOT NULL, "nome_cientifico" character varying NOT NULL, "tipo" character varying NOT NULL, "plantas_afetadas" character varying NOT NULL, "sintomas" character varying NOT NULL, "tratamento" character varying NOT NULL, "imagem_url" character varying NOT NULL, "descricao" character varying NOT NULL, "criado_em" character varying NOT NULL, "atualizado_em" character varying NOT NULL, CONSTRAINT "PK_8f6ec61ea9a4f372fc126f0e0f1" PRIMARY KEY ("id"))`);
        await queryRunner.query(`CREATE TABLE "plant" ("id" SERIAL NOT NULL, "nome_comum" character varying NOT NULL, "nome_cientifico" character varying NOT NULL, "familia" character varying NOT NULL, "origem" character varying NOT NULL, "tipo" character varying NOT NULL, "ambiente" character varying NOT NULL, "rega" character varying NOT NULL, "toxico" boolean NOT NULL, "imagem_url" character varying NOT NULL, "descricao" character varying NOT NULL, "criado_em" character varying NOT NULL, "atualizado_em" character varying NOT NULL, CONSTRAINT "PK_97e1eb0d045aadea59401ece5ba" PRIMARY KEY ("id"))`);
    }

    public async down(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`DROP TABLE "plant"`);
        await queryRunner.query(`DROP TABLE "parasite"`);
        await queryRunner.query(`DROP TABLE "user"`);
    }

}
