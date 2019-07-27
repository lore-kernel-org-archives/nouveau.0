From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 111213] VA-API nouveau SIGSEGV and asserts
Date: Sat, 27 Jul 2019 02:21:20 +0000
Message-ID: <bug-111213-8800-a8f1lKLG4I@http.bugs.freedesktop.org/>
References: <bug-111213-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2008215459=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-111213-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2008215459==
Content-Type: multipart/alternative; boundary="15641940801.e3Df8.20454"
Content-Transfer-Encoding: 7bit


--15641940801.e3Df8.20454
Date: Sat, 27 Jul 2019 02:21:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111213

--- Comment #8 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to KJ Liew from comment #6)
> I don't know how you had verified VDPAU to make sure it is working. Runni=
ng
> vdpauinfo is not enough.

mplayer -vo vdpau the-video

See https://nouveau.freedesktop.org/wiki/VideoAcceleration/ -- "Using VDPAU=
".
(You also have to tell it to use the "vdpau" codecs.)

> $ LIBVA_DRIVER_NAME=3Dvdpau VDPAU_DRIVER=3Dnouveau chromium
> [19735:19735:0726/182126.662312:ERROR:vaapi_wrapper.cc(455)]
> GetConfigAttributes failed for va_profile 13
> [19735:19735:0726/182126.662353:ERROR:vaapi_wrapper.cc(455)]
> GetConfigAttributes failed for va_profile 6
> [19735:19735:0726/182126.662359:ERROR:vaapi_wrapper.cc(455)]
> GetConfigAttributes failed for va_profile 7
> [19735:19735:0726/182126.764805:ERROR:sandbox_linux.cc(368)]
> InitializeSandbox() called with multiple threads in process gpu-process.
> [19735:19735:0726/182126.808082:ERROR:buffer_manager.cc(488)]
> [.DisplayCompositor]GL ERROR :GL_INVALID_OPERATION : glBufferData: <- err=
or
> from previous GL command
> romium/chromium --type=3Dgpu-process
> --field-trial-handle=3D7302155616383548209,8433935369873353489,131072
> --disable-breakpad
> --gpu-
> preferences=3DKAAAAAAAAAAgAACgAQAAAAAAAAAAAGAAAAAAAAAAAAAIAAAAAAAAAAgAAAA=
AAAAA
> --service-request-channel-token=3D6382519074401266972:
> ../mesa-19.1.3/src/gallium/drivers/nouveau/nvc0/nvc0_video.c:43:
> nvc0_decoder_begin_frame: Assertion `ret =3D=3D 2' failed.

Ah yeah, that's something else.

This appears like it would happen as a result of

   ret =3D nouveau_bo_map(bsp_bo, NOUVEAU_BO_WR, dec->client);

failing. No clue how that could happen... OTOH, I see messages about thread=
s,
and certainly video decoding + GL in different threads is highly likely to =
be
broken with nouveau.

Please try to build a debug version, see if that yields more info. Also look
for errors in dmesg.

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--15641940801.e3Df8.20454
Date: Sat, 27 Jul 2019 02:21:20 +0000
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
   title=3D"NEW - VA-API nouveau SIGSEGV and asserts"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111213#c8">Commen=
t # 8</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - VA-API nouveau SIGSEGV and asserts"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111213">bug 11121=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to KJ Liew from <a href=3D"show_bug.cgi?id=3D111213#=
c6">comment #6</a>)
<span class=3D"quote">&gt; I don't know how you had verified VDPAU to make =
sure it is working. Running
&gt; vdpauinfo is not enough.</span >

mplayer -vo vdpau the-video

See <a href=3D"https://nouveau.freedesktop.org/wiki/VideoAcceleration/">htt=
ps://nouveau.freedesktop.org/wiki/VideoAcceleration/</a> -- &quot;Using VDP=
AU&quot;.
(You also have to tell it to use the &quot;vdpau&quot; codecs.)

<span class=3D"quote">&gt; $ LIBVA_DRIVER_NAME=3Dvdpau VDPAU_DRIVER=3Dnouve=
au chromium
&gt; [19735:19735:0726/182126.662312:ERROR:vaapi_wrapper.cc(455)]
&gt; GetConfigAttributes failed for va_profile 13
&gt; [19735:19735:0726/182126.662353:ERROR:vaapi_wrapper.cc(455)]
&gt; GetConfigAttributes failed for va_profile 6
&gt; [19735:19735:0726/182126.662359:ERROR:vaapi_wrapper.cc(455)]
&gt; GetConfigAttributes failed for va_profile 7
&gt; [19735:19735:0726/182126.764805:ERROR:sandbox_linux.cc(368)]
&gt; InitializeSandbox() called with multiple threads in process gpu-proces=
s.
&gt; [19735:19735:0726/182126.808082:ERROR:buffer_manager.cc(488)]
&gt; [.DisplayCompositor]GL ERROR :GL_INVALID_OPERATION : glBufferData: &lt=
;- error
&gt; from previous GL command
&gt; romium/chromium --type=3Dgpu-process
&gt; --field-trial-handle=3D7302155616383548209,8433935369873353489,131072
&gt; --disable-breakpad
&gt; --gpu-
&gt; preferences=3DKAAAAAAAAAAgAACgAQAAAAAAAAAAAGAAAAAAAAAAAAAIAAAAAAAAAAgA=
AAAAAAAA
&gt; --service-request-channel-token=3D6382519074401266972:
&gt; ../mesa-19.1.3/src/gallium/drivers/nouveau/nvc0/nvc0_video.c:43:
&gt; nvc0_decoder_begin_frame: Assertion `ret =3D=3D 2' failed.</span >

Ah yeah, that's something else.

This appears like it would happen as a result of

   ret =3D nouveau_bo_map(bsp_bo, NOUVEAU_BO_WR, dec-&gt;client);

failing. No clue how that could happen... OTOH, I see messages about thread=
s,
and certainly video decoding + GL in different threads is highly likely to =
be
broken with nouveau.

Please try to build a debug version, see if that yields more info. Also look
for errors in dmesg.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15641940801.e3Df8.20454--

--===============2008215459==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============2008215459==--
