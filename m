From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 54700] Distorted graphics (double cursor) with
 GeForce 4200Go (NV28)
Date: Wed, 31 Jul 2013 07:29:33 +0000
Message-ID: <bug-54700-8800-kkNa2nzZiF@http.bugs.freedesktop.org/>
References: <bug-54700-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0287472604=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-54700-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0287472604==
Content-Type: multipart/alternative; boundary="1375255773.2C801.20390"; charset="us-ascii"


--1375255773.2C801.20390
Date: Wed, 31 Jul 2013 07:29:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=54700

--- Comment #49 from r.ductor-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
(In reply to comment #48)
> 1. Startup X with SWCursor, by adding "Option "HWCursor" "O"" in your
> xorg.conf(see $man nouveau for more information)
> Does the cursor render properly ?

YES :)

> 2. Make sure nouveau_vieux_dri.so is available and confirm that you have 3d
> acceleration $ glxinfo | grep render
> The above command should give you
> * direct rendering: Yes
> * OpenGL renderer string: Mesa DRI nv28 *****
> Startup glxgears and adjust the window size and note when corruption does
> and does not occur

nouveau_vieux_dri.so OK

glxinfo OK

NO signs of corruption in glxgears from a tiny window to a full screen ... but
resizing glxgears I had X freeze twice, see below

cheers
ric

root:/etc/X11/xorg.conf.d# cat nouveau.conf 
Section "Device"
Identifier "Device0"
Driver "nouveau"
Option "HWCursor" "0"
EndSection

root:# ls /usr/lib/i386-linux-gnu/dri/nouveau_vieux_dri.so
/usr/lib/i386-linux-gnu/dri/nouveau_vieux_dri.so

$ glxinfo | grep render
direct rendering: Yes                                                           
OpenGL renderer string: Mesa DRI nv28 x86/MMX/SSE2  

dmesg:
....
[   29.568428] Bluetooth: RFCOMM socket layer initialized
[   29.568438] Bluetooth: RFCOMM ver 1.11
[   29.638047] Bluetooth: BNEP (Ethernet Emulation) ver 1.3
[   29.638059] Bluetooth: BNEP filters: protocol multicast
[   29.638087] Bluetooth: BNEP socket layer initialized
[   29.816224] b44 ssb0:0 eth0: Link is up at 100 Mbps, full duplex
[   29.816239] b44 ssb0:0 eth0: Flow control is off for TX and off for RX
[   29.816324] IPv6: ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready
[   31.339168] lp0: using parport0 (interrupt-driven).
[   31.364755] ppdev: user-space parallel port driver
[  501.620039] nouveau E[Xorg[2328]] reloc wait_idle failed: -16
[  501.620056] nouveau E[Xorg[2328]] reloc apply: -16
[  501.624016] [sched_delayed] sched: RT throttling activated
[  504.628042] nouveau E[Xorg[2328]] reloc wait_idle failed: -16
[  504.628057] nouveau E[Xorg[2328]] reloc apply: -16
[  507.628030] nouveau E[Xorg[2328]] reloc wait_idle failed: -16
[  507.628039] nouveau E[Xorg[2328]] reloc apply: -16
[  511.028041] nouveau E[Xorg[2328]] reloc wait_idle failed: -16
[  511.028057] nouveau E[Xorg[2328]] reloc apply: -16
[  514.036040] nouveau E[Xorg[2328]] reloc wait_idle failed: -16
[  514.036054] nouveau E[Xorg[2328]] reloc apply: -16
[  517.040030] nouveau E[Xorg[2328]] reloc wait_idle failed: -16
[  517.040040] nouveau E[Xorg[2328]] reloc apply: -16
[  520.040028] nouveau E[Xorg[2328]] reloc wait_idle failed: -16
[  520.040038] nouveau E[Xorg[2328]] reloc apply: -16
[  523.044030] nouveau E[Xorg[2328]] reloc wait_idle failed: -16
[  523.044039] nouveau E[Xorg[2328]] reloc apply: -16                           
[  532.112094] nouveau  [     DRM] Calling LVDS script 6:                       
[  532.112101] nouveau  [     DRM] 0xDFB9: Parsing digital output script table  
[  532.698125] nouveau  [     DRM] Calling LVDS script 2:                       
[  532.698131] nouveau  [     DRM] 0xDFE7: Parsing digital output script table  
[  532.714020] nouveau  [     DRM] Calling LVDS script 5:                       
[  532.714026] nouveau  [     DRM] 0xDF32: Parsing digital output script table  
[  533.015868] nouveau E[     DRM] GPU lockup - switching to software fbcon     
[  539.148515] nouveau  [     DRM] Calling LVDS script 6:                       
[  539.148531] nouveau  [     DRM] 0xDFB9: Parsing digital output script table
[  539.734534] nouveau  [     DRM] Calling LVDS script 2:
[  539.734545] nouveau  [     DRM] 0xDFE7: Parsing digital output script table
[  539.750439] nouveau  [     DRM] Calling LVDS script 5:
[  539.750449] nouveau  [     DRM] 0xDF32: Parsing digital output script table
[  542.968042] nouveau E[Xorg[2328]] failed to idle channel 0xcccc0000
[Xorg[2328]]
[  545.992030] nouveau E[Xorg[2328]] failed to idle channel 0xcccc0000
[Xorg[2328]]
[  546.009560] nouveau  [     DRM] Calling LVDS script 6:
[  546.009569] nouveau  [     DRM] 0xDFB9: Parsing digital output script table
[  549.752032] nouveau E[glxgears[3681]] failed to idle channel 0xcccc0000
[glxgears[3681]]
[  552.772032] nouveau E[glxgears[3681]] failed to idle channel 0xcccc0000
[glxgears[3681]]
[  553.528020] nouveau E[  PGRAPH][0000:01:00.0] idle timed out with status
0x10000501
[  553.850753] nouveau E[  PGRAPH][0000:01:00.0] idle timed out with status
0x10000501
[  554.170128] nouveau E[  PGRAPH][0000:01:00.0] idle timed out with status
0x10000501
[  554.500032] nouveau E[  PGRAPH][0000:01:00.0] idle timed out with status
0x10000501
[  554.878554] nouveau  [     DRM] Calling LVDS script 2:
[  554.878563] nouveau  [     DRM] 0xDFE7: Parsing digital output script table
[  554.894451] nouveau  [     DRM] Calling LVDS script 5:
[  554.894457] nouveau  [     DRM] 0xDF32: Parsing digital output script table
[  558.247972] nouveau  [     DRM] Calling LVDS script 6:
[  558.247980] nouveau  [     DRM] 0xDFB9: Parsing digital output script table
[  558.833993] nouveau  [     DRM] Calling LVDS script 2:
[  558.833998] nouveau  [     DRM] 0xDFE7: Parsing digital output script table
[  558.849888] nouveau  [     DRM] Calling LVDS script 5:
[  558.849894] nouveau  [     DRM] 0xDF32: Parsing digital output script table

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1375255773.2C801.20390
Date: Wed, 31 Jul 2013 07:29:33 +0000
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
   title="NEW --- - Distorted graphics (double cursor) with GeForce 4200Go (NV28)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=54700#c49">Comment # 49</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Distorted graphics (double cursor) with GeForce 4200Go (NV28)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=54700">bug 54700</a>
              from <span class="vcard"><a class="email" href="mailto:r.ductor&#64;gmail.com" title="r.ductor&#64;gmail.com">r.ductor&#64;gmail.com</a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=54700#c48">comment #48</a>)
