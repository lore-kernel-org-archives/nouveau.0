From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 97620] [REGRESSION,
 bisected] KMS can't initialize GeForce GTX 460 after commit
 a6a0f67ca7aae2e6bec7ebf55d1e4853dc220816
Date: Sun, 06 Nov 2016 14:06:37 +0000
Message-ID: <bug-97620-8800-7i03SBldJy@http.bugs.freedesktop.org/>
References: <bug-97620-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1839889490=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-97620-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1839889490==
Content-Type: multipart/alternative; boundary="14784411974.0f399b.815";
 charset="UTF-8"


--14784411974.0f399b.815
Date: Sun, 6 Nov 2016 14:06:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D97620

--- Comment #29 from roucaries.bastien+bugs-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
Some symptoms with a GFX970.

Something strange is without signed firmware I can get something work but in
lower resolution with kernel > 4.5=20

With signed firmware it crash during kms and black screen. no reboot except
with button

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14784411974.0f399b.815
Date: Sun, 6 Nov 2016 14:06:37 +0000
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
   title=3D"NEW - [REGRESSION, bisected] KMS can't initialize GeForce GTX 4=
60 after commit a6a0f67ca7aae2e6bec7ebf55d1e4853dc220816"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D97620#c29">Commen=
t # 29</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [REGRESSION, bisected] KMS can't initialize GeForce GTX 4=
60 after commit a6a0f67ca7aae2e6bec7ebf55d1e4853dc220816"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D97620">bug 97620<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
roucaries.bastien+bugs&#64;gmail.com" title=3D"roucaries.bastien+bugs&#64;g=
mail.com">roucaries.bastien+bugs&#64;gmail.com</a>
</span></b>
        <pre>Some symptoms with a GFX970.

Something strange is without signed firmware I can get something work but in
lower resolution with kernel &gt; 4.5=20

With signed firmware it crash during kms and black screen. no reboot except
with button</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14784411974.0f399b.815--

--===============1839889490==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1839889490==--
