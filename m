From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 69349] Random image corruptions (in Debian Wheezy
 with Linux 3.2)
Date: Tue, 17 Sep 2013 02:10:00 +0000
Message-ID: <bug-69349-8800-Ayi1Q16ynr@http.bugs.freedesktop.org/>
References: <bug-69349-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1893851195=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-69349-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1893851195==
Content-Type: multipart/alternative; boundary="1379383800.EDC62.19365"; charset="us-ascii"


--1379383800.EDC62.19365
Date: Tue, 17 Sep 2013 02:10:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=69349

--- Comment #3 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to comment #2)
> 5. I am going to try Linux 3.10 from Debian Backports [1], though was not
> the Linux Nouveau module rewritten in Linux 3.7 [2], so that this is not
> going to point to the problem in Linux 3.2 (with DRM from 3.4.47 [3])?

Also make sure that you have an up-to-date xf86-video-nouveau, and mesa if
you're using some sort of opengl-based compositor. I don't think there's any
interest to maintain backports of fixes for nouveau (by the nouveau dev
community), so if you'd like to see it fixed in Debian, you'll need to talk to
Debian people.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1379383800.EDC62.19365
Date: Tue, 17 Sep 2013 02:10:00 +0000
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
   title="NEW --- - Random image corruptions (in Debian Wheezy with Linux 3.2)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69349#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Random image corruptions (in Debian Wheezy with Linux 3.2)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69349">bug 69349</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=69349#c2">comment #2</a>)
<span class="quote">&gt; 5. I am going to try Linux 3.10 from Debian Backports [1], though was not
&gt; the Linux Nouveau module rewritten in Linux 3.7 [2], so that this is not
&gt; going to point to the problem in Linux 3.2 (with DRM from 3.4.47 [3])?</span >

Also make sure that you have an up-to-date xf86-video-nouveau, and mesa if
you're using some sort of opengl-based compositor. I don't think there's any
interest to maintain backports of fixes for nouveau (by the nouveau dev
community), so if you'd like to see it fixed in Debian, you'll need to talk to
Debian people.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1379383800.EDC62.19365--

--===============1893851195==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1893851195==--
