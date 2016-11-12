From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 98398] Acer Aspire V7-582PG (Haswell,
 GTX 750M) fails to power off GPU with runtime PM
Date: Sat, 12 Nov 2016 23:01:20 +0000
Message-ID: <bug-98398-8800-fWlc2JJ480@http.bugs.freedesktop.org/>
References: <bug-98398-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0414460434=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-98398-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0414460434==
Content-Type: multipart/alternative; boundary="14789916801.57A0DBff.26473";
 charset="UTF-8"


--14789916801.57A0DBff.26473
Date: Sat, 12 Nov 2016 23:01:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D98398

--- Comment #13 from Peter Wu <peter-VTkQYDcBqhK7DlmcbJSQ7g@public.gmane.org> ---
Created attachment 127942
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D127942&action=3Dedit
Disable d3cold on bridge when falling back to _DSM

The workaround patch has been merged in v4.9-rc3-34-gb0a6af8 (and backporte=
d to
4.8.7 via v4.8.6-109-g7290da4) but apparently it broke (system?) suspend/re=
sume
according to the reporter.

Before the workaround patch:
 - _PR3 method is found, so nouveau assumes that PCI core takes care of D3c=
old.
 - Due to an ACPICA bug, PCI core fails to power off the device via runtime=
 PM:
   https://bugs.acpica.org/show_bug.cgi?id=3D1333

After the workaround patch I guess that this happens:

 - _PR3 method is found, but unusable. Nouveau falls back to _DSM.
 - Due to the above ACPICA bug, the power resources not owned by any device=
. I
   guess that Linux then decides to power off the "unnecessary" power resou=
rce
   after system resume. (I saw something like this in a dmesg for a similiar
SSDT)
 - At this point I would guess that nouveau then follows the old DSM method,
but
   then I am confused because pcie_port_pm=3Doff (or pre-4.8 kernels) suppo=
sedly
   have the same issue with this power resource.

If pcie_port_pm=3Doff helps, then the attached patch should also work (no
pcie_port_pm=3Doff needed). Can you give it a try on top of v4.8.7?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14789916801.57A0DBff.26473
Date: Sat, 12 Nov 2016 23:01:20 +0000
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
          bz_status_ASSIGNED "
   title=3D"ASSIGNED - Acer Aspire V7-582PG (Haswell, GTX 750M) fails to po=
wer off GPU with runtime PM"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98398#c13">Commen=
t # 13</a>
              on <a class=3D"bz_bug_link=20
          bz_status_ASSIGNED "
   title=3D"ASSIGNED - Acer Aspire V7-582PG (Haswell, GTX 750M) fails to po=
wer off GPU with runtime PM"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98398">bug 98398<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
peter&#64;lekensteyn.nl" title=3D"Peter Wu &lt;peter&#64;lekensteyn.nl&gt;"=
> <span class=3D"fn">Peter Wu</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D127942=
" name=3D"attach_127942" title=3D"Disable d3cold on bridge when falling bac=
k to _DSM">attachment 127942</a> <a href=3D"attachment.cgi?id=3D127942&amp;=
action=3Dedit" title=3D"Disable d3cold on bridge when falling back to _DSM"=
>[details]</a></span> <a href=3D'page.cgi?id=3Dsplinter.html&amp;bug=3D9839=
8&amp;attachment=3D127942'>[review]</a>
Disable d3cold on bridge when falling back to _DSM

The workaround patch has been merged in v4.9-rc3-34-gb0a6af8 (and backporte=
d to
4.8.7 via v4.8.6-109-g7290da4) but apparently it broke (system?) suspend/re=
sume
according to the reporter.

Before the workaround patch:
 - _PR3 method is found, so nouveau assumes that PCI core takes care of D3c=
old.
 - Due to an ACPICA bug, PCI core fails to power off the device via runtime=
 PM:
   <a href=3D"https://bugs.acpica.org/show_bug.cgi?id=3D1333">https://bugs.=
acpica.org/show_bug.cgi?id=3D1333</a>

After the workaround patch I guess that this happens:

 - _PR3 method is found, but unusable. Nouveau falls back to _DSM.
 - Due to the above ACPICA bug, the power resources not owned by any device=
. I
   guess that Linux then decides to power off the &quot;unnecessary&quot; p=
ower resource
   after system resume. (I saw something like this in a dmesg for a similiar
SSDT)
 - At this point I would guess that nouveau then follows the old DSM method,
but
   then I am confused because pcie_port_pm=3Doff (or pre-4.8 kernels) suppo=
sedly
   have the same issue with this power resource.

If pcie_port_pm=3Doff helps, then the attached patch should also work (no
pcie_port_pm=3Doff needed). Can you give it a try on top of v4.8.7?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14789916801.57A0DBff.26473--

--===============0414460434==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0414460434==--