<span class="quote">&gt; 1. Startup X with SWCursor, by adding &quot;Option &quot;HWCursor&quot; &quot;O&quot;&quot; in your
&gt; xorg.conf(see $man nouveau for more information)
&gt; Does the cursor render properly ?</span >

YES :)

<span class="quote">&gt; 2. Make sure nouveau_vieux_dri.so is available and confirm that you have 3d
&gt; acceleration $ glxinfo | grep render
&gt; The above command should give you
&gt; * direct rendering: Yes
&gt; * OpenGL renderer string: Mesa DRI nv28 *****
&gt; Startup glxgears and adjust the window size and note when corruption does
&gt; and does not occur</span >

nouveau_vieux_dri.so OK

glxinfo OK

NO signs of corruption in glxgears from a tiny window to a full screen ... but
resizing glxgears I had X freeze twice, see below

cheers
ric

root:/etc/X11/xorg.conf.d# cat nouveau.conf 
Section &quot;Device&quot;
Identifier &quot;Device0&quot;
Driver &quot;nouveau&quot;
Option &quot;HWCursor&quot; &quot;0&quot;
EndSection

root:# ls /usr/lib/i386-linux-gnu/dri/nouveau_vieux_dri.so
/usr/lib/i386-linux-gnu/dri/nouveau_vieux_dri.so

$ glxinfo | grep render
direct rendering: Yes                                                           
OpenGL renderer string: Mesa DRI nv28 x86/MMX/SSE2  

