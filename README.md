# AWS User Group Ljubljana

Ljubljana's community for AWS builders, architects, and cloud enthusiasts. We meet monthly to share real-world experience, learn from each other, and connect over all things AWS.

**[www.awsusergroup.net](https://www.awsusergroup.net)**

## Join Us

- [Meetup](https://www.meetup.com/aws-user-group-ljubljana) — RSVP for the next event
- [Slovenian Tech Slack](https://sloveniantech.slack.com/) — join the conversation
- [GitHub](https://github.com/alternativc/awsusergroup/) — talk slides and website source

## Speak at a Meetup

Got an AWS war story, a side project, or lessons learned? We'd love to hear it. Talks are 20-30 minutes, casual, and community-friendly. First-time speakers welcome. Reach out on Meetup or Slack.

## Sponsors

A huge thank you to the companies that make our community possible:

[Alef](https://www.alef.com) | [Bitstamp](https://www.bitstamp.net) | [Celtra](https://www.celtra.com) | [3fs](https://www.3fs.cloud/) | [MUK](https://muk.group) | [Mainstream](https://mainstream.eu/) | [Sportradar](https://www.sportradar.com)

Interested in sponsoring? Get in touch via Meetup.

## Contributing to the Website

The site is built with [Astro](https://astro.build/) + [Tailwind CSS](https://tailwindcss.com/) and hosted on GitHub Pages.

### Adding a new talk

**Quick way** — use the helper script:

```bash
./add-talk.sh "2026-03-27" "Jane Doe" "Scaling DynamoDB" ~/Downloads/scaling-dynamodb.pdf
```

That's it. It copies the PDF and updates `talks.json` for you. Then commit and push.

**Manual way:**

1. Drop the PDF into `public/meetups/YYYYMMDD/`
2. Add an entry to the **top** of `src/data/talks.json`:
   ```json
   {
     "date": "2026-03-27",
     "title": "Talk Title",
     "speaker": "Speaker Name",
     "url": "/meetups/20260327/filename.pdf"
   }
   ```
3. Commit, push, and merge to `master` — the site rebuilds automatically.

### Local development

```bash
docker compose up
```

Site will be available at `http://localhost:4321`.

### Project structure

```
src/
  data/talks.json      # Talk entries
  data/sponsors.json   # Sponsor entries
  pages/index.astro    # Main page
  layouts/Layout.astro # HTML shell
  styles/global.css    # Tailwind config + custom styles
public/
  meetups/             # Talk PDFs organized by date (YYYYMMDD)
  logos/               # Sponsor logo SVGs
  logo.svg             # Dragon logo
```

## License

Talk slides are the property of their respective authors. Website source is open for the community.
