from flask import Flask, render_template, request, session, redirect , flash
from flask_sqlalchemy import SQLAlchemy
from werkzeug.utils import secure_filename
import os, math
from flask_mail import Mail
from datetime import datetime
import json

with open('config.json','r') as c:
    params = json.load(c)["params"]

local_server = True
app = Flask(__name__)
app.config['upload_config'] = params['upload_file_path']
app.secret_key = 'the_random_string'
app.config.update(
    MAIL_SERVER = 'smtp.gmail.com',
    MAIL_PORT = '465',
    MAIL_USE_SSL = True,
    MAIL_USERNAME = params['gmail_username'],
    MAIL_PASSWORD = params['gmail_password']
)

mail = Mail(app)
if(local_server):
    app.config['SQLALCHEMY_DATABASE_URI'] = params['local_uri']
else:
    app.config['SQLALCHEMY_DATABASE_URI'] = params['prod_uri']

db = SQLAlchemy(app)


class contacts(db.Model):
   id = db.Column(db.Integer, primary_key=True)
   name = db.Column(db.String(80), nullable=False)
   phone_num = db.Column(db.String(12), nullable=False)
   msg = db.Column(db.String(120), nullable=False)
   date = db.Column(db.String(12), nullable=True)
   email = db.Column(db.String(20), nullable=False)


class Posts(db.Model):
   id = db.Column(db.Integer, primary_key=True)
   title = db.Column(db.String(80), nullable=False)
   tagline = db.Column(db.String(80), nullable=False)
   slug = db.Column(db.String(120), nullable=False)
   content = db.Column(db.String(120), nullable=False)
   img_file = db.Column(db.String(120), nullable=False)
   date = db.Column(db.String(12), nullable=True)


@app.route('/')
def index():
    post = Posts.query.filter_by().all()
    last = math.ceil(len(post)/int(params['no_of_post']))
    page = request.args.get('page')
    if(not str(page).isnumeric()):
        page = 1
    page = int(page)
    post = post[(page-1)*int(params['no_of_post']) : (page-1)*int(params['no_of_post'])+int(params['no_of_post'])]
    if(page==1):
        prev = "#"
        next = "/?page="+str(page+1)
    elif(page==last):
        prev = "/?page="+str(page-1)
        next = "#"
    else:
        prev = "/?page="+str(page-1)
        next = "/?page="+str(page+1)

    return render_template('index.html', params=params, post=post, prev=prev, next=next)

@app.route('/about')
def about():
   return render_template('about.html', params=params)

@app.route('/uploader', methods=['GET', 'POST'])
def uploader():

    if ('user' in session and session['user'] == params['user_email']):
        if request.method == 'POST':
            f = request.files['filename']
            f.save(os.path.join(app.config['upload_config'], secure_filename(f.filename) ))
            return "uploaded successfully"


@app.route('/dashboard', methods=['GET', 'POST'])
def dashboard():
    if ('user' in session and session['user'] == params['user_email']):
        post = Posts.query.all()
        return render_template('dashboard.html', params=params, post=post)

    if request.method == 'POST':
        email = request.form.get('email')
        password = request.form.get('password')
        if (email == params['user_email'] and password == params['user_password']):
            session['user'] = email
            post = Posts.query.all()
            return render_template('dashboard.html', params=params, post=post)

    else:
        return render_template('login.html', params=params)

@app.route('/edit/<string:id>', methods=['GET', 'POST'])
def edit(id):
    if ('user' in session and session['user'] == params['user_email']):
        if request.method == 'POST':
            title = request.form.get('title')
            slug = request.form.get('slug')
            tagline = request.form.get('tagline')
            content = request.form.get('content')
            img_file = request.form.get('img_file')
            date = datetime.now()

            if id == '0':
                entry = Posts(title=title, slug=slug, tagline=tagline, date=date, content=content, img_file=img_file)
                db.session.add(entry)
                db.session.commit()
            else:
                post = Posts.query.filter_by(id=id).first()
                post.title = title
                post.slug = slug
                post.tagline = tagline
                post.content = content
                post.img_file = img_file
                post.date = date
                db.session.commit()
                return redirect('/edit/'+id)
    post = Posts.query.filter_by(id=id).first()
    return render_template('edit.html', params=params, post=post, id=id)

@app.route('/delete/<string:id>', methods=['GET', 'POST'])
def delete(id):
    if ('user' in session and session['user'] == params['user_email']):
        post = Posts.query.filter_by(id=id).first()
        db.session.delete(post)
        db.session.commit()
    return redirect('/dashboard')


@app.route('/post/<string:post_slug>', methods=['GET'])
def post_route(post_slug):
    post = Posts.query.filter_by(slug=post_slug).first()
    return render_template('post.html', params=params,post=post)

@app.route("/contact", methods = ['GET', 'POST'])
def contact():
    if(request.method=='POST'):
        name = request.form.get('name')
        email = request.form.get('email')
        phone = request.form.get('phone')
        message = request.form.get('message')
        entry = contacts(name=name, phone_num = phone, msg = message, date= datetime.now(),email = email )
        db.session.add(entry)
        db.session.commit()
        # mail.send_message('New message from' + name,
        #                   sender = email,
        #                   recipients = [params['gmail_username']],
        #                   body = message + "\n" + phone
        #                   )
        flash("Thanks for contecting with us we get back to you soon","success")
    return render_template('contact.html', params=params)

app.run(debug=True)