From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92438] Segfault in pushbuf_kref when running the
 android emulator (qemu) on nv50
Date: Mon, 23 Nov 2015 14:12:39 +0000
Message-ID: <bug-92438-8800-nR3fDeWdlh@http.bugs.freedesktop.org/>
References: <bug-92438-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1793186642=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-92438-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1793186642==
Content-Type: multipart/alternative; boundary="1448287958.d0774FA0.10795"; charset="UTF-8"


--1448287958.d0774FA0.10795
Date: Mon, 23 Nov 2015 14:12:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92438

--- Comment #34 from Gabriele Svelto <gabriele.svelto-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I've been running the emulator for a while and it hasn't crashed yet but I've
found yet more warning/error messages in my kernel log and they seem related to
it:

[ 3053.470749] nouveau E[  PGRAPH][0000:01:00.0] TRAP_MP_EXEC - TP 0 MP 0:
INVALID_OPCODE at 07ff00 warp 1, opcode 00000000 00000000
[ 3053.470769] nouveau E[  PGRAPH][0000:01:00.0] TRAP_MP_EXEC - TP 0 MP 1:
INVALID_OPCODE at 07ff00 warp 1, opcode 00000000 00000000
[ 3053.470789] nouveau E[  PGRAPH][0000:01:00.0] TRAP_MP_EXEC - TP 1 MP 0:
INVALID_OPCODE at 07fb80 warp 0, opcode 00000000 00000000
[ 3053.470805] nouveau E[  PGRAPH][0000:01:00.0] TRAP_MP_EXEC - TP 1 MP 1:
INVALID_OPCODE at 07ff00 warp 1, opcode 00000000 00000000
[ 3053.470830] nouveau E[  PGRAPH][0000:01:00.0] TRAP_MP_EXEC - TP 2 MP 0:
INVALID_OPCODE at 07ff00 warp 1, opcode 00000000 00000000
[ 3053.470846] nouveau E[  PGRAPH][0000:01:00.0] TRAP_MP_EXEC - TP 2 MP 1:
INVALID_OPCODE at 07ff00 warp 1, opcode 00000000 00000000
[ 3053.470850] nouveau E[  PGRAPH][0000:01:00.0] ch 5 [0x001f768000
emulator-x86[5663]] subc 3 class 0x8297 mthd 0x0f04 data 0x3f800000
[ 3053.470903] nouveau E[  PGRAPH][0000:01:00.0] TRAP_MP_EXEC - TP 0 MP 0:
INVALID_OPCODE at 07ff00 warp 1, opcode 00000000 00000000
[ 3053.470920] nouveau E[  PGRAPH][0000:01:00.0] TRAP_MP_EXEC - TP 0 MP 1:
INVALID_OPCODE at 07ff00 warp 1, opcode 00000000 00000000
[ 3053.470942] nouveau E[  PGRAPH][0000:01:00.0] TRAP_MP_EXEC - TP 1 MP 0:
INVALID_OPCODE at 07fb80 warp 0, opcode 00000000 00000000
[ 3053.470958] nouveau E[  PGRAPH][0000:01:00.0] TRAP_MP_EXEC - TP 1 MP 1:
INVALID_OPCODE at 07ff00 warp 1, opcode 00000000 00000000
[ 3053.470980] nouveau E[  PGRAPH][0000:01:00.0] TRAP_MP_EXEC - TP 2 MP 0:
INVALID_OPCODE at 07ff00 warp 1, opcode 00000000 00000000
[ 3053.471000] nouveau E[  PGRAPH][0000:01:00.0] TRAP_MP_EXEC - TP 2 MP 1:
INVALID_OPCODE at 07ff00 warp 1, opcode 00000000 00000000
[ 3053.471005] nouveau E[  PGRAPH][0000:01:00.0] ch 5 [0x001f768000
emulator-x86[5663]] subc 3 class 0x8297 mthd 0x0f04 data 0x00000000
[ 3053.471060] nouveau E[  PGRAPH][0000:01:00.0] TRAP_MP_EXEC - TP 0 MP 0:
INVALID_OPCODE at 07ff00 warp 1, opcode 00000000 00000000
[ 3053.471077] nouveau E[  PGRAPH][0000:01:00.0] TRAP_MP_EXEC - TP 0 MP 1:
INVALID_OPCODE at 07ff00 warp 1, opcode 00000000 00000000
[ 3053.471098] nouveau E[  PGRAPH][0000:01:00.0] TRAP_MP_EXEC - TP 1 MP 0:
INVALID_OPCODE at 07fb80 warp 0, opcode 00000000 00000000
[ 3053.471115] nouveau E[  PGRAPH][0000:01:00.0] TRAP_MP_EXEC - TP 1 MP 1:
INVALID_OPCODE at 07ff00 warp 1, opcode 00000000 00000000
[ 3053.471136] nouveau E[  PGRAPH][0000:01:00.0] TRAP_MP_EXEC - TP 2 MP 0:
INVALID_OPCODE at 07ff00 warp 1, opcode 00000000 00000000
[ 3053.471153] nouveau E[  PGRAPH][0000:01:00.0] TRAP_MP_EXEC - TP 2 MP 1:
INVALID_OPCODE at 07ff00 warp 1, opcode 00000000 00000000
[ 3053.471158] nouveau E[  PGRAPH][0000:01:00.0] ch 5 [0x001f768000
emulator-x86[5663]] subc 3 class 0x8297 mthd 0x0f04 data 0x00000000
[ 3053.471213] nouveau E[  PGRAPH][0000:01:00.0] TRAP_MP_EXEC - TP 0 MP 0:
INVALID_OPCODE at 07ff00 warp 1, opcode 00000000 00000000
[ 3053.471231] nouveau E[  PGRAPH][0000:01:00.0] TRAP_MP_EXEC - TP 0 MP 1:
INVALID_OPCODE at 07ff00 warp 1, opcode 00000000 00000000
[ 3053.471252] nouveau E[  PGRAPH][0000:01:00.0] TRAP_MP_EXEC - TP 1 MP 0:
INVALID_OPCODE at 07fb80 warp 0, opcode 00000000 00000000
[ 3053.471268] nouveau E[  PGRAPH][0000:01:00.0] TRAP_MP_EXEC - TP 1 MP 1:
INVALID_OPCODE at 07ff00 warp 1, opcode 00000000 00000000
[ 3053.471288] nouveau E[  PGRAPH][0000:01:00.0] TRAP_MP_EXEC - TP 2 MP 0:
INVALID_OPCODE at 07ff00 warp 1, opcode 00000000 00000000
[ 3053.471304] nouveau E[  PGRAPH][0000:01:00.0] TRAP_MP_EXEC - TP 2 MP 1:
INVALID_OPCODE at 07ff00 warp 1, opcode 00000000 00000000
[ 3053.471308] nouveau E[  PGRAPH][0000:01:00.0] ch 5 [0x001f768000
emulator-x86[5663]] subc 3 class 0x8297 mthd 0x15e0 data 0x00000000

