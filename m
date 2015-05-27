From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90682] [NVE6] failed to idle channel 0xcccc0001 +
	crash
Date: Wed, 27 May 2015 15:47:23 +0000
Message-ID: <bug-90682-8800-f6qt3hPLvi@http.bugs.freedesktop.org/>
References: <bug-90682-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1132995340=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-90682-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1132995340==
Content-Type: multipart/alternative; boundary="1432741642.2D68BF1.29580"; charset="UTF-8"


--1432741642.2D68BF1.29580
Date: Wed, 27 May 2015 15:47:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90682

--- Comment #2 from Thomas Stewart <thomas-jC2YvWITRxqtmTQ+vhA3Yw@public.gmane.org> ---
I do mention DP-MST! I have a ThinkPad Ultra Dock 40A2:
http://shop.lenovo.com/us/en/itemdetails/40A20090US/460/6D501EE899104FF9A362D739642CFC27
http://support.lenovo.com/us/en/documents/pd029622

It's got a variety of connectors: VGA, DVI, 2xDP, HDMI. It has a standard and
advanced mode that is selectable from the BIOS. I have read that in standard
mode only one port is usable but in advanced any ports are. I have mine set to
standard.

I drive a pair of 2880x1620 displays with a DVI and a DP from the dock. I think
the laptop and the dock use MST in order to use more than one display. Before
using Linux 4.0 I had to drive one monitor with the dock and one with the VGA
connector on the laptop itself.

I don't know if nouveau is used for anything, 2880x1620 is mentioned next to
intel and nouveau lines in the Xorg.0.log. In the past I did blacklist
nouveau.ko once to diagnose the crashing and found that the crashing stopped
but I could only get outout on the laptop display. So it seems to be involved
somewhere. How does one find out which screen is driven by which card, etc?

Thanks for the info regarding runpm, I have removed that option and am running
with "nouveau.noaccel=1" now. It seems to be stable as it's up about 40 min so
far. I have not used any reverse-prime stuff.

$ xrandr 
Screen 0: minimum 8 x 8, current 3840 x 1200, maximum 32767 x 32767
eDP2 connected (normal left inverted right x axis y axis)
   2880x1620     59.96 +  50.00  
   2048x1536     60.00  
   1920x1440     60.00  
   1856x1392     60.01  
   1792x1344     60.01  
   1920x1200     59.95  
   1920x1080     59.93  
   1600x1200     60.00  
   1680x1050     59.95    59.88  
   1600x1024     60.17  
   1400x1050     59.98  
   1280x1024     60.02  
   1440x900      59.89  
   1280x960      60.00  
   1360x768      59.80    59.96  
   1152x864      60.00  
   1024x768      60.00  
   800x600       60.32    56.25  
   640x480       59.94  
DP1 disconnected (normal left inverted right x axis y axis)
DP2 disconnected (normal left inverted right x axis y axis)
DP2-1 connected primary 1920x1200+0+0 (normal left inverted right x axis y
axis) 518mm x 324mm
   1920x1200     59.95*+
   1920x1080     59.99    60.00    50.00    50.00    50.00    59.94  
   1600x1200     60.00  
   1680x1050     59.95  
   1280x1024     75.02    72.05    60.02  
   1440x900      74.98    59.89  
   1280x720      60.00    50.00    59.94  
   1024x768      75.08    70.07    60.00  
   800x600       72.19    75.00    60.32  
   720x576       50.00  
   720x480       60.00    59.94  
   640x480       75.00    72.81    66.03    60.00    59.94  
   720x400       70.08  
DP2-2 connected 1920x1200+1920+0 (normal left inverted right x axis y axis)
518mm x 324mm
   1920x1200     59.95*+
   1920x1080     59.99  
   1600x1200     60.00  
   1680x1050     59.88  
   1280x1024     75.02    72.05    60.02  
   1440x900      74.98    59.90  
   1024x768      75.08    70.07    60.00  
   800x600       72.19    75.00    60.32  
   640x480       75.00    72.81    66.03    60.00  
   720x400       70.08  
DP2-3 disconnected (normal left inverted right x axis y axis)
HDMI1 disconnected (normal left inverted right x axis y axis)
HDMI2 disconnected (normal left inverted right x axis y axis)
VGA1 disconnected (normal left inverted right x axis y axis)
VIRTUAL1 disconnected (normal left inverted right x axis y axis)
$

$ xrandr --listproviders
Providers: number : 2
Provider 0: id: 0x73 cap: 0xb, Source Output, Sink Output, Sink Offload crtcs:
4 outputs: 10 associated providers: 0 name:Intel
Provider 1: id: 0x45 cap: 0x7, Source Output, Sink Output, Source Offload
crtcs: 4 outputs: 2 associated providers: 0 name:nouveau
$

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1432741642.2D68BF1.29580
Date: Wed, 27 May 2015 15:47:22 +0000
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
   title="NEW - [NVE6] failed to idle channel 0xcccc0001 + crash"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90682#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE6] failed to idle channel 0xcccc0001 + crash"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90682">bug 90682</a>
              from <span class="vcard"><a class="email" href="mailto:thomas&#64;stewarts.org.uk" title="Thomas Stewart &lt;thomas&#64;stewarts.org.uk&gt;"> <span class="fn">Thomas Stewart</span></a>
