From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 67051] No nouveau HDMI sound on NVIDIA GT430
Date: Thu, 18 Jul 2013 22:02:39 +0000
Message-ID: <bug-67051-8800-SqD2o1qzgk@http.bugs.freedesktop.org/>
References: <bug-67051-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1914052935=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-67051-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1914052935==
Content-Type: multipart/alternative; boundary="1374184959.00E20.32767"; charset="us-ascii"


--1374184959.00E20.32767
Date: Thu, 18 Jul 2013 22:02:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=67051

--- Comment #8 from Alex <alupu01-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Hi Ilia,

(In reply to comment #7)
> BTW, does video work fine?
Always perfect (on all kernels, on NVIDIA proprietary, Win 7, etc.).

> Can you post the output of "xrandr -q"?
xrandr --version
xrandr program version       1.4.0
Server reports RandR version 1.4

xrandr [-q]                                   # works without "-q" on mine.
Screen 0: minimum 320 x 200, current 1280 x 720, maximum 8192 x 8192
DVI-I-1 disconnected (normal left inverted right x axis y axis)
HDMI-1 connected 1280x720+0+0 (normal left inverted right x axis y axis) 553mm
x 311mm
   1280x720       60.0*+   50.0  
   1920x1080      60.0 +   50.0  
   1920x1080i     60.1     50.0  
   1680x1050      59.9  
   1280x1024      75.0     60.0  
   1440x900       59.9  
   1280x960       60.0  
   1152x864       75.0  
   1440x576       50.0  
   1024x768       75.1     70.1     60.0  
   1440x480       59.9  
   832x624        74.6  
   800x600        72.2     75.0     60.3     56.2  
   720x576        50.0  
   720x480        59.9  
   640x480        75.0     66.7     60.0     59.9  
   720x400        70.1  
VGA-1 disconnected (normal left inverted right x axis y axis)

NOTE:  Monitor is 1920x1080 native (especially on 25in.! ).
However, I like it on 1280x720.  In /etc/X11/xorg.conf:
 Modes   "1280x720" "1024x768" "1440x900" "1920x1080"
This shouldn't affect sound though :)

> But your monitor can probably do a bit more than 640x400, which indeed
> points to a potential EDID problem parsing problem. (I also don't see
> 640x400 as one of the modes reported by X.) Normally it picks the native
> resolution of your monitor... do you have something on cmdline that
> overrides that?

I don't need to.  My life style has always been absolutely inflexible:

1.  Boot to Level 3 ("console/VGA/Text mode").  Work there.  Compile kernels
and
the like.  Impress the neighbors (who don't have Linux).
2.  When I please (like when I want to listen to HDMI sound :), I go to
 Level 5 at a resolution based on the modeline above.  Do graphics things.
3.  When done, I come down to Level 3.  Work some more.  When tired or
disgusted I hit 'poweroff'.

> Lastly, is this a x86_32 kernel? 
You'll be the judge:
uname -a
Linux AlexP5 3.10.1 #1 SMP Thu Jul 18 14:17:31 EDT 2013 i686 i686 i386
GNU/Linux

Note:  The time above reflects the last one compiled with the patch.

Just curious:  the sound logic is in the nouveau-kernel module or a combination
of nouveau-kernel and Xorg-nouveau (nouveau_drv.so)?
I know not to expect sound other than at level 5 (Xorg).

Thank you for your work and interest.
-- Alex

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1374184959.00E20.32767
Date: Thu, 18 Jul 2013 22:02:39 +0000
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
   title="NEW --- - No nouveau HDMI sound on NVIDIA GT430"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67051#c8">Comment # 8</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - No nouveau HDMI sound on NVIDIA GT430"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67051">bug 67051</a>
              from <span class="vcard"><a class="email" href="mailto:alupu01&#64;gmail.com" title="Alex &lt;alupu01&#64;gmail.com&gt;"> <span class="fn">Alex</span></a>
</span></b>
        <pre>Hi Ilia,

(In reply to <a href="show_bug.cgi?id=67051#c7">comment #7</a>)
<span class="quote">&gt; BTW, does video work fine?</span >
Always perfect (on all kernels, on NVIDIA proprietary, Win 7, etc.).

<span class="quote">&gt; Can you post the output of &quot;xrandr -q&quot;?</span >
xrandr --version
xrandr program version       1.4.0
Server reports RandR version 1.4

xrandr [-q]                                   # works without &quot;-q&quot; on mine.
Screen 0: minimum 320 x 200, current 1280 x 720, maximum 8192 x 8192
DVI-I-1 disconnected (normal left inverted right x axis y axis)
HDMI-1 connected 1280x720+0+0 (normal left inverted right x axis y axis) 553mm
x 311mm
   1280x720       60.0*+   50.0  
   1920x1080      60.0 +   50.0  
   1920x1080i     60.1     50.0  
   1680x1050      59.9  
   1280x1024      75.0     60.0  
   1440x900       59.9  
   1280x960       60.0  
   1152x864       75.0  
   1440x576       50.0  
   1024x768       75.1     70.1     60.0  
   1440x480       59.9  
   832x624        74.6  
   800x600        72.2     75.0     60.3     56.2  
   720x576        50.0  
   720x480        59.9  
   640x480        75.0     66.7     60.0     59.9  
   720x400        70.1  
VGA-1 disconnected (normal left inverted right x axis y axis)

NOTE:  Monitor is 1920x1080 native (especially on 25in.! ).
However, I like it on 1280x720.  In /etc/X11/xorg.conf:
 Modes   &quot;1280x720&quot; &quot;1024x768&quot; &quot;1440x900&quot; &quot;1920x1080&quot;
This shouldn't affect sound though :)

<span class="quote">&gt; But your monitor can probably do a bit more than 640x400, which indeed
&gt; points to a potential EDID problem parsing problem. (I also don't see
&gt; 640x400 as one of the modes reported by X.) Normally it picks the native
&gt; resolution of your monitor... do you have something on cmdline that
&gt; overrides that?</span >

I don't need to.  My life style has always been absolutely inflexible:

1.  Boot to Level 3 (&quot;console/VGA/Text mode&quot;).  Work there.  Compile kernels
and
the like.  Impress the neighbors (who don't have Linux).
2.  When I please (like when I want to listen to HDMI sound :), I go to
 Level 5 at a resolution based on the modeline above.  Do graphics things.
3.  When done, I come down to Level 3.  Work some more.  When tired or
disgusted I hit 'poweroff'.

<span class="quote">&gt; Lastly, is this a x86_32 kernel? </span >
You'll be the judge:
uname -a
Linux AlexP5 3.10.1 #1 SMP Thu Jul 18 14:17:31 EDT 2013 i686 i686 i386
GNU/Linux

Note:  The time above reflects the last one compiled with the patch.

Just curious:  the sound logic is in the nouveau-kernel module or a combination
of nouveau-kernel and Xorg-nouveau (nouveau_drv.so)?
I know not to expect sound other than at level 5 (Xorg).

Thank you for your work and interest.
-- Alex</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1374184959.00E20.32767--

--===============1914052935==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1914052935==--
