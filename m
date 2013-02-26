From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 59168] [nvc1/Quardro1000M|nvc3/Quadro2000M] graphic
 garbage/corruption/noise on resume
Date: Tue, 26 Feb 2013 14:15:55 +0000
Message-ID: <bug-59168-8800-zZ2psnuzU2@http.bugs.freedesktop.org/>
References: <bug-59168-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2102340202=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-59168-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2102340202==
Content-Type: multipart/alternative; boundary="1361888155.0Edb15.12789"; charset="us-ascii"


--1361888155.0Edb15.12789
Date: Tue, 26 Feb 2013 14:15:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=59168

--- Comment #26 from Petr Stastny <p.stastny-Mmb7MZpHnFY@public.gmane.org> ---
Just compiled 3.8.0 and tested suspend resume. Although the resume is still not
working, there are some changes. The error messages do not repeat endlessly
anymore, instead I get:

[   97.941502] PM: Finishing wakeup.
[   97.942484] usb 2-1.4: USB disconnect, device number 3
[   97.941503] Restarting tasks ... done.
[   97.942949] video LNXVIDEO:01: Restoring backlight state
[   97.943075] nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 1 [0x007fe00000]
[   97.943120] nouveau E[  PGRAPH][0000:01:00.0] SHADER 0xa0040800
[   97.944405] cdc_ncm 2-1.4:1.6 wwan0: unregister 'cdc_ncm'
usb-0000:00:1d.0-1.4, Mobile Broadband Network Device
[   97.944885] nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 1 [0x007fe00000]
[   97.944897] nouveau E[  PGRAPH][0000:01:00.0] SHADER 0xa0040800
[   97.944976] nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 1 [0x007fe00000]
[   97.944985] nouveau E[  PGRAPH][0000:01:00.0] SHADER 0xa0040800
[   97.945063] nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 1 [0x007fe00000]
[   97.945071] nouveau E[  PGRAPH][0000:01:00.0] SHADER 0xa0040800
[   97.945155] nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 1 [0x007fe00000]
[   97.945164] nouveau E[  PGRAPH][0000:01:00.0] SHADER 0xa0040800
[   97.945237] nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 1 [0x007fe00000]
[   97.945246] nouveau E[  PGRAPH][0000:01:00.0] SHADER 0xa0040800
[   97.945429] nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 1 [0x007fe00000]
[   97.945435] nouveau E[  PGRAPH][0000:01:00.0] SHADER 0xa0040800
[   98.168304] usb 2-1.4: new high-speed USB device number 4 using ehci-pci
[   98.303689] cdc_acm 2-1.4:1.1: ttyACM0: USB ACM device
[   98.307171] cdc_acm 2-1.4:1.3: ttyACM1: USB ACM device
[   98.315544] cdc_wdm 2-1.4:1.5: cdc-wdm0: USB WDM device
[   98.331090] usb 2-1.4: MAC-Address: 02:80:37:ec:02:00
[   98.331590] cdc_ncm 2-1.4:1.6 wwan0: register 'cdc_ncm' at
usb-0000:00:1d.0-1.4, Mobile Broadband Network Device, 02:80:37:ec:02:00
[   98.332666] cdc_wdm 2-1.4:1.8: cdc-wdm1: USB WDM device
[   98.333153] cdc_acm 2-1.4:1.9: ttyACM2: USB ACM device
[   98.500834] e1000e 0000:00:19.0: irq 53 for MSI/MSI-X
[   98.603498] e1000e 0000:00:19.0: irq 53 for MSI/MSI-X
[   98.604001] IPv6: ADDRCONF(NETDEV_UP): eth0: link is not ready
[   99.289242] IPv6: ADDRCONF(NETDEV_UP): wwan0: link is not ready
[   99.291621] cdc_ncm: wwan0: network connection: disconnected
[  104.358920] e1000e: eth0 NIC Link is Up 1000 Mbps Full Duplex, Flow Control:
Rx/Tx
[  104.359024] IPv6: ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready
[  134.407906] nouveau E[    1268] failed to idle channel 0xcccc0000

Notice the "failed to idle channel"
Restarting X after this does not work - nouveau complains about some not
existing pages - I do not have the dmesg for this now, I try to get it later.

Coming from hibernate I get:

[  365.858983] nouveau E[   PDISP][0000:01:00.0][0xc000857b][ffff88022c468e00]
timeout1: 0x00000000
[  365.858985] nouveau E[   PDISP][0000:01:00.0][0xc000857b][ffff88022c468e00]
init failed, -16
[  365.858993] nouveau E[     DRM] 0xdddddddd:0xd1500000 init failed with -16
[  365.859383] nouveau E[     DRM] 0xffffffff:0xdddddddd init failed with -16
[  365.859682] nouveau E[     DRM] 0xffffffff:0xffffffff init failed with -16
[  365.859695] nouveau  [   VBIOS][0000:01:00.0] running init tables
[  365.865846] e1000e: eth0 NIC Link is Up 1000 Mbps Full Duplex, Flow Control:
Rx/Tx
[  367.937496] nouveau  [     DRM] resuming display...

