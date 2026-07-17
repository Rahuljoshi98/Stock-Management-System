/*
  Warnings:

  - Added the required column `organization_id` to the `roles` table without a default value. This is not possible if the table is not empty.

*/
-- CreateEnum
CREATE TYPE "AuditActorType" AS ENUM ('USER', 'SYSTEM');

-- AlterTable
ALTER TABLE "roles" ADD COLUMN     "created_by_type" "AuditActorType" NOT NULL DEFAULT 'USER',
ADD COLUMN     "organization_id" UUID NOT NULL;

-- AddForeignKey
ALTER TABLE "roles" ADD CONSTRAINT "roles_organization_id_fkey" FOREIGN KEY ("organization_id") REFERENCES "organizations"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
