From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 88272] [NVAC] Flickering screen on 1920x1080 monitor
 with 9400M in MacbookPro 5, 5
Date: Thu, 21 Dec 2017 20:13:01 +0000
Message-ID: <bug-88272-8800-KGKnOy36xK@http.bugs.freedesktop.org/>
References: <bug-88272-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1156473957=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-88272-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1156473957==
Content-Type: multipart/alternative; boundary="15138871812.18066c8.6392";
 charset="UTF-8"


--15138871812.18066c8.6392
Date: Thu, 21 Dec 2017 20:13:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D88272

--- Comment #9 from mbazzinotti-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
Created attachment 136349
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D136349&action=3Dedit
nvidia raw mmiotrace (no demmio output)

here is the raw mmiotrace of the previously uploaded demmio output. See
previous comment for further details pertaining to how to read and search t=
his
file's trace points.

This file is slightly bigger because it includes the other iomap accesses t=
hat
demmio truncated. I left these included as I am unsure whether they will be
needed.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15138871812.18066c8.6392
Date: Thu, 21 Dec 2017 20:13:01 +0000
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
          bz_status_ASSIGNED "
   title=3D"ASSIGNED - [NVAC] Flickering screen on 1920x1080 monitor with 9=
400M in MacbookPro 5,5"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D88272#c9">Comment=
 # 9</a>
              on <a class=3D"bz_bug_link=20
          bz_status_ASSIGNED "
   title=3D"ASSIGNED - [NVAC] Flickering screen on 1920x1080 monitor with 9=
400M in MacbookPro 5,5"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D88272">bug 88272<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
mbazzinotti&#64;gmail.com" title=3D"mbazzinotti&#64;gmail.com">mbazzinotti&=
#64;gmail.com</a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D136349=
" name=3D"attach_136349" title=3D"nvidia raw mmiotrace (no demmio output)">=
attachment 136349</a> <a href=3D"attachment.cgi?id=3D136349&amp;action=3Ded=
it" title=3D"nvidia raw mmiotrace (no demmio output)">[details]</a></span>
nvidia raw mmiotrace (no demmio output)

here is the raw mmiotrace of the previously uploaded demmio output. See
previous comment for further details pertaining to how to read and search t=
his
file's trace points.

This file is slightly bigger because it includes the other iomap accesses t=
hat
demmio truncated. I left these included as I am unsure whether they will be
needed.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15138871812.18066c8.6392--

--===============1156473957==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1156473957==--