dmesg:
....
[   29.568428] Bluetooth: RFCOMM socket layer initialized
[   29.568438] Bluetooth: RFCOMM ver 1.11
[   29.638047] Bluetooth: BNEP (Ethernet Emulation) ver 1.3
[   29.638059] Bluetooth: BNEP filters: protocol multicast
[   29.638087] Bluetooth: BNEP socket layer initialized
[   29.816224] b44 ssb0:0 eth0: Link is up at 100 Mbps, full duplex
[   29.816239] b44 ssb0:0 eth0: Flow control is off for TX and off for RX
[   29.816324] IPv6: ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready
[   31.339168] lp0: using parport0 (interrupt-driven).
[   31.364755] ppdev: user-space parallel port driver
[  501.620039] nouveau E[Xorg[2328]] reloc wait_idle failed: -16
[  501.620056] nouveau E[Xorg[2328]] reloc apply: -16
[  501.624016] [sched_delayed] sched: RT throttling activated
[  504.628042] nouveau E[Xorg[2328]] reloc wait_idle failed: -16
[  504.628057] nouveau E[Xorg[2328]] reloc apply: -16
[  507.628030] nouveau E[Xorg[2328]] reloc wait_idle failed: -16
[  507.628039] nouveau E[Xorg[2328]] reloc apply: -16
[  511.028041] nouveau E[Xorg[2328]] reloc wait_idle failed: -16
[  511.028057] nouveau E[Xorg[2328]] reloc apply: -16
[  514.036040] nouveau E[Xorg[2328]] reloc wait_idle failed: -16
[  514.036054] nouveau E[Xorg[2328]] reloc apply: -16
[  517.040030] nouveau E[Xorg[2328]] reloc wait_idle failed: -16
[  517.040040] nouveau E[Xorg[2328]] reloc apply: -16
[  520.040028] nouveau E[Xorg[2328]] reloc wait_idle failed: -16
[  520.040038] nouveau E[Xorg[2328]] reloc apply: -16
[  523.044030] nouveau E[Xorg[2328]] reloc wait_idle failed: -16
[  523.044039] nouveau E[Xorg[2328]] reloc apply: -16                           
[  532.112094] nouveau  [     DRM] Calling LVDS script 6:                       
[  532.112101] nouveau  [     DRM] 0xDFB9: Parsing digital output script table  
[  532.698125] nouveau  [     DRM] Calling LVDS script 2:                       
[  532.698131] nouveau  [     DRM] 0xDFE7: Parsing digital output script table  
[  532.714020] nouveau  [     DRM] Calling LVDS script 5:                       
[  532.714026] nouveau  [     DRM] 0xDF32: Parsing digital output script table  
[  533.015868] nouveau E[     DRM] GPU lockup - switching to software fbcon     
[  539.148515] nouveau  [     DRM] Calling LVDS script 6:                       
[  539.148531] nouveau  [     DRM] 0xDFB9: Parsing digital output script table
[  539.734534] nouveau  [     DRM] Calling LVDS script 2:
[  539.734545] nouveau  [     DRM] 0xDFE7: Parsing digital output script table
[  539.750439] nouveau  [     DRM] Calling LVDS script 5:
[  539.750449] nouveau  [     DRM] 0xDF32: Parsing digital output script table
[  542.968042] nouveau E[Xorg[2328]] failed to idle channel 0xcccc0000
[Xorg[2328]]
[  545.992030] nouveau E[Xorg[2328]] failed to idle channel 0xcccc0000
[Xorg[2328]]
[  546.009560] nouveau  [     DRM] Calling LVDS script 6:
[  546.009569] nouveau  [     DRM] 0xDFB9: Parsing digital output script table
[  549.752032] nouveau E[glxgears[3681]] failed to idle channel 0xcccc0000
[glxgears[3681]]
[  552.772032] nouveau E[glxgears[3681]] failed to idle channel 0xcccc0000
[glxgears[3681]]
[  553.528020] nouveau E[  PGRAPH][0000:01:00.0] idle timed out with status
0x10000501
[  553.850753] nouveau E[  PGRAPH][0000:01:00.0] idle timed out with status
0x10000501
[  554.170128] nouveau E[  PGRAPH][0000:01:00.0] idle timed out with status
0x10000501
[  554.500032] nouveau E[  PGRAPH][0000:01:00.0] idle timed out with status
0x10000501
[  554.878554] nouveau  [     DRM] Calling LVDS script 2:
[  554.878563] nouveau  [     DRM] 0xDFE7: Parsing digital output script table
[  554.894451] nouveau  [     DRM] Calling LVDS script 5:
[  554.894457] nouveau  [     DRM] 0xDF32: Parsing digital output script table
[  558.247972] nouveau  [     DRM] Calling LVDS script 6:
[  558.247980] nouveau  [     DRM] 0xDFB9: Parsing digital output script table
[  558.833993] nouveau  [     DRM] Calling LVDS script 2:
[  558.833998] nouveau  [     DRM] 0xDFE7: Parsing digital output script table
[  558.849888] nouveau  [     DRM] Calling LVDS script 5:
[  558.849894] nouveau  [     DRM] 0xDF32: Parsing digital output script table</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1375255773.2C801.20390--

--===============0287472604==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0287472604==--
