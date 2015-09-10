From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91551] DXTn compressed normal maps produce severe
 artifacts on all NV5x and NVDx chipsets
Date: Thu, 10 Sep 2015 08:51:43 +0000
Message-ID: <bug-91551-8800-OaDZRtNZYE@http.bugs.freedesktop.org/>
References: <bug-91551-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1871804903=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91551-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1871804903==
Content-Type: multipart/alternative; boundary="1441875103.cF85281.27210"; charset="UTF-8"


--1441875103.cF85281.27210
Date: Thu, 10 Sep 2015 08:51:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91551

--- Comment #10 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Ah, I suspect the remaining issues are due to the fact that we're encoding
things like

119: mad f32 $r75 $r4 2.000000 $r75 (8)

as

e000092d 04000003     add sat f32 $r11 (mul $r4 0x40000000) $r11

Which... might not be *exactly* the same thing. Unfortunately there *is* no
encoding for that instruction, the nv50 emitter isn't smart enough not to emit
it. Shaders with > 64 regs are sufficiently rare :(

I guess we need to add a post-RA fixup to load these immediates for
non-encodable instructions. Of course the question is *where* to load it...
ugh. Could try to reserve a special register at RA time for it...

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1441875103.cF85281.27210
Date: Thu, 10 Sep 2015 08:51:43 +0000
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
   title="NEW - DXTn compressed normal maps produce severe artifacts on all NV5x and NVDx chipsets"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91551#c10">Comment # 10</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - DXTn compressed normal maps produce severe artifacts on all NV5x and NVDx chipsets"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91551">bug 91551</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Ah, I suspect the remaining issues are due to the fact that we're encoding
things like

119: mad f32 $r75 $r4 2.000000 $r75 (8)

as

e000092d 04000003     add sat f32 $r11 (mul $r4 0x40000000) $r11

Which... might not be *exactly* the same thing. Unfortunately there *is* no
encoding for that instruction, the nv50 emitter isn't smart enough not to emit
it. Shaders with &gt; 64 regs are sufficiently rare :(

I guess we need to add a post-RA fixup to load these immediates for
non-encodable instructions. Of course the question is *where* to load it...
ugh. Could try to reserve a special register at RA time for it...</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1441875103.cF85281.27210--

--===============1871804903==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1871804903==--
