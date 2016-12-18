From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 94990] [GM204] GTX 970 + 4GB VRAM fails at secboot
	(v4.6+)
Date: Sun, 18 Dec 2016 21:57:27 +0000
Message-ID: <bug-94990-8800-U18TYUbFx1@http.bugs.freedesktop.org/>
References: <bug-94990-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0460013023=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-94990-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0460013023==
Content-Type: multipart/alternative; boundary="14820982473.3BCC.22468";
 charset="UTF-8"


--14820982473.3BCC.22468
Date: Sun, 18 Dec 2016 21:57:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D94990

--- Comment #105 from fariouche-Qt13gs6zZMY@public.gmane.org ---
Hi,

I'm joining the group of gtx970 4GB owners who have issues with nouveau :)

I've applied 0001-nvkm_gpuobj-size-is-smaller-then-nvkm_gpuobj-size-ca.patch
and now I have at least a console.
However, no x11 with acceleration.

I've check the kernel messages, and besides the tons of traces ("disp:") I =
see
this line:
: #### nvkm_gpuobj_heap_acquire gpuobj->addr 4286832640, gpuobj->size 4096
: #### nv50_instobj_size 32768
: nouveau 0000:03:00.0: priv: GPC0: 419df4 00000000 (1840820e)
: nouveau 0000:03:00.0: priv: GPC1: 419df4 c0000000 (1a40820d)
: nouveau 0000:03:00.0: priv: GPC2: 514884 c0000000 (1c40820e)
: nouveau 0000:03:00.0: priv: GPC3: 51d084 c0000000 (1f40820e)
: nouveau 0000:03:00.0: gr: init failed, -28


Seems like secboot failed somewhere. Looking at the code, GR failed most li=
kely
when secboot tried to initiate the reset command.

Forgot to say that I'm using kernel 4.9.

If you need me to do some tests, let me know

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14820982473.3BCC.22468
Date: Sun, 18 Dec 2016 21:57:27 +0000
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
   title=3D"NEW - [GM204] GTX 970 + 4GB VRAM fails at secboot (v4.6+)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D94990#c105">Comme=
nt # 105</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [GM204] GTX 970 + 4GB VRAM fails at secboot (v4.6+)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D94990">bug 94990<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
fariouche&#64;yahoo.fr" title=3D"fariouche&#64;yahoo.fr">fariouche&#64;yaho=
o.fr</a>
</span></b>
        <pre>Hi,

I'm joining the group of gtx970 4GB owners who have issues with nouveau :)

I've applied 0001-nvkm_gpuobj-size-is-smaller-then-nvkm_gpuobj-size-ca.patch
and now I have at least a console.
However, no x11 with acceleration.

I've check the kernel messages, and besides the tons of traces (&quot;disp:=
&quot;) I see
this line:
: #### nvkm_gpuobj_heap_acquire gpuobj-&gt;addr 4286832640, gpuobj-&gt;size=
 4096
: #### nv50_instobj_size 32768
: nouveau 0000:03:00.0: priv: GPC0: 419df4 00000000 (1840820e)
: nouveau 0000:03:00.0: priv: GPC1: 419df4 c0000000 (1a40820d)
: nouveau 0000:03:00.0: priv: GPC2: 514884 c0000000 (1c40820e)
: nouveau 0000:03:00.0: priv: GPC3: 51d084 c0000000 (1f40820e)
: nouveau 0000:03:00.0: gr: init failed, -28


Seems like secboot failed somewhere. Looking at the code, GR failed most li=
kely
when secboot tried to initiate the reset command.

Forgot to say that I'm using kernel 4.9.

If you need me to do some tests, let me know</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14820982473.3BCC.22468--

--===============0460013023==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0460013023==--
