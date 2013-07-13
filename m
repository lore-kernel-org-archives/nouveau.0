From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 54700] Distorted graphics (double cursor) with
 GeForce 4200Go (NV28)
Date: Sat, 13 Jul 2013 09:48:26 +0000
Message-ID: <bug-54700-8800-4mVZc5xqia@http.bugs.freedesktop.org/>
References: <bug-54700-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1818135371=="
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


--===============1818135371==
Content-Type: multipart/alternative; boundary="1373708906.1Ace1.19058"; charset="us-ascii"


--1373708906.1Ace1.19058
Date: Sat, 13 Jul 2013 09:48:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=54700

--- Comment #23 from r.ductor-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
(In reply to comment #20)
> (In reply to comment #14)
> > (In reply to comment #12)
> ...
> > > * Wondering how much effect this has "Unknown LVDS configuration bits"
> > > Does that issue occur on a non LVDS output - eg. when you have monitor
> > > plugged to the VGA and LVDS is off ?
> > 
> > It's a laptop: how can I do that?
> > 
> 1. Connect in a monitor/TV to the VGA(DVI-D) connector
> 2. Set it up - use xrandr or your favourite gui app
> (replace the VGA-1 with DVI-D-1 if appropriate)
> $ xrandr --output VGA-1 --auto
> 
> 3. Disable LVDS - use xrandr or your favourite gui app
> $ xrandr --output LVDS-1 --off 

Test done (with VGA, check xrandr attached), with same anomalies on external
monitor (see attachment). Just in case I attach also dmesg and Xorg.log when
booting with external monitor  connected.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1373708906.1Ace1.19058
Date: Sat, 13 Jul 2013 09:48:26 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=54700#c23">Comment # 23</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Distorted graphics (double cursor) with GeForce 4200Go (NV28)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=54700">bug 54700</a>
              from <span class="vcard"><a class="email" href="mailto:r.ductor&#64;gmail.com" title="r.ductor&#64;gmail.com">r.ductor&#64;gmail.com</a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=54700#c20">comment #20</a>)
<span class="quote">&gt; (In reply to <a href="show_bug.cgi?id=54700#c14">comment #14</a>)
&gt; &gt; (In reply to <a href="show_bug.cgi?id=54700#c12">comment #12</a>)
&gt; ...
&gt; &gt; &gt; * Wondering how much effect this has &quot;Unknown LVDS configuration bits&quot;
&gt; &gt; &gt; Does that issue occur on a non LVDS output - eg. when you have monitor
&gt; &gt; &gt; plugged to the VGA and LVDS is off ?
&gt; &gt; 
&gt; &gt; It's a laptop: how can I do that?
&gt; &gt; 
&gt; 1. Connect in a monitor/TV to the VGA(DVI-D) connector
&gt; 2. Set it up - use xrandr or your favourite gui app
&gt; (replace the VGA-1 with DVI-D-1 if appropriate)
&gt; $ xrandr --output VGA-1 --auto
&gt; 
&gt; 3. Disable LVDS - use xrandr or your favourite gui app
&gt; $ xrandr --output LVDS-1 --off </span >

Test done (with VGA, check xrandr attached), with same anomalies on external
monitor (see attachment). Just in case I attach also dmesg and Xorg.log when
booting with external monitor  connected.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1373708906.1Ace1.19058--

--===============1818135371==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1818135371==--
