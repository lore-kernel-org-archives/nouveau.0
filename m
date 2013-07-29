From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 67482] New: No DP output when optimus activated in
	bios
Date: Mon, 29 Jul 2013 14:42:55 +0000
Message-ID: <bug-67482-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0961244455=="
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


--===============0961244455==
Content-Type: multipart/alternative; boundary="1375108976.fE1de1.11663"; charset="us-ascii"


--1375108976.fE1de1.11663
Date: Mon, 29 Jul 2013 14:42:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=67482

          Priority: medium
            Bug ID: 67482
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: No DP output when optimus activated in bios
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: michele.cane-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: 7.7 (2011)
         Component: Driver/nouveau
           Product: xorg

Created attachment 83206
  --> https://bugs.freedesktop.org/attachment.cgi?id=83206&action=edit
dmesg output

After activating optimus in bios and

xrandr --setprovideroffloadsink nouveau Intel

I have no DP listed. (when I activate only nvidia card everything is ok).

xrandr 1.4
xserver 1.14.2
nouveau 1.0.8

xrandr --listproviders:

Providers: number : 2
Provider 0: id: 0x95 cap: 0xb, Source Output, Sink Output, Sink Offload crtcs:
2 outputs: 2 associated providers: 1 name:Intel
Provider 1: id: 0x66 cap: 0x7, Source Output, Sink Output, Source Offload
crtcs: 2 outputs: 5 associated providers: 1 name:nouveau

xrandr -q --verbose:

Screen 0: minimum 320 x 200, current 1920 x 1080, maximum 32767 x 32767
LVDS2 connected primary 1920x1080+0+0 (0x96) normal (normal left inverted right
x axis y axis) 344mm x 193mm
        Identifier: 0x93
        Timestamp:  19463
        Subpixel:   horizontal rgb
        Gamma:      1.0:1.0:1.0
        Brightness: 1.0
        Clones:    
        CRTC:       0
        CRTCs:      0 1
        Transform:  1.000000 0.000000 0.000000
                    0.000000 1.000000 0.000000
                    0.000000 0.000000 1.000000
                   filter:
        EDID:
                00ffffffffffff0030aeb24000000000
                0113010380221378ea2135ad5037aa24
                11505400000001010101010101010101
                0101010101014c368082703832403c30
                aa0058c1100000183f2d808270383240
                3c30aa0058c1100000180000000f00d1
                0932d109281b190006af5634000000fe
                004231353648573031205634200a00d6
        BACKLIGHT: 15
                range: (0, 15)
        Backlight: 15
                range: (0, 15)
        scaling mode: Full aspect
                supported: NoneFullCenterFull aspect
  1920x1080 (0x96)  139.0MHz -HSync -VSync *current +preferred
        h: width  1920 start 1980 end 2028 total 2050 skew    0 clock   67.8KHz
        v: height 1080 start 1090 end 1100 total 1130           clock   60.0Hz
  1920x1080 (0xf5)  138.5MHz +HSync -VSync
        h: width  1920 start 1968 end 2000 total 2080 skew    0 clock   66.6KHz
        v: height 1080 start 1083 end 1088 total 1111           clock   59.9Hz
  1920x1080 (0xf6)  115.8MHz -HSync -VSync
        h: width  1920 start 1980 end 2028 total 2050 skew    0 clock   56.5KHz
        v: height 1080 start 1090 end 1100 total 1130           clock   50.0Hz
  1680x1050 (0x67)  146.2MHz -HSync +VSync
        h: width  1680 start 1784 end 1960 total 2240 skew    0 clock   65.3KHz
        v: height 1050 start 1053 end 1059 total 1089           clock   60.0Hz
  1680x1050 (0xf7)  119.0MHz +HSync -VSync
        h: width  1680 start 1728 end 1760 total 1840 skew    0 clock   64.7KHz
        v: height 1050 start 1053 end 1059 total 1080           clock   59.9Hz
  1600x1024 (0xf8)  103.1MHz +HSync +VSync
        h: width  1600 start 1600 end 1656 total 1664 skew    0 clock   62.0KHz
        v: height 1024 start 1024 end 1029 total 1030           clock   60.2Hz
  1400x1050 (0xf9)  122.0MHz +HSync +VSync
        h: width  1400 start 1488 end 1640 total 1880 skew    0 clock   64.9KHz
        v: height 1050 start 1052 end 1064 total 1082           clock   60.0Hz
  1280x1024 (0x69)  108.0MHz +HSync +VSync
        h: width  1280 start 1328 end 1440 total 1688 skew    0 clock   64.0KHz
        v: height 1024 start 1025 end 1028 total 1066           clock   60.0Hz
  1440x900 (0xfa)  106.5MHz -HSync +VSync
        h: width  1440 start 1520 end 1672 total 1904 skew    0 clock   55.9KHz
        v: height  900 start  903 end  909 total  934           clock   59.9Hz
  1280x960 (0xfb)  108.0MHz +HSync +VSync
        h: width  1280 start 1376 end 1488 total 1800 skew    0 clock   60.0KHz
        v: height  960 start  961 end  964 total 1000           clock   60.0Hz
  1360x768 (0xfc)   84.8MHz -HSync +VSync
        h: width  1360 start 1432 end 1568 total 1776 skew    0 clock   47.7KHz
        v: height  768 start  771 end  781 total  798           clock   59.8Hz
  1360x768 (0xfd)   72.0MHz +HSync -VSync
        h: width  1360 start 1408 end 1440 total 1520 skew    0 clock   47.4KHz
        v: height  768 start  771 end  781 total  790           clock   60.0Hz
  1152x864 (0xfe)   81.6MHz -HSync +VSync
        h: width  1152 start 1216 end 1336 total 1520 skew    0 clock   53.7KHz
        v: height  864 start  865 end  868 total  895           clock   60.0Hz
  1024x768 (0x6c)   65.0MHz -HSync -VSync
        h: width  1024 start 1048 end 1184 total 1344 skew    0 clock   48.4KHz
        v: height  768 start  771 end  777 total  806           clock   60.0Hz
  800x600 (0x6e)   40.0MHz +HSync +VSync
        h: width   800 start  840 end  968 total 1056 skew    0 clock   37.9KHz
        v: height  600 start  601 end  605 total  628           clock   60.3Hz
  800x600 (0xff)   36.0MHz +HSync +VSync
        h: width   800 start  824 end  896 total 1024 skew    0 clock   35.2KHz
        v: height  600 start  601 end  603 total  625           clock   56.2Hz
  640x480 (0x100)   25.2MHz -HSync -VSync
        h: width   640 start  656 end  752 total  800 skew    0 clock   31.5KHz
        v: height  480 start  490 end  492 total  525           clock   59.9Hz
