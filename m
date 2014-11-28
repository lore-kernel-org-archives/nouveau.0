From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70389] [prime] unsynchronised rendering on secondary
	displays
Date: Fri, 28 Nov 2014 14:16:54 +0000
Message-ID: <bug-70389-8800-BXJjA9fJZG@http.bugs.freedesktop.org/>
References: <bug-70389-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0044626057=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-70389-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0044626057==
Content-Type: multipart/alternative; boundary="1417184214.1E24Aadf2.19100"; charset="UTF-8"


--1417184214.1E24Aadf2.19100
Date: Fri, 28 Nov 2014 14:16:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70389

Dennis Favro <dfavro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |dfavro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org

--- Comment #3 from Dennis Favro <dfavro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Getting what appears to be a less-serious version of this bug on Debian Testing
with the Intel driver from Experimental (2:2.99.916+git20141119-1~exp1).

I'm also using a W530, in Optimus mode in BIOS.  

Dragging windows around the DVI/DFP display leaves artifacts and tears.  The
internal display (LVDS1) looks fine.  Scrolling and typing is similarly slow;
gnome-terminal is particularly ugly

$ uname -a
Linux dtp 3.16.0-4-amd64 #1 SMP Debian 3.16.7-2 (2014-11-06) x86_64 GNU/Linux

$ lspci | grep -i VGA
00:02.0 VGA compatible controller: Intel Corporation 3rd Gen Core processor
Graphics Controller (rev 09)
01:00.0 VGA compatible controller: NVIDIA Corporation GK107GLM [Quadro K1000M]
(rev a1)

$ xrandr --listproviders
Providers: number : 2
Provider 0: id: 0xae cap: 0xb, Source Output, Sink Output, Sink Offload crtcs:
4 outputs: 3 associated providers: 1 name:Intel
Provider 1: id: 0x68 cap: 0x7, Source Output, Sink Output, Source Offload
crtcs: 4 outputs: 5 associated providers: 1 name:nouveau

$ xrandr -q
Screen 0: minimum 8 x 8, current 1920 x 2280, maximum 32767 x 32767
LVDS1 connected primary 1920x1080+0+1200 (normal left inverted right x axis y
axis) 344mm x 193mm
   1920x1080     60.00*+  59.93    50.00  
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
VGA1 disconnected (normal left inverted right x axis y axis)
VIRTUAL1 disconnected (normal left inverted right x axis y axis)
LVDS-1-2 disconnected (normal left inverted right x axis y axis)
VGA-1-2 disconnected (normal left inverted right x axis y axis)
DP-1-1 disconnected (normal left inverted right x axis y axis)
DP-1-2 disconnected (normal left inverted right x axis y axis)
DP-1-3 connected 1920x1200+0+0 (normal left inverted right x axis y axis) 518mm
x 324mm
   1920x1200     59.95*+
   1920x1080     50.00  
   1600x1200     60.00  
   1680x1050     59.88  
   1280x1024     75.02    60.02  
   1440x900      74.98    59.90  
   1280x960      60.00  
   1280x800      59.91  
   1152x864      75.00  
   1280x720      60.00    50.00    59.94  
   1024x768      75.08    70.07    60.00  
   832x624       74.55  
   800x600       72.19    75.00    60.32    56.25  
   720x576       50.00  
   720x480       60.00    59.94  
   640x480       75.00    72.81    66.67    60.00    59.94  
   720x400       70.08  
  1680x1050 (0x6c) 119.000MHz
        h: width  1680 start 1728 end 1760 total 1840 skew    0 clock  64.67KHz
        v: height 1050 start 1053 end 1059 total 1080           clock  59.88Hz
  1280x1024 (0x6e) 108.000MHz
        h: width  1280 start 1328 end 1440 total 1688 skew    0 clock  63.98KHz
        v: height 1024 start 1025 end 1028 total 1066           clock  60.02Hz
  1280x960 (0x71) 108.000MHz
        h: width  1280 start 1376 end 1488 total 1800 skew    0 clock  60.00KHz
        v: height  960 start  961 end  964 total 1000           clock  60.00Hz
  1024x768 (0x79) 65.000MHz
        h: width  1024 start 1048 end 1184 total 1344 skew    0 clock  48.36KHz
        v: height  768 start  771 end  777 total  806           clock  60.00Hz
  800x600 (0x7d) 40.000MHz
        h: width   800 start  840 end  968 total 1056 skew    0 clock  37.88KHz
        v: height  600 start  601 end  605 total  628           clock  60.32Hz
  800x600 (0x7e) 36.000MHz
        h: width   800 start  824 end  896 total 1024 skew    0 clock  35.16KHz
        v: height  600 start  601 end  603 total  625           clock  56.25Hz
  640x480 (0x86) 25.175MHz
        h: width   640 start  656 end  752 total  800 skew    0 clock  31.47KHz
        v: height  480 start  490 end  492 total  525           clock  59.94Hz

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1417184214.1E24Aadf2.19100
Date: Fri, 28 Nov 2014 14:16:54 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:dfavro&#64;gmail.com" title="Dennis Favro &lt;dfavro&#64;gmail.com&gt;"> <span class="fn">Dennis Favro</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [prime] unsynchronised rendering on secondary displays"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70389">bug 70389</a>
          <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">CC</td>
           <td>
               &nbsp;
           </td>
           <td>dfavro&#64;gmail.com
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [prime] unsynchronised rendering on secondary displays"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70389#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [prime] unsynchronised rendering on secondary displays"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70389">bug 70389</a>
              from <span class="vcard"><a class="email" href="mailto:dfavro&#64;gmail.com" title="Dennis Favro &lt;dfavro&#64;gmail.com&gt;"> <span class="fn">Dennis Favro</span></a>
