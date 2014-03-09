From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 58556] MacBook Pro 5, 1 with nVidia 9400m and 9600m,
 scrambled screen
Date: Sun, 09 Mar 2014 10:36:30 +0000
Message-ID: <bug-58556-8800-nv9UHdRJhN@http.bugs.freedesktop.org/>
References: <bug-58556-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1394689842=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-58556-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1394689842==
Content-Type: multipart/alternative; boundary="1394361390.6b4B37A4.14878"; charset="us-ascii"


--1394361390.6b4B37A4.14878
Date: Sun, 9 Mar 2014 10:36:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=58556

--- Comment #27 from krestfallen-KvP5wT2u2U0@public.gmane.org ---
(In reply to comment #25)

> Booting with both adapters enabled (9600 is the boot adapter), EFI-stub and
> EFIFB, loading nouveau without acceleration:leads to scrambled screen. The
> resolution is native 1440x900.
> 
> Booting with both adapters enabled (9600 is the boot adapter) EFI-stub and
> EFIFB, loading nouveau with acceleration, screen/adapter is frozen. System
> seems to "hang"/lag.

doesn't efifb wants to pick the 9400M?

efifb pics the framebuffer base at 0xC0010000
from efifb.c:
  [M_MBP_5_1] = { "mbp5,1", 0xc0010000, 2048 * 4, 1440, 900 }

these are the values for each gpu:
9400M:    0xC0010000
9600M GT: 0xB0030000

i tried nouveau yesterday and couldn't even load the kernel. with the nvidia
driver it's even possible to switch to the desired gpu on boot. but with the
9400m screening and logging out afterwards and back in (no reboot) the screen
also gets scrambled, slow and unstable.

perhaps it's something with the gmux values or memory allocation!?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1394361390.6b4B37A4.14878
Date: Sun, 9 Mar 2014 10:36:30 +0000
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
          bz_status_REOPENED "
   title="REOPENED --- - MacBook Pro 5,1 with nVidia 9400m and 9600m, scrambled screen"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58556#c27">Comment # 27</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - MacBook Pro 5,1 with nVidia 9400m and 9600m, scrambled screen"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58556">bug 58556</a>
              from <span class="vcard"><a class="email" href="mailto:krestfallen&#64;arcor.de" title="krestfallen&#64;arcor.de">krestfallen&#64;arcor.de</a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=58556#c25">comment #25</a>)

<span class="quote">&gt; Booting with both adapters enabled (9600 is the boot adapter), EFI-stub and
&gt; EFIFB, loading nouveau without acceleration:leads to scrambled screen. The
&gt; resolution is native 1440x900.
&gt; 
&gt; Booting with both adapters enabled (9600 is the boot adapter) EFI-stub and
&gt; EFIFB, loading nouveau with acceleration, screen/adapter is frozen. System
&gt; seems to &quot;hang&quot;/lag.</span >

doesn't efifb wants to pick the 9400M?

efifb pics the framebuffer base at 0xC0010000
from efifb.c:
  [M_MBP_5_1] = { &quot;mbp5,1&quot;, 0xc0010000, 2048 * 4, 1440, 900 }

these are the values for each gpu:
9400M:    0xC0010000
9600M GT: 0xB0030000

i tried nouveau yesterday and couldn't even load the kernel. with the nvidia
driver it's even possible to switch to the desired gpu on boot. but with the
9400m screening and logging out afterwards and back in (no reboot) the screen
also gets scrambled, slow and unstable.

perhaps it's something with the gmux values or memory allocation!?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1394361390.6b4B37A4.14878--

--===============1394689842==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1394689842==--
