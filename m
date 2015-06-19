From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91025] nouveau fails to run with NV5 [Riva TNT2 /
	TNT2 Pro]
Date: Fri, 19 Jun 2015 02:35:52 +0000
Message-ID: <bug-91025-8800-8iMtOIkX9h@http.bugs.freedesktop.org/>
References: <bug-91025-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1759609694=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91025-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1759609694==
Content-Type: multipart/alternative; boundary="1434681352.0ABA4c872.18685"; charset="UTF-8"


--1434681352.0ABA4c872.18685
Date: Fri, 19 Jun 2015 02:35:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91025

--- Comment #2 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Hm fun, a non-M64 TNT2. I looked at the vbios dump you attached, and it indeed
has the unknown opcodes. I tried flipping some bits to get it to parse, but
it'd take a lot of manipulation to fix it.

Would you mind extracting the vbios using envytools's nvagetbios? It should
have 2 diff methods, please try both of them. You can also look at the output
with the nvbios tool.

Looks like 0x59 and 0x5a have 6 bytes worth of arguments each. And we have a
hole there (i.e. 0x58 and 0x5b are both known) so it makes sense that they're
real opcodes... should try decoding the asm...

Short-term you can add entries in the table in subdev/bios/init.c and have the
function skip 7 bytes each (6 byte arg + 1 byte op).

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1434681352.0ABA4c872.18685
Date: Fri, 19 Jun 2015 02:35:52 +0000
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
   title="NEW - nouveau fails to run with NV5 [Riva TNT2 / TNT2 Pro]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91025#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - nouveau fails to run with NV5 [Riva TNT2 / TNT2 Pro]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91025">bug 91025</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Hm fun, a non-M64 TNT2. I looked at the vbios dump you attached, and it indeed
has the unknown opcodes. I tried flipping some bits to get it to parse, but
it'd take a lot of manipulation to fix it.

Would you mind extracting the vbios using envytools's nvagetbios? It should
have 2 diff methods, please try both of them. You can also look at the output
with the nvbios tool.

Looks like 0x59 and 0x5a have 6 bytes worth of arguments each. And we have a
hole there (i.e. 0x58 and 0x5b are both known) so it makes sense that they're
real opcodes... should try decoding the asm...

Short-term you can add entries in the table in subdev/bios/init.c and have the
function skip 7 bytes each (6 byte arg + 1 byte op).</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1434681352.0ABA4c872.18685--

--===============1759609694==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1759609694==--
