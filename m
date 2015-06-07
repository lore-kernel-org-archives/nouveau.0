From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90887] PhiMovesPass in register allocator broken
Date: Sun, 07 Jun 2015 19:36:13 +0000
Message-ID: <bug-90887-8800-6KMLH5Ndge@http.bugs.freedesktop.org/>
References: <bug-90887-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0441814326=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-90887-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0441814326==
Content-Type: multipart/alternative; boundary="1433705773.B75a0.27524"; charset="UTF-8"


--1433705773.B75a0.27524
Date: Sun, 7 Jun 2015 19:36:13 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90887

--- Comment #1 from jr <j-r-BGeptl67XyCzQB+pC5nmwQ@public.gmane.org> ---
This is the minified shader I did the debugging with.

translating program of type 4
FRAG
DCL IN[0], GENERIC[9], PERSPECTIVE
DCL OUT[0], COLOR
DCL SAMP[0]
DCL TEMP[0..2], LOCAL
IMM[0] FLT32 {    0.0000,     1.9632,     0.8750,     0.0000}
  0: MOV TEMP[0].xy, IN[0].xyyy
  1: MOV TEMP[0].w, IMM[0].xxxx
  2: TXL TEMP[0].xyz, TEMP[0], SAMP[0], 2D
  3: MOV TEMP[1].xyz, TEMP[0].xyzx
  4: MAD TEMP[0].x, TEMP[0].yyyy, IMM[0].yyyy, TEMP[0].xxxx
  5: FSLT TEMP[0].x, TEMP[0].xxxx, IMM[0].zzzz
  6: UIF TEMP[0].xxxx :0
  7:   MOV TEMP[0].xy, TEMP[2].xyyy
  8:   MOV TEMP[0].w, TEMP[2].zzzz
  9:   TXL TEMP[0].xyz, TEMP[0], SAMP[0], 2D
 10:   MOV TEMP[1].xyz, TEMP[0].zyxz
 11: ENDIF
 12: MOV TEMP[0].xyz, TEMP[1].xyzx
 13: MOV TEMP[0].w, IMM[0].xxxx
 14: MOV OUT[0], TEMP[0]
 15: END

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1433705773.B75a0.27524
Date: Sun, 7 Jun 2015 19:36:13 +0000
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
   title="NEW - PhiMovesPass in register allocator broken"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90887#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - PhiMovesPass in register allocator broken"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90887">bug 90887</a>
              from <span class="vcard"><a class="email" href="mailto:j-r&#64;online.de" title="jr &lt;j-r&#64;online.de&gt;"> <span class="fn">jr</span></a>
</span></b>
        <pre>This is the minified shader I did the debugging with.

translating program of type 4
FRAG
DCL IN[0], GENERIC[9], PERSPECTIVE
DCL OUT[0], COLOR
DCL SAMP[0]
DCL TEMP[0..2], LOCAL
IMM[0] FLT32 {    0.0000,     1.9632,     0.8750,     0.0000}
  0: MOV TEMP[0].xy, IN[0].xyyy
  1: MOV TEMP[0].w, IMM[0].xxxx
  2: TXL TEMP[0].xyz, TEMP[0], SAMP[0], 2D
  3: MOV TEMP[1].xyz, TEMP[0].xyzx
  4: MAD TEMP[0].x, TEMP[0].yyyy, IMM[0].yyyy, TEMP[0].xxxx
  5: FSLT TEMP[0].x, TEMP[0].xxxx, IMM[0].zzzz
  6: UIF TEMP[0].xxxx :0
  7:   MOV TEMP[0].xy, TEMP[2].xyyy
  8:   MOV TEMP[0].w, TEMP[2].zzzz
  9:   TXL TEMP[0].xyz, TEMP[0], SAMP[0], 2D
 10:   MOV TEMP[1].xyz, TEMP[0].zyxz
 11: ENDIF
 12: MOV TEMP[0].xyz, TEMP[1].xyzx
 13: MOV TEMP[0].w, IMM[0].xxxx
 14: MOV OUT[0], TEMP[0]
 15: END</pre>
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

--1433705773.B75a0.27524--

--===============0441814326==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0441814326==--
