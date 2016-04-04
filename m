From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 94643] 4K Display on Displayport goes black when
 pointer hits column 0
Date: Mon, 04 Apr 2016 12:19:43 +0000
Message-ID: <bug-94643-8800-janrbmBAnD@http.bugs.freedesktop.org/>
References: <bug-94643-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0550563162=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-94643-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0550563162==
Content-Type: multipart/alternative; boundary="14597723820.b22EbAbE.4904";
 charset="UTF-8"


--14597723820.b22EbAbE.4904
Date: Mon, 4 Apr 2016 12:19:42 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=94643

--- Comment #3 from Robert Schöftner <rmu-hikZAF2L1OleoWH0uzbU5w@public.gmane.org> ---
I just managed to hit this bug again, this time external display went gray,
keyboard was dead, internal display was not "damaged" but did not update any
more except for mouse pointer, that could be moved.

syslog:

Apr  4 14:06:24 boltzmann kernel: [346097.973285] nouveau 0000:01:00.0:
Xorg[2270]: failed to idle channel 3 [Xorg[2270]]
Apr  4 14:06:24 boltzmann kernel: [346097.973475] nouveau 0000:01:00.0: fb:
trapped read at 002001e020 on channel 3 [0fb30000 Xorg[2270]] engine 0c
[SEMAPHORE_BG] client 08 [PFIFO_READ] subclient 00 [] reason 00000002
[PAGE_NOT_PRESENT]
Apr  4 14:06:24 boltzmann kernel: [346097.973505] nouveau 0000:01:00.0: gr:
TRAP_DISPATCH (unknown 00000004)
Apr  4 14:06:24 boltzmann kernel: [346097.973519] nouveau 0000:01:00.0: fb:
trapped read at 0000000400 on channel 3 [0fb30000 Xorg[2270]] engine 00
[PGRAPH] client 03 [DISPATCH] subclient 00 [GRCTX] reason 0000000f
[DMAOBJ_LIMIT]
Apr  4 14:06:24 boltzmann kernel: [346097.973548] nouveau 0000:01:00.0: gr:
TRAP_DISPATCH (unknown 00000008)
Apr  4 14:06:24 boltzmann kernel: [346097.973591] nouveau 0000:01:00.0: fb:
trapped read at 0000015400 on channel 3 [0fb30000 Xorg[2270]] engine 00
[PGRAPH] client 03 [DISPATCH] subclient 00 [GRCTX] reason 0000000f
[DMAOBJ_LIMIT]
Apr  4 14:06:24 boltzmann kernel: [346097.973619] nouveau 0000:01:00.0: gr:
TRAP_DISPATCH (unknown 00000008)
Apr  4 14:06:24 boltzmann kernel: [346097.973625] nouveau 0000:01:00.0: gr:
00200030 [ILLEGAL_MTHD ILLEGAL_CLASS] ch 3 [000fb30000 Xorg[2270]] subc 2 class
0000 mthd 0230 data 000000cf
Apr  4 14:06:24 boltzmann kernel: [346097.973646] nouveau 0000:01:00.0: fb:
trapped read at 0000045600 on channel 3 [0fb30000 Xorg[2270]] engine 00
[PGRAPH] client 03 [DISPATCH] subclient 00 [GRCTX] reason 0000000f
[DMAOBJ_LIMIT]
Apr  4 14:06:24 boltzmann kernel: [346097.973666] nouveau 0000:01:00.0: gr:
00000030 [ILLEGAL_MTHD ILLEGAL_CLASS] ch 3 [000fb30000 Xorg[2270]] subc 2 class
0000 mthd 0234 data 00000000
Apr  4 14:06:24 boltzmann kernel: [346097.973684] nouveau 0000:01:00.0: gr:
00000030 [ILLEGAL_MTHD ILLEGAL_CLASS] ch 3 [000fb30000 Xorg[2270]] subc 2 class
0000 mthd 0238 data 00000040
Apr  4 14:06:24 boltzmann kernel: [346097.973708] nouveau 0000:01:00.0: gr:
00000030 [ILLEGAL_MTHD ILLEGAL_CLASS] ch 3 [000fb30000 Xorg[2270]] subc 2 class
0000 mthd 023c data 00000001
Apr  4 14:06:24 boltzmann kernel: [346097.973734] nouveau 0000:01:00.0: gr:
00000030 [ILLEGAL_MTHD ILLEGAL_CLASS] ch 3 [000fb30000 Xorg[2270]] subc 2 class
0000 mthd 0240 data 00000000
Apr  4 14:06:24 boltzmann kernel: [346097.973759] nouveau 0000:01:00.0: gr:
00000030 [ILLEGAL_MTHD ILLEGAL_CLASS] ch 3 [000fb30000 Xorg[2270]] subc 2 class
0000 mthd 0248 data 00000915

[repeats like that with different mthd/data]

I killed Xorg with -9 and could reboot cleanly (via ssh).

