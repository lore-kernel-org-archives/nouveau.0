From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 94725] Nouveau driver fails to poweron GPU on GM204
 after dynamic poweroff
Date: Sat, 16 Jul 2016 17:14:38 +0000
Message-ID: <bug-94725-8800-SvzQ4u3J6i@http.bugs.freedesktop.org/>
References: <bug-94725-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1136143133=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-94725-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1136143133==
Content-Type: multipart/alternative; boundary="14686892782.FCEcAe.15928";
 charset="UTF-8"


--14686892782.FCEcAe.15928
Date: Sat, 16 Jul 2016 17:14:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D94725

--- Comment #24 from Peter Wu <peter-VTkQYDcBqhK7DlmcbJSQ7g@public.gmane.org> ---
@Efrem Your issue occurs with completely different (desktop) hardware. Plea=
se
file a new bug.

(In reply to Rashed Abdel-Tawab from comment #17)
> Created attachment 122747 [details]
> new dmesg during hang
>=20
> I decided to keep testing this in case we missed something, and running l=
shw
> twice in a row causes it to hang. I'm not sure what's up with it so I've
> attached the dmesg. It looks pretty similar to before, but that doesn't m=
ake
> sense since Alexandre patched the original problem.

Chris Wilson reported a similar trace for an Acer Aspire VN7-791G.
https://lists.freedesktop.org/archives/nouveau/2016-July/025602.html

I found ACPI information in the BIOS firmware for your laptop from
https://us.msi.com/Laptop/GS60-Ghost-Pro-4K-6th-Gen-GTX-970M.html
It could be the same PCI problem that I and Tobias are experiencing, except
that our laptops hang in ACPI while Rashed's firmware does not check the PC=
Ie
link status in the ACPI firmware. Still digging...

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14686892782.FCEcAe.15928
Date: Sat, 16 Jul 2016 17:14:38 +0000
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
   title=3D"NEW - Nouveau driver fails to poweron GPU on GM204 after dynami=
c poweroff"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D94725#c24">Commen=
t # 24</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Nouveau driver fails to poweron GPU on GM204 after dynami=
c poweroff"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D94725">bug 94725<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
peter&#64;lekensteyn.nl" title=3D"Peter Wu &lt;peter&#64;lekensteyn.nl&gt;"=
> <span class=3D"fn">Peter Wu</span></a>
</span></b>
        <pre>&#64;Efrem Your issue occurs with completely different (deskto=
p) hardware. Please
file a new bug.

(In reply to Rashed Abdel-Tawab from <a href=3D"show_bug.cgi?id=3D94725#c17=
">comment #17</a>)
<span class=3D"quote">&gt; Created <span class=3D""><a href=3D"attachment.c=
gi?id=3D122747" name=3D"attach_122747" title=3D"new dmesg during hang">atta=
chment 122747</a> <a href=3D"attachment.cgi?id=3D122747&amp;action=3Dedit" =
title=3D"new dmesg during hang">[details]</a></span>
&gt; new dmesg during hang
&gt;=20
&gt; I decided to keep testing this in case we missed something, and runnin=
g lshw
&gt; twice in a row causes it to hang. I'm not sure what's up with it so I'=
ve
&gt; attached the dmesg. It looks pretty similar to before, but that doesn'=
t make
&gt; sense since Alexandre patched the original problem.</span >

Chris Wilson reported a similar trace for an Acer Aspire VN7-791G.
<a href=3D"https://lists.freedesktop.org/archives/nouveau/2016-July/025602.=
html">https://lists.freedesktop.org/archives/nouveau/2016-July/025602.html<=
/a>

I found ACPI information in the BIOS firmware for your laptop from
<a href=3D"https://us.msi.com/Laptop/GS60-Ghost-Pro-4K-6th-Gen-GTX-970M.htm=
l">https://us.msi.com/Laptop/GS60-Ghost-Pro-4K-6th-Gen-GTX-970M.html</a>
It could be the same PCI problem that I and Tobias are experiencing, except
that our laptops hang in ACPI while Rashed's firmware does not check the PC=
Ie
link status in the ACPI firmware. Still digging...</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14686892782.FCEcAe.15928--

--===============1136143133==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1136143133==--
