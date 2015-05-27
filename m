From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90682] [NVE6] failed to idle channel 0xcccc0001 +
	crash
Date: Wed, 27 May 2015 16:46:00 +0000
Message-ID: <bug-90682-8800-JOT7tSwKlU@http.bugs.freedesktop.org/>
References: <bug-90682-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1159419786=="
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


--===============1159419786==
Content-Type: multipart/alternative; boundary="1432745160.ECBB01.15974"; charset="UTF-8"


--1432745160.ECBB01.15974
Date: Wed, 27 May 2015 16:46:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90682

--- Comment #6 from Thomas Stewart <thomas-jC2YvWITRxqtmTQ+vhA3Yw@public.gmane.org> ---
Here is the status:
$ grep . /sys/class/drm/card*-*/status
/sys/class/drm/card0-DVI-D-1/status:disconnected
/sys/class/drm/card0-eDP-1/status:disconnected
/sys/class/drm/card1-DP-1/status:disconnected
/sys/class/drm/card1-DP-2/status:disconnected
/sys/class/drm/card1-DP-3/status:connected
/sys/class/drm/card1-DP-4/status:connected
/sys/class/drm/card1-DP-5/status:disconnected
/sys/class/drm/card1-eDP-2/status:connected
/sys/class/drm/card1-HDMI-A-1/status:disconnected
/sys/class/drm/card1-HDMI-A-2/status:disconnected
/sys/class/drm/card1-VGA-1/status:disconnected
$

I'm not sure about the DVI-D, I do have a thunderbolt socket on the laptop that
I have never used. I'm not sure if the card order has always been the same, but
it looks like card0 is nouveau and card1 is intel:

$ ls -l /sys/class/drm/card?/device/driver
lrwxrwxrwx 1 root root 0 May 27 17:36 /sys/class/drm/card0/device/driver ->
../../../../bus/pci/drivers/nouveau
lrwxrwxrwx 1 root root 0 May 27 17:35 /sys/class/drm/card1/device/driver ->
../../../bus/pci/drivers/i915
$

I rebooted without "nouveau.noaccel=1" and with "video=eDP-1:d" but it crashed
again in nv50_display_init(). I then rebooted with "nouveau.noaccel=1
video=eDP-1:d" and it seems stable but I'm not sure that has actually done
anything as dmesg and Xorg.0.log seem very similar.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1432745160.ECBB01.15974
Date: Wed, 27 May 2015 16:46:00 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90682#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE6] failed to idle channel 0xcccc0001 + crash"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90682">bug 90682</a>
              from <span class="vcard"><a class="email" href="mailto:thomas&#64;stewarts.org.uk" title="Thomas Stewart &lt;thomas&#64;stewarts.org.uk&gt;"> <span class="fn">Thomas Stewart</span></a>
</span></b>
        <pre>Here is the status:
$ grep . /sys/class/drm/card*-*/status
/sys/class/drm/card0-DVI-D-1/status:disconnected
/sys/class/drm/card0-eDP-1/status:disconnected
/sys/class/drm/card1-DP-1/status:disconnected
/sys/class/drm/card1-DP-2/status:disconnected
/sys/class/drm/card1-DP-3/status:connected
/sys/class/drm/card1-DP-4/status:connected
/sys/class/drm/card1-DP-5/status:disconnected
/sys/class/drm/card1-eDP-2/status:connected
/sys/class/drm/card1-HDMI-A-1/status:disconnected
/sys/class/drm/card1-HDMI-A-2/status:disconnected
/sys/class/drm/card1-VGA-1/status:disconnected
$

I'm not sure about the DVI-D, I do have a thunderbolt socket on the laptop that
I have never used. I'm not sure if the card order has always been the same, but
it looks like card0 is nouveau and card1 is intel:

$ ls -l /sys/class/drm/card?/device/driver
lrwxrwxrwx 1 root root 0 May 27 17:36 /sys/class/drm/card0/device/driver -&gt;
../../../../bus/pci/drivers/nouveau
lrwxrwxrwx 1 root root 0 May 27 17:35 /sys/class/drm/card1/device/driver -&gt;
../../../bus/pci/drivers/i915
$

I rebooted without &quot;nouveau.noaccel=1&quot; and with &quot;video=eDP-1:d&quot; but it crashed
again in nv50_display_init(). I then rebooted with &quot;nouveau.noaccel=1
video=eDP-1:d&quot; and it seems stable but I'm not sure that has actually done
anything as dmesg and Xorg.0.log seem very similar.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1432745160.ECBB01.15974--

--===============1159419786==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1159419786==--
