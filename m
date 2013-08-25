From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 47288] System hangs with GeForce 6150SE nForce 430
 ("EQ overflowing")
Date: Sun, 25 Aug 2013 06:27:01 +0000
Message-ID: <bug-47288-8800-RiTvXhx8wI@http.bugs.freedesktop.org/>
References: <bug-47288-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2146231379=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-47288-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2146231379==
Content-Type: multipart/alternative; boundary="1377412021.ecB2D2.17101"; charset="us-ascii"


--1377412021.ecB2D2.17101
Date: Sun, 25 Aug 2013 06:27:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=47288

--- Comment #12 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
This basically means that your card has hung. The EQ overflowing thing is just
X noticing that its event queue is filling up because the DDX is stuck. The
kernel messages indicate various validation/space/vram errors. Does this still
happen on the latest kernels? If so, could you provide an updated log that
includes the part that happens when the hang happens?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1377412021.ecB2D2.17101
Date: Sun, 25 Aug 2013 06:27:01 +0000
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
   title="NEW --- - System hangs with GeForce 6150SE nForce 430 (&quot;EQ overflowing&quot;)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=47288#c12">Comment # 12</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - System hangs with GeForce 6150SE nForce 430 (&quot;EQ overflowing&quot;)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=47288">bug 47288</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>This basically means that your card has hung. The EQ overflowing thing is just
X noticing that its event queue is filling up because the DDX is stuck. The
kernel messages indicate various validation/space/vram errors. Does this still
happen on the latest kernels? If so, could you provide an updated log that
includes the part that happens when the hang happens?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1377412021.ecB2D2.17101--

--===============2146231379==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2146231379==--
