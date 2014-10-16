From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 85100] [NV108] Geforce GT730: X freezes during
 normal 2d operation.
Date: Thu, 16 Oct 2014 16:48:15 +0000
Message-ID: <bug-85100-8800-ZJVNup3cUh@http.bugs.freedesktop.org/>
References: <bug-85100-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1945967705=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-85100-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1945967705==
Content-Type: multipart/alternative; boundary="1413478095.74203171.29102"; charset="UTF-8"


--1413478095.74203171.29102
Date: Thu, 16 Oct 2014 16:48:15 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=85100

--- Comment #2 from nobody-freedesktop.org-e83xkrq8dvbLvtPRa3sz4w@public.gmane.org ---
I am not familiar enough with nouveau to understand what exactly is happening
there.

However it might be interesting to add that it runs fine from a users
perspective while it is outputting these log messages every few seconds.

The freeze just happens at this point:
[  570.936213] nouveau E[   PFIFO][0000:02:00.0] write fault at 0x000029f000
[PTE] from GR/GPC0/PROP_0 on channel 0x007faed000 [Xorg.bin[390]]
[  570.936222] nouveau E[   PFIFO][0000:02:00.0] PGRAPH engine fault on channel
2, recovering...
[  570.937090] nouveau E[    PBUS][0000:02:00.0] MMIO read of 0x00000000 FAULT
at 0x000260 [ TIMEOUT ]
[  570.937104] nouveau E[    PBUS][0000:02:00.0] MMIO write of 0xbad0011e FAULT
at 0x000260 [ TIMEOUT ]
[  570.937447] nouveau E[    PBUS][0000:02:00.0] MMIO write of 0xbad0011f FAULT
at 0x000260 [ TIMEOUT ]

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1413478095.74203171.29102
Date: Thu, 16 Oct 2014 16:48:15 +0000
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
   title="NEW - [NV108] Geforce GT730: X freezes during normal 2d operation."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=85100#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV108] Geforce GT730: X freezes during normal 2d operation."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=85100">bug 85100</a>
              from <span class="vcard"><a class="email" href="mailto:nobody-freedesktop.org&#64;nowhere.ws" title="nobody-freedesktop.org&#64;nowhere.ws">nobody-freedesktop.org&#64;nowhere.ws</a>
</span></b>
        <pre>I am not familiar enough with nouveau to understand what exactly is happening
there.

However it might be interesting to add that it runs fine from a users
perspective while it is outputting these log messages every few seconds.

The freeze just happens at this point:
[  570.936213] nouveau E[   PFIFO][0000:02:00.0] write fault at 0x000029f000
[PTE] from GR/GPC0/PROP_0 on channel 0x007faed000 [Xorg.bin[390]]
[  570.936222] nouveau E[   PFIFO][0000:02:00.0] PGRAPH engine fault on channel
2, recovering...
[  570.937090] nouveau E[    PBUS][0000:02:00.0] MMIO read of 0x00000000 FAULT
at 0x000260 [ TIMEOUT ]
[  570.937104] nouveau E[    PBUS][0000:02:00.0] MMIO write of 0xbad0011e FAULT
at 0x000260 [ TIMEOUT ]
[  570.937447] nouveau E[    PBUS][0000:02:00.0] MMIO write of 0xbad0011f FAULT
at 0x000260 [ TIMEOUT ]</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1413478095.74203171.29102--

--===============1945967705==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1945967705==--
