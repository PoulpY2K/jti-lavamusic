-- CreateTable
CREATE TABLE "Guild" (
    "guildId" TEXT NOT NULL,
    "prefix" TEXT NOT NULL,

    CONSTRAINT "Guild_pkey" PRIMARY KEY ("guildId")
);

-- CreateTable
CREATE TABLE "Stay" (
    "guildId" TEXT NOT NULL,
    "textId" TEXT NOT NULL,
    "voiceId" TEXT NOT NULL,

    CONSTRAINT "Stay_pkey" PRIMARY KEY ("guildId")
);

-- CreateTable
CREATE TABLE "Dj" (
    "guildId" TEXT NOT NULL,
    "mode" BOOLEAN NOT NULL,

    CONSTRAINT "Dj_pkey" PRIMARY KEY ("guildId")
);

-- CreateTable
CREATE TABLE "Role" (
    "guildId" TEXT NOT NULL,
    "roleId" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Playlist" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "Playlist_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Song" (
    "id" TEXT NOT NULL,
    "track" TEXT NOT NULL,
    "playlistId" TEXT NOT NULL,

    CONSTRAINT "Song_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Botchannel" (
    "guildId" TEXT NOT NULL,
    "textId" TEXT NOT NULL,

    CONSTRAINT "Botchannel_pkey" PRIMARY KEY ("guildId")
);

-- CreateTable
CREATE TABLE "Setup" (
    "guildId" TEXT NOT NULL,
    "textId" TEXT NOT NULL,
    "messageId" TEXT NOT NULL,

    CONSTRAINT "Setup_pkey" PRIMARY KEY ("guildId")
);

-- CreateTable
CREATE TABLE "Premium" (
    "userId" TEXT NOT NULL,
    "guildId" TEXT NOT NULL,

    CONSTRAINT "Premium_pkey" PRIMARY KEY ("userId")
);

-- CreateIndex
CREATE UNIQUE INDEX "Role_guildId_roleId_key" ON "Role"("guildId", "roleId");

-- CreateIndex
CREATE UNIQUE INDEX "Playlist_userId_name_key" ON "Playlist"("userId", "name");

-- CreateIndex
CREATE UNIQUE INDEX "Song_track_playlistId_key" ON "Song"("track", "playlistId");

-- AddForeignKey
ALTER TABLE "Stay" ADD CONSTRAINT "Stay_guildId_fkey" FOREIGN KEY ("guildId") REFERENCES "Guild"("guildId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Dj" ADD CONSTRAINT "Dj_guildId_fkey" FOREIGN KEY ("guildId") REFERENCES "Guild"("guildId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Role" ADD CONSTRAINT "Role_guildId_fkey" FOREIGN KEY ("guildId") REFERENCES "Guild"("guildId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Song" ADD CONSTRAINT "Song_playlistId_fkey" FOREIGN KEY ("playlistId") REFERENCES "Playlist"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Botchannel" ADD CONSTRAINT "Botchannel_guildId_fkey" FOREIGN KEY ("guildId") REFERENCES "Guild"("guildId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Setup" ADD CONSTRAINT "Setup_guildId_fkey" FOREIGN KEY ("guildId") REFERENCES "Guild"("guildId") ON DELETE RESTRICT ON UPDATE CASCADE;
