From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 110714] Xorg crashes randomly because of memory leak
Date: Mon, 22 Jul 2019 20:19:59 +0000
Message-ID: <bug-110714-8800-48zIzWWJfD@http.bugs.freedesktop.org/>
References: <bug-110714-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0297175735=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-110714-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0297175735==
Content-Type: multipart/alternative; boundary="15638267991.Ffa8AEdc5.28551"
Content-Transfer-Encoding: 7bit


--15638267991.Ffa8AEdc5.28551
Date: Mon, 22 Jul 2019 20:19:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110714

--- Comment #15 from Joel Polowin <jpolowin-rieW9WUcm8FFJ04o6PK0Fg@public.gmane.org> ---
FWIW, I'm seeing the same symptoms -- I found this report while searching f=
or
info about what was going on.  The only notable apps running, so far as I'm
aware, are VirtualBox and Firefox (along with various terminal and file
windows).
I use OpenOffice, but infrequently.  I definitely didn't have any documents
open at the time of the most recent crash.

I'm running 5.1.15-300.fc30.x86_64 .  I'm willing to send info if it will h=
elp,
but I must warn you that I'm anything but a power user -- I'd need some
coaching
to find files.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15638267991.Ffa8AEdc5.28551
Date: Mon, 22 Jul 2019 20:19:59 +0000
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
          bz_status_REOPENED "
   title=3D"REOPENED - Xorg crashes randomly because of memory leak"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110714#c15">Comme=
nt # 15</a>
              on <a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - Xorg crashes randomly because of memory leak"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110714">bug 11071=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
jpolowin&#64;sympatico.ca" title=3D"Joel Polowin &lt;jpolowin&#64;sympatico=
.ca&gt;"> <span class=3D"fn">Joel Polowin</span></a>
</span></b>
        <pre>FWIW, I'm seeing the same symptoms -- I found this report whil=
e searching for
info about what was going on.  The only notable apps running, so far as I'm
aware, are VirtualBox and Firefox (along with various terminal and file
windows).
I use OpenOffice, but infrequently.  I definitely didn't have any documents
open at the time of the most recent crash.

I'm running 5.1.15-300.fc30.x86_64 .  I'm willing to send info if it will h=
elp,
but I must warn you that I'm anything but a power user -- I'd need some
coaching
to find files.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15638267991.Ffa8AEdc5.28551--

--===============0297175735==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0297175735==--
