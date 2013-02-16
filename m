From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 60772] xf86-video-nouveau fails to modprobe nouveau:
 KMS not enabled
Date: Sat, 16 Feb 2013 18:14:15 +0000
Message-ID: <bug-60772-8800-MntOEN4n1M@http.bugs.freedesktop.org/>
References: <bug-60772-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1280155524=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-60772-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1280155524==
Content-Type: multipart/alternative; boundary="1361038455.8Eca1.4314"; charset="us-ascii"


--1361038455.8Eca1.4314
Date: Sat, 16 Feb 2013 18:14:15 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=60772

--- Comment #1 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 74945
  --> https://bugs.freedesktop.org/attachment.cgi?id=74945&action=edit
Fix

To be honest I am a little confused why your system does not load nouveau at an
earlier stage, rather than relying on X. Either case this is a valid point
which I did not consider while writing the original patch

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1361038455.8Eca1.4314
Date: Sat, 16 Feb 2013 18:14:15 +0000
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
   title="NEW --- - xf86-video-nouveau fails to modprobe nouveau: KMS not enabled"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=60772#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - xf86-video-nouveau fails to modprobe nouveau: KMS not enabled"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=60772">bug 60772</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=74945" name="attach_74945" title="Fix">attachment 74945</a> <a href="attachment.cgi?id=74945&amp;action=edit" title="Fix">[details]</a></span> <a href='page.cgi?id=splinter.html&amp;bug=60772&amp;attachment=74945'>[review]</a>
Fix

To be honest I am a little confused why your system does not load nouveau at an
earlier stage, rather than relying on X. Either case this is a valid point
which I did not consider while writing the original patch</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1361038455.8Eca1.4314--

--===============1280155524==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1280155524==--
