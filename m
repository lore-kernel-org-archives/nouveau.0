From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 94990] [GM204] GTX 970 + 4GB VRAM fails at secboot
	(v4.6+)
Date: Thu, 24 Nov 2016 21:33:51 +0000
Message-ID: <bug-94990-8800-T5aB5fjlqy@http.bugs.freedesktop.org/>
References: <bug-94990-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0487926995=="
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


--===============0487926995==
Content-Type: multipart/alternative; boundary="14800232315.9E6D2.14321";
 charset="UTF-8"


--14800232315.9E6D2.14321
Date: Thu, 24 Nov 2016 21:33:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D94990

--- Comment #97 from Efrem McCrimon <efremmc2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Hi all:

Please help me understand the ram issue on the video card, is too many
buffers created?  I did not have this problem on a 4.6 kernel, now the
kernel has been upgraded twice, 4.8.5, and now 4.8.6.  No problems using a
960 GTX w/4GB DDR5 memory, plus I have a secondary 730 GTw/1GB RAM.

Please advice

On Wed, Nov 23, 2016 at 8:09 PM, <bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org> wrote:

> *Comment # 96 <https://bugs.freedesktop.org/show_bug.cgi?id=3D94990#c96> =
on
> bug 94990 <https://bugs.freedesktop.org/show_bug.cgi?id=3D94990> from Zach
> Wolfe <zwolfe21-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org> *
>
> Could someone point me to how exactly to apply
> "0001-nvkm_gpuobj-size-is-smaller-then-nvkm_gpuobj-size-ca.patch"?
>
> ------------------------------
> You are receiving this mail because:
>
>    - You are the assignee for the bug.
>
>
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
>
>

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14800232315.9E6D2.14321
Date: Thu, 24 Nov 2016 21:33:51 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D94990#c97">Commen=
t # 97</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [GM204] GTX 970 + 4GB VRAM fails at secboot (v4.6+)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D94990">bug 94990<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
efremmc2&#64;gmail.com" title=3D"Efrem McCrimon &lt;efremmc2&#64;gmail.com&=
gt;"> <span class=3D"fn">Efrem McCrimon</span></a>
</span></b>
        <pre>Hi all:

Please help me understand the ram issue on the video card, is too many
buffers created?  I did not have this problem on a 4.6 kernel, now the
kernel has been upgraded twice, 4.8.5, and now 4.8.6.  No problems using a
960 GTX w/4GB DDR5 memory, plus I have a secondary 730 GTw/1GB RAM.

Please advice

On Wed, Nov 23, 2016 at 8:09 PM, &lt;<a href=3D"mailto:bugzilla-daemon&#64;=
freedesktop.org">bugzilla-daemon&#64;freedesktop.org</a>&gt; wrote:

<span class=3D"quote">&gt; *<a href=3D"show_bug.cgi?id=3D94990#c96">Comment=
 # 96</a> &lt;<a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [GM204] GTX 970 + 4GB VRAM fails at secboot (v4.6+)"
   href=3D"show_bug.cgi?id=3D94990#c96">https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D94990#c96</a>&gt; on
&gt; <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [GM204] GTX 970 + 4GB VRAM fails at secboot (v4.6+)"
   href=3D"show_bug.cgi?id=3D94990">bug 94990</a> &lt;<a class=3D"bz_bug_li=
nk=20
          bz_status_NEW "
   title=3D"NEW - [GM204] GTX 970 + 4GB VRAM fails at secboot (v4.6+)"
   href=3D"show_bug.cgi?id=3D94990">https://bugs.freedesktop.org/show_bug.c=
gi?id=3D94990</a>&gt; from Zach
&gt; Wolfe &lt;<a href=3D"mailto:zwolfe21&#64;hotmail.com">zwolfe21&#64;hot=
mail.com</a>&gt; *</span >
&gt;
<span class=3D"quote">&gt; Could someone point me to how exactly to apply
&gt; &quot;0001-nvkm_gpuobj-size-is-smaller-then-nvkm_gpuobj-size-ca.patch&=
quot;?</span >
&gt;
<span class=3D"quote">&gt; ------------------------------
&gt; You are receiving this mail because:</span >
&gt;
<span class=3D"quote">&gt;    - You are the assignee for the bug.</span >
&gt;
&gt;
<span class=3D"quote">&gt; _______________________________________________
&gt; Nouveau mailing list
&gt; <a href=3D"mailto:Nouveau&#64;lists.freedesktop.org">Nouveau&#64;lists=
.freedesktop.org</a>
&gt; <a href=3D"https://lists.freedesktop.org/mailman/listinfo/nouveau">htt=
ps://lists.freedesktop.org/mailman/listinfo/nouveau</a></span >
&gt;
&gt;</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14800232315.9E6D2.14321--

--===============0487926995==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0487926995==--
