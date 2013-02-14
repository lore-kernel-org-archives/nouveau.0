From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 58378] Distorted graphics on NVIDIA GeForce 8400M G
 after upgrade the kernel to 3.7.0 version
Date: Thu, 14 Feb 2013 01:20:55 +0000
Message-ID: <bug-58378-8800-ZLFqUBtQLp@http.bugs.freedesktop.org/>
References: <bug-58378-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0448557508=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-58378-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0448557508==
Content-Type: multipart/alternative; boundary="1360804855.3e873.30600"; charset="us-ascii"


--1360804855.3e873.30600
Date: Thu, 14 Feb 2013 01:20:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=58378

--- Comment #8 from nemasu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
I am having the same problems post kernel version 3.7.0 with a GeForce 8800
GTS. Even glxgears will lock up.

I get a ton of these messages:
[   83.399004] nouveau  [   PFIFO][0000:01:00.0] CACHE_ERROR - Ch 2/3 Mthd
0x108c Data 0x2036652f

with the occasional:
[   83.418650] nouveau E[  PGRAPH][0000:01:00.0] TRAP_MP_EXEC - TP 4 MP 1:
INVALID_OPCODE at 07f4d8 warp 2, opcode 0423c788 10000811
[   83.418659] nouveau  [  PGRAPH][0000:01:00.0]  TRAP
[   83.418663] nouveau E[  PGRAPH][0000:01:00.0] ch 4 [0x0027948000] subc 3
class 0x5097 mthd 0x0f04 data 0x00000000
[   83.418672] nouveau E[     PFB][0000:01:00.0] trapped read at 0x0000000000
on channel 0x00027948 PFIFO/PFIFO_READ/SEMAPHORE reason: DMAOBJ_LIMIT
[   83.431368] nouveau E[  PGRAPH][0000:01:00.0] TRAP_MP_EXEC - TP 4 MP 1:
INVALID_OPCODE at 07f4d8 warp 2, opcode 0423c788 10000811
[   83.431376] nouveau  [  PGRAPH][0000:01:00.0]  TRAP
[   83.431379] nouveau E[  PGRAPH][0000:01:00.0] ch 4 [0x0027948000] subc 3
class 0x5097 mthd 0x0f04 data 0x00000000

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1360804855.3e873.30600
Date: Thu, 14 Feb 2013 01:20:55 +0000
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
   title="NEW --- - Distorted graphics on NVIDIA GeForce 8400M G after upgrade the kernel to 3.7.0 version"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58378#c8">Comment # 8</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Distorted graphics on NVIDIA GeForce 8400M G after upgrade the kernel to 3.7.0 version"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58378">bug 58378</a>
              from <span class="vcard"><a class="email" href="mailto:nemasu&#64;gmail.com" title="nemasu&#64;gmail.com">nemasu&#64;gmail.com</a>
</span></b>
        <pre>I am having the same problems post kernel version 3.7.0 with a GeForce 8800
GTS. Even glxgears will lock up.

I get a ton of these messages:
[   83.399004] nouveau  [   PFIFO][0000:01:00.0] CACHE_ERROR - Ch 2/3 Mthd
0x108c Data 0x2036652f

with the occasional:
[   83.418650] nouveau E[  PGRAPH][0000:01:00.0] TRAP_MP_EXEC - TP 4 MP 1:
INVALID_OPCODE at 07f4d8 warp 2, opcode 0423c788 10000811
[   83.418659] nouveau  [  PGRAPH][0000:01:00.0]  TRAP
[   83.418663] nouveau E[  PGRAPH][0000:01:00.0] ch 4 [0x0027948000] subc 3
class 0x5097 mthd 0x0f04 data 0x00000000
[   83.418672] nouveau E[     PFB][0000:01:00.0] trapped read at 0x0000000000
on channel 0x00027948 PFIFO/PFIFO_READ/SEMAPHORE reason: DMAOBJ_LIMIT
[   83.431368] nouveau E[  PGRAPH][0000:01:00.0] TRAP_MP_EXEC - TP 4 MP 1:
INVALID_OPCODE at 07f4d8 warp 2, opcode 0423c788 10000811
[   83.431376] nouveau  [  PGRAPH][0000:01:00.0]  TRAP
[   83.431379] nouveau E[  PGRAPH][0000:01:00.0] ch 4 [0x0027948000] subc 3
class 0x5097 mthd 0x0f04 data 0x00000000</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1360804855.3e873.30600--

--===============0448557508==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0448557508==--
