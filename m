From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 51362] [NVE7] DisplayPort output on nVidia Quadro
 K2000M (ThinkPad W530) doesn't work
Date: Mon, 02 Sep 2013 15:06:21 +0000
Message-ID: <bug-51362-8800-0PYug4PD9x@http.bugs.freedesktop.org/>
References: <bug-51362-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0641400133=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-51362-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0641400133==
Content-Type: multipart/alternative; boundary="1378134381.aAc5f42.9873"; charset="us-ascii"


--1378134381.aAc5f42.9873
Date: Mon, 2 Sep 2013 15:06:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=51362

--- Comment #14 from e.swanson+xorgbugs-5lA2vZBjcqn3oGB3hsPCZA@public.gmane.org ---
I just installed Arch's linux-mainline AUR package, which built and installed
linux 3.11rc7. The problem still exists. :(

$ uname -a
Linux svoboda 3.11.0-1-mainline #1 SMP PREEMPT Mon Sep 2 10:32:12 EDT 2013
x86_64 GNU/Linux

$ xrandr
Screen 0: minimum 320 x 200, current 3600 x 1080, maximum 8192 x 8192
LVDS-1 disconnected (normal left inverted right x axis y axis)
VGA-1 connected 1680x1050+0+0 (normal left inverted right x axis y axis) 434mm
x 270mm
   1680x1050      60.0*+
   1280x1024      75.0     60.0  
   1152x864       75.0  
   1024x768       75.1     60.0  
   800x600        75.0     60.3  
   640x480        75.0     60.0  
   720x400        70.1  
DP-1 connected primary 1920x1080+1680+0 (normal left inverted right x axis y
axis) 510mm x 287mm
   1920x1080      60.0*+   50.0     59.9  
   1920x1080i     60.1     50.0     60.0  
   1280x1024      75.0     60.0  
   1280x960       60.0  
   1280x800       59.9  
   1152x864       75.0  
   1280x720       60.0     50.0     59.9  
   1024x768       75.1     70.1     60.0  
   832x624        74.6  
   800x600        72.2     75.0     60.3     56.2  
   720x576        50.0  
   720x480        60.0     59.9  
   640x480        75.0     72.8     66.7     60.0     59.9  
   720x400        70.1  
DP-2 disconnected (normal left inverted right x axis y axis)
DP-3 disconnected (normal left inverted right x axis y axis)

I'll attach a new dmesg and vbios dump. Can I provide any other information in
this configuration?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1378134381.aAc5f42.9873
Date: Mon, 2 Sep 2013 15:06:21 +0000
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
   title="NEW --- - [NVE7] DisplayPort output on nVidia Quadro K2000M (ThinkPad W530) doesn't work"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=51362#c14">Comment # 14</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE7] DisplayPort output on nVidia Quadro K2000M (ThinkPad W530) doesn't work"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=51362">bug 51362</a>
              from <span class="vcard"><a class="email" href="mailto:e.swanson+xorgbugs&#64;alloscomp.com" title="e.swanson+xorgbugs&#64;alloscomp.com">e.swanson+xorgbugs&#64;alloscomp.com</a>
</span></b>
        <pre>I just installed Arch's linux-mainline AUR package, which built and installed
linux 3.11rc7. The problem still exists. :(

$ uname -a
Linux svoboda 3.11.0-1-mainline #1 SMP PREEMPT Mon Sep 2 10:32:12 EDT 2013
x86_64 GNU/Linux

$ xrandr
Screen 0: minimum 320 x 200, current 3600 x 1080, maximum 8192 x 8192
LVDS-1 disconnected (normal left inverted right x axis y axis)
VGA-1 connected 1680x1050+0+0 (normal left inverted right x axis y axis) 434mm
x 270mm
   1680x1050      60.0*+
   1280x1024      75.0     60.0  
   1152x864       75.0  
   1024x768       75.1     60.0  
   800x600        75.0     60.3  
   640x480        75.0     60.0  
   720x400        70.1  
DP-1 connected primary 1920x1080+1680+0 (normal left inverted right x axis y
axis) 510mm x 287mm
   1920x1080      60.0*+   50.0     59.9  
   1920x1080i     60.1     50.0     60.0  
   1280x1024      75.0     60.0  
   1280x960       60.0  
   1280x800       59.9  
   1152x864       75.0  
   1280x720       60.0     50.0     59.9  
   1024x768       75.1     70.1     60.0  
   832x624        74.6  
   800x600        72.2     75.0     60.3     56.2  
   720x576        50.0  
   720x480        60.0     59.9  
   640x480        75.0     72.8     66.7     60.0     59.9  
   720x400        70.1  
DP-2 disconnected (normal left inverted right x axis y axis)
DP-3 disconnected (normal left inverted right x axis y axis)

I'll attach a new dmesg and vbios dump. Can I provide any other information in
this configuration?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1378134381.aAc5f42.9873--

--===============0641400133==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0641400133==--
