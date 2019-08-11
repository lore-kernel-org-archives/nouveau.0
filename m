From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 111213] VA-API nouveau SIGSEGV and asserts
Date: Sun, 11 Aug 2019 00:13:28 +0000
Message-ID: <bug-111213-8800-r28BjQw9jv@http.bugs.freedesktop.org/>
References: <bug-111213-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0348383311=="
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


--===============0348383311==
Content-Type: multipart/alternative; boundary="15654824081.20C9.11777"
Content-Transfer-Encoding: 7bit


--15654824081.20C9.11777
Date: Sun, 11 Aug 2019 00:13:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111213

--- Comment #15 from KJ Liew <liewkj-/E1597aS9LQAvxtiuMwx3w@public.gmane.org> ---
(In reply to Ilia Mirkin from comment #14)
> Yep, I know about this. Needs yet another change... just need to figure o=
ut
> how to best resolve it.
Thanks for looking into this. I believe this is the final hurdle to get
Chromium-vaapi working with Nouveau.

> >=20
> > $ VDPAU_DRIVER=3Dnouveau mpv --hwdec=3Dvdpau -vo=3Dopengl /path/to/MP4=
=20
> > Driver 'opengl' has been replaced with 'gpu'!
> > Playing: /path/to/MP4
> >  (+) Video --vid=3D1 (*) (h264 1280x720 23.976fps)
> >  (+) Audio --aid=3D1 --alang=3Deng (*) (aac 2ch 44100Hz)
> > Cannot load libcuda.so.1
> > Using hardware decoding (vdpau).
> > VO: [gpu] 1280x720 vdpau[yuv420p]
> > AO: [pulse] 44100Hz stereo 2ch float
> > AV: 00:00:12 / 00:02:03 (10%) A-V:  0.000
>=20
> mpv doesn't seem to work, yeah. FWIW I'd expect -vo vdpau to work (not -vo
> opengl,

It works for r600 and radeonsi on my 2 other laptops using mpv and the same
command-line using -vo gpu. I think it also works with Geforce9300/Nouveau =
but
need to double check again.

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--15654824081.20C9.11777
Date: Sun, 11 Aug 2019 00:13:28 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111213#c15">Comme=
nt # 15</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - VA-API nouveau SIGSEGV and asserts"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111213">bug 11121=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
liewkj&#64;yahoo.com" title=3D"KJ Liew &lt;liewkj&#64;yahoo.com&gt;"> <span=
 class=3D"fn">KJ Liew</span></a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href=3D"show_bug.cgi?id=3D111=
213#c14">comment #14</a>)
<span class=3D"quote">&gt; Yep, I know about this. Needs yet another change=
... just need to figure out
&gt; how to best resolve it.</span >
Thanks for looking into this. I believe this is the final hurdle to get
Chromium-vaapi working with Nouveau.

<span class=3D"quote">&gt; &gt;=20
&gt; &gt; $ VDPAU_DRIVER=3Dnouveau mpv --hwdec=3Dvdpau -vo=3Dopengl /path/t=
o/MP4=20
&gt; &gt; Driver 'opengl' has been replaced with 'gpu'!
&gt; &gt; Playing: /path/to/MP4
&gt; &gt;  (+) Video --vid=3D1 (*) (h264 1280x720 23.976fps)
&gt; &gt;  (+) Audio --aid=3D1 --alang=3Deng (*) (aac 2ch 44100Hz)
&gt; &gt; Cannot load libcuda.so.1
&gt; &gt; Using hardware decoding (vdpau).
&gt; &gt; VO: [gpu] 1280x720 vdpau[yuv420p]
&gt; &gt; AO: [pulse] 44100Hz stereo 2ch float
&gt; &gt; AV: 00:00:12 / 00:02:03 (10%) A-V:  0.000
&gt;=20
&gt; mpv doesn't seem to work, yeah. FWIW I'd expect -vo vdpau to work (not=
 -vo
&gt; opengl,</span >

It works for r600 and radeonsi on my 2 other laptops using mpv and the same
command-line using -vo gpu. I think it also works with Geforce9300/Nouveau =
but
need to double check again.</pre>
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

--15654824081.20C9.11777--

--===============0348383311==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0348383311==--
