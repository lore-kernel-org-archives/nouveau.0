From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 63101] [NV4B] NVIDIA GeForce 7300 GT AGP graphics
 card will not display any text characters on VIA Technologies Apollo
 MVP3-based mainboard
Date: Wed, 21 Aug 2013 05:13:29 +0000
Message-ID: <bug-63101-8800-JqBd2DEpLD@http.bugs.freedesktop.org/>
References: <bug-63101-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0375389121=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-63101-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0375389121==
Content-Type: multipart/alternative; boundary="1377062009.3E3c72.8846"; charset="us-ascii"


--1377062009.3E3c72.8846
Date: Wed, 21 Aug 2013 05:13:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=63101

--- Comment #7 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to comment #6)
> (In reply to Comment #5)
> 
> Hi,
> 
> Please note that FIC VA-503+ mainboard is for Socket 7 platform.
> I believe Linux kernel since 3.0 no longer support processors without CMOV
> instructions.

That's most definitely not the case. Linux did drop 386 support semi-recently,
but 486+ should work fine, which includes all AMD K5+ processors (and probably
their 486 clones as well). It could be that the ubuntu/whatever distro builds
have done this, but not Linux as a whole. If you build your own kernel as I had
recommended, you should be fine.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1377062009.3E3c72.8846
Date: Wed, 21 Aug 2013 05:13:29 +0000
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
          bz_status_NEEDINFO "
   title="NEEDINFO --- - [NV4B] NVIDIA GeForce 7300 GT AGP graphics card will not display any text characters on VIA Technologies Apollo MVP3-based mainboard"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=63101#c7">Comment # 7</a>
              on <a class="bz_bug_link 
          bz_status_NEEDINFO "
   title="NEEDINFO --- - [NV4B] NVIDIA GeForce 7300 GT AGP graphics card will not display any text characters on VIA Technologies Apollo MVP3-based mainboard"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=63101">bug 63101</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=63101#c6">comment #6</a>)
<span class="quote">&gt; (In reply to <a href="show_bug.cgi?id=63101#c5">Comment #5</a>)
&gt; 
&gt; Hi,
&gt; 
&gt; Please note that FIC VA-503+ mainboard is for Socket 7 platform.
&gt; I believe Linux kernel since 3.0 no longer support processors without CMOV
&gt; instructions.</span >

That's most definitely not the case. Linux did drop 386 support semi-recently,
but 486+ should work fine, which includes all AMD K5+ processors (and probably
their 486 clones as well). It could be that the ubuntu/whatever distro builds
have done this, but not Linux as a whole. If you build your own kernel as I had
recommended, you should be fine.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1377062009.3E3c72.8846--

--===============0375389121==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0375389121==--
