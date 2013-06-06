From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 63135] [bisected] G69/nv50 DisplayPort dual-head
 fails to switch to KMS
Date: Thu, 06 Jun 2013 22:25:02 +0000
Message-ID: <bug-63135-8800-QugWa3VIZx@http.bugs.freedesktop.org/>
References: <bug-63135-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0736450749=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-63135-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0736450749==
Content-Type: multipart/alternative; boundary="1370557502.AcF31.5422"; charset="us-ascii"


--1370557502.AcF31.5422
Date: Thu, 6 Jun 2013 22:25:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=63135

--- Comment #17 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
[   11.902160] RIP: 0010:[<ffffffffa0570160>]  [<ffffffffa0570160>]
drm_fb_helper_hotplug_event+0x10/0x100 [drm_kms_helper]

That seems to imply that drm->fbcon->helper == NULL. But that's not what you're
seeing on recent kernels, so the implication is that there's some sort of
second concurrency bug in the rev you identified that got fixed later on.... I
don't think that your bisect results are valid as a result :(

Was the original problem 100% reproducible? If so, you should mark any kernel
that works sometimes as "good" (even if it's not really *that* good).

Also, the original problem is just monitors not working, but you can ssh
in/etc, right? Or does the system totally hang? (Doesn't seem that way given
that logs showed up in systemd...)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1370557502.AcF31.5422
Date: Thu, 6 Jun 2013 22:25:02 +0000
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
   title="NEW --- - [bisected] G69/nv50 DisplayPort dual-head fails to switch to KMS"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=63135#c17">Comment # 17</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [bisected] G69/nv50 DisplayPort dual-head fails to switch to KMS"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=63135">bug 63135</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>[   11.902160] RIP: 0010:[&lt;ffffffffa0570160&gt;]  [&lt;ffffffffa0570160&gt;]
drm_fb_helper_hotplug_event+0x10/0x100 [drm_kms_helper]

That seems to imply that drm-&gt;fbcon-&gt;helper == NULL. But that's not what you're
seeing on recent kernels, so the implication is that there's some sort of
second concurrency bug in the rev you identified that got fixed later on.... I
don't think that your bisect results are valid as a result :(

Was the original problem 100% reproducible? If so, you should mark any kernel
that works sometimes as &quot;good&quot; (even if it's not really *that* good).

Also, the original problem is just monitors not working, but you can ssh
in/etc, right? Or does the system totally hang? (Doesn't seem that way given
that logs showed up in systemd...)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1370557502.AcF31.5422--

--===============0736450749==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0736450749==--
