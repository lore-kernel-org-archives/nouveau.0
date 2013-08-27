From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 50375] [NV1A] KMS/fbcon accel failing after
 scrolling/tty switch
Date: Tue, 27 Aug 2013 20:27:58 +0000
Message-ID: <bug-50375-8800-vd6OSgSHre@http.bugs.freedesktop.org/>
References: <bug-50375-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1552646028=="
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


--===============1552646028==
Content-Type: multipart/alternative; boundary="1377635277.503F1.27453"; charset="us-ascii"


--1377635277.503F1.27453
Date: Tue, 27 Aug 2013 20:27:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=50375

--- Comment #3 from Bruno <bonbons67-H4aWS73dXupiYsDpGMXq6A@public.gmane.org> ---
(In reply to comment #1)
> Do I assume correctly that this still happens with the latest kernel?

Impossible to tell with current kernels (3.8.2, 3.10.7, 3.11-rc6) as VGA output
is not being lit up properly by nouveau (monitor says "no signal").

See also bug #26534, comments 18 and 20.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1377635277.503F1.27453
Date: Tue, 27 Aug 2013 20:27:57 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=50375#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV1A] KMS/fbcon accel failing after scrolling/tty switch"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=50375">bug 50375</a>
              from <span class="vcard"><a class="email" href="mailto:bonbons67&#64;internet.lu" title="Bruno &lt;bonbons67&#64;internet.lu&gt;"> <span class="fn">Bruno</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=50375#c1">comment #1</a>)
<span class="quote">&gt; Do I assume correctly that this still happens with the latest kernel?</span >

Impossible to tell with current kernels (3.8.2, 3.10.7, 3.11-rc6) as VGA output
is not being lit up properly by nouveau (monitor says &quot;no signal&quot;).

See also <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - nouveau does not fetch edid from connected monitor on nforce1 (nv1a)"
   href="show_bug.cgi?id=26534">bug #26534</a>, comments 18 and 20.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1377635277.503F1.27453--

--===============1552646028==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1552646028==--
