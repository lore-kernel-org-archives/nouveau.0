From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 98386] [NVE7] bus: MMIO write of FAULT at [ IBUS ],
 Pointer to {TDMS, flat panel} table invalid
Date: Tue, 01 May 2018 20:16:51 +0000
Message-ID: <bug-98386-8800-XLcqBx4KZk@http.bugs.freedesktop.org/>
References: <bug-98386-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1192192672=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-98386-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1192192672==
Content-Type: multipart/alternative; boundary="15252058101.e9878f1fE.14375"
Content-Transfer-Encoding: 7bit


--15252058101.e9878f1fE.14375
Date: Tue, 1 May 2018 20:16:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D98386

baybay <lujofu-tJ6BQdzZN76ZuzBka8ofvg@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|RESOLVED                    |REOPENED
         Resolution|FIXED                       |---

--- Comment #21 from baybay <lujofu-tJ6BQdzZN76ZuzBka8ofvg@public.gmane.org> ---
Nevermind, i spoke a bit too fast...
I had nouveau.runpm=3D0 set and that indeed fixed this MMIO write FAULT iss=
ue.
Also, i had it set before (on older kernels) and it used to do nothing.
But that's now working.

Without nouveau.runpm=3D0, i still get this issue.

The lockups i had were not related to that issue and it was due to the fact
that i enabled NvBoost.
When NvBoost is enabled, i get the lockups. (either it set to 1 or 2 will
freeze the Xorg)

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15252058101.e9878f1fE.14375
Date: Tue, 1 May 2018 20:16:50 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:lujofu&#6=
4;eth2btc.info" title=3D"baybay &lt;lujofu&#64;eth2btc.info&gt;"> <span cla=
ss=3D"fn">baybay</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - [NVE7] bus: MMIO write of FAULT at [ IBUS ], Pointer=
 to {TDMS,flat panel} table invalid"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98386">bug 98386<=
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
           <td>RESOLVED
           </td>
           <td>REOPENED
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Resolution</td>
           <td>FIXED
           </td>
           <td>---
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - [NVE7] bus: MMIO write of FAULT at [ IBUS ], Pointer=
 to {TDMS,flat panel} table invalid"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98386#c21">Commen=
t # 21</a>
              on <a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - [NVE7] bus: MMIO write of FAULT at [ IBUS ], Pointer=
 to {TDMS,flat panel} table invalid"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98386">bug 98386<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
lujofu&#64;eth2btc.info" title=3D"baybay &lt;lujofu&#64;eth2btc.info&gt;"> =
<span class=3D"fn">baybay</span></a>
</span></b>
        <pre>Nevermind, i spoke a bit too fast...
I had nouveau.runpm=3D0 set and that indeed fixed this MMIO write FAULT iss=
ue.
Also, i had it set before (on older kernels) and it used to do nothing.
But that's now working.

Without nouveau.runpm=3D0, i still get this issue.

The lockups i had were not related to that issue and it was due to the fact
that i enabled NvBoost.
When NvBoost is enabled, i get the lockups. (either it set to 1 or 2 will
freeze the Xorg)</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15252058101.e9878f1fE.14375--

--===============1192192672==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1192192672==--
