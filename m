From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 74002] [NVE7] [un]docking Lenovo W530 results in
 interrupt storm
Date: Fri, 24 Jan 2014 04:36:37 +0000
Message-ID: <bug-74002-8800-1NiyjM5Ahu@http.bugs.freedesktop.org/>
References: <bug-74002-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0852355053=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-74002-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0852355053==
Content-Type: multipart/alternative; boundary="1390538196.87C7F2.23964"; charset="us-ascii"


--1390538196.87C7F2.23964
Date: Fri, 24 Jan 2014 04:36:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=74002

--- Comment #8 from Jamin Collins <jcollins-u0TlgVUp4POoiH3BShWgcg@public.gmane.org> ---
This xrandr output seems very strange, I don't recall seeing resolutions for
disconnected displays before.  Nor, do I recall seeing output like the 6 lines
below DP-3:

jcollins@odin:~$ xrandr
Screen 0: minimum 320 x 200, current 5280 x 1080, maximum 8192 x 8192
LVDS-1 connected 1920x1080+0+0 (normal left inverted right x axis y axis) 344mm
x 193mm
   1920x1080      60.0*+   60.0     50.0  
   1680x1050      60.0  
   1400x1050      60.0  
   1280x1024      59.9  
   1280x960       59.9  
   1152x864       60.0  
   1024x768       59.9  
   800x600        59.9  
   640x480        59.4  
   720x400        59.6  
   640x400        60.0  
   640x350        59.8  
VGA-1 disconnected 1440x900+3840+0 (normal left inverted right x axis y axis)
0mm x 0mm
DP-1 disconnected (normal left inverted right x axis y axis)
DP-2 disconnected 1920x1080+1920+0 (normal left inverted right x axis y axis)
0mm x 0mm
DP-3 disconnected (normal left inverted right x axis y axis)
  1920x1080 (0x77)  148.5MHz
        h: width  1920 start 2008 end 2052 total 2200 skew    0 clock   67.5KHz
        v: height 1080 start 1084 end 1089 total 1125           clock   60.0Hz
  1440x900 (0x82)  106.5MHz
        h: width  1440 start 1520 end 1672 total 1904 skew    0 clock   55.9KHz
        v: height  900 start  903 end  909 total  934           clock   59.9Hz

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1390538196.87C7F2.23964
Date: Fri, 24 Jan 2014 04:36:36 +0000
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
   title="NEW --- - [NVE7] [un]docking Lenovo W530 results in interrupt storm"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74002#c8">Comment # 8</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE7] [un]docking Lenovo W530 results in interrupt storm"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74002">bug 74002</a>
              from <span class="vcard"><a class="email" href="mailto:jcollins&#64;asgardsrealm.net" title="Jamin Collins &lt;jcollins&#64;asgardsrealm.net&gt;"> <span class="fn">Jamin Collins</span></a>
</span></b>
        <pre>This xrandr output seems very strange, I don't recall seeing resolutions for
disconnected displays before.  Nor, do I recall seeing output like the 6 lines
below DP-3:

jcollins&#64;odin:~$ xrandr
Screen 0: minimum 320 x 200, current 5280 x 1080, maximum 8192 x 8192
LVDS-1 connected 1920x1080+0+0 (normal left inverted right x axis y axis) 344mm
x 193mm
   1920x1080      60.0*+   60.0     50.0  
   1680x1050      60.0  
   1400x1050      60.0  
   1280x1024      59.9  
   1280x960       59.9  
   1152x864       60.0  
   1024x768       59.9  
   800x600        59.9  
   640x480        59.4  
   720x400        59.6  
   640x400        60.0  
   640x350        59.8  
VGA-1 disconnected 1440x900+3840+0 (normal left inverted right x axis y axis)
0mm x 0mm
DP-1 disconnected (normal left inverted right x axis y axis)
DP-2 disconnected 1920x1080+1920+0 (normal left inverted right x axis y axis)
0mm x 0mm
DP-3 disconnected (normal left inverted right x axis y axis)
  1920x1080 (0x77)  148.5MHz
        h: width  1920 start 2008 end 2052 total 2200 skew    0 clock   67.5KHz
        v: height 1080 start 1084 end 1089 total 1125           clock   60.0Hz
  1440x900 (0x82)  106.5MHz
        h: width  1440 start 1520 end 1672 total 1904 skew    0 clock   55.9KHz
        v: height  900 start  903 end  909 total  934           clock   59.9Hz</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1390538196.87C7F2.23964--

--===============0852355053==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0852355053==--
