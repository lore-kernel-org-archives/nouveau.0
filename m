From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 26800] Nouveau TV-out incorrectly detecting load
Date: Thu, 11 Mar 2010 14:03:54 -0800 (PST)
Message-ID: <20100311220354.773471300EB@annarchy.freedesktop.org>
References: <bug-26800-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-26800-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=26800





--- Comment #11 from Andy Rink <personman_145-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org>  2010-03-11 14:03:53 PST ---
(In reply to comment #10)
> (In reply to comment #9)
> > Excellent work my man. :)
> > 
> > Both KMS and X are defaulting to the correct resolution now, and I no longer
> > get messages about a load being detected on the TV out.
> > 
> 
> Is the TV detected properly when it's plugged in? In particular 'xrandr --prop
> |grep subconnector' should tell you the right connector type after you've
> plugged it in (Composite I guess).
> 

It looks like it. Booting with the TV hooked in, it chooses the lower default
resolution it was using before your patch. The output from 'xrandr --prop |
grep subconnector' was:

        subconnector:   SCART
        select subconnector:    Automatic

Without the grep line, I get the following:

Screen 0: minimum 320 x 200, current 1024 x 768, maximum 4096 x 4096
LVDS-1 connected 1024x768+0+0 (normal left inverted right x axis y axis) 331mm
x 207mm
        EDID:
                00ffffffffffff0006af748100000000
                01100103802115780a1cf59758508e27
                27505400000001010101010101010101
                010101010101c71b00a0502017303020
                36004bcf100000180000000f00000000
                00000000000000000020000000fe0041
                554f0a202020202020202020000000fe
                004231353445573038205631200a0043
        dithering:      Off
                supported: Off          On          
        scaling mode:   Full
                supported: None         Full         Center       Full aspect 
   1280x800       60.0 +
   1024x768       59.9* 
   800x600        59.9  
   640x480        59.4  
   720x400        59.6  
   640x400        60.0  
   640x350        59.8  
VGA-1 disconnected (normal left inverted right x axis y axis)
TV-1 connected 1024x768+0+0 (normal left inverted right x axis y axis) 0mm x
0mm
        overscan: 50 (0x00000032)       range:  (0,100)
        hue: 0 (0x00000000)     range:  (0,100)
        saturation: 50 (0x00000032)     range:  (0,100)
        flicker reduction: 50 (0x00000032)      range:  (0,100)
        mode:   PAL
                supported: PAL          PAL-M        PAL-N        PAL-Nc      
                           NTSC-M       NTSC-J      
        subconnector:   SCART
                supported: Unknown      Composite    SVIDEO       Component   
                           SCART       
        select subconnector:    Automatic
                supported: Automatic    Composite    SVIDEO       Component   
                           SCART       
   720x576        50.0 +
   1024x768       50.0* 
   800x600        50.0  
   720x480        50.0  
   640x480        50.0  
   400x300       100.0  
   320x240       100.0  
   320x200       100.0  


The TV-out doesn't actually show anything, but I imagine that is to be expected
according to the status matrix.

-Andy


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
