From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91319] Nouveau driver cannot extract FCODE ROM / DCB
 Block from OpenFirmware Device tree
Date: Mon, 05 Oct 2015 00:29:36 +0000
Message-ID: <bug-91319-8800-pyADZM3vCd@http.bugs.freedesktop.org/>
References: <bug-91319-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0399021114=="
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


--===============0399021114==
Content-Type: multipart/alternative; boundary="1444004975.EE73B1.22367"; charset="UTF-8"


--1444004975.EE73B1.22367
Date: Mon, 5 Oct 2015 00:29:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91319

--- Comment #8 from Peter Saisanas <psaisanas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Hi,
I assume the patch is within 4.3-rc4?

If so, it still doesn't seem to extract the VBIOS via the OpenFirmware.

I have compiled and booted the 4.3-rc4 kernel and booted with
"nouveau.debug=debug,VBIOS=trace" which is attached.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1444004975.EE73B1.22367
Date: Mon, 5 Oct 2015 00:29:35 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91319#c8">Comment # 8</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Nouveau driver cannot extract FCODE ROM / DCB Block from OpenFirmware Device tree"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91319">bug 91319</a>
              from <span class="vcard"><a class="email" href="mailto:psaisanas&#64;gmail.com" title="Peter Saisanas &lt;psaisanas&#64;gmail.com&gt;"> <span class="fn">Peter Saisanas</span></a>
</span></b>
        <pre>Hi,
I assume the patch is within 4.3-rc4?

If so, it still doesn't seem to extract the VBIOS via the OpenFirmware.

I have compiled and booted the 4.3-rc4 kernel and booted with
&quot;nouveau.debug=debug,VBIOS=trace&quot; which is attached.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1444004975.EE73B1.22367--

--===============0399021114==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0399021114==--
