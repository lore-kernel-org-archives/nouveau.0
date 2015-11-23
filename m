From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92991] Nouveau module loading regression in 4.4-rc1
 on optimus system
Date: Mon, 23 Nov 2015 14:19:23 +0000
Message-ID: <bug-92991-8800-gmuYbWyEOg@http.bugs.freedesktop.org/>
References: <bug-92991-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0809361930=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-92991-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0809361930==
Content-Type: multipart/alternative; boundary="1448288363.ab5fd1.13137"; charset="UTF-8"


--1448288363.ab5fd1.13137
Date: Mon, 23 Nov 2015 14:19:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92991

--- Comment #8 from Oliver Neukum <oliver-GvhC2dPhHPQdnm+yROfE0A@public.gmane.org> ---
With runpm=0 I get full output of xrandr. Without it, it is an instant crash:

Screen 0: minimum 8 x 8, current 1600 x 900, maximum 32767 x 32767
eDP1 connected primary 1600x900+0+0 (normal left inverted right x axis y axis)
382mm x 215mm
   1600x900      60.01*+  40.00  
   1024x768      60.00  
   800x600       60.32    56.25  
   640x480       59.94  
VGA1 disconnected (normal left inverted right x axis y axis)
VIRTUAL1 disconnected (normal left inverted right x axis y axis)
DisplayPort-1-0 disconnected (normal left inverted right x axis y axis)
DisplayPort-1-1 disconnected (normal left inverted right x axis y axis)
DisplayPort-1-2 connected (normal left inverted right x axis y axis)
   1680x1050     59.88 +  59.95  
   1400x1050     74.76    59.98  
   1280x1024     75.02    60.02  
   1440x900      74.98    59.90  
   1280x960      60.00  
   1152x864      75.00  
   1024x768      60.04    75.08    75.03    70.07    60.00  
   960x720       75.00    60.00  
   928x696       75.00    60.05  
   896x672       75.05    60.01  
   832x624       74.55  
   800x600       75.00    70.00    65.00    60.00    72.19    75.00    60.32   
56.25  
   700x525       74.76    59.98  
   640x512       75.02    60.02  
   640x480       60.00    75.00    72.81    75.00    60.00    59.94  
   720x400       70.08  
   576x432       75.00  
   512x384       75.03    70.07    60.00  
   416x312       74.66  
   400x300       72.19    75.12    60.32    56.34  
   320x240       72.81    75.00    60.05  
  1024x768 (0xb1) 65.000MHz
        h: width  1024 start 1048 end 1184 total 1344 skew    0 clock  48.36KHz
        v: height  768 start  771 end  777 total  806           clock  60.00Hz
  800x600 (0xb2) 40.000MHz
        h: width   800 start  840 end  968 total 1056 skew    0 clock  37.88KHz 
        v: height  600 start  601 end  605 total  628           clock  60.32Hz  
  800x600 (0xb3) 36.000MHz                                                      
        h: width   800 start  824 end  896 total 1024 skew    0 clock  35.16KHz 
        v: height  600 start  601 end  603 total  625           clock  56.25Hz  
  640x480 (0xb4) 25.175MHz                                                      
        h: width   640 start  656 end  752 total  800 skew    0 clock  31.47KHz 
        v: height  480 start  490 end  492 total  525           clock  59.94Hz

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1448288363.ab5fd1.13137
Date: Mon, 23 Nov 2015 14:19:23 +0000
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
   title="NEW - Nouveau module loading regression in 4.4-rc1 on optimus system"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92991#c8">Comment # 8</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Nouveau module loading regression in 4.4-rc1 on optimus system"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92991">bug 92991</a>
              from <span class="vcard"><a class="email" href="mailto:oliver&#64;neukum.org" title="Oliver Neukum &lt;oliver&#64;neukum.org&gt;"> <span class="fn">Oliver Neukum</span></a>
</span></b>
        <pre>With runpm=0 I get full output of xrandr. Without it, it is an instant crash:

Screen 0: minimum 8 x 8, current 1600 x 900, maximum 32767 x 32767
eDP1 connected primary 1600x900+0+0 (normal left inverted right x axis y axis)
382mm x 215mm
   1600x900      60.01*+  40.00  
   1024x768      60.00  
   800x600       60.32    56.25  
   640x480       59.94  
VGA1 disconnected (normal left inverted right x axis y axis)
VIRTUAL1 disconnected (normal left inverted right x axis y axis)
DisplayPort-1-0 disconnected (normal left inverted right x axis y axis)
DisplayPort-1-1 disconnected (normal left inverted right x axis y axis)
DisplayPort-1-2 connected (normal left inverted right x axis y axis)
   1680x1050     59.88 +  59.95  
   1400x1050     74.76    59.98  
   1280x1024     75.02    60.02  
   1440x900      74.98    59.90  
   1280x960      60.00  
   1152x864      75.00  
   1024x768      60.04    75.08    75.03    70.07    60.00  
   960x720       75.00    60.00  
   928x696       75.00    60.05  
   896x672       75.05    60.01  
   832x624       74.55  
   800x600       75.00    70.00    65.00    60.00    72.19    75.00    60.32   
56.25  
   700x525       74.76    59.98  
   640x512       75.02    60.02  
   640x480       60.00    75.00    72.81    75.00    60.00    59.94  
   720x400       70.08  
   576x432       75.00  
   512x384       75.03    70.07    60.00  
   416x312       74.66  
   400x300       72.19    75.12    60.32    56.34  
   320x240       72.81    75.00    60.05  
  1024x768 (0xb1) 65.000MHz
        h: width  1024 start 1048 end 1184 total 1344 skew    0 clock  48.36KHz
        v: height  768 start  771 end  777 total  806           clock  60.00Hz
  800x600 (0xb2) 40.000MHz
        h: width   800 start  840 end  968 total 1056 skew    0 clock  37.88KHz 
        v: height  600 start  601 end  605 total  628           clock  60.32Hz  
  800x600 (0xb3) 36.000MHz                                                      
        h: width   800 start  824 end  896 total 1024 skew    0 clock  35.16KHz 
        v: height  600 start  601 end  603 total  625           clock  56.25Hz  
  640x480 (0xb4) 25.175MHz                                                      
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

--1448288363.ab5fd1.13137--

--===============0809361930==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0809361930==--
