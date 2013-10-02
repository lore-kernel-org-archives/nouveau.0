From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 64858] [BISECTED] Nouveau sees invalid EDID for
 eDP-1 whenever that display is turned off
Date: Wed, 02 Oct 2013 07:28:27 +0000
Message-ID: <bug-64858-8800-k6ovnbDur6@http.bugs.freedesktop.org/>
References: <bug-64858-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1831802959=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-64858-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1831802959==
Content-Type: multipart/alternative; boundary="1380698907.4cedC013.3551"; charset="us-ascii"


--1380698907.4cedC013.3551
Date: Wed, 2 Oct 2013 07:28:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=64858

--- Comment #11 from gspr <gspreemann-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Disregard my comment 7 about not needing poll=0 for older, working kernels. I
just realized that I had it set as a modprobe option, so it was still in effect
when I tested without it as a boot option. I've checked again, and in reference
to Vetter's comment 6: I *do* need poll=0 also for older kernels that did not
need the patch.

I'm very sorry for the misinformation.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1380698907.4cedC013.3551
Date: Wed, 2 Oct 2013 07:28:27 +0000
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
   title="NEEDINFO --- - [BISECTED] Nouveau sees invalid EDID for eDP-1 whenever that display is turned off"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=64858#c11">Comment # 11</a>
              on <a class="bz_bug_link 
          bz_status_NEEDINFO "
   title="NEEDINFO --- - [BISECTED] Nouveau sees invalid EDID for eDP-1 whenever that display is turned off"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=64858">bug 64858</a>
              from <span class="vcard"><a class="email" href="mailto:gspreemann&#64;gmail.com" title="gspr &lt;gspreemann&#64;gmail.com&gt;"> <span class="fn">gspr</span></a>
</span></b>
        <pre>Disregard my <a href="show_bug.cgi?id=64858#c7">comment 7</a> about not needing poll=0 for older, working kernels. I
just realized that I had it set as a modprobe option, so it was still in effect
when I tested without it as a boot option. I've checked again, and in reference
to Vetter's <a href="show_bug.cgi?id=64858#c6">comment 6</a>: I *do* need poll=0 also for older kernels that did not
need the patch.

I'm very sorry for the misinformation.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1380698907.4cedC013.3551--

--===============1831802959==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1831802959==--
