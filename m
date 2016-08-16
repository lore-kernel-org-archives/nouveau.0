From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 94990] Latest 4.6rc4 kernel, no booting on gtx970
Date: Tue, 16 Aug 2016 22:21:51 +0000
Message-ID: <bug-94990-8800-bnUu6Ke2iA@http.bugs.freedesktop.org/>
References: <bug-94990-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0989545057=="
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


--===============0989545057==
Content-Type: multipart/alternative; boundary="14713861117.50F2.5858";
 charset="UTF-8"


--14713861117.50F2.5858
Date: Tue, 16 Aug 2016 22:21:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D94990

--- Comment #57 from Florian Mickler <florian-sVu6HhrpSfRAfugRpC6u6w@public.gmane.org> ---
(In reply to Ilia Guterman from comment #55)
> Created attachment 125656 [details] [review]
> 0001-nvkm_gpuobj-size-is-smaller-then-nvkm_gpuobj-size-ca.patch
>=20
> After some messing around i am able to boot.
>=20
> I noticed it crashes only when initializing certain nvkm_gpuobj, which has
> it 'nvkm_gpuobj->size' bigger then 'nv50_instobj(memory)->mem->size <<
> NVKM_RAM_MM_SHIFT'.
>=20
> catching that specific case made it better.
>=20
> from your kernel directory do 'git apply
> 0001-nvkm_gpuobj-size-is-smaller-then-nvkm_gpuobj-size-ca.patch
>=20
> and if you can post the boot log.

Hi Ilia,

I applied your patch and my system now boots up. I saw an login-screen-image
from before the boot for a split-second.  apart from that, it seems to run
fine. (no stress testing done, just firefox and some gnome terminals...)


what does your patch do? increase the reported size of some of the objects?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14713861117.50F2.5858
Date: Tue, 16 Aug 2016 22:21:51 +0000
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
   title=3D"NEW - Latest 4.6rc4 kernel, no booting on gtx970"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D94990#c57">Commen=
t # 57</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Latest 4.6rc4 kernel, no booting on gtx970"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D94990">bug 94990<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
florian&#64;mickler.org" title=3D"Florian Mickler &lt;florian&#64;mickler.o=
rg&gt;"> <span class=3D"fn">Florian Mickler</span></a>
</span></b>
        <pre>(In reply to Ilia Guterman from <a href=3D"show_bug.cgi?id=3D9=
4990#c55">comment #55</a>)
<span class=3D"quote">&gt; Created <span class=3D""><a href=3D"attachment.c=
gi?id=3D125656" name=3D"attach_125656" title=3D"0001-nvkm_gpuobj-size-is-sm=
aller-then-nvkm_gpuobj-size-ca.patch">attachment 125656</a> <a href=3D"atta=
chment.cgi?id=3D125656&amp;action=3Dedit" title=3D"0001-nvkm_gpuobj-size-is=
-smaller-then-nvkm_gpuobj-size-ca.patch">[details]</a></span> <a href=3D'pa=
ge.cgi?id=3Dsplinter.html&amp;bug=3D94990&amp;attachment=3D125656'>[review]=
</a> [review]
&gt; 0001-nvkm_gpuobj-size-is-smaller-then-nvkm_gpuobj-size-ca.patch
&gt;=20
&gt; After some messing around i am able to boot.
&gt;=20
&gt; I noticed it crashes only when initializing certain nvkm_gpuobj, which=
 has
&gt; it 'nvkm_gpuobj-&gt;size' bigger then 'nv50_instobj(memory)-&gt;mem-&g=
t;size &lt;&lt;
&gt; NVKM_RAM_MM_SHIFT'.
&gt;=20
&gt; catching that specific case made it better.
&gt;=20
&gt; from your kernel directory do 'git apply
&gt; 0001-nvkm_gpuobj-size-is-smaller-then-nvkm_gpuobj-size-ca.patch
&gt;=20
&gt; and if you can post the boot log.</span >

Hi Ilia,

I applied your patch and my system now boots up. I saw an login-screen-image
from before the boot for a split-second.  apart from that, it seems to run
fine. (no stress testing done, just firefox and some gnome terminals...)


what does your patch do? increase the reported size of some of the objects?=
</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14713861117.50F2.5858--

--===============0989545057==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0989545057==--
