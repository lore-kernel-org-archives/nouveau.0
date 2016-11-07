From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 98630] Bad color and glitches on PPC64
Date: Mon, 07 Nov 2016 20:20:20 +0000
Message-ID: <bug-98630-8800-WLQGQSzpuN@http.bugs.freedesktop.org/>
References: <bug-98630-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1548680738=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-98630-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1548680738==
Content-Type: multipart/alternative; boundary="14785500190.9DF82.13739";
 charset="UTF-8"


--14785500190.9DF82.13739
Date: Mon, 7 Nov 2016 20:20:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D98630

--- Comment #5 from Mingcong Bai <jeffbai-ymACFijhrKM@public.gmane.org> ---
(In reply to Ilia Mirkin from comment #4)
> Probably RGB vs BGR confusion. Can you create an apitrace of the problem?
> I'll need to give this a whirl on my G5 ...

Is it an application related issue then?

The specific line where Linthesia maps its textures onto GL could be found
here:

https://github.com/linthesia/linthesia/blob/master/src/Tga.cpp#L217

I tried changing it from RGBA to BGRA today, which did change the color out=
put,
but still in incorrect colors like yellow and brown (or maybe I have comple=
tely
butchered my RGB translation "knowledge").

> ... (hm, if I can - I have a GeForce FX 5200 in mine). I should try to tr=
ack
> down a PCI nv4x that I can plug in.

Is it a Quad? I believe they are pretty cheap these days...

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--14785500190.9DF82.13739
Date: Mon, 7 Nov 2016 20:20:19 +0000
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
   title=3D"NEW - Bad color and glitches on PPC64"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98630#c5">Comment=
 # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Bad color and glitches on PPC64"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98630">bug 98630<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
jeffbai&#64;aosc.xyz" title=3D"Mingcong Bai &lt;jeffbai&#64;aosc.xyz&gt;"> =
<span class=3D"fn">Mingcong Bai</span></a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href=3D"show_bug.cgi?id=3D986=
30#c4">comment #4</a>)
<span class=3D"quote">&gt; Probably RGB vs BGR confusion. Can you create an=
 apitrace of the problem?
&gt; I'll need to give this a whirl on my G5 ...</span >

Is it an application related issue then?

The specific line where Linthesia maps its textures onto GL could be found
here:

<a href=3D"https://github.com/linthesia/linthesia/blob/master/src/Tga.cpp#L=
217">https://github.com/linthesia/linthesia/blob/master/src/Tga.cpp#L217</a>

I tried changing it from RGBA to BGRA today, which did change the color out=
put,
but still in incorrect colors like yellow and brown (or maybe I have comple=
tely
butchered my RGB translation &quot;knowledge&quot;).

<span class=3D"quote">&gt; ... (hm, if I can - I have a GeForce FX 5200 in =
mine). I should try to track
&gt; down a PCI nv4x that I can plug in.</span >

Is it a Quad? I believe they are pretty cheap these days...</pre>
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

--14785500190.9DF82.13739--

--===============1548680738==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1548680738==--
