From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 110280] Random slow down the system with Geforce
 GTX1070 Mobile
Date: Fri, 29 Mar 2019 13:53:04 +0000
Message-ID: <bug-110280-8800-JUjw2Vl0Dq@http.bugs.freedesktop.org/>
References: <bug-110280-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1071696503=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-110280-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1071696503==
Content-Type: multipart/alternative; boundary="15538675840.bF548.23864"
Content-Transfer-Encoding: 7bit


--15538675840.bF548.23864
Date: Fri, 29 Mar 2019 13:53:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110280

Tobias Klausmann <tobias.johannes.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |tobias.johannes.klausmann@m
                   |                            |ni.thm.de

--- Comment #1 from Tobias Klausmann <tobias.johannes.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org>=
 ---
Created attachment 143806
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D143806&action=3Dedit
kernel 5.1rc backtrace with linenumbers resolved

Yes the secureboot  falcon (sec2) times out for unknown reasons, note the
lines:

kernel: nouveau 0000:01:00.0: secboot: error during falcon reset: -110
kernel: nouveau 0000:01:00.0: gr: init failed, -110
...

When looking around, primarily the 10xx generation suffers from this.

This still happens with 5.1 and seems to get worse for unknown reasons.

Attached is a resolved backtrace for the sake of completeness

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15538675840.bF548.23864
Date: Fri, 29 Mar 2019 13:53:04 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:tobias.jo=
hannes.klausmann&#64;mni.thm.de" title=3D"Tobias Klausmann &lt;tobias.johan=
nes.klausmann&#64;mni.thm.de&gt;"> <span class=3D"fn">Tobias Klausmann</spa=
n></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Random slow down the system with Geforce GTX1070 Mobile"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110280">bug 11028=
0</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">CC</td>
           <td>
               &nbsp;
           </td>
           <td>tobias.johannes.klausmann&#64;mni.thm.de
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Random slow down the system with Geforce GTX1070 Mobile"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110280#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Random slow down the system with Geforce GTX1070 Mobile"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110280">bug 11028=
0</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
tobias.johannes.klausmann&#64;mni.thm.de" title=3D"Tobias Klausmann &lt;tob=
ias.johannes.klausmann&#64;mni.thm.de&gt;"> <span class=3D"fn">Tobias Klaus=
mann</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D143806=
" name=3D"attach_143806" title=3D"kernel 5.1rc backtrace with linenumbers r=
esolved">attachment 143806</a> <a href=3D"attachment.cgi?id=3D143806&amp;ac=
tion=3Dedit" title=3D"kernel 5.1rc backtrace with linenumbers resolved">[de=
tails]</a></span>
kernel 5.1rc backtrace with linenumbers resolved

Yes the secureboot  falcon (sec2) times out for unknown reasons, note the
lines:

kernel: nouveau 0000:01:00.0: secboot: error during falcon reset: -110
kernel: nouveau 0000:01:00.0: gr: init failed, -110
...

When looking around, primarily the 10xx generation suffers from this.

This still happens with 5.1 and seems to get worse for unknown reasons.

Attached is a resolved backtrace for the sake of completeness</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15538675840.bF548.23864--

--===============1071696503==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1071696503==--
