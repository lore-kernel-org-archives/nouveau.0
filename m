From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 79823] [NV30/gallium] Mozilla apps freeze on startup
 with nouveau-dri-10.2.1 libs on dual-screen
Date: Tue, 10 Jun 2014 07:54:17 +0000
Message-ID: <bug-79823-8800-7tgzO9Odzv@http.bugs.freedesktop.org/>
References: <bug-79823-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1470403005=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-79823-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1470403005==
Content-Type: multipart/alternative; boundary="1402386857.282EC5530.32484"; charset="us-ascii"


--1402386857.282EC5530.32484
Date: Tue, 10 Jun 2014 07:54:17 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=79823

--- Comment #6 from Natrio <natrio-cmBhpYW9OiY@public.gmane.org> ---
From freeze strace log:

 # Device opened:
open("/dev/dri/card0", O_RDWR|O_CLOEXEC) = 5
 ...
close(5)                    = 0
 # device /dev/dri/card0 closed, but trying to use already closed descriptor:
fstat64(5, 0xbfa97f60)      = -1 EBADF (Bad file descriptor)
ioctl(5, 0xc0406481, 0xbfa97fc0) = -1 EBADF (Bad file descriptor)
write(2, "nouveau: kernel rejected pushbuf"..., 54) = 54
write(2, "nouveau: ch0: krec 0 pushes 1 bu"..., 46) = 46
write(2, "nouveau: ch0: buf 00000000 00000"..., 63) = 63
write(2, "nouveau: ch0: psh 00000000 00000"..., 49) = 49
write(2, "nouveau: \t0x0008fd6c\n", 21) = 21
write(2, "nouveau: \t0x00000000\n", 21) = 21
write(2, "nouveau: \t0x00000003\n", 21) = 21
write(2, "nouveau: \t0x00020000\n", 21) = 21
write(2, "nouveau: \t0x00000000\n", 21) = 21

 # Cycling infinitely
sched_yield()               = 0
sched_yield()               = 0
sched_yield()               = 0
 ...

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1402386857.282EC5530.32484
Date: Tue, 10 Jun 2014 07:54:17 +0000
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
   title="NEW --- - [NV30/gallium] Mozilla apps freeze on startup with nouveau-dri-10.2.1 libs on dual-screen"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=79823#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV30/gallium] Mozilla apps freeze on startup with nouveau-dri-10.2.1 libs on dual-screen"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=79823">bug 79823</a>
              from <span class="vcard"><a class="email" href="mailto:natrio&#64;list.ru" title="Natrio &lt;natrio&#64;list.ru&gt;"> <span class="fn">Natrio</span></a>
</span></b>
        <pre>From freeze strace log:

 # Device opened:
open(&quot;/dev/dri/card0&quot;, O_RDWR|O_CLOEXEC) = 5
 ...
close(5)                    = 0
 # device /dev/dri/card0 closed, but trying to use already closed descriptor:
fstat64(5, 0xbfa97f60)      = -1 EBADF (Bad file descriptor)
ioctl(5, 0xc0406481, 0xbfa97fc0) = -1 EBADF (Bad file descriptor)
write(2, &quot;nouveau: kernel rejected pushbuf&quot;..., 54) = 54
write(2, &quot;nouveau: ch0: krec 0 pushes 1 bu&quot;..., 46) = 46
write(2, &quot;nouveau: ch0: buf 00000000 00000&quot;..., 63) = 63
write(2, &quot;nouveau: ch0: psh 00000000 00000&quot;..., 49) = 49
write(2, &quot;nouveau: \t0x0008fd6c\n&quot;, 21) = 21
write(2, &quot;nouveau: \t0x00000000\n&quot;, 21) = 21
write(2, &quot;nouveau: \t0x00000003\n&quot;, 21) = 21
write(2, &quot;nouveau: \t0x00020000\n&quot;, 21) = 21
write(2, &quot;nouveau: \t0x00000000\n&quot;, 21) = 21

 # Cycling infinitely
sched_yield()               = 0
sched_yield()               = 0
sched_yield()               = 0
 ...</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1402386857.282EC5530.32484--

--===============1470403005==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1470403005==--
