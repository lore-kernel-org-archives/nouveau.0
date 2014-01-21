From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 21273] [NV17] PowerMac3,
 6 Driver can't detect video output and xserver doesn't start
Date: Tue, 21 Jan 2014 17:40:16 +0000
Message-ID: <bug-21273-8800-p12HzbIiq9@http.bugs.freedesktop.org/>
References: <bug-21273-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0740775770=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-21273-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0740775770==
Content-Type: multipart/alternative; boundary="1390326016.FB3a61.16832"; charset="us-ascii"


--1390326016.FB3a61.16832
Date: Tue, 21 Jan 2014 17:40:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=21273

--- Comment #97 from Andrey Gusev <ronne-cmBhpYW9OiY@public.gmane.org> ---
I made reboot or shutdown. There isn't difference. I want to pay attention,
than nvidiafb works perfect. May be it output can give a hint.
[    0.442165] nvidiafb: Device ID: 10de0172 
[    0.446576] nvidiafb: CRTC0 analog not found
[    0.450534] nvidiafb: CRTC1 analog not found
[    0.527317] i2c i2c-0: unable to read EDID block.
[    0.646311] i2c i2c-0: unable to read EDID block.
[    0.765310] i2c i2c-0: unable to read EDID block.
[    1.021533] nvidiafb: EDID found from BUS2
[    1.021579] nvidiafb: CRTC 1 is currently programmed for DFP
[    1.021598] nvidiafb: Using DFP on CRTC 1
[    1.021615] nvidiafb: Panel size is 1600 x 1200
[    1.021633] nvidiafb: Panel is TMDS
[    1.023208] nvidiafb: Flat panel dithering disabled
[    1.030025] Console: switching to colour frame buffer device 200x75
[    1.037505] nvidiafb: PCI nVidia NV17 framebuffer (32MB @ 0x98000000)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1390326016.FB3a61.16832
Date: Tue, 21 Jan 2014 17:40:16 +0000
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
   title="NEW --- - [NV17] PowerMac3,6 Driver can't detect video output and xserver doesn't start"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=21273#c97">Comment # 97</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV17] PowerMac3,6 Driver can't detect video output and xserver doesn't start"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=21273">bug 21273</a>
              from <span class="vcard"><a class="email" href="mailto:ronne&#64;list.ru" title="Andrey Gusev &lt;ronne&#64;list.ru&gt;"> <span class="fn">Andrey Gusev</span></a>
</span></b>
        <pre>I made reboot or shutdown. There isn't difference. I want to pay attention,
than nvidiafb works perfect. May be it output can give a hint.
[    0.442165] nvidiafb: Device ID: 10de0172 
[    0.446576] nvidiafb: CRTC0 analog not found
[    0.450534] nvidiafb: CRTC1 analog not found
[    0.527317] i2c i2c-0: unable to read EDID block.
[    0.646311] i2c i2c-0: unable to read EDID block.
[    0.765310] i2c i2c-0: unable to read EDID block.
[    1.021533] nvidiafb: EDID found from BUS2
[    1.021579] nvidiafb: CRTC 1 is currently programmed for DFP
[    1.021598] nvidiafb: Using DFP on CRTC 1
[    1.021615] nvidiafb: Panel size is 1600 x 1200
[    1.021633] nvidiafb: Panel is TMDS
[    1.023208] nvidiafb: Flat panel dithering disabled
[    1.030025] Console: switching to colour frame buffer device 200x75
[    1.037505] nvidiafb: PCI nVidia NV17 framebuffer (32MB &#64; 0x98000000)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1390326016.FB3a61.16832--

--===============0740775770==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0740775770==--
