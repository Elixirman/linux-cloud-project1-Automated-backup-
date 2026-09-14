Project 1: Automated Backup Script

Part of the Simple Linux Projects for Cloud Engineers series. A Bash script that compresses a target directory into a timestamped .tar.gz archive, built and documented around the permission model of real production systems — privileged provisioning, unprivileged execution, and failure-aware exit codes — rather than a simplified home-directory tutorial.

What this project does
Takes a source directory (in this project, the production-style path /var/www/html)
Validates that the source and backup destination exist before doing anything
Produces a compressed, timestamped .tar.gz archive
Reports success or failure in plain language and exits with a meaningful exit code (0 on success, 1 on failure) — the signal cron and monitoring systems rely on.

Repository contents
File / folder	Purpose
backup.sh	The backup script itself
backups/	Sample output — archives produced by running the script
index.html	The full write-up: overview, the production permission model, script walkthrough, architecture, security considerations, and extension exercises
Schema.png	Architecture diagram of the backup flow
.gitignore	Excludes local/system files (secrets and sensitive dotfiles are never committed)
LICENSE	MIT

![ System Design ](Schema.png)

## Series

| # | Project | Status | Live Page | Skills |
|---|---------|--------|-----------|--------|
| 1 | [Automated Backup Script](index.html) | ✅ Complete | 🔗 **[View Live](https://elixirman.github.io/linux-cloud-project1-Automated-backup-/)** | `tar`, `gzip`, variables, exit codes, permissions |
| 2 | Cron Job Automation | 🔜 Planned | — | Crontab syntax, scheduling, background execution logs |
| 3 | Log Monitoring and Parsing Tool | 🔜 Planned | — | `grep`, `awk`, `sed`, text filtering |
| 4 | Nginx Web Server Hardening | 🔜 Planned | — | `ufw`, SSH hardening, package management |
| 5 | Custom Systemd Service | 🔜 Planned | — | `.service` files, `journalctl`, process management |

Data flows from the privileged source directory (owned by root), through the script running as an unprivileged user, into a timestamped archive it owns outright. The two terminal states — validation/tar failure vs. a verified archive — map directly to exit codes 1 and 0.

Running it
bash
chmod +x backup.sh
./backup.sh

Expected output on success:

Starting backup of '/var/www/html'...
SUCCESS: Backup created at '/home/<user>/backups/backup_<timestamp>.tar.gz'

Verify the archive without extracting it:

bash
tar -tzf backups/backup_*.tar.gz

## Approach

Every project in this series follows the same production-grade model rather than a simplified home-directory tutorial:

- **Privileged provisioning, unprivileged execution.** Source data (e.g. `/var/www/html`) is created and owned by `root`; the automation itself runs as an ordinary user with only the access it needs.
- **Failure-aware by default.** Scripts validate their inputs and exit with meaningful, nonzero codes on failure — the same signal that cron, monitoring systems, and CI/CD pipelines rely on.
- **Security is treated as a first-class concern**, not an afterthought — including calling out anti-patterns (like plaintext credentials) encountered along the way.

## Viewing the projects

Each project is a single, self-contained HTML file under `projects/`. Open it directly in a browser, or serve the folder locally:

```bash
cd projects/01-automated-backup-script
python3 -m http.server 8000
# then visit http://localhost:8000
```

## Hosting with GitHub Pages

1. Push the repo to GitHub (see below).
2. In the repo, go to **Settings → Pages**.
3. Under **Build and deployment → Source**, choose **Deploy from a branch**.
4. Set **Branch** to `main` and folder to `/ (root)`, then **Save**.
5. GitHub will publish the whole repo at `https://<username>.github.io/<repo-name>/`. Each project page is then reachable at `https://<username>.github.io/<repo-name>/projects/01-automated-backup-script/`.
6. Update the placeholder link in the table above once the page is live (can take a minute or two after the first push).

## License

MIT — see [LICENSE](LICENSE).
