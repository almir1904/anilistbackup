# AniPy Dockerized Backup Tool

AniPy Dockerized Backup Tool is a containerized solution for backing up your AniList and MyAnimeList (MAL) anime and manga lists. It provides options to customize your backup settings and is designed to be run using Docker Compose.

## Possible Settings for `docker-compose.yml`

You can customize your backup settings by editing the `docker-compose.yml` file. Below are the possible environment variables that you can configure in the `docker-compose.yml` file:

- `ANI` (required): Your AniList username.
- `MAL` (optional): Your MAL username.
- `TACHI` (true/false, optional): Set to `true` if you want to include Tachiyomi backup. Place Tachiyomi backup file as `tachiyomi-backup.xml` in the output path.
- `TRIM_LISTS` (true/false, optional): Set to `true` to trim lists and compare with MAL.
- `SEPARATE_NSFW` (true/false, optional): Set to `true` to separate NSFW entries.
- `CLEAR_OUTPUT_FILES` (true/false, optional): Set to `true` to clear existing output files.
- `USE_ANILIST_AS_MAL` (true/false, optional): Set to `true` to use AniList as the MAL username if MAL is not provided.

## Special Thanks

This project is built upon the excellent work of [Jacekun](https://github.com/Jacekun/AniPy).

## Example for Docker Run

You can run the AniPy Dockerized Backup Tool by executing the following command within the repository directory:

```bash
docker run -d \
  --name anilistbackup \
  -e ANI=your_anilist_user \
  -e MAL=your_mal_user \
  -e TACHI=true \
  -e TRIM_LISTS=true \
  -e SEPARATE_NSFW=true \
  -e CLEAR_OUTPUT_FILES=true \
  -e USE_ANILIST_AS_MAL=true \
  -v /path/to/host/output/directory:/app/AniPy/output \
  almir1904/anilistbackup:latest
```


