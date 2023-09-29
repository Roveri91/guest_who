
㊗️ Tokyo Glow
---

An app to find guests/services for your wedding

**OVERVIEW**

Our team has developed an app that allows you to rent people or services for your wedding. 
With our app, you can not only rent services but also offer your own services to others.

📱SCREENSHOT
---


![Screenshot 2023-09-26 154311](https://github.com/Roveri91/guest_who/assets/105217392/56871b5a-ba88-40d6-91bc-f2b033d01340)
![Screenshot 2023-09-26 154109](https://github.com/Roveri91/guest_who/assets/105217392/f84c2453-0bdb-4cdd-a07f-7627b1e99757)
![Screenshot 2023-09-26 154637](https://github.com/Roveri91/guest_who/assets/105217392/9dbe427e-7c24-4d1c-8f7e-caf75093df87)
![Screenshot 2023-09-26 154546](https://github.com/Roveri91/guest_who/assets/105217392/19928a7a-7006-4331-b849-cd904b1a212c)
![Screenshot 2023-09-26 154340](https://github.com/Roveri91/guest_who/assets/105217392/882dfd3e-15a9-4d94-b6e0-89799fda3718)

---

⚙️ Setup
---
Install gems

```
bundle install
```

**ENV Variables**
Create `.env` file

```
touch .env
```

Inside `.env`, set these variables. For any APIs, see group Slack channel.

```
CLOUDINARY_URL=your_own_cloudinary_url_key 
```

DB Setup

```
rails db:create
rails db:migrate
rails db:seed
  
```

Run a server

```
rails s
```


📕 Usage
---

App home: https://guest-who-9b7d8a334e6c.herokuapp.com/

User: simoneroveri@gmail.com
PW: 123456

🔨 Built With
---
+ [Rails 7](https://guides.rubyonrails.org/) - Backend / Front-end
+ [Stimulus JS](https://stimulus.hotwired.dev/) - Front-end JS
+ [Heroku](https://www.heroku.com/) - Deployment
+ [PostgreSQL](https://www.postgresql.org/) - Database
+ [Bootstrap](https://getbootstrap.com/) — Styling
+ [Figma](https://www.figma.com/ja/) — Prototyping


🗿 Team Members
---
* [Simone Roveri](https://www.linkedin.com/in/simone-roveri/),
* [Johnny Smith](https://www.linkedin.com/in/jonathan-smith-046007138/),
* [Giulia Menin](https://www.linkedin.com/in/giuliamenin/),
* [Tenny Ma](https://www.linkedin.com/in/tennyma/).


💅 Contributing
---
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

