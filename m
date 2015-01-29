From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 88868] PowerPC e5500, kernel crash, GT520, GT610
Date: Thu, 29 Jan 2015 16:32:55 +0000
Message-ID: <bug-88868-8800-RXdWScKpDx@http.bugs.freedesktop.org/>
References: <bug-88868-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0833614405=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-88868-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0833614405==
Content-Type: multipart/alternative; boundary="1422549174.67da6Df1.22350"; charset="UTF-8"


--1422549174.67da6Df1.22350
Date: Thu, 29 Jan 2015 16:32:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=88868

--- Comment #7 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
OK, so this is (part of) your problem:

nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0xa1a0900d
nouveau  [  DEVICE][0000:01:00.0] Chipset: nForce (NV1A)
nouveau  [  DEVICE][0000:01:00.0] Family : NV10

Once this happens, nothing will work. The boot0 seems swapped, it should read
back 0x0d90a0a1, which would be a NVD9 (GF119) which is a very reasonable
chipset for a GT610 or GT520 to report. [Unlike NV1A which is a GeForce2 IGP
from ~2003 or so.]

Normally we kick the card into the proper LE/BE mode (which byteswaps all the
register reads/writes at the hw level), but perhaps that's not working for some
reason? I assume this is a BE box, and there's not a whole lot of testing that
goes on (esp for newer cards) on BE. Another thing to note is that nouveau
requires 4K pages (not for any great reason, but there's a lot of confusion
inside the driver regarding whether system or gpu pages are being used, and
PAGE_SHIFT/SIZE aren't universally used in the right places).

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1422549174.67da6Df1.22350
Date: Thu, 29 Jan 2015 16:32:54 +0000
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
   title="NEW - PowerPC e5500, kernel crash, GT520, GT610"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=88868#c7">Comment # 7</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - PowerPC e5500, kernel crash, GT520, GT610"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=88868">bug 88868</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>OK, so this is (part of) your problem:

nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0xa1a0900d
nouveau  [  DEVICE][0000:01:00.0] Chipset: nForce (NV1A)
nouveau  [  DEVICE][0000:01:00.0] Family : NV10

Once this happens, nothing will work. The boot0 seems swapped, it should read
back 0x0d90a0a1, which would be a NVD9 (GF119) which is a very reasonable
chipset for a GT610 or GT520 to report. [Unlike NV1A which is a GeForce2 IGP
from ~2003 or so.]

Normally we kick the card into the proper LE/BE mode (which byteswaps all the
register reads/writes at the hw level), but perhaps that's not working for some
reason? I assume this is a BE box, and there's not a whole lot of testing that
goes on (esp for newer cards) on BE. Another thing to note is that nouveau
requires 4K pages (not for any great reason, but there's a lot of confusion
inside the driver regarding whether system or gpu pages are being used, and
PAGE_SHIFT/SIZE aren't universally used in the right places).</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1422549174.67da6Df1.22350--

--===============0833614405==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0833614405==--