I'm not sure if they're related to the issue at hand though.

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1448287958.d0774FA0.10795
Date: Mon, 23 Nov 2015 14:12:38 +0000
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
   title="NEW - Segfault in pushbuf_kref when running the android emulator (qemu) on nv50"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92438#c34">Comment # 34</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Segfault in pushbuf_kref when running the android emulator (qemu) on nv50"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92438">bug 92438</a>
              from <span class="vcard"><a class="email" href="mailto:gabriele.svelto&#64;gmail.com" title="Gabriele Svelto &lt;gabriele.svelto&#64;gmail.com&gt;"> <span class="fn">Gabriele Svelto</span></a>
</span></b>
        <pre>I've been running the emulator for a while and it hasn't crashed yet but I've
found yet more warning/error messages in my kernel log and they seem related to
it:

[ 3053.470749] nouveau E[  PGRAPH][0000:01:00.0] TRAP_MP_EXEC - TP 0 MP 0:
INVALID_OPCODE at 07ff00 warp 1, opcode 00000000 00000000
[ 3053.470769] nouveau E[  PGRAPH][0000:01:00.0] TRAP_MP_EXEC - TP 0 MP 1:
INVALID_OPCODE at 07ff00 warp 1, opcode 00000000 00000000
[ 3053.470789] nouveau E[  PGRAPH][0000:01:00.0] TRAP_MP_EXEC - TP 1 MP 0:
INVALID_OPCODE at 07fb80 warp 0, opcode 00000000 00000000
[ 3053.470805] nouveau E[  PGRAPH][0000:01:00.0] TRAP_MP_EXEC - TP 1 MP 1:
INVALID_OPCODE at 07ff00 warp 1, opcode 00000000 00000000
[ 3053.470830] nouveau E[  PGRAPH][0000:01:00.0] TRAP_MP_EXEC - TP 2 MP 0:
INVALID_OPCODE at 07ff00 warp 1, opcode 00000000 00000000
[ 3053.470846] nouveau E[  PGRAPH][0000:01:00.0] TRAP_MP_EXEC - TP 2 MP 1:
INVALID_OPCODE at 07ff00 warp 1, opcode 00000000 00000000
[ 3053.470850] nouveau E[  PGRAPH][0000:01:00.0] ch 5 [0x001f768000
emulator-x86[5663]] subc 3 class 0x8297 mthd 0x0f04 data 0x3f800000
[ 3053.470903] nouveau E[  PGRAPH][0000:01:00.0] TRAP_MP_EXEC - TP 0 MP 0:
INVALID_OPCODE at 07ff00 warp 1, opcode 00000000 00000000
[ 3053.470920] nouveau E[  PGRAPH][0000:01:00.0] TRAP_MP_EXEC - TP 0 MP 1:
INVALID_OPCODE at 07ff00 warp 1, opcode 00000000 00000000
[ 3053.470942] nouveau E[  PGRAPH][0000:01:00.0] TRAP_MP_EXEC - TP 1 MP 0:
INVALID_OPCODE at 07fb80 warp 0, opcode 00000000 00000000
[ 3053.470958] nouveau E[  PGRAPH][0000:01:00.0] TRAP_MP_EXEC - TP 1 MP 1:
INVALID_OPCODE at 07ff00 warp 1, opcode 00000000 00000000
[ 3053.470980] nouveau E[  PGRAPH][0000:01:00.0] TRAP_MP_EXEC - TP 2 MP 0:
INVALID_OPCODE at 07ff00 warp 1, opcode 00000000 00000000
[ 3053.471000] nouveau E[  PGRAPH][0000:01:00.0] TRAP_MP_EXEC - TP 2 MP 1:
INVALID_OPCODE at 07ff00 warp 1, opcode 00000000 00000000
[ 3053.471005] nouveau E[  PGRAPH][0000:01:00.0] ch 5 [0x001f768000
emulator-x86[5663]] subc 3 class 0x8297 mthd 0x0f04 data 0x00000000
[ 3053.471060] nouveau E[  PGRAPH][0000:01:00.0] TRAP_MP_EXEC - TP 0 MP 0:
INVALID_OPCODE at 07ff00 warp 1, opcode 00000000 00000000
[ 3053.471077] nouveau E[  PGRAPH][0000:01:00.0] TRAP_MP_EXEC - TP 0 MP 1:
INVALID_OPCODE at 07ff00 warp 1, opcode 00000000 00000000
[ 3053.471098] nouveau E[  PGRAPH][0000:01:00.0] TRAP_MP_EXEC - TP 1 MP 0:
INVALID_OPCODE at 07fb80 warp 0, opcode 00000000 00000000
[ 3053.471115] nouveau E[  PGRAPH][0000:01:00.0] TRAP_MP_EXEC - TP 1 MP 1:
INVALID_OPCODE at 07ff00 warp 1, opcode 00000000 00000000
[ 3053.471136] nouveau E[  PGRAPH][0000:01:00.0] TRAP_MP_EXEC - TP 2 MP 0:
INVALID_OPCODE at 07ff00 warp 1, opcode 00000000 00000000
[ 3053.471153] nouveau E[  PGRAPH][0000:01:00.0] TRAP_MP_EXEC - TP 2 MP 1:
INVALID_OPCODE at 07ff00 warp 1, opcode 00000000 00000000
[ 3053.471158] nouveau E[  PGRAPH][0000:01:00.0] ch 5 [0x001f768000
emulator-x86[5663]] subc 3 class 0x8297 mthd 0x0f04 data 0x00000000
[ 3053.471213] nouveau E[  PGRAPH][0000:01:00.0] TRAP_MP_EXEC - TP 0 MP 0:
INVALID_OPCODE at 07ff00 warp 1, opcode 00000000 00000000
[ 3053.471231] nouveau E[  PGRAPH][0000:01:00.0] TRAP_MP_EXEC - TP 0 MP 1:
INVALID_OPCODE at 07ff00 warp 1, opcode 00000000 00000000
[ 3053.471252] nouveau E[  PGRAPH][0000:01:00.0] TRAP_MP_EXEC - TP 1 MP 0:
INVALID_OPCODE at 07fb80 warp 0, opcode 00000000 00000000
[ 3053.471268] nouveau E[  PGRAPH][0000:01:00.0] TRAP_MP_EXEC - TP 1 MP 1:
INVALID_OPCODE at 07ff00 warp 1, opcode 00000000 00000000
[ 3053.471288] nouveau E[  PGRAPH][0000:01:00.0] TRAP_MP_EXEC - TP 2 MP 0:
INVALID_OPCODE at 07ff00 warp 1, opcode 00000000 00000000
[ 3053.471304] nouveau E[  PGRAPH][0000:01:00.0] TRAP_MP_EXEC - TP 2 MP 1:
INVALID_OPCODE at 07ff00 warp 1, opcode 00000000 00000000
[ 3053.471308] nouveau E[  PGRAPH][0000:01:00.0] ch 5 [0x001f768000
emulator-x86[5663]] subc 3 class 0x8297 mthd 0x15e0 data 0x00000000

I'm not sure if they're related to the issue at hand though.</pre>
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

--1448287958.d0774FA0.10795--

--===============1793186642==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1793186642==--
