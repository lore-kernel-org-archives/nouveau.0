From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 100760] Rapid flickering when an app is placed on
 the second Nouveau ZaphodHeads display
Date: Thu, 01 Jun 2017 13:15:07 +0000
Message-ID: <bug-100760-8800-hRfoWe6Cxb@http.bugs.freedesktop.org/>
References: <bug-100760-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1870498844=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-100760-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1870498844==
Content-Type: multipart/alternative; boundary="14963229062.4b4b434F.6041";
 charset="UTF-8"


--14963229062.4b4b434F.6041
Date: Thu, 1 Jun 2017 13:15:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D100760

--- Comment #6 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Unfortunately I don't have a second monitor here, but I'm fairly sure that =
your
assertions about multiple X screens not working in recent Xorg is false. Pe=
ople
complain about stuff like that pretty quickly. Unfortunately you chose not =
to
follow my instructions (never tested putting a regular application on :0.1,
only weird things like gnome-terminal which do who-knows-what in the name of
user friendliness), nor get any help with debugging the issue.

Either way, as you've lost interest in this, can I close the issue?

[The crashes with nouveau are, btw, most likely due to your environment usi=
ng
3D acceleration. Using such an environment is not recommended.]

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14963229062.4b4b434F.6041
Date: Thu, 1 Jun 2017 13:15:06 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Rapid flickering when an app is placed on the second Nouv=
eau ZaphodHeads display"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100760#c6">Commen=
t # 6</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Rapid flickering when an app is placed on the second Nouv=
eau ZaphodHeads display"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100760">bug 10076=
0</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Unfortunately I don't have a second monitor here, but I'm fair=
ly sure that your
assertions about multiple X screens not working in recent Xorg is false. Pe=
ople
complain about stuff like that pretty quickly. Unfortunately you chose not =
to
follow my instructions (never tested putting a regular application on :0.1,
only weird things like gnome-terminal which do who-knows-what in the name of
user friendliness), nor get any help with debugging the issue.

Either way, as you've lost interest in this, can I close the issue?

[The crashes with nouveau are, btw, most likely due to your environment usi=
ng
3D acceleration. Using such an environment is not recommended.]</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14963229062.4b4b434F.6041--

--===============1870498844==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1870498844==--
