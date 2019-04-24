From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 110500] X-Server crashes - GL error:
 GL_OUT_OF_MEMORY in glTexSubImage
Date: Wed, 24 Apr 2019 10:38:27 +0000
Message-ID: <bug-110500-8800-cJsbdOY0Cp@http.bugs.freedesktop.org/>
References: <bug-110500-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1281565025=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-110500-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1281565025==
Content-Type: multipart/alternative; boundary="15561023070.DDb7Bf1B1.21747"
Content-Transfer-Encoding: 7bit


--15561023070.DDb7Bf1B1.21747
Date: Wed, 24 Apr 2019 10:38:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110500

--- Comment #7 from wixbisce-jFQLhMmostjmZLV5cmOKUwC/G2K4zDHf@public.gmane.org <wixbisce-jFQLhMmostjmZLV5cmOKUwC/G2K4zDHf@public.gmane.org>=
 ---
I talked with a developer. I get told, that when a driver provide a
functionality, that functionality should be working. They should be able to
rely on a normal, expected functionality.

For the note: Karol told me he would take a look into the memory issue beca=
use
he know that this is a driver issue


In the meantime i had the issue that suddenly the picture start flickering.=
 It
then flicker whole time. The OS was unusable. The computer had to be restar=
ted
to stop this flickering.
I looked around in the internet and this seems to be also a driver issue.=20
This issue is also now the second time there. It appear when i start scroll=
ing
up and down the https://bugzilla.freedesktop.org website with the Mozilla
Firefox browser. Should i open a second bugreport for this issue or is it
related? I cant find anything in dmesg or any other logfiles. The os is
flickering when opening windows, scrolling in the webbrowser, or any other
movement.

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--15561023070.DDb7Bf1B1.21747
Date: Wed, 24 Apr 2019 10:38:27 +0000
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
   title=3D"NEW - X-Server crashes - GL error: GL_OUT_OF_MEMORY in glTexSub=
Image"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110500#c7">Commen=
t # 7</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - X-Server crashes - GL error: GL_OUT_OF_MEMORY in glTexSub=
Image"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110500">bug 11050=
0</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
wixbisce&#64;guerrillamail.com" title=3D"wixbisce&#64;guerrillamail.com &lt=
;wixbisce&#64;guerrillamail.com&gt;"> <span class=3D"fn">wixbisce&#64;guerr=
illamail.com</span></a>
</span></b>
        <pre>I talked with a developer. I get told, that when a driver prov=
ide a
functionality, that functionality should be working. They should be able to
rely on a normal, expected functionality.

For the note: Karol told me he would take a look into the memory issue beca=
use
he know that this is a driver issue


In the meantime i had the issue that suddenly the picture start flickering.=
 It
then flicker whole time. The OS was unusable. The computer had to be restar=
ted
to stop this flickering.
I looked around in the internet and this seems to be also a driver issue.=20
This issue is also now the second time there. It appear when i start scroll=
ing
up and down the <a href=3D"https://bugzilla.freedesktop.org">https://bugzil=
la.freedesktop.org</a> website with the Mozilla
Firefox browser. Should i open a second bugreport for this issue or is it
related? I cant find anything in dmesg or any other logfiles. The os is
flickering when opening windows, scrolling in the webbrowser, or any other
movement.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15561023070.DDb7Bf1B1.21747--

--===============1281565025==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1281565025==--