VGA2 disconnected (normal left inverted right x axis y axis)
        Identifier: 0x94
        Timestamp:  19463
        Subpixel:   unknown
        Clones:    
        CRTCs:      0 1
        Transform:  1.000000 0.000000 0.000000
                    0.000000 1.000000 0.000000
                    0.000000 0.000000 1.000000
                   filter:

dmesg attached

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1375108976.fE1de1.11663
Date: Mon, 29 Jul 2013 14:42:56 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - No DP output when optimus activated in bios"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67482">67482</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>No DP output when optimus activated in bios
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
          </td>
        </tr>

        <tr>
          <th>Classification</th>
          <td>Unclassified
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>michele.cane&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>7.7 (2011)
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Driver/nouveau
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=83206" name="attach_83206" title="dmesg output">attachment 83206</a> <a href="attachment.cgi?id=83206&amp;action=edit" title="dmesg output">[details]</a></span>
dmesg output

After activating optimus in bios and

xrandr --setprovideroffloadsink nouveau Intel

I have no DP listed. (when I activate only nvidia card everything is ok).

xrandr 1.4
xserver 1.14.2
nouveau 1.0.8

xrandr --listproviders:

Providers: number : 2
Provider 0: id: 0x95 cap: 0xb, Source Output, Sink Output, Sink Offload crtcs:
2 outputs: 2 associated providers: 1 name:Intel
Provider 1: id: 0x66 cap: 0x7, Source Output, Sink Output, Source Offload
crtcs: 2 outputs: 5 associated providers: 1 name:nouveau

xrandr -q --verbose:

