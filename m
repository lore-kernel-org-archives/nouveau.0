From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 60020] Resuming Dell Precision M70 crashes
Date: Thu, 31 Jan 2013 18:29:14 +0000
Message-ID: <bug-60020-8800-9iVfm5Z29a@http.bugs.freedesktop.org/>
References: <bug-60020-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1436144692=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-60020-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1436144692==
Content-Type: multipart/alternative; boundary="1359656954.2B0cA1.4236"; charset="us-ascii"


--1359656954.2B0cA1.4236
Date: Thu, 31 Jan 2013 18:29:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=60020

--- Comment #2 from Roy Bixler <rcbixler-0BtJm3PWb0s@public.gmane.org> ---
I just wanted to add some clarification about reproducing the bug.  I find that
resume crashes if nouveau is loaded early as the framebuffer.  In that case,
the trick of removing the nouveau driver after stopping the X server and before
invoking pm-suspend has no effect (i.e. resume still results in a hung system).
 What does make a difference is if I blacklist the nouveau driver so that the
initial framebuffer console only uses standard VGA mode. When the X server
starts, the module is loaded.  In this case, stopping the X server, removing
the nouveau module and invoking pm-suspend results in a system that resumes
more or less correctly.  In fact, on the first resume, the video is even
restored.  On subsequent resumes, the video is not restored, but it is possible
to get it back by starting the X server.  Going back to the console using
Control-Alt-Fn also works.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1359656954.2B0cA1.4236
Date: Thu, 31 Jan 2013 18:29:14 +0000
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
   title="NEW --- - Resuming Dell Precision M70 crashes"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=60020#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Resuming Dell Precision M70 crashes"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=60020">bug 60020</a>
              from <span class="vcard"><a class="email" href="mailto:rcbixler&#64;nyx.net" title="Roy Bixler &lt;rcbixler&#64;nyx.net&gt;"> <span class="fn">Roy Bixler</span></a>
</span></b>
        <pre>I just wanted to add some clarification about reproducing the bug.  I find that
resume crashes if nouveau is loaded early as the framebuffer.  In that case,
the trick of removing the nouveau driver after stopping the X server and before
invoking pm-suspend has no effect (i.e. resume still results in a hung system).
 What does make a difference is if I blacklist the nouveau driver so that the
initial framebuffer console only uses standard VGA mode. When the X server
starts, the module is loaded.  In this case, stopping the X server, removing
the nouveau module and invoking pm-suspend results in a system that resumes
more or less correctly.  In fact, on the first resume, the video is even
restored.  On subsequent resumes, the video is not restored, but it is possible
to get it back by starting the X server.  Going back to the console using
Control-Alt-Fn also works.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1359656954.2B0cA1.4236--

--===============1436144692==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1436144692==--
