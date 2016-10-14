From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 98240] Kernel module fails to load on HP Pavilion
 V3A33AV laptop.
Date: Fri, 14 Oct 2016 02:58:19 +0000
Message-ID: <bug-98240-8800-X1lZ8OuntP@http.bugs.freedesktop.org/>
References: <bug-98240-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1439951226=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-98240-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1439951226==
Content-Type: multipart/alternative; boundary="14764138990.18E2F.31045";
 charset="UTF-8"


--14764138990.18E2F.31045
Date: Fri, 14 Oct 2016 02:58:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D98240

--- Comment #12 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to Sergey Okhapkin from comment #11)
> [ 3234.532656] ACPI Warning: \_SB.PCI0.GFX0._DSM: Argument #4 type mismat=
ch
> - Found [Buffer], ACPI requires [Package] (20160422/nsarguments-95)
> [ 3234.532743] ACPI Warning: \_SB.PCI0.PEG0.PEGP._DSM: Argument #4 type
> mismatch - Found [Buffer], ACPI requires [Package] (20160422/nsarguments-=
95)
> [ 3234.532849] ACPI Warning: \_SB.PCI0.PEG0.PEGP._DSM: Argument #4 type
> mismatch - Found [Buffer], ACPI requires [Package] (20160422/nsarguments-=
95)
> [ 3234.533890] pci 0000:01:00.0: optimus capabilities: enabled, status
> dynamic power,=20
> [ 3234.533897] VGA switcheroo: detected Optimus DSM method
> \_SB_.PCI0.PEG0.PEGP handle
> [ 3234.533898] nouveau: detected PR support, will not use DSM
> [ 3234.534005] nouveau 0000:01:00.0: NVIDIA GM107 (1171b0a2)
> [ 3234.538042] retrieving _ROM off: 0x0, len: 0x1000, ret: 0x1000
> [ 3234.539278] retrieving _ROM off: 0x1000, len: 0xf000, ret: 0xf000

Grrr. Well, that's the issue. It only returns 0x1000 worth of data, but cla=
ims
to return a buffer sized to 0xf000. And I think I see why:

            Name (VROM, Buffer (Local1)
            {
                 0x00                                             /* . */
            })

Which allocates the VROM buffer to be 0xf000 sized. At the end, that buffer=
 is
filled with

            Mid (Local5, Local0, Local1, VROM) /*
\_SB_.PCI0.PEG0.PEGP._ROM.VROM */
            Return (VROM) /* \_SB_.PCI0.PEG0.PEGP._ROM.VROM */

However I suspect that Mid() doesn't actually *replace* the object. And thi=
s is
what acpi_ex_store_buffer_to_buffer() does on Linux - as long as less data =
is
stored, the length of the object appears untouched.

So ... given this implementation, I'm not sure how we can reliably skip the
"fast" ACPI read. Ben, thoughts?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14764138990.18E2F.31045
Date: Fri, 14 Oct 2016 02:58:19 +0000
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
   title=3D"NEW - Kernel module fails to load on HP Pavilion V3A33AV laptop=
."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98240#c12">Commen=
t # 12</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Kernel module fails to load on HP Pavilion V3A33AV laptop=
."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98240">bug 98240<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Sergey Okhapkin from <a href=3D"show_bug.cgi?id=
=3D98240#c11">comment #11</a>)
<span class=3D"quote">&gt; [ 3234.532656] ACPI Warning: \_SB.PCI0.GFX0._DSM=
: Argument #4 type mismatch
&gt; - Found [Buffer], ACPI requires [Package] (20160422/nsarguments-95)
&gt; [ 3234.532743] ACPI Warning: \_SB.PCI0.PEG0.PEGP._DSM: Argument #4 type
&gt; mismatch - Found [Buffer], ACPI requires [Package] (20160422/nsargumen=
ts-95)
&gt; [ 3234.532849] ACPI Warning: \_SB.PCI0.PEG0.PEGP._DSM: Argument #4 type
&gt; mismatch - Found [Buffer], ACPI requires [Package] (20160422/nsargumen=
ts-95)
&gt; [ 3234.533890] pci 0000:01:00.0: optimus capabilities: enabled, status
&gt; dynamic power,=20
&gt; [ 3234.533897] VGA switcheroo: detected Optimus DSM method
&gt; \_SB_.PCI0.PEG0.PEGP handle
&gt; [ 3234.533898] nouveau: detected PR support, will not use DSM
&gt; [ 3234.534005] nouveau 0000:01:00.0: NVIDIA GM107 (1171b0a2)
&gt; [ 3234.538042] retrieving _ROM off: 0x0, len: 0x1000, ret: 0x1000
&gt; [ 3234.539278] retrieving _ROM off: 0x1000, len: 0xf000, ret: 0xf000</=
span >

Grrr. Well, that's the issue. It only returns 0x1000 worth of data, but cla=
ims
to return a buffer sized to 0xf000. And I think I see why:

            Name (VROM, Buffer (Local1)
            {
                 0x00                                             /* . */
            })

Which allocates the VROM buffer to be 0xf000 sized. At the end, that buffer=
 is
filled with

            Mid (Local5, Local0, Local1, VROM) /*
\_SB_.PCI0.PEG0.PEGP._ROM.VROM */
            Return (VROM) /* \_SB_.PCI0.PEG0.PEGP._ROM.VROM */

However I suspect that Mid() doesn't actually *replace* the object. And thi=
s is
what acpi_ex_store_buffer_to_buffer() does on Linux - as long as less data =
is
stored, the length of the object appears untouched.

So ... given this implementation, I'm not sure how we can reliably skip the
&quot;fast&quot; ACPI read. Ben, thoughts?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14764138990.18E2F.31045--

--===============1439951226==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1439951226==--
