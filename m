From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91319] Nouveau driver cannot extract FCODE ROM / DCB
 Block from OpenFirmware Device tree
Date: Mon, 05 Oct 2015 00:34:31 +0000
Message-ID: <bug-91319-8800-TYA2ACtVt3@http.bugs.freedesktop.org/>
References: <bug-91319-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0742684785=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91319-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0742684785==
Content-Type: multipart/alternative; boundary="1444005270.Eb321.26092"; charset="UTF-8"


--1444005270.Eb321.26092
Date: Mon, 5 Oct 2015 00:34:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91319

--- Comment #9 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to Peter Saisanas from comment #8)
> Hi,
> I assume the patch is within 4.3-rc4?
> 
> If so, it still doesn't seem to extract the VBIOS via the OpenFirmware.
> 
> I have compiled and booted the 4.3-rc4 kernel and booted with
> "nouveau.debug=debug,VBIOS=trace" which is attached.

Odd.

[   10.214404] nouveau 0000:0a:00.0: bios: trying OpenFirmware...
[   10.214499] nouveau 0000:0a:00.0: bios: image 0 invalid

With my patch it's pretty much rigged to always accept the OF vbios. Are you
sure you were able to apply it properly?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1444005270.Eb321.26092
Date: Mon, 5 Oct 2015 00:34:30 +0000
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
   title="NEW - Nouveau driver cannot extract FCODE ROM / DCB Block from OpenFirmware Device tree"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91319#c9">Comment # 9</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Nouveau driver cannot extract FCODE ROM / DCB Block from OpenFirmware Device tree"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91319">bug 91319</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Peter Saisanas from <a href="show_bug.cgi?id=91319#c8">comment #8</a>)
<span class="quote">&gt; Hi,
&gt; I assume the patch is within 4.3-rc4?
&gt; 
&gt; If so, it still doesn't seem to extract the VBIOS via the OpenFirmware.
&gt; 
&gt; I have compiled and booted the 4.3-rc4 kernel and booted with
&gt; &quot;nouveau.debug=debug,VBIOS=trace&quot; which is attached.</span >

Odd.

[   10.214404] nouveau 0000:0a:00.0: bios: trying OpenFirmware...
[   10.214499] nouveau 0000:0a:00.0: bios: image 0 invalid

With my patch it's pretty much rigged to always accept the OF vbios. Are you
sure you were able to apply it properly?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1444005270.Eb321.26092--

--===============0742684785==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0742684785==--
