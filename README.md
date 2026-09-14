# Simple Linux Projects for Cloud Engineers

A hands-on project series for building the Linux fundamentals that underpin real cloud engineering work: automation, scripting, security, and process management. Each project is written up as a self-contained reference page — not just a set of steps, but an explanation of *why* each piece is built the way it is, grounded in the permission model of real production systems (privileged provisioning, unprivileged execution, least privilege throughout).

## Series

| # | Project | Status | Live Page | Skills |
|---|---------|--------|-----------|--------|
| 1 | [Automated Backup Script](projects/01-automated-backup-script/index.html) | ✅ Complete | [View](https://Elixirman.github.io/linux-cloud-project1-Automated-backup-
/projects/01-automated-backup-script/) | `tar`, `gzip`, variables, exit codes, permissions |
| 2 | Cron Job Automation | 🔜 Planned | — | Crontab syntax, scheduling, background execution logs |
| 3 | Log Monitoring and Parsing Tool | 🔜 Planned | — | `grep`, `awk`, `sed`, text filtering |
| 4 | Nginx Web Server Hardening | 🔜 Planned | — | `ufw`, SSH hardening, package management |
| 5 | Custom Systemd Service | 🔜 Planned | — | `.service` files, `journalctl`, process management |

> Replace `YOUR_USERNAME` and `YOUR_REPO_NAME` above once GitHub Pages is enabled (see below) — the pattern is always `https://<username>.github.io/<repo-name>/<path-to-folder>/`.

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