Screen 0: minimum 320 x 200, current 1920 x 1080, maximum 32767 x 32767
LVDS2 connected primary 1920x1080+0+0 (0x96) normal (normal left inverted right
x axis y axis) 344mm x 193mm
        Identifier: 0x93
        Timestamp:  19463
        Subpixel:   horizontal rgb
        Gamma:      1.0:1.0:1.0
        Brightness: 1.0
        Clones:    
        CRTC:       0
        CRTCs:      0 1
        Transform:  1.000000 0.000000 0.000000
                    0.000000 1.000000 0.000000
                    0.000000 0.000000 1.000000
                   filter:
        EDID:
                00ffffffffffff0030aeb24000000000
                0113010380221378ea2135ad5037aa24
                11505400000001010101010101010101
                0101010101014c368082703832403c30
                aa0058c1100000183f2d808270383240
                3c30aa0058c1100000180000000f00d1
                0932d109281b190006af5634000000fe
                004231353648573031205634200a00d6
        BACKLIGHT: 15
                range: (0, 15)
        Backlight: 15
                range: (0, 15)
        scaling mode: Full aspect
                supported: NoneFullCenterFull aspect
  1920x1080 (0x96)  139.0MHz -HSync -VSync *current +preferred
        h: width  1920 start 1980 end 2028 total 2050 skew    0 clock   67.8KHz
        v: height 1080 start 1090 end 1100 total 1130           clock   60.0Hz
  1920x1080 (0xf5)  138.5MHz +HSync -VSync
        h: width  1920 start 1968 end 2000 total 2080 skew    0 clock   66.6KHz
        v: height 1080 start 1083 end 1088 total 1111           clock   59.9Hz
  1920x1080 (0xf6)  115.8MHz -HSync -VSync
        h: width  1920 start 1980 end 2028 total 2050 skew    0 clock   56.5KHz
        v: height 1080 start 1090 end 1100 total 1130           clock   50.0Hz
  1680x1050 (0x67)  146.2MHz -HSync +VSync
        h: width  1680 start 1784 end 1960 total 2240 skew    0 clock   65.3KHz
        v: height 1050 start 1053 end 1059 total 1089           clock   60.0Hz
  1680x1050 (0xf7)  119.0MHz +HSync -VSync
        h: width  1680 start 1728 end 1760 total 1840 skew    0 clock   64.7KHz
        v: height 1050 start 1053 end 1059 total 1080           clock   59.9Hz
  1600x1024 (0xf8)  103.1MHz +HSync +VSync
        h: width  1600 start 1600 end 1656 total 1664 skew    0 clock   62.0KHz
        v: height 1024 start 1024 end 1029 total 1030           clock   60.2Hz
  1400x1050 (0xf9)  122.0MHz +HSync +VSync
        h: width  1400 start 1488 end 1640 total 1880 skew    0 clock   64.9KHz
        v: height 1050 start 1052 end 1064 total 1082           clock   60.0Hz
  1280x1024 (0x69)  108.0MHz +HSync +VSync
        h: width  1280 start 1328 end 1440 total 1688 skew    0 clock   64.0KHz
        v: height 1024 start 1025 end 1028 total 1066           clock   60.0Hz
  1440x900 (0xfa)  106.5MHz -HSync +VSync
        h: width  1440 start 1520 end 1672 total 1904 skew    0 clock   55.9KHz
        v: height  900 start  903 end  909 total  934           clock   59.9Hz
  1280x960 (0xfb)  108.0MHz +HSync +VSync
        h: width  1280 start 1376 end 1488 total 1800 skew    0 clock   60.0KHz
        v: height  960 start  961 end  964 total 1000           clock   60.0Hz
  1360x768 (0xfc)   84.8MHz -HSync +VSync
        h: width  1360 start 1432 end 1568 total 1776 skew    0 clock   47.7KHz
        v: height  768 start  771 end  781 total  798           clock   59.8Hz
  1360x768 (0xfd)   72.0MHz +HSync -VSync
        h: width  1360 start 1408 end 1440 total 1520 skew    0 clock   47.4KHz
        v: height  768 start  771 end  781 total  790           clock   60.0Hz
  1152x864 (0xfe)   81.6MHz -HSync +VSync
        h: width  1152 start 1216 end 1336 total 1520 skew    0 clock   53.7KHz
        v: height  864 start  865 end  868 total  895           clock   60.0Hz
  1024x768 (0x6c)   65.0MHz -HSync -VSync
        h: width  1024 start 1048 end 1184 total 1344 skew    0 clock   48.4KHz
        v: height  768 start  771 end  777 total  806           clock   60.0Hz
  800x600 (0x6e)   40.0MHz +HSync +VSync
        h: width   800 start  840 end  968 total 1056 skew    0 clock   37.9KHz
        v: height  600 start  601 end  605 total  628           clock   60.3Hz
  800x600 (0xff)   36.0MHz +HSync +VSync
        h: width   800 start  824 end  896 total 1024 skew    0 clock   35.2KHz
        v: height  600 start  601 end  603 total  625           clock   56.2Hz
  640x480 (0x100)   25.2MHz -HSync -VSync
        h: width   640 start  656 end  752 total  800 skew    0 clock   31.5KHz
        v: height  480 start  490 end  492 total  525           clock   59.9Hz
VGA2 disconnected (normal left inverted right x axis y axis)
        Identifier: 0x94
        Timestamp:  19463
        Subpixel:   unknown
        Clones:    
        CRTCs:      0 1
        Transform:  1.000000 0.000000 0.000000
                    0.000000 1.000000 0.000000
                    0.000000 0.000000 1.000000
                   filter:

dmesg attached</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1375108976.fE1de1.11663--

--===============0961244455==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0961244455==--
