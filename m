From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 69830] [NVC1] Kernel 3.11 and newer hang at X11
 start (bisected)
Date: Thu, 26 Sep 2013 22:33:02 +0000
Message-ID: <bug-69830-8800-2SK15krLe1@http.bugs.freedesktop.org/>
References: <bug-69830-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1047733301=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-69830-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1047733301==
Content-Type: multipart/alternative; boundary="1380234782.17d40.7285"; charset="us-ascii"


--1380234782.17d40.7285
Date: Thu, 26 Sep 2013 22:33:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=69830

--- Comment #4 from Alan Ott <alan-yzvJWuRpmD1zbRFIqnYvSA@public.gmane.org> ---
The behavior I saw was a bit different than bug 62093.

I saw 30f4e08 being bad (x11 hang) and 30f4e08^ as being a good boot. That may
just be different hardware. I can check and make sure I'm correct and got the
builds I expected.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1380234782.17d40.7285
Date: Thu, 26 Sep 2013 22:33:02 +0000
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
   title="RESOLVED DUPLICATE - [NVC1] Kernel 3.11 and newer hang at X11 start (bisected)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69830#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED DUPLICATE - [NVC1] Kernel 3.11 and newer hang at X11 start (bisected)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69830">bug 69830</a>
              from <span class="vcard"><a class="email" href="mailto:alan&#64;signal11.us" title="Alan Ott &lt;alan&#64;signal11.us&gt;"> <span class="fn">Alan Ott</span></a>
</span></b>
        <pre>The behavior I saw was a bit different than <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - VIEWING of preview in Print Dialog destroyed after resize."
   href="show_bug.cgi?id=62093">bug 62093</a>.

I saw 30f4e08 being bad (x11 hang) and 30f4e08^ as being a good boot. That may
just be different hardware. I can check and make sure I'm correct and got the
builds I expected.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1380234782.17d40.7285--

--===============1047733301==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1047733301==--
