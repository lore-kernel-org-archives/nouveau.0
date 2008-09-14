From: Helge Hafting <helge.hafting-i5bjtSbraLbLX0NG8FE4ug@public.gmane.org>
Subject: nouveau slower than nv and vesa on quadro 135M
Date: Sun, 14 Sep 2008 12:17:20 +0200
Message-ID: <48CCE4B0.1030709@aitel.hist.no>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
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

I followed the advice at
http://nouveau.freedesktop.org/wiki/DebianInstall
in order to test nouveau with debian.

I found that nouveau works well with the laptop where I occationally
connect another monitor. The xrandr stuff is perfect.

But performance is low for some uses:
* I first noticed that the default X background (a pattern) was painted
   rather slowly. A solid color background is much faster though. The
   vesa driver does this pattern visibly faster. With nouveau,
   one sees the pattern coming down the screen. With vesa,
   it just appears.

* The car navigation program "navit" is unuseable with nouveau. I paints
   a map every second (due to gps updates.) However, it locks X 	
   completely for 10-15 seconds before the map appear. Nothing at
   all happens on screen. I can move the mouse, but no windows update
   at all. Then the map suddenly appears, and the load meter update,
   showing that one cpu core was 100% busy during those 10 seconds.

   Navit paints maps using polylines, filled polygons, and occational
   bitmaps. An extremely small window works, anything big enough for
   navigation is way too much. Vesa has no problems though.

The machine is a Dell latitude D830 laptop, with a core2duo in 64-bit 
mode. I use debian testing, with various X packages from 
unstable/experimental as needed.
The graphics card identifies itself as:
VGA compatible controller: nVidia Corporation Quadro NVS 135M (rev a1)

I also found that nouveau needs X 1.4.2, it fails with X 1.5.0. That is 
ok, but the performance problems makes it unuseable.

Helge Hafting
