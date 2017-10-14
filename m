From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 103132] GTX 1060 6GB corrupts screen drawing in
 Konsole and other apps
Date: Sat, 14 Oct 2017 09:37:06 +0000
Message-ID: <bug-103132-8800-G3s1zHOY2F@http.bugs.freedesktop.org/>
References: <bug-103132-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1943604945=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-103132-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1943604945==
Content-Type: multipart/alternative; boundary="15079738250.4EA4BE5e.7631";
 charset="UTF-8"


--15079738250.4EA4BE5e.7631
Date: Sat, 14 Oct 2017 09:37:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D103132

--- Comment #3 from barry-LJgwZTY9oXz8xeUnPfcrCQ@public.gmane.org ---
nouveau.noaccel=3D1 seems to fix the problem.

But your "modesetting" DDX comment made me dig into the Xorg config.
I was using the modesetting DDX and added the following config:

$ cat /etc/X11/xorg.conf.d/20-nouveau.conf=20
Section "Device"
    Identifier "Nvidia card"
    Driver "nouveau"
EndSection

That also seems to fix the problem.

I'm saying "seems" because I have not done a lot of testing.

I will update this bug once I have made sure this is "user error" (no nouve=
au
config).

Oh and mesa is at 17.2.2-2.fc26.x86_64.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15079738250.4EA4BE5e.7631
Date: Sat, 14 Oct 2017 09:37:05 +0000
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
   title=3D"NEW - GTX 1060 6GB corrupts screen drawing in Konsole and other=
 apps"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D103132#c3">Commen=
t # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - GTX 1060 6GB corrupts screen drawing in Konsole and other=
 apps"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D103132">bug 10313=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
barry&#64;barrys-emacs.org" title=3D"barry&#64;barrys-emacs.org">barry&#64;=
barrys-emacs.org</a>
</span></b>
        <pre>nouveau.noaccel=3D1 seems to fix the problem.

But your &quot;modesetting&quot; DDX comment made me dig into the Xorg conf=
ig.
I was using the modesetting DDX and added the following config:

$ cat /etc/X11/xorg.conf.d/20-nouveau.conf=20
Section &quot;Device&quot;
    Identifier &quot;Nvidia card&quot;
    Driver &quot;nouveau&quot;
EndSection

That also seems to fix the problem.

I'm saying &quot;seems&quot; because I have not done a lot of testing.

I will update this bug once I have made sure this is &quot;user error&quot;=
 (no nouveau
config).

Oh and mesa is at 17.2.2-2.fc26.x86_64.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15079738250.4EA4BE5e.7631--

--===============1943604945==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1943604945==--
