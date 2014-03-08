From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 58556] MacBook Pro 5, 1 with nVidia 9400m and 9600m,
 scrambled screen
Date: Sat, 08 Mar 2014 21:31:36 +0000
Message-ID: <bug-58556-8800-5s7GaiYHvv@http.bugs.freedesktop.org/>
References: <bug-58556-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0602185374=="
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


--===============0602185374==
Content-Type: multipart/alternative; boundary="1394314296.A104D534.18220"; charset="us-ascii"


--1394314296.A104D534.18220
Date: Sat, 8 Mar 2014 21:31:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=58556

--- Comment #25 from Joanand <MacGyver031-S0/GAf8tV78@public.gmane.org> ---
(In reply to comment #24)
Hi Pierre,
I have applied/changed these lines on
driver/gpu/drm/nouveau/core/subdev/bar/nv50.c:
- line 233: int ret, i;
- line 351: for(i = 0; i < 8; i++)
- line 352: nv_wr32(priv, 0x001900 + (i * 4), 0x00000000);

Booting with both adapters enabled (9600 is the boot adapter), EFI-stub and
EFIFB, loading nouveau without acceleration:leads to scrambled screen. The
resolution is native 1440x900.

Booting with both adapters enabled (9600 is the boot adapter) EFI-stub and
EFIFB, loading nouveau with acceleration, screen/adapter is frozen. System
seems to "hang"/lag.

I am now trying the setup without EFIFB. Report back as I have tested it.

BR.

PS: Do you have a MacBook Pro 5,1 15.4"?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1394314296.A104D534.18220
Date: Sat, 8 Mar 2014 21:31:36 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58556#c25">Comment # 25</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - MacBook Pro 5,1 with nVidia 9400m and 9600m, scrambled screen"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58556">bug 58556</a>
              from <span class="vcard"><a class="email" href="mailto:MacGyver031&#64;web.de" title="Joanand &lt;MacGyver031&#64;web.de&gt;"> <span class="fn">Joanand</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=58556#c24">comment #24</a>)
Hi Pierre,
I have applied/changed these lines on
driver/gpu/drm/nouveau/core/subdev/bar/nv50.c:
- line 233: int ret, i;
- line 351: for(i = 0; i &lt; 8; i++)
- line 352: nv_wr32(priv, 0x001900 + (i * 4), 0x00000000);

Booting with both adapters enabled (9600 is the boot adapter), EFI-stub and
EFIFB, loading nouveau without acceleration:leads to scrambled screen. The
resolution is native 1440x900.

Booting with both adapters enabled (9600 is the boot adapter) EFI-stub and
EFIFB, loading nouveau with acceleration, screen/adapter is frozen. System
seems to &quot;hang&quot;/lag.

I am now trying the setup without EFIFB. Report back as I have tested it.

BR.

PS: Do you have a MacBook Pro 5,1 15.4&quot;?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1394314296.A104D534.18220--

--===============0602185374==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0602185374==--
