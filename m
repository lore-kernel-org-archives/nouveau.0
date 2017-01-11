From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 94727] [NV30/NV40] nouveau/pushbuf.c:238:
 pushbuf_krel: Assertion `bkref` failed.
Date: Wed, 11 Jan 2017 09:37:08 +0000
Message-ID: <bug-94727-8800-JnVfoIiCfo@http.bugs.freedesktop.org/>
References: <bug-94727-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0611925902=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-94727-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0611925902==
Content-Type: multipart/alternative; boundary="14841274280.085F.8376";
 charset="UTF-8"


--14841274280.085F.8376
Date: Wed, 11 Jan 2017 09:37:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D94727

--- Comment #14 from Olivier Fourdan <fourdan-eaOCjQ5FDoY@public.gmane.org> ---
(In reply to Ilia Mirkin from comment #13)
> Olivier, can you see if this patch with mesa helps?
>=20
> https://patchwork.freedesktop.org/patch/132414/
>=20
> It helped in the repro of bug #99354.

Sure! Thanks IIlia!

The patch did not apply cleanly on top of 13.0.3 nor master though (in
src/gallium/drivers/nouveau/nvc0/nvc0_query_hw.c line 406 [1]) so I changed
"nouveau_pushbuf_space(push, 16, 2, 0);" to "nouveau_pushbuf_space(push, 32=
, 3,
0);" to match the content of your patch, I hope this is right (sorry, I'm n=
ot
familiar with this code).

But the issue is quite random and rather hard to reproduce at will, so I'll=
 run
with this for some time see if the issue reoccurs.

I shall also prepare a test package for Fedora downstream with the (modifie=
d)
patch included so that the original reporter can give it a try as well.


[1]
https://cgit.freedesktop.org/mesa/mesa/tree/src/gallium/drivers/nouveau/nvc=
0/nvc0_query_hw.c#n406
[2] https://bugzilla.redhat.com/show_bug.cgi?id=3D1372878

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--14841274280.085F.8376
Date: Wed, 11 Jan 2017 09:37:08 +0000
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
   title=3D"NEW - [NV30/NV40] nouveau/pushbuf.c:238: pushbuf_krel: Assertio=
n `bkref` failed."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D94727#c14">Commen=
t # 14</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NV30/NV40] nouveau/pushbuf.c:238: pushbuf_krel: Assertio=
n `bkref` failed."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D94727">bug 94727<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
fourdan&#64;xfce.org" title=3D"Olivier Fourdan &lt;fourdan&#64;xfce.org&gt;=
"> <span class=3D"fn">Olivier Fourdan</span></a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href=3D"show_bug.cgi?id=3D947=
27#c13">comment #13</a>)
<span class=3D"quote">&gt; Olivier, can you see if this patch with mesa hel=
ps?
&gt;=20
&gt; <a href=3D"https://patchwork.freedesktop.org/patch/132414/">https://pa=
tchwork.freedesktop.org/patch/132414/</a>
&gt;=20
&gt; It helped in the repro of <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [G71] &quot;Assertion `bkref' failed&quot; reproducible w=
ith glmark2"
   href=3D"show_bug.cgi?id=3D99354">bug #99354</a>.</span >

Sure! Thanks IIlia!

The patch did not apply cleanly on top of 13.0.3 nor master though (in
src/gallium/drivers/nouveau/nvc0/nvc0_query_hw.c line 406 [1]) so I changed
&quot;nouveau_pushbuf_space(push, 16, 2, 0);&quot; to &quot;nouveau_pushbuf=
_space(push, 32, 3,
0);&quot; to match the content of your patch, I hope this is right (sorry, =
I'm not
familiar with this code).

But the issue is quite random and rather hard to reproduce at will, so I'll=
 run
with this for some time see if the issue reoccurs.

I shall also prepare a test package for Fedora downstream with the (modifie=
d)
patch included so that the original reporter can give it a try as well.


[1]
<a href=3D"https://cgit.freedesktop.org/mesa/mesa/tree/src/gallium/drivers/=
nouveau/nvc0/nvc0_query_hw.c#n406">https://cgit.freedesktop.org/mesa/mesa/t=
ree/src/gallium/drivers/nouveau/nvc0/nvc0_query_hw.c#n406</a>
[2] <a href=3D"https://bugzilla.redhat.com/show_bug.cgi?id=3D1372878">https=
://bugzilla.redhat.com/show_bug.cgi?id=3D1372878</a></pre>
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

--14841274280.085F.8376--

--===============0611925902==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0611925902==--
