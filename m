From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91895] [nve7] Shadow Warrior: black gun & messed up
	colors
Date: Sun, 06 Sep 2015 21:13:32 +0000
Message-ID: <bug-91895-8800-IbfznGx9Eh@http.bugs.freedesktop.org/>
References: <bug-91895-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2087022180=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91895-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2087022180==
Content-Type: multipart/alternative; boundary="1441574011.184F221.15858"; charset="UTF-8"


--1441574011.184F221.15858
Date: Sun, 6 Sep 2015 21:13:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91895

--- Comment #7 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
OK, I think I see what's happening... the sequence goes something like this:

  3: mov u32 %r438 0x3f800000 (0)

 16: mov u32 $r0 %r445 (0)
 17: mov u32 $r1 %r452 (0)
 18: call abs BUILTIN:1 (0)
 19: mov u32 %r455 $r1 (0)
 20: nop - { $r0 $r2d } (0)
 21: nop - $p0q (0)

337: mov u32 %r1227 %r1012 (0)
338: mov u32 %r1228 %r1014 (0)
339: mov u32 %r1229 %r954 (0)
340: merge b128 %r1222q %r1227 %r1228 %r1229 %r438 (0)
341: export b128 # o[0x10] %r1222q (0)

Now the resulting "code" looks like:

  1: mov u32 $r2 0x3f800000 (8)
  7: mov u32 $r10 0x00000004 (8)

263: mov u32 $r1073741823 $r10 (8)
264: mov u32 $r0 $r11 (8)
265: mov u32 $r1 $r16 (8)
266: export b128 # o[0x10] %r1222q (8)

So it must be trying to stick this stuff into r0..r3. However there's a clobber
of $r2 between the initial move and the desire to use it, without any
constraint move being inserted. So the RA fails because it doesn't understand
the situation properly. I *think*.

Not sure why the first 3 args of the merge have a mov but the 4th one doesn't.
Perhaps something eliminates it for some reason? Also worth noting that this
works fine on GK110, presumably due to slightly different RA constraints.
However we don't get anywhere close to using up the 64 registers here either.

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1441574011.184F221.15858
Date: Sun, 6 Sep 2015 21:13:31 +0000
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
   title="NEW - [nve7] Shadow Warrior: black gun &amp; messed up colors"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91895#c7">Comment # 7</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [nve7] Shadow Warrior: black gun &amp; messed up colors"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91895">bug 91895</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>OK, I think I see what's happening... the sequence goes something like this:

  3: mov u32 %r438 0x3f800000 (0)

 16: mov u32 $r0 %r445 (0)
 17: mov u32 $r1 %r452 (0)
 18: call abs BUILTIN:1 (0)
 19: mov u32 %r455 $r1 (0)
 20: nop - { $r0 $r2d } (0)
 21: nop - $p0q (0)

337: mov u32 %r1227 %r1012 (0)
338: mov u32 %r1228 %r1014 (0)
339: mov u32 %r1229 %r954 (0)
340: merge b128 %r1222q %r1227 %r1228 %r1229 %r438 (0)
341: export b128 # o[0x10] %r1222q (0)

Now the resulting &quot;code&quot; looks like:

  1: mov u32 $r2 0x3f800000 (8)
  7: mov u32 $r10 0x00000004 (8)

263: mov u32 $r1073741823 $r10 (8)
264: mov u32 $r0 $r11 (8)
265: mov u32 $r1 $r16 (8)
266: export b128 # o[0x10] %r1222q (8)

So it must be trying to stick this stuff into r0..r3. However there's a clobber
of $r2 between the initial move and the desire to use it, without any
constraint move being inserted. So the RA fails because it doesn't understand
the situation properly. I *think*.

Not sure why the first 3 args of the merge have a mov but the 4th one doesn't.
Perhaps something eliminates it for some reason? Also worth noting that this
works fine on GK110, presumably due to slightly different RA constraints.
However we don't get anywhere close to using up the 64 registers here either.</pre>
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

--1441574011.184F221.15858--

--===============2087022180==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============2087022180==--