</span></b>
        <pre>I do mention DP-MST! I have a ThinkPad Ultra Dock 40A2:
<a href="http://shop.lenovo.com/us/en/itemdetails/40A20090US/460/6D501EE899104FF9A362D739642CFC27">http://shop.lenovo.com/us/en/itemdetails/40A20090US/460/6D501EE899104FF9A362D739642CFC27</a>
<a href="http://support.lenovo.com/us/en/documents/pd029622">http://support.lenovo.com/us/en/documents/pd029622</a>

It's got a variety of connectors: VGA, DVI, 2xDP, HDMI. It has a standard and
advanced mode that is selectable from the BIOS. I have read that in standard
mode only one port is usable but in advanced any ports are. I have mine set to
standard.

I drive a pair of 2880x1620 displays with a DVI and a DP from the dock. I think
the laptop and the dock use MST in order to use more than one display. Before
using Linux 4.0 I had to drive one monitor with the dock and one with the VGA
connector on the laptop itself.

I don't know if nouveau is used for anything, 2880x1620 is mentioned next to
intel and nouveau lines in the Xorg.0.log. In the past I did blacklist
nouveau.ko once to diagnose the crashing and found that the crashing stopped
but I could only get outout on the laptop display. So it seems to be involved
somewhere. How does one find out which screen is driven by which card, etc?

Thanks for the info regarding runpm, I have removed that option and am running
with &quot;nouveau.noaccel=1&quot; now. It seems to be stable as it's up about 40 min so
far. I have not used any reverse-prime stuff.

$ xrandr 
Screen 0: minimum 8 x 8, current 3840 x 1200, maximum 32767 x 32767
eDP2 connected (normal left inverted right x axis y axis)
   2880x1620     59.96 +  50.00  
   2048x1536     60.00  
   1920x1440     60.00  
   1856x1392     60.01  
   1792x1344     60.01  
   1920x1200     59.95  
   1920x1080     59.93  
   1600x1200     60.00  
   1680x1050     59.95    59.88  
   1600x1024     60.17  
   1400x1050     59.98  
   1280x1024     60.02  
   1440x900      59.89  
   1280x960      60.00  
   1360x768      59.80    59.96  
   1152x864      60.00  
   1024x768      60.00  
   800x600       60.32    56.25  
   640x480       59.94  
DP1 disconnected (normal left inverted right x axis y axis)
DP2 disconnected (normal left inverted right x axis y axis)
DP2-1 connected primary 1920x1200+0+0 (normal left inverted right x axis y
axis) 518mm x 324mm
   1920x1200     59.95*+
   1920x1080     59.99    60.00    50.00    50.00    50.00    59.94  
   1600x1200     60.00  
   1680x1050     59.95  
   1280x1024     75.02    72.05    60.02  
   1440x900      74.98    59.89  
   1280x720      60.00    50.00    59.94  
   1024x768      75.08    70.07    60.00  
   800x600       72.19    75.00    60.32  
   720x576       50.00  
   720x480       60.00    59.94  
   640x480       75.00    72.81    66.03    60.00    59.94  
   720x400       70.08  
DP2-2 connected 1920x1200+1920+0 (normal left inverted right x axis y axis)
518mm x 324mm
   1920x1200     59.95*+
   1920x1080     59.99  
   1600x1200     60.00  
   1680x1050     59.88  
   1280x1024     75.02    72.05    60.02  
   1440x900      74.98    59.90  
   1024x768      75.08    70.07    60.00  
   800x600       72.19    75.00    60.32  
   640x480       75.00    72.81    66.03    60.00  
   720x400       70.08  
DP2-3 disconnected (normal left inverted right x axis y axis)
HDMI1 disconnected (normal left inverted right x axis y axis)
HDMI2 disconnected (normal left inverted right x axis y axis)
VGA1 disconnected (normal left inverted right x axis y axis)
VIRTUAL1 disconnected (normal left inverted right x axis y axis)
$

$ xrandr --listproviders
Providers: number : 2
Provider 0: id: 0x73 cap: 0xb, Source Output, Sink Output, Sink Offload crtcs:
4 outputs: 10 associated providers: 0 name:Intel
Provider 1: id: 0x45 cap: 0x7, Source Output, Sink Output, Source Offload
crtcs: 4 outputs: 2 associated providers: 0 name:nouveau
$</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1432741642.2D68BF1.29580--

--===============1132995340==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1132995340==--
