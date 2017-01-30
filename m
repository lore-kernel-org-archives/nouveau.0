From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 99147] xorg hangs at initial startup on linux-4.9.0
Date: Mon, 30 Jan 2017 14:17:35 +0000
Message-ID: <bug-99147-8800-ZXo82n2LGs@http.bugs.freedesktop.org/>
References: <bug-99147-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0166808366=="
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


--===============0166808366==
Content-Type: multipart/alternative; boundary="14857858550.378EeDD1A.16634";
 charset="UTF-8"


--14857858550.378EeDD1A.16634
Date: Mon, 30 Jan 2017 14:17:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D99147

Peter Wu <peter-VTkQYDcBqhK7DlmcbJSQ7g@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |DUPLICATE
                 CC|                            |peter-VTkQYDcBqhK7DlmcbJSQ7g@public.gmane.org
             Status|NEW                         |RESOLVED

--- Comment #11 from Peter Wu <peter-VTkQYDcBqhK7DlmcbJSQ7g@public.gmane.org> ---
Seems related indeed, marking as dup.

*** This bug has been marked as a duplicate of bug 98690 ***

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14857858550.378EeDD1A.16634
Date: Mon, 30 Jan 2017 14:17:35 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:peter&#64=
;lekensteyn.nl" title=3D"Peter Wu &lt;peter&#64;lekensteyn.nl&gt;"> <span c=
lass=3D"fn">Peter Wu</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED DUPLICATE - xorg hangs at initial startup on linux-4.9=
.0"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99147">bug 99147<=
/a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Resolution</td>
           <td>---
           </td>
           <td>DUPLICATE
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">CC</td>
           <td>
               &nbsp;
           </td>
           <td>peter&#64;lekensteyn.nl
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Status</td>
           <td>NEW
           </td>
           <td>RESOLVED
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED DUPLICATE - xorg hangs at initial startup on linux-4.9=
.0"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99147#c11">Commen=
t # 11</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED DUPLICATE - xorg hangs at initial startup on linux-4.9=
.0"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99147">bug 99147<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
peter&#64;lekensteyn.nl" title=3D"Peter Wu &lt;peter&#64;lekensteyn.nl&gt;"=
> <span class=3D"fn">Peter Wu</span></a>
</span></b>
        <pre>Seems related indeed, marking as dup.

*** This bug has been marked as a duplicate of <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [SKL bisected] System freeze when starting X using kernel=
 4.9-rc1 or later"
   href=3D"show_bug.cgi?id=3D98690">bug 98690</a> ***</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14857858550.378EeDD1A.16634--

--===============0166808366==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0166808366==--
