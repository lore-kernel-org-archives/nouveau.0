From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 94374] transparent window with DRI_PRIME=1,
 depending on size of used textures
Date: Sun, 31 Jul 2016 14:01:31 +0000
Message-ID: <bug-94374-8800-9GFBfl3pcQ@http.bugs.freedesktop.org/>
References: <bug-94374-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1840913805=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-94374-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1840913805==
Content-Type: multipart/alternative; boundary="14699736900.2C36.8502";
 charset="UTF-8"


--14699736900.2C36.8502
Date: Sun, 31 Jul 2016 14:01:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D94374

peter.fiss-Mmb7MZpHnFY@public.gmane.org changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |WORKSFORME

--- Comment #10 from peter.fiss-Mmb7MZpHnFY@public.gmane.org ---
This bug appears to be fixed. I know it was still present about a week ago =
with
Mesa 12.0.1, but today xf86-video-intel got upgraded (from
1:2.99.917+676+g26f8ab5-1 to 1:2.99.917+684+g6988b87-3, whatever these stra=
nge
version numbers are). Now I can no longer reproduce the issue. Since the
upgrade, the driver uses DRI3 by default. But even when I switch back to DR=
I2
manually, this is no longer an issue.

I'm closing this issue now, until it happens again.

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--14699736900.2C36.8502
Date: Sun, 31 Jul 2016 14:01:30 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:peter.fis=
s&#64;gmx.de" title=3D"peter.fiss&#64;gmx.de">peter.fiss&#64;gmx.de</a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED WORKSFORME - transparent window with DRI_PRIME=3D1, de=
pending on size of used textures"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D94374">bug 94374<=
/a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Status</td>
           <td>NEW
           </td>
           <td>RESOLVED
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Resolution</td>
           <td>---
           </td>
           <td>WORKSFORME
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED WORKSFORME - transparent window with DRI_PRIME=3D1, de=
pending on size of used textures"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D94374#c10">Commen=
t # 10</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED WORKSFORME - transparent window with DRI_PRIME=3D1, de=
pending on size of used textures"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D94374">bug 94374<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
peter.fiss&#64;gmx.de" title=3D"peter.fiss&#64;gmx.de">peter.fiss&#64;gmx.d=
e</a>
</span></b>
        <pre>This bug appears to be fixed. I know it was still present abou=
t a week ago with
Mesa 12.0.1, but today xf86-video-intel got upgraded (from
1:2.99.917+676+g26f8ab5-1 to 1:2.99.917+684+g6988b87-3, whatever these stra=
nge
version numbers are). Now I can no longer reproduce the issue. Since the
upgrade, the driver uses DRI3 by default. But even when I switch back to DR=
I2
manually, this is no longer an issue.

I'm closing this issue now, until it happens again.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
          <li>You are the QA Contact for the bug.</li>
      </ul>
    </body>
</html>=

--14699736900.2C36.8502--

--===============1840913805==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1840913805==--
