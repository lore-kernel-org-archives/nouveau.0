From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 99354] [G71] "Assertion `bkref' failed" reproducible
 with glmark2
Date: Wed, 11 Jan 2017 14:35:33 +0000
Message-ID: <bug-99354-8800-qCHmlwsjxS@http.bugs.freedesktop.org/>
References: <bug-99354-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0929965055=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-99354-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0929965055==
Content-Type: multipart/alternative; boundary="14841453330.Df10E.29699";
 charset="UTF-8"


--14841453330.Df10E.29699
Date: Wed, 11 Jan 2017 14:35:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D99354

Michele Ballabio <barra_cuda-KK0ffGbhmjU@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|NEW                         |RESOLVED

--- Comment #7 from Michele Ballabio <barra_cuda-KK0ffGbhmjU@public.gmane.org> ---
I've applied your patch on top of mesa 13.0.3 (there was a conflict in
nvc0_query_hw.c, but it doesn't matter with my hardware).

I've been running
gdb --args ./glmark2 -b
buffer:columns=3D200:interleave=3Dfalse:update-dispersion=3D0.99:update-fra=
ction=3D0.5:update-method=3Dsubdata:buffer-usage=3Dstatic
--run-forever
for 30 minutes now, so I guess this issue is fixed.

Thank you, Ilia.

Changing status to resolved-fixed.

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--14841453330.Df10E.29699
Date: Wed, 11 Jan 2017 14:35:33 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:barra_cud=
a&#64;gmx.com" title=3D"Michele Ballabio &lt;barra_cuda&#64;gmx.com&gt;"> <=
span class=3D"fn">Michele Ballabio</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - [G71] &quot;Assertion `bkref' failed&quot; rep=
roducible with glmark2"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99354">bug 99354<=
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
           <td>FIXED
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
   title=3D"RESOLVED FIXED - [G71] &quot;Assertion `bkref' failed&quot; rep=
roducible with glmark2"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99354#c7">Comment=
 # 7</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - [G71] &quot;Assertion `bkref' failed&quot; rep=
roducible with glmark2"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99354">bug 99354<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
barra_cuda&#64;gmx.com" title=3D"Michele Ballabio &lt;barra_cuda&#64;gmx.co=
m&gt;"> <span class=3D"fn">Michele Ballabio</span></a>
</span></b>
        <pre>I've applied your patch on top of mesa 13.0.3 (there was a con=
flict in
nvc0_query_hw.c, but it doesn't matter with my hardware).

I've been running
gdb --args ./glmark2 -b
buffer:columns=3D200:interleave=3Dfalse:update-dispersion=3D0.99:update-fra=
ction=3D0.5:update-method=3Dsubdata:buffer-usage=3Dstatic
--run-forever
for 30 minutes now, so I guess this issue is fixed.

Thank you, Ilia.

Changing status to resolved-fixed.</pre>
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

--14841453330.Df10E.29699--

--===============0929965055==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0929965055==--