Any hints how to debug this?

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14597723820.b22EbAbE.4904
Date: Mon, 4 Apr 2016 12:19:42 +0000
MIME-Version: 1.0
Content-Type: text/html

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - 4K Display on Displayport goes black when pointer hits column 0"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=94643#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - 4K Display on Displayport goes black when pointer hits column 0"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=94643">bug 94643</a>
              from <span class="vcard"><a class="email" href="mailto:rmu&#64;unfoo.net" title="Robert Schöftner &lt;rmu&#64;unfoo.net&gt;"> <span class="fn">Robert Schöftner</span></a>
</span></b>
        <pre>I just managed to hit this bug again, this time external display went gray,
keyboard was dead, internal display was not &quot;damaged&quot; but did not update any
more except for mouse pointer, that could be moved.

syslog:

Apr  4 14:06:24 boltzmann kernel: [346097.973285] nouveau 0000:01:00.0:
Xorg[2270]: failed to idle channel 3 [Xorg[2270]]
Apr  4 14:06:24 boltzmann kernel: [346097.973475] nouveau 0000:01:00.0: fb:
trapped read at 002001e020 on channel 3 [0fb30000 Xorg[2270]] engine 0c
[SEMAPHORE_BG] client 08 [PFIFO_READ] subclient 00 [] reason 00000002
[PAGE_NOT_PRESENT]
Apr  4 14:06:24 boltzmann kernel: [346097.973505] nouveau 0000:01:00.0: gr:
TRAP_DISPATCH (unknown 00000004)
Apr  4 14:06:24 boltzmann kernel: [346097.973519] nouveau 0000:01:00.0: fb:
trapped read at 0000000400 on channel 3 [0fb30000 Xorg[2270]] engine 00
[PGRAPH] client 03 [DISPATCH] subclient 00 [GRCTX] reason 0000000f
[DMAOBJ_LIMIT]
Apr  4 14:06:24 boltzmann kernel: [346097.973548] nouveau 0000:01:00.0: gr:
TRAP_DISPATCH (unknown 00000008)
Apr  4 14:06:24 boltzmann kernel: [346097.973591] nouveau 0000:01:00.0: fb:
trapped read at 0000015400 on channel 3 [0fb30000 Xorg[2270]] engine 00
[PGRAPH] client 03 [DISPATCH] subclient 00 [GRCTX] reason 0000000f
[DMAOBJ_LIMIT]
Apr  4 14:06:24 boltzmann kernel: [346097.973619] nouveau 0000:01:00.0: gr:
TRAP_DISPATCH (unknown 00000008)
Apr  4 14:06:24 boltzmann kernel: [346097.973625] nouveau 0000:01:00.0: gr:
00200030 [ILLEGAL_MTHD ILLEGAL_CLASS] ch 3 [000fb30000 Xorg[2270]] subc 2 class
0000 mthd 0230 data 000000cf
Apr  4 14:06:24 boltzmann kernel: [346097.973646] nouveau 0000:01:00.0: fb:
trapped read at 0000045600 on channel 3 [0fb30000 Xorg[2270]] engine 00
[PGRAPH] client 03 [DISPATCH] subclient 00 [GRCTX] reason 0000000f
[DMAOBJ_LIMIT]
Apr  4 14:06:24 boltzmann kernel: [346097.973666] nouveau 0000:01:00.0: gr:
00000030 [ILLEGAL_MTHD ILLEGAL_CLASS] ch 3 [000fb30000 Xorg[2270]] subc 2 class
0000 mthd 0234 data 00000000
Apr  4 14:06:24 boltzmann kernel: [346097.973684] nouveau 0000:01:00.0: gr:
00000030 [ILLEGAL_MTHD ILLEGAL_CLASS] ch 3 [000fb30000 Xorg[2270]] subc 2 class
0000 mthd 0238 data 00000040
Apr  4 14:06:24 boltzmann kernel: [346097.973708] nouveau 0000:01:00.0: gr:
00000030 [ILLEGAL_MTHD ILLEGAL_CLASS] ch 3 [000fb30000 Xorg[2270]] subc 2 class
0000 mthd 023c data 00000001
Apr  4 14:06:24 boltzmann kernel: [346097.973734] nouveau 0000:01:00.0: gr:
00000030 [ILLEGAL_MTHD ILLEGAL_CLASS] ch 3 [000fb30000 Xorg[2270]] subc 2 class
0000 mthd 0240 data 00000000
Apr  4 14:06:24 boltzmann kernel: [346097.973759] nouveau 0000:01:00.0: gr:
00000030 [ILLEGAL_MTHD ILLEGAL_CLASS] ch 3 [000fb30000 Xorg[2270]] subc 2 class
0000 mthd 0248 data 00000915

[repeats like that with different mthd/data]

I killed Xorg with -9 and could reboot cleanly (via ssh).

Any hints how to debug this?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14597723820.b22EbAbE.4904--

--===============0550563162==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0550563162==--
