From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 66366] Laptop with Nvidia GPU is hot while using
 xserver-xorg-video-nouveau driver
Date: Sat, 31 Aug 2013 16:12:35 +0000
Message-ID: <bug-66366-8800-ze7aHKz4C6@http.bugs.freedesktop.org/>
References: <bug-66366-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0306582739=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-66366-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0306582739==
Content-Type: multipart/alternative; boundary="1377965555.A1dFd2.5115"; charset="us-ascii"


--1377965555.A1dFd2.5115
Date: Sat, 31 Aug 2013 16:12:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=66366

--- Comment #5 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to comment #3)
> Do you really understand that Nvidia-based 1500-3000$ laptop may be really
> killed by overheat with pretty non-binary / no-blob / GPL-friendly
> opensource driver? Are you kidding? :)

I really understand. But no amount of understanding will make it a good idea to
file bugs about it. [Also note that most CPU/GPU chips have overheat
protection.]

> OK, Ilia. Where do yo recommend to post such report about  "power management
> not supported" issues?

I would recommend sitting tight and waiting for this functionality to be
released. The Nouveau project's devs are well aware of the lack of power
management support. You can also come to #nouveau and see if some devs are
willing to share their reclocking scripts with you, although it's more than
likely that the answer will be "no" or that they won't work at all for you.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1377965555.A1dFd2.5115
Date: Sat, 31 Aug 2013 16:12:35 +0000
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
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED NOTABUG - Laptop with Nvidia GPU is hot while using xserver-xorg-video-nouveau driver"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=66366#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED NOTABUG - Laptop with Nvidia GPU is hot while using xserver-xorg-video-nouveau driver"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=66366">bug 66366</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=66366#c3">comment #3</a>)
<span class="quote">&gt; Do you really understand that Nvidia-based 1500-3000$ laptop may be really
&gt; killed by overheat with pretty non-binary / no-blob / GPL-friendly
&gt; opensource driver? Are you kidding? :)</span >

I really understand. But no amount of understanding will make it a good idea to
file bugs about it. [Also note that most CPU/GPU chips have overheat
protection.]

<span class="quote">&gt; OK, Ilia. Where do yo recommend to post such report about  &quot;power management
&gt; not supported&quot; issues?</span >

I would recommend sitting tight and waiting for this functionality to be
released. The Nouveau project's devs are well aware of the lack of power
management support. You can also come to #nouveau and see if some devs are
willing to share their reclocking scripts with you, although it's more than
likely that the answer will be &quot;no&quot; or that they won't work at all for you.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1377965555.A1dFd2.5115--

--===============0306582739==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0306582739==--
