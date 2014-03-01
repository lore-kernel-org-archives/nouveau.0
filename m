From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75569] [nv34] [v3.14-rc3] DMA_PUSHER get 0x00029044
 put 0x000184d0 state 0x80000040 (err: INVALID_CMD) push 0x00000000
Date: Sat, 01 Mar 2014 06:40:36 +0000
Message-ID: <bug-75569-8800-pVNyTeRKPt@http.bugs.freedesktop.org/>
References: <bug-75569-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0591195457=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-75569-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0591195457==
Content-Type: multipart/alternative; boundary="1393656036.58e52.12480"; charset="us-ascii"


--1393656036.58e52.12480
Date: Sat, 1 Mar 2014 06:40:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=75569

--- Comment #4 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
You can do nouveau.agpmode=0 to disable agp entirely. An intermediate option if
you're not seeing any real corruption, but the pushbuf is getting occasionally
corrupted, you can do nouveau.vram_pushbuf=1 which will make sure that the
pushbuf is in vram as opposed to the (AGP) GART memory.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1393656036.58e52.12480
Date: Sat, 1 Mar 2014 06:40:36 +0000
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
   title="NEW --- - [nv34] [v3.14-rc3] DMA_PUSHER get 0x00029044 put 0x000184d0 state 0x80000040 (err: INVALID_CMD) push 0x00000000"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75569#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [nv34] [v3.14-rc3] DMA_PUSHER get 0x00029044 put 0x000184d0 state 0x80000040 (err: INVALID_CMD) push 0x00000000"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75569">bug 75569</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>You can do nouveau.agpmode=0 to disable agp entirely. An intermediate option if
you're not seeing any real corruption, but the pushbuf is getting occasionally
corrupted, you can do nouveau.vram_pushbuf=1 which will make sure that the
pushbuf is in vram as opposed to the (AGP) GART memory.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1393656036.58e52.12480--

--===============0591195457==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0591195457==--
