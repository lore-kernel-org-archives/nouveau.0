From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 64746] optimus don't use nouveau card
Date: Fri, 30 Aug 2013 14:43:32 +0000
Message-ID: <bug-64746-8800-btq1wP3lfC@http.bugs.freedesktop.org/>
References: <bug-64746-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1884375766=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-64746-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1884375766==
Content-Type: multipart/alternative; boundary="1377873812.7Ae720.6474"; charset="us-ascii"


--1377873812.7Ae720.6474
Date: Fri, 30 Aug 2013 14:43:32 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=64746

--- Comment #12 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to comment #7)
> cat /sys/kernel/debug/vgaswitcheroo/switch 
> 0:DIS: :Pwr:0000:01:00.0
> 1:IGD:+:Pwr:0000:00:02.0
> 
> don't seem switched?
> 
> i tried
> echo DIS > /sys/kernel/debug/vgaswitcheroo/switch
> 
> but the screen get completly black...
> 
With "screen" I believe that you're talking about the laptop LVDS?

In that case it seems like the nv card is not wired to that output, thus you'll
need to do the following

* forget about vgaswitcheroo
* Follow the instructions on our wiki [1]



[1] http://nouveau.freedesktop.org/wiki/Optimus/

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1377873812.7Ae720.6474
Date: Fri, 30 Aug 2013 14:43:32 +0000
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
   title="NEW --- - optimus don't use nouveau card"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=64746#c12">Comment # 12</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - optimus don't use nouveau card"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=64746">bug 64746</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=64746#c7">comment #7</a>)
<span class="quote">&gt; cat /sys/kernel/debug/vgaswitcheroo/switch 
&gt; 0:DIS: :Pwr:0000:01:00.0
&gt; 1:IGD:+:Pwr:0000:00:02.0
&gt; 
&gt; don't seem switched?
&gt; 
&gt; i tried
&gt; echo DIS &gt; /sys/kernel/debug/vgaswitcheroo/switch
&gt; 
&gt; but the screen get completly black...
&gt; </span >
With &quot;screen&quot; I believe that you're talking about the laptop LVDS?

In that case it seems like the nv card is not wired to that output, thus you'll
need to do the following

* forget about vgaswitcheroo
* Follow the instructions on our wiki [1]



[1] <a href="http://nouveau.freedesktop.org/wiki/Optimus/">http://nouveau.freedesktop.org/wiki/Optimus/</a></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1377873812.7Ae720.6474--

--===============1884375766==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1884375766==--
