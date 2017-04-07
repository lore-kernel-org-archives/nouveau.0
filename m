From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 100423] MMIO read of 00000000 FAULT at 022554 [ IBUS
	]
Date: Fri, 07 Apr 2017 13:37:01 +0000
Message-ID: <bug-100423-8800-ztLY14y9mM@http.bugs.freedesktop.org/>
References: <bug-100423-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0277379907=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-100423-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0277379907==
Content-Type: multipart/alternative; boundary="14915722212.eec9c2F12.29104";
 charset="UTF-8"


--14915722212.eec9c2F12.29104
Date: Fri, 7 Apr 2017 13:37:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D100423

--- Comment #1 from gene <gjunk-AoUl3cPchBZWk0Htik3J/w@public.gmane.org> ---
I have similar issue on dell precision 5520 with=20
Intel(R) Core(TM) i7-7820HQ CPU @ 2.90GHz
Has nvidia maxwell (NV117) and 4k touch screen

I see these :


 nouveau 0000:01:00.0: fb: 4096 MiB GDDR5=20
 nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 10ac08 [ IBUS ]=
=20
 nouveau 0000:01:00.0: priv: HUB0: 10ecc0 ffffffff (1f40822c)=20
 vga_switcheroo: enabled
 [TTM] Zone  kernel: Available graphics memory: 16334986 kiB=20
 [TTM] Zone   dma32: Available graphics memory: 2097152 kiB=20
 [TTM] Initializing pool allocator=20
 [TTM] Initializing DMA pool allocator=20
 nouveau 0000:01:00.0: DRM: VRAM: 4096 MiB=20
 nouveau 0000:01:00.0: DRM: GART: 1048576 MiB=20
 nouveau 0000:01:00.0: DRM: Pointer to TMDS table invalid=20
 nouveau 0000:01:00.0: DRM: DCB version 4.0=20
 nouveau 0000:01:00.0: DRM: Pointer to flat panel table invalid

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14915722212.eec9c2F12.29104
Date: Fri, 7 Apr 2017 13:37:01 +0000
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
   title=3D"NEW - MMIO read of 00000000 FAULT at 022554 [ IBUS ]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100423#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - MMIO read of 00000000 FAULT at 022554 [ IBUS ]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100423">bug 10042=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
gjunk&#64;sapience.com" title=3D"gene &lt;gjunk&#64;sapience.com&gt;"> <spa=
n class=3D"fn">gene</span></a>
</span></b>
        <pre>I have similar issue on dell precision 5520 with=20
Intel(R) Core(TM) i7-7820HQ CPU &#64; 2.90GHz
Has nvidia maxwell (NV117) and 4k touch screen

I see these :


 nouveau 0000:01:00.0: fb: 4096 MiB GDDR5=20
 nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 10ac08 [ IBUS ]=
=20
 nouveau 0000:01:00.0: priv: HUB0: 10ecc0 ffffffff (1f40822c)=20
 vga_switcheroo: enabled
 [TTM] Zone  kernel: Available graphics memory: 16334986 kiB=20
 [TTM] Zone   dma32: Available graphics memory: 2097152 kiB=20
 [TTM] Initializing pool allocator=20
 [TTM] Initializing DMA pool allocator=20
 nouveau 0000:01:00.0: DRM: VRAM: 4096 MiB=20
 nouveau 0000:01:00.0: DRM: GART: 1048576 MiB=20
 nouveau 0000:01:00.0: DRM: Pointer to TMDS table invalid=20
 nouveau 0000:01:00.0: DRM: DCB version 4.0=20
 nouveau 0000:01:00.0: DRM: Pointer to flat panel table invalid</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14915722212.eec9c2F12.29104--

--===============0277379907==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0277379907==--
