From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 57034] [NVA0] [Quadro FX 4800] display port
 connectors not recognized
Date: Mon, 26 Aug 2013 15:44:02 +0000
Message-ID: <bug-57034-8800-QhUrpAIxld@http.bugs.freedesktop.org/>
References: <bug-57034-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1446215727=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-57034-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1446215727==
Content-Type: multipart/alternative; boundary="1377531842.d4A5DB481.18356"; charset="us-ascii"


--1377531842.d4A5DB481.18356
Date: Mon, 26 Aug 2013 15:44:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=57034

--- Comment #2 from Orion Poplawski <orion-CVdf0l11yl+B+jHODAdFcQ@public.gmane.org> ---
Things are looking better with 3.10.9:

$ ls /sys/class/drm/card*-*/status
/sys/class/drm/card0-DP-1/status  /sys/class/drm/card0-DP-2/status 
/sys/class/drm/card0-DVI-I-1/status
$ cat /sys/class/drm/card*-*/status
connected
connected
disconnected

But I'm not getting any output on DP-2 - monitor is in power save but I don't
know why.

$ xrandr
Screen 0: minimum 320 x 200, current 3200 x 1200, maximum 8192 x 8192
DVI-I-1 disconnected (normal left inverted right x axis y axis)
DP-1 connected primary 1600x1200+0+0 (normal left inverted right x axis y axis)
367mm x 275mm
   1600x1200      60.0*+
   1280x1024      75.0     60.0
   1152x864       75.0
   1024x768       75.1     60.0
   800x600        75.0     60.3
   640x480        75.0     60.0
   720x400        70.1
DP-2 connected 1600x1200+1600+0 (normal left inverted right x axis y axis)
367mm x 275mm
   1600x1200      60.0*+
   1280x1024      75.0     60.0
   1152x864       75.0
   1024x768       75.1     60.0
   800x600        75.0     60.3
   640x480        75.0     60.0
   720x400        70.1

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1377531842.d4A5DB481.18356
Date: Mon, 26 Aug 2013 15:44:02 +0000
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
   title="NEW --- - [NVA0] [Quadro FX 4800] display port connectors not recognized"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=57034#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVA0] [Quadro FX 4800] display port connectors not recognized"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=57034">bug 57034</a>
              from <span class="vcard"><a class="email" href="mailto:orion&#64;cora.nwra.com" title="Orion Poplawski &lt;orion&#64;cora.nwra.com&gt;"> <span class="fn">Orion Poplawski</span></a>
</span></b>
        <pre>Things are looking better with 3.10.9:

$ ls /sys/class/drm/card*-*/status
/sys/class/drm/card0-DP-1/status  /sys/class/drm/card0-DP-2/status 
/sys/class/drm/card0-DVI-I-1/status
$ cat /sys/class/drm/card*-*/status
connected
connected
disconnected

But I'm not getting any output on DP-2 - monitor is in power save but I don't
know why.

$ xrandr
Screen 0: minimum 320 x 200, current 3200 x 1200, maximum 8192 x 8192
DVI-I-1 disconnected (normal left inverted right x axis y axis)
DP-1 connected primary 1600x1200+0+0 (normal left inverted right x axis y axis)
367mm x 275mm
   1600x1200      60.0*+
   1280x1024      75.0     60.0
   1152x864       75.0
   1024x768       75.1     60.0
   800x600        75.0     60.3
   640x480        75.0     60.0
   720x400        70.1
DP-2 connected 1600x1200+1600+0 (normal left inverted right x axis y axis)
367mm x 275mm
   1600x1200      60.0*+
   1280x1024      75.0     60.0
   1152x864       75.0
   1024x768       75.1     60.0
   800x600        75.0     60.3
   640x480        75.0     60.0
   720x400        70.1</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1377531842.d4A5DB481.18356--

--===============1446215727==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1446215727==--
