From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 107537] 4.14+ - Full screen OpenGL applications
 results in black screen
Date: Thu, 16 Aug 2018 17:20:09 +0000
Message-ID: <bug-107537-8800-RFR44CiTiD@http.bugs.freedesktop.org/>
References: <bug-107537-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0800461026=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-107537-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0800461026==
Content-Type: multipart/alternative; boundary="15344400100.3f63A222F.27839"
Content-Transfer-Encoding: 7bit


--15344400100.3f63A222F.27839
Date: Thu, 16 Aug 2018 17:20:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D107537

Erik Karlsson <pilo-dZJkCKxksfnYtjvyW6yDsg@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #141039|0                           |1
        is obsolete|                            |

--- Comment #2 from Erik Karlsson <pilo-dZJkCKxksfnYtjvyW6yDsg@public.gmane.org> ---
Created attachment 141143
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D141143&action=3Dedit
Log of commit 144a799 with drm.debug=3D30

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15344400100.3f63A222F.27839
Date: Thu, 16 Aug 2018 17:20:10 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:pilo&#64;=
ayeon.org" title=3D"Erik Karlsson &lt;pilo&#64;ayeon.org&gt;"> <span class=
=3D"fn">Erik Karlsson</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - 4.14+ - Full screen OpenGL applications results in black =
screen"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D107537">bug 10753=
7</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Attachment #141039 is obsolete</=
td>
           <td>
               &nbsp;
           </td>
           <td>1
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - 4.14+ - Full screen OpenGL applications results in black =
screen"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D107537#c2">Commen=
t # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - 4.14+ - Full screen OpenGL applications results in black =
screen"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D107537">bug 10753=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
pilo&#64;ayeon.org" title=3D"Erik Karlsson &lt;pilo&#64;ayeon.org&gt;"> <sp=
an class=3D"fn">Erik Karlsson</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D141143=
" name=3D"attach_141143" title=3D"Log of commit 144a799 with drm.debug=3D30=
">attachment 141143</a> <a href=3D"attachment.cgi?id=3D141143&amp;action=3D=
edit" title=3D"Log of commit 144a799 with drm.debug=3D30">[details]</a></sp=
an>
Log of commit 144a799 with drm.debug=3D30</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15344400100.3f63A222F.27839--

--===============0800461026==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0800461026==--