Should I go and try with the current nouveau from git?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1361888155.0Edb15.12789
Date: Tue, 26 Feb 2013 14:15:55 +0000
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
   title="NEW --- - [nvc1/Quardro1000M|nvc3/Quadro2000M] graphic garbage/corruption/noise on resume"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59168#c26">Comment # 26</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [nvc1/Quardro1000M|nvc3/Quadro2000M] graphic garbage/corruption/noise on resume"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59168">bug 59168</a>
              from <span class="vcard"><a class="email" href="mailto:p.stastny&#64;gmx.de" title="Petr Stastny &lt;p.stastny&#64;gmx.de&gt;"> <span class="fn">Petr Stastny</span></a>
</span></b>
        <pre>Just compiled 3.8.0 and tested suspend resume. Although the resume is still not
working, there are some changes. The error messages do not repeat endlessly
anymore, instead I get:

[   97.941502] PM: Finishing wakeup.
[   97.942484] usb 2-1.4: USB disconnect, device number 3
[   97.941503] Restarting tasks ... done.
[   97.942949] video LNXVIDEO:01: Restoring backlight state
[   97.943075] nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 1 [0x007fe00000]
[   97.943120] nouveau E[  PGRAPH][0000:01:00.0] SHADER 0xa0040800
[   97.944405] cdc_ncm 2-1.4:1.6 wwan0: unregister 'cdc_ncm'
usb-0000:00:1d.0-1.4, Mobile Broadband Network Device
[   97.944885] nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 1 [0x007fe00000]
[   97.944897] nouveau E[  PGRAPH][0000:01:00.0] SHADER 0xa0040800
[   97.944976] nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 1 [0x007fe00000]
[   97.944985] nouveau E[  PGRAPH][0000:01:00.0] SHADER 0xa0040800
[   97.945063] nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 1 [0x007fe00000]
[   97.945071] nouveau E[  PGRAPH][0000:01:00.0] SHADER 0xa0040800
[   97.945155] nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 1 [0x007fe00000]
[   97.945164] nouveau E[  PGRAPH][0000:01:00.0] SHADER 0xa0040800
[   97.945237] nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 1 [0x007fe00000]
[   97.945246] nouveau E[  PGRAPH][0000:01:00.0] SHADER 0xa0040800
[   97.945429] nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 1 [0x007fe00000]
[   97.945435] nouveau E[  PGRAPH][0000:01:00.0] SHADER 0xa0040800
[   98.168304] usb 2-1.4: new high-speed USB device number 4 using ehci-pci
[   98.303689] cdc_acm 2-1.4:1.1: ttyACM0: USB ACM device
[   98.307171] cdc_acm 2-1.4:1.3: ttyACM1: USB ACM device
[   98.315544] cdc_wdm 2-1.4:1.5: cdc-wdm0: USB WDM device
[   98.331090] usb 2-1.4: MAC-Address: 02:80:37:ec:02:00
[   98.331590] cdc_ncm 2-1.4:1.6 wwan0: register 'cdc_ncm' at
usb-0000:00:1d.0-1.4, Mobile Broadband Network Device, 02:80:37:ec:02:00
[   98.332666] cdc_wdm 2-1.4:1.8: cdc-wdm1: USB WDM device
[   98.333153] cdc_acm 2-1.4:1.9: ttyACM2: USB ACM device
[   98.500834] e1000e 0000:00:19.0: irq 53 for MSI/MSI-X
[   98.603498] e1000e 0000:00:19.0: irq 53 for MSI/MSI-X
[   98.604001] IPv6: ADDRCONF(NETDEV_UP): eth0: link is not ready
[   99.289242] IPv6: ADDRCONF(NETDEV_UP): wwan0: link is not ready
[   99.291621] cdc_ncm: wwan0: network connection: disconnected
[  104.358920] e1000e: eth0 NIC Link is Up 1000 Mbps Full Duplex, Flow Control:
Rx/Tx
[  104.359024] IPv6: ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready
[  134.407906] nouveau E[    1268] failed to idle channel 0xcccc0000

Notice the &quot;failed to idle channel&quot;
Restarting X after this does not work - nouveau complains about some not
existing pages - I do not have the dmesg for this now, I try to get it later.

Coming from hibernate I get:

[  365.858983] nouveau E[   PDISP][0000:01:00.0][0xc000857b][ffff88022c468e00]
timeout1: 0x00000000
[  365.858985] nouveau E[   PDISP][0000:01:00.0][0xc000857b][ffff88022c468e00]
init failed, -16
[  365.858993] nouveau E[     DRM] 0xdddddddd:0xd1500000 init failed with -16
[  365.859383] nouveau E[     DRM] 0xffffffff:0xdddddddd init failed with -16
[  365.859682] nouveau E[     DRM] 0xffffffff:0xffffffff init failed with -16
[  365.859695] nouveau  [   VBIOS][0000:01:00.0] running init tables
[  365.865846] e1000e: eth0 NIC Link is Up 1000 Mbps Full Duplex, Flow Control:
Rx/Tx
[  367.937496] nouveau  [     DRM] resuming display...

Should I go and try with the current nouveau from git?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1361888155.0Edb15.12789--

--===============2102340202==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2102340202==--
