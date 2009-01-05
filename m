From: Stefan Monnier <monnier-CRDzTM1onBSWkKpYnGOUKg@public.gmane.org>
Subject: S-video & composite output
Date: Mon, 05 Jan 2009 17:01:33 -0500
Message-ID: <jwvhc4dmnzf.fsf-monnier+gmane.comp.freedesktop.xorg.nouveau@gnu.org>
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


I finally got nouveau (from git) working on my PowerBook G4 12".
Now, my next step is to get it to drive my TV.  I have it connected via
Apple's "mini-DVI to Video Adapter", which comes with both an S-video
and a composite output.

When I start X, `xrandr' tells me:

   % xrandr                                 
   Screen 0: minimum 320 x 200, current 1024 x 768, maximum 1360 x 1360
   LVDS-0 connected 1024x768+0+0 (normal left inverted right x axis y axis) 245mm x 184mm
      1024x768       60.0*+
      800x600        60.3  
      640x480        59.9  
   DVI-I-0 connected 1024x768+0+0 (normal left inverted right x axis y axis) 1mm x 257mm
      1360x768       59.8  
      1152x864       60.0  
      1024x768       60.0* 
      800x600        60.3  
      640x480        59.9  
      680x384       119.6    119.9  
      576x432       120.1  
      512x384       120.0  
      400x300       120.6  
      320x240       120.1  
   % 

so it appears that this video adapter is detected as a sort of DVI
screen.  And indeed, my TV (which is connected via the `composite'
output if it matters) does show something ;-), but not something
meaningful :-(.  If I try to switch to some other mode e.g. with

   xrandr --output DVI-I-0 --mode 640x480

the meaningless output changes, but stays mostly meaningless (sometimes
I can recognize some shapes, which indicate clearly that the "garbage" is
actually representing the screen, just probably not with the right
frequency/...).

Does anybody have some idea if I can get it to work with the current
code, if so how, and if not, how I can help make it work?


        Stefan
