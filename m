From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 69083] [NV84] using DVI to VGA adapter for CRT and
 specifying supported "PreferredMode" >EDID preferred mode,
 screen output is compressed into small fraction of top scan lines
Date: Sun, 08 Sep 2013 07:29:19 +0000
Message-ID: <bug-69083-8800-QjiYMMUcAH@http.bugs.freedesktop.org/>
References: <bug-69083-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1573160492=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-69083-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1573160492==
Content-Type: multipart/alternative; boundary="1378625359.D03CA1.32667"; charset="us-ascii"


--1378625359.D03CA1.32667
Date: Sun, 8 Sep 2013 07:29:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=69083

--- Comment #3 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
What if you run

xrandr -s 1920x1440 -r 60

I wonder if something's breaking down at the 75Hz refresh rate it ends up
picking. (You can do this from a "working" session, it should just switch
resolutions... you can also be careful about it and do like xrandr -s 1920x1440
-r 60 && sleep 10 && xrandr -s 1600x1200 to make sure that you get back to a
working state.)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1378625359.D03CA1.32667
Date: Sun, 8 Sep 2013 07:29:19 +0000
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
   title="NEW --- - [NV84] using DVI to VGA adapter for CRT and specifying supported &quot;PreferredMode&quot; &gt;EDID preferred mode, screen output is compressed into small fraction of top scan lines"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69083#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV84] using DVI to VGA adapter for CRT and specifying supported &quot;PreferredMode&quot; &gt;EDID preferred mode, screen output is compressed into small fraction of top scan lines"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69083">bug 69083</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>What if you run

xrandr -s 1920x1440 -r 60

I wonder if something's breaking down at the 75Hz refresh rate it ends up
picking. (You can do this from a &quot;working&quot; session, it should just switch
resolutions... you can also be careful about it and do like xrandr -s 1920x1440
-r 60 &amp;&amp; sleep 10 &amp;&amp; xrandr -s 1600x1200 to make sure that you get back to a
working state.)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1378625359.D03CA1.32667--

--===============1573160492==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1573160492==--
