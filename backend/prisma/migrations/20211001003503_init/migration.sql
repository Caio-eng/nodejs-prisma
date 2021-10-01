/*
  Warnings:

  - You are about to drop the column `model` on the `Car` table. All the data in the column will be lost.
  - You are about to drop the column `userId` on the `Car` table. All the data in the column will be lost.
  - You are about to drop the column `year` on the `Car` table. All the data in the column will be lost.
  - You are about to drop the `User` table. If the table is not empty, all the data it contains will be lost.
  - A unique constraint covering the columns `[nome]` on the table `Car` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `ano` to the `Car` table without a default value. This is not possible if the table is not empty.
  - Added the required column `marca` to the `Car` table without a default value. This is not possible if the table is not empty.
  - Added the required column `modelo` to the `Car` table without a default value. This is not possible if the table is not empty.
  - Added the required column `nome` to the `Car` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Car" DROP CONSTRAINT "Car_userId_fkey";

-- AlterTable
ALTER TABLE "Car" DROP COLUMN "model",
DROP COLUMN "userId",
DROP COLUMN "year",
ADD COLUMN     "ano" INTEGER NOT NULL,
ADD COLUMN     "marca" TEXT NOT NULL,
ADD COLUMN     "modelo" TEXT NOT NULL,
ADD COLUMN     "nome" TEXT NOT NULL;

-- DropTable
DROP TABLE "User";

-- CreateIndex
CREATE UNIQUE INDEX "Car_nome_key" ON "Car"("nome");
