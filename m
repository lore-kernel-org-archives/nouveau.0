From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 94990] Latest 4.6rc4 kernel, no booting on gtx970
Date: Tue, 09 Aug 2016 23:07:48 +0000
Message-ID: <bug-94990-8800-9sdc62Fnhk@http.bugs.freedesktop.org/>
References: <bug-94990-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1370863254=="
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


--===============1370863254==
Content-Type: multipart/alternative; boundary="14707840680.4c35b2a.6148";
 charset="UTF-8"


--14707840680.4c35b2a.6148
Date: Tue, 9 Aug 2016 23:07:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D94990

--- Comment #55 from Ilia Guterman <amfernusus-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 125656
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D125656&action=3Dedit
patch, possible fix

After some messing around i am able to boot.

I noticed it crashes only when initializing certain nvkm_gpuobj, which has =
it
'nvkm_gpuobj->size' bigger then 'nv50_instobj(memory)->mem->size <<
NVKM_RAM_MM_SHIFT'.

catching that specific case made it better.

from your kernel directory do 'git apply
0001-nvkm_gpuobj-size-is-smaller-then-nvkm_gpuobj-size-ca.patch

and if you can post the boot log.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14707840680.4c35b2a.6148
Date: Tue, 9 Aug 2016 23:07:48 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D94990#c55">Commen=
t # 55</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Latest 4.6rc4 kernel, no booting on gtx970"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D94990">bug 94990<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
amfernusus&#64;gmail.com" title=3D"Ilia Guterman &lt;amfernusus&#64;gmail.c=
om&gt;"> <span class=3D"fn">Ilia Guterman</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D125656=
" name=3D"attach_125656" title=3D"patch, possible fix">attachment 125656</a=
> <a href=3D"attachment.cgi?id=3D125656&amp;action=3Dedit" title=3D"patch, =
possible fix">[details]</a></span> <a href=3D'page.cgi?id=3Dsplinter.html&a=
mp;bug=3D94990&amp;attachment=3D125656'>[review]</a>
patch, possible fix

After some messing around i am able to boot.

I noticed it crashes only when initializing certain nvkm_gpuobj, which has =
it
'nvkm_gpuobj-&gt;size' bigger then 'nv50_instobj(memory)-&gt;mem-&gt;size &=
lt;&lt;
NVKM_RAM_MM_SHIFT'.

catching that specific case made it better.

from your kernel directory do 'git apply
0001-nvkm_gpuobj-size-is-smaller-then-nvkm_gpuobj-size-ca.patch

and if you can post the boot log.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14707840680.4c35b2a.6148--

--===============1370863254==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1370863254==--
