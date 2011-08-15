From: Dimitar Popov <dpopov-vmG2aq7wDA3tPEyNrbjxdA@public.gmane.org>
Subject: No HDMI Output with NV92
Date: Mon, 15 Aug 2011 17:32:38 +0200
Message-ID: <1603290.MhS8uuC7Xf@darkrider>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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

Hi,

Please, excuse me, if this not the mailing list is not the right place to ask 
for help - I first asked in the Archlinux forum, but since no one seems to 
know something about my problem, I decided to write here.

The problem is that there is not signal to the external monitor connected with 
HDMI-to-DVI cable from my laptop. It looks similar to bug #37085 but I'm not 
sure. Here is some more info:

01:00.0 VGA compatible controller: nVidia Corporation G92M [Quadro FX 3600M] 
(rev a2) (prog-if 00 [VGA controller])

kernel: 3.0 x86_64

libdrm: 2.4.26

xorg-server: 1.10.3.901

xf86-video-nouveau: 0.0.16_git20110726

nouveau-dri: 7.11

I can see the following in dmesg:

[drm] nouveau 0000:01:00.0: unplugged HDMI-A-1
[drm] nouveau 0000:01:00.0: plugged HDMI-A-1

but xrandr does not list the display:

Screen 0: minimum 320 x 200, current 1681 x 1052, maximum 8192 x 8192
LVDS-1 connected 1680x1050+0+0 (normal left inverted right x axis y axis) 
365mm x 228mm
   1680x1050      58.8*+   58.9  
   1400x1050      58.9  
   1280x1024      58.9  
   1280x960       58.9  
   1152x864       58.9  
   1024x768       58.8  
   800x600        58.8  
   640x480        58.8  
   720x400        58.9  
   640x400        58.5  
   640x350        58.1  
VGA-1 connected (normal left inverted right x axis y axis)
   1920x1200      59.9 +
   1600x1200      75.0     60.0  
   1680x1050      60.0  
   1280x1024      85.0     75.0     60.0  
   1280x960       75.0     60.0  
   1152x864       75.0  
   1024x768       75.1     70.1     60.0  
   832x624        74.6  
   800x600        72.2     75.0     60.3     56.2  
   640x480        72.8     75.0     66.7     60.0  
   720x400        70.1  
DVI-D-1 disconnected (normal left inverted right x axis y axis)
HDMI-1 disconnected (normal left inverted right x axis y axis)

I'm a little bit puzzled, why there are both DVI and HDMI outputs listed.

I did not attach the logs, because I'm not sure if it's allowed. Should I 
create a bug about this issue?

Thanks for the help!

Dimitar
