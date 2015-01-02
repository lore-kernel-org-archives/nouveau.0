From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 87983] nouveau E[Xorg.bin[1119]] failed to idle
 channel 0xcccc0001 on G86 [GeForce 8500 GT] (rev a1)
Date: Fri, 02 Jan 2015 22:51:04 +0000
Message-ID: <bug-87983-8800-41PMH22IVl@http.bugs.freedesktop.org/>
References: <bug-87983-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1002819249=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-87983-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1002819249==
Content-Type: multipart/alternative; boundary="1420239063.FB3fC62.8171"; charset="UTF-8"


--1420239063.FB3fC62.8171
Date: Fri, 2 Jan 2015 22:51:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=87983

--- Comment #7 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to bofh666 from comment #6)
> As i have a solution for my issue i wonder whether i should change the
> status to resolved already.
> I'd still prefer to find out why the parameter is necessary.
> If the logic when it is necessary is known there might be a way to get the
> Fedora installer to automatically set it.
> 
> Suggestions whether to leave this open and provide more information or to
> close it are welcome :)

Let's leave this open -- disabling msi should just be done as a temporary
workaround. Ideally we'd detect that MSI doesn't work (or perhaps it's not
being enabled properly).

Is this a PCIe card, or a PCI card? Could I trouble you for the output of
'lspci -vnn -t' ? (Perhaps this information is available in your lspci -vv
output, but I don't know how to read it.)

Can you provide 'cat /proc/interrupts' when you don't boot with the MSI disable
and ssh in to obtain it? If any of the other devices are marked as PCI-MSI-*,
are you having trouble with them?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1420239063.FB3fC62.8171
Date: Fri, 2 Jan 2015 22:51:03 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - nouveau E[Xorg.bin[1119]] failed to idle channel 0xcccc0001 on G86 [GeForce 8500 GT] (rev a1)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87983#c7">Comment # 7</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - nouveau E[Xorg.bin[1119]] failed to idle channel 0xcccc0001 on G86 [GeForce 8500 GT] (rev a1)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87983">bug 87983</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to bofh666 from <a href="show_bug.cgi?id=87983#c6">comment #6</a>)
<span class="quote">&gt; As i have a solution for my issue i wonder whether i should change the
&gt; status to resolved already.
&gt; I'd still prefer to find out why the parameter is necessary.
&gt; If the logic when it is necessary is known there might be a way to get the
&gt; Fedora installer to automatically set it.
&gt; 
&gt; Suggestions whether to leave this open and provide more information or to
&gt; close it are welcome :)</span >

Let's leave this open -- disabling msi should just be done as a temporary
workaround. Ideally we'd detect that MSI doesn't work (or perhaps it's not
being enabled properly).

Is this a PCIe card, or a PCI card? Could I trouble you for the output of
'lspci -vnn -t' ? (Perhaps this information is available in your lspci -vv
output, but I don't know how to read it.)

Can you provide 'cat /proc/interrupts' when you don't boot with the MSI disable
and ssh in to obtain it? If any of the other devices are marked as PCI-MSI-*,
are you having trouble with them?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1420239063.FB3fC62.8171--

--===============1002819249==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1002819249==--
