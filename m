From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 57081] [NVA8] dell latitude laptop E6510 with
 nouveau and nvs3100 nvidia doesn't resume properly
Date: Wed, 04 Sep 2013 18:55:25 +0000
Message-ID: <bug-57081-8800-WHSGPQQsgR@http.bugs.freedesktop.org/>
References: <bug-57081-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0669644784=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-57081-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0669644784==
Content-Type: multipart/alternative; boundary="1378320925.6B2D2.5683"; charset="us-ascii"


--1378320925.6B2D2.5683
Date: Wed, 4 Sep 2013 18:55:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=57081

--- Comment #6 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to comment #5)
> Do you know wheter 3.11-rc7 contains fixes for my bug?!

No clue. What I do know is that a whole bunch of stuff _has_ been fixed since
3.2, which came out nearly two years ago. The driver has undergone substantial
changes since then. If you're stuck on whatever your distro provides, you
should file the issue with your distribution, and we can close this one
(although I suspect they'll just say "get the latest versions of everything and
complain to upstream" or perhaps "nouveau doesn't work on new hardware on
Ubuntu LTS"). At least one of the links I provided showed how to compile your
own kernels on Ubuntu. I believe the other one provides packages that let you
keep your LTS-based distro more up-to-date wrt hardware support.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1378320925.6B2D2.5683
Date: Wed, 4 Sep 2013 18:55:25 +0000
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
   title="NEW --- - [NVA8] dell latitude laptop E6510 with nouveau and nvs3100 nvidia doesn't resume properly"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=57081#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVA8] dell latitude laptop E6510 with nouveau and nvs3100 nvidia doesn't resume properly"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=57081">bug 57081</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=57081#c5">comment #5</a>)
<span class="quote">&gt; Do you know wheter 3.11-rc7 contains fixes for my bug?!</span >

No clue. What I do know is that a whole bunch of stuff _has_ been fixed since
3.2, which came out nearly two years ago. The driver has undergone substantial
changes since then. If you're stuck on whatever your distro provides, you
should file the issue with your distribution, and we can close this one
(although I suspect they'll just say &quot;get the latest versions of everything and
complain to upstream&quot; or perhaps &quot;nouveau doesn't work on new hardware on
Ubuntu LTS&quot;). At least one of the links I provided showed how to compile your
own kernels on Ubuntu. I believe the other one provides packages that let you
keep your LTS-based distro more up-to-date wrt hardware support.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1378320925.6B2D2.5683--

--===============0669644784==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0669644784==--
