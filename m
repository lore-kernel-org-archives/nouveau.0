From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 108022] Cannot resume from standby - Link training
 fails
Date: Sat, 22 Sep 2018 20:42:08 +0000
Message-ID: <bug-108022-8800-muYMMd7AR1@http.bugs.freedesktop.org/>
References: <bug-108022-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0093387153=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-108022-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0093387153==
Content-Type: multipart/alternative; boundary="15376489280.b8a9.23992"
Content-Transfer-Encoding: 7bit


--15376489280.b8a9.23992
Date: Sat, 22 Sep 2018 20:42:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D108022

--- Comment #3 from Barry G <barry-RiHDFbPRhGT6V6G2DxALlg@public.gmane.org> ---
Created attachment 141691
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D141691&action=3Dedit
dmesg with 4.19-rc4 plus

Upgraded to:
4.19.0-rc4-1-barrgr-00089-g6ad49fa1993d

Same general issue.  Got some new "gr:" lines.  Full dmesg attached.

A few things I have noticed:
* The unplug/replug monitor thing doesn't always fix it.  Sometimes they ju=
st
stay off.
* If I run "xset dpms force standby" and wait 5-10 seconds and move the mou=
se
it seems to always come back (5 tests).
* If I run "xset dpms force standby" and wait 40 seconds and move the mouse=
 it
seems to NOT come back (3 tests).

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15376489280.b8a9.23992
Date: Sat, 22 Sep 2018 20:42:08 +0000
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
   title=3D"NEW - Cannot resume from standby - Link training fails"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108022#c3">Commen=
t # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Cannot resume from standby - Link training fails"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108022">bug 10802=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
barry&#64;grussling.com" title=3D"Barry G &lt;barry&#64;grussling.com&gt;">=
 <span class=3D"fn">Barry G</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D141691=
" name=3D"attach_141691" title=3D"dmesg with 4.19-rc4 plus">attachment 1416=
91</a> <a href=3D"attachment.cgi?id=3D141691&amp;action=3Dedit" title=3D"dm=
esg with 4.19-rc4 plus">[details]</a></span>
dmesg with 4.19-rc4 plus

Upgraded to:
4.19.0-rc4-1-barrgr-00089-g6ad49fa1993d

Same general issue.  Got some new &quot;gr:&quot; lines.  Full dmesg attach=
ed.

A few things I have noticed:
* The unplug/replug monitor thing doesn't always fix it.  Sometimes they ju=
st
stay off.
* If I run &quot;xset dpms force standby&quot; and wait 5-10 seconds and mo=
ve the mouse
it seems to always come back (5 tests).
* If I run &quot;xset dpms force standby&quot; and wait 40 seconds and move=
 the mouse it
seems to NOT come back (3 tests).</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15376489280.b8a9.23992--

--===============0093387153==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0093387153==--
