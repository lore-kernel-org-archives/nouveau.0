From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 76319] [NVE6] MMIO FAULT, black screen on QHD+ K2100M
Date: Wed, 19 Mar 2014 13:07:19 +0000
Message-ID: <bug-76319-8800-bqJcYplrPA@http.bugs.freedesktop.org/>
References: <bug-76319-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0263677270=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-76319-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0263677270==
Content-Type: multipart/alternative; boundary="1395234439.8A5c1.12828"; charset="us-ascii"


--1395234439.8A5c1.12828
Date: Wed, 19 Mar 2014 13:07:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D76319

--- Comment #2 from D. Moens <d-bugzilla-vUpi/VKO0VA@public.gmane.org> ---
Ilia, thank you for your instantaneous reply.

(In reply to comment #1)
> I think you may be the proud owner of multiple issues, as evidenced by the
> gpu lockup you get down the line.

Thanks, I feel honoured.

> First off, there's no way that load had those nouveau.debug settings. You
> would have seen a LOT more messages. I'm guessing you looked at some log
> file, and that log file ignores debug-level messages. Try checking in dme=
sg
> directly.

Full dmesg (with patch applied) attached.


>=20
> Secondly, I'm pretty sure there's no way to achieve those resolutions
> without the 540MHz clock frequency provided for by DP1.2 (at least not wi=
th
> 24bit color). In core/engine/disp/dport.c:nouveau_dp_train, prepend a 540=
000
> value in the first position of the bw_list array.

Patched :

$ diff nouveau/nvkm/engine/disp/dport.c.orig nouveau/nvkm/engine/disp/dport=
.c
276c276
<     const u32 bw_list[] =3D { 270000, 162000, 0 };
---
> 	const u32 bw_list[] =3D { 540000, 270000, 162000, 0 };


>=20
> Try to get a full debug log (which should include the various DP debug
> messages, as well as others), with that change, and the nouveau.debug
> settings you were already using (but apparently were either not being pic=
ked
> up, or something else).

Oh joy, I now do get a graphical screen (and high-res VT).

Appearantly, I am also bitten by bug #70354 (witness errors.out) ?

Please find all logs in attachment (with external monitor detached, for sak=
e of
simplicity).


Again, thank you for your involvement.
Didier

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1395234439.8A5c1.12828
Date: Wed, 19 Mar 2014 13:07:19 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - [NVE6] MMIO FAULT, black screen on QHD+ K2100M"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D76319#c2">Comment=
 # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - [NVE6] MMIO FAULT, black screen on QHD+ K2100M"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D76319">bug 76319<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
d-bugzilla&#64;moens.cc" title=3D"D. Moens &lt;d-bugzilla&#64;moens.cc&gt;"=
> <span class=3D"fn">D. Moens</span></a>
</span></b>
        <pre>Ilia, thank you for your instantaneous reply.

(In reply to <a href=3D"show_bug.cgi?id=3D76319#c1">comment #1</a>)
<span class=3D"quote">&gt; I think you may be the proud owner of multiple i=
ssues, as evidenced by the
&gt; gpu lockup you get down the line.</span >

Thanks, I feel honoured.

<span class=3D"quote">&gt; First off, there's no way that load had those no=
uveau.debug settings. You
&gt; would have seen a LOT more messages. I'm guessing you looked at some l=
og
&gt; file, and that log file ignores debug-level messages. Try checking in =
dmesg
&gt; directly.</span >

Full dmesg (with patch applied) attached.


<span class=3D"quote">&gt;=20
&gt; Secondly, I'm pretty sure there's no way to achieve those resolutions
&gt; without the 540MHz clock frequency provided for by DP1.2 (at least not=
 with
&gt; 24bit color). In core/engine/disp/dport.c:nouveau_dp_train, prepend a =
540000
&gt; value in the first position of the bw_list array.</span >

Patched :

$ diff nouveau/nvkm/engine/disp/dport.c.orig nouveau/nvkm/engine/disp/dport=
.c
276c276
&lt;     const u32 bw_list[] =3D { 270000, 162000, 0 };
---
<span class=3D"quote">&gt; 	const u32 bw_list[] =3D { 540000, 270000, 16200=
0, 0 };</span >


<span class=3D"quote">&gt;=20
&gt; Try to get a full debug log (which should include the various DP debug
&gt; messages, as well as others), with that change, and the nouveau.debug
&gt; settings you were already using (but apparently were either not being =
picked
&gt; up, or something else).</span >

Oh joy, I now do get a graphical screen (and high-res VT).

Appearantly, I am also bitten by <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - [NVE6,NVE7] HUB_INIT timeout on graph init, blob fw d=
oesn't help"
   href=3D"show_bug.cgi?id=3D70354">bug #70354</a> (witness errors.out) ?

Please find all logs in attachment (with external monitor detached, for sak=
e of
simplicity).


Again, thank you for your involvement.
Didier</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
=20=20=20=20=20=20
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1395234439.8A5c1.12828--

--===============0263677270==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0263677270==--
