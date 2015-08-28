From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91779] Pure EFI: MacBookPro3,
 1 (NV84) fails to load nouveau on linux 4.1 -- Invalid ROM contents
Date: Fri, 28 Aug 2015 18:32:43 +0000
Message-ID: <bug-91779-8800-Q1Bk0Tb53U@http.bugs.freedesktop.org/>
References: <bug-91779-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0082830734=="
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


--===============0082830734==
Content-Type: multipart/alternative; boundary="1440786763.6fE7a2.31424"; charset="UTF-8"


--1440786763.6fE7a2.31424
Date: Fri, 28 Aug 2015 18:32:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91779

--- Comment #4 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
I believe the situation is that the mac bios normally sticks the gpu's vbios
into either acpi or its pramin by executing the option rom. Once you've booted
and you don't have it in ACPI or PRAMIN, the PROM and PCIROM are the only other
places we can really try. It doesn't appear to like any of your images... I
think if you boot with nouveau.debug=VBIOS=debug that should provide a bit more
info.

If you can obtain the vbios through whatever other means and stick it in a
file, you can use
nouveau.config=NvBios=filename-that-is-loaded-by-request_firmware

As for handing fb back, unfortunately that's not really possible. Arguably
nouveau shouldn't grab the fb so early (or perhaps should check VBIOS
availability even earlier), but the way this modern hw works, VGA is all long
gone.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1440786763.6fE7a2.31424
Date: Fri, 28 Aug 2015 18:32:43 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91779#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Pure EFI: MacBookPro3,1 (NV84) fails to load nouveau on linux 4.1 -- Invalid ROM contents"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91779">bug 91779</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>I believe the situation is that the mac bios normally sticks the gpu's vbios
into either acpi or its pramin by executing the option rom. Once you've booted
and you don't have it in ACPI or PRAMIN, the PROM and PCIROM are the only other
places we can really try. It doesn't appear to like any of your images... I
think if you boot with nouveau.debug=VBIOS=debug that should provide a bit more
info.

If you can obtain the vbios through whatever other means and stick it in a
file, you can use
nouveau.config=NvBios=filename-that-is-loaded-by-request_firmware

As for handing fb back, unfortunately that's not really possible. Arguably
nouveau shouldn't grab the fb so early (or perhaps should check VBIOS
availability even earlier), but the way this modern hw works, VGA is all long
gone.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1440786763.6fE7a2.31424--

--===============0082830734==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0082830734==--
