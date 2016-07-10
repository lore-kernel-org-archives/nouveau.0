From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 96836] Kernel unaligned access at TPC[105d9fb4]
 nvkm_instobj_wr32+0x14/0x20 [nouveau]
Date: Sun, 10 Jul 2016 02:14:08 +0000
Message-ID: <bug-96836-8800-bLs21ioOi3@http.bugs.freedesktop.org/>
References: <bug-96836-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0169464289=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-96836-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0169464289==
Content-Type: multipart/alternative; boundary="14681168481.C7EE.14863";
 charset="UTF-8"


--14681168481.C7EE.14863
Date: Sun, 10 Jul 2016 02:14:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D96836

--- Comment #4 from Kieron Gillespie <ciaran.gillespie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 124978
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D124978&action=3Dedit
Message log while nouveau.debug=3Dtrace

So I enabled the debug trace and I let it run for sometime, roughly 15 minu=
tes,
though it looks like it didn't get terribly far. I am going to try and
collected more information by having it run for several hours, but I figured
I'd upload this in case it's at all useful.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14681168481.C7EE.14863
Date: Sun, 10 Jul 2016 02:14:08 +0000
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
   title=3D"NEW - Kernel unaligned access at TPC[105d9fb4] nvkm_instobj_wr3=
2+0x14/0x20 [nouveau]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D96836#c4">Comment=
 # 4</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Kernel unaligned access at TPC[105d9fb4] nvkm_instobj_wr3=
2+0x14/0x20 [nouveau]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D96836">bug 96836<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
ciaran.gillespie&#64;gmail.com" title=3D"Kieron Gillespie &lt;ciaran.gilles=
pie&#64;gmail.com&gt;"> <span class=3D"fn">Kieron Gillespie</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D124978=
" name=3D"attach_124978" title=3D"Message log while nouveau.debug=3Dtrace">=
attachment 124978</a> <a href=3D"attachment.cgi?id=3D124978&amp;action=3Ded=
it" title=3D"Message log while nouveau.debug=3Dtrace">[details]</a></span>
Message log while nouveau.debug=3Dtrace

So I enabled the debug trace and I let it run for sometime, roughly 15 minu=
tes,
though it looks like it didn't get terribly far. I am going to try and
collected more information by having it run for several hours, but I figured
I'd upload this in case it's at all useful.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14681168481.C7EE.14863--

--===============0169464289==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0169464289==--
