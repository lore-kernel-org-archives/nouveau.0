From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 101184] [NVE6] [bisected] Panic on boot with GK106
Date: Thu, 15 Jun 2017 07:35:08 +0000
Message-ID: <bug-101184-8800-9ImUXa57s4@http.bugs.freedesktop.org/>
References: <bug-101184-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0959331507=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-101184-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0959331507==
Content-Type: multipart/alternative; boundary="14975121081.4E8B245.1836";
 charset="UTF-8"


--14975121081.4E8B245.1836
Date: Thu, 15 Jun 2017 07:35:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D101184

S. Gilles <sgilles-8yXg+M/94Z32fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #13 from S. Gilles <sgilles-8yXg+M/94Z32fBVCVOL8/A@public.gmane.org> ---
It appears the fix has been merged into mainline as
b4e382ca7586a63b6c1e5221ce0863ff867c2df6 "drm/nouveau/tmr: fully separate a=
larm
execution/pending lists". I can also confirm that unpatched -mainline now b=
oots
- thank you for the fix!

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14975121081.4E8B245.1836
Date: Thu, 15 Jun 2017 07:35:08 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:sgilles&#=
64;math.umd.edu" title=3D"S. Gilles &lt;sgilles&#64;math.umd.edu&gt;"> <spa=
n class=3D"fn">S. Gilles</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - [NVE6] [bisected] Panic on boot with GK106"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101184">bug 10118=
4</a>
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
           <td>FIXED
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - [NVE6] [bisected] Panic on boot with GK106"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101184#c13">Comme=
nt # 13</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - [NVE6] [bisected] Panic on boot with GK106"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101184">bug 10118=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
sgilles&#64;math.umd.edu" title=3D"S. Gilles &lt;sgilles&#64;math.umd.edu&g=
t;"> <span class=3D"fn">S. Gilles</span></a>
</span></b>
        <pre>It appears the fix has been merged into mainline as
b4e382ca7586a63b6c1e5221ce0863ff867c2df6 &quot;drm/nouveau/tmr: fully separ=
ate alarm
execution/pending lists&quot;. I can also confirm that unpatched -mainline =
now boots
- thank you for the fix!</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14975121081.4E8B245.1836--

--===============0959331507==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0959331507==--
