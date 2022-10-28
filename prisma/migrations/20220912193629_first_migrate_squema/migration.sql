-- CreateTable
CREATE TABLE "stores" (
    "id" TEXT NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "document" VARCHAR(255) NOT NULL,
    "place" VARCHAR(255) NOT NULL,

    CONSTRAINT "stores_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "roles" (
    "id" TEXT NOT NULL,
    "access" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "update_at" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "nameId" VARCHAR(255) NOT NULL,
    "roleId" VARCHAR(255) NOT NULL,
    "userId" VARCHAR(255) NOT NULL,

    CONSTRAINT "roles_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "users" (
    "id" TEXT NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "place" VARCHAR(255) NOT NULL,
    "document" VARCHAR(255) NOT NULL,
    "email" VARCHAR(255) NOT NULL,
    "userId" VARCHAR(255) NOT NULL,
    "roleId" VARCHAR(255) NOT NULL,
    "authorId" VARCHAR(255) NOT NULL,
    "purchaseId" VARCHAR(255) NOT NULL,

    CONSTRAINT "users_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "requests" (
    "id" TEXT NOT NULL,
    "user" VARCHAR(255) NOT NULL,
    "product" VARCHAR(255) NOT NULL,
    "userId" VARCHAR(255) NOT NULL,

    CONSTRAINT "requests_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "products" (
    "id" TEXT NOT NULL,
    "type" VARCHAR(255) NOT NULL,
    "description" VARCHAR(255) NOT NULL,
    "brand" VARCHAR(255) NOT NULL,
    "status" VARCHAR(255) NOT NULL,
    "value" VARCHAR(255) NOT NULL,
    "registration" VARCHAR(255) NOT NULL,
    "most" VARCHAR(255) NOT NULL,

    CONSTRAINT "products_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "stores_name_key" ON "stores"("name");

-- CreateIndex
CREATE UNIQUE INDEX "stores_document_key" ON "stores"("document");

-- CreateIndex
CREATE UNIQUE INDEX "stores_place_key" ON "stores"("place");

-- CreateIndex
CREATE UNIQUE INDEX "roles_roleId_key" ON "roles"("roleId");

-- CreateIndex
CREATE UNIQUE INDEX "roles_userId_key" ON "roles"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "users_name_key" ON "users"("name");

-- CreateIndex
CREATE UNIQUE INDEX "users_place_key" ON "users"("place");

-- CreateIndex
CREATE UNIQUE INDEX "users_document_key" ON "users"("document");

-- CreateIndex
CREATE UNIQUE INDEX "users_email_key" ON "users"("email");

-- CreateIndex
CREATE UNIQUE INDEX "users_userId_key" ON "users"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "users_roleId_key" ON "users"("roleId");

-- CreateIndex
CREATE UNIQUE INDEX "users_authorId_key" ON "users"("authorId");

-- CreateIndex
CREATE UNIQUE INDEX "users_purchaseId_key" ON "users"("purchaseId");

-- CreateIndex
CREATE UNIQUE INDEX "requests_user_key" ON "requests"("user");

-- CreateIndex
CREATE UNIQUE INDEX "requests_product_key" ON "requests"("product");

-- CreateIndex
CREATE UNIQUE INDEX "requests_userId_key" ON "requests"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "products_most_key" ON "products"("most");

-- AddForeignKey
ALTER TABLE "users" ADD CONSTRAINT "users_userId_fkey" FOREIGN KEY ("userId") REFERENCES "stores"("document") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "users" ADD CONSTRAINT "users_authorId_fkey" FOREIGN KEY ("authorId") REFERENCES "requests"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "users" ADD CONSTRAINT "users_purchaseId_fkey" FOREIGN KEY ("purchaseId") REFERENCES "products"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
