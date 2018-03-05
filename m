From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 105174] [GF108][Regression] Unable to handle NULL
 pointer dereference in nouveau_mem_host since kernel 4.15.3
Date: Mon, 05 Mar 2018 12:34:44 +0000
Message-ID: <bug-105174-8800-x2wX99Cg2m@http.bugs.freedesktop.org/>
References: <bug-105174-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1428975931=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-105174-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1428975931==
Content-Type: multipart/alternative; boundary="15202532840.8e13c.1525"
Content-Transfer-Encoding: 7bit


--15202532840.8e13c.1525
Date: Mon, 5 Mar 2018 12:34:44 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D105174

--- Comment #10 from Philip Raets <philip.raets-CNXmb7IdZIWZIoH1IeqzKA@public.gmane.org> ---
Created attachment 137793
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D137793&action=3Dedit
Bootlog patched kernel 4.15.7

Hi,

I've tried a patched kernel provided by Takashi Iwai on openSUSE (see
http://bugzilla.opensuse.org/show_bug.cgi?id=3D1082308 )

But then my system would crash at startup

Included my bootlog with that kernel.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15202532840.8e13c.1525
Date: Mon, 5 Mar 2018 12:34:44 +0000
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
   title=3D"NEW - [GF108][Regression] Unable to handle NULL pointer derefer=
ence in nouveau_mem_host since kernel 4.15.3"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105174#c10">Comme=
nt # 10</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [GF108][Regression] Unable to handle NULL pointer derefer=
ence in nouveau_mem_host since kernel 4.15.3"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105174">bug 10517=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
philip.raets&#64;telenet.be" title=3D"Philip Raets &lt;philip.raets&#64;tel=
enet.be&gt;"> <span class=3D"fn">Philip Raets</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D137793=
" name=3D"attach_137793" title=3D"Bootlog patched kernel 4.15.7">attachment=
 137793</a> <a href=3D"attachment.cgi?id=3D137793&amp;action=3Dedit" title=
=3D"Bootlog patched kernel 4.15.7">[details]</a></span>
Bootlog patched kernel 4.15.7

Hi,

I've tried a patched kernel provided by Takashi Iwai on openSUSE (see
<a href=3D"http://bugzilla.opensuse.org/show_bug.cgi?id=3D1082308">http://b=
ugzilla.opensuse.org/show_bug.cgi?id=3D1082308</a> )

But then my system would crash at startup

Included my bootlog with that kernel.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15202532840.8e13c.1525--

--===============1428975931==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1428975931==--
