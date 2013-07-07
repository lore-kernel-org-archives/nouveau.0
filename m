From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 54700] Distorted graphics (double cursor) with
 GeForce 4200Go (NV28)
Date: Sun, 07 Jul 2013 17:47:45 +0000
Message-ID: <bug-54700-8800-i1hZrNxCHL@http.bugs.freedesktop.org/>
References: <bug-54700-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2084057021=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-54700-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2084057021==
Content-Type: multipart/alternative; boundary="1373219265.6afe2.7712"; charset="us-ascii"


--1373219265.6afe2.7712
Date: Sun, 7 Jul 2013 17:47:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=54700

--- Comment #20 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to comment #14)
> (In reply to comment #12)
...
> > * Wondering how much effect this has "Unknown LVDS configuration bits"
> > Does that issue occur on a non LVDS output - eg. when you have monitor
> > plugged to the VGA and LVDS is off ?
> 
> It's a laptop: how can I do that?
> 
1. Connect in a monitor/TV to the VGA(DVI-D) connector
2. Set it up - use xrandr or your favourite gui app
(replace the VGA-1 with DVI-D-1 if appropriate)
$ xrandr --output VGA-1 --auto

3. Disable LVDS - use xrandr or your favourite gui app
$ xrandr --output LVDS-1 --off 


> > * Does the "distorted graphics" differ if you (re)move the mesa driver
> > nouveau_vieux.so ?
> 
> YES, just reproduced after
>   mv /usr/lib/i386-linux-gnu/dri/{,__unloaded__}nouveau_vieux_dri.so
>  
Did you restart X after doing that ?

> > * Why do you have custom modelines in your xorg.conf? 
> 
> Do not know. I do not have a xorg.conf, nor I did not modified anything
> apart the conf files in xorg, which are currently disabled by the -off
> suffix (by they are trivial, anyway, see below)
> 
Got distracted there, my bad

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1373219265.6afe2.7712
Date: Sun, 7 Jul 2013 17:47:45 +0000
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
   title="NEW --- - Distorted graphics (double cursor) with GeForce 4200Go (NV28)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=54700#c20">Comment # 20</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Distorted graphics (double cursor) with GeForce 4200Go (NV28)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=54700">bug 54700</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=54700#c14">comment #14</a>)
<span class="quote">&gt; (In reply to <a href="show_bug.cgi?id=54700#c12">comment #12</a>)</span >
...
<span class="quote">&gt; &gt; * Wondering how much effect this has &quot;Unknown LVDS configuration bits&quot;
&gt; &gt; Does that issue occur on a non LVDS output - eg. when you have monitor
&gt; &gt; plugged to the VGA and LVDS is off ?
&gt; 
&gt; It's a laptop: how can I do that?
&gt; </span >
1. Connect in a monitor/TV to the VGA(DVI-D) connector
2. Set it up - use xrandr or your favourite gui app
(replace the VGA-1 with DVI-D-1 if appropriate)
$ xrandr --output VGA-1 --auto

3. Disable LVDS - use xrandr or your favourite gui app
$ xrandr --output LVDS-1 --off 


<span class="quote">&gt; &gt; * Does the &quot;distorted graphics&quot; differ if you (re)move the mesa driver
&gt; &gt; nouveau_vieux.so ?
&gt; 
&gt; YES, just reproduced after
&gt;   mv /usr/lib/i386-linux-gnu/dri/{,__unloaded__}nouveau_vieux_dri.so
&gt;  </span >
Did you restart X after doing that ?

<span class="quote">&gt; &gt; * Why do you have custom modelines in your xorg.conf? 
&gt; 
&gt; Do not know. I do not have a xorg.conf, nor I did not modified anything
&gt; apart the conf files in xorg, which are currently disabled by the -off
&gt; suffix (by they are trivial, anyway, see below)
&gt; </span >
Got distracted there, my bad</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1373219265.6afe2.7712--

--===============2084057021==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2084057021==--
