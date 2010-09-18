From: Felix Blanke <felixblanke-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: nouveau and multiple video cards
Date: Sat, 18 Sep 2010 18:01:19 +0200
Message-ID: <20100918160119.GA3930@scooter>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
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

is it possible to setup one virtual screen with 2 video cards and 3 monitors?


My setup looks like this:

01:00.0 VGA compatible controller: nVidia Corporation G72 [GeForce 7300 SE/7200 GS]
(rev a1)
02:00.0 VGA compatible controller: nVidia Corporation G84 [GeForce 8600 GT] (rev a1)


02:00.0 is my primary video card with two monitors connected. 01:00.0 has one monitor
connected.

xrandr only shows me 2 outputs :/

scooter ~ # xrandr -q
Screen 0: minimum 320 x 200, current 3760 x 1600, maximum 8192 x 8192
DVI-I-2 connected 2560x1600+0+0 (normal left inverted right x axis y axis) 641mm x
400mm
   2560x1600      59.9*+
   1280x800       59.9  
DVI-I-3 connected 1200x1600+2560+0 right (normal left inverted right x axis y
axis) 408mm x 306mm
   1600x1200      60.0*+
   1280x1024      85.0     75.0     60.0  
   1280x960       60.0  
   1152x864       75.0  
   1024x768       85.0     75.1     70.1     60.0  
   832x624        74.6  
   800x600        85.1     75.0     60.3  
   640x480        85.0     75.0     60.0  
   720x400        70.1  


Is there something special I have to do or is it not possible to use such a setup
with nouveau?


Thanks for your help!


Regards,
Felix Blanke
