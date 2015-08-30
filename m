From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91779] Pure EFI: MacBookPro3,
 1 (NV84) fails to load nouveau on linux 4.1 -- Invalid ROM contents
Date: Sun, 30 Aug 2015 07:04:51 +0000
Message-ID: <bug-91779-8800-Nl2BSQUoE3@http.bugs.freedesktop.org/>
References: <bug-91779-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0125363573=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91779-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0125363573==
Content-Type: multipart/alternative; boundary="1440918291.b2d8E02.23330"; charset="UTF-8"


--1440918291.b2d8E02.23330
Date: Sun, 30 Aug 2015 07:04:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91779

--- Comment #10 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to Jeremy Huddleston from comment #9)
> BTW, copying /sys/kernel/debug/dri/0/vbios.rom to /lib/firmware when in
> BIOS-emulation mode has allowed me to get nouveau loaded when in pure EFI
> mode via:
> 
> $ sudo modprobe nouveau config=NvBios=vbios.rom

Hmmm... looking at your logs it doesn't appear to get executed. Or perhaps
nouveau printed different things with 3.13. Try doing like

config=NvBios=vbios.rom,NvForcePost=1

which should force it to exec the vbios and hopefully reset the card to a more
expected state.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1440918291.b2d8E02.23330
Date: Sun, 30 Aug 2015 07:04:51 +0000
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
   title="NEW - Pure EFI: MacBookPro3,1 (NV84) fails to load nouveau on linux 4.1 -- Invalid ROM contents"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91779#c10">Comment # 10</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Pure EFI: MacBookPro3,1 (NV84) fails to load nouveau on linux 4.1 -- Invalid ROM contents"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91779">bug 91779</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Jeremy Huddleston from <a href="show_bug.cgi?id=91779#c9">comment #9</a>)
<span class="quote">&gt; BTW, copying /sys/kernel/debug/dri/0/vbios.rom to /lib/firmware when in
&gt; BIOS-emulation mode has allowed me to get nouveau loaded when in pure EFI
&gt; mode via:
&gt; 
&gt; $ sudo modprobe nouveau config=NvBios=vbios.rom</span >

Hmmm... looking at your logs it doesn't appear to get executed. Or perhaps
nouveau printed different things with 3.13. Try doing like

config=NvBios=vbios.rom,NvForcePost=1

which should force it to exec the vbios and hopefully reset the card to a more
expected state.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1440918291.b2d8E02.23330--

--===============0125363573==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0125363573==--
