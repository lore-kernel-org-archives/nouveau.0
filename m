From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 38074] Dual head doesn't work for some combination
 of monitors (second screen still off)
Date: Tue, 20 Dec 2011 16:20:04 +0000
Message-ID: <bug-38074-8800-i4uiWaTRRs@http.bugs.freedesktop.org/>
References: <bug-38074-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-38074-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=38074

--- Comment #16 from Luzipher <luziphermcleod-CVfgzVlYcRg@public.gmane.org> 2011-12-20 08:20:04 PST ---
No, 1280x1024 doesn't work as well (same result: I can move the mouse there but
the screen stays black and enters power save).

Commands used:
xrandr --output DVI-D-1 --set "scaling mode" "None"
xrandr --output DVI-D-1 --right-of LVDS-1 --mode 0xa7


Outputs:

## xrandr --verbose (only for DVI-D-1, after setting scaling mode to none) ##

DVI-D-1 connected (normal left inverted right x axis y axis)
    Identifier: 0x94
    Timestamp:  615302
    Subpixel:   unknown
    Clones:    
    CRTCs:      0 1
    Transform:  1.000000 0.000000 0.000000
                0.000000 1.000000 0.000000
                0.000000 0.000000 1.000000
               filter: 
    EDID:
        00ffffffffffff0010ac2ea053324b30
        1e12010380342078eeee91a3544c9926
        0f5054a54b00714f8180a94001010101
        010101010101283c80a070b023403020
        360006442100001a000000ff00473237
        344838374f304b325320000000fc0044
        454c4c20453234385746500a000000fd
        00384c1e5311000a2020202020200037
    dithering:    Off
        supported: Off          On           Automatic   
    scaling mode:    None
        supported: None         Full         Center       Full aspect 
  1920x1200 (0xa4)  154.0MHz +HSync -VSync +preferred
        h: width  1920 start 1968 end 2000 total 2080 skew    0 clock   74.0KHz
        v: height 1200 start 1203 end 1209 total 1235           clock   60.0Hz
  1600x1200 (0xa5)  162.0MHz +HSync +VSync
        h: width  1600 start 1664 end 1856 total 2160 skew    0 clock   75.0KHz
        v: height 1200 start 1201 end 1204 total 1250           clock   60.0Hz
  1280x1024 (0xa6)  135.0MHz +HSync +VSync
        h: width  1280 start 1296 end 1440 total 1688 skew    0 clock   80.0KHz
        v: height 1024 start 1025 end 1028 total 1066           clock   75.0Hz
  1280x1024 (0xa7)  108.0MHz +HSync +VSync
        h: width  1280 start 1328 end 1440 total 1688 skew    0 clock   64.0KHz
        v: height 1024 start 1025 end 1028 total 1066           clock   60.0Hz
  1152x864 (0xa8)  108.0MHz +HSync +VSync
        h: width  1152 start 1216 end 1344 total 1600 skew    0 clock   67.5KHz
        v: height  864 start  865 end  868 total  900           clock   75.0Hz
  1024x768 (0xa9)   78.8MHz +HSync +VSync
        h: width  1024 start 1040 end 1136 total 1312 skew    0 clock   60.1KHz
        v: height  768 start  769 end  772 total  800           clock   75.1Hz
  1024x768 (0xaa)   65.0MHz -HSync -VSync
        h: width  1024 start 1048 end 1184 total 1344 skew    0 clock   48.4KHz
        v: height  768 start  771 end  777 total  806           clock   60.0Hz
  800x600 (0xab)   49.5MHz +HSync +VSync
        h: width   800 start  816 end  896 total 1056 skew    0 clock   46.9KHz
        v: height  600 start  601 end  604 total  625           clock   75.0Hz
  800x600 (0xac)   40.0MHz +HSync +VSync
        h: width   800 start  840 end  968 total 1056 skew    0 clock   37.9KHz
        v: height  600 start  601 end  605 total  628           clock   60.3Hz
  640x480 (0xad)   31.5MHz -HSync -VSync
        h: width   640 start  656 end  720 total  840 skew    0 clock   37.5KHz
        v: height  480 start  481 end  484 total  500           clock   75.0Hz
  640x480 (0xae)   25.2MHz -HSync -VSync
        h: width   640 start  656 end  752 total  800 skew    0 clock   31.5KHz
        v: height  480 start  490 end  492 total  525           clock   60.0Hz
  720x400 (0xaf)   28.3MHz -HSync +VSync
        h: width   720 start  738 end  846 total  900 skew    0 clock   31.5KHz
        v: height  400 start  412 end  414 total  449           clock   70.1Hz



## xrandr after second command ##

DVI-D-1 connected 1280x1024+1920+0 (normal left inverted right x axis y axis)
518mm x 324mm
   1920x1200      60.0 +
   1600x1200      60.0  
   1280x1024      75.0     60.0* 
   1152x864       75.0  
   1024x768       75.1     60.0  
   800x600        75.0     60.3  
   640x480        75.0     60.0  
   720x400        70.1

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
