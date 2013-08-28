From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 50375] [NV1A] KMS/fbcon accel failing after
 scrolling/tty switch
Date: Wed, 28 Aug 2013 03:22:38 +0000
Message-ID: <bug-50375-8800-ftvYDrSQUD@http.bugs.freedesktop.org/>
References: <bug-50375-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0890306783=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-50375-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0890306783==
Content-Type: multipart/alternative; boundary="1377660158.aECaD1.3719"; charset="us-ascii"


--1377660158.aECaD1.3719
Date: Wed, 28 Aug 2013 03:22:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=50375

--- Comment #4 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Created attachment 84758
  --> https://bugs.freedesktop.org/attachment.cgi?id=84758&action=edit
patch to treat nv1a as pre-nv17

Generationally, NV1A is pre-NV17. However in a bunch of places in the nouveau
code, this wasn't recognized. I believe this patch should help, at least with
something. Mind trying it out? Should apply on top of a git-ish kernel (but
probably doesn't really matter).

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1377660158.aECaD1.3719
Date: Wed, 28 Aug 2013 03:22:38 +0000
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
   title="NEW --- - [NV1A] KMS/fbcon accel failing after scrolling/tty switch"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=50375#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV1A] KMS/fbcon accel failing after scrolling/tty switch"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=50375">bug 50375</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=84758" name="attach_84758" title="patch to treat nv1a as pre-nv17">attachment 84758</a> <a href="attachment.cgi?id=84758&amp;action=edit" title="patch to treat nv1a as pre-nv17">[details]</a></span> <a href='page.cgi?id=splinter.html&amp;bug=50375&amp;attachment=84758'>[review]</a>
patch to treat nv1a as pre-nv17

Generationally, NV1A is pre-NV17. However in a bunch of places in the nouveau
code, this wasn't recognized. I believe this patch should help, at least with
something. Mind trying it out? Should apply on top of a git-ish kernel (but
probably doesn't really matter).</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1377660158.aECaD1.3719--

--===============0890306783==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0890306783==--