</span></b>
        <pre>Getting what appears to be a less-serious version of this bug on Debian Testing
with the Intel driver from Experimental (2:2.99.916+git20141119-1~exp1).

I'm also using a W530, in Optimus mode in BIOS.  

Dragging windows around the DVI/DFP display leaves artifacts and tears.  The
internal display (LVDS1) looks fine.  Scrolling and typing is similarly slow;
gnome-terminal is particularly ugly

$ uname -a
Linux dtp 3.16.0-4-amd64 #1 SMP Debian 3.16.7-2 (2014-11-06) x86_64 GNU/Linux

$ lspci | grep -i VGA
00:02.0 VGA compatible controller: Intel Corporation 3rd Gen Core processor
Graphics Controller (rev 09)
01:00.0 VGA compatible controller: NVIDIA Corporation GK107GLM [Quadro K1000M]
(rev a1)

$ xrandr --listproviders
Providers: number : 2
Provider 0: id: 0xae cap: 0xb, Source Output, Sink Output, Sink Offload crtcs:
4 outputs: 3 associated providers: 1 name:Intel
Provider 1: id: 0x68 cap: 0x7, Source Output, Sink Output, Source Offload
crtcs: 4 outputs: 5 associated providers: 1 name:nouveau

$ xrandr -q
Screen 0: minimum 8 x 8, current 1920 x 2280, maximum 32767 x 32767
LVDS1 connected primary 1920x1080+0+1200 (normal left inverted right x axis y
axis) 344mm x 193mm
   1920x1080     60.00*+  59.93    50.00  
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
VGA1 disconnected (normal left inverted right x axis y axis)
VIRTUAL1 disconnected (normal left inverted right x axis y axis)
LVDS-1-2 disconnected (normal left inverted right x axis y axis)
VGA-1-2 disconnected (normal left inverted right x axis y axis)
DP-1-1 disconnected (normal left inverted right x axis y axis)
DP-1-2 disconnected (normal left inverted right x axis y axis)
DP-1-3 connected 1920x1200+0+0 (normal left inverted right x axis y axis) 518mm
x 324mm
   1920x1200     59.95*+
   1920x1080     50.00  
   1600x1200     60.00  
   1680x1050     59.88  
   1280x1024     75.02    60.02  
   1440x900      74.98    59.90  
   1280x960      60.00  
   1280x800      59.91  
   1152x864      75.00  
   1280x720      60.00    50.00    59.94  
   1024x768      75.08    70.07    60.00  
   832x624       74.55  
   800x600       72.19    75.00    60.32    56.25  
   720x576       50.00  
   720x480       60.00    59.94  
   640x480       75.00    72.81    66.67    60.00    59.94  
   720x400       70.08  
  1680x1050 (0x6c) 119.000MHz
        h: width  1680 start 1728 end 1760 total 1840 skew    0 clock  64.67KHz
        v: height 1050 start 1053 end 1059 total 1080           clock  59.88Hz
  1280x1024 (0x6e) 108.000MHz
        h: width  1280 start 1328 end 1440 total 1688 skew    0 clock  63.98KHz
        v: height 1024 start 1025 end 1028 total 1066           clock  60.02Hz
  1280x960 (0x71) 108.000MHz
        h: width  1280 start 1376 end 1488 total 1800 skew    0 clock  60.00KHz
        v: height  960 start  961 end  964 total 1000           clock  60.00Hz
  1024x768 (0x79) 65.000MHz
        h: width  1024 start 1048 end 1184 total 1344 skew    0 clock  48.36KHz
        v: height  768 start  771 end  777 total  806           clock  60.00Hz
  800x600 (0x7d) 40.000MHz
        h: width   800 start  840 end  968 total 1056 skew    0 clock  37.88KHz
        v: height  600 start  601 end  605 total  628           clock  60.32Hz
  800x600 (0x7e) 36.000MHz
        h: width   800 start  824 end  896 total 1024 skew    0 clock  35.16KHz
        v: height  600 start  601 end  603 total  625           clock  56.25Hz
  640x480 (0x86) 25.175MHz
        h: width   640 start  656 end  752 total  800 skew    0 clock  31.47KHz
        v: height  480 start  490 end  492 total  525           clock  59.94Hz</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1417184214.1E24Aadf2.19100--

--===============0044626057==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0044626057==--
