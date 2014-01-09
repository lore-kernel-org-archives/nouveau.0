From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 58378] [NV86] Distorted graphics on NVIDIA GeForce
 8400M G after upgrade the kernel to 3.7.0 version
Date: Thu, 09 Jan 2014 22:03:57 +0000
Message-ID: <bug-58378-8800-wcVVMqoGdk@http.bugs.freedesktop.org/>
References: <bug-58378-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0560386199=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-58378-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0560386199==
Content-Type: multipart/alternative; boundary="1389305037.c0BeA6e5.4175"; charset="us-ascii"


--1389305037.c0BeA6e5.4175
Date: Thu, 9 Jan 2014 22:03:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=58378

--- Comment #77 from Andreas Loew <awl1-hi6Y0CQ0nG0@public.gmane.org> ---
Sorry that it took me longer to get back here - I needed an additional rpmbuild
run due to running out of disk space for my first attempt...

But I can give an all clear signal - at least for my machine, AFAIK, everything
seems to be fine:

Kernel command line: ro root=UUID=034d34cd-a464-4ee3-8db9-d6061a318a16
rd_NO_LUKS LANG=en_US.UTF-8  KEYBOARDTYPE=pc KEYTABLE=de-latin1-nodeadkeys
rd_NO_MD SYSFONT=latarcyrheb-sun16 rd_NO_LVM rd_NO_DM nouveau.debug=debug rhgb
quiet

nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x086a00a2
nouveau  [  DEVICE][0000:01:00.0] Chipset: G86 (NV86)
nouveau  [  DEVICE][0000:01:00.0] Family : NV50
nouveau  [   VBIOS][0000:01:00.0] checking PRAMIN for image...
nouveau  [   VBIOS][0000:01:00.0] ... appears to be valid
nouveau  [   VBIOS][0000:01:00.0] using image from PRAMIN
nouveau  [   VBIOS][0000:01:00.0] BIT signature found
nouveau  [   VBIOS][0000:01:00.0] version 60.86.49.00.27
(...)
nouveau  [   PMPEG][0000:01:00.0] hardware is marked as disabled
nouveau  [     PVP][0000:01:00.0] hardware is marked as disabled
nouveau  [  PCRYPT][0000:01:00.0] hardware is marked as disabled
nouveau  [    PBSP][0000:01:00.0] hardware is marked as disabled

and also, everything is fine afterwards (as PCRYPT seems to indeed have been
properly disabled). :-)

What do you say? Do you agree that everything turned out as expected from my
nvpeek results?

Thanks & BR,
Andreas

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1389305037.c0BeA6e5.4175
Date: Thu, 9 Jan 2014 22:03:57 +0000
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
   title="NEW --- - [NV86] Distorted graphics on NVIDIA GeForce 8400M G after upgrade the kernel to 3.7.0 version"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58378#c77">Comment # 77</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV86] Distorted graphics on NVIDIA GeForce 8400M G after upgrade the kernel to 3.7.0 version"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58378">bug 58378</a>
              from <span class="vcard"><a class="email" href="mailto:awl1&#64;gmx.net" title="Andreas Loew &lt;awl1&#64;gmx.net&gt;"> <span class="fn">Andreas Loew</span></a>
</span></b>
        <pre>Sorry that it took me longer to get back here - I needed an additional rpmbuild
run due to running out of disk space for my first attempt...

But I can give an all clear signal - at least for my machine, AFAIK, everything
seems to be fine:

Kernel command line: ro root=UUID=034d34cd-a464-4ee3-8db9-d6061a318a16
rd_NO_LUKS LANG=en_US.UTF-8  KEYBOARDTYPE=pc KEYTABLE=de-latin1-nodeadkeys
rd_NO_MD SYSFONT=latarcyrheb-sun16 rd_NO_LVM rd_NO_DM nouveau.debug=debug rhgb
quiet

nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x086a00a2
nouveau  [  DEVICE][0000:01:00.0] Chipset: G86 (NV86)
nouveau  [  DEVICE][0000:01:00.0] Family : NV50
nouveau  [   VBIOS][0000:01:00.0] checking PRAMIN for image...
nouveau  [   VBIOS][0000:01:00.0] ... appears to be valid
nouveau  [   VBIOS][0000:01:00.0] using image from PRAMIN
nouveau  [   VBIOS][0000:01:00.0] BIT signature found
nouveau  [   VBIOS][0000:01:00.0] version 60.86.49.00.27
(...)
nouveau  [   PMPEG][0000:01:00.0] hardware is marked as disabled
nouveau  [     PVP][0000:01:00.0] hardware is marked as disabled
nouveau  [  PCRYPT][0000:01:00.0] hardware is marked as disabled
nouveau  [    PBSP][0000:01:00.0] hardware is marked as disabled

and also, everything is fine afterwards (as PCRYPT seems to indeed have been
properly disabled). :-)

What do you say? Do you agree that everything turned out as expected from my
nvpeek results?

Thanks &amp; BR,
Andreas</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1389305037.c0BeA6e5.4175--

--===============0560386199==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0560386199==--
