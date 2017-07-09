From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 101404] GTX 970M (GM204-A) not powered off when not
 in use (DynPwr in stead of DynOff)
Date: Sun, 09 Jul 2017 14:41:05 +0000
Message-ID: <bug-101404-8800-LFhv43GiYG@http.bugs.freedesktop.org/>
References: <bug-101404-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1918503175=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-101404-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1918503175==
Content-Type: multipart/alternative; boundary="14996112650.67C8.18916";
 charset="UTF-8"


--14996112650.67C8.18916
Date: Sun, 9 Jul 2017 14:41:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D101404

--- Comment #8 from Benny Ammitzb=C3=B8ll <benny-t2dRYjLbInkVZ4pArIi0Q3XJ5CkEIoRN@public.gmane.org> ---
(In reply to Peter Wu from comment #7)
> > >> Bad           Runtime PM for PCI Device NVIDIA Corporation GM204M [G=
eForce GTX 970M]=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20
> [..]
> >    Bad           Runtime PM for PCI Device Intel Corporation Skylake PC=
Ie
> > Controller (x16)
>=20
> There is your problem. You have something that modifies runtime PM settin=
gs.
> In the default configuration, runtime PM would be enabled for both. Try
> removing/disabling that problematic tool.

Hmm, ok, I do have laptop_mode enabled, so I tried stopping that, but still=
 see
"Bad" for those when on AC?

> > Not so, I am already on kernel 4.9.34:
>=20
> 4.9 is too old, use 4.10 (TEN) or newer.

Arrg, sorry, seems I can't read :-)

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14996112650.67C8.18916
Date: Sun, 9 Jul 2017 14:41:04 +0000
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
   title=3D"NEW - GTX 970M (GM204-A) not powered off when not in use (DynPw=
r in stead of DynOff)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101404#c8">Commen=
t # 8</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - GTX 970M (GM204-A) not powered off when not in use (DynPw=
r in stead of DynOff)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101404">bug 10140=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
benny&#64;ammitzboell-consult.dk" title=3D"Benny Ammitzb=C3=B8ll &lt;benny&=
#64;ammitzboell-consult.dk&gt;"> <span class=3D"fn">Benny Ammitzb=C3=B8ll</=
span></a>
</span></b>
        <pre>(In reply to Peter Wu from <a href=3D"show_bug.cgi?id=3D101404=
#c7">comment #7</a>)
<span class=3D"quote">&gt; &gt; &gt;&gt; Bad           Runtime PM for PCI D=
evice NVIDIA Corporation GM204M [GeForce GTX 970M]=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
&gt; [..]
&gt; &gt;    Bad           Runtime PM for PCI Device Intel Corporation Skyl=
ake PCIe
&gt; &gt; Controller (x16)
&gt;=20
&gt; There is your problem. You have something that modifies runtime PM set=
tings.
&gt; In the default configuration, runtime PM would be enabled for both. Try
&gt; removing/disabling that problematic tool.</span >

Hmm, ok, I do have laptop_mode enabled, so I tried stopping that, but still=
 see
&quot;Bad&quot; for those when on AC?

<span class=3D"quote">&gt; &gt; Not so, I am already on kernel 4.9.34:
&gt;=20
&gt; 4.9 is too old, use 4.10 (TEN) or newer.</span >

Arrg, sorry, seems I can't read :-)</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14996112650.67C8.18916--

--===============1918503175==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1918503175==--
