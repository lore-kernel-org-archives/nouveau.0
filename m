From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 99147] xorg hangs at initial startup on linux-4.9.0
Date: Mon, 19 Dec 2016 22:33:00 +0000
Message-ID: <bug-99147-8800-zA0wcrA2U9@http.bugs.freedesktop.org/>
References: <bug-99147-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1402776270=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-99147-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1402776270==
Content-Type: multipart/alternative; boundary="14821867790.2F8eC6d0f.10800";
 charset="UTF-8"


--14821867790.2F8eC6d0f.10800
Date: Mon, 19 Dec 2016 22:32:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D99147

--- Comment #7 from Gleb <gleb-97jfqw80gc5Wk0Htik3J/w@public.gmane.org> ---
lspci doesn't hang when I invoke it from console. I also tried startx and
startxfce4 from console and it worked, so it probably some other thing?


I can confirm that the issue occured on 4.9.0 and did not occur on 4.8.14 on
the same userspace stuff. I only started upgrading it after multiple
unseccessfull reboots into 4.9.0. So I had stable stuff, tested 4.8.14 (no
problem) and 4.9.0 (problem persist). Then upgraded stuff, tested on 4.8.14=
 (no
problem) and 4.9.0 (problem persist).


I also recompiled 4.9.0 at some point before testing lspci (but not
specifically for that, I will try to revert the changes) so that it includes
nouveau into kernel and not as a module, though it still have the same issu=
e.
Does it matter in what form nouveau is presented?


I want to clarify that the only process that hangs is Xorg (and probably
another which I noticed right now -- libvirtd, it also has red D symbol). T=
he
system continue to work, I have access to console and can run stuff from th=
ere.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14821867790.2F8eC6d0f.10800
Date: Mon, 19 Dec 2016 22:32:59 +0000
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
   title=3D"NEW - xorg hangs at initial startup on linux-4.9.0"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99147#c7">Comment=
 # 7</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - xorg hangs at initial startup on linux-4.9.0"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99147">bug 99147<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
gleb&#64;fastmail.com" title=3D"Gleb &lt;gleb&#64;fastmail.com&gt;"> <span =
class=3D"fn">Gleb</span></a>
</span></b>
        <pre>lspci doesn't hang when I invoke it from console. I also tried=
 startx and
startxfce4 from console and it worked, so it probably some other thing?


I can confirm that the issue occured on 4.9.0 and did not occur on 4.8.14 on
the same userspace stuff. I only started upgrading it after multiple
unseccessfull reboots into 4.9.0. So I had stable stuff, tested 4.8.14 (no
problem) and 4.9.0 (problem persist). Then upgraded stuff, tested on 4.8.14=
 (no
problem) and 4.9.0 (problem persist).


I also recompiled 4.9.0 at some point before testing lspci (but not
specifically for that, I will try to revert the changes) so that it includes
nouveau into kernel and not as a module, though it still have the same issu=
e.
Does it matter in what form nouveau is presented?


I want to clarify that the only process that hangs is Xorg (and probably
another which I noticed right now -- libvirtd, it also has red D symbol). T=
he
system continue to work, I have access to console and can run stuff from th=
ere.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14821867790.2F8eC6d0f.10800--

--===============1402776270==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1402776270==--
