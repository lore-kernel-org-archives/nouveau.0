From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 80675] [NVAA] Nouveau KMS framebuffer hand-over:
 no/black console on Nvidia MCP78S/C77/GeForce 8300 (10de:0848) with 32MB
 graphics RAM, X11 ok
Date: Sat, 01 Nov 2014 10:16:26 +0000
Message-ID: <bug-80675-8800-15Q36cBxar@http.bugs.freedesktop.org/>
References: <bug-80675-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2044580721=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-80675-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2044580721==
Content-Type: multipart/alternative; boundary="1414836986.cE3eb2e2.26758"; charset="UTF-8"


--1414836986.cE3eb2e2.26758
Date: Sat, 1 Nov 2014 10:16:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=80675

--- Comment #8 from Alexey <alexey.kv-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Same issue: when KMS is just switched I can see two kerenel logos in the top
(the are not properly draw though) and after that - black console. I have same
amount of VRAM allocated in BIOS setup (32M).

02:00.0 VGA compatible controller: NVIDIA Corporation C77 [GeForce 8200] (rev
a2)
Linux hades 3.14.22-hardened-r1-grsec #2 SMP Fri Oct 31 10:48:31 EET 2014
x86_64 AMD Athlon(tm) II X2 270u Processor AuthenticAMD GNU/Linux

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1414836986.cE3eb2e2.26758
Date: Sat, 1 Nov 2014 10:16:26 +0000
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
   title="NEW - [NVAA] Nouveau KMS framebuffer hand-over: no/black console on Nvidia MCP78S/C77/GeForce 8300 (10de:0848) with 32MB graphics RAM, X11 ok"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=80675#c8">Comment # 8</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVAA] Nouveau KMS framebuffer hand-over: no/black console on Nvidia MCP78S/C77/GeForce 8300 (10de:0848) with 32MB graphics RAM, X11 ok"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=80675">bug 80675</a>
              from <span class="vcard"><a class="email" href="mailto:alexey.kv&#64;gmail.com" title="Alexey &lt;alexey.kv&#64;gmail.com&gt;"> <span class="fn">Alexey</span></a>
</span></b>
        <pre>Same issue: when KMS is just switched I can see two kerenel logos in the top
(the are not properly draw though) and after that - black console. I have same
amount of VRAM allocated in BIOS setup (32M).

02:00.0 VGA compatible controller: NVIDIA Corporation C77 [GeForce 8200] (rev
a2)
Linux hades 3.14.22-hardened-r1-grsec #2 SMP Fri Oct 31 10:48:31 EET 2014
x86_64 AMD Athlon(tm) II X2 270u Processor AuthenticAMD GNU/Linux</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1414836986.cE3eb2e2.26758--

--===============2044580721==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============2044580721==--
